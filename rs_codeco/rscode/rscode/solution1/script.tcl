############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
############################################################
open_project rscode
set_top encode_rs
add_files rscode.h
add_files rscode.cpp
add_files -tb rscode_inspire.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xcvu37p-fsvh2892-2L-e}
create_clock -period 10 -name default
config_export -format ip_catalog -output /home/caohy168/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.srcs/sources_1/ip/rscodeco/rscode/encode_rs.zip -rtl verilog
source "./rscode/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -wave_debug -trace_level all
export_design -flow impl -rtl verilog -format ip_catalog -output /home/caohy168/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.srcs/sources_1/ip/rscodeco/rscode/encode_rs.zip
