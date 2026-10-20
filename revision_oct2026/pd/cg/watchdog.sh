#!/bin/bash
# usage: watchdog.sh N ; plain bash, no AI. Polls every 300 s.
P=/c/Users/Asus/eda/designs/ascon_final/ascon_claude/cg; N=$1; R=$P/pd_$N/runs/r$N; C=ascon_cg$N
while true; do
  sleep 300
  st=$(docker inspect -f '{{.State.Status}}' $C 2>/dev/null); step=$(ls $R 2>/dev/null | grep -E '^[0-9]+-' | tail -1)
  echo "$(date '+%F %T') pd_$N container=$st step=$step" >> $P/watchdog.log
  if [ "$st" != running ] || [ -f $R/final/metrics.json ]; then break; fi
done
docker logs $C > $P/pd_$N/docker.log 2>&1
python "$(cygpath -w $P/summarize.py)" "$(cygpath -w $R)" > $P/pd_$N/summary.txt 2>&1
echo "$(date '+%F %T') pd_$N DONE exit=$(docker inspect -f '{{.State.ExitCode}}' $C)" >> $P/watchdog.log
