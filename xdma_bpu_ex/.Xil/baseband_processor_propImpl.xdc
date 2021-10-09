set_property SRC_FILE_INFO {cfile:/home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.srcs/sources_1/ip/bbp_mmc/bbp_mmc.xdc rfile:../xdma_bpu_ex.srcs/sources_1/ip/bbp_mmc/bbp_mmc.xdc id:1 order:EARLY scoped_inst:bbp_clock_gruop1/inst} [current_design]
set_property SRC_FILE_INFO {cfile:/home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/xilinx_pcie_xdma_ref_board.xdc rfile:../imports/xilinx_pcie_xdma_ref_board.xdc id:2} [current_design]
current_instance bbp_clock_gruop1/inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1_p]] 0.080
current_instance
set_property src_info {type:XDC file:2 line:105 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -to [get_pins -hier *sync_reg[0]/D]
