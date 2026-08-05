# EDAPlayground Gate-Level Timing Simulation Guide (Synopsys VCS)

This folder contains all necessary files from our 100% green sign-off run (`green_sta`) to run timing-annotated Gate-Level Simulations (GLS) on EDAPlayground using Synopsys VCS.

---

## 1. Files to Upload to GitHub Repository (`ascon128/edaplayground_gls/`)

Upload the entire contents of this directory (`C:\Users\Asus\eda\designs\ascon_maxCap\edaplayground_gls\`) to your GitHub repository under the directory path `edaplayground_gls/`:

1. `spi_slave_postpnr.nl.v` *(Post-PNR Netlist - 6.1 MB)*
2. `spi_slave_postpnr.sdf` *(Post-PNR SDF Delays - 13.9 MB)*
3. `spi_slave_postsyn.nl.v` *(Post-Synthesis Netlist - 1.7 MB)*
4. `spi_slave_postsyn.sdf` *(Post-Synthesis SDF Delays - 11.1 MB)*
5. `gf180mcu_fd_sc_mcu7t5v0.v` *(GF180 Standard Cell Library Model)*
6. `primitives.v` *(GF180 Verilog Primitives)*
7. `tb_spi_slave.v` *(SPI Master-Slave Testbench)*
8. `clk_divider.v` *(Clock Divider Helper)*
9. `spi_master.v` *(SPI Master Verilog Model)*
10. `testbench.sv` *(EDAPlayground Top Wrapper with $sdf_annotate)*
11. `run_postpnr.bash` *(VCS Runner script for Post-PNR GLS)*
12. `run_postsyn.bash` *(VCS Runner script for Post-Synthesis GLS)*

---

## 2. EDAPlayground Configuration Instructions

### A. Environment Settings on EDAPlayground (https://edaplayground.com/)
- **Tool / Simulator:** Select **Synopsys VCS 2025** (or latest Synopsys VCS version)
- **Top module:** `testbench`
- **Check the option:** **`Use run.bash shell script`**

### B. Setting Up `testbench.sv` & `run.bash` on EDAPlayground

1. **In the Left Pane (`testbench.sv`):**
   Copy & paste the contents of `testbench.sv`:
   ```verilog
   `timescale 1ns/1ps
   module testbench;
     tb_spi_slave tb();

     initial begin
       $display("Loading SDF File for Timing-Aware GLS Simulation...");
       $sdf_annotate("spi_slave.sdf", tb.u_chip, , "sdf_annotate.log", "MAXIMUM");
       $display("SDF Annotation Complete.");
     end
   endmodule
   ```

2. **In the `run.bash` Tab on EDAPlayground:**
   - To run **Post-PNR GLS**: Copy & paste the contents of `run_postpnr.bash`.
   - To run **Post-Synthesis GLS**: Copy & paste the contents of `run_postsyn.bash`.

---

## 3. How `run.bash` Works Under the Hood
1. Automatically fetches raw GitHub links for the target netlist, SDF, testbench, and PDK files into EDAPlayground's container environment.
2. Copies `spi_slave_postpnr.sdf` -> `spi_slave.sdf` (or `spi_slave_postsyn.sdf` -> `spi_slave.sdf`).
3. Invokes Synopsys VCS with negative timing check support:
   ```bash
   vcs -full64 -sverilog +neg_tchk testbench.sv tb_spi_slave.v clk_divider.v spi_master.v spi_slave.nl.v gf180mcu_fd_sc_mcu7t5v0.v primitives.v
   ./simv
   ```
