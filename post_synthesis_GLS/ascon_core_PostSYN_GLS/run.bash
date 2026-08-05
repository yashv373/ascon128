#for EDAPLAYGROUND
# ENABLE "Use run.bash shell script" option
# 1. Download all files directly from your GitHub repo using curl
curl -O "https://raw.githubusercontent.com/yashv373/ascon128/main/post_synthesis_GLS/ascon_core_adpt_encdec.nl.v"
curl -O "https://raw.githubusercontent.com/yashv373/ascon128/main/post_synthesis_GLS/ascon_core_adpt_encdec.sdf"
curl -O "https://raw.githubusercontent.com/yashv373/ascon128/main/post_synthesis_GLS/gf180mcu_fd_sc_mcu7t5v0.v"
curl -O "https://raw.githubusercontent.com/yashv373/ascon128/main/post_synthesis_GLS/primitives.v"

# 2. Compile everything using Synopsys VCS
vcs -full64 -sverilog +neg_tchk testbench.sv ascon_core_adpt_encdec.nl.v gf180mcu_fd_sc_mcu7t5v0.v primitives.v

# 3. Run the compiled simulation
./simv
