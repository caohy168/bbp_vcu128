#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2021.1 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Sat Oct 09 01:39:08 PDT 2021
# SW Build 3247384 on Thu Jun 10 19:36:07 MDT 2021
#
# IP Build 3246043 on Fri Jun 11 00:30:35 MDT 2021
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# elaborate design
echo "xelab -wto cdf7a91dbf45413db89d20e6fb0a8bbb --incr --debug typical --relax --mt 8 -L xil_defaultlib -L axis_infrastructure_v1_1_0 -L axis_data_fifo_v2_0_6 -L xbip_utils_v3_0_10 -L c_reg_fd_v12_0_6 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_pipe_v3_0_6 -L xbip_dsp48_addsub_v3_0_6 -L xbip_addsub_v3_0_6 -L c_addsub_v12_0_14 -L xbip_bram18k_v3_0_6 -L mult_gen_v12_0_17 -L axi_utils_v2_0_6 -L xbip_dsp48_multadd_v3_0_6 -L dds_compiler_v6_0_21 -L uvm -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot Networking_Processing_Unit_behav xil_defaultlib.Networking_Processing_Unit xil_defaultlib.glbl -log elaborate.log"
xelab -wto cdf7a91dbf45413db89d20e6fb0a8bbb --incr --debug typical --relax --mt 8 -L xil_defaultlib -L axis_infrastructure_v1_1_0 -L axis_data_fifo_v2_0_6 -L xbip_utils_v3_0_10 -L c_reg_fd_v12_0_6 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_pipe_v3_0_6 -L xbip_dsp48_addsub_v3_0_6 -L xbip_addsub_v3_0_6 -L c_addsub_v12_0_14 -L xbip_bram18k_v3_0_6 -L mult_gen_v12_0_17 -L axi_utils_v2_0_6 -L xbip_dsp48_multadd_v3_0_6 -L dds_compiler_v6_0_21 -L uvm -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot Networking_Processing_Unit_behav xil_defaultlib.Networking_Processing_Unit xil_defaultlib.glbl -log elaborate.log

