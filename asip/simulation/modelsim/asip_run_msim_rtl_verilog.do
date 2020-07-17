transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/erick/Documents/Git/ASIP-for-decryption-using-RSA/asip/asip/memories {C:/Users/erick/Documents/Git/ASIP-for-decryption-using-RSA/asip/asip/memories/data_mem_test.sv}
vlog -sv -work work +incdir+C:/Users/erick/Documents/Git/ASIP-for-decryption-using-RSA/asip/asip/memories {C:/Users/erick/Documents/Git/ASIP-for-decryption-using-RSA/asip/asip/memories/dmem_cell.sv}
vlog -sv -work work +incdir+C:/Users/erick/Documents/Git/ASIP-for-decryption-using-RSA/asip/asip/memories {C:/Users/erick/Documents/Git/ASIP-for-decryption-using-RSA/asip/asip/memories/data_mem.sv}

