#!/bin/bash
# all 1089 official KAT vectors through the unmodified RTL core (iverilog in docker); exp taken from the KAT file
cd "$(dirname "$0")"; W=$(cygpath -w "$PWD"); R=$(cygpath -w "$PWD/../../rtl")
MSYS_NO_PATHCONV=1 docker run --rm -v "$R":/rtl:ro -v "$W":/sim hpretl/iic-osic-tools:chipathon26 --skip bash -c '
cd /sim && mkdir -p /tmp/k && cp kat_vec.py tb_core.v /tmp/k/ && ln -sf /sim/kat /tmp/k/kat && cd /tmp/k &&
iverilog -g2012 -o c.vvp tb_core.v /rtl/ascon_core_adpt_encdec.v /rtl/ascon_round_s1.v /rtl/ascon_round_s2.v &&
for n in $(seq 1 1089); do L=$(python3 kat_vec.py $n); vvp c.vvp +ADLEN=${L% *} +PTLEN=${L#* } | grep RESULT; done' > kat_all.log 2>&1
grep -c "PASS" kat_all.log; grep -c "FAIL" kat_all.log
