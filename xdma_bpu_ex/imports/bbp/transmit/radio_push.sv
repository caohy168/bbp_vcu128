`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd_thz
// Engineer: caohy
// 
// Create Date: 2020/03/09 12:53:07
// Design Name: 
// Module Name: Radio
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
module radio_push(
    input clk_250m,clk_500m,
    input reset,
    
    input  s_axis_inputI_tvalid_8[8],
    output logic s_axis_inputI_tready_8[8],
    input  [7:0]s_axis_inputI_tdata_8[8],
    input  s_axis_inputI_tlast_8[8],
    input  s_axis_inputQ_tvalid_8[8],
    output logic s_axis_inputQ_tready_8[8],
    input  [7:0]s_axis_inputQ_tdata_8[8],
    input  s_axis_inputQ_tlast_8[8],
    
    output  m_axis_outputDAI_tvalid[8],   
    output  m_axis_outputDAQ_tvalid[8],
    output  m_axis_outputDAI_tlast[8],
    output  m_axis_outputDAQ_tlast[8],     
    output [15:0]m_axis_outputDAI_tdata[8],
    output [15:0]m_axis_outputDAQ_tdata[8]
    
    );

    logic m_axis_outputDAI_tready[8]={1,1,1,1,1,1,1,1};
    logic m_axis_outputDAQ_tready[8]={1,1,1,1,1,1,1,1};
   

radio_transmit radio_transmit(
    .clk_250m(clk_250m),
    .clk_500m(clk_500m),
    .reset(reset),
    
    .s_axis_inputI_tvalid(s_axis_inputI_tvalid_8),
    .s_axis_inputI_tready(s_axis_inputI_tready_8),
    .s_axis_inputI_tdata(s_axis_inputI_tdata_8),
    .s_axis_inputI_tlast(s_axis_inputI_tlast_8),
    .s_axis_inputQ_tvalid(s_axis_inputQ_tvalid_8),
    .s_axis_inputQ_tready(s_axis_inputQ_tready_8),
    .s_axis_inputQ_tdata(s_axis_inputQ_tdata_8),
    .s_axis_inputQ_tlast(s_axis_inputQ_tlast_8),
    
    .m_axis_outputI_tready(m_axis_outputDAI_tready),
    .m_axis_outputQ_tready(m_axis_outputDAQ_tready),
    .m_axis_outputI_tvalid(m_axis_outputDAI_tvalid),
    .m_axis_outputQ_tvalid(m_axis_outputDAQ_tvalid),
    .m_axis_outputI_tlast(m_axis_outputDAI_tlast),
    .m_axis_outputQ_tlast(m_axis_outputDAQ_tlast),
    .m_axis_outputI_tdata(m_axis_outputDAI_tdata),
    .m_axis_outputQ_tdata(m_axis_outputDAQ_tdata)
    );
    
        
endmodule
