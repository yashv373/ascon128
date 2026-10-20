#!/bin/bash
# usage: run_gls.sh ADLEN PTLEN [sdf|nosdf] [vcd]   ; post-PnR netlist GLS, nom_tt SDF optional
cd "$(dirname "$0")"; W=$(cygpath -w "$PWD"); A=$(cygpath -w "$PWD/../..")
a=$1; p=$2; sdf=$3; vcd=$4; F=/foss/designs/ascon_final/runs/ascon_final/final; L=/foss/pdks/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/verilog
DEF=""; [ "$sdf" = sdf ] && DEF="$DEF -DSDFFILE=\\\"$F/sdf/nom_tt_025C_3v30/spi_slave__nom_tt_025C_3v30.sdf\\\""
ARGS="+ADLEN=$a +PTLEN=$p $EXTRA"; [ "$vcd" = vcd ] && ARGS="$ARGS +VCD"
python gen_case.py $a $p
MSYS_NO_PATHCONV=1 docker run --rm -v "$A":/foss/designs/ascon_final:ro -v "$W":/sim hpretl/iic-osic-tools:chipathon26 --skip bash -c \
 "cd /sim && iverilog -g2012 -gspecify -ginterconnect -Ttyp $DEF -o gls_${sdf}${TAG}.vvp tb_spi.v $L/primitives.v $L/gf180mcu_fd_sc_mcu7t5v0.v /sim/spi_slave.pnl_nopwr.v && time vvp gls_${sdf}${TAG}.vvp $ARGS"
