// (c) Copyright 1995-2021 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:hls:encode_rs:1.0
// IP Revision: 2108012157

(* X_CORE_INFO = "encode_rs,Vivado 2021.1.1" *)
(* CHECK_LICENSE_TYPE = "encoders,encode_rs,{}" *)
(* CORE_GENERATION_INFO = "encoders,encode_rs,{x_ipProduct=Vivado 2021.1.1,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=encode_rs,x_ipVersion=1.0,x_ipCoreRevision=2108012157,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* IP_DEFINITION_SOURCE = "HLS" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module encoders (
  bb_out_ce0,
  bb_out_we0,
  alpha_to_out_ce0,
  alpha_to_out_we0,
  index_of_out_ce0,
  index_of_out_we0,
  gg_out_ce0,
  gg_out_we0,
  ap_clk,
  ap_rst_n,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  data_in_TVALID,
  data_in_TREADY,
  data_in_TDATA,
  bb_out_address0,
  bb_out_d0,
  recd_out_TVALID,
  recd_out_TREADY,
  recd_out_TDATA,
  alpha_to_out_address0,
  alpha_to_out_d0,
  index_of_out_address0,
  index_of_out_d0,
  gg_out_address0,
  gg_out_d0
);

output wire bb_out_ce0;
output wire bb_out_we0;
output wire alpha_to_out_ce0;
output wire alpha_to_out_we0;
output wire index_of_out_ce0;
output wire index_of_out_we0;
output wire gg_out_ce0;
output wire gg_out_we0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF data_in:recd_out, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *)
input wire ap_rst_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start" *)
input wire ap_start;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done" *)
output wire ap_done;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle" *)
output wire ap_idle;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready" *)
output wire ap_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 data_in TVALID" *)
input wire data_in_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 data_in TREADY" *)
output wire data_in_TREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME data_in, TDATA_NUM_BYTES 4, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 data_in TDATA" *)
input wire [31 : 0] data_in_TDATA;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME bb_out_address0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 bb_out_address0 DATA" *)
output wire [4 : 0] bb_out_address0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME bb_out_d0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 bb_out_d0 DATA" *)
output wire [31 : 0] bb_out_d0;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 recd_out TVALID" *)
output wire recd_out_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 recd_out TREADY" *)
input wire recd_out_TREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME recd_out, TDATA_NUM_BYTES 4, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 recd_out TDATA" *)
output wire [31 : 0] recd_out_TDATA;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME alpha_to_out_address0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 alpha_to_out_address0 DATA" *)
output wire [7 : 0] alpha_to_out_address0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME alpha_to_out_d0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 alpha_to_out_d0 DATA" *)
output wire [31 : 0] alpha_to_out_d0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME index_of_out_address0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 index_of_out_address0 DATA" *)
output wire [7 : 0] index_of_out_address0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME index_of_out_d0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 index_of_out_d0 DATA" *)
output wire [31 : 0] index_of_out_d0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME gg_out_address0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 gg_out_address0 DATA" *)
output wire [4 : 0] gg_out_address0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME gg_out_d0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 gg_out_d0 DATA" *)
output wire [31 : 0] gg_out_d0;

(* SDX_KERNEL = "true" *)
(* SDX_KERNEL_TYPE = "hls" *)
(* SDX_KERNEL_SYNTH_INST = "inst" *)
  encode_rs inst (
    .bb_out_ce0(bb_out_ce0),
    .bb_out_we0(bb_out_we0),
    .alpha_to_out_ce0(alpha_to_out_ce0),
    .alpha_to_out_we0(alpha_to_out_we0),
    .index_of_out_ce0(index_of_out_ce0),
    .index_of_out_we0(index_of_out_we0),
    .gg_out_ce0(gg_out_ce0),
    .gg_out_we0(gg_out_we0),
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .data_in_TVALID(data_in_TVALID),
    .data_in_TREADY(data_in_TREADY),
    .data_in_TDATA(data_in_TDATA),
    .bb_out_address0(bb_out_address0),
    .bb_out_d0(bb_out_d0),
    .recd_out_TVALID(recd_out_TVALID),
    .recd_out_TREADY(recd_out_TREADY),
    .recd_out_TDATA(recd_out_TDATA),
    .alpha_to_out_address0(alpha_to_out_address0),
    .alpha_to_out_d0(alpha_to_out_d0),
    .index_of_out_address0(index_of_out_address0),
    .index_of_out_d0(index_of_out_d0),
    .gg_out_address0(gg_out_address0),
    .gg_out_d0(gg_out_d0)
  );
endmodule