lappend search_path ../ref/models/
set target_library saed90nm_typ_ht.db
set link_library saed90nm_typ_ht.db
create_mw_lib  -technology /home/thuan/Assignment2_s3574935/asic/icc/ref/techfiles/saed90nm_icc_1p9m.tf -mw_reference_library {/home/thuan/Assignment2_s3574935/asic/icc/ref/saed90nm_fr} -bus_naming_style {[%d]}  -open  ./BITDETECTOR
set_tlu_plus_files -max_tluplus /home/thuan/Assignment2_s3574935/asic/icc/ref/tluplus/saed90nm_1p9m_1t_Cmax.tluplus -min_tluplus /home/thuan/Assignment2_s3574935/asic/icc/ref/tluplus/saed90nm_1p9m_1t_Cmin.tluplus -tech2itf_map  /home/thuan/Assignment2_s3574935/asic/icc/ref/tluplus/tech2itf.map
import_designs -format verilog -top bitdetector -cel bitdetector {/home/thuan/Assignment2_s3574935/asic/icc/source/bitdetector_syn.v}
read_sdc ../source/bitdetector.sdc
save_mw_cel -as preparing
