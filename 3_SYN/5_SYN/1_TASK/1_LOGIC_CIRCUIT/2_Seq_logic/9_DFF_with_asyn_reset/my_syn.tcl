set_db init_lib_search_path /home/hah013/Basic_SoC_Implementation/3_SYN/1_LIB
set_db init_hdl_search_path /home/hah013/Basic_SoC_Implementation/1_RTL/1_TASK/1_LOGIC_CIRCUIT/2_Seq_logic/9_DFF_with_asyn_reset
read_libs slow_vdd1v0_basicCells.lib
read_hdl d_ff_asyn_3.v

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

write_hdl > ./outputs/d_ff_asyn_3_netlist.v
write_sdc > ./outputs/d_ff_asyn_3.sdc
