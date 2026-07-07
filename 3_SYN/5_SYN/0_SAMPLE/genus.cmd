# Cadence Genus(TM) Synthesis Solution, Version 22.17-s071_1, built Sep 12 2024 12:37:05

# Date: Wed Jul 08 01:33:59 2026
# Host: kopo-seongnam (x86_64 w/Linux 3.10.0-1160.el7.x86_64) (20cores*80cpus*2physical cpus*Intel(R) Xeon(R) Gold 5218R CPU @ 2.10GHz 28160KB)
# OS:   CentOS Linux release 7.9.2009 (Core)

gui_raise
set_db init_lib_search_path ../../1_LIB
set_db init_hdl_search_path ../../4_SAMPLE_RTL
read_libs slow_vdd1v0_basicCells.lib
read_hdl counter.v
elaborate
read_sdc ../../2_CONSTRAINTS/sample.sdc
set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium
syn_generic
syn_map
syn_opt
report_timing > ./reports/rpt_timing.rpt
report_power > ./reports/rpt_power.rpt
report_area > reports/rpt_area.rpt
report_qor > reports/report_qor.rpt
write_hdl > ./outputs/counter_netlist.v
write_sdc > ./outputs/counter_sdc.sdc
