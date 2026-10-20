#!/bin/bash
# usage: mkiter.sh N PERIOD_NS  -> iter_N/{config.yaml,constraints.sdc}; edit them afterwards for extra levers
P=/c/Users/Asus/eda/designs/ascon_final/ascon_claude/pd_closure; N=$1; mkdir -p $P/iter_$N
sed "s/^CLOCK_PERIOD:.*/CLOCK_PERIOD: $2/" $P/cfg.tmpl > $P/iter_$N/config.yaml
cp $P/sdc.tmpl $P/iter_$N/constraints.sdc
