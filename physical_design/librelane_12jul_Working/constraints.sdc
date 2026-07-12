# ASCON 128 Core Constraints SDC
# Cleaned up: removed unnecessary workarounds

set_units -time 1.0ns
set_units -capacitance 1.0pF

# 1. Clock Definition
if { [info exists ::env(CLOCK_PORT)] } {
    set EXTCLK1 $::env(CLOCK_PORT)
} else {
    set EXTCLK1 "clk"
}

if { [info exists ::env(CLOCK_PERIOD)] } {
    set EXTCLK1_PERIOD $::env(CLOCK_PERIOD)
} else {
    set EXTCLK1_PERIOD 40.0
}

create_clock -name "$EXTCLK1" -period "$EXTCLK1_PERIOD" -waveform "0 [expr $EXTCLK1_PERIOD/2]" [get_ports $EXTCLK1]

# 2. Clock Uncertainty and Transition
set SETUP_UNCERTAINTY 0.5
set HOLD_UNCERTAINTY 0.25
set_clock_uncertainty -setup $SETUP_UNCERTAINTY [get_clocks $EXTCLK1]
set_clock_uncertainty -hold $HOLD_UNCERTAINTY [get_clocks $EXTCLK1]

if { [info exists ::env(CLOCK_TRANSITION_CONSTRAINT)] } {
    set_clock_transition $::env(CLOCK_TRANSITION_CONSTRAINT) [get_clocks $EXTCLK1]
} else {
    set_clock_transition 0.15 [get_clocks $EXTCLK1]
}

# 3. Input / Output Delays
set MAX_IN_DELAY 1.50
set MAX_OUT_DELAY 1.50 

set IN_PORTS [get_ports {start dec_mode k0_in k1_in n0_in n1_in tag0_in tag1_in ad_empty ad_valid ad_last ad_data ad_bytes din_valid din_last din_data din_bytes}]
set_input_delay -min 0.0 -clock [get_clocks $EXTCLK1] $IN_PORTS
set_input_delay -max $MAX_IN_DELAY -clock [get_clocks $EXTCLK1] $IN_PORTS

set OUT_PORTS [get_ports {ad_ready din_ready dout_valid dout_last dout_data dout_bytes busy done auth_ok t0_out t1_out}]
set_output_delay -clock [get_clocks $EXTCLK1] $MAX_OUT_DELAY $OUT_PORTS

# 4. Driving Cell / Load Modeling
set_load 0.05 [all_outputs]

# 5. Global DRC Constraints
if { [info exists ::env(MAX_FANOUT_CONSTRAINT)] } {
    set_max_fanout 10000 [current_design]
} else {
    set_max_fanout 10000 [current_design]
}

if { [info exists ::env(MAX_TRANSITION_CONSTRAINT)] } {
    set_max_transition $::env(MAX_TRANSITION_CONSTRAINT) [current_design]
}

if { [info exists ::env(OPENLANE_SDC_IDEAL_CLOCKS)] && $::env(OPENLANE_SDC_IDEAL_CLOCKS) } {
    unset_propagated_clock [all_clocks]
} else {
    set_propagated_clock [all_clocks]
}

# Mark rst_n as a false path so the resizer doesn't try to buffer it
# (async reset doesn't need timing closure)
set_false_path -from [get_ports rst_n]
