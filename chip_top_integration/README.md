# Chip-Top Integration (Padring + SPI Slave + ASCON Accelerator)

This directory contains all the files related to the final chip-level integration of the ASCON-128 CryptoAccel design into the GF180MCU padring framework for the IEEE SSCS Chipathon 2026.

> **Source**: These files were contributed to the team's [Chipathon padring repo](https://github.com/lakshmikiyer/Chipathon-2026-A10_Cryptoaccel).

---

## Directory Structure

```
chip_top_integration/
├── src_cryptoaccel/          # CryptoAccel RTL source & OpenLane config
│   ├── spi_slave.v           # SPI slave top module (chip-level top)
│   ├── ascon_core_adpt_encdec.v  # ASCON core (enc/dec state machine)
│   ├── ascon_round_s1.v      # ASCON round stage 1
│   ├── ascon_round_s2.v      # ASCON round stage 2
│   ├── axi_ascon.v           # AXI-Lite wrapper for ASCON
│   ├── axi_master.v          # AXI master interface
│   ├── reset_sync.v          # Reset synchronizer
│   ├── config_run2_maxtran6.yaml    # OpenLane run configuration
│   ├── constraints_run2_maxtran6.sdc # Timing constraints (SDC)
│   └── io.cfg                # I/O configuration
│
├── padring_top/              # Padring top-level integration RTL
│   ├── chip_top.sv           # Top-level chip with padring
│   ├── chip_core.sv          # Core logic wrapper (SPI → ASCON)
│   ├── pad_map.svh           # Pad-to-signal mapping
│   └── slot_defines.svh      # Slot parameter definitions
│
├── macro/                    # Hardened spi_slave macro collateral
│   ├── gds/                  # GDSII layout
│   ├── lef/                  # LEF abstract
│   ├── lib/                  # Liberty timing (3 PVT corners)
│   │   ├── max_ss_125C_3v00/ # Slow-slow corner
│   │   ├── min_ff_n40C_3v60/ # Fast-fast corner
│   │   └── nom_tt_025C_3v30/ # Typical corner
│   ├── nl/                   # Gate-level netlists
│   ├── pnl/                  # Post-PnR netlist
│   ├── spef/                 # Parasitic extraction (SPEF)
│   │   ├── max/
│   │   ├── min/
│   │   └── nom/
│   └── vh/                   # Verilog header
│
├── gds_Cryptoaccel/          # GDS output files
│   └── gds_dry_run/          # Dry run GDS (KLayout)
│
└── librelane_cryptoaccel/    # LibreLane run results
    ├── metrics.csv           # PPA metrics
    ├── readme.md             # Run summary
    └── run2_maxtran6_rerun.txt  # Run log
```

---

## Design Hierarchy

```
chip_top (padring_top/chip_top.sv)
  └── chip_core (padring_top/chip_core.sv)
       └── spi_slave (src_cryptoaccel/spi_slave.v)
            ├── axi_master (src_cryptoaccel/axi_master.v)
            ├── axi_ascon (src_cryptoaccel/axi_ascon.v)
            │    └── ascon_core_adpt_encdec (src_cryptoaccel/ascon_core_adpt_encdec.v)
            │         ├── ascon_round_s1
            │         └── ascon_round_s2
            └── reset_sync (src_cryptoaccel/reset_sync.v)
```
