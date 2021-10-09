`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd
// Engineer: caohuiyang
// 
// Create Date: 11/08/2020 06:39:03 PM
// Design Name: 
// Module Name: tpu_receive
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
module bbp_receive#(
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
  
  input       s_axis_outputADI_tvalid[8],  
  input       s_axis_outputADQ_tvalid[8],
  input       s_axis_outputADI_tlast[8],
  input       s_axis_outputADQ_tlast[8],     
  input [15:0]s_axis_outputADI_tdata[8],
  input [15:0]s_axis_outputADQ_tdata[8],
  
  input       s_axis_outputADI_tvalid_qam256[8],  
  input       s_axis_outputADQ_tvalid_qam256[8],
  input       s_axis_outputADI_tlast_qam256[8],
  input       s_axis_outputADQ_tlast_qam256[8],     
  input [15:0]s_axis_outputADI_tdata_qam256[8],
  input [15:0]s_axis_outputADQ_tdata_qam256[8],
  
  input       s_axis_outputADI_tvalid_qam1024[8],  
  input       s_axis_outputADQ_tvalid_qam1024[8],
  input       s_axis_outputADI_tlast_qam1024[8],
  input       s_axis_outputADQ_tlast_qam1024[8],     
  input [15:0]s_axis_outputADI_tdata_qam1024[8],
  input [15:0]s_axis_outputADQ_tdata_qam1024[8],
  
  input       s_axis_outputADI_tvalid_a[8],  
  input       s_axis_outputADQ_tvalid_a[8],     
  input [31:0]s_axis_outputADI_tdata_a[8],
  input [31:0]s_axis_outputADQ_tdata_a[8],
  
`ifdef pcie_endpoint
    //to pcie endpiont interface
  output [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0] pci_exp_txp,
  output [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0] pci_exp_txn,
  input [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0]  pci_exp_rxp,
  input [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0]  pci_exp_rxn,
`else
    output[C_M_AXIS_DATA_WIDTH-1:0]   axis_tdata_che,//the bus for data checker
    output                            axis_tlast_che,
    output[C_M_AXIS_DATA_WIDTH/8-1:0] axis_tuser_che,
    output[C_M_AXIS_DATA_WIDTH/8-1:0] axis_tkeep_che,
    output                            axis_tvalid_che,
`endif
  
`ifdef optiacal_10g
  output    xphy_txp,
  output    xphy_txn,
  input     xphy_rxp,
  input     xphy_rxn,
`endif

  input 	sys_clk_p,
  input 	sys_clk_n,
  input 	sys_rst_n
  );
  
//logic clk_250m,clk_500m;   

//tpu_receive_clock tpu_receive_clock 
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
  
    logic [AXIS_TDATA_WIDTH-1:0] axis_tdata_bb;
    logic [AXIS_TKEEP_WIDTH-1:0] axis_tkeep_bb;
    logic                        axis_tvalid_bb;
    logic                        axis_tlast_bb;
    logic                        axis_tuser_bb;
    logic                        axis_tready_bb;
    
    assign axis_tdata_che=axis_tdata_bb;
    assign axis_tlast_che=axis_tlast_bb;
    assign axis_tuser_che=axis_tuser_bb;
    assign axis_tkeep_che=axis_tkeep_bb;
    assign axis_tvalid_che=axis_tvalid_bb;
    
    logic [AXIS_TDATA_WIDTH-1:0] axis_tdata_bbtoc2h;
    logic [AXIS_TKEEP_WIDTH-1:0] axis_tkeep_bbtoc2h;
    logic                        axis_tvalid_bbtoc2h;
    logic                        axis_tlast_bbtoc2h;
    logic                        axis_tuser_bbtoc2h;
    logic                        axis_tready_bbtoc2h;
 
`ifdef pcie_endpoint
    logic pcie_user_clk;
    logic   [C_S_AXIS_DATA_WIDTH-1:0]   s_axis_c2h_tdata_0;
    logic                               s_axis_c2h_tlast_0;
    logic   [C_S_AXIS_DATA_WIDTH/8-1:0] s_axis_c2h_tuser_0;
    logic   [C_S_AXIS_DATA_WIDTH/8-1:0] s_axis_c2h_tkeep_0;
    logic                               s_axis_c2h_tvalid_0;
    logic                               s_axis_c2h_tready_0;
      
//      assign s_axis_c2h_tdata_0 =  m_axis_h2c_tdata_0;   
//      assign s_axis_c2h_tlast_0 =  m_axis_h2c_tlast_0;   
//      assign s_axis_c2h_tvalid_0 =  m_axis_h2c_tvalid_0;   
//      assign s_axis_c2h_tkeep_0 =  m_axis_h2c_tkeep_0;  
//      assign m_axis_h2c_tready_0 = s_axis_c2h_tready_0;
 bbtoc2h bbtoc2h_fifo(
  .s_axis_aresetn   (!reset),
  .s_axis_aclk      (clk_250m),
  .s_axis_tvalid    (axis_tvalid_bb),
  .s_axis_tready    (axis_tready_bb),
  .s_axis_tdata     (axis_tdata_bb),
  .s_axis_tkeep     (axis_tkeep_bb),
  .s_axis_tlast     (axis_tlast_bb),
  .m_axis_aclk      (pcie_user_clk),
  .m_axis_tvalid    (s_axis_c2h_tvalid_0),
  .m_axis_tready    (s_axis_c2h_tready_0),
  .m_axis_tdata     (s_axis_c2h_tdata_0),
  .m_axis_tkeep     (s_axis_c2h_tkeep_0),
  .m_axis_tlast     (s_axis_c2h_tlast_0)
);

//      assign s_axis_c2h_tdata_0 =  axis_tdata_bb;   
//      assign s_axis_c2h_tlast_0 =  axis_tlast_bb;   
//      assign s_axis_c2h_tvalid_0 =  axis_tvalid_bb;   
//      assign s_axis_c2h_tkeep_0 =  axis_tkeep_bb;  
//      assign axis_tready_bb = s_axis_c2h_tready_0;
      
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

logic m_axis_output_tvalid;
logic m_axis_output_tready;
logic [63:0]m_axis_output_tdata;
logic m_axis_output_tlast;


logic [AXIS_TDATA_WIDTH-1:0] axis_tdata_10g;
logic [AXIS_TKEEP_WIDTH-1:0] axis_tkeep_10g;
logic                        axis_tvalid_10g;
logic                        axis_tlast_10g;
logic                        axis_tuser_10g;
logic                        axis_tready_10g=1;


`ifdef optiacal_10g
  kcu105_10gbaser mainnet_up10g(
  
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
  
  .s_axis_tx_tdata(axis_tdata_bb),
  .s_axis_tx_tkeep(axis_tkeep_bb),
  .s_axis_tx_tlast(axis_tlast_bb),
  .s_axis_tx_tready(axis_tready_bb),
  .s_axis_tx_tuser(axis_tuser_bb),
  .s_axis_tx_tvalid(axis_tvalid_bb),
  
  .leds());
`endif  
   
//logic [AXIS_TDATA_WIDTH-1:0] axis_tdata_transfer;
//logic [AXIS_TKEEP_WIDTH-1:0] axis_tkeep_transfer;
//logic                        axis_tvalid_transfer;
//logic                        axis_tlast_transfer;
//logic                        axis_tuser_transfer;
//logic                        axis_tready_transfer=1; 
  
// datastream_transfer datastream_transfer_transmit (

//  .aclk(clk_250m),
//  .reset(reset),  
  
//  .rx_axis_tdata_right (axis_tdata_10g ),
//  .rx_axis_tkeep_right (axis_tkeep_10g ),
//  .rx_axis_tvalid_right(axis_tvalid_10g),
//  .rx_axis_tlast_right (axis_tlast_10g ),
//  .rx_axis_tuser_right (axis_tuser_10g ),
//  .rx_axis_tready_right(axis_tready_10g),
//  //DATA TO TPU BAESBAND 
//  .tx_axis_tdata_right (axis_tdata_transfer),
//  .tx_axis_tkeep_right (axis_tkeep_transfer),
//  .tx_axis_tvalid_right(axis_tvalid_transfer),
//  .tx_axis_tlast_right (axis_tlast_transfer),
//  .tx_axis_tuser_right (axis_tuser_transfer),
//  .tx_axis_tready_right(axis_tready_transfer));

data_transfer dst_receive (

    .aclk(clk_250m),
    .reset(reset),  
    
    .rx_axis_tdata_left(m_axis_output_tdata),
    .rx_axis_tkeep_left(),
    .rx_axis_tvalid_left(m_axis_output_tvalid),
    .rx_axis_tlast_left(m_axis_output_tlast),
    .rx_axis_tuser_left(),
    .rx_axis_tready_left(m_axis_output_tready),
    
    .tx_axis_tdata_left (axis_tdata_bb),
    .tx_axis_tkeep_left (axis_tkeep_bb),
    .tx_axis_tvalid_left(axis_tvalid_bb),
    .tx_axis_tlast_left (axis_tlast_bb),
    .tx_axis_tuser_left (axis_tuser_bb),
    .tx_axis_tready_left(axis_tready_bb)); 

    
logic m_axis_outputI_tvalid[8];
logic m_axis_outputI_tready[8];
logic [15:0]m_axis_outputI_tdata[8];
logic m_axis_outputI_tlast[8];
logic m_axis_outputQ_tvalid[8]={1,1,1,1,1,1,1,1};
logic m_axis_outputQ_tready[8]={1,1,1,1,1,1,1,1};
logic [15:0]m_axis_outputQ_tdata[8];
logic m_axis_outputQ_tlast[8];
  
 tpu_pullstream tpu_pullstream(
  .clk_250m(clk_250m),
  .clk_500m(clk_500m),
  .reset(reset),
  
  .m_axis_input_tvalid(m_axis_output_tvalid),
  .m_axis_input_tready(m_axis_output_tready),
  .m_axis_input_tdata (m_axis_output_tdata),
  .m_axis_input_tlast (m_axis_output_tlast),
  
  .s_axis_outputADI_tvalid(s_axis_outputADI_tvalid),  
  .s_axis_outputADQ_tvalid(s_axis_outputADQ_tvalid),
  .s_axis_outputADI_tlast (s_axis_outputADI_tlast ),
  .s_axis_outputADQ_tlast (s_axis_outputADQ_tlast ),     
  .s_axis_outputADI_tdata (s_axis_outputADI_tdata ),
  .s_axis_outputADQ_tdata (s_axis_outputADQ_tdata ),
  
  .s_axis_outputADI_tvalid_qam256(s_axis_outputADI_tvalid_qam256),  
  .s_axis_outputADQ_tvalid_qam256(s_axis_outputADQ_tvalid_qam256),
  .s_axis_outputADI_tlast_qam256 (s_axis_outputADI_tlast_qam256 ),
  .s_axis_outputADQ_tlast_qam256 (s_axis_outputADQ_tlast_qam256 ),     
  .s_axis_outputADI_tdata_qam256 (s_axis_outputADI_tdata_qam256 ),
  .s_axis_outputADQ_tdata_qam256 (s_axis_outputADQ_tdata_qam256 ),
  
  .s_axis_outputADI_tvalid_qam1024(s_axis_outputADI_tvalid_qam1024),  
  .s_axis_outputADQ_tvalid_qam1024(s_axis_outputADQ_tvalid_qam1024),
  .s_axis_outputADI_tlast_qam1024 (s_axis_outputADI_tlast_qam1024 ),
  .s_axis_outputADQ_tlast_qam1024 (s_axis_outputADQ_tlast_qam1024 ),     
  .s_axis_outputADI_tdata_qam1024 (s_axis_outputADI_tdata_qam1024 ),
  .s_axis_outputADQ_tdata_qam1024 (s_axis_outputADQ_tdata_qam1024 ),
  
  .s_axis_outputADI_tvalid_a(s_axis_outputADI_tvalid_a),  
  .s_axis_outputADQ_tvalid_a(s_axis_outputADQ_tvalid_a), 
  .s_axis_outputADI_tdata_a(s_axis_outputADI_tdata_a),
  .s_axis_outputADQ_tdata_a(s_axis_outputADQ_tdata_a)
);
        

        
endmodule
