# Synthesis - using YosysHQ
---

## Synthesis results of the ASCON Core Design

- Total standard cell count: 6,298 total cells
- Total area: 178785.868800  µm² which is 14.78% of 1210000 µm² (1100 x 1100 die)
- Sequential area: 38.28% of total area = 68,441.95 µm²

### Area report from yosys:
```
139. Printing statistics.

=== ascon_core_adpt_encdec ===

        +----------Local Count, excluding submodules.
        |        +-Local Area, excluding submodules.
        |        | 
     6060        - wires
     6957        - wire bits
      681        - public wires
     1578        - public wire bits
       30        - ports
      927        - port bits
     6298 1.79E+05 cells
       61 1.07E+03   gf180mcu_fd_sc_mcu7t5v0__and2_1
       17  373.184   gf180mcu_fd_sc_mcu7t5v0__and3_1
        3   72.442   gf180mcu_fd_sc_mcu7t5v0__and4_1
       96 2.11E+03   gf180mcu_fd_sc_mcu7t5v0__aoi211_1
      535  9.4E+03   gf180mcu_fd_sc_mcu7t5v0__aoi21_1
       81 1.96E+03   gf180mcu_fd_sc_mcu7t5v0__aoi221_1
       72 2.21E+03   gf180mcu_fd_sc_mcu7t5v0__aoi222_1
      131 2.59E+03   gf180mcu_fd_sc_mcu7t5v0__aoi22_1
      295 2.59E+03   gf180mcu_fd_sc_mcu7t5v0__clkinv_1
      917 6.84E+04   gf180mcu_fd_sc_mcu7t5v0__dffrnq_1
      153 5.04E+03   gf180mcu_fd_sc_mcu7t5v0__mux2_2
      973 1.07E+04   gf180mcu_fd_sc_mcu7t5v0__nand2_1
       42  645.389   gf180mcu_fd_sc_mcu7t5v0__nand3_1
       13  256.838   gf180mcu_fd_sc_mcu7t5v0__nand4_1
      426 5.61E+03   gf180mcu_fd_sc_mcu7t5v0__nor2_1
       12  210.739   gf180mcu_fd_sc_mcu7t5v0__nor3_1
       34  746.368   gf180mcu_fd_sc_mcu7t5v0__nor4_1
      141  3.1E+03   gf180mcu_fd_sc_mcu7t5v0__oai211_1
      637 1.12E+04   gf180mcu_fd_sc_mcu7t5v0__oai21_1
       37  974.669   gf180mcu_fd_sc_mcu7t5v0__oai221_1
       78 1.71E+03   gf180mcu_fd_sc_mcu7t5v0__oai22_1
       90 2.17E+03   gf180mcu_fd_sc_mcu7t5v0__oai31_1
       26  684.902   gf180mcu_fd_sc_mcu7t5v0__oai32_1
       13  228.301   gf180mcu_fd_sc_mcu7t5v0__or2_1
        4   87.808   gf180mcu_fd_sc_mcu7t5v0__or3_1
        1   26.342   gf180mcu_fd_sc_mcu7t5v0__or4_1
       93 2.65E+03   gf180mcu_fd_sc_mcu7t5v0__xnor2_1
       68 3.58E+03   gf180mcu_fd_sc_mcu7t5v0__xnor3_1
     1022 2.69E+04   gf180mcu_fd_sc_mcu7t5v0__xor2_1
      227 1.15E+04   gf180mcu_fd_sc_mcu7t5v0__xor3_1

   Chip area for module '\ascon_core_adpt_encdec': 178785.868800
     of which used for sequential elements: 68441.945600 (38.28%)

```

terminal log:

```
[15:13:26] INFO     Starting a new run of the 'Classic' flow with the tag 'RUN_2026-07-03_15-13-26'.         flow.py:654
[15:13:26] INFO     Starting…                                                                          sequential.py:339
──────────────────────────────────────────────────── Verilator Lint ────────────────────────────────────────────────────
[15:13:26] VERBOSE  Running 'Verilator.Lint' at 'runs/RUN_2026-07-03_15-13-26/01-verilator-lint'…           step.py:1138
[15:13:26] VERBOSE  Logging subprocess to                                                                   step.py:1338
                    'runs/RUN_2026-07-03_15-13-26/01-verilator-lint/verilator-lint.log'…
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
    3 | module gf180mcu_fd_sc_mcu7t5v0__addf_1(S, A, CI, B, CO, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
                       ... For warning description see https://verilator.org/warn/TIMESCALEMOD?v=5.046
                       ... Use "/* verilator lint_off TIMESCALEMOD */" and lint_on around source to disable this
message.
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:24:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
   24 | module gf180mcu_fd_sc_mcu7t5v0__addf_2(S, A, CI, B, CO, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:45:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
   45 | module gf180mcu_fd_sc_mcu7t5v0__addf_4(S, A, CI, B, CO, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:66:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
   66 | module gf180mcu_fd_sc_mcu7t5v0__addf_func(S, A, CI, B, CO, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:87:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
   87 | module gf180mcu_fd_sc_mcu7t5v0__addh_1(CO, A, B, S, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:106:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  106 | module gf180mcu_fd_sc_mcu7t5v0__addh_2(CO, A, B, S, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:125:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  125 | module gf180mcu_fd_sc_mcu7t5v0__addh_4(A, B, CO, S, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:144:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  144 | module gf180mcu_fd_sc_mcu7t5v0__addh_func(CO, A, B, S, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:163:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  163 | module gf180mcu_fd_sc_mcu7t5v0__and2_1(A1, A2, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:180:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  180 | module gf180mcu_fd_sc_mcu7t5v0__and2_2(A1, A2, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:197:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  197 | module gf180mcu_fd_sc_mcu7t5v0__and2_4(A2, A1, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:214:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  214 | module gf180mcu_fd_sc_mcu7t5v0__and2_func(A1, A2, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:231:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  231 | module gf180mcu_fd_sc_mcu7t5v0__and3_1(A1, A2, A3, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:250:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  250 | module gf180mcu_fd_sc_mcu7t5v0__and3_2(A1, A2, A3, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:269:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  269 | module gf180mcu_fd_sc_mcu7t5v0__and3_4(A3, A2, A1, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:288:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  288 | module gf180mcu_fd_sc_mcu7t5v0__and3_func(A3, A2, A1, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:307:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  307 | module gf180mcu_fd_sc_mcu7t5v0__and4_1(A1, A2, A3, A4, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:328:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  328 | module gf180mcu_fd_sc_mcu7t5v0__and4_2(A1, A2, A3, A4, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:349:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  349 | module gf180mcu_fd_sc_mcu7t5v0__and4_4(A4, A3, A1, A2, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:370:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  370 | module gf180mcu_fd_sc_mcu7t5v0__and4_func(A1, A2, A3, A4, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:391:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  391 | module gf180mcu_fd_sc_mcu7t5v0__antenna(I, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:404:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  404 | module gf180mcu_fd_sc_mcu7t5v0__antenna_func(I, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:417:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  417 | module gf180mcu_fd_sc_mcu7t5v0__aoi211_1(A2, ZN, A1, B, C, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:438:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  438 | module gf180mcu_fd_sc_mcu7t5v0__aoi211_2(A2, A1, ZN, B, C, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:459:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  459 | module gf180mcu_fd_sc_mcu7t5v0__aoi211_4(ZN, A2, A1, B, C, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:480:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  480 | module gf180mcu_fd_sc_mcu7t5v0__aoi211_func(ZN, A2, A1, B, C, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:501:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  501 | module gf180mcu_fd_sc_mcu7t5v0__aoi21_1(A2, ZN, A1, B, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:520:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  520 | module gf180mcu_fd_sc_mcu7t5v0__aoi21_2(B, ZN, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:539:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  539 | module gf180mcu_fd_sc_mcu7t5v0__aoi21_4(A2, A1, ZN, B, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:558:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  558 | module gf180mcu_fd_sc_mcu7t5v0__aoi21_func(A2, A1, ZN, B, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:577:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  577 | module gf180mcu_fd_sc_mcu7t5v0__aoi221_1(B2, B1, ZN, C, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:600:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  600 | module gf180mcu_fd_sc_mcu7t5v0__aoi221_2(ZN, B2, C, B1, A1, A2, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:623:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  623 | module gf180mcu_fd_sc_mcu7t5v0__aoi221_4(ZN, B2, B1, C, A1, A2, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:646:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  646 | module gf180mcu_fd_sc_mcu7t5v0__aoi221_func(B2, B1, ZN, C, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:669:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  669 | module gf180mcu_fd_sc_mcu7t5v0__aoi222_1(C2, C1, B1, ZN, B2, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:694:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  694 | module gf180mcu_fd_sc_mcu7t5v0__aoi222_2(ZN, C2, C1, B2, B1, A1, A2, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:719:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  719 | module gf180mcu_fd_sc_mcu7t5v0__aoi222_4(ZN, C2, C1, B1, B2, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:744:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  744 | module gf180mcu_fd_sc_mcu7t5v0__aoi222_func(ZN, C2, C1, B1, B2, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:769:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  769 | module gf180mcu_fd_sc_mcu7t5v0__aoi22_1(B2, B1, ZN, A1, A2, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:790:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  790 | module gf180mcu_fd_sc_mcu7t5v0__aoi22_2(B2, B1, ZN, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:811:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  811 | module gf180mcu_fd_sc_mcu7t5v0__aoi22_4(B2, B1, ZN, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:832:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  832 | module gf180mcu_fd_sc_mcu7t5v0__aoi22_func(B2, B1, ZN, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:853:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  853 | module gf180mcu_fd_sc_mcu7t5v0__buf_1(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:868:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  868 | module gf180mcu_fd_sc_mcu7t5v0__buf_12(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:883:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  883 | module gf180mcu_fd_sc_mcu7t5v0__buf_16(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:898:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  898 | module gf180mcu_fd_sc_mcu7t5v0__buf_2(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:913:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  913 | module gf180mcu_fd_sc_mcu7t5v0__buf_20(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:928:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  928 | module gf180mcu_fd_sc_mcu7t5v0__buf_3(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:943:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  943 | module gf180mcu_fd_sc_mcu7t5v0__buf_4(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:958:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  958 | module gf180mcu_fd_sc_mcu7t5v0__buf_8(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:973:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  973 | module gf180mcu_fd_sc_mcu7t5v0__buf_func(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:988:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
  988 | module gf180mcu_fd_sc_mcu7t5v0__bufz_1(EN, I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1005:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1005 | module gf180mcu_fd_sc_mcu7t5v0__bufz_12(EN, I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1022:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1022 | module gf180mcu_fd_sc_mcu7t5v0__bufz_16(EN, I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1039:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1039 | module gf180mcu_fd_sc_mcu7t5v0__bufz_2(EN, I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1056:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1056 | module gf180mcu_fd_sc_mcu7t5v0__bufz_3(EN, I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1073:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1073 | module gf180mcu_fd_sc_mcu7t5v0__bufz_4(EN, I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1090:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1090 | module gf180mcu_fd_sc_mcu7t5v0__bufz_8(EN, I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1107:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1107 | module gf180mcu_fd_sc_mcu7t5v0__bufz_func(EN, I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1124:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1124 | module gf180mcu_fd_sc_mcu7t5v0__clkbuf_1(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1139:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1139 | module gf180mcu_fd_sc_mcu7t5v0__clkbuf_12(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1154:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1154 | module gf180mcu_fd_sc_mcu7t5v0__clkbuf_16(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1169:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1169 | module gf180mcu_fd_sc_mcu7t5v0__clkbuf_2(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1184:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1184 | module gf180mcu_fd_sc_mcu7t5v0__clkbuf_20(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1199:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1199 | module gf180mcu_fd_sc_mcu7t5v0__clkbuf_3(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1214:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1214 | module gf180mcu_fd_sc_mcu7t5v0__clkbuf_4(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1229:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1229 | module gf180mcu_fd_sc_mcu7t5v0__clkbuf_8(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1244:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1244 | module gf180mcu_fd_sc_mcu7t5v0__clkbuf_func(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1259:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1259 | module gf180mcu_fd_sc_mcu7t5v0__clkinv_1(I, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1274:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1274 | module gf180mcu_fd_sc_mcu7t5v0__clkinv_12(I, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1289:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1289 | module gf180mcu_fd_sc_mcu7t5v0__clkinv_16(I, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1304:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1304 | module gf180mcu_fd_sc_mcu7t5v0__clkinv_2(I, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1319:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1319 | module gf180mcu_fd_sc_mcu7t5v0__clkinv_20(I, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1334:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1334 | module gf180mcu_fd_sc_mcu7t5v0__clkinv_3(I, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1349:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1349 | module gf180mcu_fd_sc_mcu7t5v0__clkinv_4(I, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1364:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1364 | module gf180mcu_fd_sc_mcu7t5v0__clkinv_8(I, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1379:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1379 | module gf180mcu_fd_sc_mcu7t5v0__clkinv_func(I, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1394:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1394 | module gf180mcu_fd_sc_mcu7t5v0__dffnq_1(CLKN, D, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1411:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1411 | module gf180mcu_fd_sc_mcu7t5v0__dffnq_2(CLKN, D, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1428:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1428 | module gf180mcu_fd_sc_mcu7t5v0__dffnq_4(CLKN, D, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1445:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1445 | module gf180mcu_fd_sc_mcu7t5v0__dffnq_func(CLKN, D, Q, VDD, VSS, VNW, VPW, notifier);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1464:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1464 | module gf180mcu_fd_sc_mcu7t5v0__dffnrnq_1(CLKN, D, RN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1483:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1483 | module gf180mcu_fd_sc_mcu7t5v0__dffnrnq_2(CLKN, D, RN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1502:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1502 | module gf180mcu_fd_sc_mcu7t5v0__dffnrnq_4(CLKN, D, RN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1521:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1521 | module gf180mcu_fd_sc_mcu7t5v0__dffnrnq_func(CLKN, D, RN, Q, VDD, VSS, VNW, VPW, notifier);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1542:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1542 | module gf180mcu_fd_sc_mcu7t5v0__dffnrsnq_1(CLKN, D, SETN, RN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1563:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1563 | module gf180mcu_fd_sc_mcu7t5v0__dffnrsnq_2(CLKN, D, SETN, RN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1584:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1584 | module gf180mcu_fd_sc_mcu7t5v0__dffnrsnq_4(CLKN, D, SETN, RN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1605:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1605 | module gf180mcu_fd_sc_mcu7t5v0__dffnrsnq_func(CLKN, D, SETN, RN, Q, VDD, VSS, VNW, VPW, notifier);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1628:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1628 | module gf180mcu_fd_sc_mcu7t5v0__dffnsnq_1(CLKN, D, SETN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1647:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1647 | module gf180mcu_fd_sc_mcu7t5v0__dffnsnq_2(CLKN, D, SETN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1666:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1666 | module gf180mcu_fd_sc_mcu7t5v0__dffnsnq_4(CLKN, D, SETN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1685:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1685 | module gf180mcu_fd_sc_mcu7t5v0__dffnsnq_func(CLKN, D, SETN, Q, VDD, VSS, VNW, VPW, notifier);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1706:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1706 | module gf180mcu_fd_sc_mcu7t5v0__dffq_1(CLK, D, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1723:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1723 | module gf180mcu_fd_sc_mcu7t5v0__dffq_2(CLK, D, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1740:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1740 | module gf180mcu_fd_sc_mcu7t5v0__dffq_4(CLK, D, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1757:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1757 | module gf180mcu_fd_sc_mcu7t5v0__dffq_func(CLK, D, Q, VDD, VSS, VNW, VPW, notifier);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1776:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1776 | module gf180mcu_fd_sc_mcu7t5v0__dffrnq_1(CLK, D, RN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1795:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1795 | module gf180mcu_fd_sc_mcu7t5v0__dffrnq_2(CLK, D, RN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1814:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1814 | module gf180mcu_fd_sc_mcu7t5v0__dffrnq_4(CLK, D, RN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1833:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1833 | module gf180mcu_fd_sc_mcu7t5v0__dffrnq_func(CLK, D, RN, Q, VDD, VSS, VNW, VPW, notifier);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1854:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1854 | module gf180mcu_fd_sc_mcu7t5v0__dffrsnq_1(CLK, D, SETN, RN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1875:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1875 | module gf180mcu_fd_sc_mcu7t5v0__dffrsnq_2(CLK, D, SETN, RN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1896:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1896 | module gf180mcu_fd_sc_mcu7t5v0__dffrsnq_4(CLK, D, SETN, RN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1917:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1917 | module gf180mcu_fd_sc_mcu7t5v0__dffrsnq_func(CLK, D, SETN, RN, Q, VDD, VSS, VNW, VPW, notifier);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1940:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1940 | module gf180mcu_fd_sc_mcu7t5v0__dffsnq_1(CLK, D, SETN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1959:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1959 | module gf180mcu_fd_sc_mcu7t5v0__dffsnq_2(CLK, D, SETN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1978:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1978 | module gf180mcu_fd_sc_mcu7t5v0__dffsnq_4(CLK, D, SETN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:1997:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 1997 | module gf180mcu_fd_sc_mcu7t5v0__dffsnq_func(CLK, D, SETN, Q, VDD, VSS, VNW, VPW, notifier);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2018:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2018 | module gf180mcu_fd_sc_mcu7t5v0__dlya_1(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2033:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2033 | module gf180mcu_fd_sc_mcu7t5v0__dlya_2(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2048:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2048 | module gf180mcu_fd_sc_mcu7t5v0__dlya_4(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2063:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2063 | module gf180mcu_fd_sc_mcu7t5v0__dlya_func(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2078:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2078 | module gf180mcu_fd_sc_mcu7t5v0__dlyb_1(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2093:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2093 | module gf180mcu_fd_sc_mcu7t5v0__dlyb_2(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2108:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2108 | module gf180mcu_fd_sc_mcu7t5v0__dlyb_4(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2123:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2123 | module gf180mcu_fd_sc_mcu7t5v0__dlyb_func(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2138:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2138 | module gf180mcu_fd_sc_mcu7t5v0__dlyc_1(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2153:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2153 | module gf180mcu_fd_sc_mcu7t5v0__dlyc_2(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2168:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2168 | module gf180mcu_fd_sc_mcu7t5v0__dlyc_4(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2183:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2183 | module gf180mcu_fd_sc_mcu7t5v0__dlyc_func(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2198:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2198 | module gf180mcu_fd_sc_mcu7t5v0__dlyd_1(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2213:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2213 | module gf180mcu_fd_sc_mcu7t5v0__dlyd_2(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2228:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2228 | module gf180mcu_fd_sc_mcu7t5v0__dlyd_4(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2243:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2243 | module gf180mcu_fd_sc_mcu7t5v0__dlyd_func(I, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2258:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2258 | module gf180mcu_fd_sc_mcu7t5v0__endcap(VDD, VSS);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2265:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2265 | module gf180mcu_fd_sc_mcu7t5v0__endcap_func(VDD, VSS);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2272:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2272 | module gf180mcu_fd_sc_mcu7t5v0__fill_1(VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2283:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2283 | module gf180mcu_fd_sc_mcu7t5v0__fill_16(VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2294:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2294 | module gf180mcu_fd_sc_mcu7t5v0__fill_2(VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2305:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2305 | module gf180mcu_fd_sc_mcu7t5v0__fill_32(VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2316:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2316 | module gf180mcu_fd_sc_mcu7t5v0__fill_4(VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2327:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2327 | module gf180mcu_fd_sc_mcu7t5v0__fill_64(VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2338:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2338 | module gf180mcu_fd_sc_mcu7t5v0__fill_8(VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2349:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2349 | module gf180mcu_fd_sc_mcu7t5v0__fill_func(VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2360:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2360 | module gf180mcu_fd_sc_mcu7t5v0__fillcap_16(VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2371:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2371 | module gf180mcu_fd_sc_mcu7t5v0__fillcap_32(VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2382:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2382 | module gf180mcu_fd_sc_mcu7t5v0__fillcap_4(VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2393:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2393 | module gf180mcu_fd_sc_mcu7t5v0__fillcap_64(VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2404:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2404 | module gf180mcu_fd_sc_mcu7t5v0__fillcap_8(VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2415:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2415 | module gf180mcu_fd_sc_mcu7t5v0__fillcap_func(VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2426:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2426 | module gf180mcu_fd_sc_mcu7t5v0__filltie(VDD, VSS);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2433:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2433 | module gf180mcu_fd_sc_mcu7t5v0__filltie_func(VDD, VSS);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2440:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2440 | module gf180mcu_fd_sc_mcu7t5v0__hold(Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2453:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2453 | module gf180mcu_fd_sc_mcu7t5v0__hold_func(Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2466:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2466 | module gf180mcu_fd_sc_mcu7t5v0__icgtn_1(TE, E, CLKN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2485:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2485 | module gf180mcu_fd_sc_mcu7t5v0__icgtn_2(TE, E, CLKN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2504:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2504 | module gf180mcu_fd_sc_mcu7t5v0__icgtn_4(TE, E, CLKN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2523:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2523 | module gf180mcu_fd_sc_mcu7t5v0__icgtn_func(TE, E, CLKN, Q, VDD, VSS, VNW, VPW, notifier);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2544:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2544 | module gf180mcu_fd_sc_mcu7t5v0__icgtp_1(TE, E, CLK, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2563:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2563 | module gf180mcu_fd_sc_mcu7t5v0__icgtp_2(TE, E, CLK, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2582:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2582 | module gf180mcu_fd_sc_mcu7t5v0__icgtp_4(TE, E, CLK, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2601:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2601 | module gf180mcu_fd_sc_mcu7t5v0__icgtp_func(TE, E, CLK, Q, VDD, VSS, VNW, VPW, notifier);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2622:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2622 | module gf180mcu_fd_sc_mcu7t5v0__inv_1(I, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2637:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2637 | module gf180mcu_fd_sc_mcu7t5v0__inv_12(I, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2652:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2652 | module gf180mcu_fd_sc_mcu7t5v0__inv_16(I, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2667:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2667 | module gf180mcu_fd_sc_mcu7t5v0__inv_2(I, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2682:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2682 | module gf180mcu_fd_sc_mcu7t5v0__inv_20(I, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2697:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2697 | module gf180mcu_fd_sc_mcu7t5v0__inv_3(I, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2712:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2712 | module gf180mcu_fd_sc_mcu7t5v0__inv_4(I, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2727:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2727 | module gf180mcu_fd_sc_mcu7t5v0__inv_8(I, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2742:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2742 | module gf180mcu_fd_sc_mcu7t5v0__inv_func(I, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2757:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2757 | module gf180mcu_fd_sc_mcu7t5v0__invz_1(EN, ZN, I, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2774:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2774 | module gf180mcu_fd_sc_mcu7t5v0__invz_12(EN, I, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2791:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2791 | module gf180mcu_fd_sc_mcu7t5v0__invz_16(EN, I, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2808:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2808 | module gf180mcu_fd_sc_mcu7t5v0__invz_2(EN, ZN, I, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2825:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2825 | module gf180mcu_fd_sc_mcu7t5v0__invz_3(EN, I, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2842:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2842 | module gf180mcu_fd_sc_mcu7t5v0__invz_4(EN, I, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2859:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2859 | module gf180mcu_fd_sc_mcu7t5v0__invz_8(EN, I, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2876:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2876 | module gf180mcu_fd_sc_mcu7t5v0__invz_func(EN, ZN, I, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2893:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2893 | module gf180mcu_fd_sc_mcu7t5v0__latq_1(E, D, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2910:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2910 | module gf180mcu_fd_sc_mcu7t5v0__latq_2(E, D, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2927:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2927 | module gf180mcu_fd_sc_mcu7t5v0__latq_4(E, D, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2944:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2944 | module gf180mcu_fd_sc_mcu7t5v0__latq_func(E, D, Q, VDD, VSS, VNW, VPW, notifier);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2963:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2963 | module gf180mcu_fd_sc_mcu7t5v0__latrnq_1(E, D, RN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:2982:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 2982 | module gf180mcu_fd_sc_mcu7t5v0__latrnq_2(E, D, RN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3001:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3001 | module gf180mcu_fd_sc_mcu7t5v0__latrnq_4(E, D, RN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3020:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3020 | module gf180mcu_fd_sc_mcu7t5v0__latrnq_func(E, D, RN, Q, VDD, VSS, VNW, VPW, notifier);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3041:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3041 | module gf180mcu_fd_sc_mcu7t5v0__latrsnq_1(E, D, RN, SETN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3062:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3062 | module gf180mcu_fd_sc_mcu7t5v0__latrsnq_2(E, D, RN, SETN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3083:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3083 | module gf180mcu_fd_sc_mcu7t5v0__latrsnq_4(E, D, RN, SETN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3104:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3104 | module gf180mcu_fd_sc_mcu7t5v0__latrsnq_func(E, D, RN, SETN, Q, VDD, VSS, VNW, VPW, notifier);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3127:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3127 | module gf180mcu_fd_sc_mcu7t5v0__latsnq_1(E, D, SETN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3146:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3146 | module gf180mcu_fd_sc_mcu7t5v0__latsnq_2(E, D, SETN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3165:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3165 | module gf180mcu_fd_sc_mcu7t5v0__latsnq_4(E, D, SETN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3184:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3184 | module gf180mcu_fd_sc_mcu7t5v0__latsnq_func(E, D, SETN, Q, VDD, VSS, VNW, VPW, notifier);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3205:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3205 | module gf180mcu_fd_sc_mcu7t5v0__mux2_1(Z, I1, S, I0, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3224:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3224 | module gf180mcu_fd_sc_mcu7t5v0__mux2_2(Z, I1, S, I0, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3243:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3243 | module gf180mcu_fd_sc_mcu7t5v0__mux2_4(Z, I1, S, I0, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3262:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3262 | module gf180mcu_fd_sc_mcu7t5v0__mux2_func(Z, I1, S, I0, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3281:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3281 | module gf180mcu_fd_sc_mcu7t5v0__mux4_1(I2, S0, I3, Z, S1, I1, I0, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3306:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3306 | module gf180mcu_fd_sc_mcu7t5v0__mux4_2(I2, S0, I3, Z, S1, I1, I0, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3331:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3331 | module gf180mcu_fd_sc_mcu7t5v0__mux4_4(I2, S0, I3, Z, S1, I1, I0, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3356:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3356 | module gf180mcu_fd_sc_mcu7t5v0__mux4_func(I2, S0, I3, Z, S1, I1, I0, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3381:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3381 | module gf180mcu_fd_sc_mcu7t5v0__nand2_1(A2, A1, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3398:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3398 | module gf180mcu_fd_sc_mcu7t5v0__nand2_2(A1, A2, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3415:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3415 | module gf180mcu_fd_sc_mcu7t5v0__nand2_4(A1, A2, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3432:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3432 | module gf180mcu_fd_sc_mcu7t5v0__nand2_func(A1, A2, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3449:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3449 | module gf180mcu_fd_sc_mcu7t5v0__nand3_1(A3, ZN, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3468:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3468 | module gf180mcu_fd_sc_mcu7t5v0__nand3_2(ZN, A3, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3487:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3487 | module gf180mcu_fd_sc_mcu7t5v0__nand3_4(A2, ZN, A3, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3506:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3506 | module gf180mcu_fd_sc_mcu7t5v0__nand3_func(ZN, A3, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3525:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3525 | module gf180mcu_fd_sc_mcu7t5v0__nand4_1(A4, ZN, A3, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3546:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3546 | module gf180mcu_fd_sc_mcu7t5v0__nand4_2(ZN, A3, A1, A4, A2, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3567:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3567 | module gf180mcu_fd_sc_mcu7t5v0__nand4_4(A3, ZN, A4, A1, A2, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3588:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3588 | module gf180mcu_fd_sc_mcu7t5v0__nand4_func(A3, ZN, A4, A1, A2, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3609:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3609 | module gf180mcu_fd_sc_mcu7t5v0__nor2_1(A2, ZN, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3626:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3626 | module gf180mcu_fd_sc_mcu7t5v0__nor2_2(A2, ZN, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3643:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3643 | module gf180mcu_fd_sc_mcu7t5v0__nor2_4(ZN, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3660:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3660 | module gf180mcu_fd_sc_mcu7t5v0__nor2_func(ZN, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3677:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3677 | module gf180mcu_fd_sc_mcu7t5v0__nor3_1(A3, ZN, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3696:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3696 | module gf180mcu_fd_sc_mcu7t5v0__nor3_2(ZN, A3, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3715:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3715 | module gf180mcu_fd_sc_mcu7t5v0__nor3_4(A2, ZN, A3, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3734:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3734 | module gf180mcu_fd_sc_mcu7t5v0__nor3_func(A2, ZN, A3, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3753:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3753 | module gf180mcu_fd_sc_mcu7t5v0__nor4_1(A4, ZN, A3, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3774:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3774 | module gf180mcu_fd_sc_mcu7t5v0__nor4_2(A4, A3, ZN, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3795:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3795 | module gf180mcu_fd_sc_mcu7t5v0__nor4_4(A4, A3, ZN, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3816:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3816 | module gf180mcu_fd_sc_mcu7t5v0__nor4_func(A4, A3, ZN, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3837:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3837 | module gf180mcu_fd_sc_mcu7t5v0__oai211_1(A2, ZN, A1, B, C, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3858:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3858 | module gf180mcu_fd_sc_mcu7t5v0__oai211_2(A2, ZN, A1, B, C, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3879:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3879 | module gf180mcu_fd_sc_mcu7t5v0__oai211_4(A2, ZN, A1, B, C, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3900:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3900 | module gf180mcu_fd_sc_mcu7t5v0__oai211_func(A2, ZN, A1, B, C, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3921:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3921 | module gf180mcu_fd_sc_mcu7t5v0__oai21_1(A2, ZN, A1, B, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3940:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3940 | module gf180mcu_fd_sc_mcu7t5v0__oai21_2(B, ZN, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3959:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3959 | module gf180mcu_fd_sc_mcu7t5v0__oai21_4(A2, ZN, A1, B, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3978:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3978 | module gf180mcu_fd_sc_mcu7t5v0__oai21_func(A2, ZN, A1, B, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:3997:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 3997 | module gf180mcu_fd_sc_mcu7t5v0__oai221_1(B2, B1, C, ZN, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4020:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4020 | module gf180mcu_fd_sc_mcu7t5v0__oai221_2(B2, B1, ZN, C, A1, A2, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4043:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4043 | module gf180mcu_fd_sc_mcu7t5v0__oai221_4(ZN, B1, B2, C, A1, A2, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4066:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4066 | module gf180mcu_fd_sc_mcu7t5v0__oai221_func(B2, B1, C, ZN, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4089:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4089 | module gf180mcu_fd_sc_mcu7t5v0__oai222_1(C2, C1, B1, ZN, B2, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4114:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4114 | module gf180mcu_fd_sc_mcu7t5v0__oai222_2(ZN, C1, C2, B1, B2, A1, A2, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4139:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4139 | module gf180mcu_fd_sc_mcu7t5v0__oai222_4(C1, ZN, C2, B1, B2, A1, A2, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4164:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4164 | module gf180mcu_fd_sc_mcu7t5v0__oai222_func(C1, ZN, C2, B1, B2, A1, A2, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4189:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4189 | module gf180mcu_fd_sc_mcu7t5v0__oai22_1(B2, B1, ZN, A1, A2, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4210:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4210 | module gf180mcu_fd_sc_mcu7t5v0__oai22_2(B2, B1, ZN, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4231:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4231 | module gf180mcu_fd_sc_mcu7t5v0__oai22_4(B2, B1, ZN, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4252:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4252 | module gf180mcu_fd_sc_mcu7t5v0__oai22_func(B2, B1, ZN, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4273:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4273 | module gf180mcu_fd_sc_mcu7t5v0__oai31_1(B, A1, ZN, A2, A3, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4294:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4294 | module gf180mcu_fd_sc_mcu7t5v0__oai31_2(B, ZN, A3, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4315:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4315 | module gf180mcu_fd_sc_mcu7t5v0__oai31_4(A3, ZN, A1, A2, B, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4336:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4336 | module gf180mcu_fd_sc_mcu7t5v0__oai31_func(A3, ZN, A1, A2, B, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4357:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4357 | module gf180mcu_fd_sc_mcu7t5v0__oai32_1(A3, A2, A1, ZN, B1, B2, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4380:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4380 | module gf180mcu_fd_sc_mcu7t5v0__oai32_2(A3, A2, A1, ZN, B2, B1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4403:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4403 | module gf180mcu_fd_sc_mcu7t5v0__oai32_4(A2, A3, A1, ZN, B2, B1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4426:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4426 | module gf180mcu_fd_sc_mcu7t5v0__oai32_func(A2, A3, A1, ZN, B2, B1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4449:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4449 | module gf180mcu_fd_sc_mcu7t5v0__oai33_1(B3, B2, B1, ZN, A1, A2, A3, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4474:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4474 | module gf180mcu_fd_sc_mcu7t5v0__oai33_2(B3, B2, ZN, B1, A3, A2, A1, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4499:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4499 | module gf180mcu_fd_sc_mcu7t5v0__oai33_4(B2, B3, B1, ZN, A1, A2, A3, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4524:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4524 | module gf180mcu_fd_sc_mcu7t5v0__oai33_func(B3, B2, B1, ZN, A1, A2, A3, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4549:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4549 | module gf180mcu_fd_sc_mcu7t5v0__or2_1(A1, A2, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4566:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4566 | module gf180mcu_fd_sc_mcu7t5v0__or2_2(A1, A2, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4583:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4583 | module gf180mcu_fd_sc_mcu7t5v0__or2_4(A2, A1, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4600:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4600 | module gf180mcu_fd_sc_mcu7t5v0__or2_func(A2, A1, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4617:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4617 | module gf180mcu_fd_sc_mcu7t5v0__or3_1(A1, A2, A3, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4636:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4636 | module gf180mcu_fd_sc_mcu7t5v0__or3_2(A1, A2, A3, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4655:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4655 | module gf180mcu_fd_sc_mcu7t5v0__or3_4(A3, A2, A1, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4674:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4674 | module gf180mcu_fd_sc_mcu7t5v0__or3_func(A1, A2, A3, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4693:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4693 | module gf180mcu_fd_sc_mcu7t5v0__or4_1(A1, A2, A3, A4, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4714:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4714 | module gf180mcu_fd_sc_mcu7t5v0__or4_2(A1, A2, A3, A4, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4735:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4735 | module gf180mcu_fd_sc_mcu7t5v0__or4_4(A4, A3, A2, A1, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4756:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4756 | module gf180mcu_fd_sc_mcu7t5v0__or4_func(A1, A2, A3, A4, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4777:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4777 | module gf180mcu_fd_sc_mcu7t5v0__sdffq_1(SE, SI, D, CLK, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4798:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4798 | module gf180mcu_fd_sc_mcu7t5v0__sdffq_2(SE, SI, D, CLK, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4819:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4819 | module gf180mcu_fd_sc_mcu7t5v0__sdffq_4(SE, SI, D, CLK, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4840:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4840 | module gf180mcu_fd_sc_mcu7t5v0__sdffq_func(SE, SI, D, CLK, Q, VDD, VSS, VNW, VPW, notifier);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4863:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4863 | module gf180mcu_fd_sc_mcu7t5v0__sdffrnq_1(SE, SI, D, CLK, RN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4886:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4886 | module gf180mcu_fd_sc_mcu7t5v0__sdffrnq_2(SE, SI, D, CLK, RN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4909:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4909 | module gf180mcu_fd_sc_mcu7t5v0__sdffrnq_4(SE, SI, D, CLK, RN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4932:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4932 | module gf180mcu_fd_sc_mcu7t5v0__sdffrnq_func(SE, SI, D, CLK, RN, Q, VDD, VSS, VNW, VPW, notifier);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4957:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4957 | module gf180mcu_fd_sc_mcu7t5v0__sdffrsnq_1(SE, SI, D, CLK, SETN, RN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:4982:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 4982 | module gf180mcu_fd_sc_mcu7t5v0__sdffrsnq_2(SE, SI, D, CLK, SETN, RN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:5007:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 5007 | module gf180mcu_fd_sc_mcu7t5v0__sdffrsnq_4(SE, SI, D, CLK, SETN, RN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:5032:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 5032 | module gf180mcu_fd_sc_mcu7t5v0__sdffrsnq_func(SE, SI, D, CLK, SETN, RN, Q, VDD, VSS, VNW, VPW, notifier);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:5059:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 5059 | module gf180mcu_fd_sc_mcu7t5v0__sdffsnq_1(SE, SI, D, CLK, SETN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:5082:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 5082 | module gf180mcu_fd_sc_mcu7t5v0__sdffsnq_2(SE, SI, D, CLK, SETN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:5105:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 5105 | module gf180mcu_fd_sc_mcu7t5v0__sdffsnq_4(SE, SI, D, CLK, SETN, Q, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:5128:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 5128 | module gf180mcu_fd_sc_mcu7t5v0__sdffsnq_func(SE, SI, D, CLK, SETN, Q, VDD, VSS, VNW, VPW, notifier);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:5153:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 5153 | module gf180mcu_fd_sc_mcu7t5v0__tieh(Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:5166:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 5166 | module gf180mcu_fd_sc_mcu7t5v0__tieh_func(Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:5179:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 5179 | module gf180mcu_fd_sc_mcu7t5v0__tiel(ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:5192:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 5192 | module gf180mcu_fd_sc_mcu7t5v0__tiel_func(ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:5205:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 5205 | module gf180mcu_fd_sc_mcu7t5v0__xnor2_1(A2, A1, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:5222:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 5222 | module gf180mcu_fd_sc_mcu7t5v0__xnor2_2(A2, A1, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:5239:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 5239 | module gf180mcu_fd_sc_mcu7t5v0__xnor2_4(A2, A1, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:5256:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 5256 | module gf180mcu_fd_sc_mcu7t5v0__xnor2_func(A2, A1, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:5273:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 5273 | module gf180mcu_fd_sc_mcu7t5v0__xnor3_1(A2, A1, A3, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:5292:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 5292 | module gf180mcu_fd_sc_mcu7t5v0__xnor3_2(A2, A1, A3, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:5311:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 5311 | module gf180mcu_fd_sc_mcu7t5v0__xnor3_4(A2, A1, A3, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:5330:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 5330 | module gf180mcu_fd_sc_mcu7t5v0__xnor3_func(A2, A1, A3, ZN, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:5349:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 5349 | module gf180mcu_fd_sc_mcu7t5v0__xor2_1(A2, A1, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:5366:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 5366 | module gf180mcu_fd_sc_mcu7t5v0__xor2_2(A2, A1, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:5383:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 5383 | module gf180mcu_fd_sc_mcu7t5v0__xor2_4(A2, A1, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:5400:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 5400 | module gf180mcu_fd_sc_mcu7t5v0__xor2_func(A2, A1, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:5417:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 5417 | module gf180mcu_fd_sc_mcu7t5v0__xor3_1(A2, A1, A3, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:5436:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 5436 | module gf180mcu_fd_sc_mcu7t5v0__xor3_2(A2, A1, A3, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:5455:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 5455 | module gf180mcu_fd_sc_mcu7t5v0__xor3_4(A2, A1, A3, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v:5474:8: Timescale
missing on this module as other modules have it (IEEE 1800-2023 3.14.2.3)
 5474 | module gf180mcu_fd_sc_mcu7t5v0__xor3_func(A2, A1, A3, Z, VDD, VSS, VNW, VPW);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-TIMESCALEMOD: /foss/designs/ascon_pipelined/design.v:5:8: Timescale missing on this module as other modules
have it (IEEE 1800-2023 3.14.2.3)
    5 | module ascon_core_adpt_encdec (
      |        ^~~~~~~~~~~~~~~~~~~~~~
                       /foss/designs/ascon_pipelined/design.v:170:8: ... Location of module with timescale
  170 | module ascon_round_s1 (
      |        ^~~~~~~~~~~~~~
%Warning-WIDTHEXPAND: /foss/designs/ascon_pipelined/design.v:61:25: Operator EQ expects 32 bits on the RHS, but RHS's
VARREF 'ad_bytes' generates 5 bits.
                                                                  : ... note: In instance 'ascon_core_adpt_encdec'
   61 |             else if (ai == ad_bytes) ad_pad[ai*8 +: 8] = 8'h01;
      |                         ^~
                      ... For warning description see https://verilator.org/warn/WIDTHEXPAND?v=5.046
                      ... Use "/* verilator lint_off WIDTHEXPAND */" and lint_on around source to disable this message.
%Warning-WIDTHEXPAND: /foss/designs/ascon_pipelined/design.v:85:25: Operator EQ expects 32 bits on the RHS, but RHS's
VARREF 'din_bytes' generates 5 bits.
                                                                  : ... note: In instance 'ascon_core_adpt_encdec'
   85 |             else if (di == din_bytes) last_nrate[di*8 +: 8] = rate128[di*8 +: 8] ^ 8'h01;
      |                         ^~
- V e r i l a t i o n   R e p o r t: Verilator 5.046 2026-02-28 rev v5.046
- Verilator: Built from 0.279 MB sources in 302 modules, into 0.174 MB in 3 C++ files needing 0.000 MB
- Verilator: Walltime 1.572 s (elab=1.499, cvt=0.017, bld=0.000); cpu 0.067 s on 1 threads; allocated 35.492 MB
────────────────────────────────────────────── Lint Timing Errors Checker ──────────────────────────────────────────────
[15:13:29] VERBOSE  Running 'Checker.LintTimingConstructs' at                                               step.py:1138
                    'runs/RUN_2026-07-03_15-13-26/02-checker-linttimingconstructs'…
[15:13:29] INFO     Check for Lint Timing Errors clear.                                                   checker.py:412
───────────────────────────────────────────────── Lint Errors Checker ──────────────────────────────────────────────────
[15:13:29] VERBOSE  Running 'Checker.LintErrors' at 'runs/RUN_2026-07-03_15-13-26/03-checker-linterrors'…   step.py:1138
[15:13:29] INFO     Check for Lint errors clear.                                                          checker.py:131
──────────────────────────────────────────────── Lint Warnings Checker ─────────────────────────────────────────────────
[15:13:29] VERBOSE  Running 'Checker.LintWarnings' at                                                       step.py:1138
                    'runs/RUN_2026-07-03_15-13-26/04-checker-lintwarnings'…
[15:13:29] WARNING  301 Lint warnings found.                                                              checker.py:122
───────────────────────────────────────────────── Generate JSON Header ─────────────────────────────────────────────────
[15:13:29] VERBOSE  Running 'Yosys.JsonHeader' at 'runs/RUN_2026-07-03_15-13-26/05-yosys-jsonheader'…       step.py:1138
[15:13:30] VERBOSE  Logging subprocess to                                                                   step.py:1338
                    'runs/RUN_2026-07-03_15-13-26/05-yosys-jsonheader/yosys-jsonheader.log'…

 /----------------------------------------------------------------------------\
 |  yosys -- Yosys Open SYnthesis Suite                                       |
 |  Copyright (C) 2012 - 2026  Claire Xenia Wolf <claire@yosyshq.com>         |
 |  Distributed under an ISC-like license, type "license" to see terms        |
 \----------------------------------------------------------------------------/
 Yosys 0.64 (git sha1 6d2c445ae, g++ 13.3.0-6ubuntu2~24.04.1 -fPIC -O3)

1. Executing Verilog-2005 frontend:
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v
Parsing SystemVerilog input from
`/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/b391f0700b25449ab6569a2a1db01df1.bb.v' to AST
representation.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__addf_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__addf_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__addf_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__addf_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__addh_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__addh_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__addh_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__addh_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__and2_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__and2_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__and2_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__and2_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__and3_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__and3_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__and3_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__and3_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__and4_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__and4_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__and4_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__and4_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__antenna'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__antenna_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__aoi211_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__aoi211_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__aoi211_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__aoi211_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__aoi21_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__aoi21_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__aoi21_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__aoi21_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__aoi221_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__aoi221_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__aoi221_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__aoi221_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__aoi222_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__aoi222_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__aoi222_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__aoi222_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__aoi22_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__aoi22_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__aoi22_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__aoi22_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__buf_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__buf_12'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__buf_16'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__buf_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__buf_20'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__buf_3'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__buf_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__buf_8'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__buf_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__bufz_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__bufz_12'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__bufz_16'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__bufz_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__bufz_3'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__bufz_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__bufz_8'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__bufz_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__clkbuf_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__clkbuf_12'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__clkbuf_16'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__clkbuf_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__clkbuf_20'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__clkbuf_3'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__clkbuf_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__clkbuf_8'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__clkbuf_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__clkinv_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__clkinv_12'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__clkinv_16'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__clkinv_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__clkinv_20'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__clkinv_3'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__clkinv_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__clkinv_8'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__clkinv_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffnq_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffnq_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffnq_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffnq_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffnrnq_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffnrnq_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffnrnq_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffnrnq_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffnrsnq_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffnrsnq_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffnrsnq_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffnrsnq_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffnsnq_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffnsnq_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffnsnq_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffnsnq_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffq_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffq_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffq_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffq_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffrnq_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffrnq_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffrnq_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffrnq_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffrsnq_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffrsnq_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffrsnq_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffrsnq_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffsnq_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffsnq_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffsnq_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dffsnq_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dlya_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dlya_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dlya_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dlya_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dlyb_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dlyb_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dlyb_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dlyb_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dlyc_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dlyc_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dlyc_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dlyc_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dlyd_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dlyd_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dlyd_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__dlyd_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__endcap'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__endcap_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__fill_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__fill_16'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__fill_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__fill_32'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__fill_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__fill_64'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__fill_8'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__fill_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__fillcap_16'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__fillcap_32'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__fillcap_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__fillcap_64'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__fillcap_8'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__fillcap_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__filltie'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__filltie_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__hold'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__hold_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__icgtn_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__icgtn_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__icgtn_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__icgtn_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__icgtp_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__icgtp_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__icgtp_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__icgtp_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__inv_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__inv_12'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__inv_16'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__inv_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__inv_20'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__inv_3'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__inv_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__inv_8'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__inv_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__invz_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__invz_12'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__invz_16'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__invz_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__invz_3'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__invz_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__invz_8'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__invz_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__latq_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__latq_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__latq_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__latq_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__latrnq_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__latrnq_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__latrnq_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__latrnq_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__latrsnq_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__latrsnq_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__latrsnq_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__latrsnq_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__latsnq_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__latsnq_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__latsnq_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__latsnq_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__mux2_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__mux2_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__mux2_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__mux2_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__mux4_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__mux4_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__mux4_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__mux4_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__nand2_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__nand2_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__nand2_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__nand2_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__nand3_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__nand3_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__nand3_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__nand3_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__nand4_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__nand4_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__nand4_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__nand4_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__nor2_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__nor2_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__nor2_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__nor2_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__nor3_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__nor3_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__nor3_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__nor3_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__nor4_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__nor4_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__nor4_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__nor4_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai211_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai211_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai211_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai211_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai21_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai21_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai21_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai21_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai221_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai221_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai221_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai221_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai222_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai222_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai222_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai222_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai22_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai22_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai22_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai22_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai31_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai31_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai31_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai31_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai32_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai32_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai32_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai32_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai33_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai33_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai33_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__oai33_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__or2_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__or2_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__or2_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__or2_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__or3_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__or3_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__or3_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__or3_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__or4_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__or4_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__or4_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__or4_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__sdffq_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__sdffq_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__sdffq_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__sdffq_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__sdffrnq_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__sdffrnq_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__sdffrnq_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__sdffrnq_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__sdffrsnq_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__sdffrsnq_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__sdffrsnq_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__sdffrsnq_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__sdffsnq_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__sdffsnq_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__sdffsnq_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__sdffsnq_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__tieh'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__tieh_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__tiel'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__tiel_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__xnor2_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__xnor2_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__xnor2_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__xnor2_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__xnor3_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__xnor3_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__xnor3_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__xnor3_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__xor2_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__xor2_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__xor2_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__xor2_func'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__xor3_1'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__xor3_2'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__xor3_4'.
Generating RTLIL representation for module `\gf180mcu_fd_sc_mcu7t5v0__xor3_func'.
Successfully finished Verilog frontend.
wtaf

2. Executing Verilog-2005 frontend: /foss/designs/ascon_pipelined/design.v
Parsing SystemVerilog input from `/foss/designs/ascon_pipelined/design.v' to AST representation.
Storing AST representation for module `$abstract\ascon_core_adpt_encdec'.
Storing AST representation for module `$abstract\ascon_round_s1'.
Storing AST representation for module `$abstract\ascon_round_s2'.
Successfully finished Verilog frontend.

3. Executing HIERARCHY pass (managing design hierarchy).

4. Executing AST frontend in derive mode using pre-parsed AST for module `\ascon_core_adpt_encdec'.
Generating RTLIL representation for module `\ascon_core_adpt_encdec'.

4.1. Analyzing design hierarchy..
Top module:  \ascon_core_adpt_encdec

4.2. Executing AST frontend in derive mode using pre-parsed AST for module `\ascon_round_s2'.
Generating RTLIL representation for module `\ascon_round_s2'.

4.3. Executing AST frontend in derive mode using pre-parsed AST for module `\ascon_round_s1'.
Generating RTLIL representation for module `\ascon_round_s1'.

4.4. Analyzing design hierarchy..
Top module:  \ascon_core_adpt_encdec
Used module:     \ascon_round_s2
Used module:     \ascon_round_s1

4.5. Analyzing design hierarchy..
Top module:  \ascon_core_adpt_encdec
Used module:     \ascon_round_s2
Used module:     \ascon_round_s1
Removing unused module `$abstract\ascon_round_s2'.
Removing unused module `$abstract\ascon_round_s1'.
Removing unused module `$abstract\ascon_core_adpt_encdec'.
Removed 3 unused modules.
Renaming module ascon_core_adpt_encdec to ascon_core_adpt_encdec.

5. Executing PROC pass (convert processes to netlists).

5.1. Executing PROC_CLEAN pass (remove empty switches from decision trees).
Cleaned up 0 empty switches.

5.2. Executing PROC_RMDEAD pass (remove dead branches from decision trees).
Removed 1 dead cases from process $proc$/foss/designs/ascon_pipelined/design.v:104$160 in module ascon_core_adpt_encdec.
Marked 6 switch rules as full_case in process $proc$/foss/designs/ascon_pipelined/design.v:104$160 in module
ascon_core_adpt_encdec.
Marked 48 switch rules as full_case in process $proc$/foss/designs/ascon_pipelined/design.v:79$47 in module
ascon_core_adpt_encdec.
Marked 32 switch rules as full_case in process $proc$/foss/designs/ascon_pipelined/design.v:58$6 in module
ascon_core_adpt_encdec.
Marked 1 switch rules as full_case in process $proc$/foss/designs/ascon_pipelined/design.v:46$5 in module
ascon_core_adpt_encdec.
Removed a total of 1 dead cases.

5.3. Executing PROC_PRUNE pass (remove redundant assignments in processes).
Removed 2 redundant assignments.
Promoted 51 assignments to connections.

5.4. Executing PROC_INIT pass (extract init attributes).

5.5. Executing PROC_ARST pass (detect async resets in processes).
Found async reset \rst_n in `\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.

5.6. Executing PROC_ROM pass (convert switches to ROMs).
Converted 1 switch.
<suppressed ~88 debug messages>

5.7. Executing PROC_MUX pass (convert decision trees to multiplexers).
Creating decoders for process `\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
     1/23: $0\dout_valid[0:0]
     2/23: $0\done[0:0]
     3/23: $0\ph[0:0]
     4/23: $0\B0[63:0]
     5/23: $0\ci[3:0]
     6/23: $0\ret_st[2:0]
     7/23: $0\st[2:0]
     8/23: $0\t1_out[63:0]
     9/23: $0\t0_out[63:0]
    10/23: $0\auth_ok[0:0]
    11/23: $0\busy[0:0]
    12/23: $0\dout_bytes[4:0]
    13/23: $0\dout_data[127:0]
    14/23: $0\dout_last[0:0]
    15/23: $0\S0[63:0]
    16/23: $0\S4[63:0]
    17/23: $0\S3[63:0]
    18/23: $0\S2[63:0]
    19/23: $0\S1[63:0]
    20/23: $0\B4[63:0]
    21/23: $0\B3[63:0]
    22/23: $0\B2[63:0]
    23/23: $0\B1[63:0]
Creating decoders for process `\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:79$47'.
     1/48: $32\last_nrate[127:120]
     2/48: $31\last_nrate[127:120]
     3/48: $16\last_dout[127:120]
     4/48: $30\last_nrate[119:112]
     5/48: $29\last_nrate[119:112]
     6/48: $15\last_dout[119:112]
     7/48: $28\last_nrate[111:104]
     8/48: $27\last_nrate[111:104]
     9/48: $14\last_dout[111:104]
    10/48: $26\last_nrate[103:96]
    11/48: $25\last_nrate[103:96]
    12/48: $13\last_dout[103:96]
    13/48: $24\last_nrate[95:88]
    14/48: $23\last_nrate[95:88]
    15/48: $12\last_dout[95:88]
    16/48: $22\last_nrate[87:80]
    17/48: $21\last_nrate[87:80]
    18/48: $11\last_dout[87:80]
    19/48: $20\last_nrate[79:72]
    20/48: $19\last_nrate[79:72]
    21/48: $10\last_dout[79:72]
    22/48: $18\last_nrate[71:64]
    23/48: $17\last_nrate[71:64]
    24/48: $9\last_dout[71:64]
    25/48: $16\last_nrate[63:56]
    26/48: $15\last_nrate[63:56]
    27/48: $8\last_dout[63:56]
    28/48: $14\last_nrate[55:48]
    29/48: $13\last_nrate[55:48]
    30/48: $7\last_dout[55:48]
    31/48: $12\last_nrate[47:40]
    32/48: $11\last_nrate[47:40]
    33/48: $6\last_dout[47:40]
    34/48: $10\last_nrate[39:32]
    35/48: $9\last_nrate[39:32]
    36/48: $5\last_dout[39:32]
    37/48: $8\last_nrate[31:24]
    38/48: $7\last_nrate[31:24]
    39/48: $4\last_dout[31:24]
    40/48: $6\last_nrate[23:16]
    41/48: $5\last_nrate[23:16]
    42/48: $3\last_dout[23:16]
    43/48: $4\last_nrate[15:8]
    44/48: $3\last_nrate[15:8]
    45/48: $2\last_dout[15:8]
    46/48: $2\last_nrate[7:0]
    47/48: $1\last_nrate[7:0]
    48/48: $1\last_dout[7:0]
Creating decoders for process `\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:58$6'.
     1/32: $32\ad_pad[127:120]
     2/32: $31\ad_pad[127:120]
     3/32: $30\ad_pad[119:112]
     4/32: $29\ad_pad[119:112]
     5/32: $28\ad_pad[111:104]
     6/32: $27\ad_pad[111:104]
     7/32: $26\ad_pad[103:96]
     8/32: $25\ad_pad[103:96]
     9/32: $24\ad_pad[95:88]
    10/32: $23\ad_pad[95:88]
    11/32: $22\ad_pad[87:80]
    12/32: $21\ad_pad[87:80]
    13/32: $20\ad_pad[79:72]
    14/32: $19\ad_pad[79:72]
    15/32: $18\ad_pad[71:64]
    16/32: $17\ad_pad[71:64]
    17/32: $16\ad_pad[63:56]
    18/32: $15\ad_pad[63:56]
    19/32: $14\ad_pad[55:48]
    20/32: $13\ad_pad[55:48]
    21/32: $12\ad_pad[47:40]
    22/32: $11\ad_pad[47:40]
    23/32: $10\ad_pad[39:32]
    24/32: $9\ad_pad[39:32]
    25/32: $8\ad_pad[31:24]
    26/32: $7\ad_pad[31:24]
    27/32: $6\ad_pad[23:16]
    28/32: $5\ad_pad[23:16]
    29/32: $4\ad_pad[15:8]
    30/32: $3\ad_pad[15:8]
    31/32: $2\ad_pad[7:0]
    32/32: $1\ad_pad[7:0]
Creating decoders for process `\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:46$5'.
     1/1: $1\rcon[7:0]

5.8. Executing PROC_DLATCH pass (convert process syncs to latches).
No latch inferred for signal `\ascon_core_adpt_encdec.\last_dout' from process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:79$47'.
No latch inferred for signal `\ascon_core_adpt_encdec.\last_nrate' from process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:79$47'.
No latch inferred for signal `\ascon_core_adpt_encdec.\di' from process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:79$47'.
No latch inferred for signal `\ascon_core_adpt_encdec.\ad_pad' from process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:58$6'.
No latch inferred for signal `\ascon_core_adpt_encdec.\ai' from process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:58$6'.
No latch inferred for signal `\ascon_core_adpt_encdec.\rcon' from process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:46$5'.

5.9. Executing PROC_DFF pass (convert process syncs to FFs).
Creating register for signal `\ascon_core_adpt_encdec.\B1' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$857' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\B2' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$862' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\B3' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$867' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\B4' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$872' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\S1' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$877' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\S2' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$882' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\S3' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$887' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\S4' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$892' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\S0' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$897' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\dout_valid' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$902' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\dout_last' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$907' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\dout_data' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$912' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\dout_bytes' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$917' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\busy' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$922' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\done' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$927' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\auth_ok' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$932' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\t0_out' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$937' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\t1_out' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$942' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\st' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$947' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\ret_st' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$952' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\ci' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$957' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\B0' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$962' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\ph' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$967' with positive edge clock and positive level reset.

5.10. Executing PROC_MEMWR pass (convert process memory writes to cells).

5.11. Executing PROC_CLEAN pass (remove empty switches from decision trees).
Found and cleaned up 8 empty switches in `\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
Removing empty process `ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
Found and cleaned up 48 empty switches in `\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:79$47'.
Removing empty process `ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:79$47'.
Found and cleaned up 32 empty switches in `\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:58$6'.
Removing empty process `ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:58$6'.
Found and cleaned up 1 empty switch in `\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:46$5'.
Removing empty process `ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:46$5'.
Cleaned up 89 empty switches.

5.12. Executing OPT_EXPR pass (perform const folding).
Optimizing module ascon_core_adpt_encdec.
<suppressed ~89 debug messages>
Optimizing module ascon_round_s2.
<suppressed ~20 debug messages>
Optimizing module ascon_round_s1.

6. Executing FLATTEN pass (flatten design).
Deleting now unused module ascon_round_s2.
Deleting now unused module ascon_round_s1.
<suppressed ~2 debug messages>

7. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \ascon_core_adpt_encdec..
Removed 27 unused cells and 471 unused wires.
<suppressed ~57 debug messages>
────────────────────────────────────────────────────── Synthesis ───────────────────────────────────────────────────────
[15:13:31] VERBOSE  Running 'Yosys.Synthesis' at 'runs/RUN_2026-07-03_15-13-26/06-yosys-synthesis'…         step.py:1138
[15:13:31] VERBOSE  Logging subprocess to                                                                   step.py:1338
                    'runs/RUN_2026-07-03_15-13-26/06-yosys-synthesis/yosys-synthesis.log'…

 /----------------------------------------------------------------------------\
 |  yosys -- Yosys Open SYnthesis Suite                                       |
 |  Copyright (C) 2012 - 2026  Claire Xenia Wolf <claire@yosyshq.com>         |
 |  Distributed under an ISC-like license, type "license" to see terms        |
 \----------------------------------------------------------------------------/
 Yosys 0.64 (git sha1 6d2c445ae, g++ 13.3.0-6ubuntu2~24.04.1 -fPIC -O3)

1. Executing Liberty frontend:
/foss/pdks/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/lib/gf180mcu_fd_sc_mcu7t5v0__tt_025C_3v30.lib
Imported 229 cell types from liberty file.
[INFO] Using SDC file '/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/06-yosys-synthesis/synthesis.abc.sdc'
for ABC…wtaf

2. Executing Verilog-2005 frontend: /foss/designs/ascon_pipelined/design.v
Parsing SystemVerilog input from `/foss/designs/ascon_pipelined/design.v' to AST representation.
Storing AST representation for module `$abstract\ascon_core_adpt_encdec'.
Storing AST representation for module `$abstract\ascon_round_s1'.
Storing AST representation for module `$abstract\ascon_round_s2'.
Successfully finished Verilog frontend.

3. Executing HIERARCHY pass (managing design hierarchy).

4. Executing AST frontend in derive mode using pre-parsed AST for module `\ascon_core_adpt_encdec'.
Generating RTLIL representation for module `\ascon_core_adpt_encdec'.

4.1. Analyzing design hierarchy..
Top module:  \ascon_core_adpt_encdec

4.2. Executing AST frontend in derive mode using pre-parsed AST for module `\ascon_round_s2'.
Generating RTLIL representation for module `\ascon_round_s2'.

4.3. Executing AST frontend in derive mode using pre-parsed AST for module `\ascon_round_s1'.
Generating RTLIL representation for module `\ascon_round_s1'.

4.4. Analyzing design hierarchy..
Top module:  \ascon_core_adpt_encdec
Used module:     \ascon_round_s2
Used module:     \ascon_round_s1

4.5. Analyzing design hierarchy..
Top module:  \ascon_core_adpt_encdec
Used module:     \ascon_round_s2
Used module:     \ascon_round_s1
Removing unused module `$abstract\ascon_round_s2'.
Removing unused module `$abstract\ascon_round_s1'.
Removing unused module `$abstract\ascon_core_adpt_encdec'.
Removed 3 unused modules.
Renaming module ascon_core_adpt_encdec to ascon_core_adpt_encdec.

5. Executing ATTRMAP pass (move or copy attributes).

6. Executing HIERARCHY pass (managing design hierarchy).

6.1. Analyzing design hierarchy..
Top module:  \ascon_core_adpt_encdec
Used module:     \ascon_round_s2
Used module:     \ascon_round_s1

6.2. Analyzing design hierarchy..
Top module:  \ascon_core_adpt_encdec
Used module:     \ascon_round_s2
Used module:     \ascon_round_s1
Removed 0 unused modules.

7. Executing PROC_CLEAN pass (remove empty switches from decision trees).
Cleaned up 0 empty switches.

8. Executing PROC_RMDEAD pass (remove dead branches from decision trees).
Removed 1 dead cases from process $proc$/foss/designs/ascon_pipelined/design.v:104$160 in module ascon_core_adpt_encdec.
Marked 6 switch rules as full_case in process $proc$/foss/designs/ascon_pipelined/design.v:104$160 in module
ascon_core_adpt_encdec.
Marked 48 switch rules as full_case in process $proc$/foss/designs/ascon_pipelined/design.v:79$47 in module
ascon_core_adpt_encdec.
Marked 32 switch rules as full_case in process $proc$/foss/designs/ascon_pipelined/design.v:58$6 in module
ascon_core_adpt_encdec.
Marked 1 switch rules as full_case in process $proc$/foss/designs/ascon_pipelined/design.v:46$5 in module
ascon_core_adpt_encdec.
Removed a total of 1 dead cases.

9. Executing PROC_PRUNE pass (remove redundant assignments in processes).
Removed 2 redundant assignments.
Promoted 51 assignments to connections.

10. Executing PROC_INIT pass (extract init attributes).

11. Executing PROC_ARST pass (detect async resets in processes).
Found async reset \rst_n in `\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.

12. Executing PROC_ROM pass (convert switches to ROMs).
Converted 1 switch.
<suppressed ~88 debug messages>

13. Executing PROC_MUX pass (convert decision trees to multiplexers).
Creating decoders for process `\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
     1/23: $0\dout_valid[0:0]
     2/23: $0\done[0:0]
     3/23: $0\ph[0:0]
     4/23: $0\B0[63:0]
     5/23: $0\ci[3:0]
     6/23: $0\ret_st[2:0]
     7/23: $0\st[2:0]
     8/23: $0\t1_out[63:0]
     9/23: $0\t0_out[63:0]
    10/23: $0\auth_ok[0:0]
    11/23: $0\busy[0:0]
    12/23: $0\dout_bytes[4:0]
    13/23: $0\dout_data[127:0]
    14/23: $0\dout_last[0:0]
    15/23: $0\S0[63:0]
    16/23: $0\S4[63:0]
    17/23: $0\S3[63:0]
    18/23: $0\S2[63:0]
    19/23: $0\S1[63:0]
    20/23: $0\B4[63:0]
    21/23: $0\B3[63:0]
    22/23: $0\B2[63:0]
    23/23: $0\B1[63:0]
Creating decoders for process `\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:79$47'.
     1/48: $32\last_nrate[127:120]
     2/48: $31\last_nrate[127:120]
     3/48: $16\last_dout[127:120]
     4/48: $30\last_nrate[119:112]
     5/48: $29\last_nrate[119:112]
     6/48: $15\last_dout[119:112]
     7/48: $28\last_nrate[111:104]
     8/48: $27\last_nrate[111:104]
     9/48: $14\last_dout[111:104]
    10/48: $26\last_nrate[103:96]
    11/48: $25\last_nrate[103:96]
    12/48: $13\last_dout[103:96]
    13/48: $24\last_nrate[95:88]
    14/48: $23\last_nrate[95:88]
    15/48: $12\last_dout[95:88]
    16/48: $22\last_nrate[87:80]
    17/48: $21\last_nrate[87:80]
    18/48: $11\last_dout[87:80]
    19/48: $20\last_nrate[79:72]
    20/48: $19\last_nrate[79:72]
    21/48: $10\last_dout[79:72]
    22/48: $18\last_nrate[71:64]
    23/48: $17\last_nrate[71:64]
    24/48: $9\last_dout[71:64]
    25/48: $16\last_nrate[63:56]
    26/48: $15\last_nrate[63:56]
    27/48: $8\last_dout[63:56]
    28/48: $14\last_nrate[55:48]
    29/48: $13\last_nrate[55:48]
    30/48: $7\last_dout[55:48]
    31/48: $12\last_nrate[47:40]
    32/48: $11\last_nrate[47:40]
    33/48: $6\last_dout[47:40]
    34/48: $10\last_nrate[39:32]
    35/48: $9\last_nrate[39:32]
    36/48: $5\last_dout[39:32]
    37/48: $8\last_nrate[31:24]
    38/48: $7\last_nrate[31:24]
    39/48: $4\last_dout[31:24]
    40/48: $6\last_nrate[23:16]
    41/48: $5\last_nrate[23:16]
    42/48: $3\last_dout[23:16]
    43/48: $4\last_nrate[15:8]
    44/48: $3\last_nrate[15:8]
    45/48: $2\last_dout[15:8]
    46/48: $2\last_nrate[7:0]
    47/48: $1\last_nrate[7:0]
    48/48: $1\last_dout[7:0]
Creating decoders for process `\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:58$6'.
     1/32: $32\ad_pad[127:120]
     2/32: $31\ad_pad[127:120]
     3/32: $30\ad_pad[119:112]
     4/32: $29\ad_pad[119:112]
     5/32: $28\ad_pad[111:104]
     6/32: $27\ad_pad[111:104]
     7/32: $26\ad_pad[103:96]
     8/32: $25\ad_pad[103:96]
     9/32: $24\ad_pad[95:88]
    10/32: $23\ad_pad[95:88]
    11/32: $22\ad_pad[87:80]
    12/32: $21\ad_pad[87:80]
    13/32: $20\ad_pad[79:72]
    14/32: $19\ad_pad[79:72]
    15/32: $18\ad_pad[71:64]
    16/32: $17\ad_pad[71:64]
    17/32: $16\ad_pad[63:56]
    18/32: $15\ad_pad[63:56]
    19/32: $14\ad_pad[55:48]
    20/32: $13\ad_pad[55:48]
    21/32: $12\ad_pad[47:40]
    22/32: $11\ad_pad[47:40]
    23/32: $10\ad_pad[39:32]
    24/32: $9\ad_pad[39:32]
    25/32: $8\ad_pad[31:24]
    26/32: $7\ad_pad[31:24]
    27/32: $6\ad_pad[23:16]
    28/32: $5\ad_pad[23:16]
    29/32: $4\ad_pad[15:8]
    30/32: $3\ad_pad[15:8]
    31/32: $2\ad_pad[7:0]
    32/32: $1\ad_pad[7:0]
Creating decoders for process `\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:46$5'.
     1/1: $1\rcon[7:0]

14. Executing PROC_DLATCH pass (convert process syncs to latches).
No latch inferred for signal `\ascon_core_adpt_encdec.\last_dout' from process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:79$47'.
No latch inferred for signal `\ascon_core_adpt_encdec.\last_nrate' from process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:79$47'.
No latch inferred for signal `\ascon_core_adpt_encdec.\di' from process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:79$47'.
No latch inferred for signal `\ascon_core_adpt_encdec.\ad_pad' from process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:58$6'.
No latch inferred for signal `\ascon_core_adpt_encdec.\ai' from process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:58$6'.
No latch inferred for signal `\ascon_core_adpt_encdec.\rcon' from process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:46$5'.

15. Executing PROC_DFF pass (convert process syncs to FFs).
Creating register for signal `\ascon_core_adpt_encdec.\B1' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$857' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\B2' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$862' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\B3' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$867' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\B4' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$872' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\S1' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$877' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\S2' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$882' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\S3' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$887' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\S4' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$892' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\S0' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$897' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\dout_valid' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$902' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\dout_last' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$907' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\dout_data' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$912' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\dout_bytes' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$917' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\busy' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$922' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\done' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$927' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\auth_ok' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$932' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\t0_out' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$937' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\t1_out' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$942' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\st' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$947' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\ret_st' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$952' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\ci' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$957' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\B0' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$962' with positive edge clock and positive level reset.
Creating register for signal `\ascon_core_adpt_encdec.\ph' using process
`\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
  created $adff cell `$procdff$967' with positive edge clock and positive level reset.

16. Executing PROC_MEMWR pass (convert process memory writes to cells).

17. Executing PROC_CLEAN pass (remove empty switches from decision trees).
Found and cleaned up 8 empty switches in `\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
Removing empty process `ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:104$160'.
Found and cleaned up 48 empty switches in `\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:79$47'.
Removing empty process `ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:79$47'.
Found and cleaned up 32 empty switches in `\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:58$6'.
Removing empty process `ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:58$6'.
Found and cleaned up 1 empty switch in `\ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:46$5'.
Removing empty process `ascon_core_adpt_encdec.$proc$/foss/designs/ascon_pipelined/design.v:46$5'.
Cleaned up 89 empty switches.

18. Executing CHECK pass (checking for obvious problems).
Checking module ascon_core_adpt_encdec...
Checking module ascon_round_s2...
Checking module ascon_round_s1...
Found and reported 0 problems.

19. Executing OPT_EXPR pass (perform const folding).
Optimizing module ascon_core_adpt_encdec.
<suppressed ~89 debug messages>
Optimizing module ascon_round_s2.
<suppressed ~20 debug messages>
Optimizing module ascon_round_s1.

20. Executing FLATTEN pass (flatten design).
Deleting now unused module ascon_round_s2.
Deleting now unused module ascon_round_s1.
<suppressed ~2 debug messages>

21. Executing OPT_EXPR pass (perform const folding).
Optimizing module ascon_core_adpt_encdec.

22. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \ascon_core_adpt_encdec..
Removed 25 unused cells and 442 unused wires.
<suppressed ~26 debug messages>

23. Executing OPT_EXPR pass (perform const folding).
Optimizing module ascon_core_adpt_encdec.

24. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\ascon_core_adpt_encdec'.
Computing hashes of 488 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
Computing hashes of 400 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
<suppressed ~264 debug messages>
Removed a total of 88 cells.

25. Executing OPT_MUXTREE pass (detect dead branches in mux trees).
Running muxtree optimizer on module \ascon_core_adpt_encdec..
  Creating internal representation of mux trees.
  Evaluating internal representation of mux trees.
  Analyzing evaluation results.
    dead port 1/2 on $mux $procmux$775.
    dead port 1/2 on $mux $procmux$766.
    dead port 1/2 on $mux $procmux$757.
    dead port 1/2 on $mux $procmux$748.
    dead port 1/2 on $mux $procmux$739.
    dead port 1/2 on $mux $procmux$730.
    dead port 1/2 on $mux $procmux$721.
    dead port 1/2 on $mux $procmux$712.
    dead port 1/2 on $mux $procmux$700.
    dead port 1/2 on $mux $procmux$688.
    dead port 1/2 on $mux $procmux$676.
    dead port 1/2 on $mux $procmux$664.
    dead port 1/2 on $mux $procmux$652.
    dead port 1/2 on $mux $procmux$640.
    dead port 1/2 on $mux $procmux$628.
    dead port 1/2 on $mux $procmux$616.
    dead port 1/2 on $mux $procmux$604.
    dead port 1/2 on $mux $procmux$592.
    dead port 1/2 on $mux $procmux$580.
    dead port 1/2 on $mux $procmux$568.
    dead port 1/2 on $mux $procmux$556.
    dead port 1/2 on $mux $procmux$544.
    dead port 1/2 on $mux $procmux$532.
    dead port 1/2 on $mux $procmux$520.
    dead port 1/2 on $mux $procmux$847.
    dead port 1/2 on $mux $procmux$838.
    dead port 1/2 on $mux $procmux$829.
    dead port 1/2 on $mux $procmux$820.
    dead port 1/2 on $mux $procmux$811.
    dead port 1/2 on $mux $procmux$802.
    dead port 1/2 on $mux $procmux$793.
    dead port 1/2 on $mux $procmux$784.
Removed 32 multiplexer ports.
<suppressed ~237 debug messages>

26. Executing OPT_REDUCE pass (consolidate $*mux and $reduce_* inputs).
  Optimizing cells in module \ascon_core_adpt_encdec.
Performed a total of 0 changes.

27. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\ascon_core_adpt_encdec'.
Computing hashes of 368 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
Removed a total of 0 cells.

28. Executing OPT_DFF pass (perform DFF optimizations).

29. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \ascon_core_adpt_encdec..
Removed 0 unused cells and 120 unused wires.
<suppressed ~1 debug messages>

30. Executing OPT_EXPR pass (perform const folding).
Optimizing module ascon_core_adpt_encdec.

31. Rerunning OPT passes. (Maybe there is more to do…)

32. Executing OPT_MUXTREE pass (detect dead branches in mux trees).
Running muxtree optimizer on module \ascon_core_adpt_encdec..
  Creating internal representation of mux trees.
  Evaluating internal representation of mux trees.
  Analyzing evaluation results.
Removed 0 multiplexer ports.
<suppressed ~205 debug messages>

33. Executing OPT_REDUCE pass (consolidate $*mux and $reduce_* inputs).
  Optimizing cells in module \ascon_core_adpt_encdec.
Performed a total of 0 changes.

34. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\ascon_core_adpt_encdec'.
Computing hashes of 368 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
Removed a total of 0 cells.

35. Executing OPT_DFF pass (perform DFF optimizations).

36. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \ascon_core_adpt_encdec..

37. Executing OPT_EXPR pass (perform const folding).
Optimizing module ascon_core_adpt_encdec.

38. Executing FSM pass (extract and optimize FSM).

38.1. Executing FSM_DETECT pass (finding FSMs in design).
Not marking ascon_core_adpt_encdec.ret_st as FSM state register:
    Users of register don't seem to benefit from recoding.

38.2. Executing FSM_EXTRACT pass (extracting FSM from design).

38.3. Executing FSM_OPT pass (simple optimizations of FSMs).

38.4. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \ascon_core_adpt_encdec..

38.5. Executing FSM_OPT pass (simple optimizations of FSMs).

38.6. Executing FSM_RECODE pass (re-assigning FSM state encoding).

38.7. Executing FSM_INFO pass (dumping all available information on FSM cells).

38.8. Executing FSM_MAP pass (mapping FSMs to basic logic).

39. Executing OPT_EXPR pass (perform const folding).
Optimizing module ascon_core_adpt_encdec.

40. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\ascon_core_adpt_encdec'.
Computing hashes of 368 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
Removed a total of 0 cells.

41. Executing OPT_MUXTREE pass (detect dead branches in mux trees).
Running muxtree optimizer on module \ascon_core_adpt_encdec..
  Creating internal representation of mux trees.
  Evaluating internal representation of mux trees.
  Analyzing evaluation results.
Removed 0 multiplexer ports.
<suppressed ~205 debug messages>

42. Executing OPT_REDUCE pass (consolidate $*mux and $reduce_* inputs).
  Optimizing cells in module \ascon_core_adpt_encdec.
Performed a total of 0 changes.

43. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\ascon_core_adpt_encdec'.
Computing hashes of 368 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
Removed a total of 0 cells.

44. Executing OPT_DFF pass (perform DFF optimizations).
Adding EN signal on $procdff$967 ($adff) from module ascon_core_adpt_encdec (D = $0\ph[0:0], Q = \ph).
Adding EN signal on $procdff$962 ($adff) from module ascon_core_adpt_encdec (D = \b0, Q = \B0).
Adding EN signal on $procdff$957 ($adff) from module ascon_core_adpt_encdec (D = $0\ci[3:0], Q = \ci).
Adding EN signal on $procdff$952 ($adff) from module ascon_core_adpt_encdec (D = $0\ret_st[2:0], Q = \ret_st).
Adding EN signal on $procdff$947 ($adff) from module ascon_core_adpt_encdec (D = $0\st[2:0], Q = \st).
Adding EN signal on $procdff$942 ($adff) from module ascon_core_adpt_encdec (D =
$xor$/foss/designs/ascon_pipelined/design.v:130$166_Y, Q = \t1_out).
Adding EN signal on $procdff$937 ($adff) from module ascon_core_adpt_encdec (D =
$xor$/foss/designs/ascon_pipelined/design.v:130$165_Y, Q = \t0_out).
Adding EN signal on $procdff$932 ($adff) from module ascon_core_adpt_encdec (D =
$ternary$/foss/designs/ascon_pipelined/design.v:156$180_Y, Q = \auth_ok).
Adding EN signal on $procdff$922 ($adff) from module ascon_core_adpt_encdec (D = $0\busy[0:0], Q = \busy).
Adding EN signal on $procdff$917 ($adff) from module ascon_core_adpt_encdec (D = $procmux$373_Y, Q = \dout_bytes).
Adding EN signal on $procdff$912 ($adff) from module ascon_core_adpt_encdec (D = $procmux$382_Y, Q = \dout_data).
Adding EN signal on $procdff$907 ($adff) from module ascon_core_adpt_encdec (D = \din_last, Q = \dout_last).
Adding EN signal on $procdff$897 ($adff) from module ascon_core_adpt_encdec (D = $0\S0[63:0] [7:1], Q = \S0 [7:1]).
Adding EN signal on $procdff$897 ($adff) from module ascon_core_adpt_encdec (D = $0\S0[63:0] [0], Q = \S0 [0]).
Adding EN signal on $procdff$897 ($adff) from module ascon_core_adpt_encdec (D = $0\S0[63:0] [15:9], Q = \S0 [15:9]).
Adding EN signal on $procdff$897 ($adff) from module ascon_core_adpt_encdec (D = $0\S0[63:0] [8], Q = \S0 [8]).
Adding EN signal on $procdff$897 ($adff) from module ascon_core_adpt_encdec (D = $0\S0[63:0] [23:17], Q = \S0 [23:17]).
Adding EN signal on $procdff$897 ($adff) from module ascon_core_adpt_encdec (D = $0\S0[63:0] [16], Q = \S0 [16]).
Adding EN signal on $procdff$897 ($adff) from module ascon_core_adpt_encdec (D = $0\S0[63:0] [31:25], Q = \S0 [31:25]).
Adding EN signal on $procdff$897 ($adff) from module ascon_core_adpt_encdec (D = $0\S0[63:0] [24], Q = \S0 [24]).
Adding EN signal on $procdff$897 ($adff) from module ascon_core_adpt_encdec (D = $0\S0[63:0] [39:33], Q = \S0 [39:33]).
Adding EN signal on $procdff$897 ($adff) from module ascon_core_adpt_encdec (D = $0\S0[63:0] [32], Q = \S0 [32]).
Adding EN signal on $procdff$897 ($adff) from module ascon_core_adpt_encdec (D = $0\S0[63:0] [47:41], Q = \S0 [47:41]).
Adding EN signal on $procdff$897 ($adff) from module ascon_core_adpt_encdec (D = $0\S0[63:0] [40], Q = \S0 [40]).
Adding EN signal on $procdff$897 ($adff) from module ascon_core_adpt_encdec (D = $0\S0[63:0] [55:49], Q = \S0 [55:49]).
Adding EN signal on $procdff$897 ($adff) from module ascon_core_adpt_encdec (D = $0\S0[63:0] [48], Q = \S0 [48]).
Adding EN signal on $procdff$897 ($adff) from module ascon_core_adpt_encdec (D = $0\S0[63:0] [63:57], Q = \S0 [63:57]).
Adding EN signal on $procdff$897 ($adff) from module ascon_core_adpt_encdec (D = $0\S0[63:0] [56], Q = \S0 [56]).
Adding EN signal on $procdff$892 ($adff) from module ascon_core_adpt_encdec (D = $0\S4[63:0] [63], Q = \S4 [63]).
Adding EN signal on $procdff$892 ($adff) from module ascon_core_adpt_encdec (D = $0\S4[63:0] [62:0], Q = \S4 [62:0]).
Adding EN signal on $procdff$887 ($adff) from module ascon_core_adpt_encdec (D = $0\S3[63:0], Q = \S3).
Adding EN signal on $procdff$882 ($adff) from module ascon_core_adpt_encdec (D = $0\S2[63:0], Q = \S2).
Adding EN signal on $procdff$877 ($adff) from module ascon_core_adpt_encdec (D = $0\S1[63:0] [7:1], Q = \S1 [7:1]).
Adding EN signal on $procdff$877 ($adff) from module ascon_core_adpt_encdec (D = $0\S1[63:0] [0], Q = \S1 [0]).
Adding EN signal on $procdff$877 ($adff) from module ascon_core_adpt_encdec (D = $0\S1[63:0] [15:9], Q = \S1 [15:9]).
Adding EN signal on $procdff$877 ($adff) from module ascon_core_adpt_encdec (D = $0\S1[63:0] [8], Q = \S1 [8]).
Adding EN signal on $procdff$877 ($adff) from module ascon_core_adpt_encdec (D = $0\S1[63:0] [23:17], Q = \S1 [23:17]).
Adding EN signal on $procdff$877 ($adff) from module ascon_core_adpt_encdec (D = $0\S1[63:0] [16], Q = \S1 [16]).
Adding EN signal on $procdff$877 ($adff) from module ascon_core_adpt_encdec (D = $0\S1[63:0] [31:25], Q = \S1 [31:25]).
Adding EN signal on $procdff$877 ($adff) from module ascon_core_adpt_encdec (D = $0\S1[63:0] [24], Q = \S1 [24]).
Adding EN signal on $procdff$877 ($adff) from module ascon_core_adpt_encdec (D = $0\S1[63:0] [39:33], Q = \S1 [39:33]).
Adding EN signal on $procdff$877 ($adff) from module ascon_core_adpt_encdec (D = $0\S1[63:0] [32], Q = \S1 [32]).
Adding EN signal on $procdff$877 ($adff) from module ascon_core_adpt_encdec (D = $0\S1[63:0] [47:41], Q = \S1 [47:41]).
Adding EN signal on $procdff$877 ($adff) from module ascon_core_adpt_encdec (D = $0\S1[63:0] [40], Q = \S1 [40]).
Adding EN signal on $procdff$877 ($adff) from module ascon_core_adpt_encdec (D = $0\S1[63:0] [55:49], Q = \S1 [55:49]).
Adding EN signal on $procdff$877 ($adff) from module ascon_core_adpt_encdec (D = $0\S1[63:0] [48], Q = \S1 [48]).
Adding EN signal on $procdff$877 ($adff) from module ascon_core_adpt_encdec (D = $0\S1[63:0] [63:57], Q = \S1 [63:57]).
Adding EN signal on $procdff$877 ($adff) from module ascon_core_adpt_encdec (D = $0\S1[63:0] [56], Q = \S1 [56]).
Adding EN signal on $procdff$872 ($adff) from module ascon_core_adpt_encdec (D = \b4, Q = \B4).
Adding EN signal on $procdff$867 ($adff) from module ascon_core_adpt_encdec (D = \b3, Q = \B3).
Adding EN signal on $procdff$862 ($adff) from module ascon_core_adpt_encdec (D = \b2, Q = \B2).
Adding EN signal on $procdff$857 ($adff) from module ascon_core_adpt_encdec (D = \b1, Q = \B1).

45. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \ascon_core_adpt_encdec..
Removed 19 unused cells and 19 unused wires.
<suppressed ~20 debug messages>

46. Executing OPT_EXPR pass (perform const folding).
Optimizing module ascon_core_adpt_encdec.
<suppressed ~42 debug messages>

47. Rerunning OPT passes. (Maybe there is more to do…)

48. Executing OPT_MUXTREE pass (detect dead branches in mux trees).
Running muxtree optimizer on module \ascon_core_adpt_encdec..
  Creating internal representation of mux trees.
  Evaluating internal representation of mux trees.
  Analyzing evaluation results.
Removed 0 multiplexer ports.
<suppressed ~178 debug messages>

49. Executing OPT_REDUCE pass (consolidate $*mux and $reduce_* inputs).
  Optimizing cells in module \ascon_core_adpt_encdec.
Performed a total of 0 changes.

50. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\ascon_core_adpt_encdec'.
Computing hashes of 697 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
Computing hashes of 478 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
Computing hashes of 474 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
<suppressed ~669 debug messages>
Removed a total of 223 cells.

51. Executing OPT_DFF pass (perform DFF optimizations).

52. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \ascon_core_adpt_encdec..
Removed 0 unused cells and 223 unused wires.
<suppressed ~1 debug messages>

53. Executing OPT_EXPR pass (perform const folding).
Optimizing module ascon_core_adpt_encdec.

54. Rerunning OPT passes. (Maybe there is more to do…)

55. Executing OPT_MUXTREE pass (detect dead branches in mux trees).
Running muxtree optimizer on module \ascon_core_adpt_encdec..
  Creating internal representation of mux trees.
  Evaluating internal representation of mux trees.
  Analyzing evaluation results.
Removed 0 multiplexer ports.
<suppressed ~178 debug messages>

56. Executing OPT_REDUCE pass (consolidate $*mux and $reduce_* inputs).
  Optimizing cells in module \ascon_core_adpt_encdec.
Performed a total of 0 changes.

57. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\ascon_core_adpt_encdec'.
Computing hashes of 474 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
Removed a total of 0 cells.

58. Executing OPT_DFF pass (perform DFF optimizations).

59. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \ascon_core_adpt_encdec..

60. Executing OPT_EXPR pass (perform const folding).
Optimizing module ascon_core_adpt_encdec.

61. Executing WREDUCE pass (reducing word size of cells).
Removed top 28 address bits (of 32) from memory init port ascon_core_adpt_encdec.$auto$mem.cc:351:emit$247
($auto$proc_rom.cc:155:do_switch$245).
Removed top 2 bits (of 4) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1665
($ne).
Removed top 1 bits (of 3) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1648
($ne).
Removed top 2 bits (of 4) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1631
($ne).
Removed top 1 bits (of 3) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1614
($ne).
Removed top 2 bits (of 4) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1597
($ne).
Removed top 1 bits (of 3) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1580
($ne).
Removed top 2 bits (of 4) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1563
($ne).
Removed top 1 bits (of 3) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1546
($ne).
Removed top 2 bits (of 4) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1529
($ne).
Removed top 1 bits (of 3) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1512
($ne).
Removed top 2 bits (of 4) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1495
($ne).
Removed top 1 bits (of 3) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1478
($ne).
Removed top 2 bits (of 4) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1461
($ne).
Removed top 1 bits (of 3) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1444
($ne).
Removed top 2 bits (of 4) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1427
($ne).
Removed top 1 bits (of 3) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1410
($ne).
Removed top 2 bits (of 4) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1355
($ne).
Removed top 1 bits (of 3) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1338
($ne).
Removed top 2 bits (of 4) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1321
($ne).
Removed top 1 bits (of 3) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1304
($ne).
Removed top 2 bits (of 4) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1287
($ne).
Removed top 1 bits (of 3) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1270
($ne).
Removed top 2 bits (of 4) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1253
($ne).
Removed top 1 bits (of 3) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1236
($ne).
Removed top 2 bits (of 4) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1219
($ne).
Removed top 1 bits (of 3) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1202
($ne).
Removed top 2 bits (of 4) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1185
($ne).
Removed top 1 bits (of 3) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1168
($ne).
Removed top 2 bits (of 4) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1151
($ne).
Removed top 1 bits (of 3) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1134
($ne).
Removed top 2 bits (of 4) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1117
($ne).
Removed top 1 bits (of 3) from port B of cell ascon_core_adpt_encdec.$auto$opt_dff.cc:235:make_patterns_logic$1100
($ne).
Removed top 31 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:60$7
($lt).
Removed top 31 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:60$9
($lt).
Removed top 4 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:61$10
($eq).
Removed top 30 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:60$11
($lt).
Removed top 3 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:61$12
($eq).
Removed top 30 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:60$13
($lt).
Removed top 3 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:61$14
($eq).
Removed top 29 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:60$15
($lt).
Removed top 2 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:61$16
($eq).
Removed top 29 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:60$17
($lt).
Removed top 2 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:61$18
($eq).
Removed top 29 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:60$19
($lt).
Removed top 2 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:61$20
($eq).
Removed top 29 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:60$21
($lt).
Removed top 2 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:61$22
($eq).
Removed top 28 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:60$23
($lt).
Removed top 1 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:61$24
($eq).
Removed top 28 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:60$25
($lt).
Removed top 1 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:61$26
($eq).
Removed top 28 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:60$27
($lt).
Removed top 1 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:61$28
($eq).
Removed top 28 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:60$29
($lt).
Removed top 1 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:61$30
($eq).
Removed top 28 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:60$31
($lt).
Removed top 1 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:61$32
($eq).
Removed top 28 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:60$33
($lt).
Removed top 1 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:61$34
($eq).
Removed top 28 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:60$35
($lt).
Removed top 1 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:61$36
($eq).
Removed top 28 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:60$37
($lt).
Removed top 1 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:61$38
($eq).
Removed top 31 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:83$50
($lt).
Removed top 31 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:83$57
($lt).
Removed top 4 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:85$60
($eq).
Removed top 30 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:83$64
($lt).
Removed top 3 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:85$67
($eq).
Removed top 30 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:83$71
($lt).
Removed top 3 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:85$74
($eq).
Removed top 29 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:83$78
($lt).
Removed top 2 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:85$81
($eq).
Removed top 29 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:83$85
($lt).
Removed top 2 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:85$88
($eq).
Removed top 29 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:83$92
($lt).
Removed top 2 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:85$95
($eq).
Removed top 29 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:83$99
($lt).
Removed top 2 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:85$102
($eq).
Removed top 28 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:83$106
($lt).
Removed top 1 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:85$109
($eq).
Removed top 28 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:83$113
($lt).
Removed top 1 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:85$116
($eq).
Removed top 28 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:83$120
($lt).
Removed top 1 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:85$123
($eq).
Removed top 28 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:83$127
($lt).
Removed top 1 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:85$130
($eq).
Removed top 28 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:83$134
($lt).
Removed top 1 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:85$137
($eq).
Removed top 28 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:83$141
($lt).
Removed top 1 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:85$144
($eq).
Removed top 28 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:83$148
($lt).
Removed top 1 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:85$151
($eq).
Removed top 28 bits (of 32) from port A of cell ascon_core_adpt_encdec.$lt$/foss/designs/ascon_pipelined/design.v:83$155
($lt).
Removed top 1 bits (of 5) from port A of cell ascon_core_adpt_encdec.$eq$/foss/designs/ascon_pipelined/design.v:85$158
($eq).
Removed top 3 bits (of 4) from port B of cell ascon_core_adpt_encdec.$add$/foss/designs/ascon_pipelined/design.v:127$164
($add).
Removed top 1 bits (of 3) from port B of cell ascon_core_adpt_encdec.$procmux$432_CMP0 ($eq).
Removed top 1 bits (of 3) from port B of cell ascon_core_adpt_encdec.$procmux$464_CMP0 ($eq).
Removed top 2 bits (of 3) from port B of cell ascon_core_adpt_encdec.$procmux$515_CMP0 ($eq).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$517 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$529 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$541 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$553 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$565 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$577 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$589 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$601 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$613 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$625 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$637 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$649 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$661 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$673 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$685 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$697 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$709 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$718 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$727 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$736 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$745 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$754 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$763 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$772 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$781 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$790 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$799 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$808 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$817 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$826 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$835 ($mux).
Removed top 7 bits (of 8) from mux cell ascon_core_adpt_encdec.$procmux$844 ($mux).
Removed top 1 bits (of 64) from port A of cell
ascon_core_adpt_encdec.$flatten\u_s2.$or$/foss/designs/ascon_pipelined/design.v:218$203 ($or).
Removed top 17 bits (of 64) from port A of cell
ascon_core_adpt_encdec.$flatten\u_s2.$or$/foss/designs/ascon_pipelined/design.v:219$215 ($or).
Removed top 39 bits (of 64) from port A of cell
ascon_core_adpt_encdec.$flatten\u_s2.$or$/foss/designs/ascon_pipelined/design.v:217$199 ($or).
Removed top 6 bits (of 64) from port A of cell
ascon_core_adpt_encdec.$flatten\u_s2.$or$/foss/designs/ascon_pipelined/design.v:218$207 ($or).
Removed top 61 bits (of 64) from port A of cell
ascon_core_adpt_encdec.$flatten\u_s2.$or$/foss/designs/ascon_pipelined/design.v:217$195 ($or).
Removed top 7 bits (of 64) from port A of cell
ascon_core_adpt_encdec.$flatten\u_s2.$or$/foss/designs/ascon_pipelined/design.v:220$219 ($or).
Removed top 28 bits (of 64) from port A of cell
ascon_core_adpt_encdec.$flatten\u_s2.$or$/foss/designs/ascon_pipelined/design.v:216$191 ($or).
Removed top 10 bits (of 64) from port A of cell
ascon_core_adpt_encdec.$flatten\u_s2.$or$/foss/designs/ascon_pipelined/design.v:219$211 ($or).
Removed top 19 bits (of 64) from port A of cell
ascon_core_adpt_encdec.$flatten\u_s2.$or$/foss/designs/ascon_pipelined/design.v:216$187 ($or).
Removed top 41 bits (of 64) from port A of cell
ascon_core_adpt_encdec.$flatten\u_s2.$or$/foss/designs/ascon_pipelined/design.v:220$223 ($or).
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$10\ad_pad[39:32].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$10\last_nrate[39:32].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$12\ad_pad[47:40].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$12\last_nrate[47:40].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$14\ad_pad[55:48].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$14\last_nrate[55:48].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$16\ad_pad[63:56].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$16\last_nrate[63:56].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$18\ad_pad[71:64].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$18\last_nrate[71:64].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$20\ad_pad[79:72].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$20\last_nrate[79:72].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$22\ad_pad[87:80].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$22\last_nrate[87:80].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$24\ad_pad[95:88].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$24\last_nrate[95:88].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$26\ad_pad[103:96].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$26\last_nrate[103:96].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$28\ad_pad[111:104].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$28\last_nrate[111:104].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$2\ad_pad[7:0].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$2\last_nrate[7:0].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$30\ad_pad[119:112].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$30\last_nrate[119:112].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$32\ad_pad[127:120].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$32\last_nrate[127:120].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$4\ad_pad[15:8].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$4\last_nrate[15:8].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$6\ad_pad[23:16].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$6\last_nrate[23:16].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$8\ad_pad[31:24].
Removed top 7 bits (of 8) from wire ascon_core_adpt_encdec.$8\last_nrate[31:24].

62. Executing PEEPOPT pass (run peephole optimizers).

63. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \ascon_core_adpt_encdec..
Removed 0 unused cells and 32 unused wires.
<suppressed ~1 debug messages>

64. Executing ALUMACC pass (create $alu and $macc cells).
Extracting $alu and $macc cells in module ascon_core_adpt_encdec:
  creating $macc model for $add$/foss/designs/ascon_pipelined/design.v:127$164 ($add).
  creating $alu model for $macc $add$/foss/designs/ascon_pipelined/design.v:127$164.
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:60$11 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:60$13 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:60$15 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:60$17 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:60$19 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:60$21 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:60$23 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:60$25 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:60$27 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:60$29 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:60$31 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:60$33 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:60$35 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:60$37 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:60$7 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:60$9 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:83$106 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:83$113 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:83$120 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:83$127 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:83$134 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:83$141 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:83$148 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:83$155 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:83$50 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:83$57 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:83$64 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:83$71 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:83$78 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:83$85 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:83$92 ($lt): new $alu
  creating $alu model for $lt$/foss/designs/ascon_pipelined/design.v:83$99 ($lt): new $alu
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:61$10 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:60$9.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:61$12 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:60$11.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:61$14 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:60$13.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:61$16 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:60$15.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:61$18 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:60$17.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:61$20 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:60$19.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:61$22 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:60$21.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:61$24 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:60$23.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:61$26 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:60$25.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:61$28 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:60$27.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:61$30 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:60$29.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:61$32 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:60$31.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:61$34 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:60$33.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:61$36 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:60$35.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:61$38 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:60$37.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:85$102 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:83$99.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:85$109 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:83$106.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:85$116 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:83$113.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:85$123 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:83$120.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:85$130 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:83$127.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:85$137 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:83$134.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:85$144 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:83$141.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:85$151 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:83$148.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:85$158 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:83$155.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:85$60 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:83$57.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:85$67 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:83$64.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:85$74 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:83$71.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:85$81 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:83$78.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:85$88 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:83$85.
  creating $alu model for $eq$/foss/designs/ascon_pipelined/design.v:85$95 ($eq): merged with
$lt$/foss/designs/ascon_pipelined/design.v:83$92.
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:83$99,
$eq$/foss/designs/ascon_pipelined/design.v:85$102: $auto$alumacc.cc:512:replace_alu$1754
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:83$92,
$eq$/foss/designs/ascon_pipelined/design.v:85$95: $auto$alumacc.cc:512:replace_alu$1761
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:83$85,
$eq$/foss/designs/ascon_pipelined/design.v:85$88: $auto$alumacc.cc:512:replace_alu$1768
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:83$78,
$eq$/foss/designs/ascon_pipelined/design.v:85$81: $auto$alumacc.cc:512:replace_alu$1775
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:83$71,
$eq$/foss/designs/ascon_pipelined/design.v:85$74: $auto$alumacc.cc:512:replace_alu$1782
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:83$64,
$eq$/foss/designs/ascon_pipelined/design.v:85$67: $auto$alumacc.cc:512:replace_alu$1789
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:83$57,
$eq$/foss/designs/ascon_pipelined/design.v:85$60: $auto$alumacc.cc:512:replace_alu$1796
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:83$50: $auto$alumacc.cc:512:replace_alu$1803
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:83$155,
$eq$/foss/designs/ascon_pipelined/design.v:85$158: $auto$alumacc.cc:512:replace_alu$1808
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:83$148,
$eq$/foss/designs/ascon_pipelined/design.v:85$151: $auto$alumacc.cc:512:replace_alu$1815
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:83$141,
$eq$/foss/designs/ascon_pipelined/design.v:85$144: $auto$alumacc.cc:512:replace_alu$1822
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:83$134,
$eq$/foss/designs/ascon_pipelined/design.v:85$137: $auto$alumacc.cc:512:replace_alu$1829
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:83$127,
$eq$/foss/designs/ascon_pipelined/design.v:85$130: $auto$alumacc.cc:512:replace_alu$1836
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:83$120,
$eq$/foss/designs/ascon_pipelined/design.v:85$123: $auto$alumacc.cc:512:replace_alu$1843
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:83$113,
$eq$/foss/designs/ascon_pipelined/design.v:85$116: $auto$alumacc.cc:512:replace_alu$1850
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:83$106,
$eq$/foss/designs/ascon_pipelined/design.v:85$109: $auto$alumacc.cc:512:replace_alu$1857
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:60$9,
$eq$/foss/designs/ascon_pipelined/design.v:61$10: $auto$alumacc.cc:512:replace_alu$1864
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:60$7: $auto$alumacc.cc:512:replace_alu$1871
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:60$37,
$eq$/foss/designs/ascon_pipelined/design.v:61$38: $auto$alumacc.cc:512:replace_alu$1876
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:60$35,
$eq$/foss/designs/ascon_pipelined/design.v:61$36: $auto$alumacc.cc:512:replace_alu$1883
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:60$33,
$eq$/foss/designs/ascon_pipelined/design.v:61$34: $auto$alumacc.cc:512:replace_alu$1890
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:60$31,
$eq$/foss/designs/ascon_pipelined/design.v:61$32: $auto$alumacc.cc:512:replace_alu$1897
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:60$29,
$eq$/foss/designs/ascon_pipelined/design.v:61$30: $auto$alumacc.cc:512:replace_alu$1904
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:60$27,
$eq$/foss/designs/ascon_pipelined/design.v:61$28: $auto$alumacc.cc:512:replace_alu$1911
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:60$25,
$eq$/foss/designs/ascon_pipelined/design.v:61$26: $auto$alumacc.cc:512:replace_alu$1918
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:60$23,
$eq$/foss/designs/ascon_pipelined/design.v:61$24: $auto$alumacc.cc:512:replace_alu$1925
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:60$21,
$eq$/foss/designs/ascon_pipelined/design.v:61$22: $auto$alumacc.cc:512:replace_alu$1932
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:60$19,
$eq$/foss/designs/ascon_pipelined/design.v:61$20: $auto$alumacc.cc:512:replace_alu$1939
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:60$17,
$eq$/foss/designs/ascon_pipelined/design.v:61$18: $auto$alumacc.cc:512:replace_alu$1946
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:60$15,
$eq$/foss/designs/ascon_pipelined/design.v:61$16: $auto$alumacc.cc:512:replace_alu$1953
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:60$13,
$eq$/foss/designs/ascon_pipelined/design.v:61$14: $auto$alumacc.cc:512:replace_alu$1960
  creating $alu cell for $lt$/foss/designs/ascon_pipelined/design.v:60$11,
$eq$/foss/designs/ascon_pipelined/design.v:61$12: $auto$alumacc.cc:512:replace_alu$1967
  creating $alu cell for $add$/foss/designs/ascon_pipelined/design.v:127$164: $auto$alumacc.cc:512:replace_alu$1974
  created 33 $alu and 0 $macc cells.

65. Executing SHARE pass (SAT-based resource sharing).

66. Executing OPT_EXPR pass (perform const folding).
Optimizing module ascon_core_adpt_encdec.
<suppressed ~48 debug messages>

67. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\ascon_core_adpt_encdec'.
Computing hashes of 506 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
Removed a total of 0 cells.

68. Executing OPT_MUXTREE pass (detect dead branches in mux trees).
Running muxtree optimizer on module \ascon_core_adpt_encdec..
  Creating internal representation of mux trees.
  Evaluating internal representation of mux trees.
  Analyzing evaluation results.
Removed 0 multiplexer ports.
<suppressed ~178 debug messages>

69. Executing OPT_REDUCE pass (consolidate $*mux and $reduce_* inputs).
  Optimizing cells in module \ascon_core_adpt_encdec.
Performed a total of 0 changes.

70. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\ascon_core_adpt_encdec'.
Computing hashes of 506 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
Removed a total of 0 cells.

71. Executing OPT_DFF pass (perform DFF optimizations).

72. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \ascon_core_adpt_encdec..
Removed 16 unused cells and 78 unused wires.
<suppressed ~17 debug messages>

73. Executing OPT_EXPR pass (perform const folding).
Optimizing module ascon_core_adpt_encdec.

74. Rerunning OPT passes. (Maybe there is more to do…)

75. Executing OPT_MUXTREE pass (detect dead branches in mux trees).
Running muxtree optimizer on module \ascon_core_adpt_encdec..
  Creating internal representation of mux trees.
  Evaluating internal representation of mux trees.
  Analyzing evaluation results.
Removed 0 multiplexer ports.
<suppressed ~178 debug messages>

76. Executing OPT_REDUCE pass (consolidate $*mux and $reduce_* inputs).
  Optimizing cells in module \ascon_core_adpt_encdec.
Performed a total of 0 changes.

77. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\ascon_core_adpt_encdec'.
Computing hashes of 490 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
Removed a total of 0 cells.

78. Executing OPT_DFF pass (perform DFF optimizations).

79. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \ascon_core_adpt_encdec..

80. Executing OPT_EXPR pass (perform const folding).
Optimizing module ascon_core_adpt_encdec.

81. Executing MEMORY pass.

81.1. Executing OPT_MEM pass (optimize memories).
Performed a total of 0 transformations.

81.2. Executing OPT_MEM_PRIORITY pass (removing unnecessary memory write priority relations).
Performed a total of 0 transformations.

81.3. Executing OPT_MEM_FEEDBACK pass (finding memory read-to-write feedback paths).

81.4. Executing MEMORY_BMUX2ROM pass (converting muxes to ROMs).

81.5. Executing MEMORY_DFF pass (merging $dff cells to $memrd).
Checking read port `$auto$proc_rom.cc:155:do_switch$245'[0] in module `\ascon_core_adpt_encdec': no output FF found.
Checking read port address `$auto$proc_rom.cc:155:do_switch$245'[0] in module `\ascon_core_adpt_encdec': address FF has
async set and/or reset, not supported.

81.6. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \ascon_core_adpt_encdec..

81.7. Executing MEMORY_SHARE pass (consolidating $memrd/$memwr cells).

81.8. Executing OPT_MEM_WIDEN pass (optimize memories where all ports are wide).
Performed a total of 0 transformations.

81.9. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \ascon_core_adpt_encdec..

81.10. Executing MEMORY_COLLECT pass (generating $mem cells).

82. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \ascon_core_adpt_encdec..

83. Executing OPT_EXPR pass (perform const folding).
Optimizing module ascon_core_adpt_encdec.
<suppressed ~101 debug messages>

84. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\ascon_core_adpt_encdec'.
Computing hashes of 446 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
Computing hashes of 423 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
<suppressed ~69 debug messages>
Removed a total of 23 cells.

85. Executing OPT_DFF pass (perform DFF optimizations).

86. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \ascon_core_adpt_encdec..
Removed 8 unused cells and 104 unused wires.
<suppressed ~9 debug messages>

87. Executing MEMORY_MAP pass (converting memories to logic and flip-flops).
Mapping memory $auto$proc_rom.cc:155:do_switch$245 in module \ascon_core_adpt_encdec:
  created 16 $dff cells and 0 static cells of width 8.
  read interface: 0 $dff and 15 $mux cells.
  write interface: 0 write mux blocks.

88. Executing OPT_EXPR pass (perform const folding).
Optimizing module ascon_core_adpt_encdec.
<suppressed ~3 debug messages>

89. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\ascon_core_adpt_encdec'.
Computing hashes of 426 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
Removed a total of 0 cells.

90. Executing OPT_MUXTREE pass (detect dead branches in mux trees).
Running muxtree optimizer on module \ascon_core_adpt_encdec..
  Creating internal representation of mux trees.
  Evaluating internal representation of mux trees.
  Analyzing evaluation results.
Removed 0 multiplexer ports.
<suppressed ~114 debug messages>

91. Executing OPT_REDUCE pass (consolidate $*mux and $reduce_* inputs).
  Optimizing cells in module \ascon_core_adpt_encdec.
    Consolidated identical input bits for $mux cell $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][3][3]$2069:
      Old ports: A=8'11010010, B=8'11000011, Y=$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][1]$b$2053
      New ports: A=2'10, B=2'01, Y={ $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][1]$b$2053 [4]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][1]$b$2053 [0] }
      New connections: { $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][1]$b$2053 [7:5]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][1]$b$2053 [3:1] } = 6'110001
    Consolidated identical input bits for $mux cell $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][3][2]$2066:
      Old ports: A=8'11110000, B=8'11100001, Y=$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][1]$a$2052
      New ports: A=2'10, B=2'01, Y={ $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][1]$a$2052 [4]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][1]$a$2052 [0] }
      New connections: { $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][1]$a$2052 [7:5]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][1]$a$2052 [3:1] } = 6'111000
    Consolidated identical input bits for $mux cell $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][3][6]$2078:
      Old ports: A=8'01111000, B=8'01101001, Y=$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][3]$a$2058
      New ports: A=2'10, B=2'01, Y={ $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][3]$a$2058 [4]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][3]$a$2058 [0] }
      New connections: { $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][3]$a$2058 [7:5]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][3]$a$2058 [3:1] } = 6'011100
    Consolidated identical input bits for $mux cell $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][3][5]$2075:
      Old ports: A=8'10010110, B=8'10000111, Y=$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][2]$b$2056
      New ports: A=2'10, B=2'01, Y={ $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][2]$b$2056 [4]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][2]$b$2056 [0] }
      New connections: { $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][2]$b$2056 [7:5]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][2]$b$2056 [3:1] } = 6'100011
    Consolidated identical input bits for $mux cell $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][3][4]$2072:
      Old ports: A=8'10110100, B=8'10100101, Y=$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][2]$a$2055
      New ports: A=2'10, B=2'01, Y={ $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][2]$a$2055 [4]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][2]$a$2055 [0] }
      New connections: { $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][2]$a$2055 [7:5]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][2]$a$2055 [3:1] } = 6'101010
    Consolidated identical input bits for $mux cell $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][3][7]$2081:
      Old ports: A=8'01011010, B=8'01001011, Y=$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][3]$b$2059
      New ports: A=2'10, B=2'01, Y={ $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][3]$b$2059 [4]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][3]$b$2059 [0] }
      New connections: { $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][3]$b$2059 [7:5]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][3]$b$2059 [3:1] } = 6'010101
    New ctrl vector for $pmux cell $procmux$257: $procmux$274_CMP
    New ctrl vector for $pmux cell $procmux$290: { $procmux$274_CMP $auto$opt_reduce.cc:137:opt_pmux$2085 }
    New ctrl vector for $pmux cell $procmux$332: { $procmux$274_CMP $procmux$348_CMP \ad_ready $procmux$341_CMP
\din_ready $0\done[0:0] }
    Consolidated identical input bits for $mux cell $procmux$336:
      Old ports: A=3'001, B=3'110, Y=$procmux$336_Y
      New ports: A=2'01, B=2'10, Y=$procmux$336_Y [1:0]
      New connections: $procmux$336_Y [2] = $procmux$336_Y [1]
    Consolidated identical input bits for $mux cell $procmux$345:
      Old ports: A=3'001, B=3'100, Y=$procmux$345_Y
      New ports: A=2'01, B=2'10, Y={ $procmux$345_Y [2] $procmux$345_Y [0] }
      New connections: $procmux$345_Y [1] = 1'0
    Consolidated identical input bits for $mux cell $ternary$/foss/designs/ascon_pipelined/design.v:135$169:
      Old ports: A=3'011, B=3'100, Y=$procmux$323_Y
      New ports: A=2'01, B=2'10, Y={ $procmux$323_Y [2] $procmux$323_Y [0] }
      New connections: $procmux$323_Y [1] = $procmux$323_Y [0]
  Optimizing cells in module \ascon_core_adpt_encdec.
    Consolidated identical input bits for $mux cell $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][3]$2057:
      Old ports: A=$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][3]$a$2058,
B=$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][3]$b$2059,
Y=$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][1]$b$2047
      New ports: A={ 1'1 $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][3]$a$2058 [4] 1'0
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][3]$a$2058 [0] }, B={ 1'0
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][3]$b$2059 [4] 1'1
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][3]$b$2059 [0] }, Y={
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][1]$b$2047 [5:4]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][1]$b$2047 [1:0] }
      New connections: { $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][1]$b$2047 [7:6]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][1]$b$2047 [3:2] } = 4'0110
    Consolidated identical input bits for $mux cell $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][2]$2054:
      Old ports: A=$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][2]$a$2055,
B=$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][2]$b$2056,
Y=$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][1]$a$2046
      New ports: A={ 1'1 $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][2]$a$2055 [4] 1'0
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][2]$a$2055 [0] }, B={ 1'0
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][2]$b$2056 [4] 1'1
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][2]$b$2056 [0] }, Y={
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][1]$a$2046 [5:4]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][1]$a$2046 [1:0] }
      New connections: { $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][1]$a$2046 [7:6]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][1]$a$2046 [3:2] } = 4'1001
    Consolidated identical input bits for $mux cell $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][1]$2051:
      Old ports: A=$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][1]$a$2052,
B=$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][1]$b$2053,
Y=$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][0]$b$2044
      New ports: A={ 1'1 $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][1]$a$2052 [4] 1'0
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][1]$a$2052 [0] }, B={ 1'0
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][1]$b$2053 [4] 1'1
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][1]$b$2053 [0] }, Y={
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][0]$b$2044 [5:4]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][0]$b$2044 [1:0] }
      New connections: { $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][0]$b$2044 [7:6]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][0]$b$2044 [3:2] } = 4'1100
  Optimizing cells in module \ascon_core_adpt_encdec.
    Consolidated identical input bits for $mux cell $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][1]$2045:
      Old ports: A=$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][1]$a$2046,
B=$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][1]$b$2047,
Y=$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][0][0]$b$2041
      New ports: A={ $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][1]$a$2046 [5:4] 2'01
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][1]$a$2046 [1:0] }, B={
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][1]$b$2047 [5:4] 2'10
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][1]$b$2047 [1:0] },
Y=$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][0][0]$b$2041 [5:0]
      New connections: $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][0][0]$b$2041 [7:6] = {
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][0][0]$b$2041 [2]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][0][0]$b$2041 [3] }
    Consolidated identical input bits for $mux cell $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][0]$2042:
      Old ports: A=8'00000000, B=$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][0]$b$2044,
Y=$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][0][0]$a$2040
      New ports: A=5'00000, B={ 1'1 $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][0]$b$2044 [5:4]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][0]$b$2044 [1:0] }, Y={
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][0][0]$a$2040 [6:4]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][0][0]$a$2040 [1:0] }
      New connections: { $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][0][0]$a$2040 [7]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][0][0]$a$2040 [3:2] } = {
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][0][0]$a$2040 [6] 2'00 }
  Optimizing cells in module \ascon_core_adpt_encdec.
Performed a total of 17 changes.

92. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\ascon_core_adpt_encdec'.
Computing hashes of 427 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
Computing hashes of 422 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
Computing hashes of 420 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
<suppressed ~21 debug messages>
Removed a total of 7 cells.

93. Executing OPT_SHARE pass.

94. Executing OPT_DFF pass (perform DFF optimizations).

95. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \ascon_core_adpt_encdec..
Removed 0 unused cells and 26 unused wires.
<suppressed ~1 debug messages>

96. Executing OPT_EXPR pass (perform const folding).
Optimizing module ascon_core_adpt_encdec.
<suppressed ~1 debug messages>

97. Rerunning OPT passes. (Maybe there is more to do…)

98. Executing OPT_MUXTREE pass (detect dead branches in mux trees).
Running muxtree optimizer on module \ascon_core_adpt_encdec..
  Creating internal representation of mux trees.
  Evaluating internal representation of mux trees.
  Analyzing evaluation results.
Removed 0 multiplexer ports.
<suppressed ~116 debug messages>

99. Executing OPT_REDUCE pass (consolidate $*mux and $reduce_* inputs).
  Optimizing cells in module \ascon_core_adpt_encdec.
    Consolidated identical input bits for $mux cell $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][3]$2057:
      Old ports: A={ 1'1 $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][1]$a$2052 [4] 1'0
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][1]$a$2052 [0] }, B={ 1'0
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][1]$a$2052 [4] 1'1
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][1]$a$2052 [0] }, Y={
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][0]$b$2044 [5:4]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][0]$b$2044 [1:0] }
      New ports: A=2'10, B=2'01, Y={ $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][0]$b$2044 [5]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][0]$b$2044 [1] }
      New connections: { $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][0]$b$2044 [4]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][0]$b$2044 [0] } = {
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][1]$a$2052 [4]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][2][1]$a$2052 [0] }
    Consolidated identical input bits for $mux cell $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][1]$2045:
      Old ports: A={ $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][0]$b$2044 [5:4] 2'01
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][0]$b$2044 [1:0] }, B={
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][0]$b$2044 [5:4] 2'10
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][0]$b$2044 [1:0] },
Y=$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][0][0]$b$2041 [5:0]
      New ports: A=2'01, B=2'10, Y=$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][0][0]$b$2041 [3:2]
      New connections: { $memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][0][0]$b$2041 [5:4]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][0][0]$b$2041 [1:0] } = {
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][0]$b$2044 [5:4]
$memory$auto$proc_rom.cc:155:do_switch$245$rdmux[0][1][0]$b$2044 [1:0] }
  Optimizing cells in module \ascon_core_adpt_encdec.
Performed a total of 2 changes.

100. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\ascon_core_adpt_encdec'.
Computing hashes of 420 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
Removed a total of 0 cells.

101. Executing OPT_SHARE pass.

102. Executing OPT_DFF pass (perform DFF optimizations).

103. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \ascon_core_adpt_encdec..
Removed 0 unused cells and 2 unused wires.
<suppressed ~1 debug messages>

104. Executing OPT_EXPR pass (perform const folding).
Optimizing module ascon_core_adpt_encdec.

105. Rerunning OPT passes. (Maybe there is more to do…)

106. Executing OPT_MUXTREE pass (detect dead branches in mux trees).
Running muxtree optimizer on module \ascon_core_adpt_encdec..
  Creating internal representation of mux trees.
  Evaluating internal representation of mux trees.
  Analyzing evaluation results.
Removed 0 multiplexer ports.
<suppressed ~111 debug messages>

107. Executing OPT_REDUCE pass (consolidate $*mux and $reduce_* inputs).
  Optimizing cells in module \ascon_core_adpt_encdec.
Performed a total of 0 changes.

108. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\ascon_core_adpt_encdec'.
Computing hashes of 420 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
Removed a total of 0 cells.

109. Executing OPT_SHARE pass.

110. Executing OPT_DFF pass (perform DFF optimizations).

111. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \ascon_core_adpt_encdec..

112. Executing OPT_EXPR pass (perform const folding).
Optimizing module ascon_core_adpt_encdec.

113. Executing TECHMAP pass (map to technology primitives).

113.1. Executing Verilog-2005 frontend: /foss/tools/yosys/bin/../share/yosys/techmap.v
Parsing Verilog input from `/foss/tools/yosys/bin/../share/yosys/techmap.v' to AST representation.
Generating RTLIL representation for module `\_90_simplemap_bool_ops'.
Generating RTLIL representation for module `\_90_simplemap_reduce_ops'.
Generating RTLIL representation for module `\_90_simplemap_logic_ops'.
Generating RTLIL representation for module `\_90_simplemap_compare_ops'.
Generating RTLIL representation for module `\_90_simplemap_various'.
Generating RTLIL representation for module `\_90_simplemap_registers'.
Generating RTLIL representation for module `\_90_shift_ops_shr_shl_sshl_sshr'.
Generating RTLIL representation for module `\_90_shift_shiftx'.
Generating RTLIL representation for module `\_90_fa'.
Generating RTLIL representation for module `\_90_lcu_brent_kung'.
Generating RTLIL representation for module `\_90_alu'.
Generating RTLIL representation for module `\_90_macc'.
Generating RTLIL representation for module `\_90_alumacc'.
Generating RTLIL representation for module `$__div_mod_u'.
Generating RTLIL representation for module `$__div_mod_trunc'.
Generating RTLIL representation for module `\_90_div'.
Generating RTLIL representation for module `\_90_mod'.
Generating RTLIL representation for module `$__div_mod_floor'.
Generating RTLIL representation for module `\_90_divfloor'.
Generating RTLIL representation for module `\_90_modfloor'.
Generating RTLIL representation for module `\_90_pow'.
Generating RTLIL representation for module `\_90_pmux'.
Generating RTLIL representation for module `\_90_demux'.
Generating RTLIL representation for module `\_90_lut'.
Generating RTLIL representation for module `$connect'.
Generating RTLIL representation for module `$input_port'.
Successfully finished Verilog frontend.

113.2. Continuing TECHMAP pass.
Using extmapper simplemap for cells of type $reduce_or.
Using template $paramod$32a7b7b86c07519b7537abc18e96f0331f97914d\_90_alu for cells of type $alu.
Using extmapper simplemap for cells of type $reduce_and.
Using template $paramod$3ac6e4268d0279df14823f25676acf685165517e\_90_alu for cells of type $alu.
Using template $paramod$7af24cf7f572852703f08ef7a936c59efa2c57af\_90_alu for cells of type $alu.
Using template $paramod$03eba0cdd46566f6651a3011e0b5671fa6b5e494\_90_alu for cells of type $alu.
Using template $paramod$f85408ed1aa3d09e465edae8a7bf590332ae9f7b\_90_alu for cells of type $alu.
Using template $paramod$d1615bf4e5e328245ffd1550e5fe105901cda77b\_90_alu for cells of type $alu.
Using template $paramod$83dd457849c736323edf2edb15923eb27f99c683\_90_alu for cells of type $alu.
Using template $paramod$1a3a0c35c4a4896fbfd612699525c057298e72d2\_90_alu for cells of type $alu.
Using template $paramod$79fc7abbb3333dbd5736999d565fd903198fb1eb\_90_alu for cells of type $alu.
Using template $paramod$adbaf76fa5a3091a329503792521395f8ff4d1a4\_90_alu for cells of type $alu.
Using template $paramod$672a140277c71df8314410f22acc08d55222c3c7\_90_alu for cells of type $alu.
Using template $paramod$6b90a16b6f3b57b9c9d958838204f952a01dc262\_90_alu for cells of type $alu.
Using extmapper simplemap for cells of type $not.
Using extmapper simplemap for cells of type $adffe.
Using extmapper simplemap for cells of type $ne.
Using extmapper simplemap for cells of type $reduce_bool.
Using extmapper simplemap for cells of type $logic_not.
Using extmapper simplemap for cells of type $mux.
Using extmapper simplemap for cells of type $xor.
Using extmapper simplemap for cells of type $eq.
Using extmapper simplemap for cells of type $logic_and.
Using extmapper simplemap for cells of type $and.
Using template $paramod$bf2533632d512eac76dd186c0da49367e29b8e98\_90_pmux for cells of type $pmux.
Using template $paramod$85df5dc01c7df96a7d8e5f1fdf76ce9ac452af63\_90_pmux for cells of type $pmux.
Using template $paramod$57f63e8a3282e053be0430389b09fa050ac7dca0\_90_pmux for cells of type $pmux.
Using template $paramod$b76f0c7d813c9b9e201e1c450cfd00106058a636\_90_pmux for cells of type $pmux.
Using template $paramod$54a4503cc57b9df40b70c1899504d6aac2650719\_90_pmux for cells of type $pmux.
Using extmapper simplemap for cells of type $adff.
Using extmapper simplemap for cells of type $or.
Using extmapper simplemap for cells of type $pos.
Using template $paramod\_90_fa\WIDTH=32'00000000000000000000000000000010 for cells of type $fa.
Using template $paramod\_90_lcu_brent_kung\WIDTH=32'00000000000000000000000000000010 for cells of type $lcu.
Using template $paramod\_90_fa\WIDTH=32'00000000000000000000000000000101 for cells of type $fa.
Using template $paramod\_90_lcu_brent_kung\WIDTH=32'00000000000000000000000000000101 for cells of type $lcu.
Using template $paramod\_90_fa\WIDTH=32'00000000000000000000000000000100 for cells of type $fa.
Using template $paramod\_90_lcu_brent_kung\WIDTH=32'00000000000000000000000000000100 for cells of type $lcu.
Using template $paramod\_90_fa\WIDTH=32'00000000000000000000000000000011 for cells of type $fa.
Using template $paramod\_90_lcu_brent_kung\WIDTH=32'00000000000000000000000000000011 for cells of type $lcu.
Using template $paramod\_90_fa\WIDTH=32'00000000000000000000000000000001 for cells of type $fa.
Using template $paramod\_90_lcu_brent_kung\WIDTH=32'00000000000000000000000000000001 for cells of type $lcu.
No more expansions possible.
<suppressed ~2503 debug messages>

114. Executing OPT_EXPR pass (perform const folding).
Optimizing module ascon_core_adpt_encdec.
<suppressed ~2124 debug messages>

115. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\ascon_core_adpt_encdec'.
Computing hashes of 7650 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
Computing hashes of 7204 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
Computing hashes of 6933 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
Computing hashes of 6913 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
Computing hashes of 6903 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
Computing hashes of 6901 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
<suppressed ~2247 debug messages>
Removed a total of 749 cells.

116. Executing OPT_DFF pass (perform DFF optimizations).

117. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \ascon_core_adpt_encdec..
Removed 100 unused cells and 3110 unused wires.
<suppressed ~101 debug messages>

118. Executing OPT_EXPR pass (perform const folding).
Optimizing module ascon_core_adpt_encdec.

119. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\ascon_core_adpt_encdec'.
Computing hashes of 6801 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
Removed a total of 0 cells.

120. Executing OPT_DFF pass (perform DFF optimizations).

121. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \ascon_core_adpt_encdec..

122. Executing ABC pass (technology mapping using ABC).

122.1. Extracting gate netlist of module `\ascon_core_adpt_encdec' to `<abc-temp-dir>/input.blif'..
Replacing 112 occurrences of constant undef bits with constant zero bits

122.1.1. Executed ABC.
Extracted 5882 gates and 7193 wires to a netlist network with 1308 inputs and 959 outputs.
Running ABC script: <abc-temp-dir>/abc.script
ABC: UC Berkeley, ABC 1.01 (compiled Apr 16 2026 21:01:18)
ABC: abc 01> empty
ABC: abc 01> source <abc-temp-dir>/abc.script
ABC: + read_blif <abc-temp-dir>/input.blif
ABC: + read_library <abc-temp-dir>/stdcells.genlib
ABC: + strash
ABC: + dretime
ABC: + map
ABC: + write_blif <abc-temp-dir>/output.blif
ABC:
ABC: YOSYS_ABC_DONE

122.1.2. Re-integrating ABC results.
ABC RESULTS:               AND cells:       97
ABC RESULTS:            ANDNOT cells:     1419
ABC RESULTS:               MUX cells:      938
ABC RESULTS:              NAND cells:       12
ABC RESULTS:               NOR cells:       25
ABC RESULTS:               NOT cells:      527
ABC RESULTS:                OR cells:      777
ABC RESULTS:             ORNOT cells:      154
ABC RESULTS:              XNOR cells:      957
ABC RESULTS:               XOR cells:      911
ABC RESULTS:        internal signals:     4926
ABC RESULTS:           input signals:     1308
ABC RESULTS:          output signals:      959
Removing temp directory.
Removing global temp directory.

123. Executing OPT pass (performing simple optimizations).

123.1. Executing OPT_EXPR pass (perform const folding).
Optimizing module ascon_core_adpt_encdec.
<suppressed ~388 debug messages>

123.2. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\ascon_core_adpt_encdec'.
Computing hashes of 6736 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
Computing hashes of 6733 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
<suppressed ~9 debug messages>
Removed a total of 3 cells.

123.3. Executing OPT_DFF pass (perform DFF optimizations).

123.4. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \ascon_core_adpt_encdec..
Removed 0 unused cells and 2760 unused wires.
<suppressed ~31 debug messages>

123.5. Finished fast OPT passes.

124. Executing HIERARCHY pass (managing design hierarchy).

124.1. Analyzing design hierarchy..
Top module:  \ascon_core_adpt_encdec

124.2. Analyzing design hierarchy..
Top module:  \ascon_core_adpt_encdec
Removed 0 unused modules.

125. Executing CHECK pass (checking for obvious problems).
Checking module ascon_core_adpt_encdec...
Found and reported 0 problems.

126. Printing statistics.

=== ascon_core_adpt_encdec ===

        +----------Local Count, excluding submodules.
        |
     5119 wires
     9203 wire bits
       75 public wires
     3450 public wire bits
       30 ports
      927 port bits
     6733 cells
     1419   $_ANDNOT_
       96   $_AND_
      915   $_DFFE_PN0P_
        2   $_DFF_PN0_
      937   $_MUX_
       11   $_NAND_
       25   $_NOR_
      527   $_NOT_
      154   $_ORNOT_
      777   $_OR_
      957   $_XNOR_
      911   $_XOR_
        2   $scopeinfo

127. Executing OPT pass (performing simple optimizations).

127.1. Executing OPT_EXPR pass (perform const folding).
Optimizing module ascon_core_adpt_encdec.

127.2. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\ascon_core_adpt_encdec'.
Computing hashes of 6733 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
Removed a total of 0 cells.

127.3. Executing OPT_MUXTREE pass (detect dead branches in mux trees).
Running muxtree optimizer on module \ascon_core_adpt_encdec..
  Creating internal representation of mux trees.
  No muxes found in this module.
Removed 0 multiplexer ports.

127.4. Executing OPT_REDUCE pass (consolidate $*mux and $reduce_* inputs).
  Optimizing cells in module \ascon_core_adpt_encdec.
Performed a total of 0 changes.

127.5. Executing OPT_MERGE pass (detect identical cells).
Finding identical cells in module `\ascon_core_adpt_encdec'.
Computing hashes of 6733 cells of `\ascon_core_adpt_encdec'.
Finding duplicate cells in `\ascon_core_adpt_encdec'.
Removed a total of 0 cells.

127.6. Executing OPT_DFF pass (perform DFF optimizations).

127.7. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \ascon_core_adpt_encdec..

127.8. Executing OPT_EXPR pass (perform const folding).
Optimizing module ascon_core_adpt_encdec.

127.9. Finished fast OPT passes. (There is nothing left to do.)

128. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \ascon_core_adpt_encdec..
Removed 2 unused cells and 26 unused wires.
<suppressed ~28 debug messages>
{
   "creator": "Yosys 0.64 (git sha1 6d2c445ae, g++ 13.3.0-6ubuntu2~24.04.1 -fPIC -O3)",
   "invocation": "stat -json -liberty
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/21487d43445f4c8fb643afeb0d99f888.lib ",
   "modules": {
      "\\ascon_core_adpt_encdec": {
         "num_wires":         5093,
         "num_wire_bits":     7651,
         "num_pub_wires":     49,
         "num_pub_wire_bits": 1898,
         "num_ports":         30,
         "num_port_bits":     927,
         "num_memories":      0,
         "num_memory_bits":   0,
         "num_processes":     0,
         "num_cells":         6731,
         "num_submodules":       0,
         "num_cells_by_type": {
            "$_ANDNOT_": 1419,
            "$_AND_": 96,
            "$_DFFE_PN0P_": 915,
            "$_DFF_PN0_": 2,
            "$_MUX_": 937,
            "$_NAND_": 11,
            "$_NOR_": 25,
            "$_NOT_": 527,
            "$_ORNOT_": 154,
            "$_OR_": 777,
            "$_XNOR_": 957,
            "$_XOR_": 911
         }
      }
   },
      "design": {
         "num_wires":         5093,
         "num_wire_bits":     7651,
         "num_pub_wires":     49,
         "num_pub_wire_bits": 1898,
         "num_ports":         30,
         "num_port_bits":     927,
         "num_memories":      0,
         "num_memory_bits":   0,
         "num_processes":     0,
         "num_cells":         6731,
         "num_submodules":       0,
         "num_cells_by_type": {
            "$_ANDNOT_": 1419,
            "$_AND_": 96,
            "$_DFFE_PN0P_": 915,
            "$_DFF_PN0_": 2,
            "$_MUX_": 937,
            "$_NAND_": 11,
            "$_NOR_": 25,
            "$_NOT_": 527,
            "$_ORNOT_": 154,
            "$_OR_": 777,
            "$_XNOR_": 957,
            "$_XOR_": 911
         }
      }
}

129. Printing statistics.

=== ascon_core_adpt_encdec ===

        +----------Local Count, excluding submodules.
        |
     5093 wires
     7651 wire bits
       49 public wires
     1898 public wire bits
       30 ports
      927 port bits
     6731 cells
     1419   $_ANDNOT_
       96   $_AND_
      915   $_DFFE_PN0P_
        2   $_DFF_PN0_
      937   $_MUX_
       11   $_NAND_
       25   $_NOR_
      527   $_NOT_
      154   $_ORNOT_
      777   $_OR_
      957   $_XNOR_
      911   $_XOR_

   Area for cell type $_ANDNOT_ is unknown!
   Area for cell type $_AND_ is unknown!
   Area for cell type $_DFFE_PN0P_ is unknown!
   Area for cell type $_DFF_PN0_ is unknown!
   Area for cell type $_MUX_ is unknown!
   Area for cell type $_NAND_ is unknown!
   Area for cell type $_NOR_ is unknown!
   Area for cell type $_NOT_ is unknown!
   Area for cell type $_ORNOT_ is unknown!
   Area for cell type $_OR_ is unknown!
   Area for cell type $_XNOR_ is unknown!
   Area for cell type $_XOR_ is unknown!

130. Executing DFFLIBMAP pass (mapping DFF cells to sequential cells from liberty file).
  cell gf180mcu_fd_sc_mcu7t5v0__dffnq_1 (noninv, pins=3, area=65.86) is a direct match for cell type $_DFF_N_.
  cell gf180mcu_fd_sc_mcu7t5v0__dffq_1 (noninv, pins=3, area=63.66) is a direct match for cell type $_DFF_P_.
  cell gf180mcu_fd_sc_mcu7t5v0__dffnrnq_1 (noninv, pins=4, area=74.64) is a direct match for cell type $_DFF_NN0_.
  cell gf180mcu_fd_sc_mcu7t5v0__dffnsnq_1 (noninv, pins=4, area=79.03) is a direct match for cell type $_DFF_NN1_.
  cell gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 (noninv, pins=4, area=74.64) is a direct match for cell type $_DFF_PN0_.
  cell gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 (noninv, pins=4, area=79.03) is a direct match for cell type $_DFF_PN1_.
  cell gf180mcu_fd_sc_mcu7t5v0__dffnrsnq_1 (noninv, pins=5, area=94.39) is a direct match for cell type $_DFFSR_NNN_.
  cell gf180mcu_fd_sc_mcu7t5v0__dffrsnq_1 (noninv, pins=5, area=85.61) is a direct match for cell type $_DFFSR_PNN_.
  final dff cell mappings:
    \gf180mcu_fd_sc_mcu7t5v0__dffnq_1 _DFF_N_ (.CLKN( C), .D( D), .Q( Q));
    \gf180mcu_fd_sc_mcu7t5v0__dffq_1 _DFF_P_ (.CLK( C), .D( D), .Q( Q));
    \gf180mcu_fd_sc_mcu7t5v0__dffnrnq_1 _DFF_NN0_ (.CLKN( C), .D( D), .Q( Q), .RN( R));
    \gf180mcu_fd_sc_mcu7t5v0__dffnsnq_1 _DFF_NN1_ (.CLKN( C), .D( D), .Q( Q), .SETN( R));
    unmapped dff cell: $_DFF_NP0_
    unmapped dff cell: $_DFF_NP1_
    \gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 _DFF_PN0_ (.CLK( C), .D( D), .Q( Q), .RN( R));
    \gf180mcu_fd_sc_mcu7t5v0__dffsnq_1 _DFF_PN1_ (.CLK( C), .D( D), .Q( Q), .SETN( R));
    unmapped dff cell: $_DFF_PP0_
    unmapped dff cell: $_DFF_PP1_
    unmapped dff cell: $_DFFE_NN_
    unmapped dff cell: $_DFFE_NP_
    unmapped dff cell: $_DFFE_PN_
    unmapped dff cell: $_DFFE_PP_
    \gf180mcu_fd_sc_mcu7t5v0__dffnrsnq_1 _DFFSR_NNN_ (.CLKN( C), .D( D), .Q( Q), .RN( R), .SETN( S));
    unmapped dff cell: $_DFFSR_NNP_
    unmapped dff cell: $_DFFSR_NPN_
    unmapped dff cell: $_DFFSR_NPP_
    \gf180mcu_fd_sc_mcu7t5v0__dffrsnq_1 _DFFSR_PNN_ (.CLK( C), .D( D), .Q( Q), .RN( R), .SETN( S));
    unmapped dff cell: $_DFFSR_PNP_
    unmapped dff cell: $_DFFSR_PPN_
    unmapped dff cell: $_DFFSR_PPP_

130.1. Executing DFFLEGALIZE pass (convert FFs to types supported by the target).
Mapping DFF cells in module `\ascon_core_adpt_encdec':
  mapped 917 $_DFF_PN0_ cells to \gf180mcu_fd_sc_mcu7t5v0__dffrnq_1 cells.
{
   "creator": "Yosys 0.64 (git sha1 6d2c445ae, g++ 13.3.0-6ubuntu2~24.04.1 -fPIC -O3)",
   "invocation": "stat -json -liberty
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/21487d43445f4c8fb643afeb0d99f888.lib ",
   "modules": {
      "\\ascon_core_adpt_encdec": {
         "num_wires":         6008,
         "num_wire_bits":     8566,
         "num_pub_wires":     49,
         "num_pub_wire_bits": 1898,
         "num_ports":         30,
         "num_port_bits":     927,
         "num_memories":      0,
         "num_memory_bits":   0,
         "num_processes":     0,
         "num_cells":         7646,
         "num_submodules":       0,
         "area":              68441.945600,
         "sequential_area":    68441.945600,
         "num_cells_by_type": {
            "$_ANDNOT_": 1419,
            "$_AND_": 96,
            "$_MUX_": 1852,
            "$_NAND_": 11,
            "$_NOR_": 25,
            "$_NOT_": 527,
            "$_ORNOT_": 154,
            "$_OR_": 777,
            "$_XNOR_": 957,
            "$_XOR_": 911,
            "gf180mcu_fd_sc_mcu7t5v0__dffrnq_1": 917
         }
      }
   },
      "design": {
         "num_wires":         6008,
         "num_wire_bits":     8566,
         "num_pub_wires":     49,
         "num_pub_wire_bits": 1898,
         "num_ports":         30,
         "num_port_bits":     927,
         "num_memories":      0,
         "num_memory_bits":   0,
         "num_processes":     0,
         "num_cells":         7646,
         "num_submodules":       0,
         "area":              68441.945600,
         "sequential_area":    68441.945600,
         "num_cells_by_type": {
            "$_ANDNOT_": 1419,
            "$_AND_": 96,
            "$_MUX_": 1852,
            "$_NAND_": 11,
            "$_NOR_": 25,
            "$_NOT_": 527,
            "$_ORNOT_": 154,
            "$_OR_": 777,
            "$_XNOR_": 957,
            "$_XOR_": 911,
            "gf180mcu_fd_sc_mcu7t5v0__dffrnq_1": 917
         }
      }
}

131. Printing statistics.

=== ascon_core_adpt_encdec ===

        +----------Local Count, excluding submodules.
        |        +-Local Area, excluding submodules.
        |        |
     6008        - wires
     8566        - wire bits
       49        - public wires
     1898        - public wire bits
       30        - ports
      927        - port bits
     7646 6.84E+04 cells
     1419        -   $_ANDNOT_
       96        -   $_AND_
     1852        -   $_MUX_
       11        -   $_NAND_
       25        -   $_NOR_
      527        -   $_NOT_
      154        -   $_ORNOT_
      777        -   $_OR_
      957        -   $_XNOR_
      911        -   $_XOR_
      917 6.84E+04   gf180mcu_fd_sc_mcu7t5v0__dffrnq_1

   Area for cell type $_ANDNOT_ is unknown!
   Area for cell type $_AND_ is unknown!
   Area for cell type $_MUX_ is unknown!
   Area for cell type $_NAND_ is unknown!
   Area for cell type $_NOR_ is unknown!
   Area for cell type $_NOT_ is unknown!
   Area for cell type $_ORNOT_ is unknown!
   Area for cell type $_OR_ is unknown!
   Area for cell type $_XNOR_ is unknown!
   Area for cell type $_XOR_ is unknown!

   Chip area for module '\ascon_core_adpt_encdec': 68441.945600
     of which used for sequential elements: 68441.945600 (100.00%)

[INFO] Using generated ABC script
'/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/06-yosys-synthesis/AREA_0.abc'…

132. Executing ABC pass (technology mapping using ABC).

132.1. Extracting gate netlist of module `\ascon_core_adpt_encdec' to `/tmp/yosys-abc-Esw2lA/input.blif'..

132.1.1. Executed ABC.
Extracted 6729 gates and 8301 wires to a netlist network with 1572 inputs and 919 outputs.
Running ABC script: /tmp/yosys-abc-Esw2lA/abc.script
ABC: UC Berkeley, ABC 1.01 (compiled Apr 16 2026 21:01:18)
ABC: abc 01> empty
ABC: abc 01> source /tmp/yosys-abc-Esw2lA/abc.script
ABC: + read_blif /tmp/yosys-abc-Esw2lA/input.blif
ABC: + read_lib -w /foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/21487d43445f4c8fb643afeb0d99f888.lib
ABC: Parsing finished successfully.  Parsing time =     0.21 sec
ABC: Scl_LibertyReadGenlib() skipped cell "gf180mcu_fd_sc_mcu7t5v0__antenna" without logic function.
ABC: Scl_LibertyReadGenlib() skipped three-state cell "gf180mcu_fd_sc_mcu7t5v0__bufz_1".
ABC: Scl_LibertyReadGenlib() skipped three-state cell "gf180mcu_fd_sc_mcu7t5v0__bufz_2".
ABC: Scl_LibertyReadGenlib() skipped three-state cell "gf180mcu_fd_sc_mcu7t5v0__bufz_3".
ABC: Scl_LibertyReadGenlib() skipped three-state cell "gf180mcu_fd_sc_mcu7t5v0__bufz_4".
ABC: Scl_LibertyReadGenlib() skipped three-state cell "gf180mcu_fd_sc_mcu7t5v0__bufz_8".
ABC: Scl_LibertyReadGenlib() skipped three-state cell "gf180mcu_fd_sc_mcu7t5v0__bufz_12".
ABC: Scl_LibertyReadGenlib() skipped three-state cell "gf180mcu_fd_sc_mcu7t5v0__bufz_16".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__dffnq_1".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__dffnq_2".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__dffnq_4".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__dffnrnq_1".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__dffnrnq_2".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__dffnrnq_4".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__dffnrsnq_1".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__dffnrsnq_2".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__dffnrsnq_4".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__dffnsnq_1".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__dffnsnq_2".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__dffnsnq_4".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__dffq_1".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__dffq_2".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__dffq_4".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__dffrnq_1".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__dffrnq_2".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__dffrnq_4".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__dffrsnq_1".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__dffrsnq_2".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__dffrsnq_4".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__dffsnq_1".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__dffsnq_2".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__dffsnq_4".
ABC: Scl_LibertyReadGenlib() skipped cell "gf180mcu_fd_sc_mcu7t5v0__endcap" without logic function.
ABC: Scl_LibertyReadGenlib() skipped cell "gf180mcu_fd_sc_mcu7t5v0__fill_1" without logic function.
ABC: Scl_LibertyReadGenlib() skipped cell "gf180mcu_fd_sc_mcu7t5v0__fill_2" without logic function.
ABC: Scl_LibertyReadGenlib() skipped cell "gf180mcu_fd_sc_mcu7t5v0__fill_4" without logic function.
ABC: Scl_LibertyReadGenlib() skipped cell "gf180mcu_fd_sc_mcu7t5v0__fill_8" without logic function.
ABC: Scl_LibertyReadGenlib() skipped cell "gf180mcu_fd_sc_mcu7t5v0__fill_16" without logic function.
ABC: Scl_LibertyReadGenlib() skipped cell "gf180mcu_fd_sc_mcu7t5v0__fill_32" without logic function.
ABC: Scl_LibertyReadGenlib() skipped cell "gf180mcu_fd_sc_mcu7t5v0__fill_64" without logic function.
ABC: Scl_LibertyReadGenlib() skipped cell "gf180mcu_fd_sc_mcu7t5v0__fillcap_4" without logic function.
ABC: Scl_LibertyReadGenlib() skipped cell "gf180mcu_fd_sc_mcu7t5v0__fillcap_8" without logic function.
ABC: Scl_LibertyReadGenlib() skipped cell "gf180mcu_fd_sc_mcu7t5v0__fillcap_16" without logic function.
ABC: Scl_LibertyReadGenlib() skipped cell "gf180mcu_fd_sc_mcu7t5v0__fillcap_32" without logic function.
ABC: Scl_LibertyReadGenlib() skipped cell "gf180mcu_fd_sc_mcu7t5v0__fillcap_64" without logic function.
ABC: Scl_LibertyReadGenlib() skipped cell "gf180mcu_fd_sc_mcu7t5v0__filltie" without logic function.
ABC: Scl_LibertyReadGenlib() skipped three-state cell "gf180mcu_fd_sc_mcu7t5v0__hold".
ABC: Scl_LibertyReadGenlib() skipped cell "gf180mcu_fd_sc_mcu7t5v0__icgtn_1" without logic function.
ABC: Scl_LibertyReadGenlib() skipped cell "gf180mcu_fd_sc_mcu7t5v0__icgtn_2" without logic function.
ABC: Scl_LibertyReadGenlib() skipped cell "gf180mcu_fd_sc_mcu7t5v0__icgtn_4" without logic function.
ABC: Scl_LibertyReadGenlib() skipped cell "gf180mcu_fd_sc_mcu7t5v0__icgtp_1" without logic function.
ABC: Scl_LibertyReadGenlib() skipped cell "gf180mcu_fd_sc_mcu7t5v0__icgtp_2" without logic function.
ABC: Scl_LibertyReadGenlib() skipped cell "gf180mcu_fd_sc_mcu7t5v0__icgtp_4" without logic function.
ABC: Scl_LibertyReadGenlib() skipped three-state cell "gf180mcu_fd_sc_mcu7t5v0__invz_1".
ABC: Scl_LibertyReadGenlib() skipped three-state cell "gf180mcu_fd_sc_mcu7t5v0__invz_2".
ABC: Scl_LibertyReadGenlib() skipped three-state cell "gf180mcu_fd_sc_mcu7t5v0__invz_3".
ABC: Scl_LibertyReadGenlib() skipped three-state cell "gf180mcu_fd_sc_mcu7t5v0__invz_4".
ABC: Scl_LibertyReadGenlib() skipped three-state cell "gf180mcu_fd_sc_mcu7t5v0__invz_8".
ABC: Scl_LibertyReadGenlib() skipped three-state cell "gf180mcu_fd_sc_mcu7t5v0__invz_12".
ABC: Scl_LibertyReadGenlib() skipped three-state cell "gf180mcu_fd_sc_mcu7t5v0__invz_16".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__latq_1".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__latq_2".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__latq_4".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__latrnq_1".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__latrnq_2".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__latrnq_4".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__latrsnq_1".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__latrsnq_2".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__latrsnq_4".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__latsnq_1".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__latsnq_2".
ABC: Scl_LibertyReadGenlib() skipped sequential cell "gf180mcu_fd_sc_mcu7t5v0__latsnq_4".
ABC: Library "gf180mcu_fd_sc_mcu7t5v0__tt_025C_3v30" from
"/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/21487d43445f4c8fb643afeb0d99f888.lib" has 143 cells (72
skipped: 36 seq; 15 tri-state; 21 no func; 0 dont_use; 0 with 2 outputs; 0 with 3+ outputs).  Time =     0.29 sec
ABC: Memory =   23.81 MB. Time =     0.29 sec
ABC: Warning: Detected 6 multi-output cells (for example, "gf180mcu_fd_sc_mcu7t5v0__addf_1").
ABC: + read_constr -v /foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/06-yosys-synthesis/synthesis.abc.sdc
ABC: Setting driving cell to be "gf180mcu_fd_sc_mcu7t5v0__inv_1/ZN".
ABC: Setting output load to be 72.910004.
ABC: + source /foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/06-yosys-synthesis/AREA_0.abc
ABC: Error: The network is combinational.
ABC: Cannot find the default PI driving cell (gf180mcu_fd_sc_mcu7t5v0__inv_1/ZN) in the library.
ABC: WireLoad = "none"  Gates =   5381 (  5.5 %)   Cap = 19.9 ff ( 17.9 %)   Area =   110343.92 ( 71.0 %)   Delay =
92711.50 ps  (  1.3 %)
ABC: Path  0 --     460 : 0    8 pi                              A =   0.00  Df =   0.0   -0.0 ps  S =   0.0 ps  Cin =
0.0 ff  Cout =  30.2 ff  Cmax =   0.0 ff  G =    0
ABC: Path  1 --    2754 : 2    6 gf180mcu_fd_sc_mcu7t5v0__or2_1  A =  17.56  Df = 803.1 -225.8 ps  S = 679.7 ps  Cin =
2.8 ff  Cout =  25.3 ff  Cmax = 359.9 ff  G =  901
ABC: Path  2 --    2758 : 3  382 gf180mcu_fd_sc_mcu7t5v0__nor3_1 A =  17.56  Df =68885.4-45938.3 ps  S =119835.5 ps  Cin
=  4.0 ff  Cout =1796.4 ff  Cmax = 122.2 ff  G =44898
ABC: Path  3 --    6045 : 3    1 gf180mcu_fd_sc_mcu7t5v0__mux2_2 A =  32.93  Df =92711.5-63279.6 ps  S =3187.5 ps  Cin =
6.4 ff  Cout =  72.9 ff  Cmax = 720.9 ff  G = 1143
ABC: Start-point = pi459 (\st [1]).  End-point = po610 ($auto$rtlil.cc:3501:MuxGate$20495).
ABC: netlist                       : i/o = 1572/  919  lat =    0  nd =  5381  edge =  14056  area =110342.90  delay =
8.00  lev = 8
ABC: + write_blif /tmp/yosys-abc-Esw2lA/output.blif
ABC:
ABC: YOSYS_ABC_DONE

132.1.2. Re-integrating ABC results.
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__and2_1 cells:       61
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__and3_1 cells:       17
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__and4_1 cells:        3
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__aoi211_1 cells:       96
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__aoi21_1 cells:      535
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__aoi221_1 cells:       81
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__aoi222_1 cells:       72
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__aoi22_1 cells:      131
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__clkinv_1 cells:      295
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__mux2_2 cells:      153
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__nand2_1 cells:      973
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__nand3_1 cells:       42
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__nand4_1 cells:       13
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__nor2_1 cells:      426
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__nor3_1 cells:       12
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__nor4_1 cells:       34
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__oai211_1 cells:      141
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__oai21_1 cells:      637
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__oai221_1 cells:       37
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__oai22_1 cells:       78
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__oai31_1 cells:       90
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__oai32_1 cells:       26
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__or2_1 cells:       13
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__or3_1 cells:        4
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__or4_1 cells:        1
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__xnor2_1 cells:       93
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__xnor3_1 cells:       68
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__xor2_1 cells:     1022
ABC RESULTS:   gf180mcu_fd_sc_mcu7t5v0__xor3_1 cells:      227
ABC RESULTS:        internal signals:     5810
ABC RESULTS:           input signals:     1572
ABC RESULTS:          output signals:      919
Removing temp directory.
Removing global temp directory.

133. Executing SETUNDEF pass (replace undef values with defined constants).

134. Executing HILOMAP pass (mapping to constant drivers).

135. Executing SPLITNETS pass (splitting up multi-bit signals).

136. Executing OPT_CLEAN pass (remove unused cells and wires).
Finding unused cells or wires in module \ascon_core_adpt_encdec..
Removed 63 unused cells and 8625 unused wires.
<suppressed ~384 debug messages>

137. Executing INSBUF pass (insert buffer cells for connected wires).

138. Executing CHECK pass (checking for obvious problems).
Checking module ascon_core_adpt_encdec...
Found and reported 0 problems.
{
   "creator": "Yosys 0.64 (git sha1 6d2c445ae, g++ 13.3.0-6ubuntu2~24.04.1 -fPIC -O3)",
   "invocation": "stat -json -liberty
/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/tmp/21487d43445f4c8fb643afeb0d99f888.lib ",
   "modules": {
      "\\ascon_core_adpt_encdec": {
         "num_wires":         6060,
         "num_wire_bits":     6957,
         "num_pub_wires":     681,
         "num_pub_wire_bits": 1578,
         "num_ports":         30,
         "num_port_bits":     927,
         "num_memories":      0,
         "num_memory_bits":   0,
         "num_processes":     0,
         "num_cells":         6298,
         "num_submodules":       0,
         "area":              178785.868800,
         "sequential_area":    68441.945600,
         "num_cells_by_type": {
            "gf180mcu_fd_sc_mcu7t5v0__and2_1": 61,
            "gf180mcu_fd_sc_mcu7t5v0__and3_1": 17,
            "gf180mcu_fd_sc_mcu7t5v0__and4_1": 3,
            "gf180mcu_fd_sc_mcu7t5v0__aoi211_1": 96,
            "gf180mcu_fd_sc_mcu7t5v0__aoi21_1": 535,
            "gf180mcu_fd_sc_mcu7t5v0__aoi221_1": 81,
            "gf180mcu_fd_sc_mcu7t5v0__aoi222_1": 72,
            "gf180mcu_fd_sc_mcu7t5v0__aoi22_1": 131,
            "gf180mcu_fd_sc_mcu7t5v0__clkinv_1": 295,
            "gf180mcu_fd_sc_mcu7t5v0__dffrnq_1": 917,
            "gf180mcu_fd_sc_mcu7t5v0__mux2_2": 153,
            "gf180mcu_fd_sc_mcu7t5v0__nand2_1": 973,
            "gf180mcu_fd_sc_mcu7t5v0__nand3_1": 42,
            "gf180mcu_fd_sc_mcu7t5v0__nand4_1": 13,
            "gf180mcu_fd_sc_mcu7t5v0__nor2_1": 426,
            "gf180mcu_fd_sc_mcu7t5v0__nor3_1": 12,
            "gf180mcu_fd_sc_mcu7t5v0__nor4_1": 34,
            "gf180mcu_fd_sc_mcu7t5v0__oai211_1": 141,
            "gf180mcu_fd_sc_mcu7t5v0__oai21_1": 637,
            "gf180mcu_fd_sc_mcu7t5v0__oai221_1": 37,
            "gf180mcu_fd_sc_mcu7t5v0__oai22_1": 78,
            "gf180mcu_fd_sc_mcu7t5v0__oai31_1": 90,
            "gf180mcu_fd_sc_mcu7t5v0__oai32_1": 26,
            "gf180mcu_fd_sc_mcu7t5v0__or2_1": 13,
            "gf180mcu_fd_sc_mcu7t5v0__or3_1": 4,
            "gf180mcu_fd_sc_mcu7t5v0__or4_1": 1,
            "gf180mcu_fd_sc_mcu7t5v0__xnor2_1": 93,
            "gf180mcu_fd_sc_mcu7t5v0__xnor3_1": 68,
            "gf180mcu_fd_sc_mcu7t5v0__xor2_1": 1022,
            "gf180mcu_fd_sc_mcu7t5v0__xor3_1": 227
         }
      }
   },
      "design": {
         "num_wires":         6060,
         "num_wire_bits":     6957,
         "num_pub_wires":     681,
         "num_pub_wire_bits": 1578,
         "num_ports":         30,
         "num_port_bits":     927,
         "num_memories":      0,
         "num_memory_bits":   0,
         "num_processes":     0,
         "num_cells":         6298,
         "num_submodules":       0,
         "area":              178785.868800,
         "sequential_area":    68441.945600,
         "num_cells_by_type": {
            "gf180mcu_fd_sc_mcu7t5v0__and2_1": 61,
            "gf180mcu_fd_sc_mcu7t5v0__and3_1": 17,
            "gf180mcu_fd_sc_mcu7t5v0__and4_1": 3,
            "gf180mcu_fd_sc_mcu7t5v0__aoi211_1": 96,
            "gf180mcu_fd_sc_mcu7t5v0__aoi21_1": 535,
            "gf180mcu_fd_sc_mcu7t5v0__aoi221_1": 81,
            "gf180mcu_fd_sc_mcu7t5v0__aoi222_1": 72,
            "gf180mcu_fd_sc_mcu7t5v0__aoi22_1": 131,
            "gf180mcu_fd_sc_mcu7t5v0__clkinv_1": 295,
            "gf180mcu_fd_sc_mcu7t5v0__dffrnq_1": 917,
            "gf180mcu_fd_sc_mcu7t5v0__mux2_2": 153,
            "gf180mcu_fd_sc_mcu7t5v0__nand2_1": 973,
            "gf180mcu_fd_sc_mcu7t5v0__nand3_1": 42,
            "gf180mcu_fd_sc_mcu7t5v0__nand4_1": 13,
            "gf180mcu_fd_sc_mcu7t5v0__nor2_1": 426,
            "gf180mcu_fd_sc_mcu7t5v0__nor3_1": 12,
            "gf180mcu_fd_sc_mcu7t5v0__nor4_1": 34,
            "gf180mcu_fd_sc_mcu7t5v0__oai211_1": 141,
            "gf180mcu_fd_sc_mcu7t5v0__oai21_1": 637,
            "gf180mcu_fd_sc_mcu7t5v0__oai221_1": 37,
            "gf180mcu_fd_sc_mcu7t5v0__oai22_1": 78,
            "gf180mcu_fd_sc_mcu7t5v0__oai31_1": 90,
            "gf180mcu_fd_sc_mcu7t5v0__oai32_1": 26,
            "gf180mcu_fd_sc_mcu7t5v0__or2_1": 13,
            "gf180mcu_fd_sc_mcu7t5v0__or3_1": 4,
            "gf180mcu_fd_sc_mcu7t5v0__or4_1": 1,
            "gf180mcu_fd_sc_mcu7t5v0__xnor2_1": 93,
            "gf180mcu_fd_sc_mcu7t5v0__xnor3_1": 68,
            "gf180mcu_fd_sc_mcu7t5v0__xor2_1": 1022,
            "gf180mcu_fd_sc_mcu7t5v0__xor3_1": 227
         }
      }
}

139. Printing statistics.

=== ascon_core_adpt_encdec ===

        +----------Local Count, excluding submodules.
        |        +-Local Area, excluding submodules.
        |        |
     6060        - wires
     6957        - wire bits
      681        - public wires
     1578        - public wire bits
       30        - ports
      927        - port bits
     6298 1.79E+05 cells
       61 1.07E+03   gf180mcu_fd_sc_mcu7t5v0__and2_1
       17  373.184   gf180mcu_fd_sc_mcu7t5v0__and3_1
        3   72.442   gf180mcu_fd_sc_mcu7t5v0__and4_1
       96 2.11E+03   gf180mcu_fd_sc_mcu7t5v0__aoi211_1
      535  9.4E+03   gf180mcu_fd_sc_mcu7t5v0__aoi21_1
       81 1.96E+03   gf180mcu_fd_sc_mcu7t5v0__aoi221_1
       72 2.21E+03   gf180mcu_fd_sc_mcu7t5v0__aoi222_1
      131 2.59E+03   gf180mcu_fd_sc_mcu7t5v0__aoi22_1
      295 2.59E+03   gf180mcu_fd_sc_mcu7t5v0__clkinv_1
      917 6.84E+04   gf180mcu_fd_sc_mcu7t5v0__dffrnq_1
      153 5.04E+03   gf180mcu_fd_sc_mcu7t5v0__mux2_2
      973 1.07E+04   gf180mcu_fd_sc_mcu7t5v0__nand2_1
       42  645.389   gf180mcu_fd_sc_mcu7t5v0__nand3_1
       13  256.838   gf180mcu_fd_sc_mcu7t5v0__nand4_1
      426 5.61E+03   gf180mcu_fd_sc_mcu7t5v0__nor2_1
       12  210.739   gf180mcu_fd_sc_mcu7t5v0__nor3_1
       34  746.368   gf180mcu_fd_sc_mcu7t5v0__nor4_1
      141  3.1E+03   gf180mcu_fd_sc_mcu7t5v0__oai211_1
      637 1.12E+04   gf180mcu_fd_sc_mcu7t5v0__oai21_1
       37  974.669   gf180mcu_fd_sc_mcu7t5v0__oai221_1
       78 1.71E+03   gf180mcu_fd_sc_mcu7t5v0__oai22_1
       90 2.17E+03   gf180mcu_fd_sc_mcu7t5v0__oai31_1
       26  684.902   gf180mcu_fd_sc_mcu7t5v0__oai32_1
       13  228.301   gf180mcu_fd_sc_mcu7t5v0__or2_1
        4   87.808   gf180mcu_fd_sc_mcu7t5v0__or3_1
        1   26.342   gf180mcu_fd_sc_mcu7t5v0__or4_1
       93 2.65E+03   gf180mcu_fd_sc_mcu7t5v0__xnor2_1
       68 3.58E+03   gf180mcu_fd_sc_mcu7t5v0__xnor3_1
     1022 2.69E+04   gf180mcu_fd_sc_mcu7t5v0__xor2_1
      227 1.15E+04   gf180mcu_fd_sc_mcu7t5v0__xor3_1

   Chip area for module '\ascon_core_adpt_encdec': 178785.868800
     of which used for sequential elements: 68441.945600 (38.28%)

140. Executing Verilog backend.
Dumping module `\ascon_core_adpt_encdec'.

141. Executing JSON backend.
[15:13:47] VERBOSE  Parsing synthesis checks…                                                               pyosys.py:59
[15:13:47] INFO     Skipping step 'Unmapped Cells Checker'…                                            sequential.py:370
[15:13:47] INFO     Skipping step 'Yosys Synth Checks'…                                                sequential.py:370
[15:13:47] INFO     Skipping step 'Netlist Assign Statement Checker'…                                  sequential.py:370
[15:13:47] INFO     Skipping step 'Check SDC Files'…                                                   sequential.py:370
[15:13:47] INFO     Skipping step 'Check Macro Instances'…                                             sequential.py:370
[15:13:47] INFO     Skipping step 'STA (Pre-PnR)'…                                                     sequential.py:370
[15:13:47] INFO     Skipping step 'Floorplan Init'…                                                    sequential.py:370
[15:13:47] INFO     Skipping step 'Dump RC Values'…                                                    sequential.py:370
[15:13:47] INFO     Skipping step 'Check Antenna Properties of Macros Pins in Their LEF Views'…        sequential.py:370
[15:13:47] INFO     Skipping step 'Set Power Connections'…                                             sequential.py:370
[15:13:47] INFO     Skipping step 'Manual Macro Placement'…                                            sequential.py:370
[15:13:47] INFO     Skipping step 'Cut Rows'…                                                          sequential.py:370
[15:13:47] INFO     Skipping step 'Tap/Decap Insertion'…                                               sequential.py:370
[15:13:47] INFO     Skipping step 'Add PDN obstructions'…                                              sequential.py:370
[15:13:47] INFO     Skipping step 'Generate PDN'…                                                      sequential.py:370
[15:13:47] INFO     Skipping step 'Remove PDN obstructions'…                                           sequential.py:370
[15:13:47] INFO     Skipping step 'Add Obstructions'…                                                  sequential.py:370
[15:13:47] INFO     Skipping step 'Global Placement Skip IO'…                                          sequential.py:370
[15:13:47] INFO     Skipping step 'I/O Placement'…                                                     sequential.py:370
[15:13:47] INFO     Skipping step 'Custom I/O Placement'…                                              sequential.py:370
[15:13:47] INFO     Skipping step 'Apply DEF Template'…                                                sequential.py:370
[15:13:47] INFO     Skipping step 'Global Placement'…                                                  sequential.py:370
[15:13:47] INFO     Skipping step 'Write Verilog Header'…                                              sequential.py:370
[15:13:47] INFO     Skipping step 'Power Grid Violation Checker'…                                      sequential.py:370
[15:13:47] INFO     Skipping step 'STA (Mid-PnR)'…                                                     sequential.py:370
[15:13:47] INFO     Skipping step 'Repair Design (Post-Global Placement)'…                             sequential.py:370
[15:13:47] INFO     Skipping step 'Manual Global Placement'…                                           sequential.py:370
[15:13:47] INFO     Skipping step 'Detailed Placement'…                                                sequential.py:370
[15:13:47] INFO     Skipping step 'Clock Tree Synthesis'…                                              sequential.py:370
[15:13:47] INFO     Skipping step 'STA (Mid-PnR)'…                                                     sequential.py:370
[15:13:47] INFO     Skipping step 'Resizer Timing Optimizations (Post-Clock Tree Synthesis)'…          sequential.py:370
[15:13:47] INFO     Skipping step 'STA (Mid-PnR)'…                                                     sequential.py:370
[15:13:47] INFO     Skipping step 'Global Routing'…                                                    sequential.py:370
[15:13:47] INFO     Skipping step 'Check Antennas'…                                                    sequential.py:370
[15:13:47] INFO     Gating variable for step 'OpenROAD.RepairDesignPostGRT' set to 'False'- the step   sequential.py:362
                    will be skipped.
[15:13:47] INFO     Skipping step 'Repair Design (Post-Global Routing)'…                               sequential.py:370
[15:13:47] INFO     Skipping step 'Diodes on Ports'…                                                   sequential.py:370
[15:13:47] INFO     Skipping step 'Heuristic Diode Insertion'…                                         sequential.py:370
[15:13:47] INFO     Gating variable for step 'OpenROAD.RepairAntennas' set to 'False'- the step will   sequential.py:362
                    be skipped.
[15:13:47] INFO     Skipping step 'Antenna Repair'…                                                    sequential.py:370
[15:13:47] INFO     Gating variable for step 'OpenROAD.ResizerTimingPostGRT' set to 'False'- the step  sequential.py:362
                    will be skipped.
[15:13:47] INFO     Skipping step 'Resizer Timing Optimizations (Post-Global Routing)'…                sequential.py:370
[15:13:47] INFO     Skipping step 'STA (Mid-PnR)'…                                                     sequential.py:370
[15:13:47] INFO     Skipping step 'Detailed Routing'…                                                  sequential.py:370
[15:13:47] INFO     Skipping step 'Remove Obstructions'…                                               sequential.py:370
[15:13:47] INFO     Skipping step 'Check Antennas'…                                                    sequential.py:370
[15:13:47] INFO     Skipping step 'Routing DRC Checker'…                                               sequential.py:370
[15:13:47] INFO     Skipping step 'Report Disconnected Pins'…                                          sequential.py:370
[15:13:47] INFO     Skipping step 'Disconnected Pins Checker'…                                         sequential.py:370
[15:13:47] INFO     Skipping step 'Report Wire Length'…                                                sequential.py:370
[15:13:47] INFO     Skipping step 'Wire Length Threshold Checker'…                                     sequential.py:370
[15:13:47] INFO     Skipping step 'Fill Insertion'…                                                    sequential.py:370
[15:13:47] INFO     Skipping step 'Generate Cell Frequency Tables'…                                    sequential.py:370
[15:13:47] INFO     Skipping step 'Parasitics (RC) Extraction'…                                        sequential.py:370
[15:13:47] INFO     Skipping step 'STA (Post-PnR)'…                                                    sequential.py:370
[15:13:47] INFO     Skipping step 'IR Drop Report'…                                                    sequential.py:370
[15:13:47] INFO     Skipping step 'GDSII Stream Out (Magic)'…                                          sequential.py:370
[15:13:47] INFO     Skipping step 'GDSII Stream Out (KLayout)'…                                        sequential.py:370
[15:13:47] INFO     Skipping step 'Render Image (w/ KLayout)'…                                         sequential.py:370
[15:13:47] INFO     Skipping step 'Write LEF (Magic)'…                                                 sequential.py:370
[15:13:47] INFO     Skipping step 'Check Antenna Properties of Pins in The Generated Design LEF view'… sequential.py:370
[15:13:47] INFO     Skipping step 'KLayout vs. Magic XOR'…                                             sequential.py:370
[15:13:48] INFO     Skipping step 'XOR Difference Checker'…                                            sequential.py:370
[15:13:48] INFO     Skipping step 'DRC'…                                                               sequential.py:370
[15:13:48] INFO     Skipping step 'Design Rule Check (KLayout)'…                                       sequential.py:370
[15:13:48] INFO     Skipping step 'Magic DRC Checker'…                                                 sequential.py:370
[15:13:48] INFO     Skipping step 'KLayout DRC Checker'…                                               sequential.py:370
[15:13:48] INFO     Skipping step 'SPICE Extraction'…                                                  sequential.py:370
[15:13:48] INFO     Skipping step 'Illegal Overlap Checker'…                                           sequential.py:370
[15:13:48] INFO     Skipping step 'Netgen LVS'…                                                        sequential.py:370
[15:13:48] INFO     Skipping step 'LVS Error Checker'…                                                 sequential.py:370
[15:13:48] INFO     Gating variable for step 'Yosys.EQY' set to 'False'- the step will be skipped.     sequential.py:362
[15:13:48] INFO     Skipping step 'Equivalence Check'…                                                 sequential.py:370
[15:13:48] INFO     Skipping step 'Setup Timing Violations Checker'…                                   sequential.py:370
[15:13:48] INFO     Skipping step 'Hold Timing Violations Checker'…                                    sequential.py:370
[15:13:48] INFO     Skipping step 'Max Slew Violations Checker'…                                       sequential.py:370
[15:13:48] INFO     Skipping step 'Max Cap Violations Checker'…                                        sequential.py:370
[15:13:48] INFO     Skipping step 'Report Manufacturability'…                                          sequential.py:370
[15:13:48] INFO     Saving views to '/foss/designs/ascon_pipelined/runs/RUN_2026-07-03_15-13-26/final'…     state.py:209
[15:13:48] INFO     Flow complete.                                                                     sequential.py:413
Classic - Stage 80 - Report Manufacturability ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 80/80 0:00:20
[15:13:48] WARNING  The following warnings were generated by the flow:                                       flow.py:699
[15:13:48] WARNING  [Checker.LintWarnings] 301 Lint warnings found.                                          flow.py:701

/foss/designs/ascon_pipelined > cd runs/RUN_2026-07-03_15-13-26/*-yosys-synthesis
ls
AREA_0.abc                        COMMANDS     reports        state_out.json       yosys-synthesis.process_stats.json
ascon_core_adpt_encdec.nl.v       config.json  runtime.txt    synthesis.abc.sdc

```
