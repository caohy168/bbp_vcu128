//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
//Date        : Thu Aug  5 01:31:47 2021
//Host        : caohy168 running 64-bit Ubuntu 20.04.2 LTS
//Command     : generate_target bd_0.bd
//Design      : bd_0
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_0,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=1,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "bd_0.hwdef" *) 
module bd_0
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ALPHA_TO_OUT_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ALPHA_TO_OUT_ADDRESS0, LAYERED_METADATA undef" *) output [7:0]alpha_to_out_address0;
  output alpha_to_out_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ALPHA_TO_OUT_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ALPHA_TO_OUT_D0, LAYERED_METADATA undef" *) output [31:0]alpha_to_out_d0;
  output alpha_to_out_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_BUSIF recd_in:recd_out, ASSOCIATED_RESET ap_rst_n, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_idle;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) output ap_ctrl_ready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl " *) input ap_ctrl_start;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AP_RST_N RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AP_RST_N, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input ap_rst_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.GG_OUT_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.GG_OUT_ADDRESS0, LAYERED_METADATA undef" *) output [4:0]gg_out_address0;
  output gg_out_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.GG_OUT_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.GG_OUT_D0, LAYERED_METADATA undef" *) output [31:0]gg_out_d0;
  output gg_out_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.INDEX_OF_OUT_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.INDEX_OF_OUT_ADDRESS0, LAYERED_METADATA undef" *) output [7:0]index_of_out_address0;
  output index_of_out_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.INDEX_OF_OUT_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.INDEX_OF_OUT_D0, LAYERED_METADATA undef" *) output [31:0]index_of_out_d0;
  output index_of_out_we0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.RECD_GF_OUT_ADDRESS0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.RECD_GF_OUT_ADDRESS0, LAYERED_METADATA undef" *) output [7:0]recd_gf_out_address0;
  output recd_gf_out_ce0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.RECD_GF_OUT_D0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.RECD_GF_OUT_D0, LAYERED_METADATA undef" *) output [31:0]recd_gf_out_d0;
  output recd_gf_out_we0;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 recd_in " *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME recd_in, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [31:0]recd_in_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 recd_in " *) output recd_in_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 recd_in " *) input recd_in_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 recd_out " *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME recd_out, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [31:0]recd_out_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 recd_out " *) input recd_out_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 recd_out " *) output recd_out_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.SYN_ERROR_OUT DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.SYN_ERROR_OUT, LAYERED_METADATA undef" *) input [31:0]syn_error_out;

  wire ap_clk_0_1;
  wire ap_ctrl_0_1_done;
  wire ap_ctrl_0_1_idle;
  wire ap_ctrl_0_1_ready;
  wire ap_ctrl_0_1_start;
  wire ap_rst_n_0_1;
  wire [7:0]hls_inst_alpha_to_out_address0;
  wire hls_inst_alpha_to_out_ce0;
  wire [31:0]hls_inst_alpha_to_out_d0;
  wire hls_inst_alpha_to_out_we0;
  wire [4:0]hls_inst_gg_out_address0;
  wire hls_inst_gg_out_ce0;
  wire [31:0]hls_inst_gg_out_d0;
  wire hls_inst_gg_out_we0;
  wire [7:0]hls_inst_index_of_out_address0;
  wire hls_inst_index_of_out_ce0;
  wire [31:0]hls_inst_index_of_out_d0;
  wire hls_inst_index_of_out_we0;
  wire [7:0]hls_inst_recd_gf_out_address0;
  wire hls_inst_recd_gf_out_ce0;
  wire [31:0]hls_inst_recd_gf_out_d0;
  wire hls_inst_recd_gf_out_we0;
  wire [31:0]hls_inst_recd_out_TDATA;
  wire hls_inst_recd_out_TREADY;
  wire hls_inst_recd_out_TVALID;
  wire [31:0]recd_in_0_1_TDATA;
  wire recd_in_0_1_TREADY;
  wire recd_in_0_1_TVALID;
  wire [31:0]syn_error_out_0_1;

  assign alpha_to_out_address0[7:0] = hls_inst_alpha_to_out_address0;
  assign alpha_to_out_ce0 = hls_inst_alpha_to_out_ce0;
  assign alpha_to_out_d0[31:0] = hls_inst_alpha_to_out_d0;
  assign alpha_to_out_we0 = hls_inst_alpha_to_out_we0;
  assign ap_clk_0_1 = ap_clk;
  assign ap_ctrl_0_1_start = ap_ctrl_start;
  assign ap_ctrl_done = ap_ctrl_0_1_done;
  assign ap_ctrl_idle = ap_ctrl_0_1_idle;
  assign ap_ctrl_ready = ap_ctrl_0_1_ready;
  assign ap_rst_n_0_1 = ap_rst_n;
  assign gg_out_address0[4:0] = hls_inst_gg_out_address0;
  assign gg_out_ce0 = hls_inst_gg_out_ce0;
  assign gg_out_d0[31:0] = hls_inst_gg_out_d0;
  assign gg_out_we0 = hls_inst_gg_out_we0;
  assign hls_inst_recd_out_TREADY = recd_out_tready;
  assign index_of_out_address0[7:0] = hls_inst_index_of_out_address0;
  assign index_of_out_ce0 = hls_inst_index_of_out_ce0;
  assign index_of_out_d0[31:0] = hls_inst_index_of_out_d0;
  assign index_of_out_we0 = hls_inst_index_of_out_we0;
  assign recd_gf_out_address0[7:0] = hls_inst_recd_gf_out_address0;
  assign recd_gf_out_ce0 = hls_inst_recd_gf_out_ce0;
  assign recd_gf_out_d0[31:0] = hls_inst_recd_gf_out_d0;
  assign recd_gf_out_we0 = hls_inst_recd_gf_out_we0;
  assign recd_in_0_1_TDATA = recd_in_tdata[31:0];
  assign recd_in_0_1_TVALID = recd_in_tvalid;
  assign recd_in_tready = recd_in_0_1_TREADY;
  assign recd_out_tdata[31:0] = hls_inst_recd_out_TDATA;
  assign recd_out_tvalid = hls_inst_recd_out_TVALID;
  assign syn_error_out_0_1 = syn_error_out[31:0];
  bd_0_hls_inst_0 hls_inst
       (.alpha_to_out_address0(hls_inst_alpha_to_out_address0),
        .alpha_to_out_ce0(hls_inst_alpha_to_out_ce0),
        .alpha_to_out_d0(hls_inst_alpha_to_out_d0),
        .alpha_to_out_we0(hls_inst_alpha_to_out_we0),
        .ap_clk(ap_clk_0_1),
        .ap_done(ap_ctrl_0_1_done),
        .ap_idle(ap_ctrl_0_1_idle),
        .ap_ready(ap_ctrl_0_1_ready),
        .ap_rst_n(ap_rst_n_0_1),
        .ap_start(ap_ctrl_0_1_start),
        .gg_out_address0(hls_inst_gg_out_address0),
        .gg_out_ce0(hls_inst_gg_out_ce0),
        .gg_out_d0(hls_inst_gg_out_d0),
        .gg_out_we0(hls_inst_gg_out_we0),
        .index_of_out_address0(hls_inst_index_of_out_address0),
        .index_of_out_ce0(hls_inst_index_of_out_ce0),
        .index_of_out_d0(hls_inst_index_of_out_d0),
        .index_of_out_we0(hls_inst_index_of_out_we0),
        .recd_gf_out_address0(hls_inst_recd_gf_out_address0),
        .recd_gf_out_ce0(hls_inst_recd_gf_out_ce0),
        .recd_gf_out_d0(hls_inst_recd_gf_out_d0),
        .recd_gf_out_we0(hls_inst_recd_gf_out_we0),
        .recd_in_TDATA(recd_in_0_1_TDATA),
        .recd_in_TREADY(recd_in_0_1_TREADY),
        .recd_in_TVALID(recd_in_0_1_TVALID),
        .recd_out_TDATA(hls_inst_recd_out_TDATA),
        .recd_out_TREADY(hls_inst_recd_out_TREADY),
        .recd_out_TVALID(hls_inst_recd_out_TVALID),
        .syn_error_out(syn_error_out_0_1));
endmodule
