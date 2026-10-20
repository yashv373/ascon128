#!/bin/bash
# post-PnR gated GLS (func + VCD enc/idle), then OpenSTA TT power for gated and ungated (enc/idle/vectorless)
cd /c/Users/Asus/eda/designs/ascon_final/ascon_claude/cg/gls
( bash gls_case.sh power/gated_nopwr.v pnr_enc 16 64 vcd & bash gls_case.sh power/gated_nopwr.v pnr_idle 0 0 idle & bash gls_case.sh power/gated_nopwr.v pnr_00 0 0 & bash gls_case.sh power/gated_nopwr.v pnr_32_32 32 32 & bash gls_case.sh power/gated_nopwr.v pnr_16_16 16 16 & wait )
cd ../power; AC=$(cygpath -w /c/Users/Asus/eda/designs/ascon_final/ascon_claude)
sta() { # name FIN VCD SCOPE
  MSYS_NO_PATHCONV=1 docker run --rm -v "$AC":/ac:ro hpretl/iic-osic-tools:chipathon26 --skip bash -c "cd /ac/cg/power && FIN=$2 VCD=$3 SCOPE=$4 sta -no_splash -exit sta_power.tcl" > sta_$1.log 2>&1; }
G=/ac/cg/pd_4/runs/r4/final; U=/ac/pd_closure/iter_8/runs/r8/final
sta g_vl $G none x; sta u_vl $U none x
sta g_idle $G /ac/cg/gls/run_pnr_idle/spi_idle.vcd tb_spi/dut; sta u_idle $U /ac/cg/gls/run_ung_idle/spi_idle.vcd tb_spi/dut
sta g_enc $G /ac/cg/gls/run_pnr_enc/spi_enc.vcd tb_spi/dut; sta u_enc $U /ac/cg/gls/run_ung_enc/spi_enc.vcd tb_spi/dut
echo done > post.done
