# OpenSTA TT power: usage  VCD=<file or none> SCOPE=<tb/dut> sta -no_splash -exit sta_power.tcl
set F /foss/designs/ascon_final/runs/ascon_final/final
read_liberty /foss/pdks/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/lib/gf180mcu_fd_sc_mcu7t5v0__tt_025C_3v30.lib
read_verilog $F/pnl/spi_slave.pnl.v
link_design spi_slave
read_sdc $F/sdc/spi_slave.sdc
read_spef $F/spef/nom/spi_slave.nom.spef
set_propagated_clock [all_clocks]
if {$::env(VCD) ne "none"} {
  read_vcd -scope $::env(SCOPE) $::env(VCD)
}
report_power -digits 5
