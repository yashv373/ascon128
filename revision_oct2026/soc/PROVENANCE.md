# PROVENANCE

Pinned upstream clones (untouched, `git status` clean, LF checkout) live in `third_party/`:
- `third_party/picorv32` = https://github.com/YosysHQ/picorv32 @ ef203c2b0a3fb793280f5114941416c425c5b461 (verbatim; `picorv32.v` used as-is, module `picorv32_axi`)
- `third_party/verilog-axi` = https://github.com/alexforencich/verilog-axi @ 516bd5dadc3365b7f9e225d2af8fe0b8d804fe53 (verbatim; used `rtl/axil_interconnect.v`, `axil_ram.v`, `arbiter.v`, `priority_encoder.v`)
- ASCON RTL: `../pd_closure/base/rtl/{axi_ascon,ascon_core_adpt_encdec,ascon_round_s1,ascon_round_s2}.v` verbatim (not copied, referenced by the Makefile).

## Files in soc/ derived from upstream
| file | upstream | status |
|---|---|---|
| firmware/custom_ops.S, irq.c, makehex.py, sections.lds | picorv32 ef203c2 firmware/<same> | verbatim |
| firmware/firmware.h | picorv32 firmware/firmware.h | 3-line diff (below) |
| firmware/print.c | picorv32 firmware/print.c | 1-line diff: console address (below) |
| firmware/start.S | picorv32 firmware/start.S | small diff: ENABLE_ASCON branch, console/exit address (below) |
| Makefile | picorv32 Makefile (firmware.* rules, iverilog flow) | adapted: toolchain prefix, sources, 2 sim targets (own file, same structure) |
| tb/tb_soc.v | picorv32 testbench.v pattern (irq[4]/irq[5] wake-up, $readmemh of firmware.hex, trap/timeout handling) | own small file; `axi4_memory` replaced by verilog-axi RAM+interconnect |

## Own code (no upstream)
rtl/soc_core.v, rtl/soc_top.v (glue: picorv32_axi -> axil_interconnect -> {axil_ram, accelerator slot, sim_ctrl}); rtl/sim_ctrl.v (console/exit/perf/IP-reset);
rtl/axil_stub.v (DECERR placeholder); firmware/ascon_test.c + firmware/gen_vectors.py (the added test, vectors from ascon-c KAT / ref_gen); ipxact/gen_ipxact.py; run.sh.

## Diffs vs upstream (diff -u)

### firmware/start.S
```diff
@@ -376,6 +376,16 @@
 	addi x30, zero, 0
 	addi x31, zero, 0
 
+#ifdef ENABLE_ASCON
+	/* set stack pointer */
+	lui sp,(128*1024)>>12
+
+	/* call ASCON SoC integration tests, then skip the other demos */
+	jal ra,ascon_test
+	j ascon_done
+#endif
+
+#ifndef ENABLE_ASCON
 #ifdef ENABLE_HELLO
 	/* set stack pointer */
 	lui sp,(128*1024)>>12
@@ -477,8 +487,10 @@
 	jal ra,stats
 #endif
 
+#endif /* !ENABLE_ASCON */
+ascon_done:
 	/* print "DONE\n" */
-	lui a0,0x10000000>>12
+	lui a0,0x50000000>>12
 	addi a1,zero,'D'
 	addi a2,zero,'O'
 	addi a3,zero,'N'
@@ -490,7 +502,7 @@
 	sw a4,0(a0)
 	sw a5,0(a0)
 
-	li a0, 0x20000000
+	li a0, 0x50000004
 	li a1, 123456789
 	sw a1,0(a0)
 
```

### firmware/print.c
```diff
@@ -7,7 +7,7 @@
 
 #include "firmware.h"
 
-#define OUTPORT 0x10000000
+#define OUTPORT 0x50000000
 
 void print_chr(char ch)
 {
```

### firmware/firmware.h
```diff
@@ -23,6 +23,9 @@
 // hello.c
 void hello(void);
 
+// ascon_test.c
+void ascon_test(void);
+
 // sieve.c
 void sieve(void);
 
```
