`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd
// Engineer: caohuiyang
// 
// Create Date: 09/26/2021 06:42:48 PM
// Design Name: 
// Module Name: modulation
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// support QAM64/256/1024 and APSK64
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "bbp_parameter.vh"
module modulation(
input clk,reset,
//data input
input s_axis_input_tvalid,
output logic s_axis_input_tready,
input [7:0]s_axis_input_tdata,
input s_axis_input_tlast,
//radio loop
output logic m_axis_outputI_tvalid_8,
input  m_axis_outputI_tready_8,
output logic [7:0]m_axis_outputI_tdata_8,
output logic m_axis_outputI_tlast_8,
output logic m_axis_outputQ_tvalid_8,
input  m_axis_outputQ_tready_8,
output logic [7:0]m_axis_outputQ_tdata_8,
output logic m_axis_outputQ_tlast_8,
//layer1 loop
output logic m_axis_outputI_tvalid,
input  m_axis_outputI_tready,
output logic [15:0]m_axis_outputI_tdata,
output logic m_axis_outputI_tlast,
output logic m_axis_outputQ_tvalid,
input  m_axis_outputQ_tready,
output logic [15:0]m_axis_outputQ_tdata,
output logic m_axis_outputQ_tlast,

output logic m_axis_outputI_tvalid_qam256,
input  m_axis_outputI_tready_qam256,
output logic [15:0]m_axis_outputI_tdata_qam256,
output logic m_axis_outputI_tlast_qam256,
output logic m_axis_outputQ_tvalid_qam256,
input  m_axis_outputQ_tready_qam256,
output logic [15:0]m_axis_outputQ_tdata_qam256,
output logic m_axis_outputQ_tlast_qam256,

output logic m_axis_outputI_tvalid_qam1024,
input  m_axis_outputI_tready_qam1024,
output logic [15:0]m_axis_outputI_tdata_qam1024,
output logic m_axis_outputI_tlast_qam1024,
output logic m_axis_outputQ_tvalid_qam1024,
input  m_axis_outputQ_tready_qam1024,
output logic [15:0]m_axis_outputQ_tdata_qam1024,
output logic m_axis_outputQ_tlast_qam1024,

output logic m_axis_outputI_tvalid_apsk64,
input  m_axis_outputI_tready_apsk64,
output logic [15:0]m_axis_outputI_tdata_apsk64,
output logic m_axis_outputI_tlast_apsk64,
output logic m_axis_outputQ_tvalid_apsk64,
input  m_axis_outputQ_tready_apsk64,
output logic [15:0]m_axis_outputQ_tdata_apsk64,
output logic m_axis_outputQ_tlast_apsk64);

qam qam(
    .clk(clk),
    .reset(reset),
    
    .s_axis_input_tvalid(s_axis_input_tvalid),
    .s_axis_input_tready(s_axis_input_tready),
    .s_axis_input_tdata (s_axis_input_tdata ),
    .s_axis_input_tlast (s_axis_input_tlast ),
    
    .m_axis_outputI_tvalid_8(m_axis_outputI_tvalid_8),
    .m_axis_outputI_tready_8(m_axis_outputI_tready_8),
    .m_axis_outputI_tdata_8(m_axis_outputI_tdata_8  ),
    .m_axis_outputI_tlast_8(m_axis_outputI_tlast_8  ),
    .m_axis_outputQ_tvalid_8(m_axis_outputQ_tvalid_8),
    .m_axis_outputQ_tready_8(m_axis_outputQ_tready_8),
    .m_axis_outputQ_tdata_8(m_axis_outputQ_tdata_8  ),
    .m_axis_outputQ_tlast_8(m_axis_outputQ_tlast_8  ),
    
    .m_axis_outputI_tvalid(m_axis_outputI_tvalid),
    .m_axis_outputI_tready(m_axis_outputI_tready),
    .m_axis_outputI_tdata(m_axis_outputI_tdata  ),
    .m_axis_outputI_tlast(m_axis_outputI_tlast  ),
    .m_axis_outputQ_tvalid(m_axis_outputQ_tvalid),
    .m_axis_outputQ_tready(m_axis_outputQ_tready),
    .m_axis_outputQ_tdata(m_axis_outputQ_tdata  ),
    .m_axis_outputQ_tlast(m_axis_outputQ_tlast  ),
    
    .m_axis_outputI_tvalid_qam256(m_axis_outputI_tvalid_qam256),
    .m_axis_outputI_tready_qam256(m_axis_outputI_tready_qam256),
    .m_axis_outputI_tdata_qam256 (m_axis_outputI_tdata_qam256 ),
    .m_axis_outputI_tlast_qam256 (m_axis_outputI_tlast_qam256 ),
    .m_axis_outputQ_tvalid_qam256(m_axis_outputQ_tvalid_qam256),
    .m_axis_outputQ_tready_qam256(m_axis_outputQ_tready_qam256),
    .m_axis_outputQ_tdata_qam256 (m_axis_outputQ_tdata_qam256 ),
    .m_axis_outputQ_tlast_qam256 (m_axis_outputQ_tlast_qam256 ),
    
    .m_axis_outputI_tvalid_qam1024(m_axis_outputI_tvalid_qam1024),
    .m_axis_outputI_tready_qam1024(m_axis_outputI_tready_qam1024),
    .m_axis_outputI_tdata_qam1024 (m_axis_outputI_tdata_qam1024 ),
    .m_axis_outputI_tlast_qam1024 (m_axis_outputI_tlast_qam1024 ),
    .m_axis_outputQ_tvalid_qam1024(m_axis_outputQ_tvalid_qam1024),
    .m_axis_outputQ_tready_qam1024(m_axis_outputQ_tready_qam1024),
    .m_axis_outputQ_tdata_qam1024 (m_axis_outputQ_tdata_qam1024 ),
    .m_axis_outputQ_tlast_qam1024 (m_axis_outputQ_tlast_qam1024 ));     

`ifdef apsk
    apskmod_call apskmod_call(
        .clk(clk),
        .reset(reset),
      
        .s_axis_input_tvalid(s_axis_input_tvalid ),
        .s_axis_input_tready(s_axis_input_tready ),
        .s_axis_input_tdata (s_axis_input_tdata  ),
        .s_axis_input_tlast (s_axis_input_tlast  ),
        
        .m_axis_outputI_tvalid(m_axis_outputI_tvalid_apsk64 ),
        .m_axis_outputI_tdata(m_axis_outputI_tdata_apsk64   ),
        .m_axis_outputQ_tvalid(m_axis_outputQ_tvalid_apsk64 ),
        .m_axis_outputQ_tdata(m_axis_outputQ_tdata_apsk64   ));
`endif 

endmodule
