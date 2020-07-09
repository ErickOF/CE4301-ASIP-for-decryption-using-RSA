transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/erick/Documents/Git/ASIP-for-decryption-using-RSA/asip/asip/processor/path/if-stage {C:/Users/erick/Documents/Git/ASIP-for-decryption-using-RSA/asip/asip/processor/path/if-stage/instr_fetch_test.sv}
vlog -sv -work work +incdir+C:/Users/erick/Documents/Git/ASIP-for-decryption-using-RSA/asip/asip/processor/path/if-stage {C:/Users/erick/Documents/Git/ASIP-for-decryption-using-RSA/asip/asip/processor/path/if-stage/pc_ff.sv}
vlog -sv -work work +incdir+C:/Users/erick/Documents/Git/ASIP-for-decryption-using-RSA/asip/asip/processor/path/if-stage {C:/Users/erick/Documents/Git/ASIP-for-decryption-using-RSA/asip/asip/processor/path/if-stage/adder.sv}
vlog -sv -work work +incdir+C:/Users/erick/Documents/Git/ASIP-for-decryption-using-RSA/asip/asip/processor/path/if-stage {C:/Users/erick/Documents/Git/ASIP-for-decryption-using-RSA/asip/asip/processor/path/if-stage/pc_mux.sv}
vlog -sv -work work +incdir+C:/Users/erick/Documents/Git/ASIP-for-decryption-using-RSA/asip/asip/processor/path/if-stage {C:/Users/erick/Documents/Git/ASIP-for-decryption-using-RSA/asip/asip/processor/path/if-stage/if_stage.sv}
vlog -sv -work work +incdir+C:/Users/erick/Documents/Git/ASIP-for-decryption-using-RSA/asip/asip/memories {C:/Users/erick/Documents/Git/ASIP-for-decryption-using-RSA/asip/asip/memories/instruction_mem.sv}

