# ascon128
- main repository: https://github.com/lakshmikiyer/SSCS_CHIPATHON_2026_CRYPTOACCEL/tree/main
- padring integration repository: https://github.com/lakshmikiyer/Chipathon-2026-A10_Cryptoaccel/tree/main

- ASCON AEAD128a Cryptographic ASIC Hardware Accelerator
- part of the IEEE SSCS Chipathon Pico 2026 - Track A ( [project proposal](https://docs.google.com/document/d/e/2PACX-1vQ7hXiJkHFsaxKhHVbuH3Zd8qZDoJdL6WpXG3n53tD7aNz_2QSCsUlUvai5AVLdPrBWiSDReBhnfogW/pub) )
- Target Node: Global Foundries 180 nm PDK 
- Team Name: CryptoAccel ( A-10 )
- Proposal Review Result: score 3.17/4 , rank - 02/35 -- track A
- Schematic Review Result: Unconditional Go from judges -- 10/15
---

<img width="2048" height="1473" alt="image" src="https://github.com/user-attachments/assets/420a6632-c3ed-4a0d-82ad-7331dc9077f0" style="width:50%;"/>

---
## Repo Structure:

- Specification: https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-232.pdf

- Architecture: 
<img width="1652" height="1218" alt="image" src="https://github.com/user-attachments/assets/2280f3b1-ffab-4a0d-9cd7-6b3d6e7fe034" style="width:50%;"/>


- RTL Design & Verification: https://github.com/yashv373/ascon128/tree/main/RTL_Design_Verification
- Synthesis: https://github.com/yashv373/ascon128/tree/main/synthesis
- Post Synthesis Verification: https://github.com/yashv373/ascon128/tree/main/post_synthesis_GLS
- Physical Design via LibreLane: https://github.com/yashv373/ascon128/tree/main/physical_design
- Chip-Top Integration (Padring + SPI + AXI): https://github.com/yashv373/ascon128/tree/main/chip_top_integration

---

## Final Chip Summary

The final integrated chip runs at **16 MHz** with the following top-level hierarchy:

```
chip_top (padring + I/O pads)
  └── chip_core
       └── spi_slave (top module)
            ├── axi_master
            ├── axi_ascon (AXI-Lite wrapper)
            │    └── ascon_core_adpt_encdec
            │         ├── ascon_round_s1
            │         └── ascon_round_s2
            └── reset_sync
```

- **Interface**: SPI slave — communicates with external MCU/FPGA master
- **Internal bus**: AXI-Lite — connects SPI frontend to ASCON crypto backend
- **Crypto core**: ASCON-AEAD128a — full encryption + decryption + tag verification
- **Target**: GF180MCU padring via LibreLane (workshop slot)

The chip-top integration files (SPI slave top module, AXI integration, padring RTL, hardened macro with GDS/LEF/LIB/SPEF, and LibreLane run results) are in [`chip_top_integration/`](https://github.com/yashv373/ascon128/tree/main/chip_top_integration).

---

```
ascon128/
├── RTL_Design_Verification/       # ASCON core RTL design & cocotb/Verilog testbenches
│   ├── design/
│   │   ├── core_non_pipelined.v   # Non-pipelined ASCON core
│   │   └── core_pipelined.v       # Pipelined ASCON core
│   └── verification/
│       ├── coco_tb.py             # Cocotb testbench
│       ├── ascon_golden_model.py  # Python golden model
│       └── tb.v                   # Verilog testbench
│
├── synthesis/                     # Yosys synthesis (GF180MCU)
│   ├── ascon_core_adpt_encdec.nl.v
│   ├── reports/                   # Synthesis reports
│   └── yosys-synthesis.log
│
├── post_synthesis_GLS/            # Post-synthesis gate-level simulation
│   ├── ascon_core_PostSYN_GLS/    # Core-level GLS
│   ├── ascon_full_GLS_postSYN/    # Full design post-synth & post-PnR GLS
│   └── Coco_TB_trial/             # Cocotb-based GLS
│
├── physical_design/               # Physical design runs via LibreLane
│   ├── LibreLane_4jul/            # Early run
│   └── librelane_12jul_Working/   # Working run with deliverables
│
├── chip_top_integration/          # Final chip-level integration (from padring repo)
│   ├── src_cryptoaccel/           # SPI slave, AXI wrapper, ASCON core RTL, OpenLane config
│   ├── padring_top/               # chip_top.sv, chip_core.sv, pad mapping
│   ├── macro/                     # Hardened spi_slave macro (GDS, LEF, LIB, netlists, SPEF)
│   ├── gds_Cryptoaccel/           # GDS output (dry run)
│   └── librelane_cryptoaccel/     # LibreLane run results & metrics
│
├── ascon_core_adpt_encdec.gds     # Core GDS (standalone)
├── ascon_core_adpt_encdec.lef     # Core LEF (standalone)
├── ascon_core_adpt_encdec.nl.v    # Core netlist (standalone)
└── README.md
```

---

<img width="2352" height="480" alt="image" src="https://github.com/user-attachments/assets/314551d8-5433-46fe-82a8-d775ba6bbfe2" style="width:50%;"/>

## Team

| Name              | Discord name  | Affiliation                       | Role         | Experience                            | Contribution                                                                          |
| ----------------- | ------------- | ---------------------------------- | ------------ | -------------------------------------- | -------------------------------------------------------------------------------------- |
| Lakshmi K Iyer    | lakvlsi_90908 | IIT, Bombay                        | Team Lead    | Ph.D. Research Scholar / Postgraduate  | RTL Core Design & Architecture + RTL Design of Interface + Team Management             |
| Yashvardhan Singh | zysteresis    | MIT, Manipal / STMicroelectronics  | Team Member  | Undergraduate (III)                    | Design Verification + Post-Synth Verification + PD via Librelane + Documentation + GitHub VCS and Docs |
| Tarun R S         | tarun_rs05    | IIIT, Bangalore                    | Team Member  | Undergraduate (II)                     | RTL Design + PD via ORFS                                                                |
| Harshitha Shetty  | harshi070852  | PESIT, Bangalore                   | Team Member  | Undergraduate (IV)                     | AXI-Lite Wrapper Design                                                                 |
