#!/bin/bash
# usage: mkiter.sh N PERIOD_NS
P=/c/Users/Asus/eda/designs/ascon_final/ascon_claude/pd_push; N=$1; mkdir -p $P/iter_$N
sed "s/@P@/$2/" $P/cfg.tmpl > $P/iter_$N/config.yaml; cp $P/sdc.tmpl $P/iter_$N/constraints.sdc
