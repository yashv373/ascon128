#!/bin/bash
# runs core-level sims in docker (iverilog). RTL mounted read-only.
cd "$(dirname "$0")"; W=$(cygpath -w "$PWD"); R=$(cygpath -w "$PWD/../pd_closure/base/rtl")
for c in "$@"; do a=${c%,*}; p=${c#*,}
  python gen_case.py $a $p
  MSYS_NO_PATHCONV=1 docker run --rm -v "$R":/rtl:ro -v "$W":/sim hpretl/iic-osic-tools:chipathon26 --skip bash -c \
   "cd /sim && iverilog -g2012 -o core_${a}_${p}.vvp tb_core.v /rtl/ascon_core_adpt_encdec.v /rtl/ascon_round_s1.v /rtl/ascon_round_s2.v && vvp core_${a}_${p}.vvp +ADLEN=$a +PTLEN=$p"
done
