transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {bitdetector.vo}

vlog -sv -work work +incdir+C:/Users/Thuan\ Uong/Desktop/Week7/bitdetector {C:/Users/Thuan Uong/Desktop/Week7/bitdetector/bitdetector_tb.sv}

vsim -t 1ps -L cycloneii_ver -L gate_work -L work -voptargs="+acc"  bitdetector_tb

source bitdetector_dump_all_vcd_nodes.tcl
add wave *
view structure
view signals
run -all
