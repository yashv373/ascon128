#!/bin/bash
# Clones the pinned upstream sources used by the SoC (see PROVENANCE.md). Run from soc/.
set -e
cd "$(dirname "$0")"; mkdir -p third_party; cd third_party
pin(){ [ -d "$2/.git" ] || git clone "$1" "$2"; git -C "$2" checkout -q "$3"; }
pin https://github.com/YosysHQ/picorv32 picorv32 ef203c2b0a3fb793280f5114941416c425c5b461
pin https://github.com/alexforencich/verilog-axi verilog-axi 516bd5dadc3365b7f9e225d2af8fe0b8d804fe53
