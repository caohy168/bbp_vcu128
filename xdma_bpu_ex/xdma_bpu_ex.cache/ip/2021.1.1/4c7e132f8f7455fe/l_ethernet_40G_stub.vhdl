-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.1.1 (lin64) Build 3286242 Wed Jul 28 13:09:46 MDT 2021
-- Date        : Fri Sep 10 03:42:07 2021
-- Host        : caohy168 running 64-bit Ubuntu 20.04.3 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ l_ethernet_40G_stub.vhdl
-- Design      : l_ethernet_40G
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcvu37p-fsvh2892-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    gt_rxp_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gt_rxn_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gt_txp_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    gt_txn_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    tx_clk_out_0 : out STD_LOGIC;
    rx_core_clk_0 : in STD_LOGIC;
    rx_clk_out_0 : out STD_LOGIC;
    rxrecclkout_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    gtwiz_reset_tx_datapath_0 : in STD_LOGIC;
    gtwiz_reset_rx_datapath_0 : in STD_LOGIC;
    gt_loopback_in_0 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    rx_reset_0 : in STD_LOGIC;
    user_rx_reset_0 : out STD_LOGIC;
    rx_axis_tvalid_0 : out STD_LOGIC;
    rx_axis_tdata_0 : out STD_LOGIC_VECTOR ( 255 downto 0 );
    rx_axis_tkeep_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rx_axis_tuser_0 : out STD_LOGIC;
    rx_axis_tlast_0 : out STD_LOGIC;
    ctl_rx_test_pattern_0 : in STD_LOGIC;
    ctl_rx_enable_0 : in STD_LOGIC;
    ctl_rx_delete_fcs_0 : in STD_LOGIC;
    ctl_rx_ignore_fcs_0 : in STD_LOGIC;
    ctl_rx_max_packet_len_0 : in STD_LOGIC_VECTOR ( 14 downto 0 );
    ctl_rx_min_packet_len_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    ctl_rx_check_sfd_0 : in STD_LOGIC;
    ctl_rx_check_preamble_0 : in STD_LOGIC;
    ctl_rx_process_lfi_0 : in STD_LOGIC;
    ctl_rx_force_resync_0 : in STD_LOGIC;
    stat_rx_block_lock_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    stat_rx_framing_err_valid_0_0 : out STD_LOGIC;
    stat_rx_framing_err_0_0 : out STD_LOGIC;
    stat_rx_framing_err_valid_1_0 : out STD_LOGIC;
    stat_rx_framing_err_1_0 : out STD_LOGIC;
    stat_rx_framing_err_valid_2_0 : out STD_LOGIC;
    stat_rx_framing_err_2_0 : out STD_LOGIC;
    stat_rx_framing_err_valid_3_0 : out STD_LOGIC;
    stat_rx_framing_err_3_0 : out STD_LOGIC;
    stat_rx_vl_demuxed_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    stat_rx_vl_number_0_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    stat_rx_vl_number_1_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    stat_rx_vl_number_2_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    stat_rx_vl_number_3_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    stat_rx_synced_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    stat_rx_misaligned_0 : out STD_LOGIC;
    stat_rx_aligned_err_0 : out STD_LOGIC;
    stat_rx_synced_err_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    stat_rx_mf_len_err_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    stat_rx_mf_repeat_err_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    stat_rx_mf_err_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    stat_rx_bip_err_0_0 : out STD_LOGIC;
    stat_rx_bip_err_1_0 : out STD_LOGIC;
    stat_rx_bip_err_2_0 : out STD_LOGIC;
    stat_rx_bip_err_3_0 : out STD_LOGIC;
    stat_rx_aligned_0 : out STD_LOGIC;
    stat_rx_hi_ber_0 : out STD_LOGIC;
    stat_rx_status_0 : out STD_LOGIC;
    stat_rx_bad_code_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    stat_rx_total_packets_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    stat_rx_total_good_packets_0 : out STD_LOGIC;
    stat_rx_total_bytes_0 : out STD_LOGIC_VECTOR ( 5 downto 0 );
    stat_rx_total_good_bytes_0 : out STD_LOGIC_VECTOR ( 13 downto 0 );
    stat_rx_packet_small_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    stat_rx_jabber_0 : out STD_LOGIC;
    stat_rx_packet_large_0 : out STD_LOGIC;
    stat_rx_oversize_0 : out STD_LOGIC;
    stat_rx_undersize_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    stat_rx_toolong_0 : out STD_LOGIC;
    stat_rx_fragment_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    stat_rx_packet_64_bytes_0 : out STD_LOGIC;
    stat_rx_packet_65_127_bytes_0 : out STD_LOGIC;
    stat_rx_packet_128_255_bytes_0 : out STD_LOGIC;
    stat_rx_packet_256_511_bytes_0 : out STD_LOGIC;
    stat_rx_packet_512_1023_bytes_0 : out STD_LOGIC;
    stat_rx_packet_1024_1518_bytes_0 : out STD_LOGIC;
    stat_rx_packet_1519_1522_bytes_0 : out STD_LOGIC;
    stat_rx_packet_1523_1548_bytes_0 : out STD_LOGIC;
    stat_rx_bad_fcs_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    stat_rx_packet_bad_fcs_0 : out STD_LOGIC;
    stat_rx_stomped_fcs_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    stat_rx_packet_1549_2047_bytes_0 : out STD_LOGIC;
    stat_rx_packet_2048_4095_bytes_0 : out STD_LOGIC;
    stat_rx_packet_4096_8191_bytes_0 : out STD_LOGIC;
    stat_rx_packet_8192_9215_bytes_0 : out STD_LOGIC;
    stat_rx_bad_preamble_0 : out STD_LOGIC;
    stat_rx_bad_sfd_0 : out STD_LOGIC;
    stat_rx_got_signal_os_0 : out STD_LOGIC;
    stat_rx_test_pattern_mismatch_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    stat_rx_truncated_0 : out STD_LOGIC;
    stat_rx_local_fault_0 : out STD_LOGIC;
    stat_rx_remote_fault_0 : out STD_LOGIC;
    stat_rx_internal_local_fault_0 : out STD_LOGIC;
    stat_rx_received_local_fault_0 : out STD_LOGIC;
    tx_reset_0 : in STD_LOGIC;
    user_tx_reset_0 : out STD_LOGIC;
    tx_axis_tready_0 : out STD_LOGIC;
    tx_axis_tvalid_0 : in STD_LOGIC;
    tx_axis_tdata_0 : in STD_LOGIC_VECTOR ( 255 downto 0 );
    tx_axis_tkeep_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    tx_axis_tuser_0 : in STD_LOGIC;
    tx_axis_tlast_0 : in STD_LOGIC;
    tx_unfout_0 : out STD_LOGIC;
    ctl_tx_test_pattern_0 : in STD_LOGIC;
    ctl_tx_enable_0 : in STD_LOGIC;
    ctl_tx_fcs_ins_enable_0 : in STD_LOGIC;
    ctl_tx_send_lfi_0 : in STD_LOGIC;
    ctl_tx_send_rfi_0 : in STD_LOGIC;
    ctl_tx_send_idle_0 : in STD_LOGIC;
    ctl_tx_ignore_fcs_0 : in STD_LOGIC;
    stat_tx_underflow_err_0 : out STD_LOGIC;
    stat_tx_overflow_err_0 : out STD_LOGIC;
    stat_tx_total_packets_0 : out STD_LOGIC;
    stat_tx_total_bytes_0 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    stat_tx_total_good_packets_0 : out STD_LOGIC;
    stat_tx_total_good_bytes_0 : out STD_LOGIC_VECTOR ( 13 downto 0 );
    stat_tx_packet_64_bytes_0 : out STD_LOGIC;
    stat_tx_packet_65_127_bytes_0 : out STD_LOGIC;
    stat_tx_packet_128_255_bytes_0 : out STD_LOGIC;
    stat_tx_packet_256_511_bytes_0 : out STD_LOGIC;
    stat_tx_packet_512_1023_bytes_0 : out STD_LOGIC;
    stat_tx_packet_1024_1518_bytes_0 : out STD_LOGIC;
    stat_tx_packet_1519_1522_bytes_0 : out STD_LOGIC;
    stat_tx_packet_1523_1548_bytes_0 : out STD_LOGIC;
    stat_tx_packet_small_0 : out STD_LOGIC;
    stat_tx_packet_large_0 : out STD_LOGIC;
    stat_tx_packet_1549_2047_bytes_0 : out STD_LOGIC;
    stat_tx_packet_2048_4095_bytes_0 : out STD_LOGIC;
    stat_tx_packet_4096_8191_bytes_0 : out STD_LOGIC;
    stat_tx_packet_8192_9215_bytes_0 : out STD_LOGIC;
    stat_tx_bad_fcs_0 : out STD_LOGIC;
    stat_tx_frame_error_0 : out STD_LOGIC;
    stat_tx_local_fault_0 : out STD_LOGIC;
    gtpowergood_out_0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    txoutclksel_in_0 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    rxoutclksel_in_0 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    gt_refclk_out : out STD_LOGIC;
    gt_refclk_p : in STD_LOGIC;
    gt_refclk_n : in STD_LOGIC;
    sys_reset : in STD_LOGIC;
    dclk : in STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "gt_rxp_in[3:0],gt_rxn_in[3:0],gt_txp_out[3:0],gt_txn_out[3:0],tx_clk_out_0,rx_core_clk_0,rx_clk_out_0,rxrecclkout_0[3:0],gtwiz_reset_tx_datapath_0,gtwiz_reset_rx_datapath_0,gt_loopback_in_0[11:0],rx_reset_0,user_rx_reset_0,rx_axis_tvalid_0,rx_axis_tdata_0[255:0],rx_axis_tkeep_0[31:0],rx_axis_tuser_0,rx_axis_tlast_0,ctl_rx_test_pattern_0,ctl_rx_enable_0,ctl_rx_delete_fcs_0,ctl_rx_ignore_fcs_0,ctl_rx_max_packet_len_0[14:0],ctl_rx_min_packet_len_0[7:0],ctl_rx_check_sfd_0,ctl_rx_check_preamble_0,ctl_rx_process_lfi_0,ctl_rx_force_resync_0,stat_rx_block_lock_0[3:0],stat_rx_framing_err_valid_0_0,stat_rx_framing_err_0_0,stat_rx_framing_err_valid_1_0,stat_rx_framing_err_1_0,stat_rx_framing_err_valid_2_0,stat_rx_framing_err_2_0,stat_rx_framing_err_valid_3_0,stat_rx_framing_err_3_0,stat_rx_vl_demuxed_0[3:0],stat_rx_vl_number_0_0[1:0],stat_rx_vl_number_1_0[1:0],stat_rx_vl_number_2_0[1:0],stat_rx_vl_number_3_0[1:0],stat_rx_synced_0[3:0],stat_rx_misaligned_0,stat_rx_aligned_err_0,stat_rx_synced_err_0[3:0],stat_rx_mf_len_err_0[3:0],stat_rx_mf_repeat_err_0[3:0],stat_rx_mf_err_0[3:0],stat_rx_bip_err_0_0,stat_rx_bip_err_1_0,stat_rx_bip_err_2_0,stat_rx_bip_err_3_0,stat_rx_aligned_0,stat_rx_hi_ber_0,stat_rx_status_0,stat_rx_bad_code_0[1:0],stat_rx_total_packets_0[1:0],stat_rx_total_good_packets_0,stat_rx_total_bytes_0[5:0],stat_rx_total_good_bytes_0[13:0],stat_rx_packet_small_0[1:0],stat_rx_jabber_0,stat_rx_packet_large_0,stat_rx_oversize_0,stat_rx_undersize_0[1:0],stat_rx_toolong_0,stat_rx_fragment_0[1:0],stat_rx_packet_64_bytes_0,stat_rx_packet_65_127_bytes_0,stat_rx_packet_128_255_bytes_0,stat_rx_packet_256_511_bytes_0,stat_rx_packet_512_1023_bytes_0,stat_rx_packet_1024_1518_bytes_0,stat_rx_packet_1519_1522_bytes_0,stat_rx_packet_1523_1548_bytes_0,stat_rx_bad_fcs_0[1:0],stat_rx_packet_bad_fcs_0,stat_rx_stomped_fcs_0[1:0],stat_rx_packet_1549_2047_bytes_0,stat_rx_packet_2048_4095_bytes_0,stat_rx_packet_4096_8191_bytes_0,stat_rx_packet_8192_9215_bytes_0,stat_rx_bad_preamble_0,stat_rx_bad_sfd_0,stat_rx_got_signal_os_0,stat_rx_test_pattern_mismatch_0[1:0],stat_rx_truncated_0,stat_rx_local_fault_0,stat_rx_remote_fault_0,stat_rx_internal_local_fault_0,stat_rx_received_local_fault_0,tx_reset_0,user_tx_reset_0,tx_axis_tready_0,tx_axis_tvalid_0,tx_axis_tdata_0[255:0],tx_axis_tkeep_0[31:0],tx_axis_tuser_0,tx_axis_tlast_0,tx_unfout_0,ctl_tx_test_pattern_0,ctl_tx_enable_0,ctl_tx_fcs_ins_enable_0,ctl_tx_send_lfi_0,ctl_tx_send_rfi_0,ctl_tx_send_idle_0,ctl_tx_ignore_fcs_0,stat_tx_underflow_err_0,stat_tx_overflow_err_0,stat_tx_total_packets_0,stat_tx_total_bytes_0[4:0],stat_tx_total_good_packets_0,stat_tx_total_good_bytes_0[13:0],stat_tx_packet_64_bytes_0,stat_tx_packet_65_127_bytes_0,stat_tx_packet_128_255_bytes_0,stat_tx_packet_256_511_bytes_0,stat_tx_packet_512_1023_bytes_0,stat_tx_packet_1024_1518_bytes_0,stat_tx_packet_1519_1522_bytes_0,stat_tx_packet_1523_1548_bytes_0,stat_tx_packet_small_0,stat_tx_packet_large_0,stat_tx_packet_1549_2047_bytes_0,stat_tx_packet_2048_4095_bytes_0,stat_tx_packet_4096_8191_bytes_0,stat_tx_packet_8192_9215_bytes_0,stat_tx_bad_fcs_0,stat_tx_frame_error_0,stat_tx_local_fault_0,gtpowergood_out_0[3:0],txoutclksel_in_0[11:0],rxoutclksel_in_0[11:0],gt_refclk_out,gt_refclk_p,gt_refclk_n,sys_reset,dclk";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "l_ethernet_v3_2_3,Vivado 2021.1.1";
begin
end;
