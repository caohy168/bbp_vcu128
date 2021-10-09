`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd_thz
// Engineer: caohuiyang
// 
// Create Date: 04/21/2021 08:04:01 PM
// Design Name: 
// Module Name: baseband_processor
// Project Name: 
// Target Devices: 
// Tool Versions: 2020.2
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

module baseband_processor#(
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
        
        `ifdef ethernet80
         parameter AXI_DATA_WIDTH               = 512,//be modify 256bit to support 40G
        `else  
         parameter AXI_DATA_WIDTH               = 64,
        `endif
        parameter C_S_AXIS_DATA_WIDTH          = AXI_DATA_WIDTH,
        parameter C_M_AXIS_DATA_WIDTH          = AXI_DATA_WIDTH
        
    )(
  input        CLK_125MHZ_P,CLK_125MHZ_N,

  input        refclk_p,
  input        refclk_n,
  input        reset,
  
  input 	   sys_clk_p,
  input 	   sys_clk_n,
  input 	   sys_rst_n,
  
  `ifdef pcie_endpoint
  //to pcie endpiont interface
      output [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0] pci_exp_t_txn,
      output [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0] pci_exp_t_txp,
      input [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0]  pci_exp_t_rxn,
      input [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0]  pci_exp_t_rxp,
      
      output [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0] pci_exp_r_txn,
      output [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0] pci_exp_r_txp,
      input [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0]  pci_exp_r_rxn,
      input [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0]  pci_exp_r_rxp
      
  `else
      input[C_S_AXIS_DATA_WIDTH-1:0]   axis_tdata_gen,  
      input                            axis_tlast_gen,  
      input[C_S_AXIS_DATA_WIDTH/8-1:0] axis_tuser_gen,  
      input[C_S_AXIS_DATA_WIDTH/8-1:0] axis_tkeep_gen,  
      input                            axis_tvalid_gen,
                                                        
      output[C_M_AXIS_DATA_WIDTH-1:0]   axis_tdata_che,
      output                            axis_tlast_che,
      output[C_M_AXIS_DATA_WIDTH/8-1:0] axis_tuser_che,
      output[C_M_AXIS_DATA_WIDTH/8-1:0] axis_tkeep_che,
      output                            axis_tvalid_che
      //to DA 204B interface
//      output       m_axis_outputDAI_tvalid[8],  
//      output       m_axis_outputDAQ_tvalid[8],
//      output       m_axis_outputDAI_tlast[8],
//      output       m_axis_outputDAQ_tlast[8],     
//      output [15:0]m_axis_outputDAI_tdata[8],
//      output [15:0]m_axis_outputDAQ_tdata[8],
      
//      input       s_axis_outputADI_tvalid[8],  
//      input       s_axis_outputADQ_tvalid[8],
//      input       s_axis_outputADI_tlast[8],
//      input       s_axis_outputADQ_tlast[8],     
//      input [15:0]s_axis_outputADI_tdata[8],
//      input [15:0]s_axis_outputADQ_tdata[8]
      
  `endif
  
  `ifdef optiacal_10g
      //to 10g optical module
      output       xphy_txp,
      output       xphy_txn,
      input        xphy_rxp,
      input        xphy_rxn
  `endif
  );
  
// `ifdef pcie_endpoint
      
// `else
      logic[AXIS_TDATA_WIDTH-1:0]   axis_data_gen_group[8];
      logic                         axis_last_gen_group[8];
      logic[AXIS_TDATA_WIDTH/8-1:0] axis_user_gen_group[8];
      logic[AXIS_TDATA_WIDTH/8-1:0] axis_keep_gen_group[8];
      logic                         axis_valid_gen_group[8];
                                                   
      logic[AXIS_TDATA_WIDTH-1:0]   axis_data_che_group[8];//the bus for data checker
      logic                         axis_last_che_group[8];
      logic[AXIS_TDATA_WIDTH/8-1:0] axis_user_che_group[8];
      logic[AXIS_TDATA_WIDTH/8-1:0] axis_keep_che_group[8];
      logic                         axis_valid_che_group[8];
 
      //to DA 204B interface
      `ifdef ethernet80
         logic       axis_outputDAI_tvalid[8][8];
         logic       axis_outputDAQ_tvalid[8][8];
         logic       axis_outputDAI_tlast[8][8];
         logic       axis_outputDAQ_tlast[8][8];     
         logic [15:0]axis_outputDAI_tdata[8][8];
         logic [15:0]axis_outputDAQ_tdata[8][8];
         
         logic       axis_outputADI_tvalid[8][8];  
         logic       axis_outputADQ_tvalid[8][8];
         logic       axis_outputADI_tlast[8][8];
         logic       axis_outputADQ_tlast[8][8];     
         logic [15:0]axis_outputADI_tdata[8][8];
         logic [15:0]axis_outputADQ_tdata[8][8];
         
         logic       axis_outputDAI_tvalid_qam256[8][8];
         logic       axis_outputDAQ_tvalid_qam256[8][8];
         logic       axis_outputDAI_tlast_qam256[8][8];
         logic       axis_outputDAQ_tlast_qam256[8][8];     
         logic [15:0]axis_outputDAI_tdata_qam256[8][8];
         logic [15:0]axis_outputDAQ_tdata_qam256[8][8];
         
         logic       axis_outputADI_tvalid_qam256[8][8];  
         logic       axis_outputADQ_tvalid_qam256[8][8];
         logic       axis_outputADI_tlast_qam256[8][8];
         logic       axis_outputADQ_tlast_qam256[8][8];     
         logic [15:0]axis_outputADI_tdata_qam256[8][8];
         logic [15:0]axis_outputADQ_tdata_qam256[8][8];
         
         logic       axis_outputDAI_tvalid_qam1024[8][8];
         logic       axis_outputDAQ_tvalid_qam1024[8][8];
         logic       axis_outputDAI_tlast_qam1024[8][8];
         logic       axis_outputDAQ_tlast_qam1024[8][8];     
         logic [15:0]axis_outputDAI_tdata_qam1024[8][8];
         logic [15:0]axis_outputDAQ_tdata_qam1024[8][8];
         
         logic       axis_outputADI_tvalid_qam1024[8][8];  
         logic       axis_outputADQ_tvalid_qam1024[8][8];
         logic       axis_outputADI_tlast_qam1024[8][8];
         logic       axis_outputADQ_tlast_qam1024[8][8];     
         logic [15:0]axis_outputADI_tdata_qam1024[8][8];
         logic [15:0]axis_outputADQ_tdata_qam1024[8][8];
         
         logic       axis_outputDAI_tvalid_a[8][8];
         logic       axis_outputDAQ_tvalid_a[8][8]; 
         logic [31:0]axis_outputDAI_tdata_a[8][8];
         logic [31:0]axis_outputDAQ_tdata_a[8][8];
         
         logic       axis_outputADI_tvalid_a[8][8];  
         logic       axis_outputADQ_tvalid_a[8][8];   
         logic [31:0]axis_outputADI_tdata_a[8][8];
         logic [31:0]axis_outputADQ_tdata_a[8][8];
      `else   
         logic       axis_outputDAI_tvalid[8];
         logic       axis_outputDAQ_tvalid[8];
         logic       axis_outputDAI_tlast[8];
         logic       axis_outputDAQ_tlast[8];     
         logic [15:0]axis_outputDAI_tdata[8];
         logic [15:0]axis_outputDAQ_tdata[8];
         
         logic       axis_outputADI_tvalid[8];  
         logic       axis_outputADQ_tvalid[8];
         logic       axis_outputADI_tlast[8];
         logic       axis_outputADQ_tlast[8];     
         logic [15:0]axis_outputADI_tdata[8];
         logic [15:0]axis_outputADQ_tdata[8];
         
         logic       axis_outputDAI_tvalid_qam256[8];
         logic       axis_outputDAQ_tvalid_qam256[8];
         logic       axis_outputDAI_tlast_qam256[8];
         logic       axis_outputDAQ_tlast_qam256[8];     
         logic [15:0]axis_outputDAI_tdata_qam256[8];
         logic [15:0]axis_outputDAQ_tdata_qam256[8];
         
         logic       axis_outputADI_tvalid_qam256[8];  
         logic       axis_outputADQ_tvalid_qam256[8];
         logic       axis_outputADI_tlast_qam256[8];
         logic       axis_outputADQ_tlast_qam256[8];     
         logic [15:0]axis_outputADI_tdata_qam256[8];
         logic [15:0]axis_outputADQ_tdata_qam256[8];
         
         logic       axis_outputDAI_tvalid_qam1024[8];
         logic       axis_outputDAQ_tvalid_qam1024[8];
         logic       axis_outputDAI_tlast_qam1024[8];
         logic       axis_outputDAQ_tlast_qam1024[8];     
         logic [15:0]axis_outputDAI_tdata_qam1024[8];
         logic [15:0]axis_outputDAQ_tdata_qam1024[8];
         
         logic       axis_outputADI_tvalid_qam1024[8];  
         logic       axis_outputADQ_tvalid_qam1024[8];
         logic       axis_outputADI_tlast_qam1024[8];
         logic       axis_outputADQ_tlast_qam1024[8];     
         logic [15:0]axis_outputADI_tdata_qam1024[8];
         logic [15:0]axis_outputADQ_tdata_qam1024[8];
         
         logic       axis_outputDAI_tvalid_a[8];
         logic       axis_outputDAQ_tvalid_a[8]; 
         logic [31:0]axis_outputDAI_tdata_a[8];
         logic [31:0]axis_outputDAQ_tdata_a[8];
         
         logic       axis_outputADI_tvalid_a[8];  
         logic       axis_outputADQ_tvalid_a[8];   
         logic [31:0]axis_outputADI_tdata_a[8];
         logic [31:0]axis_outputADQ_tdata_a[8];  
      `endif
     
    genvar i,j;
    generate
        `ifdef ethernet80
          for (j = 0; j < `groups; j = j + 1)begin
            for (i = 0; i < `layer1_transmit_lane_number; i = i + 1)begin
                 assign axis_outputADI_tvalid[i][j]=axis_outputDAI_tvalid[i][j];
                 assign axis_outputADQ_tvalid[i][j]=axis_outputDAQ_tvalid[i][j];
                 assign axis_outputADI_tlast[i][j] =axis_outputDAI_tlast[i][j]; 
                 assign axis_outputADQ_tlast[i][j] =axis_outputDAQ_tlast[i][j]; 
                 assign axis_outputADI_tdata[i][j] =axis_outputDAI_tdata[i][j]; 
                 assign axis_outputADQ_tdata[i][j] =axis_outputDAQ_tdata[i][j]; 
                 
                 assign axis_outputADI_tvalid_qam256[i][j]=axis_outputDAI_tvalid_qam256[i][j];
                 assign axis_outputADQ_tvalid_qam256[i][j]=axis_outputDAQ_tvalid_qam256[i][j];
                 assign axis_outputADI_tlast_qam256[i][j] =axis_outputDAI_tlast_qam256[i][j]; 
                 assign axis_outputADQ_tlast_qam256[i][j] =axis_outputDAQ_tlast_qam256[i][j]; 
                 assign axis_outputADI_tdata_qam256[i][j] =axis_outputDAI_tdata_qam256[i][j]; 
                 assign axis_outputADQ_tdata_qam256[i][j] =axis_outputDAQ_tdata_qam256[i][j]; 
                 
                 assign axis_outputADI_tvalid_qam1024[i][j]=axis_outputDAI_tvalid_qam1024[i][j];
                 assign axis_outputADQ_tvalid_qam1024[i][j]=axis_outputDAQ_tvalid_qam1024[i][j];
                 assign axis_outputADI_tlast_qam1024[i][j] =axis_outputDAI_tlast_qam1024[i][j]; 
                 assign axis_outputADQ_tlast_qam1024[i][j] =axis_outputDAQ_tlast_qam1024[i][j]; 
                 assign axis_outputADI_tdata_qam1024[i][j] =axis_outputDAI_tdata_qam1024[i][j]; 
                 assign axis_outputADQ_tdata_qam1024[i][j] =axis_outputDAQ_tdata_qam1024[i][j]; 
                 
                 assign axis_outputADI_tvalid_a[i][j]=axis_outputDAI_tvalid_a[i][j];
                 assign axis_outputADQ_tvalid_a[i][j]=axis_outputDAQ_tvalid_a[i][j];
                 assign axis_outputADI_tdata_a[i][j] =axis_outputDAI_tdata_a[i][j]; 
                 assign axis_outputADQ_tdata_a[i][j] =axis_outputDAQ_tdata_a[i][j]; end 
            assign   axis_data_gen_group [j] = axis_tdata_gen[64*(j+1)-1:64*j];
            assign   axis_last_gen_group [j] = axis_tlast_gen;
            assign   axis_user_gen_group [j] = axis_tuser_gen[8*(j+1)-1:8*j];
            assign   axis_keep_gen_group [j] = axis_tkeep_gen[8*(j+1)-1:8*j];
            assign   axis_valid_gen_group[j] = axis_tvalid_gen;
            assign    axis_tdata_che[64*(j+1)-1:64*j] = axis_data_che_group [j] ;
            assign    axis_tlast_che                  = axis_last_che_group [j] ;
            assign    axis_tuser_che[8*(j+1)-1:8*j]   = axis_user_che_group [j] ;
            assign    axis_tkeep_che[8*(j+1)-1:8*j]   = axis_keep_che_group [j] ;
            assign   axis_tvalid_che                  = axis_valid_che_group[j] ;end
        `else   
             for (i = 0; i < `layer1_transmit_lane_number; i = i + 1)begin
                 assign axis_outputADI_tvalid[i]=axis_outputDAI_tvalid[i];
                 assign axis_outputADQ_tvalid[i]=axis_outputDAQ_tvalid[i];
                 assign axis_outputADI_tlast[i] =axis_outputDAI_tlast[i]; 
                 assign axis_outputADQ_tlast[i] =axis_outputDAQ_tlast[i]; 
                 assign axis_outputADI_tdata[i] =axis_outputDAI_tdata[i]; 
                 assign axis_outputADQ_tdata[i] =axis_outputDAQ_tdata[i]; 
                 
                 assign axis_outputADI_tvalid_qam256[i]=axis_outputDAI_tvalid_qam256[i];
                 assign axis_outputADQ_tvalid_qam256[i]=axis_outputDAQ_tvalid_qam256[i];
                 assign axis_outputADI_tlast_qam256[i] =axis_outputDAI_tlast_qam256[i]; 
                 assign axis_outputADQ_tlast_qam256[i] =axis_outputDAQ_tlast_qam256[i]; 
                 assign axis_outputADI_tdata_qam256[i] =axis_outputDAI_tdata_qam256[i]; 
                 assign axis_outputADQ_tdata_qam256[i] =axis_outputDAQ_tdata_qam256[i]; 
                 
                 assign axis_outputADI_tvalid_qam1024[i]=axis_outputDAI_tvalid_qam1024[i];
                 assign axis_outputADQ_tvalid_qam1024[i]=axis_outputDAQ_tvalid_qam1024[i];
                 assign axis_outputADI_tlast_qam1024[i] =axis_outputDAI_tlast_qam1024[i]; 
                 assign axis_outputADQ_tlast_qam1024[i] =axis_outputDAQ_tlast_qam1024[i]; 
                 assign axis_outputADI_tdata_qam1024[i] =axis_outputDAI_tdata_qam1024[i]; 
                 assign axis_outputADQ_tdata_qam1024[i] =axis_outputDAQ_tdata_qam1024[i]; 
                 
                 assign axis_outputADI_tvalid_a[i]=axis_outputDAI_tvalid_a[i];
                 assign axis_outputADQ_tvalid_a[i]=axis_outputDAQ_tvalid_a[i];
                 assign axis_outputADI_tdata_a[i] =axis_outputDAI_tdata_a[i]; 
                 assign axis_outputADQ_tdata_a[i] =axis_outputDAQ_tdata_a[i]; end 
                 
                 assign   axis_data_gen_group [0] = axis_tdata_gen ;
                 assign   axis_last_gen_group [0] = axis_tlast_gen ;
                 assign   axis_user_gen_group [0] = axis_tuser_gen ;
                 assign   axis_keep_gen_group [0] = axis_tkeep_gen ;
                 assign   axis_valid_gen_group[0] = axis_tvalid_gen;
                 assign    axis_tdata_che   = axis_data_che_group [0] ;
                 assign    axis_tlast_che   = axis_last_che_group [0] ;
                 assign    axis_tuser_che   = axis_user_che_group [0] ;
                 assign    axis_tkeep_che   = axis_keep_che_group [0] ;
                 assign   axis_tvalid_che   = axis_valid_che_group[0] ;
        `endif
              
    endgenerate    
      
//      assign   axis_data_gen_group[0] = axis_tdata_gen[63:00];
//      assign   axis_last_gen_group[0] = axis_tlast_gen;
//      assign   axis_user_gen_group[0] = axis_tuser_gen[07:00];
//      assign   axis_keep_gen_group[0] = axis_tkeep_gen[07:00];
//      assign   axis_valid_gen_group[0]= axis_tvalid_gen;
//      assign    axis_tdata_che[63:00] = axis_data_che_group[0] ;
//      assign    axis_tlast_che        = axis_last_che_group[0] ;
//      assign    axis_tuser_che[07:00] = axis_user_che_group[0] ;
//      assign    axis_tkeep_che[07:00] = axis_keep_che_group[0] ;
//      assign   axis_tvalid_che        = axis_valid_che_group[0] ;
      
//      assign   axis_data_gen_group[1] =axis_tdata_gen[127:64];
//      assign   axis_last_gen_group[1] =axis_tlast_gen;
//      assign   axis_user_gen_group[1] =axis_tuser_gen[15:08];
//      assign   axis_keep_gen_group[1] =axis_tkeep_gen[15:08];
//      assign   axis_valid_gen_group[1]=axis_tvalid_gen;
//      assign    axis_tdata_che[127:64]= axis_data_che_group[1] ;
//      assign    axis_tlast_che        = axis_last_che_group[1] ;
//      assign    axis_tuser_che[07:00] = axis_user_che_group[1] ;
//      assign    axis_tkeep_che[07:00] = axis_keep_che_group[1] ;
//      assign   axis_tvalid_che        = axis_valid_che_group[1] ;
      
//      assign   axis_data_gen_group[2] =axis_tdata_gen[191:128];
//      assign   axis_last_gen_group[2] =axis_tlast_gen;
//      assign   axis_user_gen_group[2] =axis_tuser_gen[23:16];
//      assign   axis_keep_gen_group[2] =axis_tkeep_gen[23:16];
//      assign   axis_valid_gen_group[2]=axis_tvalid_gen;
//      assign    axis_tdata_che[191:128]= axis_data_che_group[2] ;
//      assign    axis_tlast_che         = axis_last_che_group[2] ;
//      assign    axis_tuser_che[07:00]  = axis_user_che_group[2] ;
//      assign    axis_tkeep_che[07:00]  = axis_keep_che_group[2] ;
//      assign   axis_tvalid_che         = axis_valid_che_group[2] ;
      
//      assign   axis_data_gen_group[3] =axis_tdata_gen[255:192];
//      assign   axis_last_gen_group[3] =axis_tlast_gen;
//      assign   axis_user_gen_group[3] =axis_tuser_gen[31:24];
//      assign   axis_keep_gen_group[3] =axis_tkeep_gen[31:24];
//      assign   axis_valid_gen_group[3]=axis_tvalid_gen;
//      assign    axis_tdata_che[255:192]= axis_data_che_group[3] ;
//      assign    axis_tlast_che         = axis_last_che_group[3] ;
//      assign    axis_tuser_che[07:00]  = axis_user_che_group[3] ;
//      assign    axis_tkeep_che[07:00]  = axis_keep_che_group[3] ;
//      assign   axis_tvalid_che         = axis_valid_che_group[3] ;

bbp_mmc bbp_clock_gruop1(
      // Clock out ports
  .clk_out1(clk_250m),
  .clk_out2(clk_500m),
 // Clock in ports
  .clk_in1_p(CLK_125MHZ_P),
  .clk_in1_n(CLK_125MHZ_N));

genvar k;
generate
    for (k = 0; k < `groups; k = k + 1)begin:bbp_transmit_group
        bbp_transmit bbp_transmit(
            .clk_250m(clk_250m),
            .clk_500m(clk_500m),
            
            .refclk_p(refclk_p),
            .refclk_n(refclk_n),
            .reset(reset),
            
            //Pcie SYS Inteface
            .sys_clk_n(sys_clk_n),
            .sys_clk_p(sys_clk_p),
            .sys_rst_n(sys_rst_n),
            `ifdef optiacal_10g
            //10g optiacal interface
                .xphy_txp(xphy_txp),
                .xphy_txn(xphy_txn),
                .xphy_rxp(xphy_rxp),
                .xphy_rxn(xphy_rxn),
            `endif
            
            `ifdef pcie_endpoint
            // PCI-Express Serial Interface
                .pci_exp_txn(pci_exp_t_txn),
                .pci_exp_txp(pci_exp_t_txp),
                .pci_exp_rxn(pci_exp_t_rxn),
                .pci_exp_rxp(pci_exp_t_rxp),
            `else
                .axis_tdata_gen ( axis_data_gen_group  [k]),
                .axis_tlast_gen ( axis_last_gen_group  [k]),
                .axis_tuser_gen ( axis_user_gen_group  [k]),
                .axis_tkeep_gen ( axis_keep_gen_group  [k]),
                .axis_tvalid_gen( axis_valid_gen_group [k]),
            `endif
            `ifdef ethernet80
                .m_axis_outputDAI_tvalid(axis_outputDAI_tvalid[k]),  
                .m_axis_outputDAQ_tvalid(axis_outputDAQ_tvalid[k]),
                .m_axis_outputDAI_tlast (axis_outputDAI_tlast [k]),
                .m_axis_outputDAQ_tlast (axis_outputDAQ_tlast [k]),     
                .m_axis_outputDAI_tdata (axis_outputDAI_tdata [k]),
                .m_axis_outputDAQ_tdata (axis_outputDAQ_tdata [k]),
                
                .m_axis_outputDAI_tvalid_qam256(axis_outputDAI_tvalid_qam256[k]),
                .m_axis_outputDAI_tdata_qam256 (axis_outputDAI_tdata_qam256 [k]),
                .m_axis_outputDAI_tlast_qam256 (axis_outputDAI_tlast_qam256 [k]),
                .m_axis_outputDAQ_tvalid_qam256(axis_outputDAQ_tvalid_qam256[k]),
                .m_axis_outputDAQ_tdata_qam256 (axis_outputDAQ_tdata_qam256 [k]),
                .m_axis_outputDAQ_tlast_qam256 (axis_outputDAQ_tlast_qam256 [k]),
                
                .m_axis_outputDAI_tvalid_qam1024(axis_outputDAI_tvalid_qam1024[k]),
                .m_axis_outputDAI_tdata_qam1024 (axis_outputDAI_tdata_qam1024 [k]),
                .m_axis_outputDAI_tlast_qam1024 (axis_outputDAI_tlast_qam1024 [k]),
                .m_axis_outputDAQ_tvalid_qam1024(axis_outputDAQ_tvalid_qam1024[k]),
                .m_axis_outputDAQ_tdata_qam1024 (axis_outputDAQ_tdata_qam1024 [k]),
                .m_axis_outputDAQ_tlast_qam1024 (axis_outputDAQ_tlast_qam1024 [k]),
                
                .m_axis_outputDAI_tvalid_a(axis_outputDAI_tvalid_a [k]),  
                .m_axis_outputDAQ_tvalid_a(axis_outputDAQ_tvalid_a [k]),
                //.m_axis_outputDAI_tlast_a (m_axis_outputDAI_tlast_a[k]),
                //.m_axis_outputDAQ_tlast_a (m_axis_outputDAQ_tlast_a[k]),     
                .m_axis_outputDAI_tdata_a (axis_outputDAI_tdata_a  [k]),
                .m_axis_outputDAQ_tdata_a (axis_outputDAQ_tdata_a  [k]));
            `else
                .m_axis_outputDAI_tvalid(axis_outputDAI_tvalid),  
                .m_axis_outputDAQ_tvalid(axis_outputDAQ_tvalid),
                .m_axis_outputDAI_tlast (axis_outputDAI_tlast ),
                .m_axis_outputDAQ_tlast (axis_outputDAQ_tlast ),     
                .m_axis_outputDAI_tdata (axis_outputDAI_tdata ),
                .m_axis_outputDAQ_tdata (axis_outputDAQ_tdata ),
                
                .m_axis_outputDAI_tvalid_qam256(axis_outputDAI_tvalid_qam256),
                .m_axis_outputDAI_tdata_qam256 (axis_outputDAI_tdata_qam256 ),
                .m_axis_outputDAI_tlast_qam256 (axis_outputDAI_tlast_qam256 ),
                .m_axis_outputDAQ_tvalid_qam256(axis_outputDAQ_tvalid_qam256),
                .m_axis_outputDAQ_tdata_qam256 (axis_outputDAQ_tdata_qam256 ),
                .m_axis_outputDAQ_tlast_qam256 (axis_outputDAQ_tlast_qam256 ),
                
                .m_axis_outputDAI_tvalid_qam1024(axis_outputDAI_tvalid_qam1024),
                .m_axis_outputDAI_tdata_qam1024 (axis_outputDAI_tdata_qam1024 ),
                .m_axis_outputDAI_tlast_qam1024 (axis_outputDAI_tlast_qam1024 ),
                .m_axis_outputDAQ_tvalid_qam1024(axis_outputDAQ_tvalid_qam1024),
                .m_axis_outputDAQ_tdata_qam1024 (axis_outputDAQ_tdata_qam1024 ),
                .m_axis_outputDAQ_tlast_qam1024 (axis_outputDAQ_tlast_qam1024 ),
                
                .m_axis_outputDAI_tvalid_a(axis_outputDAI_tvalid_a ),  
                .m_axis_outputDAQ_tvalid_a(axis_outputDAQ_tvalid_a ),
                //.m_axis_outputDAI_tlast_a (m_axis_outputDAI_tlast_a),
                //.m_axis_outputDAQ_tlast_a (m_axis_outputDAQ_tlast_a),     
                .m_axis_outputDAI_tdata_a (axis_outputDAI_tdata_a  ),
                .m_axis_outputDAQ_tdata_a (axis_outputDAQ_tdata_a  ));
            `endif
            // DA interface
           
    end
endgenerate 
    
//genvar i;
//generate
//    for (i = 0; i < 8; i = i + 1)begin: ila_apsk
    
//    ila_apsk ila_apsk1_8(
//        .clk(refclk_p),
        
//        .probe0(m_axis_outputDAI_tvalid_a[8]),
//        .probe1(m_axis_outputDAI_tdata_a[8]),
//        .probe2(m_axis_outputDAQ_tvalid_a[8]),
//        .probe3(m_axis_outputDAQ_tdata_a[8]));

//end
//endgenerate
    
genvar l;
generate
    for (l = 0; l < `groups; l = l + 1)begin:bbp_receive_group
        bbp_receive bbp_receive(
        
            .clk_250m(clk_250m),
            .clk_500m(clk_500m),
            
            .refclk_p(refclk_p),
            .refclk_n(refclk_n),
            .reset(reset),
            
            // SYS Inteface
            .sys_clk_n(sys_clk_n),
            .sys_clk_p(sys_clk_p),
            .sys_rst_n(sys_rst_n),
            
            `ifdef optiacal_10g
            .xphy_txp(xphy_txp),
            .xphy_txn(xphy_txn),
            .xphy_rxp(xphy_rxp),
            .xphy_rxn(xphy_rxn),
            `endif
            
            `ifdef pcie_endpoint
            // PCI-Express Serial Interface
            .pci_exp_txn(pci_exp_r_txn),
            .pci_exp_txp(pci_exp_r_txp),
            .pci_exp_rxn(pci_exp_r_rxn),
            .pci_exp_rxp(pci_exp_r_rxp),
            
            `else
                .axis_tdata_che ( axis_data_che_group [l] ),//the bus for data checker
                .axis_tlast_che ( axis_last_che_group [l] ),
                .axis_tuser_che ( axis_user_che_group [l] ),
                .axis_tkeep_che ( axis_keep_che_group [l] ),
                .axis_tvalid_che( axis_valid_che_group[l] ),
            `endif
            
             `ifdef ethernet80
                .s_axis_outputADI_tvalid(axis_outputADI_tvalid[l]),  
                .s_axis_outputADQ_tvalid(axis_outputADQ_tvalid[l]),
                .s_axis_outputADI_tlast (axis_outputADI_tlast [l] ),
                .s_axis_outputADQ_tlast (axis_outputADQ_tlast [l] ),     
                .s_axis_outputADI_tdata (axis_outputADI_tdata [l] ),
                .s_axis_outputADQ_tdata (axis_outputADQ_tdata [l] ),
                
                .s_axis_outputADI_tvalid_qam256(axis_outputADI_tvalid_qam256[l]),  
                .s_axis_outputADQ_tvalid_qam256(axis_outputADQ_tvalid_qam256[l]),
                .s_axis_outputADI_tlast_qam256(axis_outputADI_tlast_qam256  [l]),
                .s_axis_outputADQ_tlast_qam256(axis_outputADQ_tlast_qam256  [l]),     
                .s_axis_outputADI_tdata_qam256(axis_outputADI_tdata_qam256  [l]),
                .s_axis_outputADQ_tdata_qam256(axis_outputADQ_tdata_qam256  [l]),
                
                .s_axis_outputADI_tvalid_qam1024(axis_outputADI_tvalid_qam1024[l]),  
                .s_axis_outputADQ_tvalid_qam1024(axis_outputADQ_tvalid_qam1024[l]),
                .s_axis_outputADI_tlast_qam1024(axis_outputADI_tlast_qam1024  [l]),
                .s_axis_outputADQ_tlast_qam1024(axis_outputADQ_tlast_qam1024  [l]),     
                .s_axis_outputADI_tdata_qam1024(axis_outputADI_tdata_qam1024  [l]),
                .s_axis_outputADQ_tdata_qam1024(axis_outputADQ_tdata_qam1024  [l]),
            
                .s_axis_outputADI_tvalid_a(axis_outputADI_tvalid_a[l]),  
                .s_axis_outputADQ_tvalid_a(axis_outputADQ_tvalid_a[l]),
            //    .s_axis_outputADI_tlast_a (s_axis_outputADI_tlast_a[l] ),
            //    .s_axis_outputADQ_tlast_a (s_axis_outputADQ_tlast_a[l] ),     
                .s_axis_outputADI_tdata_a (axis_outputADI_tdata_a[l] ),
                .s_axis_outputADQ_tdata_a (axis_outputADQ_tdata_a[l] ));
            `else
                .s_axis_outputADI_tvalid(axis_outputADI_tvalid),  
                .s_axis_outputADQ_tvalid(axis_outputADQ_tvalid),
                .s_axis_outputADI_tlast (axis_outputADI_tlast ),
                .s_axis_outputADQ_tlast (axis_outputADQ_tlast ),     
                .s_axis_outputADI_tdata (axis_outputADI_tdata ),
                .s_axis_outputADQ_tdata (axis_outputADQ_tdata ),
                
                .s_axis_outputADI_tvalid_qam256(axis_outputADI_tvalid_qam256),  
                .s_axis_outputADQ_tvalid_qam256(axis_outputADQ_tvalid_qam256),
                .s_axis_outputADI_tlast_qam256(axis_outputADI_tlast_qam256  ),
                .s_axis_outputADQ_tlast_qam256(axis_outputADQ_tlast_qam256  ),     
                .s_axis_outputADI_tdata_qam256(axis_outputADI_tdata_qam256  ),
                .s_axis_outputADQ_tdata_qam256(axis_outputADQ_tdata_qam256  ),
                
                .s_axis_outputADI_tvalid_qam1024(axis_outputADI_tvalid_qam1024),  
                .s_axis_outputADQ_tvalid_qam1024(axis_outputADQ_tvalid_qam1024),
                .s_axis_outputADI_tlast_qam1024(axis_outputADI_tlast_qam1024  ),
                .s_axis_outputADQ_tlast_qam1024(axis_outputADQ_tlast_qam1024  ),     
                .s_axis_outputADI_tdata_qam1024(axis_outputADI_tdata_qam1024  ),
                .s_axis_outputADQ_tdata_qam1024(axis_outputADQ_tdata_qam1024  ),
            
                .s_axis_outputADI_tvalid_a(axis_outputADI_tvalid_a),  
                .s_axis_outputADQ_tvalid_a(axis_outputADQ_tvalid_a),
            //    .s_axis_outputADI_tlast_a (s_axis_outputADI_tlast_a ),
            //    .s_axis_outputADQ_tlast_a (s_axis_outputADQ_tlast_a ),     
                .s_axis_outputADI_tdata_a (axis_outputADI_tdata_a ),
                .s_axis_outputADQ_tdata_a (axis_outputADQ_tdata_a ));
            `endif
           
    end
endgenerate 
    
endmodule
