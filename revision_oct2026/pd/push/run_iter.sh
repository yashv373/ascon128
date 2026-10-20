#!/bin/bash
# usage: run_iter.sh N (run_in_background); rtl hash check, refuses if another librelane runs
P=/c/Users/Asus/eda/designs/ascon_final/ascon_claude/pd_push; N=$1
cd $P; (cd base/rtl && sha256sum -c ../../rtl.sha256 --quiet) || { echo "RTL HASH MISMATCH"; exit 1; }
docker ps --no-trunc --format '{{.Names}} {{.Command}}' | grep -q librelane && { echo "another librelane running"; exit 1; }
rm -rf iter_$N/runs; docker rm -f ascon_push$N >/dev/null 2>&1
MSYS_NO_PATHCONV=1 docker run -d --name ascon_push$N -v "C:\Users\Asus\eda\designs\ascon_final\ascon_claude\pd_push:/work" -v "C:\Users\Asus\eda\designs\ascon_final:/foss/designs/ascon_final:ro" hpretl/iic-osic-tools:chipathon26 --skip bash -c "cd /work/iter_$N && librelane config.yaml --pdk gf180mcuD --pdk-root /foss/pdks --manual-pdk --run-tag r$N"
bash $P/watchdog.sh $N
