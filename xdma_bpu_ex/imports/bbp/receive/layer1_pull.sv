`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd_thz
// Engineer: caohy
// 
// Create Date: 2020/03/06 10:54:27
// Design Name: Telecommunications processing unit
// Module Name: layer1
// Project Name: BFB(base frequency band) research group
// Target Devices: xcvu9p
// Tool Versions: 2019.2
// Description: 
// layer1 transnit module of the system
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module layer1_pull(
input clk,reset,

output logic m_axis_output_tvalid,
input m_axis_output_tready,
output logic[63:0]m_axis_output_tdata,
output logic m_axis_output_tlast,

input  s_axis_inputI_tvalid[8],
output logic s_axis_inputI_tready[8],
input  [15:0]s_axis_inputI_tdata[8],
input  s_axis_inputI_tlast[8],
input  s_axis_inputQ_tvalid[8],
output logic s_axis_inputQ_tready[8],
input  [15:0]s_axis_inputQ_tdata[8],
input  s_axis_inputQ_tlast[8],

input  s_axis_inputI_tvalid_8[8],
output logic s_axis_inputI_tready_8[8],
input  [7:0]s_axis_inputI_tdata_8[8],
input  s_axis_inputI_tlast_8[8],
input  s_axis_inputQ_tvalid_8[8],
output logic s_axis_inputQ_tready_8[8],
input  [7:0]s_axis_inputQ_tdata_8[8],
input  s_axis_inputQ_tlast_8[8],

input  s_axis_inputI_tvalid_qam256[8],
output logic s_axis_inputI_tready_qam256[8],
input  [15:0]s_axis_inputI_tdata_qam256[8],
input  s_axis_inputI_tlast_qam256[8],
input  s_axis_inputQ_tvalid_qam256[8],
output logic s_axis_inputQ_tready_qam256[8],
input  [15:0]s_axis_inputQ_tdata_qam256[8],
input  s_axis_inputQ_tlast_qam256[8],

input  s_axis_inputI_tvalid_qam1024[8],
output logic s_axis_inputI_tready_qam1024[8],
input  [15:0]s_axis_inputI_tdata_qam1024[8],
input  s_axis_inputI_tlast_qam1024[8],
input  s_axis_inputQ_tvalid_qam1024[8],
output logic s_axis_inputQ_tready_qam1024[8],
input  [15:0]s_axis_inputQ_tdata_qam1024[8],
input  s_axis_inputQ_tlast_qam1024[8],

input  s_axis_inputI_tvalid_a[8],
output logic s_axis_inputI_tready_a[8],
input  [31:0]s_axis_inputI_tdata_a[8],
input  s_axis_inputQ_tvalid_a[8],
output logic s_axis_inputQ_tready_a[8],
input  [31:0]s_axis_inputQ_tdata_a[8]);
    

layer1_receive layer1_receive(
    .clk(clk),
    .reset(reset),
    
    .m_axis_output_tvalid(m_axis_output_tvalid),
    .m_axis_output_tready(m_axis_output_tready),
    .m_axis_output_tdata(m_axis_output_tdata),
    .m_axis_output_tlast(m_axis_output_tlast),
    
    .s_axis_inputI_tvalid(s_axis_inputI_tvalid),
    .s_axis_inputI_tready(s_axis_inputI_tready),
    .s_axis_inputI_tdata(s_axis_inputI_tdata),
    .s_axis_inputI_tlast(s_axis_inputI_tlast),
    .s_axis_inputQ_tvalid(s_axis_inputQ_tvalid),
    .s_axis_inputQ_tready(s_axis_inputQ_tready),
    .s_axis_inputQ_tdata(s_axis_inputQ_tdata),
    .s_axis_inputQ_tlast(s_axis_inputQ_tlast),
    
    .s_axis_inputI_tvalid_8(s_axis_inputI_tvalid_8),
    .s_axis_inputI_tready_8(s_axis_inputI_tready_8),
    .s_axis_inputI_tdata_8(s_axis_inputI_tdata_8),
    .s_axis_inputI_tlast_8(s_axis_inputI_tlast_8),
    .s_axis_inputQ_tvalid_8(s_axis_inputQ_tvalid_8),
    .s_axis_inputQ_tready_8(s_axis_inputQ_tready_8),
    .s_axis_inputQ_tdata_8(s_axis_inputQ_tdata_8),
    .s_axis_inputQ_tlast_8(s_axis_inputQ_tlast_8),
    
    .s_axis_inputI_tvalid_qam256(s_axis_inputI_tvalid_qam256),
    .s_axis_inputI_tready_qam256(s_axis_inputI_tready_qam256),
    .s_axis_inputI_tdata_qam256(s_axis_inputI_tdata_qam256),
    .s_axis_inputI_tlast_qam256(s_axis_inputI_tlast_qam256),
    .s_axis_inputQ_tvalid_qam256(s_axis_inputQ_tvalid_qam256),
    .s_axis_inputQ_tready_qam256(s_axis_inputQ_tready_qam256),
    .s_axis_inputQ_tdata_qam256(s_axis_inputQ_tdata_qam256),
    .s_axis_inputQ_tlast_qam256(s_axis_inputQ_tlast_qam256),
    
    .s_axis_inputI_tvalid_qam1024(s_axis_inputI_tvalid_qam1024),
    .s_axis_inputI_tready_qam1024(s_axis_inputI_tready_qam1024),
    .s_axis_inputI_tdata_qam1024(s_axis_inputI_tdata_qam1024),
    .s_axis_inputI_tlast_qam1024(s_axis_inputI_tlast_qam1024),
    .s_axis_inputQ_tvalid_qam1024(s_axis_inputQ_tvalid_qam1024),
    .s_axis_inputQ_tready_qam1024(s_axis_inputQ_tready_qam1024),
    .s_axis_inputQ_tdata_qam1024(s_axis_inputQ_tdata_qam1024),
    .s_axis_inputQ_tlast_qam1024(s_axis_inputQ_tlast_qam1024),
    
    .s_axis_inputI_tvalid_a(s_axis_inputI_tvalid_a),
    .s_axis_inputI_tready_a(s_axis_inputI_tready_a),
    .s_axis_inputI_tdata_a(s_axis_inputI_tdata_a),
    .s_axis_inputQ_tvalid_a(s_axis_inputQ_tvalid_a),
    .s_axis_inputQ_tready_a(s_axis_inputQ_tready_a),
    .s_axis_inputQ_tdata_a(s_axis_inputQ_tdata_a)
    );
    
    
endmodule
