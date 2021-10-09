// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
apskmod apskmod (
  .ap_clk(ap_clk),       // input  ap_clk
  .ap_rst_n(ap_rst_n),       // input  ap_rst_n
  .ap_start(ap_start),       // input  ap_start
  .ap_done(ap_done),       // output  ap_done
  .ap_idle(ap_idle),       // output  ap_idle
  .ap_ready(ap_ready),       // output  ap_ready
  .mod_datin_TDATA(mod_datin_TDATA),       // input [7:0] mod_datin_TDATA
  .mod_datin_TVALID(mod_datin_TVALID),       // input  mod_datin_TVALID
  .mod_datin_TREADY(mod_datin_TREADY),       // output  mod_datin_TREADY
  .modi_TDATA(modi_TDATA),       // output [31:0] modi_TDATA
  .modi_TVALID(modi_TVALID),       // output  modi_TVALID
  .modi_TREADY(modi_TREADY),       // input  modi_TREADY
  .modq_TDATA(modq_TDATA),       // output [31:0] modq_TDATA
  .modq_TVALID(modq_TVALID),       // output  modq_TVALID
  .modq_TREADY(modq_TREADY)        // input  modq_TREADY
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

