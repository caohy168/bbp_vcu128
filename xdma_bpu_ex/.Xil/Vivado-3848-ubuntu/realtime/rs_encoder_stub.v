// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "rs_encoder_v9_0_16,Vivado 2020.2" *)
module rs_encoder(aclk, aresetn, s_axis_input_tdata, 
  s_axis_input_tvalid, s_axis_input_tready, s_axis_input_tlast, m_axis_output_tdata, 
  m_axis_output_tvalid, m_axis_output_tready, m_axis_output_tlast, 
  event_s_input_tlast_missing, event_s_input_tlast_unexpected);
  input aclk;
  input aresetn;
  input [7:0]s_axis_input_tdata;
  input s_axis_input_tvalid;
  output s_axis_input_tready;
  input s_axis_input_tlast;
  output [7:0]m_axis_output_tdata;
  output m_axis_output_tvalid;
  input m_axis_output_tready;
  output m_axis_output_tlast;
  output event_s_input_tlast_missing;
  output event_s_input_tlast_unexpected;
endmodule
