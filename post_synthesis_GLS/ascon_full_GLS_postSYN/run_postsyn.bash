#!/bin/bash
# EDAPlayground Post-Synthesis Gate-Level Simulation (GLS) Script
# Make sure "Use run.bash shell script" is checked in EDAPlayground

echo "========================================================="
echo " Downloading Post-Synthesis Netlist, SDF & PDK Files..."
echo "========================================================="
curl -O "https://raw.githubusercontent.com/yashv373/ascon128/main/edaplayground_gls/spi_slave_postsyn.nl.v"
curl -O "https://raw.githubusercontent.com/yashv373/ascon128/main/edaplayground_gls/spi_slave_postsyn.sdf"
curl -O "https://raw.githubusercontent.com/yashv373/ascon128/main/edaplayground_gls/gf180mcu_fd_sc_mcu7t5v0.v"
curl -O "https://raw.githubusercontent.com/yashv373/ascon128/main/edaplayground_gls/primitives.v"
curl -O "https://raw.githubusercontent.com/yashv373/ascon128/main/edaplayground_gls/clk_divider.v"
curl -O "https://raw.githubusercontent.com/yashv373/ascon128/main/edaplayground_gls/spi_master.v"
curl -O "https://raw.githubusercontent.com/yashv373/ascon128/main/edaplayground_gls/tb_spi_slave.v"

# Link Post-Synthesis netlist and SDF for testbench.sv
cp spi_slave_postsyn.nl.v spi_slave.nl.v
cp spi_slave_postsyn.sdf spi_slave.sdf

echo "========================================================="
echo " Compiling with Synopsys VCS (+neg_tchk enabled)..."
echo "========================================================="
vcs -full64 -sverilog +neg_tchk testbench.sv tb_spi_slave.v clk_divider.v spi_master.v spi_slave.nl.v gf180mcu_fd_sc_mcu7t5v0.v primitives.v

echo "========================================================="
echo " Running Post-Synthesis Gate-Level Simulation..."
echo "========================================================="
./simv
