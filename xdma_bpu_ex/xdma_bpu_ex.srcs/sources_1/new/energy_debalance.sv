`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd
// Engineer:caohuiyang 
// 
// Create Date: 09/27/2021 02:24:33 AM
// Design Name: 
// Module Name: debalance
// Project Name: 
// Target Devices: 
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
module energy_debalance(
input clk,reset,

input s_axis_input_tvalid,
output logic s_axis_input_tready,
input [7:0]s_axis_input_tdata,
input s_axis_input_tlast,

output logic m_axis_output_tvalid,
input  m_axis_output_tready,
output logic [7:0]m_axis_output_tdata,
output logic m_axis_output_tlast
    );

logic [7:0]descrambler_data;
logic descrambler_data_tvalid;
logic descrambler_data_tlast;
logic deintrlv_tready;
    
descrambler descrambler(
    .clk(clk),
    .reset(reset),
    .s_axis_input_tready(s_axis_input_tready),
    `ifdef qam
        .s_axis_input_tvalid(s_axis_input_tvalid),
        .s_axis_input_tdata(s_axis_input_tdata),
        .s_axis_input_tlast(s_axis_input_tlast),
    `else //just simple express apsk define
        .s_axis_input_tvalid(apsk_data_tvalid[i]),
        .s_axis_input_tdata(apsk_data[i]),
    `endif
    
    .m_axis_output_tvalid(descrambler_data_tvalid),
    .m_axis_output_tready(deintrlv_tready),
    .m_axis_output_tdata (descrambler_data),
    .m_axis_output_tlast (descrambler_data_tlast));

deintrlv deintrlv(
    .clk(clk),
    .reset(reset),
    
    .s_axis_input_tvalid(descrambler_data_tvalid),
    .s_axis_input_tready(deintrlv_tready),
    .s_axis_input_tdata (descrambler_data),
    .s_axis_input_tlast (descrambler_data_tlast),
    
    .m_axis_output_tvalid(m_axis_output_tvalid),
    .m_axis_output_tready(m_axis_output_tready),
    .m_axis_output_tdata (m_axis_output_tdata),
    .m_axis_output_tlast (m_axis_output_tlast));
    
endmodule
