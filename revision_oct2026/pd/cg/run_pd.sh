#!/bin/bash
# usage: run_pd.sh N NETLIST(rel to cg/)   (blocks until watchdog finishes; run with run_in_background)
P=/c/Users/Asus/eda/designs/ascon_final/ascon_claude/cg; N=$1; NL=$2
cd $P; (cd rtl && sha256sum -c ../rtl.sha256 --quiet) || { echo "RTL HASH MISMATCH"; exit 1; }
docker ps --format '{{.Names}} {{.Command}}' | grep -q librelane && { echo "another librelane running"; exit 1; }
rm -rf pd_$N/runs; docker rm -f ascon_cg$N >/dev/null 2>&1
MSYS_NO_PATHCONV=1 docker run -d --name ascon_cg$N -v "C:\Users\Asus\eda\designs\ascon_final\ascon_claude\cg:/work" -v "C:\Users\Asus\eda\designs\ascon_final:/foss/designs/ascon_final:ro" hpretl/iic-osic-tools:chipathon26 --skip bash -c "cd /work/pd_$N && librelane config.yaml --pdk gf180mcuD --pdk-root /foss/pdks --manual-pdk --run-tag r$N --skip Yosys.Synthesis -e nl=/work/$NL"
bash $P/watchdog.sh $N
