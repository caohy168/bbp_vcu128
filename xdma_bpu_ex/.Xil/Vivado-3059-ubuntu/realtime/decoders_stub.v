// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "decode_rs,Vivado 2021.1.1" *)
module decoders(recd_gf_out_ce0, recd_gf_out_we0, 
  alpha_to_out_ce0, alpha_to_out_we0, index_of_out_ce0, index_of_out_we0, gg_out_ce0, 
  gg_out_we0, ap_clk, ap_rst_n, ap_start, ap_done, ap_idle, ap_ready, recd_in_TVALID, 
  recd_in_TREADY, recd_in_TDATA, recd_out_TVALID, recd_out_TREADY, recd_out_TDATA, 
  recd_gf_out_address0, recd_gf_out_d0, syn_error_out, alpha_to_out_address0, 
  alpha_to_out_d0, index_of_out_address0, index_of_out_d0, gg_out_address0, gg_out_d0);
  output recd_gf_out_ce0;
  output recd_gf_out_we0;
  output alpha_to_out_ce0;
  output alpha_to_out_we0;
  output index_of_out_ce0;
  output index_of_out_we0;
  output gg_out_ce0;
  output gg_out_we0;
  input ap_clk;
  input ap_rst_n;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input recd_in_TVALID;
  output recd_in_TREADY;
  input [31:0]recd_in_TDATA;
  output recd_out_TVALID;
  input recd_out_TREADY;
  output [31:0]recd_out_TDATA;
  output [7:0]recd_gf_out_address0;
  output [31:0]recd_gf_out_d0;
  input [31:0]syn_error_out;
  output [7:0]alpha_to_out_address0;
  output [31:0]alpha_to_out_d0;
  output [7:0]index_of_out_address0;
  output [31:0]index_of_out_d0;
  output [4:0]gg_out_address0;
  output [31:0]gg_out_d0;
endmodule
