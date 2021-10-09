`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd
// Engineer: caohuiyang
// 
// Create Date: 09/27/2021 01:57:59 AM
// Design Name: 
// Module Name: balance
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// include scrambler/interleaver 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module energy_balance(
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
    
logic [7:0]interleaver_data;
logic interleaver_data_tvalid;
logic interleaver_data_tlast;
logic scrambler_tready;

interleaver interleaver(
    .clk(clk),
    .reset(reset),

    .s_axis_input_tvalid(s_axis_input_tvalid),
    .s_axis_input_tready(s_axis_input_tready),
    .s_axis_input_tdata(s_axis_input_tdata),
    .s_axis_input_tlast(s_axis_input_tlast),

    .m_axis_output_tvalid(interleaver_data_tvalid),
    .m_axis_output_tready(scrambler_tready),
    .m_axis_output_tdata(interleaver_data),
    .m_axis_output_tlast(interleaver_data_tlast)
    );

scrambler scrambler(
    .clk(clk),
    .reset(reset),
    
    .s_axis_input_tvalid(interleaver_data_tvalid),
    .s_axis_input_tready(scrambler_tready),
    .s_axis_input_tdata(interleaver_data),
    .s_axis_input_tlast(interleaver_data_tlast),
    
    .m_axis_output_tvalid(m_axis_output_tvalid),
    .m_axis_output_tready(m_axis_output_tready),
    .m_axis_output_tdata(m_axis_output_tdata),
    .m_axis_output_tlast(m_axis_output_tlast));  

endmodule
