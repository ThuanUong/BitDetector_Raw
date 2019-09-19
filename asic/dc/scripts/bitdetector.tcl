set search_path ../source/
set target_library ../ref/models/saed90nm_typ_ht.db
set link_library ../ref/models/saed90nm_typ_ht.db
read_file -format sverilog ../source/bitdetector.sv
analyze -library WORK -format sverilog ../source/bitdetector.sv
elaborate bitdetector -architecture verilog -library DEFAULT
link
check_design
check_design > ../results/synth_check_design.rpt
create_clock [get_ports clk] -period 20
set_clock_uncertainty 0.4 clk
set_clock_transition -rise 0.8 [get_clocks clk]
set_clock_transition -fall 0.8 [get_clocks clk]
set_input_delay -clock clk 0.85 [get_ports reset_n]
set_input_delay -clock clk 0.85 [get_ports o_ready]
set_input_delay -clock clk 0.85 [get_ports i_valid]
set_input_delay -clock clk 0.85 [get_ports i_sop]
set_input_delay -clock clk 0.85 [get_ports i_eop]
set_input_delay -clock clk 0.85 [get_ports inp]
set_output_delay -clock clk 1 [get_ports i_ready]
set_output_delay -clock clk 1 [get_ports o_valid]
set_output_delay -clock clk 1 [get_ports o_sop]
set_output_delay -clock clk 1 [get_ports o_eop]
set_output_delay -clock clk 1 [get_ports outp]
set_load -pin_load 0.004 [all_outputs]
set_max_area 0
compile_ultra -exact_map
report_area > ../results/synth_area.rpt
report_cell > ../results/synth_cells.rpt
report_qor > ../results/synth_qor.rpt
write_sdc ../results/bitdetector.sdc
write -format verilog -o ../results/bitdetector_syn.v
