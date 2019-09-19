set search_path ../ref/models/
set target_library saed90nm_typ_ht.db
set link_library saed90nm_typ_ht.db
read_verilog ../source/bitdetector_syn.v
link
read_sdc ../source/bitdetector.sdc
report_constraint -all_violators -significant_digits 1
report_timing -delay_type max -nworst 1 -significant_digits 4 > ../results/bitdetector_max_timing.rpt
report_timing -delay_type min -nworst 1 -significant_digits 4 > ../results/bitdetector_min_timing.rpt
report_timing -from [all_inputs] -nworst 1 -significant_digits 4 -to [all_registers -data_pins] > ../results/in_to_ff.rpt
report_timing -from [all_registers -clock_pins] -nworst 1 -significant_digits 4 -to [all_registers -data_pins] > ../results/ff_to_ff.rpt
report_timing -from [all_registers -clock_pins] -nworst 1 -significant_digits 4 -to [all_outputs] > ../results/ff_to_out.rpt
report_timing -from [all_inputs] -to [all_outputs] -nworst 10 -significant_digits 4 > ../results/in_to_out.rpt
