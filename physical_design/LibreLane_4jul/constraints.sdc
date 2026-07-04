# ASCON 128 Core Constraints SDC

set_units -time 1.0ns
set_units -capacitance 1.0pF

set EXTCLK1 "clk"
set EXTCLK1_PERIOD 40.0

#  Clock Definition
create_clock -name "$EXTCLK1" -period "$EXTCLK1_PERIOD" -waveform "0 [expr $EXTCLK1_PERIOD/2]" [get_ports $EXTCLK1]

 
set SETUP_UNCERTAINTY 0.5
set HOLD_UNCERTAINTY 0.25

set_clock_uncertainty -setup $SETUP_UNCERTAINTY [get_clocks $EXTCLK1]
set_clock_uncertainty -hold $HOLD_UNCERTAINTY [get_clocks $EXTCLK1]

 
set INDELAY 3.00
set OUTDELAY 3.00 
set_input_delay -clock [get_clocks $EXTCLK1] -add_delay $INDELAY [get_ports {rst_n start dec_mode k0_in k1_in n0_in n1_in tag0_in tag1_in ad_empty ad_valid ad_last ad_data ad_bytes din_valid din_last din_data din_bytes}]

set_output_delay -clock [get_clocks $EXTCLK1] -add_delay $OUTDELAY [get_ports {ad_ready din_ready dout_valid dout_last dout_data dout_bytes busy done auth_ok t0_out t1_out}]

 
set_max_capacitance 5 [all_outputs]
set_max_fanout 10 [current_design]
