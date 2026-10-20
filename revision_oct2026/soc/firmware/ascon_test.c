// SoC integration firmware for the ASCON AXI4-Lite IP (axi_ascon.v). rv32i, no libc.
#include "firmware.h"
#include "vectors.h"

typedef uint32_t u32; typedef uint8_t u8;
#define ASC       0x40000000u
#define CON_ACCRST (*(volatile u32 *)0x50000008u)
#define CON_PERF  (*(volatile u32 *)0x5000000Cu)
#define CON_EXIT  (*(volatile u32 *)0x50000004u)
static void fail_exit(void) { CON_EXIT = 1; for (;;) ; }
#define UNMAPPED  (*(volatile u32 *)0x60000000u)
/* axi_ascon register offsets */
enum { KEY = 0x00, NONCE = 0x10, CTRL = 0x20, STATUS = 0x24, BLK = 0x28, DIN = 0x30, DOUT = 0x40, TAG = 0x50 };
enum { ST_BUSY = 1, ST_DONE = 2, ST_AUTH = 4, ST_INRDY = 8, ST_DOUTRDY = 16 };

static inline void wr(u32 o, u32 v) { *(volatile u32 *)(ASC + o) = v; }
static inline u32 rd(u32 o) { return *(volatile u32 *)(ASC + o); }
static inline u32 rdcycle(void) { u32 c; __asm__ volatile("csrr %0, cycle" : "=r"(c)); return c; }

void *memcpy(void *d, const void *s, unsigned n) { u8 *a = d; const u8 *b = s; while (n--) *a++ = *b++; return d; }
void *memset(void *d, int c, unsigned n) { u8 *a = d; while (n--) *a++ = (u8)c; return d; }

static int npass, nfail;
static void result(int ok, const char *id, const char *what) {
    if (ok) npass++; else nfail++;
    print_str(ok ? "PASS " : "FAIL "); print_str(id); print_chr(' '); print_str(what); print_chr('\n');
}
static int memeq(const u8 *a, const u8 *b, u32 n) { while (n--) if (*a++ != *b++) return 0; return 1; }
static u32 ld32(const u8 *p) { return p[0] | (u32)p[1] << 8 | (u32)p[2] << 16 | (u32)p[3] << 24; }
static void st32(u8 *p, u32 v) { p[0] = v; p[1] = v >> 8; p[2] = v >> 16; p[3] = v >> 24; }

/* bounded poll of a STATUS bit: returns 0 on timeout (never hangs) */
static int poll(u32 mask) { for (u32 i = 0; i < 300000; i++) if (rd(STATUS) & mask) return 1; return 0; }

static const u8 KEY_B[16] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
static const u8 NON_B[16] = {16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31};

static void load_kn(void) { for (int i = 0; i < 4; i++) { wr(KEY + 4 * i, ld32(KEY_B + 4 * i)); wr(NONCE + 4 * i, ld32(NON_B + 4 * i)); } }
static void start(int dec_, int adempty) { wr(CTRL, (adempty << 2) | (dec_ << 1)); wr(CTRL, (adempty << 2) | (dec_ << 1) | 1); }
static int push(int sel, int last, u32 nb, const u8 *d) {
    u8 b[16]; memset(b, 0, 16); memcpy(b, d, nb);
    if (!poll(ST_INRDY)) return -1;
    wr(BLK, sel | (last << 1) | (nb << 2));
    for (int i = 0; i < 4; i++) wr(DIN + 4 * i, ld32(b + 4 * i));   /* DIN3 write pushes the block */
    return 0;
}
static int getout(u8 *o, u32 nb) {
    u8 b[16];
    if (!poll(ST_DOUTRDY)) return -1;
    for (int i = 0; i < 4; i++) st32(b + 4 * i, rd(DOUT + 4 * i));  /* DOUT3 read drains */
    memcpy(o, b, nb); return 0;
}
/* full AEAD op. dec: tag_in[16] is the expected tag, out=plaintext. enc: tag_out receives the tag. returns 0 / -1 timeout */
static int aead(int dec_, const u8 *ad, u32 adlen, const u8 *in, u32 len, u8 *out, u8 *tag, u32 *auth) {
    load_kn();
    if (dec_) for (int i = 0; i < 4; i++) wr(TAG + 4 * i, ld32(tag + 4 * i));
    start(dec_, adlen == 0);
    if (adlen) {
        u32 n = adlen >> 4, r = adlen & 15;
        for (u32 b = 0; b < n; b++) if (push(0, 0, 16, ad + 16 * b)) return -1;
        if (push(0, 1, r, ad + 16 * n)) return -1;
    }
    u32 n = len >> 4, r = len & 15;
    for (u32 b = 0; b < n; b++) { if (push(1, 0, 16, in + 16 * b)) return -1; if (getout(out + 16 * b, 16)) return -1; }
    if (push(1, 1, r, in + 16 * n)) return -1;
    if (r && getout(out + 16 * n, r)) return -1;
    if (!poll(ST_DONE)) return -1;
    *auth = (rd(STATUS) & ST_AUTH) != 0;
    if (!dec_) for (int i = 0; i < 4; i++) st32(tag + 4 * i, rd(TAG + 4 * i));
    return 0;
}

static u8 obuf[1040], tbuf[16];
static const char *ID[] = {"T2.0", "T2.1", "T2.2", "T2.3", "T2.4", "T2.5", "T2.6"};
static const char *ID3[] = {"T3.0", "T3.1", "T3.2", "T3.3", "T3.4", "T3.5", "T3.6"};
static const char *ID4[] = {"T4.0", "T4.1", "T4.2", "T4.3", "T4.4", "T4.5", "T4.6"};

static int enc_ok(const vec_t *v) {   /* encrypt and compare CT||TAG */
    u32 au;
    if (aead(0, v->ad, v->adlen, v->pt, v->ptlen, obuf, tbuf, &au)) return 0;
    return memeq(obuf, v->ct, v->ptlen) && memeq(tbuf, v->ct + v->ptlen, 16);
}
static int dec_ok(const vec_t *v, int forge, u32 *auth) {   /* returns 1 if outcome matches expectation */
    memcpy(tbuf, v->ct + v->ptlen, 16);
    if (forge == 1) tbuf[0] ^= 1; else if (forge == 2) tbuf[15] ^= 0x80;
    *auth = 99;
    if (aead(1, v->ad, v->adlen, v->ct, v->ptlen, obuf, tbuf, auth)) return 0;
    if (forge) return *auth == 0;
    return *auth == 1 && memeq(obuf, v->pt, v->ptlen);
}

void ascon_test(void) {
    print_str("ASCON SoC firmware start\n");
    /* ---- T0: presence probe (graceful failure when the slot is the stub) ---- */
    u32 s = rd(STATUS);
    if (s != ST_INRDY) {
        print_str("FAIL T0 ASCON probe: STATUS="); print_hex(s, 8); print_str(" expected 0x00000008 -> accelerator missing/unresponsive, skipping IP tests\n");
        print_str("SUMMARY pass=0 fail=1\n");
        fail_exit();
    }
    print_str("PASS T0 ASCON probe STATUS=0x00000008\n"); npass++;

    /* ---- T1: register sanity / reset values ---- */
    int ok = 1;
    for (int i = 0; i < 4; i++) ok &= rd(DOUT + 4 * i) == 0 && rd(TAG + 4 * i) == 0;
    result(ok, "T1.1", "reset values: DOUT0-3 = TAG0-3 = 0");
    ok = (rd(STATUS) == ST_INRDY) && rd(CTRL) == 0 && rd(BLK) == 0 && rd(0x2C) == 0;
    result(ok, "T1.2", "reset values: STATUS=0x08 (in_ready only), CTRL/BLK/gap@0x2C read 0");
    for (int i = 0; i < 4; i++) { wr(KEY + 4 * i, 0xA5A50000u + i); wr(NONCE + 4 * i, 0x5A5A0000u + i); wr(TAG + 4 * i, 0xC3C30000u + i); }
    ok = 1;
    for (int i = 0; i < 4; i++) ok &= rd(KEY + 4 * i) == 0 && rd(NONCE + 4 * i) == 0;
    for (int i = 0; i < 4; i++) ok &= rd(TAG + 4 * i) == 0;   /* TAG reads return the *computed* tag, not the written one */
    result(ok, "T1.3", "KEY/NONCE are write-only (read 0); TAG write does not alias TAG read");
    wr(0x60, 0xdeadbeef); wr(0x7C, 1);
    ok = rd(0x60) == 0 && rd(0x7C) == 0 && rd(STATUS) == ST_INRDY;
    result(ok, "T1.4", "writes/reads above 0x5C are harmless (read 0, no state change)");
    u32 u = UNMAPPED;   /* interconnect DECERR path: must complete, not hang */
    result(u == 0, "T1.5", "unmapped address 0x60000000 completes (interconnect DECERR), reads 0");

    /* ---- T2: encrypt KATs ---- */
    int nv = NVEC;
    for (int i = 0; i < nv - 1; i++) result(enc_ok(&VECS[i]), ID[i], VECS[i].name);
    /* 1 KiB with timing (marker -> $realtime in the testbench) */
    CON_PERF = 0;
    u32 c0 = rdcycle();
    int e = enc_ok(&VECS[IDX_1KB]);
    u32 c1 = rdcycle();
    CON_PERF = 1024;
    result(e, ID[IDX_1KB], VECS[IDX_1KB].name);
    print_str("PERF cpu_cycles_per_1KB_msg(ad=32,pt=1024)="); print_dec(c1 - c0); print_str(" cycles\n");

    /* ---- T3: decrypt, good tag -> auth ok ---- */
    u32 au;
    int idx3[] = {1, 3, 4, IDX_1KB};
    for (int k = 0; k < 4; k++) { int i = idx3[k]; result(dec_ok(&VECS[i], 0, &au), ID3[i], VECS[i].name); }

    /* ---- T4: forged tag -> auth fail flag ---- */
    int idx4[] = {0, 3, 4};
    for (int k = 0; k < 3; k++) {
        int i = idx4[k]; ok = dec_ok(&VECS[i], 1 + (k & 1), &au);
        print_str(ok ? "PASS " : "FAIL "); print_str(ID4[i]); print_str(" forged tag (bit flip) auth_ok="); print_dec(au); print_str(" "); print_str(VECS[i].name); print_chr('\n');
        if (ok) npass++; else nfail++;
    }

    /* ---- T5: back-to-back messages without reset (incl. good op right after a forged one) ---- */
    ok = enc_ok(&VECS[3]);
    ok &= enc_ok(&VECS[4]);
    ok &= dec_ok(&VECS[4], 1, &au);       /* forged -> fail ... */
    ok &= dec_ok(&VECS[3], 0, &au);       /* ... then a clean decrypt must pass (no stale auth/done state) */
    ok &= enc_ok(&VECS[0]);
    ok &= enc_ok(&VECS[5]);
    result(ok, "T5", "6 back-to-back ops (enc,enc,dec-forged,dec,enc,enc) without reset");

    /* ---- T6: soft reset mid-operation, then a correct operation ---- */
    load_kn(); start(0, 0);
    int pushed = push(0, 0, 16, VECS[3].ad) == 0;      /* AD block in flight */
    u32 sb = rd(STATUS);
    print_str("T6 pre-reset STATUS="); print_hex(sb, 8); print_str("\n");
    CON_ACCRST = 1;                                    /* SoC-level reset pulse to the slot (IP has no soft-reset reg) */
    for (int i = 0; i < 30; i++) __asm__ volatile("nop");
    u32 sa = rd(STATUS);
    print_str("T6 post-reset STATUS="); print_hex(sa, 8); print_str("\n");
    result(pushed && (sb & ST_BUSY) && sa == ST_INRDY, "T6.1", "reset while busy -> STATUS back to idle (0x08)");
    result(enc_ok(&VECS[3]) && enc_ok(&VECS[IDX_1KB - 1]), "T6.2", "correct enc KATs after soft reset");
    result(dec_ok(&VECS[3], 0, &au), "T6.3", "correct dec (auth ok) after soft reset");

    print_str("SUMMARY pass="); print_dec(npass); print_str(" fail="); print_dec(nfail); print_chr('\n');
    print_str(nfail ? "SOME TESTS FAILED\n" : "ALL TESTS PASSED\n");
    if (nfail) fail_exit();   /* pass: return to start.S, which prints DONE and writes 123456789 to EXIT */
}
