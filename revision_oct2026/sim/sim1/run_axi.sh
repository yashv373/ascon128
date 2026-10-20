#!/bin/bash
# usage: run_axi.sh <vecprefix> ADLEN PTLEN [flags: MIN DEC FLIP]  (axi_ascon only, RTL ro-mounted)
cd "$(dirname "$0")"; W=$(cygpath -w "$PWD"); R=$(cygpath -w "$PWD/../../rtl"); P=$1; A=$2; L=$3; shift 3; FL=""; for f in "$@"; do FL="$FL +$f"; done
MSYS_NO_PATHCONV=1 docker run --rm -v "$R":/rtl:ro -v "$W":/sim hpretl/iic-osic-tools:chipathon26 --skip bash -c \
 "cd /sim && iverilog -g2012 -o axi.vvp tb_axi.v /rtl/axi_ascon.v /rtl/ascon_core_adpt_encdec.v /rtl/ascon_round_s1.v /rtl/ascon_round_s2.v && vvp axi.vvp +P=$P +ADLEN=$A +PTLEN=$L $FL" 2>&1 | grep -v INFO
