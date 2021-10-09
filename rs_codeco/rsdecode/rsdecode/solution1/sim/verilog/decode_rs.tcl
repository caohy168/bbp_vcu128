
log_wave -r /
set designtopgroup [add_wave_group "Design Top Signals"]
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set gg_out_group [add_wave_group gg_out(memory) -into $coutputgroup]
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/gg_out_d0 -into $gg_out_group -radix hex
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/gg_out_we0 -into $gg_out_group -color #ffff00 -radix hex
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/gg_out_ce0 -into $gg_out_group -color #ffff00 -radix hex
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/gg_out_address0 -into $gg_out_group -radix hex
set index_of_out_group [add_wave_group index_of_out(memory) -into $coutputgroup]
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/index_of_out_d0 -into $index_of_out_group -radix hex
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/index_of_out_we0 -into $index_of_out_group -color #ffff00 -radix hex
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/index_of_out_ce0 -into $index_of_out_group -color #ffff00 -radix hex
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/index_of_out_address0 -into $index_of_out_group -radix hex
set alpha_to_out_group [add_wave_group alpha_to_out(memory) -into $coutputgroup]
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/alpha_to_out_d0 -into $alpha_to_out_group -radix hex
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/alpha_to_out_we0 -into $alpha_to_out_group -color #ffff00 -radix hex
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/alpha_to_out_ce0 -into $alpha_to_out_group -color #ffff00 -radix hex
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/alpha_to_out_address0 -into $alpha_to_out_group -radix hex
set recd_gf_out_group [add_wave_group recd_gf_out(memory) -into $coutputgroup]
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/recd_gf_out_d0 -into $recd_gf_out_group -radix hex
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/recd_gf_out_we0 -into $recd_gf_out_group -color #ffff00 -radix hex
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/recd_gf_out_ce0 -into $recd_gf_out_group -color #ffff00 -radix hex
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/recd_gf_out_address0 -into $recd_gf_out_group -radix hex
set recd_out_group [add_wave_group recd_out(axis) -into $coutputgroup]
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/recd_out_TREADY -into $recd_out_group -color #ffff00 -radix hex
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/recd_out_TVALID -into $recd_out_group -color #ffff00 -radix hex
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/recd_out_TDATA -into $recd_out_group -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set syn_error_out_group [add_wave_group syn_error_out(wire) -into $cinputgroup]
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/syn_error_out -into $syn_error_out_group -radix hex
set recd_in_group [add_wave_group recd_in(axis) -into $cinputgroup]
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/recd_in_TREADY -into $recd_in_group -color #ffff00 -radix hex
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/recd_in_TVALID -into $recd_in_group -color #ffff00 -radix hex
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/recd_in_TDATA -into $recd_in_group -radix hex
set blocksiggroup [add_wave_group "Block-level IO Handshake" -into $designtopgroup]
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/ap_start -into $blocksiggroup
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/ap_done -into $blocksiggroup
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/ap_idle -into $blocksiggroup
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/ap_ready -into $blocksiggroup
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/ap_rst_n -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_decode_rs_top/AESL_inst_decode_rs/ap_clk -into $clockgroup
set testbenchgroup [add_wave_group "Test Bench Signals"]
set tbinternalsiggroup [add_wave_group "Internal Signals" -into $testbenchgroup]
set tb_simstatus_group [add_wave_group "Simulation Status" -into $tbinternalsiggroup]
set tb_portdepth_group [add_wave_group "Port Depth" -into $tbinternalsiggroup]
add_wave /apatb_decode_rs_top/AUTOTB_TRANSACTION_NUM -into $tb_simstatus_group -radix hex
add_wave /apatb_decode_rs_top/ready_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_decode_rs_top/done_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_decode_rs_top/LENGTH_recd_in -into $tb_portdepth_group -radix hex
add_wave /apatb_decode_rs_top/LENGTH_recd_out -into $tb_portdepth_group -radix hex
add_wave /apatb_decode_rs_top/LENGTH_recd_gf_out -into $tb_portdepth_group -radix hex
add_wave /apatb_decode_rs_top/LENGTH_syn_error_out -into $tb_portdepth_group -radix hex
add_wave /apatb_decode_rs_top/LENGTH_alpha_to_out -into $tb_portdepth_group -radix hex
add_wave /apatb_decode_rs_top/LENGTH_index_of_out -into $tb_portdepth_group -radix hex
add_wave /apatb_decode_rs_top/LENGTH_gg_out -into $tb_portdepth_group -radix hex
set tbcoutputgroup [add_wave_group "C Outputs" -into $testbenchgroup]
set tb_gg_out_group [add_wave_group gg_out(memory) -into $tbcoutputgroup]
add_wave /apatb_decode_rs_top/gg_out_d0 -into $tb_gg_out_group -radix hex
add_wave /apatb_decode_rs_top/gg_out_we0 -into $tb_gg_out_group -color #ffff00 -radix hex
add_wave /apatb_decode_rs_top/gg_out_ce0 -into $tb_gg_out_group -color #ffff00 -radix hex
add_wave /apatb_decode_rs_top/gg_out_address0 -into $tb_gg_out_group -radix hex
set tb_index_of_out_group [add_wave_group index_of_out(memory) -into $tbcoutputgroup]
add_wave /apatb_decode_rs_top/index_of_out_d0 -into $tb_index_of_out_group -radix hex
add_wave /apatb_decode_rs_top/index_of_out_we0 -into $tb_index_of_out_group -color #ffff00 -radix hex
add_wave /apatb_decode_rs_top/index_of_out_ce0 -into $tb_index_of_out_group -color #ffff00 -radix hex
add_wave /apatb_decode_rs_top/index_of_out_address0 -into $tb_index_of_out_group -radix hex
set tb_alpha_to_out_group [add_wave_group alpha_to_out(memory) -into $tbcoutputgroup]
add_wave /apatb_decode_rs_top/alpha_to_out_d0 -into $tb_alpha_to_out_group -radix hex
add_wave /apatb_decode_rs_top/alpha_to_out_we0 -into $tb_alpha_to_out_group -color #ffff00 -radix hex
add_wave /apatb_decode_rs_top/alpha_to_out_ce0 -into $tb_alpha_to_out_group -color #ffff00 -radix hex
add_wave /apatb_decode_rs_top/alpha_to_out_address0 -into $tb_alpha_to_out_group -radix hex
set tb_recd_gf_out_group [add_wave_group recd_gf_out(memory) -into $tbcoutputgroup]
add_wave /apatb_decode_rs_top/recd_gf_out_d0 -into $tb_recd_gf_out_group -radix hex
add_wave /apatb_decode_rs_top/recd_gf_out_we0 -into $tb_recd_gf_out_group -color #ffff00 -radix hex
add_wave /apatb_decode_rs_top/recd_gf_out_ce0 -into $tb_recd_gf_out_group -color #ffff00 -radix hex
add_wave /apatb_decode_rs_top/recd_gf_out_address0 -into $tb_recd_gf_out_group -radix hex
set tb_recd_out_group [add_wave_group recd_out(axis) -into $tbcoutputgroup]
add_wave /apatb_decode_rs_top/recd_out_TREADY -into $tb_recd_out_group -color #ffff00 -radix hex
add_wave /apatb_decode_rs_top/recd_out_TVALID -into $tb_recd_out_group -color #ffff00 -radix hex
add_wave /apatb_decode_rs_top/recd_out_TDATA -into $tb_recd_out_group -radix hex
set tbcinputgroup [add_wave_group "C Inputs" -into $testbenchgroup]
set tb_syn_error_out_group [add_wave_group syn_error_out(wire) -into $tbcinputgroup]
add_wave /apatb_decode_rs_top/syn_error_out -into $tb_syn_error_out_group -radix hex
set tb_recd_in_group [add_wave_group recd_in(axis) -into $tbcinputgroup]
add_wave /apatb_decode_rs_top/recd_in_TREADY -into $tb_recd_in_group -color #ffff00 -radix hex
add_wave /apatb_decode_rs_top/recd_in_TVALID -into $tb_recd_in_group -color #ffff00 -radix hex
add_wave /apatb_decode_rs_top/recd_in_TDATA -into $tb_recd_in_group -radix hex
save_wave_config decode_rs.wcfg
run all

