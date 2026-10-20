#!/bin/bash
# usage: run_sta.sh <vcd|none> <scope> <logname>
cd "$(dirname "$0")"; W=$(cygpath -w "$PWD"); A=$(cygpath -w "$PWD/../..")
MSYS_NO_PATHCONV=1 docker run --rm -v "$A":/foss/designs/ascon_final:ro -v "$W":/sim hpretl/iic-osic-tools:chipathon26 --skip bash -c \
 "cd /sim && VCD=$1 SCOPE=$2 sta -no_splash -exit sta_power.tcl" > $3 2>&1
