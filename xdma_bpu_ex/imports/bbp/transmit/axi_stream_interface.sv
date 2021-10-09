`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: thgd_thz
// Engineer: caohy
// 
// Create Date: 2019/11/19 18:44:12
// Design Name: 
// Module Name: axi_stream_interface
// Project Name: 
// Target Devices: 
// Tool Versions: vivado 2019.02
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

(* DONT_TOUCH = "true|yes" *) 
module axi_stream_interface #(
    parameter AXIS_TDATA_WIDTH =  64,
    parameter AXIS_TKEEP_WIDTH =  AXIS_TDATA_WIDTH/8
)
(
    input                         reset,   
    input                         tx_axis_clk,

(* DONT_TOUCH = "true" *)    output [AXIS_TDATA_WIDTH-1:0] tx_axis_tdata,
(* DONT_TOUCH = "true" *)    output [AXIS_TKEEP_WIDTH-1:0] tx_axis_tkeep,
(* DONT_TOUCH = "true" *)    output                        tx_axis_tvalid,
(* DONT_TOUCH = "true" *)    output                        tx_axis_tlast,
(* DONT_TOUCH = "true" *)    output                        tx_axis_tuser,
(* DONT_TOUCH = "true" *)    input                         tx_axis_tready,
  
(* DONT_TOUCH = "true" *)    input  [AXIS_TDATA_WIDTH-1:0] rx_axis_tdata,
(* DONT_TOUCH = "true" *)    input  [AXIS_TKEEP_WIDTH-1:0] rx_axis_tkeep,
(* DONT_TOUCH = "true" *)    input                         rx_axis_tvalid,
(* DONT_TOUCH = "true" *)    input                         rx_axis_tlast,
(* DONT_TOUCH = "true" *)    input                         rx_axis_tuser,
(* DONT_TOUCH = "true" *)    output                        rx_axis_tready,
//bb_rx the data receive from 10g MAC to baseband process 
(* DONT_TOUCH = "true" *)    input                         bb_rx_axis_aclk,    
(* DONT_TOUCH = "true" *)    output [AXIS_TDATA_WIDTH-1:0] bb_rx_axis_tdata,
(* DONT_TOUCH = "true" *)    output [AXIS_TKEEP_WIDTH-1:0] bb_rx_axis_tkeep,
(* DONT_TOUCH = "true" *)    output                        bb_rx_axis_tvalid,
(* DONT_TOUCH = "true" *)    output                        bb_rx_axis_tlast,
(* DONT_TOUCH = "true" *)    output                        bb_rx_axis_tuser,
(* DONT_TOUCH = "true" *)    input                         bb_rx_axis_tready,
//bb_tx the data receive from intergen send to 10g MAC 
(* DONT_TOUCH = "true" *)    input [AXIS_TDATA_WIDTH-1:0]  bb_tx_axis_tdata,
(* DONT_TOUCH = "true" *)    input [AXIS_TKEEP_WIDTH-1:0]  bb_tx_axis_tkeep,
(* DONT_TOUCH = "true" *)    input                         bb_tx_axis_tvalid,
(* DONT_TOUCH = "true" *)    input                         bb_tx_axis_tlast,
(* DONT_TOUCH = "true" *)    input                         bb_tx_axis_tuser,
(* DONT_TOUCH = "true" *)    output wire                   bb_tx_axis_tready
    );
//  assign bb_tx_axis_tready=tx_axis_tready;

  (* DONT_TOUCH = "true" *)    
  bb_interface_fifo bb_interface_fifo_rx(
  .s_axis_aresetn        (!reset              ),   //input 
  .s_axis_aclk           (tx_axis_clk         ),   //input 
  .s_axis_tready         (rx_axis_tready      ),   //output
  .s_axis_tvalid         (rx_axis_tvalid      ),   //input 
  .s_axis_tdata          (rx_axis_tdata       ),   //input 
  .s_axis_tkeep          (rx_axis_tkeep       ),   //input 
  .s_axis_tuser          (rx_axis_tuser       ),   //input 
  .s_axis_tlast          (rx_axis_tlast       ),   //input 
  
  .m_axis_aclk           (bb_rx_axis_aclk),
  .m_axis_tready         (bb_rx_axis_tready   ),   //input 
  .m_axis_tvalid         (bb_rx_axis_tvalid   ),   //output
  .m_axis_tdata          (bb_rx_axis_tdata    ),   //output
  .m_axis_tkeep          (bb_rx_axis_tkeep    ),   //output
  .m_axis_tuser          (bb_rx_axis_tuser    ),   //output
  .m_axis_tlast          (bb_rx_axis_tlast    )
  );
 (* DONT_TOUCH = "true" *) 
  bb_interface_fifo bb_interface_fifo_tx(
  .s_axis_aresetn        (!reset              ),   //input 
  .s_axis_aclk           (tx_axis_clk         ),   //input 
  .s_axis_tready         (bb_tx_axis_tready   ),   //output
  .s_axis_tvalid         (bb_tx_axis_tvalid   ),   //input 
  .s_axis_tdata          (bb_tx_axis_tdata    ),   //input 
  .s_axis_tkeep          (bb_tx_axis_tkeep    ),   //input 
  .s_axis_tuser          (bb_tx_axis_tuser    ),   //input 
  .s_axis_tlast          (bb_tx_axis_tlast    ),   //input 
  
  .m_axis_aclk           (tx_axis_clk),
  .m_axis_tready         (tx_axis_tready   ),   //input 
  .m_axis_tvalid         (tx_axis_tvalid   ),   //output
  .m_axis_tdata          (tx_axis_tdata    ),   //output
  .m_axis_tkeep          (tx_axis_tkeep    ),   //output
  .m_axis_tuser          (tx_axis_tuser    ),   //output
  .m_axis_tlast          (tx_axis_tlast    )
  );  
  
  
endmodule
