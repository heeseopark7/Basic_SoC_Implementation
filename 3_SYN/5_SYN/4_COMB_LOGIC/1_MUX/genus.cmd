# Cadence Genus(TM) Synthesis Solution, Version 22.17-s071_1, built Sep 12 2024 12:37:05

# Date: Wed Jul 08 02:12:50 2026
# Host: kopo-seongnam (x86_64 w/Linux 3.10.0-1160.el7.x86_64) (20cores*80cpus*2physical cpus*Intel(R) Xeon(R) Gold 5218R CPU @ 2.10GHz 28160KB)
# OS:   CentOS Linux release 7.9.2009 (Core)

gui_raise
set_db init_lib_search_path ../../1_LIB
set_db init_hdl_search_path ../../../4_COMB_LOGIC/1_MUX
read_lib slow_vdd1v0_basicCells.lib
read_libs slow_vdd1v0_basicCells.lib
set_db init_lib_search_path ../../../1_LIB
read_libs slow_vdd1v0_basicCells.lib
read_hdl gpio_mux.v
set_db init_hdl_search_path ../../../../4_COMB_LOGIC/1_MUX
read_hdl gpio_mux.v
read_hdl gpio_mux.v
set_db init_hdl_search_path ../../../4_COMB_LOGIC/1_MUX
read_hdl gpio_mux.v
cl
clear
exit
