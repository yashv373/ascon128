# IP-XACT Packaging and Assembly

This directory contains the IP-XACT standard component packaging and SoC assembly for the ASCON-AEAD128a hardware accelerator (`ascon_top`), generated using Kactus2.

## What is this?
It encapsulates the raw Verilog source code, physical layout (GDSII), constraints (SDC), and configuration files into an industry-standard reusable IP block. The included library (`Library/`) allows other developers to easily integrate the accelerator into their own System-on-Chip (SoC) designs using a drag-and-drop methodology.

## What steps were taken?
1. **Component Creation**: A new IP-XACT (IEEE 1685-2014) Hardware Component (`ascon_top`) was defined with its Vendor, Library, Name, and Version (VLNV).
2. **Ports Definition**: The top-level interface ports (`clk`, `rst_n`, `sclk`, `mosi`, `miso`, `cs_n`) were manually mapped to ensure robustness.
3. **File Sets**: The underlying design files were categorized into File Sets:
   - `external_rtl`: The raw Verilog source files (e.g. `spi_slave.v`, `ascon_core_adpt_encdec.v`, etc.).
   - `fileset_synthesis`: The synthesis constraints (`constraints_run2_maxtran6.sdc`).
   - `fileset_physical`: The LibreLane layout config (`config_run2_maxtran6.yaml`, `io.cfg`) and final hardened GDSII.
4. **Instantiations & Views**: Component Instantiations were created to map these File Sets into specific System Views (`simulation`, `synthesis`, `Librelane_PD`).
5. **SoC Assembly**: A test Hardware Design (`ascon_soc`) was created to verify that the packaged `ascon_top` component can be successfully instantiated and structurally wired on an SoC canvas.
