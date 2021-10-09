
log_wave -r /
set designtopgroup [add_wave_group "Design Top Signals"]
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set gg_out_group [add_wave_group gg_out(memory) -into $coutputgroup]
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/gg_out_d0 -into $gg_out_group -radix hex
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/gg_out_we0 -into $gg_out_group -color #ffff00 -radix hex
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/gg_out_ce0 -into $gg_out_group -color #ffff00 -radix hex
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/gg_out_address0 -into $gg_out_group -radix hex
set index_of_out_group [add_wave_group index_of_out(memory) -into $coutputgroup]
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/index_of_out_d0 -into $index_of_out_group -radix hex
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/index_of_out_we0 -into $index_of_out_group -color #ffff00 -radix hex
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/index_of_out_ce0 -into $index_of_out_group -color #ffff00 -radix hex
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/index_of_out_address0 -into $index_of_out_group -radix hex
set alpha_to_out_group [add_wave_group alpha_to_out(memory) -into $coutputgroup]
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/alpha_to_out_d0 -into $alpha_to_out_group -radix hex
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/alpha_to_out_we0 -into $alpha_to_out_group -color #ffff00 -radix hex
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/alpha_to_out_ce0 -into $alpha_to_out_group -color #ffff00 -radix hex
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/alpha_to_out_address0 -into $alpha_to_out_group -radix hex
set recd_out_group [add_wave_group recd_out(axis) -into $coutputgroup]
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/recd_out_TREADY -into $recd_out_group -color #ffff00 -radix hex
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/recd_out_TVALID -into $recd_out_group -color #ffff00 -radix hex
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/recd_out_TDATA -into $recd_out_group -radix hex
set bb_out_group [add_wave_group bb_out(memory) -into $coutputgroup]
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/bb_out_d0 -into $bb_out_group -radix hex
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/bb_out_we0 -into $bb_out_group -color #ffff00 -radix hex
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/bb_out_ce0 -into $bb_out_group -color #ffff00 -radix hex
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/bb_out_address0 -into $bb_out_group -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set data_in_group [add_wave_group data_in(axis) -into $cinputgroup]
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/data_in_TREADY -into $data_in_group -color #ffff00 -radix hex
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/data_in_TVALID -into $data_in_group -color #ffff00 -radix hex
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/data_in_TDATA -into $data_in_group -radix hex
set blocksiggroup [add_wave_group "Block-level IO Handshake" -into $designtopgroup]
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/ap_start -into $blocksiggroup
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/ap_done -into $blocksiggroup
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/ap_idle -into $blocksiggroup
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/ap_ready -into $blocksiggroup
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/ap_rst_n -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_encode_rs_top/AESL_inst_encode_rs/ap_clk -into $clockgroup
set testbenchgroup [add_wave_group "Test Bench Signals"]
set tbinternalsiggroup [add_wave_group "Internal Signals" -into $testbenchgroup]
set tb_simstatus_group [add_wave_group "Simulation Status" -into $tbinternalsiggroup]
set tb_portdepth_group [add_wave_group "Port Depth" -into $tbinternalsiggroup]
add_wave /apatb_encode_rs_top/AUTOTB_TRANSACTION_NUM -into $tb_simstatus_group -radix hex
add_wave /apatb_encode_rs_top/ready_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_encode_rs_top/done_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_encode_rs_top/LENGTH_data_in -into $tb_portdepth_group -radix hex
add_wave /apatb_encode_rs_top/LENGTH_bb_out -into $tb_portdepth_group -radix hex
add_wave /apatb_encode_rs_top/LENGTH_recd_out -into $tb_portdepth_group -radix hex
add_wave /apatb_encode_rs_top/LENGTH_alpha_to_out -into $tb_portdepth_group -radix hex
add_wave /apatb_encode_rs_top/LENGTH_index_of_out -into $tb_portdepth_group -radix hex
add_wave /apatb_encode_rs_top/LENGTH_gg_out -into $tb_portdepth_group -radix hex
set tbcoutputgroup [add_wave_group "C Outputs" -into $testbenchgroup]
set tb_gg_out_group [add_wave_group gg_out(memory) -into $tbcoutputgroup]
add_wave /apatb_encode_rs_top/gg_out_d0 -into $tb_gg_out_group -radix hex
add_wave /apatb_encode_rs_top/gg_out_we0 -into $tb_gg_out_group -color #ffff00 -radix hex
add_wave /apatb_encode_rs_top/gg_out_ce0 -into $tb_gg_out_group -color #ffff00 -radix hex
add_wave /apatb_encode_rs_top/gg_out_address0 -into $tb_gg_out_group -radix hex
set tb_index_of_out_group [add_wave_group index_of_out(memory) -into $tbcoutputgroup]
add_wave /apatb_encode_rs_top/index_of_out_d0 -into $tb_index_of_out_group -radix hex
add_wave /apatb_encode_rs_top/index_of_out_we0 -into $tb_index_of_out_group -color #ffff00 -radix hex
add_wave /apatb_encode_rs_top/index_of_out_ce0 -into $tb_index_of_out_group -color #ffff00 -radix hex
add_wave /apatb_encode_rs_top/index_of_out_address0 -into $tb_index_of_out_group -radix hex
set tb_alpha_to_out_group [add_wave_group alpha_to_out(memory) -into $tbcoutputgroup]
add_wave /apatb_encode_rs_top/alpha_to_out_d0 -into $tb_alpha_to_out_group -radix hex
add_wave /apatb_encode_rs_top/alpha_to_out_we0 -into $tb_alpha_to_out_group -color #ffff00 -radix hex
add_wave /apatb_encode_rs_top/alpha_to_out_ce0 -into $tb_alpha_to_out_group -color #ffff00 -radix hex
add_wave /apatb_encode_rs_top/alpha_to_out_address0 -into $tb_alpha_to_out_group -radix hex
set tb_recd_out_group [add_wave_group recd_out(axis) -into $tbcoutputgroup]
add_wave /apatb_encode_rs_top/recd_out_TREADY -into $tb_recd_out_group -color #ffff00 -radix hex
add_wave /apatb_encode_rs_top/recd_out_TVALID -into $tb_recd_out_group -color #ffff00 -radix hex
add_wave /apatb_encode_rs_top/recd_out_TDATA -into $tb_recd_out_group -radix hex
set tb_bb_out_group [add_wave_group bb_out(memory) -into $tbcoutputgroup]
add_wave /apatb_encode_rs_top/bb_out_d0 -into $tb_bb_out_group -radix hex
add_wave /apatb_encode_rs_top/bb_out_we0 -into $tb_bb_out_group -color #ffff00 -radix hex
add_wave /apatb_encode_rs_top/bb_out_ce0 -into $tb_bb_out_group -color #ffff00 -radix hex
add_wave /apatb_encode_rs_top/bb_out_address0 -into $tb_bb_out_group -radix hex
set tbcinputgroup [add_wave_group "C Inputs" -into $testbenchgroup]
set tb_data_in_group [add_wave_group data_in(axis) -into $tbcinputgroup]
add_wave /apatb_encode_rs_top/data_in_TREADY -into $tb_data_in_group -color #ffff00 -radix hex
add_wave /apatb_encode_rs_top/data_in_TVALID -into $tb_data_in_group -color #ffff00 -radix hex
add_wave /apatb_encode_rs_top/data_in_TDATA -into $tb_data_in_group -radix hex
save_wave_config encode_rs.wcfg
run all

