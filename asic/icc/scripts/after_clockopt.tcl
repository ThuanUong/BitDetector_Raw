clock_opt
save_mw_cel -as cts
preroute_standard_cells -nets {VDD VSS} -connect horizontal -port_filter_mode off -cell_master_filter_mode off -cell_instance_filter_mode off -voltage_area_filter_mode off -route_type {P/G Std. Cell Pin Conn}
save_mw_cel -as pre_route
route_opt -effort high -incremental
save_mw_cel -as route
insert_stdcell_filler  -cell_without_metal "SHFILL1"  -connect_to_power {VDD}  -connect_to_ground {VSS}
verify_lvs -ignore_floating_port
write_verilog -pg -no_physical_only_cells ../results/bitdetector_post.v
write_parasitics -output {../results/bitdetector.spef}
write_stream -format gds -lib_name /home/thuan/Assignment2_s3574935/asic/icc/work/BITDETECTOR -cells {bitdetector } ../results/bitdetector.gds
report_power > ../results/power.rpt
report_area > ../results/area.rpt
