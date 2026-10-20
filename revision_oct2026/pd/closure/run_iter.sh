#!/bin/bash
# usage: run_iter.sh N   (blocks until watchdog finishes; run with run_in_background)
P=/c/Users/Asus/eda/designs/ascon_final/ascon_claude/pd_closure; N=$1
cd $P; (cd base/rtl && sha256sum -c ../../rtl.sha256 --quiet) || { echo "RTL HASH MISMATCH"; exit 1; }
rm -rf iter_$N/runs; docker rm -f ascon_pd$N >/dev/null 2>&1
MSYS_NO_PATHCONV=1 docker run -d --name ascon_pd$N -v "C:\Users\Asus\eda\designs\ascon_final\ascon_claude\pd_closure:/work" -v "C:\Users\Asus\eda\designs\ascon_final:/foss/designs/ascon_final:ro" hpretl/iic-osic-tools:chipathon26 --skip bash -c "cd /work/iter_$N && librelane config.yaml --pdk gf180mcuD --pdk-root /foss/pdks --manual-pdk --run-tag r$N" 
bash $P/watchdog.sh $N
