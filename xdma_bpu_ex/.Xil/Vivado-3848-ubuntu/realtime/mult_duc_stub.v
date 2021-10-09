// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "mult_gen_v12_0_16,Vivado 2020.2" *)
module mult_duc(CLK, A, B, P);
  input CLK;
  input [7:0]A;
  input [7:0]B;
  output [15:0]P;
endmodule
