`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd
// Engineer: caohuiyang
// 
// Create Date: 2020/03/06 10:54:27
// Design Name: Telecommunications processing unit
// Module Name: layer1
// Project Name: BFB(base frequency band) research group
// Target Devices: kcu105
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
module layer1_push(
input clk,reset,

input s_axis_input_tvalid,
output logic s_axis_input_tready,
input [63:0]s_axis_input_tdata,
input s_axis_input_tlast,

output logic m_axis_outputI_tvalid[8],
input  m_axis_outputI_tready[8],
output logic [15:0]m_axis_outputI_tdata[8],
output logic m_axis_outputI_tlast[8],
output logic m_axis_outputQ_tvalid[8],
input  m_axis_outputQ_tready[8],
output logic [15:0]m_axis_outputQ_tdata[8],
output logic m_axis_outputQ_tlast[8],

output logic m_axis_outputI_tvalid_8[8],
input  m_axis_outputI_tready_8[8],
output logic [7:0]m_axis_outputI_tdata_8[8],
output logic m_axis_outputI_tlast_8[8],
output logic m_axis_outputQ_tvalid_8[8],
input  m_axis_outputQ_tready_8[8],
output logic [7:0]m_axis_outputQ_tdata_8[8],
output logic m_axis_outputQ_tlast_8[8],

output logic m_axis_outputI_tvalid_qam256[8],
input m_axis_outputI_tready_qam256[8],
output logic [15:0]m_axis_outputI_tdata_qam256[8],
output logic m_axis_outputI_tlast_qam256[8],
output logic m_axis_outputQ_tvalid_qam256[8],
input m_axis_outputQ_tready_qam256[8],
output logic [15:0]m_axis_outputQ_tdata_qam256[8],
output logic m_axis_outputQ_tlast_qam256[8],

output logic m_axis_outputI_tvalid_qam1024[8],
input m_axis_outputI_tready_qam1024[8],
output logic [15:0]m_axis_outputI_tdata_qam1024[8],
output logic m_axis_outputI_tlast_qam1024[8],
output logic m_axis_outputQ_tvalid_qam1024[8],
input m_axis_outputQ_tready_qam1024[8],
output logic [15:0]m_axis_outputQ_tdata_qam1024[8],
output logic m_axis_outputQ_tlast_qam1024[8],

output logic m_axis_outputI_tvalid_a[8],
//input  m_axis_outputI_tready_a[8],
output logic [31:0]m_axis_outputI_tdata_a[8],
//output logic m_axis_outputI_tlast_a[8],
output logic m_axis_outputQ_tvalid_a[8],
//input  m_axis_outputQ_tready_a[8],
output logic [31:0]m_axis_outputQ_tdata_a[8]
//output logic m_axis_outputQ_tlast_a[8]
);
    
layer1_transmit layer1_transmit(
    .clk(clk),
    .reset(reset),
    
    .m_axis_outputI_tvalid(m_axis_outputI_tvalid),
    .m_axis_outputI_tready(m_axis_outputI_tready),
    .m_axis_outputI_tdata(m_axis_outputI_tdata),
    .m_axis_outputI_tlast(m_axis_outputI_tlast),
    .m_axis_outputQ_tvalid(m_axis_outputQ_tvalid),
    .m_axis_outputQ_tready(m_axis_outputQ_tready),
    .m_axis_outputQ_tdata(m_axis_outputQ_tdata),
    .m_axis_outputQ_tlast(m_axis_outputQ_tlast),
    
    .m_axis_outputI_tvalid_8(m_axis_outputI_tvalid_8),
    .m_axis_outputI_tready_8(m_axis_outputI_tready_8),
    .m_axis_outputI_tdata_8(m_axis_outputI_tdata_8),
    .m_axis_outputI_tlast_8(m_axis_outputI_tlast_8),
    .m_axis_outputQ_tvalid_8(m_axis_outputQ_tvalid_8),
    .m_axis_outputQ_tready_8(m_axis_outputQ_tready_8),
    .m_axis_outputQ_tdata_8(m_axis_outputQ_tdata_8),
    .m_axis_outputQ_tlast_8(m_axis_outputQ_tlast_8),
    
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
    .m_axis_outputQ_tlast_qam1024 (m_axis_outputQ_tlast_qam1024 ),
    
    `ifdef apsk
        .m_axis_outputI_tvalid_a(m_axis_outputI_tvalid_a),
//        .m_axis_outputI_tready_a(m_axis_outputI_tready_a),
        .m_axis_outputI_tdata_a (m_axis_outputI_tdata_a ),
//        .m_axis_outputI_tlast_a (m_axis_outputI_tlast_a ),
        .m_axis_outputQ_tvalid_a(m_axis_outputQ_tvalid_a),
//        .m_axis_outputQ_tready_a(m_axis_outputQ_tready_a),
        .m_axis_outputQ_tdata_a (m_axis_outputQ_tdata_a ),
//        .m_axis_outputQ_tlast_a (m_axis_outputQ_tlast_a ),
    `endif
    
    .s_axis_input_tvalid(s_axis_input_tvalid),
    .s_axis_input_tready(s_axis_input_tready),
    .s_axis_input_tdata(s_axis_input_tdata),
    .s_axis_input_tlast(s_axis_input_tlast)

    );

endmodule
