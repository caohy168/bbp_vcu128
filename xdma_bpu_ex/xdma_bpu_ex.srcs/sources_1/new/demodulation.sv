`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd
// Engineer: caohuiyang
// 
// Create Date: 09/26/2021 06:42:48 PM
// Design Name: 
// Module Name: demodulation
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
module demodulation(
input clk,reset,

input  s_axis_inputI_tvalid,
output logic s_axis_inputI_tready,
input  [15:0]s_axis_inputI_tdata,
input  s_axis_inputI_tlast,
input  s_axis_inputQ_tvalid,
output logic s_axis_inputQ_tready,
input  [15:0]s_axis_inputQ_tdata,
input  s_axis_inputQ_tlast,

input  s_axis_inputI_tvalid_qam256,
output logic s_axis_inputI_tready_qam256,
input  [15:0]s_axis_inputI_tdata_qam256,
input  s_axis_inputI_tlast_qam256,
input  s_axis_inputQ_tvalid_qam256,
output logic s_axis_inputQ_tready_qam256,
input  [15:0]s_axis_inputQ_tdata_qam256,
input  s_axis_inputQ_tlast_qam256,

input  s_axis_inputI_tvalid_qam1024,
output logic s_axis_inputI_tready_qam1024,
input  [15:0]s_axis_inputI_tdata_qam1024,
input  s_axis_inputI_tlast_qam1024,
input  s_axis_inputQ_tvalid_qam1024,
output logic s_axis_inputQ_tready_qam1024,
input  [15:0]s_axis_inputQ_tdata_qam1024,
input  s_axis_inputQ_tlast_qam1024,

input  s_axis_inputI_tvalid_8,
output logic s_axis_inputI_tready_8,
input  [7:0]s_axis_inputI_tdata_8,
input  s_axis_inputI_tlast_8,
input  s_axis_inputQ_tvalid_8,
output logic s_axis_inputQ_tready_8,
input  [7:0]s_axis_inputQ_tdata_8,
input  s_axis_inputQ_tlast_8,

output logic m_axis_output_tvalid,
input m_axis_output_tready,
output logic[7:0]m_axis_output_tdata,
output logic m_axis_output_tlast);

`ifdef qam
    eqam eqam(
    .clk(clk),
    .reset(reset),
    
    .s_axis_inputI_tvalid(s_axis_inputI_tvalid),
    .s_axis_inputI_tready(s_axis_inputI_tready),
    .s_axis_inputI_tdata(s_axis_inputI_tdata  ),
    .s_axis_inputI_tlast(s_axis_inputI_tlast  ),
    .s_axis_inputQ_tvalid(s_axis_inputQ_tvalid),
    .s_axis_inputQ_tready(s_axis_inputQ_tready),
    .s_axis_inputQ_tdata(s_axis_inputQ_tdata  ),
    .s_axis_inputQ_tlast(s_axis_inputQ_tlast  ),
    
    .s_axis_inputI_tvalid_qam256(s_axis_inputI_tvalid_qam256),
    .s_axis_inputI_tready_qam256(s_axis_inputI_tready_qam256),
    .s_axis_inputI_tdata_qam256(s_axis_inputI_tdata_qam256  ),
    .s_axis_inputI_tlast_qam256(s_axis_inputI_tlast_qam256  ),
    .s_axis_inputQ_tvalid_qam256(s_axis_inputQ_tvalid_qam256),
    .s_axis_inputQ_tready_qam256(s_axis_inputQ_tready_qam256),
    .s_axis_inputQ_tdata_qam256(s_axis_inputQ_tdata_qam256  ),
    .s_axis_inputQ_tlast_qam256(s_axis_inputQ_tlast_qam256  ),
    
    .s_axis_inputI_tvalid_qam1024(s_axis_inputI_tvalid_qam1024),
    .s_axis_inputI_tready_qam1024(s_axis_inputI_tready_qam1024),
    .s_axis_inputI_tdata_qam1024(s_axis_inputI_tdata_qam1024  ),
    .s_axis_inputI_tlast_qam1024(s_axis_inputI_tlast_qam1024  ),
    .s_axis_inputQ_tvalid_qam1024(s_axis_inputQ_tvalid_qam1024),
    .s_axis_inputQ_tready_qam1024(s_axis_inputQ_tready_qam1024),
    .s_axis_inputQ_tdata_qam1024(s_axis_inputQ_tdata_qam1024  ),
    .s_axis_inputQ_tlast_qam1024(s_axis_inputQ_tlast_qam1024  ),
    
    .s_axis_inputI_tvalid_8(s_axis_inputI_tvalid_8),
    .s_axis_inputI_tready_8(s_axis_inputI_tready_8),
    .s_axis_inputI_tdata_8(s_axis_inputI_tdata_8  ),
    .s_axis_inputI_tlast_8(s_axis_inputI_tlast_8  ),
    .s_axis_inputQ_tvalid_8(s_axis_inputQ_tvalid_8),
    .s_axis_inputQ_tready_8(s_axis_inputQ_tready_8),
    .s_axis_inputQ_tdata_8(s_axis_inputQ_tdata_8  ),
    .s_axis_inputQ_tlast_8(s_axis_inputQ_tlast_8  ),
    
//    .m_axis_output_tvalid(eqam_data_tvalid[i]),
//    .m_axis_output_tready(descrambler_tready[i]),
//    .m_axis_output_tdata(eqam_data[i]),
//    .m_axis_output_tlast(eqam_data_tlast[i]),

    .m_axis_output_tvalid(m_axis_output_tvalid),
    .m_axis_output_tready(m_axis_output_tready),
    .m_axis_output_tdata (m_axis_output_tdata ),
    .m_axis_output_tlast (m_axis_output_tlast )
    
//    .m_axis_output_tvalid_qam256(eqam_data_tvalid[i]),
//    .m_axis_output_tready_qam256(descrambler_tready[i]),
//    .m_axis_output_tdata_qam256(eqam_data[i]),
//    .m_axis_output_tlast_qam256(eqam_data_tlast[i])
    
//    .m_axis_output_tvalid_qam1024(eqam_data_tvalid[i]   ),
//    .m_axis_output_tready_qam1024(descrambler_tready[i] ),
//    .m_axis_output_tdata_qam1024 (eqam_data[i]          ),
//    .m_axis_output_tlast_qam1024 (eqam_data_tlast[i]    )
    
    );

`else //just simple express apsk define
    apskdemod_call apskdemod_call(
     .clk(clk),
     .reset(reset),
    
     .demodout_tvalid(apsk_data_tvalid[i]),
     .demodout_tready(1),
     .demodout_tdata(apsk_data[i]),
     .demodout_tlast(apsk_data_tlast[i]),
    
     .apskI_tvalid(s_axis_inputI_tvalid_a[i]),
     .apskI_tdata(s_axis_inputI_tdata_a[i]),
     .apskQ_tvalid(s_axis_inputQ_tvalid_a[i]),
     .apskQ_tdata(s_axis_inputQ_tdata_a[i]));

`endif

endmodule
