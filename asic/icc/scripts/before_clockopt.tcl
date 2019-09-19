create_floorplan -core_utilization 0.35 -start_first_row -flip_first_row -left_io2core 1 -bottom_io2core 1 -right_io2core 1 -top_io2core 1
save_mw_cel -as floorplan
derive_pg_connection -power_net {VDD} -ground_net {VSS} -power_pin {VDD} -ground_pin {VSS} -create_ports top
create_rectangular_rings -nets {VDD VSS} -left_offset 0.2 -left_segment_layer M4 -right_offset 0.2 -right_segment_layer M4 -bottom_offset 0.2 -bottom_segment_layer M3 -top_offset 0.2 -top_segment_layer M3
create_power_straps -direction vertical -nets {VDD} -layer M4 -width 0.140 -configure groups_and_step -num_groups 20 -step 3
create_power_straps -direction horizontal -nets {VDD} -layer M3 -width 0.140 -configure groups_and_step -num_groups 20 -step 3
create_power_straps -direction horizontal -start_at 1.5 -nets {VSS} -layer M3 -width 0.140 -configure groups_and_step -num_groups 20 -step 3
create_power_straps -direction vertical -start_at 1.5 -nets {VSS} -layer M4 -width 0.140 -configure groups_and_step -num_groups 20 -step 3
save_mw_cel -as floorplan
place_opt -effort high -power -congestion
save_mw_cel -as placement

