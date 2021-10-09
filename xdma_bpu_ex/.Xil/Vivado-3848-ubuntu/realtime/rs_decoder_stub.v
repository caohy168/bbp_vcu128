// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "rs_decoder_v9_0_17,Vivado 2020.2" *)
module rs_decoder(aclk, aresetn, s_axis_input_tdata, 
  s_axis_input_tvalid, s_axis_input_tlast, s_axis_input_tready, m_axis_output_tdata, 
  m_axis_output_tvalid, m_axis_output_tready, m_axis_output_tlast, m_axis_stat_tdata, 
  m_axis_stat_tvalid, m_axis_stat_tready, event_s_input_tlast_missing, 
  event_s_input_tlast_unexpected, event_s_ctrl_tdata_invalid);
  input aclk;
  input aresetn;
  input [7:0]s_axis_input_tdata;
  input s_axis_input_tvalid;
  input s_axis_input_tlast;
  output s_axis_input_tready;
  output [7:0]m_axis_output_tdata;
  output m_axis_output_tvalid;
  input m_axis_output_tready;
  output m_axis_output_tlast;
  output [7:0]m_axis_stat_tdata;
  output m_axis_stat_tvalid;
  input m_axis_stat_tready;
  output event_s_input_tlast_missing;
  output event_s_input_tlast_unexpected;
  output event_s_ctrl_tdata_invalid;
endmodule
