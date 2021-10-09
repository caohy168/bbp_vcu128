// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module bbp_mmc(clk_out1, clk_out2, clk_in1_p, clk_in1_n);
  output clk_out1;
  output clk_out2;
  input clk_in1_p;
  input clk_in1_n;
endmodule
