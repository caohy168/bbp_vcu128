`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd_thz
// Engineer: caohy
// 
// Create Date: 2020/03/10 12:38:15
// Design Name: Telecommunications processing unit
// Module Name: tpu
// Project Name: BFB(base frequency band) research group
// Target Devices: xcvu9p
// Tool Versions: vivado 2020.2
// Description: 
// 
// Dependencies: 
// base on matlab simulation
// Revision:V1.0
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ps / 1ps

module axi_stream_gen_mon_0 #(
    parameter        AXIS_TDATA_WIDTH    =  64,
    parameter [47:0] XIL_MAC_ID_THIS     =  48'h111100000000, // 00:00:00:00:11:11
    parameter [47:0] XIL_MAC_ID_OTHER    =  48'h222200000000, // 00:00:00:00:22:22
    parameter [47:0] EXT_MAC_ID          =  48'h333300000000, // 00:00:00:00:33:33
    parameter        S_AXI_ADDR_WIDTH    =  32,
    parameter        S_AXI_DATA_WIDTH    =  32,
    parameter [15:0] S_AXI_MIN_SIZE      =  16'hFFFF,
    parameter [31:0] S_AXI_BASE_ADDRESS  =  32'h44A0_0000,
    // Design information
    // 0105 - Targeting KCU105 board
    // 141  - Viavdo 2014.1 
    // 1    - Ethernet Reference Design 1
    parameter [31:0] DESIGN_VERSION      =  32'h0105_1431,
    // one second timer in terms of 156.25 MHz clock
    parameter ONE_SEC_CLOCK_COUNT =  32'h9502F90,
    
    localparam          AXIS_TKEEP_WIDTH    =  AXIS_TDATA_WIDTH/8,
    localparam [31:0]   S_AXI_HIGH_ADDRESS  =  S_AXI_BASE_ADDRESS + S_AXI_MIN_SIZE
    )
(  
    input [AXIS_TDATA_WIDTH-1:0]      rx_axis_tdata,
    input [(AXIS_TDATA_WIDTH/8)-1:0]  rx_axis_tkeep,
    input                             rx_axis_tvalid,
    input                             rx_axis_tlast,
    input                             rx_axis_tuser,
    output                            rx_axis_tready,
    
    input                             s_axi_clk,
    input                             axis_reset_n,
    input  [47:0]                     tg_config,
    input                             s_axi_areset_n,
    //Other status signals
    input                             axis_clk,  
    input  [7:0]                      phy_status,    
    // AXI Stream Interface
    // Connects to the Ethernet MAC
    output [AXIS_TDATA_WIDTH-1:0]     tx_axis_tdata,
    output [(AXIS_TDATA_WIDTH/8)-1:0] tx_axis_tkeep,
    output                            tx_axis_tvalid,
    output                            tx_axis_tlast,
    output                            tx_axis_tuser,
    input                             tx_axis_tready,
    
    (* DONT_TOUCH = "true" *)    input                         bb_rx_axis_aclk,
    (* DONT_TOUCH = "true" *)    output [AXIS_TDATA_WIDTH-1:0] bb_rx_axis_tdata,
    (* DONT_TOUCH = "true" *)    output [AXIS_TKEEP_WIDTH-1:0] bb_rx_axis_tkeep,
    (* DONT_TOUCH = "true" *)    output                        bb_rx_axis_tvalid,
    (* DONT_TOUCH = "true" *)    output                        bb_rx_axis_tlast,
    (* DONT_TOUCH = "true" *)    output                        bb_rx_axis_tuser,
    (* DONT_TOUCH = "true" *)    input                         bb_rx_axis_tready
);
    
//    localparam          AXIS_TKEEP_WIDTH    =  AXIS_TDATA_WIDTH/8;   
//    localparam [31:0]   S_AXI_HIGH_ADDRESS  =  S_AXI_BASE_ADDRESS + S_AXI_MIN_SIZE;
    
    wire  [AXIS_TDATA_WIDTH-1:0]     tx_axis_tdata_g;
    wire  [AXIS_TKEEP_WIDTH-1:0]     tx_axis_tkeep_g;
    wire                             tx_axis_tvalid_g;
    wire                             tx_axis_tlast_g;
    wire                             tx_axis_tuser_g;

    wire  [AXIS_TDATA_WIDTH-1:0]     tx_axis_tdata_lb;
    wire  [AXIS_TKEEP_WIDTH-1:0]     tx_axis_tkeep_lb;
    wire                             tx_axis_tvalid_lb;
    wire                             tx_axis_tlast_lb;
    wire                             tx_axis_tuser_lb;

    wire                             rx_axis_tready_lb;

    wire                             enable_loopback;
    wire                             enable_gen;
    wire  [15:0]                     data_payload;
    wire  [15:0]                     packet_count;
    wire  [31:0]                     tx_byte_count;
    wire  [31:0]                     rx_byte_count;
    wire  [31:0]                     tx_pkt_count;
    wire  [31:0]                     rx_pkt_count;
    wire                             lb_dropped_packet;
    wire                             enable_loopback_sync;
    wire                             enable_gen_sync;
    wire  [15:0]                     data_payload_sync;
    wire  [15:0]                     packet_count_sync;
    wire  [31:0]                     tx_byte_count_sync;
    wire  [31:0]                     rx_byte_count_sync;
    wire  [31:0]                     tx_pkt_count_sync;
    wire  [31:0]                     rx_pkt_count_sync;
    wire                             lb_dropped_pkt_sync;
    wire  [7:0]                      phy_status_sync;
 //`ifdef OOB_SIM  
    wire                             enable_loopback_sim;
    wire                             enable_gen_sim;
    wire  [15:0]                     data_payload_sim;
    wire  [15:0]                     packet_count_sim;
 //`endif
    
 
 // If running a simulation drive the traffic configuration
 // via the tg_config input signal else drive it via the
 // user_registers_slave block.
 // This is done to speed up simulation, simulating the microblaze
 // subsystem (with the UART) which drives the S_AXI interface
 // will take very long.
 //`ifdef OOB_SIM  
    assign  enable_loopback_sim = tg_config[0];
    assign  enable_gen_sim      = tg_config[1];
    assign  data_payload_sim    = tg_config[31:16];
    assign  packet_count_sim    = tg_config[47:32];
 //`endif

  (* DONT_TOUCH = "true" *)   
  axi_stream_interface axi_stream_interface (
    . reset         (!axis_reset_n),   
    . tx_axis_clk   (axis_clk),
                    
    . tx_axis_tdata (tx_axis_tdata),
    . tx_axis_tkeep (tx_axis_tkeep),
    . tx_axis_tvalid(tx_axis_tvalid),
    . tx_axis_tlast (tx_axis_tlast),
    . tx_axis_tuser (tx_axis_tuser),
    . tx_axis_tready(tx_axis_tready),
                    
    . rx_axis_tdata (rx_axis_tdata),
    . rx_axis_tkeep (rx_axis_tkeep),
    . rx_axis_tvalid(rx_axis_tvalid),
    . rx_axis_tlast (rx_axis_tlast),
    . rx_axis_tuser (rx_axis_tuser),
    . rx_axis_tready(rx_axis_tready),
    
    .bb_rx_axis_aclk  (bb_rx_axis_aclk),
    .bb_rx_axis_tdata (bb_rx_axis_tdata),
    .bb_rx_axis_tkeep (bb_rx_axis_tkeep),
    .bb_rx_axis_tvalid(bb_rx_axis_tvalid),
    .bb_rx_axis_tlast (bb_rx_axis_tlast),
    .bb_rx_axis_tuser (bb_rx_axis_tuser),
    .bb_rx_axis_tready(bb_rx_axis_tready),
    //the data generate from axi_stream_gen
    .bb_tx_axis_tdata (tx_axis_tdata_g ),
    .bb_tx_axis_tkeep (tx_axis_tkeep_g ),
    .bb_tx_axis_tvalid(tx_axis_tvalid_g),
    .bb_tx_axis_tlast (tx_axis_tlast_g ),
    .bb_tx_axis_tuser (tx_axis_tuser_g ),
    .bb_tx_axis_tready(tx_axis_tready_g)
    );

  axi_stream_gen # (
    .AXIS_TDATA_WIDTH     (AXIS_TDATA_WIDTH       ),
    .AXIS_TKEEP_WIDTH     (AXIS_TKEEP_WIDTH       ),
    .XIL_MAC_ID_THIS      (XIL_MAC_ID_THIS        ),
    .XIL_MAC_ID_OTHER     (XIL_MAC_ID_OTHER       )
  )  
  axi_stream_gen_i (

     .reset               (!axis_reset_n          ),
     .tx_axis_clk         (axis_clk               ),
     .tx_axis_tdata       (tx_axis_tdata_g        ),
     .tx_axis_tkeep       (tx_axis_tkeep_g        ),
     .tx_axis_tvalid      (tx_axis_tvalid_g       ),
     .tx_axis_tlast       (tx_axis_tlast_g        ),
     .tx_axis_tuser       (tx_axis_tuser_g        ),
     .tx_axis_tready      (tx_axis_tready_g       ),
//   `ifdef OOB_SIM  
     .enable_gen          (enable_gen_sim         ),
     .data_payload        (data_payload_sim       ),
     .packet_count        (packet_count_sim       ),
     .phy_status          (phy_status)
//     .packet_count        (20       )
//   `else 
//    .enable_gen          (enable_gen_sync        ),
//    .data_payload        (data_payload_sync      ),
//     .packet_count        (packet_count_sync      )
//   `endif

  );


endmodule

