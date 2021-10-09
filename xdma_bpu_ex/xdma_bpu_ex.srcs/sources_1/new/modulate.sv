`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd
// Engineer: caohuiyang
// QQ:2685997598
// Create Date: 09/25/2021 06:41:13 PM
// Design Name: 
// Module Name: modulate
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
module modulate(
input clk,reset,

input s_axis_input_tvalid,
output logic s_axis_input_tready,
input [7:0]s_axis_input_tdata,
input s_axis_input_tlast,

output logic m_axis_outputI_tvalid,
input  m_axis_outputI_tready,
output logic [7:0]m_axis_outputI_tdata,
output logic m_axis_outputI_tlast,
output logic m_axis_outputQ_tvalid,
input  m_axis_outputQ_tready,
output logic [7:0]m_axis_outputQ_tdata,
output logic m_axis_outputQ_tlast);

logic m_axis_outputI_tvalid;
logic m_axis_outputI_tready;
logic [15:0]m_axis_outputI_tdata;
logic m_axis_outputI_tlast;
logic m_axis_outputQ_tvalid;
logic m_axis_outputQ_tready;
logic [15:0]m_axis_outputQ_tdata;
logic m_axis_outputQ_tlast;

logic m_axis_outputI_tvalid_8;
logic m_axis_outputI_tready_8;
logic [7:0]m_axis_outputI_tdata_8;
logic m_axis_outputI_tlast_8;
logic m_axis_outputQ_tvalid_8;
logic m_axis_outputQ_tready_8;
logic [7:0]m_axis_outputQ_tdata_8;
logic m_axis_outputQ_tlast_8;

logic m_axis_outputI_tvalid_qam256;
logic m_axis_outputI_tready_qam256;
logic [15:0]m_axis_outputI_tdata_qam256;
logic m_axis_outputI_tlast_qam256;
logic m_axis_outputQ_tvalid_qam256;
logic m_axis_outputQ_tready_qam256;
logic [15:0]m_axis_outputQ_tdata_qam256;
logic m_axis_outputQ_tlast_qam256;

logic m_axis_outputI_tvalid_qam1024;
logic m_axis_outputI_tready_qam1024;
logic [15:0]m_axis_outputI_tdata_qam1024;
logic m_axis_outputI_tlast_qam1024;
logic m_axis_outputQ_tvalid_qam1024;
logic m_axis_outputQ_tready_qam1024;
logic [15:0]m_axis_outputQ_tdata_qam1024;
logic m_axis_outputQ_tlast_qam1024;


qam qam(
    .clk(clk),
    .reset(reset),
    
    .s_axis_input_tvalid(s_axis_input_tvalid),
    .s_axis_input_tready(s_axis_input_tready),
    .s_axis_input_tdata (s_axis_input_tdata ),
    .s_axis_input_tlast (s_axis_input_tlast ),
    
    .m_axis_outputI_tvalid(),
    .m_axis_outputI_tready(),
    .m_axis_outputI_tdata(),
    .m_axis_outputI_tlast(),
    .m_axis_outputQ_tvalid(),
    .m_axis_outputQ_tready(),
    .m_axis_outputQ_tdata(),
    .m_axis_outputQ_tlast(),
    
    .m_axis_outputI_tvalid_8(m_axis_outputI_tvalid),
    .m_axis_outputI_tready_8(m_axis_outputI_tready),
    .m_axis_outputI_tdata_8(m_axis_outputI_tdata),
    .m_axis_outputI_tlast_8(m_axis_outputI_tlast),
    .m_axis_outputQ_tvalid_8(m_axis_outputQ_tvalid),
    .m_axis_outputQ_tready_8(m_axis_outputQ_tready),
    .m_axis_outputQ_tdata_8(m_axis_outputQ_tdata),
    .m_axis_outputQ_tlast_8(m_axis_outputQ_tlast),
    
    .m_axis_outputI_tvalid_qam256(m_axis_outputI_tvalid_qam256),
    .m_axis_outputI_tready_qam256(m_axis_outputI_tready_qam256),
    .m_axis_outputI_tdata_qam256 (m_axis_outputI_tdata_qam256),
    .m_axis_outputI_tlast_qam256 (m_axis_outputI_tlast_qam256),
    .m_axis_outputQ_tvalid_qam256(m_axis_outputQ_tvalid_qam256),
    .m_axis_outputQ_tready_qam256(m_axis_outputQ_tready_qam256),
    .m_axis_outputQ_tdata_qam256 (m_axis_outputQ_tdata_qam256),
    .m_axis_outputQ_tlast_qam256 (m_axis_outputQ_tlast_qam256),
    
    .m_axis_outputI_tvalid_qam1024(m_axis_outputI_tvalid_qam1024),
    .m_axis_outputI_tready_qam1024(m_axis_outputI_tready_qam1024),
    .m_axis_outputI_tdata_qam1024 (m_axis_outputI_tdata_qam1024),
    .m_axis_outputI_tlast_qam1024 (m_axis_outputI_tlast_qam1024),
    .m_axis_outputQ_tvalid_qam1024(m_axis_outputQ_tvalid_qam1024),
    .m_axis_outputQ_tready_qam1024(m_axis_outputQ_tready_qam1024),
    .m_axis_outputQ_tdata_qam1024 (m_axis_outputQ_tdata_qam1024),
    .m_axis_outputQ_tlast_qam1024 (m_axis_outputQ_tlast_qam1024)
    
    );     

`ifdef apsk
    apskmod_call apskmod_call(
        .clk(clk),
        .reset(reset),
      
        .s_axis_input_tvalid(s_axis_input_tvalid),
        .s_axis_input_tready(s_axis_input_tready),
        .s_axis_input_tdata (s_axis_input_tdata ),
        .s_axis_input_tlast (s_axis_input_tlast ),
        
        .m_axis_outputI_tvalid(m_axis_outputI_tvalid),
        .m_axis_outputI_tdata (m_axis_outputI_tdata ),
        .m_axis_outputQ_tvalid(m_axis_outputQ_tvalid),
        .m_axis_outputQ_tdata (m_axis_outputQ_tdata );
`endif      


endmodule
