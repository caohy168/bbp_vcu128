// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1.1 (lin64) Build 3286242 Wed Jul 28 13:09:46 MDT 2021
// Date        : Sun Sep 12 22:27:16 2021
// Host        : caohy168 running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ l_ethernet_40G_stub.v
// Design      : l_ethernet_40G
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvu37p-fsvh2892-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "l_ethernet_v3_2_3,Vivado 2021.1.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(gt_rxp_in, gt_rxn_in, gt_txp_out, gt_txn_out, 
  tx_clk_out_0, rx_core_clk_0, rx_clk_out_0, rxrecclkout_0, gtwiz_reset_tx_datapath_0, 
  gtwiz_reset_rx_datapath_0, s_axi_aclk_0, s_axi_aresetn_0, s_axi_awaddr_0, 
  s_axi_awvalid_0, s_axi_awready_0, s_axi_wdata_0, s_axi_wstrb_0, s_axi_wvalid_0, 
  s_axi_wready_0, s_axi_bresp_0, s_axi_bvalid_0, s_axi_bready_0, s_axi_araddr_0, 
  s_axi_arvalid_0, s_axi_arready_0, s_axi_rdata_0, s_axi_rresp_0, s_axi_rvalid_0, 
  s_axi_rready_0, pm_tick_0, user_reg0_0, rx_reset_0, user_rx_reset_0, rx_axis_tvalid_0, 
  rx_axis_tdata_0, rx_axis_tkeep_0, rx_axis_tuser_0, rx_axis_tlast_0, stat_rx_block_lock_0, 
  stat_rx_framing_err_valid_0_0, stat_rx_framing_err_0_0, 
  stat_rx_framing_err_valid_1_0, stat_rx_framing_err_1_0, 
  stat_rx_framing_err_valid_2_0, stat_rx_framing_err_2_0, 
  stat_rx_framing_err_valid_3_0, stat_rx_framing_err_3_0, stat_rx_vl_demuxed_0, 
  stat_rx_vl_number_0_0, stat_rx_vl_number_1_0, stat_rx_vl_number_2_0, 
  stat_rx_vl_number_3_0, stat_rx_synced_0, stat_rx_misaligned_0, stat_rx_aligned_err_0, 
  stat_rx_synced_err_0, stat_rx_mf_len_err_0, stat_rx_mf_repeat_err_0, stat_rx_mf_err_0, 
  stat_rx_bip_err_0_0, stat_rx_bip_err_1_0, stat_rx_bip_err_2_0, stat_rx_bip_err_3_0, 
  stat_rx_aligned_0, stat_rx_hi_ber_0, stat_rx_status_0, stat_rx_bad_code_0, 
  stat_rx_total_packets_0, stat_rx_total_good_packets_0, stat_rx_total_bytes_0, 
  stat_rx_total_good_bytes_0, stat_rx_packet_small_0, stat_rx_jabber_0, 
  stat_rx_packet_large_0, stat_rx_oversize_0, stat_rx_undersize_0, stat_rx_toolong_0, 
  stat_rx_fragment_0, stat_rx_packet_64_bytes_0, stat_rx_packet_65_127_bytes_0, 
  stat_rx_packet_128_255_bytes_0, stat_rx_packet_256_511_bytes_0, 
  stat_rx_packet_512_1023_bytes_0, stat_rx_packet_1024_1518_bytes_0, 
  stat_rx_packet_1519_1522_bytes_0, stat_rx_packet_1523_1548_bytes_0, 
  stat_rx_bad_fcs_0, stat_rx_packet_bad_fcs_0, stat_rx_stomped_fcs_0, 
  stat_rx_packet_1549_2047_bytes_0, stat_rx_packet_2048_4095_bytes_0, 
  stat_rx_packet_4096_8191_bytes_0, stat_rx_packet_8192_9215_bytes_0, 
  stat_rx_bad_preamble_0, stat_rx_bad_sfd_0, stat_rx_got_signal_os_0, 
  stat_rx_test_pattern_mismatch_0, stat_rx_truncated_0, stat_rx_local_fault_0, 
  stat_rx_remote_fault_0, stat_rx_internal_local_fault_0, 
  stat_rx_received_local_fault_0, tx_reset_0, user_tx_reset_0, tx_axis_tready_0, 
  tx_axis_tvalid_0, tx_axis_tdata_0, tx_axis_tkeep_0, tx_axis_tuser_0, tx_axis_tlast_0, 
  tx_unfout_0, ctl_tx_send_lfi_0, ctl_tx_send_rfi_0, ctl_tx_send_idle_0, 
  stat_tx_underflow_err_0, stat_tx_overflow_err_0, stat_tx_total_packets_0, 
  stat_tx_total_bytes_0, stat_tx_total_good_packets_0, stat_tx_total_good_bytes_0, 
  stat_tx_packet_64_bytes_0, stat_tx_packet_65_127_bytes_0, 
  stat_tx_packet_128_255_bytes_0, stat_tx_packet_256_511_bytes_0, 
  stat_tx_packet_512_1023_bytes_0, stat_tx_packet_1024_1518_bytes_0, 
  stat_tx_packet_1519_1522_bytes_0, stat_tx_packet_1523_1548_bytes_0, 
  stat_tx_packet_small_0, stat_tx_packet_large_0, stat_tx_packet_1549_2047_bytes_0, 
  stat_tx_packet_2048_4095_bytes_0, stat_tx_packet_4096_8191_bytes_0, 
  stat_tx_packet_8192_9215_bytes_0, stat_tx_bad_fcs_0, stat_tx_frame_error_0, 
  stat_tx_local_fault_0, gtpowergood_out_0, txoutclksel_in_0, rxoutclksel_in_0, 
  gt_refclk_out, gt_refclk_p, gt_refclk_n, sys_reset, dclk)
/* synthesis syn_black_box black_box_pad_pin="gt_rxp_in[3:0],gt_rxn_in[3:0],gt_txp_out[3:0],gt_txn_out[3:0],tx_clk_out_0,rx_core_clk_0,rx_clk_out_0,rxrecclkout_0[3:0],gtwiz_reset_tx_datapath_0,gtwiz_reset_rx_datapath_0,s_axi_aclk_0,s_axi_aresetn_0,s_axi_awaddr_0[31:0],s_axi_awvalid_0,s_axi_awready_0,s_axi_wdata_0[31:0],s_axi_wstrb_0[3:0],s_axi_wvalid_0,s_axi_wready_0,s_axi_bresp_0[1:0],s_axi_bvalid_0,s_axi_bready_0,s_axi_araddr_0[31:0],s_axi_arvalid_0,s_axi_arready_0,s_axi_rdata_0[31:0],s_axi_rresp_0[1:0],s_axi_rvalid_0,s_axi_rready_0,pm_tick_0,user_reg0_0[31:0],rx_reset_0,user_rx_reset_0,rx_axis_tvalid_0,rx_axis_tdata_0[255:0],rx_axis_tkeep_0[31:0],rx_axis_tuser_0,rx_axis_tlast_0,stat_rx_block_lock_0[3:0],stat_rx_framing_err_valid_0_0,stat_rx_framing_err_0_0,stat_rx_framing_err_valid_1_0,stat_rx_framing_err_1_0,stat_rx_framing_err_valid_2_0,stat_rx_framing_err_2_0,stat_rx_framing_err_valid_3_0,stat_rx_framing_err_3_0,stat_rx_vl_demuxed_0[3:0],stat_rx_vl_number_0_0[1:0],stat_rx_vl_number_1_0[1:0],stat_rx_vl_number_2_0[1:0],stat_rx_vl_number_3_0[1:0],stat_rx_synced_0[3:0],stat_rx_misaligned_0,stat_rx_aligned_err_0,stat_rx_synced_err_0[3:0],stat_rx_mf_len_err_0[3:0],stat_rx_mf_repeat_err_0[3:0],stat_rx_mf_err_0[3:0],stat_rx_bip_err_0_0,stat_rx_bip_err_1_0,stat_rx_bip_err_2_0,stat_rx_bip_err_3_0,stat_rx_aligned_0,stat_rx_hi_ber_0,stat_rx_status_0,stat_rx_bad_code_0[1:0],stat_rx_total_packets_0[1:0],stat_rx_total_good_packets_0,stat_rx_total_bytes_0[5:0],stat_rx_total_good_bytes_0[13:0],stat_rx_packet_small_0[1:0],stat_rx_jabber_0,stat_rx_packet_large_0,stat_rx_oversize_0,stat_rx_undersize_0[1:0],stat_rx_toolong_0,stat_rx_fragment_0[1:0],stat_rx_packet_64_bytes_0,stat_rx_packet_65_127_bytes_0,stat_rx_packet_128_255_bytes_0,stat_rx_packet_256_511_bytes_0,stat_rx_packet_512_1023_bytes_0,stat_rx_packet_1024_1518_bytes_0,stat_rx_packet_1519_1522_bytes_0,stat_rx_packet_1523_1548_bytes_0,stat_rx_bad_fcs_0[1:0],stat_rx_packet_bad_fcs_0,stat_rx_stomped_fcs_0[1:0],stat_rx_packet_1549_2047_bytes_0,stat_rx_packet_2048_4095_bytes_0,stat_rx_packet_4096_8191_bytes_0,stat_rx_packet_8192_9215_bytes_0,stat_rx_bad_preamble_0,stat_rx_bad_sfd_0,stat_rx_got_signal_os_0,stat_rx_test_pattern_mismatch_0[1:0],stat_rx_truncated_0,stat_rx_local_fault_0,stat_rx_remote_fault_0,stat_rx_internal_local_fault_0,stat_rx_received_local_fault_0,tx_reset_0,user_tx_reset_0,tx_axis_tready_0,tx_axis_tvalid_0,tx_axis_tdata_0[255:0],tx_axis_tkeep_0[31:0],tx_axis_tuser_0,tx_axis_tlast_0,tx_unfout_0,ctl_tx_send_lfi_0,ctl_tx_send_rfi_0,ctl_tx_send_idle_0,stat_tx_underflow_err_0,stat_tx_overflow_err_0,stat_tx_total_packets_0,stat_tx_total_bytes_0[4:0],stat_tx_total_good_packets_0,stat_tx_total_good_bytes_0[13:0],stat_tx_packet_64_bytes_0,stat_tx_packet_65_127_bytes_0,stat_tx_packet_128_255_bytes_0,stat_tx_packet_256_511_bytes_0,stat_tx_packet_512_1023_bytes_0,stat_tx_packet_1024_1518_bytes_0,stat_tx_packet_1519_1522_bytes_0,stat_tx_packet_1523_1548_bytes_0,stat_tx_packet_small_0,stat_tx_packet_large_0,stat_tx_packet_1549_2047_bytes_0,stat_tx_packet_2048_4095_bytes_0,stat_tx_packet_4096_8191_bytes_0,stat_tx_packet_8192_9215_bytes_0,stat_tx_bad_fcs_0,stat_tx_frame_error_0,stat_tx_local_fault_0,gtpowergood_out_0[3:0],txoutclksel_in_0[11:0],rxoutclksel_in_0[11:0],gt_refclk_out,gt_refclk_p,gt_refclk_n,sys_reset,dclk" */;
  input [3:0]gt_rxp_in;
  input [3:0]gt_rxn_in;
  output [3:0]gt_txp_out;
  output [3:0]gt_txn_out;
  output tx_clk_out_0;
  input rx_core_clk_0;
  output rx_clk_out_0;
  output [3:0]rxrecclkout_0;
  input gtwiz_reset_tx_datapath_0;
  input gtwiz_reset_rx_datapath_0;
  input s_axi_aclk_0;
  input s_axi_aresetn_0;
  input [31:0]s_axi_awaddr_0;
  input s_axi_awvalid_0;
  output s_axi_awready_0;
  input [31:0]s_axi_wdata_0;
  input [3:0]s_axi_wstrb_0;
  input s_axi_wvalid_0;
  output s_axi_wready_0;
  output [1:0]s_axi_bresp_0;
  output s_axi_bvalid_0;
  input s_axi_bready_0;
  input [31:0]s_axi_araddr_0;
  input s_axi_arvalid_0;
  output s_axi_arready_0;
  output [31:0]s_axi_rdata_0;
  output [1:0]s_axi_rresp_0;
  output s_axi_rvalid_0;
  input s_axi_rready_0;
  input pm_tick_0;
  output [31:0]user_reg0_0;
  input rx_reset_0;
  output user_rx_reset_0;
  output rx_axis_tvalid_0;
  output [255:0]rx_axis_tdata_0;
  output [31:0]rx_axis_tkeep_0;
  output rx_axis_tuser_0;
  output rx_axis_tlast_0;
  output [3:0]stat_rx_block_lock_0;
  output stat_rx_framing_err_valid_0_0;
  output stat_rx_framing_err_0_0;
  output stat_rx_framing_err_valid_1_0;
  output stat_rx_framing_err_1_0;
  output stat_rx_framing_err_valid_2_0;
  output stat_rx_framing_err_2_0;
  output stat_rx_framing_err_valid_3_0;
  output stat_rx_framing_err_3_0;
  output [3:0]stat_rx_vl_demuxed_0;
  output [1:0]stat_rx_vl_number_0_0;
  output [1:0]stat_rx_vl_number_1_0;
  output [1:0]stat_rx_vl_number_2_0;
  output [1:0]stat_rx_vl_number_3_0;
  output [3:0]stat_rx_synced_0;
  output stat_rx_misaligned_0;
  output stat_rx_aligned_err_0;
  output [3:0]stat_rx_synced_err_0;
  output [3:0]stat_rx_mf_len_err_0;
  output [3:0]stat_rx_mf_repeat_err_0;
  output [3:0]stat_rx_mf_err_0;
  output stat_rx_bip_err_0_0;
  output stat_rx_bip_err_1_0;
  output stat_rx_bip_err_2_0;
  output stat_rx_bip_err_3_0;
  output stat_rx_aligned_0;
  output stat_rx_hi_ber_0;
  output stat_rx_status_0;
  output [1:0]stat_rx_bad_code_0;
  output [1:0]stat_rx_total_packets_0;
  output stat_rx_total_good_packets_0;
  output [5:0]stat_rx_total_bytes_0;
  output [13:0]stat_rx_total_good_bytes_0;
  output [1:0]stat_rx_packet_small_0;
  output stat_rx_jabber_0;
  output stat_rx_packet_large_0;
  output stat_rx_oversize_0;
  output [1:0]stat_rx_undersize_0;
  output stat_rx_toolong_0;
  output [1:0]stat_rx_fragment_0;
  output stat_rx_packet_64_bytes_0;
  output stat_rx_packet_65_127_bytes_0;
  output stat_rx_packet_128_255_bytes_0;
  output stat_rx_packet_256_511_bytes_0;
  output stat_rx_packet_512_1023_bytes_0;
  output stat_rx_packet_1024_1518_bytes_0;
  output stat_rx_packet_1519_1522_bytes_0;
  output stat_rx_packet_1523_1548_bytes_0;
  output [1:0]stat_rx_bad_fcs_0;
  output stat_rx_packet_bad_fcs_0;
  output [1:0]stat_rx_stomped_fcs_0;
  output stat_rx_packet_1549_2047_bytes_0;
  output stat_rx_packet_2048_4095_bytes_0;
  output stat_rx_packet_4096_8191_bytes_0;
  output stat_rx_packet_8192_9215_bytes_0;
  output stat_rx_bad_preamble_0;
  output stat_rx_bad_sfd_0;
  output stat_rx_got_signal_os_0;
  output [1:0]stat_rx_test_pattern_mismatch_0;
  output stat_rx_truncated_0;
  output stat_rx_local_fault_0;
  output stat_rx_remote_fault_0;
  output stat_rx_internal_local_fault_0;
  output stat_rx_received_local_fault_0;
  input tx_reset_0;
  output user_tx_reset_0;
  output tx_axis_tready_0;
  input tx_axis_tvalid_0;
  input [255:0]tx_axis_tdata_0;
  input [31:0]tx_axis_tkeep_0;
  input tx_axis_tuser_0;
  input tx_axis_tlast_0;
  output tx_unfout_0;
  input ctl_tx_send_lfi_0;
  input ctl_tx_send_rfi_0;
  input ctl_tx_send_idle_0;
  output stat_tx_underflow_err_0;
  output stat_tx_overflow_err_0;
  output stat_tx_total_packets_0;
  output [4:0]stat_tx_total_bytes_0;
  output stat_tx_total_good_packets_0;
  output [13:0]stat_tx_total_good_bytes_0;
  output stat_tx_packet_64_bytes_0;
  output stat_tx_packet_65_127_bytes_0;
  output stat_tx_packet_128_255_bytes_0;
  output stat_tx_packet_256_511_bytes_0;
  output stat_tx_packet_512_1023_bytes_0;
  output stat_tx_packet_1024_1518_bytes_0;
  output stat_tx_packet_1519_1522_bytes_0;
  output stat_tx_packet_1523_1548_bytes_0;
  output stat_tx_packet_small_0;
  output stat_tx_packet_large_0;
  output stat_tx_packet_1549_2047_bytes_0;
  output stat_tx_packet_2048_4095_bytes_0;
  output stat_tx_packet_4096_8191_bytes_0;
  output stat_tx_packet_8192_9215_bytes_0;
  output stat_tx_bad_fcs_0;
  output stat_tx_frame_error_0;
  output stat_tx_local_fault_0;
  output [3:0]gtpowergood_out_0;
  input [11:0]txoutclksel_in_0;
  input [11:0]rxoutclksel_in_0;
  output gt_refclk_out;
  input gt_refclk_p;
  input gt_refclk_n;
  input sys_reset;
  input dclk;
endmodule
