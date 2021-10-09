// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1.1 (lin64) Build 3286242 Wed Jul 28 13:09:46 MDT 2021
// Date        : Thu Aug 26 04:14:33 2021
// Host        : caohy168 running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/caohy168/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.runs/bbp_mmc_synth_1/bbp_mmc_stub.v
// Design      : bbp_mmc
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvu37p-fsvh2892-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module bbp_mmc(clk_out1, clk_out2, clk_in1_p, clk_in1_n)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,clk_out2,clk_in1_p,clk_in1_n" */;
  output clk_out1;
  output clk_out2;
  input clk_in1_p;
  input clk_in1_n;
endmodule
