// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "apskdemod,Vivado 2020.2" *)
module apskdemod64(ap_clk, ap_rst_n, ap_start, ap_done, ap_idle, 
  ap_ready, demod_datout_TVALID, demod_datout_TREADY, demod_datout_TDATA, demodi_TVALID, 
  demodi_TREADY, demodi_TDATA, demodq_TVALID, demodq_TREADY, demodq_TDATA);
  input ap_clk;
  input ap_rst_n;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output demod_datout_TVALID;
  input demod_datout_TREADY;
  output [31:0]demod_datout_TDATA;
  input demodi_TVALID;
  output demodi_TREADY;
  input [31:0]demodi_TDATA;
  input demodq_TVALID;
  output demodq_TREADY;
  input [31:0]demodq_TDATA;
endmodule
