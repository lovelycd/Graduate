transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {Design_Of_Graduation_6_1200mv_85c_slow.vo}

vlog -vlog01compat -work work +incdir+D:/temp_desktop/Graduate/Design/FPGA/simulation/modelsim {D:/temp_desktop/Graduate/Design/FPGA/simulation/modelsim/Design_Of_Graduation.vt}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  Design_Of_Graduation_vlg_tst

add wave *
view structure
view signals
run -all
