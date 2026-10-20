#!/bin/bash
# usage: run_synth.sh TAG [CG_MIN_WIDTH]  -> cg/synth/out_TAG/spi_slave.nl.v ; same yosys call LibreLane makes, with cg/synth/pyosys/synthesize.py
T=$1; W=${2:-}
cd /c/Users/Asus/eda/designs/ascon_final/ascon_claude/cg; (cd rtl && sha256sum -c ../rtl.sha256 --quiet) || { echo RTL HASH MISMATCH; exit 1; }
rm -rf synth/out_$T; mkdir -p synth/out_$T
MSYS_NO_PATHCONV=1 docker run --rm -e CG_MIN_WIDTH=$W -v "C:\Users\Asus\eda\designs\ascon_final\ascon_claude\cg:/work" hpretl/iic-osic-tools:chipathon26 --skip bash -c "cd /work/synth && yosys -y /work/synth/pyosys/synthesize.py -- --config-in /work/synth/config.json --extra-in /work/synth/extra.json --output /work/synth/out_$T/spi_slave.nl.v" > synth/out_$T.log 2>&1
tail -3 synth/out_$T.log
