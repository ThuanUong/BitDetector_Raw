###################################################################

# Created by write_sdc on Tue May 29 10:03:37 2018

###################################################################
set sdc_version 2.0

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA
set_max_area 0
set_load -pin_load 0.004 [get_ports i_ready]
set_load -pin_load 0.004 [get_ports o_valid]
set_load -pin_load 0.004 [get_ports o_sop]
set_load -pin_load 0.004 [get_ports o_eop]
set_load -pin_load 0.004 [get_ports outp]
create_clock [get_ports clk]  -period 20  -waveform {0 10}
set_clock_uncertainty 0.4  [get_clocks clk]
set_clock_transition -max -rise 0.8 [get_clocks clk]
set_clock_transition -min -rise 0.8 [get_clocks clk]
set_clock_transition -max -fall 0.8 [get_clocks clk]
set_clock_transition -min -fall 0.8 [get_clocks clk]
set_input_delay -clock clk  0.85  [get_ports reset_n]
set_input_delay -clock clk  0.85  [get_ports o_ready]
set_input_delay -clock clk  0.85  [get_ports i_valid]
set_input_delay -clock clk  0.85  [get_ports i_sop]
set_input_delay -clock clk  0.85  [get_ports i_eop]
set_input_delay -clock clk  0.85  [get_ports inp]
set_output_delay -clock clk  1  [get_ports i_ready]
set_output_delay -clock clk  1  [get_ports o_valid]
set_output_delay -clock clk  1  [get_ports o_sop]
set_output_delay -clock clk  1  [get_ports o_eop]
set_output_delay -clock clk  1  [get_ports outp]
