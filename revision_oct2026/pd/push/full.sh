#!/bin/bash
# usage: full.sh N : wait for free docker -> launch -> watchdog -> summarize (one wake-up)
P=/c/Users/Asus/eda/designs/ascon_final/ascon_claude/pd_push
bash $P/wait.sh; bash $P/run_iter.sh $1; echo "iter_$1 finished"; tail -1 $P/watchdog.log
