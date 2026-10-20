#!/bin/bash
# host launcher: runs `make` in the OSIC container (repo mounted read-only except soc/)
R=$(cygpath -w "$(cd "$(dirname "$0")/.." && pwd)")
MSYS_NO_PATHCONV=1 docker run --rm -v "$R":/w:ro -v "$R\soc":/w/soc hpretl/iic-osic-tools:chipathon26 --skip bash -c "cd /w/soc && make ${*:-all}" 2>&1 | grep -v '^\[INFO\]'
