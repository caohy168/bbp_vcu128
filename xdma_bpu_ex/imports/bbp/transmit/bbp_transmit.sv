`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd_thz
// Engineer: caohuiyang 
// 
// Create Date: March 26 2021
// Design Name: 
// Module Name: bbp(base band processor)_transmit
// Project Name: 
// Target Devices: vcu128
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "bbp_parameter.vh"
module bbp_transmit#(
        //10g mac and phy parameter
        parameter AXIS_TDATA_WIDTH =  64,
        parameter AXIS_TKEEP_WIDTH =  AXIS_TDATA_WIDTH/8,
        //pcie endpiont parameter
        parameter PL_LINK_CAP_MAX_LINK_WIDTH          = 1,            // 1- X1; 2 - X2; 4 - X4; 8 - X8
        parameter PL_SIM_FAST_LINK_TRAINING           = "FALSE",      // Simulation Speedup
        parameter PL_LINK_CAP_MAX_LINK_SPEED          = 1,             // 1- GEN1; 2 - GEN2; 4 - GEN3
        parameter C_DATA_WIDTH                        = 64 ,
        parameter EXT_PIPE_SIM                        = "FALSE",  // This Parameter has effect on selecting Enable External PIPE Interface in GUI.
        parameter C_ROOT_PORT                         = "FALSE",      // PCIe block is in root port mode
        parameter C_DEVICE_NUMBER                     = 0,            // Device number for Root Port configurations only
        parameter AXIS_CCIX_RX_TDATA_WIDTH     = 256, 
        parameter AXIS_CCIX_TX_TDATA_WIDTH     = 256,
        parameter AXIS_CCIX_RX_TUSER_WIDTH     = 46,
        parameter AXIS_CCIX_TX_TUSER_WIDTH     = 46,
        
        parameter AXI_DATA_WIDTH               = 64,
        parameter C_S_AXIS_DATA_WIDTH          = AXI_DATA_WIDTH,
        parameter C_M_AXIS_DATA_WIDTH          = AXI_DATA_WIDTH
    )(
  input        clk_250m,clk_500m,

  input        refclk_p,
  input        refclk_n,
  input        reset,
  `ifdef optiacal_10g
      //to 10g optical module
      output       xphy_txp,
      output       xphy_txn,
      input        xphy_rxp,
      input        xphy_rxn,
  `endif
  //to DA 204B interface
  output       m_axis_outputDAI_tvalid[8],  
  output       m_axis_outputDAQ_tvalid[8],
  output       m_axis_outputDAI_tlast[8],
  output       m_axis_outputDAQ_tlast[8],     
  output [15:0]m_axis_outputDAI_tdata[8],
  output [15:0]m_axis_outputDAQ_tdata[8],
  
  output       m_axis_outputDAI_tvalid_qam256[8],  
  output       m_axis_outputDAQ_tvalid_qam256[8],
  output       m_axis_outputDAI_tlast_qam256[8],
  output       m_axis_outputDAQ_tlast_qam256[8],     
  output [15:0]m_axis_outputDAI_tdata_qam256[8],
  output [15:0]m_axis_outputDAQ_tdata_qam256[8],
  
  output       m_axis_outputDAI_tvalid_qam1024[8],  
  output       m_axis_outputDAQ_tvalid_qam1024[8],
  output       m_axis_outputDAI_tlast_qam1024[8],
  output       m_axis_outputDAQ_tlast_qam1024[8],     
  output [15:0]m_axis_outputDAI_tdata_qam1024[8],
  output [15:0]m_axis_outputDAQ_tdata_qam1024[8],
  //to a file in order to save apsk modulate data
  output       m_axis_outputDAI_tvalid_a[8],//_a means apsk  
  output       m_axis_outputDAQ_tvalid_a[8],
//  output       m_axis_outputDAI_tlast_a[8],
//  output       m_axis_outputDAQ_tlast_a[8],     
  output [31:0]m_axis_outputDAI_tdata_a[8],
  output [31:0]m_axis_outputDAQ_tdata_a[8],
  `ifdef pcie_endpoint
  //to pcie endpiont interface
    output [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0] pci_exp_txp,
    output [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0] pci_exp_txn,
    input [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0]  pci_exp_rxp,
    input [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0]  pci_exp_rxn,
  `else
    input[C_M_AXIS_DATA_WIDTH-1:0]   axis_tdata_gen,
    input                            axis_tlast_gen,
    input[C_M_AXIS_DATA_WIDTH/8-1:0] axis_tuser_gen,
    input[C_M_AXIS_DATA_WIDTH/8-1:0] axis_tkeep_gen,
    input                            axis_tvalid_gen,
  `endif
  
  input 					 sys_clk_p,
  input 					 sys_clk_n,
  input 					 sys_rst_n);
  
//logic clk_250m,clk_500m;   
//tpu_transmit_clock tpu_transmit_clock 
// (
//  // Clock out ports
//  .clk_out1(clk_250m),
//  .clk_out2(clk_500m),
// // Clock in ports
//  .clk_in1_p(CLK_125MHZ_P),
//  .clk_in1_n(CLK_125MHZ_N)
// );   
  
  // H2C AXI ST interface to user Channel 0
  logic   [C_M_AXIS_DATA_WIDTH-1:0]   m_axis_h2c_tdata_0;
  logic                               m_axis_h2c_tlast_0;
  logic   [C_M_AXIS_DATA_WIDTH/8-1:0] m_axis_h2c_tuser_0;
  logic   [C_M_AXIS_DATA_WIDTH/8-1:0] m_axis_h2c_tkeep_0;
  logic                               m_axis_h2c_tvalid_0;
  logic                               m_axis_h2c_tready_0;
  
  logic pcie_user_clk;
`ifdef pcie_endpoint
    logic   [C_S_AXIS_DATA_WIDTH-1:0]   s_axis_c2h_tdata_0;
    logic                               s_axis_c2h_tlast_0;
    logic   [C_S_AXIS_DATA_WIDTH/8-1:0] s_axis_c2h_tuser_0;
    logic   [C_S_AXIS_DATA_WIDTH/8-1:0] s_axis_c2h_tkeep_0;
    logic                               s_axis_c2h_tvalid_0;
    logic                               s_axis_c2h_tready_0;
      
      assign s_axis_c2h_tdata_0 =  m_axis_h2c_tdata_0;   
      assign s_axis_c2h_tlast_0 =  m_axis_h2c_tlast_0;   
      assign s_axis_c2h_tvalid_0 =  m_axis_h2c_tvalid_0;   
      assign s_axis_c2h_tkeep_0 =  m_axis_h2c_tkeep_0;  
      assign m_axis_h2c_tready_0 = s_axis_c2h_tready_0;
    xilinx_dma_pcie_ep EP(
    //to pcie endpiont interface
      .pci_exp_txp(pci_exp_txp),
      .pci_exp_txn(pci_exp_txn),
      .pci_exp_rxp(pci_exp_rxp),
      .pci_exp_rxn(pci_exp_rxn),
      
      .sys_clk_p(sys_clk_p),
      .sys_clk_n(sys_clk_n),
      .sys_rst_n(sys_rst_n),
                
      .user_clk(pcie_user_clk),
       // C2H AXI ST interface to user Channle 0
      .s_axis_c2h_tdata_0 (s_axis_c2h_tdata_0 ),
      .s_axis_c2h_tlast_0 (s_axis_c2h_tlast_0 ),
      .s_axis_c2h_tuser_0 (s_axis_c2h_tuser_0 ),
      .s_axis_c2h_tkeep_0 (s_axis_c2h_tkeep_0 ),
      .s_axis_c2h_tvalid_0(s_axis_c2h_tvalid_0),
      .s_axis_c2h_tready_0(s_axis_c2h_tready_0),
      // H2C AXI ST interface to user Channel 0
      .m_axis_h2c_tdata_0 (m_axis_h2c_tdata_0 ),
      .m_axis_h2c_tlast_0 (m_axis_h2c_tlast_0 ),
      .m_axis_h2c_tuser_0 (m_axis_h2c_tuser_0 ),
      .m_axis_h2c_tkeep_0 (m_axis_h2c_tkeep_0 ),
      .m_axis_h2c_tvalid_0(m_axis_h2c_tvalid_0),
      .m_axis_h2c_tready_0(m_axis_h2c_tready_0));
`endif
 
logic [AXIS_TDATA_WIDTH-1:0] axis_tdata_10g;
logic [AXIS_TKEEP_WIDTH-1:0] axis_tkeep_10g;
logic                        axis_tvalid_10g;
logic                        axis_tlast_10g;
logic                        axis_tuser_10g;
logic                        axis_tready_10g=1;

`ifdef optiacal_10g
  kcu105_10gbaser mainnet_down10g(
  
  .refclk_n         (refclk_n),        
  .refclk_p         (refclk_p),        
  .reset            (reset),          
  .xphy_txp         (xphy_txp),        
  .xphy_txn         (xphy_txn),         
  .xphy_rxp         (xphy_rxp),        
  .xphy_rxn         (xphy_rxn),        
  
  .rx_axis_aclk  (clk_250m      ),
  .rx_axis_tdata (axis_tdata_10g ),
  .rx_axis_tkeep (axis_tkeep_10g ),
  .rx_axis_tvalid(axis_tvalid_10g),
  .rx_axis_tlast (axis_tlast_10g ),
  .rx_axis_tuser (axis_tuser_10g ),
  .rx_axis_tready(axis_tready_10g),
  
  .leds());
`endif  

//`ifdef self_check
//logic   [C_M_AXIS_DATA_WIDTH-1:0]  axis_tdata_gen;
//logic                              axis_tlast_gen;
//logic   [C_M_AXIS_DATA_WIDTH/8-1:0]axis_tuser_gen;
//logic   [C_M_AXIS_DATA_WIDTH/8-1:0]axis_tkeep_gen;
//logic                              axis_tvalid_gen;
//logic                              axis_tready_gen=1;

//package_gen package_gen(
//      .clk(clk_250m),
//      .reset(reset),
//      .axis_tdata_gen(axis_tdata_gen),
//      .axis_tlast_gen(axis_tlast_gen),
//      .axis_tuser_gen(axis_tuser_gen),
//      .axis_tkeep_gen(axis_tkeep_gen),
//      .axis_tvalid_gen(axis_tvalid_gen),
//      .axis_tready_gen(1));
  
logic [AXIS_TDATA_WIDTH-1:0] axis_tdata_transfer;
logic [AXIS_TKEEP_WIDTH-1:0] axis_tkeep_transfer;
logic                        axis_tvalid_transfer;
logic                        axis_tlast_transfer;
logic                        axis_tuser_transfer;
logic                        axis_tready_transfer=1; 

 datastream_transfer dst_transmit (

  .aclk(clk_250m),
  .pcie_user_clk(pcie_user_clk),
  
  .reset(reset),  
  
  `ifdef pcie_endpoint
      .rx_axis_tdata_pcie (m_axis_h2c_tdata_0),
      .rx_axis_tkeep_pcie (m_axis_h2c_tkeep_0),
      .rx_axis_tvalid_pcie(m_axis_h2c_tvalid_0),
      .rx_axis_tlast_pcie (m_axis_h2c_tlast_0),
      .rx_axis_tuser_pcie (m_axis_h2c_tuser_0),
      .rx_axis_tready_pcie(),  
  `else
      .rx_axis_tdata_pcie (axis_tdata_gen),
      .rx_axis_tkeep_pcie (axis_tkeep_gen),
      .rx_axis_tvalid_pcie(axis_tvalid_gen),
      .rx_axis_tlast_pcie (axis_tlast_gen),
      .rx_axis_tuser_pcie (axis_tuser_gen),
      .rx_axis_tready_pcie(),  
  `endif
  
  `ifdef self_check

  `endif
  
  `ifdef optiacal_10g
  .rx_axis_tdata_10g (axis_tdata_10g ),
  .rx_axis_tkeep_10g (axis_tkeep_10g ),
  .rx_axis_tvalid_10g(axis_tvalid_10g),
  .rx_axis_tlast_10g (axis_tlast_10g ),
  .rx_axis_tuser_10g (axis_tuser_10g ),
  .rx_axis_tready_10g(axis_tready_10g),
  `endif
  //DATA TO TPU BAESBAND 
  .tx_axis_tdata_right (axis_tdata_transfer),
  .tx_axis_tkeep_right (axis_tkeep_transfer),
  .tx_axis_tvalid_right(axis_tvalid_transfer),
  .tx_axis_tlast_right (axis_tlast_transfer),
  .tx_axis_tuser_right (axis_tuser_transfer),
  .tx_axis_tready_right(axis_tready_transfer));
    
logic m_axis_outputI_tvalid[8];
logic m_axis_outputI_tready[8];
logic [15:0]m_axis_outputI_tdata[8];
logic m_axis_outputI_tlast[8];
logic m_axis_outputQ_tvalid[8]={1,1,1,1,1,1,1,1};
logic m_axis_outputQ_tready[8]={1,1,1,1,1,1,1,1};
logic [15:0]m_axis_outputQ_tdata[8];
logic m_axis_outputQ_tlast[8];

//logic       m_axis_outputDAI_tvalid_a[8];//_a means apsk  
//logic       m_axis_outputDAQ_tvalid_a[8];
//  output       m_axis_outputDAI_tlast_a[8],
//  output       m_axis_outputDAQ_tlast_a[8],     
//logic [31:0]m_axis_outputDAI_tdata_a[8];
//logic [31:0]m_axis_outputDAQ_tdata_a[8];
logic       m_axis_outputDAI_tready_qam256[8]={1,1,1,1,1,1,1,1};
logic       m_axis_outputDAQ_tready_qam256[8]={1,1,1,1,1,1,1,1};

logic       m_axis_outputDAI_tready_qam1024[8]={1,1,1,1,1,1,1,1};
logic       m_axis_outputDAQ_tready_qam1024[8]={1,1,1,1,1,1,1,1};

 tpu_pushstream tpu_pushstream(
  .clk_250m(clk_250m),
  .clk_500m(clk_500m),
  .reset(reset),
  
  .s_axis_input_tvalid(axis_tvalid_transfer),
  .s_axis_input_tready(axis_tready_transfer),
  .s_axis_input_tdata (axis_tdata_transfer),
  .s_axis_input_tlast (axis_tlast_transfer),
  
  .m_axis_outputDAI_tvalid(m_axis_outputDAI_tvalid),  
  .m_axis_outputDAQ_tvalid(m_axis_outputDAQ_tvalid),
  .m_axis_outputDAI_tlast (m_axis_outputDAI_tlast ),
  .m_axis_outputDAQ_tlast (m_axis_outputDAQ_tlast ),     
  .m_axis_outputDAI_tdata (m_axis_outputDAI_tdata ),
  .m_axis_outputDAQ_tdata (m_axis_outputDAQ_tdata ),
  
  .m_axis_outputDAI_tvalid_qam256(m_axis_outputDAI_tvalid_qam256),
  .m_axis_outputDAI_tready_qam256(m_axis_outputDAI_tready_qam256),
  .m_axis_outputDAI_tdata_qam256 (m_axis_outputDAI_tdata_qam256 ),
  .m_axis_outputDAI_tlast_qam256 (m_axis_outputDAI_tlast_qam256 ),
  .m_axis_outputDAQ_tvalid_qam256(m_axis_outputDAQ_tvalid_qam256),
  .m_axis_outputDAQ_tready_qam256(m_axis_outputDAQ_tready_qam256),
  .m_axis_outputDAQ_tdata_qam256 (m_axis_outputDAQ_tdata_qam256 ),
  .m_axis_outputDAQ_tlast_qam256 (m_axis_outputDAQ_tlast_qam256 ),
  
  .m_axis_outputDAI_tvalid_qam1024(m_axis_outputDAI_tvalid_qam1024),
  .m_axis_outputDAI_tready_qam1024(m_axis_outputDAI_tready_qam1024),
  .m_axis_outputDAI_tdata_qam1024 (m_axis_outputDAI_tdata_qam1024 ),
  .m_axis_outputDAI_tlast_qam1024 (m_axis_outputDAI_tlast_qam1024 ),
  .m_axis_outputDAQ_tvalid_qam1024(m_axis_outputDAQ_tvalid_qam1024),
  .m_axis_outputDAQ_tready_qam1024(m_axis_outputDAQ_tready_qam1024),
  .m_axis_outputDAQ_tdata_qam1024 (m_axis_outputDAQ_tdata_qam1024 ),
  .m_axis_outputDAQ_tlast_qam1024 (m_axis_outputDAQ_tlast_qam1024 ),
  
  .m_axis_outputDAI_tvalid_a(m_axis_outputDAI_tvalid_a),  
  .m_axis_outputDAQ_tvalid_a(m_axis_outputDAQ_tvalid_a),
//  .m_axis_outputDAI_tlast_a (m_axis_outputDAI_tlast_a),
//  .m_axis_outputDAQ_tlast_a (m_axis_outputDAQ_tlast_a),     
  .m_axis_outputDAI_tdata_a (m_axis_outputDAI_tdata_a ),
  .m_axis_outputDAQ_tdata_a (m_axis_outputDAQ_tdata_a ));
        
endmodule
