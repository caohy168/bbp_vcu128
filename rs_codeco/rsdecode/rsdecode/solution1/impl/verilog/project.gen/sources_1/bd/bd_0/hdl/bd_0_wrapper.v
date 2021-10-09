//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
//Date        : Thu Aug  5 01:31:47 2021
//Host        : caohy168 running 64-bit Ubuntu 20.04.2 LTS
//Command     : generate_target bd_0_wrapper.bd
//Design      : bd_0_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_0_wrapper
   (alpha_to_out_address0,
    alpha_to_out_ce0,
    alpha_to_out_d0,
    alpha_to_out_we0,
    ap_clk,
    ap_ctrl_done,
    ap_ctrl_idle,
    ap_ctrl_ready,
    ap_ctrl_start,
    ap_rst_n,
    gg_out_address0,
    gg_out_ce0,
    gg_out_d0,
    gg_out_we0,
    index_of_out_address0,
    index_of_out_ce0,
    index_of_out_d0,
    index_of_out_we0,
    recd_gf_out_address0,
    recd_gf_out_ce0,
    recd_gf_out_d0,
    recd_gf_out_we0,
    recd_in_tdata,
    recd_in_tready,
    recd_in_tvalid,
    recd_out_tdata,
    recd_out_tready,
    recd_out_tvalid,
    syn_error_out);
  output [7:0]alpha_to_out_address0;
  output alpha_to_out_ce0;
  output [31:0]alpha_to_out_d0;
  output alpha_to_out_we0;
  input ap_clk;
  output ap_ctrl_done;
  output ap_ctrl_idle;
  output ap_ctrl_ready;
  input ap_ctrl_start;
  input ap_rst_n;
  output [4:0]gg_out_address0;
  output gg_out_ce0;
  output [31:0]gg_out_d0;
  output gg_out_we0;
  output [7:0]index_of_out_address0;
  output index_of_out_ce0;
  output [31:0]index_of_out_d0;
  output index_of_out_we0;
  output [7:0]recd_gf_out_address0;
  output recd_gf_out_ce0;
  output [31:0]recd_gf_out_d0;
  output recd_gf_out_we0;
  input [31:0]recd_in_tdata;
  output recd_in_tready;
  input recd_in_tvalid;
  output [31:0]recd_out_tdata;
  input recd_out_tready;
  output recd_out_tvalid;
  input [31:0]syn_error_out;

  wire [7:0]alpha_to_out_address0;
  wire alpha_to_out_ce0;
  wire [31:0]alpha_to_out_d0;
  wire alpha_to_out_we0;
  wire ap_clk;
  wire ap_ctrl_done;
  wire ap_ctrl_idle;
  wire ap_ctrl_ready;
  wire ap_ctrl_start;
  wire ap_rst_n;
  wire [4:0]gg_out_address0;
  wire gg_out_ce0;
  wire [31:0]gg_out_d0;
  wire gg_out_we0;
  wire [7:0]index_of_out_address0;
  wire index_of_out_ce0;
  wire [31:0]index_of_out_d0;
  wire index_of_out_we0;
  wire [7:0]recd_gf_out_address0;
  wire recd_gf_out_ce0;
  wire [31:0]recd_gf_out_d0;
  wire recd_gf_out_we0;
  wire [31:0]recd_in_tdata;
  wire recd_in_tready;
  wire recd_in_tvalid;
  wire [31:0]recd_out_tdata;
  wire recd_out_tready;
  wire recd_out_tvalid;
  wire [31:0]syn_error_out;

  bd_0 bd_0_i
       (.alpha_to_out_address0(alpha_to_out_address0),
        .alpha_to_out_ce0(alpha_to_out_ce0),
        .alpha_to_out_d0(alpha_to_out_d0),
        .alpha_to_out_we0(alpha_to_out_we0),
        .ap_clk(ap_clk),
        .ap_ctrl_done(ap_ctrl_done),
        .ap_ctrl_idle(ap_ctrl_idle),
        .ap_ctrl_ready(ap_ctrl_ready),
        .ap_ctrl_start(ap_ctrl_start),
        .ap_rst_n(ap_rst_n),
        .gg_out_address0(gg_out_address0),
        .gg_out_ce0(gg_out_ce0),
        .gg_out_d0(gg_out_d0),
        .gg_out_we0(gg_out_we0),
        .index_of_out_address0(index_of_out_address0),
        .index_of_out_ce0(index_of_out_ce0),
        .index_of_out_d0(index_of_out_d0),
        .index_of_out_we0(index_of_out_we0),
        .recd_gf_out_address0(recd_gf_out_address0),
        .recd_gf_out_ce0(recd_gf_out_ce0),
        .recd_gf_out_d0(recd_gf_out_d0),
        .recd_gf_out_we0(recd_gf_out_we0),
        .recd_in_tdata(recd_in_tdata),
        .recd_in_tready(recd_in_tready),
        .recd_in_tvalid(recd_in_tvalid),
        .recd_out_tdata(recd_out_tdata),
        .recd_out_tready(recd_out_tready),
        .recd_out_tvalid(recd_out_tvalid),
        .syn_error_out(syn_error_out));
endmodule
