coco tb based timing aware gate level simulation attempt
---

We attempted to run Timing-Aware Gate-Level Simulation (GLS) with a Python-based cocotb testbench to increase verification functional coverage. 
so, created a script to dynamically load the netlist, SDF timing files, and Python tests from this GitHub Repo into EDA Playground using the Synopsys VCS simulator.

However, this failed because EDA Playground's security sandbox completely blocks the background connections (VPI shared libraries) needed for Python and VCS to communicate. 
Therefore, running cocotb-based timing simulations is not feasible when sticking strictly to freesource/opensource, cloud-based tools like EDA Playground.
