#!/bin/bash
# wait for other agents' LibreLane containers, then run PD N=$1 (launch + watchdog + summary in one script)
while docker ps --format '{{.Names}}' | grep -q '^ascon_push'; do sleep 300; done
bash /c/Users/Asus/eda/designs/ascon_final/ascon_claude/cg/run_pd.sh $1 synth/out_cg8/spi_slave.nl.v
