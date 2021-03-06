transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/temp_desktop/Graduate/Design/FPGA {D:/temp_desktop/Graduate/Design/FPGA/Design_Of_Graduation.v}
vlog -vlog01compat -work work +incdir+D:/temp_desktop/Graduate/Design/FPGA/Lesson_3 {D:/temp_desktop/Graduate/Design/FPGA/Lesson_3/RS_Trigger_3_1.v}

vlog -vlog01compat -work work +incdir+D:/temp_desktop/Graduate/Design/FPGA/simulation/modelsim {D:/temp_desktop/Graduate/Design/FPGA/simulation/modelsim/Design_Of_Graduation.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  Design_Of_Graduation_vlg_tst

add wave *
view structure
view signals
run -all
