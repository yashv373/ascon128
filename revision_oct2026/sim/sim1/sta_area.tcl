set F /foss/designs/ascon_final/runs/ascon_final/final
read_liberty /foss/pdks/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/lib/gf180mcu_fd_sc_mcu7t5v0__tt_025C_3v30.lib
read_verilog $F/pnl/spi_slave.pnl.v
link_design spi_slave
report_design_area
report_cell_usage
set a [get_property [lindex [get_lib_cells */gf180mcu_fd_sc_mcu7t5v0__nand2_1] 0] area]
puts "NAND2_X1 area = $a"
