# Revision Oct 2026

Selected results added after the original submission. Nothing outside this folder is modified.

## Contents
- `pd/closure`: 20 MHz signed-off LibreLane config + SDC (`best/`, plus `best/iter4_clockgroups`), iterations 1-10 (config, SDC, `summary.txt`, `resolved.json`), `ITERATIONS.md`, driver scripts.
- `pd/push`: 22 MHz (`best/config.yaml`) and 23 MHz (`best/config_23mhz.yaml`, `summary_23mhz.txt`) configs, iterations 1-6, `ITERATIONS.md`, scripts.
- `pd/cg`: clock-gating synthesis script (`synth/pyosys`), PD attempts 1-7, scripts. **Not clean** (see `pd/cg/NOTE.md`); a record only.
- `sim`: testbenches, run scripts, KAT check scripts, STA/power TCL, logs with the cited result lines (`sim1` = KAT/GLS/power, `sim2`, `sim3` = throughput).
- `soc`: PicoRV32 + AXI-Lite + ASCON accelerator SoC (RTL, testbench, firmware, IP-XACT incl. `axi_ascon`), `PROVENANCE.md`, `fetch_third_party.sh`.
- Left out: paper/notes, runs/ directories, netlists, GDS/DEF/ODB/SPEF/VCD, PDK, Docker files, generated `.hex/.vvp/.elf/.o`.

## Reproduce
Image: `hpretl/iic-osic-tools:chipathon26`, always started with `--skip` (no UI). The scripts use Git Bash on Windows (`cygpath`) and contain the author's local absolute paths; edit the path variables at the top first.
```
# PD (LibreLane, in the container): pd/push/run_iter.sh N   (config from cfg.tmpl/sdc.tmpl; RTL hash-checked against rtl.sha256)
# sim (iverilog in the container), needs the RTL and ascon-c KAT:
bash sim/sim3/run_core.sh 32,1024 32,4000      # args adlen,ptlen
bash sim/sim3/run_axi.sh ...; bash sim/sim3/run_spi_rtl.sh ...
bash sim/sim1/run_kat_all.sh                   # 1089 KAT vectors
# SoC:
bash soc/fetch_third_party.sh && bash soc/run.sh   # runs `make` in the container
```
Scripts expect the RTL at `../../rtl` (sim) and `../pd_closure/base/rtl` (soc Makefile `IP=`); point them at `chip_top_integration/src_cryptoaccel/`.

ascon-c (not vendored): `git clone https://github.com/ascon/ascon-c`. The copy used was a `main` archive downloaded in Oct 2026; **no commit hash was recorded**. The KAT file `crypto_aead/asconaead128/LWC_AEAD_KAT_128_128.txt` is included in `sim/*/kat/` (sha256 `bbbc3469...bd33`), so the KAT runs do not need the clone; `ref_gen.c` builds against it.

## Headline results
| claim | source |
|---|---|
| 23 MHz (43.48 ns): setup WS ss +0.275 / tt +21.74 / ff +30.76 ns; hold WS >= +0.216 ns; DRC, LVS, antenna, cap and fanout violations 0. Caveat: 1872 max-slew violations at the SS corner (worst below the liberty 15.6 ns table limit) | `pd/push/best/summary_23mhz.txt`, `pd/push/ITERATIONS.md` iter 4 |
| 1089/1089 asconaead128 KAT vectors pass through the unmodified core (golden-model check: 0 mismatches) | `sim/sim1/kat_all.log`, `sim/sim1/kat_check.log` |
| Simulator-printed throughput (plaintext only, RTL, tb clock period 43.48 ns): core 149.77 Mbps (1024 B) / 159.79 Mbps (4000 B), AXI 50.99 Mbps, SPI 0.19 Mbps (adlen 16, ptlen 64) | `THROUGHPUT` lines in `sim/sim3/{core,axi,spi}_tp.log` |
| SoC firmware: 24/24 PASS lines, `ALL TESTS PASSED`, `SOC_EXIT ... (PASS)`, 0 non-OKAY slot responses | `soc/logs/soc_ascon.log` |

Notes: the testbench comments in `sim3` say "20 MHz" but the generated clock is `#21.74` half-period = 43.48 ns (23 MHz). `soc/logs/soc_stub.log` is the negative control (accelerator replaced by a DECERR stub) and FAILs by design. 20 MHz signoff: `pd/closure/ITERATIONS.md` iter 4/8.

## RTL unchanged
Same RTL as the original submission (line endings aside: the repo checkout is CRLF, these hashes are of LF files). `pd/*/rtl.sha256`:
```
9d149ce8457f54f373532b5b6954b66707baa2c66cbbfd86bf1957b0f2f39b09  ascon_core_adpt_encdec.v
dd0720ed818bfb2e16bc54124a44434460a25eb3255044419e7535586d5bb72b  ascon_round_s1.v
5044a149d82edc37924e9692db42adfb3a7c6479b53fe246ebb7de7779b3fc00  ascon_round_s2.v
d88971ef09a12b1813b99c3592569ca8e60e53a20fed14553a8e9d917acc6b96  axi_ascon.v
f7022e60acbe7f1467ffed4e16cd83bcf6be717aa444521cd98f3e43f3dd8235  axi_master.v
7fa0488afc083805002aeb7f36324609d423ab77adb6513838084b0969bd830a  reset_sync.v
3a22c85c0966572846f92101156a078e48c92841346c775fa92c8dae583e7142  spi_slave.v
```

## Third-party licenses
- YosysHQ/picorv32 @ ef203c2: ISC. Firmware files derived from it (`soc/firmware`) keep that license.
- alexforencich/verilog-axi @ 516bd5d: MIT.
- ascon/ascon-c (KAT file, reference): CC0 1.0.
- Cloned by `soc/fetch_third_party.sh`, not stored here.
