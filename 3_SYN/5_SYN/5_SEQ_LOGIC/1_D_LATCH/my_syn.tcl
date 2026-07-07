set_db init_lib_search_path /home/hah013/Basic_SoC_Implementation/3_SYN/1_LIB
set_db init_hdl_search_path /home/hah013/Basic_SoC_Implementation/1_RTL/5_SEQ_LOGIC/1_D_LATCH
read_libs slow_vdd1v0_basicCells.lib
read_hdl d_latch.v

elaborate

read_sdc /home/hah013/Basic_SoC_Implementation/3_SYN/2_CONSTRAINTS/sample.sdc
set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium

syn_generic
syn_map
syn_opt

report_timing > ./reports/rpt_timing.rpt
report_power > ./reports/rpt_power.rpt
report_area > ./reports/rpt_area.rpt
report_qor > ./reports/rpt_qor.rpt

write_hdl > ./outputs/d_latch_netlist.v
write_sdc > ./outputs/d_latch_final.sdc
