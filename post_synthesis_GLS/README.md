 
## TIMING AWARE GATE LEVEL SIMULATION / VERIFICATION (POST-SYNTHESIS)

Tool: EDAPlayground with shell script (run.bash)
Working Environment: https://edaplayground.com/x/f5Wm


This work is trying to perform post synthesis verification on a synthesized verilog design, which generates a gate level netlist, and the same design as a netlist, is then simulated using the same functional verification testbench developed during RTL verification, to make sure that after synthesis stage is completed, the netlist before proceeding further in the physical implementation flow, is functionally correct.
Timing is modeled by back-annotating the generated SDF file into the gate-level netlist during simulation. , using the .sdf (from librelane stage 12 - STA Pre PNR) (standard textual format for representing delay and timing information such as cell delays, interconnect delays, and timing constraints) files, it helps us answer the question: After considering the real delays of gates and wires, does the circuit still work at the desired clock speed?


for this, i referred to caravel docs about post synthesis verification, to understand how gate level simulations (GLS) is performed in Open source toolchain projects.
- the underlying tool used was iverilog (Icarus Verilog)
- i tried running the old testbench which was using random 100Mhz and the code failed, as the rtl2gds runs we performed were aimed at 50Mhz (50 Mhz = 20ns clock period)
- from our previous librelane runs, we knew that @50Mhz, this pipelined design was giving -9.1 ns of WNS at the SS corner, which is a setup violation.
- to make it avoid this violation, providing sufficient timing margin, i gave it 25 Mhz instead , i.e. 40ns clock speed.
- icarus verilog failed to account for the sdf annotation inside the testbench as it couldn't map the complex conditional specify paths used in the GF180 standard cell library., and so was also not possible for verilator.  ( these are 2 majorly used open source compilers). Icarus was able to do Gate-level simulation with just netlist and tb, without accounting for delays, and all 4 cases passed.
- i shifted to eda playground to use commericial compilers like synopsys vcs, that are more suited for Gate-level simulation with SDF (timing-aware gate-level simulation). the netlist generated has almost 72,000+ lines of code, which exceeeds the limit of the EDAPlayground tool, so uploaded these files to github publicly, used a shell script to ask the edaplayground tool to download these files locally and then run synopsys vcs compiler using the testbench i gave, which was able to account for the sdf annotation as well.
- if you observe the log i have pasted in the block below, towards the end, you can see TEST SUMMARY: 4 PASSED, 0 FAILED out of 4 tests and >>> ALL TESTS PASSED <<<, meaning it worked at this speed and correctly did the right functionality expected from the design as per this testbench and under these annotated delays, thereby successfully completing the post-synthesis gate-level simulation for the implemented test cases.
- can re-run the same environment to verify the result personally from the working environment eda playground code given above.

---

# SYNTHESIS VISUALIZATION

### BASE RTL DESIGN BASED CIRCUIT VISUAL (using netlistssvg by Neil Turley)

<img width="3934" height="17014" alt="rtl_design" src="https://github.com/user-attachments/assets/49fca372-e6b9-461d-a95a-da536a8a9229" />

### POST SYNTHESIS NETLIST BASED CIRCUIT VISUAL (using netlistssvg by Neil Turley)

<img width="10710" height="10127" alt="netlist" src="https://github.com/user-attachments/assets/6ecc76ba-c2cd-4e1f-b41f-72444926004c" />



---

# LOG ( updated on 02/07/2026 -- 18:34 IST):
updated on jul 2 -- from jun 29's version 
added "+neg_tchk" to the run.bash script - fixes errors.

```
[2026-07-02 13:18:30 UTC] chmod +x run.bash; sed -i -e 's/\r//g' run.bash; ./run.bash  
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed

  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  0 2978k    0 15468    0     0   132k      0  0:00:22 --:--:--  0:00:22  131k
100 2978k  100 2978k    0     0  19.7M      0 --:--:-- --:--:-- --:--:-- 19.6M
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed

  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100 6207k  100 6207k    0     0  37.4M      0 --:--:-- --:--:-- --:--:-- 37.4M
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed

  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100  952k  100  952k    0     0  8355k      0 --:--:-- --:--:-- --:--:-- 8429k
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed

  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100  5541  100  5541    0     0  86578      0 --:--:-- --:--:-- --:--:-- 86578
                         Chronologic VCS (TM)
       Version X-2025.06-SP1_Full64 -- Thu Jul  2 09:18:31 2026

                    Copyright (c) 1991 - 2025 Synopsys, Inc.
   This software and the associated documentation are proprietary to Synopsys,
 Inc. This software may only be used in accordance with the terms and conditions
 of a written license agreement with Synopsys, Inc. All other use, reproduction,
   or distribution of this software is strictly prohibited.  Licensed Products
     communicate with Synopsys servers for the purpose of providing software
    updates, detecting software piracy and verifying that customers are using
    Licensed Products in conformity with the applicable License Key for such
  Licensed Products. Synopsys will use information gathered in connection with
    this process to deliver software updates and pursue software pirates and
                                   infringers.

 Inclusivity & Diversity - Visit SolvNetPlus to read the "Synopsys Statement on
            Inclusivity and Diversity" (Refer to article 000036315 at
                        https://solvnetplus.synopsys.com)

Parsing design file 'testbench.sv'
Parsing design file 'ascon_core_adpt_encdec.nl.v'
Parsing design file 'gf180mcu_fd_sc_mcu7t5v0.v'
Parsing design file 'primitives.v'
Top Level Modules:
       tb_ascon_verilog
       gf180mcu_fd_sc_mcu7t5v0__addf_1
       gf180mcu_fd_sc_mcu7t5v0__addf_2
       gf180mcu_fd_sc_mcu7t5v0__addf_4
       gf180mcu_fd_sc_mcu7t5v0__addh_1
       gf180mcu_fd_sc_mcu7t5v0__addh_2
       gf180mcu_fd_sc_mcu7t5v0__addh_4
       gf180mcu_fd_sc_mcu7t5v0__and3_2
       gf180mcu_fd_sc_mcu7t5v0__and3_4
       gf180mcu_fd_sc_mcu7t5v0__and4_2
       gf180mcu_fd_sc_mcu7t5v0__and4_4
       gf180mcu_fd_sc_mcu7t5v0__aoi22_4
       gf180mcu_fd_sc_mcu7t5v0__aoi221_2
       gf180mcu_fd_sc_mcu7t5v0__aoi221_4
       gf180mcu_fd_sc_mcu7t5v0__aoi222_2
       gf180mcu_fd_sc_mcu7t5v0__aoi222_4
       gf180mcu_fd_sc_mcu7t5v0__buf_1
       gf180mcu_fd_sc_mcu7t5v0__bufz_1
       gf180mcu_fd_sc_mcu7t5v0__bufz_2
       gf180mcu_fd_sc_mcu7t5v0__bufz_3
       gf180mcu_fd_sc_mcu7t5v0__bufz_4
       gf180mcu_fd_sc_mcu7t5v0__bufz_8
       gf180mcu_fd_sc_mcu7t5v0__bufz_12
       gf180mcu_fd_sc_mcu7t5v0__bufz_16
       gf180mcu_fd_sc_mcu7t5v0__clkbuf_1
       gf180mcu_fd_sc_mcu7t5v0__clkbuf_3
       gf180mcu_fd_sc_mcu7t5v0__clkbuf_4
       gf180mcu_fd_sc_mcu7t5v0__clkbuf_12
       gf180mcu_fd_sc_mcu7t5v0__clkbuf_20
       gf180mcu_fd_sc_mcu7t5v0__clkinv_3
       gf180mcu_fd_sc_mcu7t5v0__clkinv_4
       gf180mcu_fd_sc_mcu7t5v0__clkinv_16
       gf180mcu_fd_sc_mcu7t5v0__dffnq_1
       gf180mcu_fd_sc_mcu7t5v0__dffnq_2
       gf180mcu_fd_sc_mcu7t5v0__dffnq_4
       gf180mcu_fd_sc_mcu7t5v0__dffnrnq_1
       gf180mcu_fd_sc_mcu7t5v0__dffnrnq_2
       gf180mcu_fd_sc_mcu7t5v0__dffnrnq_4
       gf180mcu_fd_sc_mcu7t5v0__dffnrsnq_1
       gf180mcu_fd_sc_mcu7t5v0__dffnrsnq_2
       gf180mcu_fd_sc_mcu7t5v0__dffnrsnq_4
       gf180mcu_fd_sc_mcu7t5v0__dffnsnq_1
       gf180mcu_fd_sc_mcu7t5v0__dffnsnq_2
       gf180mcu_fd_sc_mcu7t5v0__dffnsnq_4
       gf180mcu_fd_sc_mcu7t5v0__dffq_1
       gf180mcu_fd_sc_mcu7t5v0__dffq_2
       gf180mcu_fd_sc_mcu7t5v0__dffq_4
       gf180mcu_fd_sc_mcu7t5v0__dffrsnq_1
       gf180mcu_fd_sc_mcu7t5v0__dffrsnq_2
       gf180mcu_fd_sc_mcu7t5v0__dffrsnq_4
       gf180mcu_fd_sc_mcu7t5v0__dffsnq_1
       gf180mcu_fd_sc_mcu7t5v0__dffsnq_2
       gf180mcu_fd_sc_mcu7t5v0__dffsnq_4
       gf180mcu_fd_sc_mcu7t5v0__dlya_1
       gf180mcu_fd_sc_mcu7t5v0__dlya_2
       gf180mcu_fd_sc_mcu7t5v0__dlya_4
       gf180mcu_fd_sc_mcu7t5v0__dlyb_1
       gf180mcu_fd_sc_mcu7t5v0__dlyb_2
       gf180mcu_fd_sc_mcu7t5v0__dlyb_4
       gf180mcu_fd_sc_mcu7t5v0__dlyc_1
       gf180mcu_fd_sc_mcu7t5v0__dlyc_2
       gf180mcu_fd_sc_mcu7t5v0__dlyc_4
       gf180mcu_fd_sc_mcu7t5v0__dlyd_2
       gf180mcu_fd_sc_mcu7t5v0__dlyd_4
       gf180mcu_fd_sc_mcu7t5v0__fill_4
       gf180mcu_fd_sc_mcu7t5v0__fill_8
       gf180mcu_fd_sc_mcu7t5v0__fill_16
       gf180mcu_fd_sc_mcu7t5v0__fill_32
       gf180mcu_fd_sc_mcu7t5v0__fill_64
       gf180mcu_fd_sc_mcu7t5v0__hold
       gf180mcu_fd_sc_mcu7t5v0__icgtn_1
       gf180mcu_fd_sc_mcu7t5v0__icgtn_2
       gf180mcu_fd_sc_mcu7t5v0__icgtn_4
       gf180mcu_fd_sc_mcu7t5v0__icgtp_1
       gf180mcu_fd_sc_mcu7t5v0__icgtp_2
       gf180mcu_fd_sc_mcu7t5v0__icgtp_4
       gf180mcu_fd_sc_mcu7t5v0__inv_1
       gf180mcu_fd_sc_mcu7t5v0__inv_16
       gf180mcu_fd_sc_mcu7t5v0__inv_20
       gf180mcu_fd_sc_mcu7t5v0__invz_1
       gf180mcu_fd_sc_mcu7t5v0__invz_2
       gf180mcu_fd_sc_mcu7t5v0__invz_3
       gf180mcu_fd_sc_mcu7t5v0__invz_4
       gf180mcu_fd_sc_mcu7t5v0__invz_8
       gf180mcu_fd_sc_mcu7t5v0__invz_12
       gf180mcu_fd_sc_mcu7t5v0__invz_16
       gf180mcu_fd_sc_mcu7t5v0__latq_1
       gf180mcu_fd_sc_mcu7t5v0__latq_2
       gf180mcu_fd_sc_mcu7t5v0__latq_4
       gf180mcu_fd_sc_mcu7t5v0__latrnq_1
       gf180mcu_fd_sc_mcu7t5v0__latrnq_2
       gf180mcu_fd_sc_mcu7t5v0__latrnq_4
       gf180mcu_fd_sc_mcu7t5v0__latrsnq_1
       gf180mcu_fd_sc_mcu7t5v0__latrsnq_2
       gf180mcu_fd_sc_mcu7t5v0__latrsnq_4
       gf180mcu_fd_sc_mcu7t5v0__latsnq_1
       gf180mcu_fd_sc_mcu7t5v0__latsnq_2
       gf180mcu_fd_sc_mcu7t5v0__latsnq_4
       gf180mcu_fd_sc_mcu7t5v0__mux2_1
       gf180mcu_fd_sc_mcu7t5v0__mux2_4
       gf180mcu_fd_sc_mcu7t5v0__mux4_1
       gf180mcu_fd_sc_mcu7t5v0__mux4_2
       gf180mcu_fd_sc_mcu7t5v0__mux4_4
       gf180mcu_fd_sc_mcu7t5v0__nor3_2
       gf180mcu_fd_sc_mcu7t5v0__oai22_4
       gf180mcu_fd_sc_mcu7t5v0__oai32_4
       gf180mcu_fd_sc_mcu7t5v0__oai33_1
       gf180mcu_fd_sc_mcu7t5v0__oai33_2
       gf180mcu_fd_sc_mcu7t5v0__oai33_4
       gf180mcu_fd_sc_mcu7t5v0__oai221_2
       gf180mcu_fd_sc_mcu7t5v0__oai221_4
       gf180mcu_fd_sc_mcu7t5v0__oai222_1
       gf180mcu_fd_sc_mcu7t5v0__oai222_2
       gf180mcu_fd_sc_mcu7t5v0__oai222_4
       gf180mcu_fd_sc_mcu7t5v0__or3_4
       gf180mcu_fd_sc_mcu7t5v0__or4_2
       gf180mcu_fd_sc_mcu7t5v0__or4_4
       gf180mcu_fd_sc_mcu7t5v0__sdffq_1
       gf180mcu_fd_sc_mcu7t5v0__sdffq_2
       gf180mcu_fd_sc_mcu7t5v0__sdffq_4
       gf180mcu_fd_sc_mcu7t5v0__sdffrnq_1
       gf180mcu_fd_sc_mcu7t5v0__sdffrnq_2
       gf180mcu_fd_sc_mcu7t5v0__sdffrnq_4
       gf180mcu_fd_sc_mcu7t5v0__sdffrsnq_1
       gf180mcu_fd_sc_mcu7t5v0__sdffrsnq_2
       gf180mcu_fd_sc_mcu7t5v0__sdffrsnq_4
       gf180mcu_fd_sc_mcu7t5v0__sdffsnq_1
       gf180mcu_fd_sc_mcu7t5v0__sdffsnq_2
       gf180mcu_fd_sc_mcu7t5v0__sdffsnq_4
       gf180mcu_fd_sc_mcu7t5v0__tieh
       gf180mcu_fd_sc_mcu7t5v0__tiel
       gf180mcu_fd_sc_mcu7t5v0__xnor2_4
       gf180mcu_fd_sc_mcu7t5v0__xnor3_2
       gf180mcu_fd_sc_mcu7t5v0__xnor3_4
       gf180mcu_fd_sc_mcu7t5v0__xor2_4
       gf180mcu_fd_sc_mcu7t5v0__xor3_2
       gf180mcu_fd_sc_mcu7t5v0__xor3_4
TimeScale is 1 ns / 1 ps

Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69112
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkbuf_8 clkload0( .I (clknet_4_3__leaf_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69113
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkbuf_8 clkload1( .I (clknet_4_7__leaf_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69114
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__inv_4 clkload10( .I (clknet_leaf_1_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69115
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__inv_4 clkload11( .I (clknet_leaf_74_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69116
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkbuf_2 clkload12( .I (clknet_leaf_67_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69117
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__inv_2 clkload13( .I (clknet_leaf_70_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69118
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__inv_4 clkload14( .I (clknet_leaf_72_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69119
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkbuf_2 clkload15( .I (clknet_leaf_64_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69120
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkbuf_2 clkload16( .I (clknet_leaf_66_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69121
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkbuf_2 clkload17( .I (clknet_leaf_8_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69122
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkbuf_2 clkload18( .I (clknet_leaf_10_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69123
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkinv_2 clkload19( .I (clknet_leaf_11_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69124
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkbuf_8 clkload2( .I (clknet_4_11__leaf_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69125
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__inv_2 clkload20( .I (clknet_leaf_14_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69126
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkbuf_2 clkload21( .I (clknet_leaf_15_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69127
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkinv_2 clkload22( .I (clknet_leaf_16_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69128
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__inv_4 clkload23( .I (clknet_leaf_17_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69129
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkbuf_2 clkload24( .I (clknet_leaf_22_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69130
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkbuf_2 clkload25( .I (clknet_leaf_24_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69131
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__inv_2 clkload26( .I (clknet_leaf_26_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69132
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkbuf_2 clkload27( .I (clknet_leaf_20_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69133
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__inv_4 clkload28( .I (clknet_leaf_55_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69134
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkbuf_2 clkload29( .I (clknet_leaf_56_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69135
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkbuf_8 clkload3( .I (clknet_4_13__leaf_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69136
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkbuf_2 clkload30( .I (clknet_leaf_59_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69137
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkbuf_2 clkload31( .I (clknet_leaf_60_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69138
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkbuf_2 clkload32( .I (clknet_leaf_45_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69139
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__inv_2 clkload33( .I (clknet_leaf_61_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69140
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkinv_2 clkload34( .I (clknet_leaf_62_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69141
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkinv_2 clkload35( .I (clknet_leaf_63_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69142
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__inv_2 clkload36( .I (clknet_leaf_49_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69143
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__inv_3 clkload37( .I (clknet_leaf_50_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69144
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkinv_8 clkload38( .I (clknet_leaf_53_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69145
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkinv_12 clkload39( .I (clknet_leaf_54_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69146
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkbuf_8 clkload4( .I (clknet_4_15__leaf_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69147
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkbuf_2 clkload40( .I (clknet_leaf_48_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69148
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkbuf_2 clkload41( .I (clknet_leaf_51_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69149
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__inv_4 clkload42( .I (clknet_leaf_52_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69150
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__inv_2 clkload43( .I (clknet_leaf_28_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69151
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkbuf_2 clkload44( .I (clknet_leaf_29_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69152
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkinv_2 clkload45( .I (clknet_leaf_30_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69153
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkinv_2 clkload46( .I (clknet_leaf_31_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69154
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkbuf_2 clkload47( .I (clknet_leaf_33_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69155
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__inv_4 clkload48( .I (clknet_leaf_34_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69156
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__inv_4 clkload49( .I (clknet_leaf_35_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69157
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkbuf_2 clkload5( .I (clknet_leaf_2_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69158
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkinv_2 clkload50( .I (clknet_leaf_37_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69159
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__inv_4 clkload51( .I (clknet_leaf_38_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69160
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__inv_2 clkload52( .I (clknet_leaf_41_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69161
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkinv_2 clkload53( .I (clknet_leaf_39_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69162
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__inv_2 clkload54( .I (clknet_leaf_40_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69163
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__inv_4 clkload55( .I (clknet_leaf_43_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69164
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkbuf_2 clkload6( .I (clknet_leaf_3_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69165
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkbuf_2 clkload7( .I (clknet_leaf_68_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69166
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__inv_8 clkload8( .I (clknet_leaf_73_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


Warning-[TFIPC] Too few instance port connections
ascon_core_adpt_encdec.nl.v, 69167
ascon_core_adpt_encdec, "gf180mcu_fd_sc_mcu7t5v0__clkinv_2 clkload9( .I (clknet_leaf_0_clk));"
  The above instance has fewer port connections than the module definition.
  Please use '+lint=TFIPC-L' to print out detailed information of unconnected 
  ports.


   ***   $sdf_annotate() version 1.2R
   ***    SDF file: "ascon_core_adpt_encdec.sdf"
   ***    Annotation scope: tb_ascon_verilog.u_dut
   ***    MTM selection: "MAXIMUM"
   ***    No SCALE FACTORS argument specified
   ***    No SCALE TYPE argument specified
   ***    SCALE FACTORS defaulted to "1.0:1.0:1.0":
   ***    SCALE TYPE defaulted to: "FROM_MTM"
   ***    Turnoff delay: "FROM_FILE"
   ***    Approximation (mipd) policy: "MAXIMUM"

   ***    SDF annotation begin: Thu Jul  2 09:18:34 2026


SDF Info: +pulse_r/100, +pulse_e/100 in effect

Warning-[SDFCOM_UHICD] Up-hierarchy Interconnect Delay ignored
ascon_core_adpt_encdec.sdf, 18391
module: gf180mcu_fd_sc_mcu7t5v0__buf_2, "instance: tb_ascon_verilog.u_dut.output659"
  SDF Warning: INTERCONNECT Delay to up-hierarchy destination accOutput is 
  ignored, DEVICE Delay on port 'Z' applied.
  Up-hierarchy interconnect delay arises when the load is hierarchically above
  the source.


Warning-[SDFCOM_UHICD] Up-hierarchy Interconnect Delay ignored
ascon_core_adpt_encdec.sdf, 18392
module: gf180mcu_fd_sc_mcu7t5v0__dlyd_1, "instance: tb_ascon_verilog.u_dut.output660"
  SDF Warning: INTERCONNECT Delay to up-hierarchy destination accOutput is 
  ignored, DEVICE Delay on port 'Z' applied.
  Up-hierarchy interconnect delay arises when the load is hierarchically above
  the source.


Warning-[SDFCOM_UHICD] Up-hierarchy Interconnect Delay ignored
ascon_core_adpt_encdec.sdf, 18393
module: gf180mcu_fd_sc_mcu7t5v0__dlyd_1, "instance: tb_ascon_verilog.u_dut.output661"
  SDF Warning: INTERCONNECT Delay to up-hierarchy destination accOutput is 
  ignored, DEVICE Delay on port 'Z' applied.
  Up-hierarchy interconnect delay arises when the load is hierarchically above
  the source.


Warning-[SDFCOM_UHICD] Up-hierarchy Interconnect Delay ignored
ascon_core_adpt_encdec.sdf, 18394
module: gf180mcu_fd_sc_mcu7t5v0__buf_2, "instance: tb_ascon_verilog.u_dut.output662"
  SDF Warning: INTERCONNECT Delay to up-hierarchy destination accOutput is 
  ignored, DEVICE Delay on port 'Z' applied.
  Up-hierarchy interconnect delay arises when the load is hierarchically above
  the source.


Warning-[SDFCOM_UHICD] Up-hierarchy Interconnect Delay ignored
ascon_core_adpt_encdec.sdf, 18395
module: gf180mcu_fd_sc_mcu7t5v0__dlyd_1, "instance: tb_ascon_verilog.u_dut.output663"
  SDF Warning: INTERCONNECT Delay to up-hierarchy destination accOutput is 
  ignored, DEVICE Delay on port 'Z' applied.
  Up-hierarchy interconnect delay arises when the load is hierarchically above
  the source.


Warning-[SDFCOM_UHICD] Up-hierarchy Interconnect Delay ignored
ascon_core_adpt_encdec.sdf, 18396
module: gf180mcu_fd_sc_mcu7t5v0__dlyd_1, "instance: tb_ascon_verilog.u_dut.output664"
  SDF Warning: INTERCONNECT Delay to up-hierarchy destination accOutput is 
  ignored, DEVICE Delay on port 'Z' applied.
  Up-hierarchy interconnect delay arises when the load is hierarchically above
  the source.


Warning-[SDFCOM_UHICD] Up-hierarchy Interconnect Delay ignored
ascon_core_adpt_encdec.sdf, 18397
module: gf180mcu_fd_sc_mcu7t5v0__dlyd_1, "instance: tb_ascon_verilog.u_dut.output665"
  SDF Warning: INTERCONNECT Delay to up-hierarchy destination accOutput is 
  ignored, DEVICE Delay on port 'Z' applied.
  Up-hierarchy interconnect delay arises when the load is hierarchically above
  the source.


Warning-[SDFCOM_UHICD] Up-hierarchy Interconnect Delay ignored
ascon_core_adpt_encdec.sdf, 18398
module: gf180mcu_fd_sc_mcu7t5v0__dlyd_1, "instance: tb_ascon_verilog.u_dut.output666"
  SDF Warning: INTERCONNECT Delay to up-hierarchy destination accOutput is 
  ignored, DEVICE Delay on port 'Z' applied.
  Up-hierarchy interconnect delay arises when the load is hierarchically above
  the source.


Warning-[SDFCOM_UHICD] Up-hierarchy Interconnect Delay ignored
ascon_core_adpt_encdec.sdf, 18399
module: gf180mcu_fd_sc_mcu7t5v0__dlyd_1, "instance: tb_ascon_verilog.u_dut.output667"
  SDF Warning: INTERCONNECT Delay to up-hierarchy destination accOutput is 
  ignored, DEVICE Delay on port 'Z' applied.
  Up-hierarchy interconnect delay arises when the load is hierarchically above
  the source.

All future warnings not reported; use +sdfverbose to report them.

Warning-[SDFCOM_UHICD] Up-hierarchy Interconnect Delay ignored
ascon_core_adpt_encdec.sdf, 18400
module: gf180mcu_fd_sc_mcu7t5v0__dlyd_1, "instance: tb_ascon_verilog.u_dut.output668"
  SDF Warning: INTERCONNECT Delay to up-hierarchy destination accOutput is 
  ignored, DEVICE Delay on port 'Z' applied.
  Up-hierarchy interconnect delay arises when the load is hierarchically above
  the source.


          Total errors: 0
          Total warnings: 278
   ***    SDF annotation completed: Thu Jul  2 09:18:35 2026


Starting vcs inline pass...
257 modules and 4 UDPs read.
recompiling module tb_ascon_verilog
recompiling module ascon_core_adpt_encdec
recompiling module gf180mcu_fd_sc_mcu7t5v0__addf_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__addf_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__addf_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__addf_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__addh_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__addh_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__addh_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__addh_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__and2_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__and2_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__and2_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__and3_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__and3_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__and3_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__and3_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__and4_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__and4_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__and4_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__and4_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__antenna
recompiling module gf180mcu_fd_sc_mcu7t5v0__antenna_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__aoi21_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__aoi21_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__aoi21_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__aoi21_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__aoi22_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__aoi22_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__aoi22_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__aoi22_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__aoi211_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__aoi211_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__aoi211_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__aoi211_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__aoi221_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__aoi221_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__aoi221_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__aoi221_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__aoi222_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__aoi222_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__aoi222_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__aoi222_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__buf_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__buf_8
recompiling module gf180mcu_fd_sc_mcu7t5v0__bufz_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__bufz_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__bufz_3
recompiling module gf180mcu_fd_sc_mcu7t5v0__bufz_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__bufz_8
50 of 257 modules done
recompiling module gf180mcu_fd_sc_mcu7t5v0__bufz_12
recompiling module gf180mcu_fd_sc_mcu7t5v0__bufz_16
recompiling module gf180mcu_fd_sc_mcu7t5v0__bufz_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__clkbuf_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__clkbuf_3
recompiling module gf180mcu_fd_sc_mcu7t5v0__clkbuf_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__clkbuf_8
recompiling module gf180mcu_fd_sc_mcu7t5v0__clkbuf_12
recompiling module gf180mcu_fd_sc_mcu7t5v0__clkbuf_20
recompiling module gf180mcu_fd_sc_mcu7t5v0__clkinv_3
recompiling module gf180mcu_fd_sc_mcu7t5v0__clkinv_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__clkinv_8
recompiling module gf180mcu_fd_sc_mcu7t5v0__clkinv_16
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffnq_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffnq_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffnq_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffnq_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffnrnq_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffnrnq_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffnrnq_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffnrnq_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffnrsnq_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffnrsnq_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffnrsnq_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffnrsnq_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffnsnq_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffnsnq_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffnsnq_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffnsnq_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffq_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffq_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffq_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffq_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffrnq_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffrnq_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffrsnq_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffrsnq_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffrsnq_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffrsnq_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffsnq_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffsnq_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffsnq_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__dffsnq_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__dlya_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__dlya_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__dlya_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__dlyb_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__dlyb_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__dlyb_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__dlyc_1
100 of 257 modules done
recompiling module gf180mcu_fd_sc_mcu7t5v0__dlyc_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__dlyc_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__dlyd_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__dlyd_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__dlyd_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__dlyd_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__endcap
recompiling module gf180mcu_fd_sc_mcu7t5v0__fill_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__fill_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__fill_8
recompiling module gf180mcu_fd_sc_mcu7t5v0__fill_16
recompiling module gf180mcu_fd_sc_mcu7t5v0__fill_32
recompiling module gf180mcu_fd_sc_mcu7t5v0__fill_64
recompiling module gf180mcu_fd_sc_mcu7t5v0__fillcap_8
recompiling module gf180mcu_fd_sc_mcu7t5v0__filltie
recompiling module gf180mcu_fd_sc_mcu7t5v0__filltie_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__hold
recompiling module gf180mcu_fd_sc_mcu7t5v0__hold_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__icgtn_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__icgtn_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__icgtn_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__icgtn_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__icgtp_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__icgtp_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__icgtp_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__icgtp_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__inv_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__inv_8
recompiling module gf180mcu_fd_sc_mcu7t5v0__inv_16
recompiling module gf180mcu_fd_sc_mcu7t5v0__inv_20
recompiling module gf180mcu_fd_sc_mcu7t5v0__inv_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__invz_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__invz_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__invz_3
recompiling module gf180mcu_fd_sc_mcu7t5v0__invz_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__invz_8
recompiling module gf180mcu_fd_sc_mcu7t5v0__invz_12
recompiling module gf180mcu_fd_sc_mcu7t5v0__invz_16
recompiling module gf180mcu_fd_sc_mcu7t5v0__invz_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__latq_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__latq_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__latq_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__latq_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__latrnq_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__latrnq_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__latrnq_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__latrnq_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__latrsnq_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__latrsnq_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__latrsnq_4
150 of 257 modules done
recompiling module gf180mcu_fd_sc_mcu7t5v0__latrsnq_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__latsnq_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__latsnq_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__latsnq_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__latsnq_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__mux2_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__mux2_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__mux2_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__mux2_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__mux4_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__mux4_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__mux4_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__mux4_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__nand2_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__nand2_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__nand2_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__nand3_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__nand3_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__nand3_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__nand3_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__nand4_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__nand4_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__nand4_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__nand4_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__nor2_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__nor2_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__nor2_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__nor3_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__nor3_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__nor3_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__nor3_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__nor4_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__nor4_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__nor4_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai21_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai21_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai21_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai22_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai22_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai22_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai22_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai31_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai31_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai31_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai31_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai32_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai32_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai32_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai32_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai33_1
200 of 257 modules done
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai33_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai33_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai33_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai211_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai211_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai221_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai221_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai221_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai221_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai222_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai222_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai222_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__oai222_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__or2_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__or2_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__or2_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__or3_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__or3_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__or3_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__or4_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__or4_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__or4_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__or4_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__sdffq_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__sdffq_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__sdffq_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__sdffq_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__sdffrnq_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__sdffrnq_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__sdffrnq_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__sdffrnq_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__sdffrsnq_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__sdffrsnq_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__sdffrsnq_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__sdffrsnq_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__sdffsnq_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__sdffsnq_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__sdffsnq_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__sdffsnq_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__tieh
recompiling module gf180mcu_fd_sc_mcu7t5v0__tieh_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__tiel
recompiling module gf180mcu_fd_sc_mcu7t5v0__tiel_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__xnor2_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__xnor2_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__xnor2_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__xnor3_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__xnor3_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__xnor3_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__xnor3_func
250 of 257 modules done
recompiling module gf180mcu_fd_sc_mcu7t5v0__xor2_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__xor2_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__xor2_func
recompiling module gf180mcu_fd_sc_mcu7t5v0__xor3_1
recompiling module gf180mcu_fd_sc_mcu7t5v0__xor3_2
recompiling module gf180mcu_fd_sc_mcu7t5v0__xor3_4
recompiling module gf180mcu_fd_sc_mcu7t5v0__xor3_func
All of 257 modules done
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib -L/apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o  _254_archive_1.so objs/udps/qzQ2U.o objs/udps/J6yjv.o objs/udps/Iq9kf.o objs/udps/s6J8P.o  SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs      -lvcsnew -ldistsimclient -lsimprofile -luclinative /apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: 9.112 seconds to compile + 2.333 seconds to elab + 3.794 seconds to link
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Jul  2 09:18 2026
Doing SDF annotation ...... Done
------------------------------------------------------------
TEST 1: Empty AD, Empty PT (key=0, nonce=0)
------------------------------------------------------------
[PASS] Test 1: Tag matches golden reference
  t0_out = 0x90f0fbf991dae8f1 (expected 0x90f0fbf991dae8f1)
  t1_out = 0xae1bd9ca7ce3f3ca (expected 0xae1bd9ca7ce3f3ca)

------------------------------------------------------------
TEST 2: Empty AD, 5-byte PT 'Hello'
------------------------------------------------------------
[PASS] Test 2: CT and Tag match golden reference
  CT (5 bytes) = 0xb9e6bc14af (expected 0xb9e6bc14af)
  t0_out = 0xdc9d3fa63a8c58b6 (expected 0xdc9d3fa63a8c58b6)
  t1_out = 0xb058f365f5f50c5a (expected 0xb058f365f5f50c5a)

------------------------------------------------------------
TEST 3: Encrypt-then-Decrypt roundtrip of Test 2
------------------------------------------------------------
  Step A: Using encrypted CT = 0xb9e6bc14af, tag0=0xdc9d3fa63a8c58b6, tag1=0xb058f365f5f50c5a
[PASS] Test 3: Decrypt roundtrip successful
  Recovered PT (5 bytes) = 0x6f6c6c6548 (expected 0x6f6c6c6548 = 'Hello')
  auth_ok = 1 (expected 1)

------------------------------------------------------------
TEST 4: 8-byte AD ('metadata'), 6-byte PT ('secret')
------------------------------------------------------------
[PASS] Test 4: CT and Tag match golden reference
  CT (6 bytes) = 0x7f95de8f180e (expected 0x7f95de8f180e)
  t0_out = 0x9acf10c942363add (expected 0x9acf10c942363add)
  t1_out = 0x987a35ce66cff532 (expected 0x987a35ce66cff532)

============================================================
TEST SUMMARY: 4 PASSED, 0 FAILED out of 4 tests
============================================================
>>> ALL TESTS PASSED <<<
$finish called from file "testbench.sv", line 551.
$finish at simulation time             10940000
           V C S   S i m u l a t i o n   R e p o r t 
Time: 10940000 ps
CPU Time:      3.150 seconds;       Data structure size:   3.6Mb
Thu Jul  2 09:18:50 2026
Done
```

---


## ICarus Verilog based GLS (No SDF)

<img width="667" height="893" alt="image" src="https://github.com/user-attachments/assets/c4e763b7-b308-4464-984f-1abf53a6d139" />

