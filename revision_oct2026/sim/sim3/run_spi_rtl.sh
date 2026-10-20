#!/bin/bash
# RTL-level SPI TB sanity (validates TB + protocol before GLS)
cd "$(dirname "$0")"; W=$(cygpath -w "$PWD"); R=$(cygpath -w "$PWD/../pd_closure/base/rtl"); a=$1; p=$2
python gen_case.py $a $p
MSYS_NO_PATHCONV=1 docker run --rm -v "$R":/rtl:ro -v "$W":/sim hpretl/iic-osic-tools:chipathon26 --skip bash -c \
 "cd /sim && iverilog -g2012 -o spi_rtl.vvp tb_spi.v /rtl/*.v && time vvp spi_rtl.vvp +ADLEN=$a +PTLEN=$p"
