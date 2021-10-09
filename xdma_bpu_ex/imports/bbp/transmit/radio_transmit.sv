`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd
// Engineer: caohuiyang
// 
// Create Date: 2020/03/10 08:03:52
// Design Name: 
// Module Name: radio_transmit
// Project Name: 
// Target Devices:simulate
// Tool Versions: vivado
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
//parameter radio_transmit_lane_number = 8;//2--lane2;4--lane4;8--lane8
module radio_transmit(
    input clk_250m,clk_500m,
    input reset,
    
    input  s_axis_inputI_tvalid[8],
    output logic s_axis_inputI_tready[8],
    input  [7:0]s_axis_inputI_tdata[8],
    input  s_axis_inputI_tlast[8],
    input  s_axis_inputQ_tvalid[8],
    output logic s_axis_inputQ_tready[8],
    input  [7:0]s_axis_inputQ_tdata[8],
    input  s_axis_inputQ_tlast[8],
    
    input m_axis_outputI_tready[8],m_axis_outputQ_tready[8],
    output m_axis_outputI_tvalid[8],m_axis_outputQ_tvalid[8],
    output m_axis_outputI_tlast[8],m_axis_outputQ_tlast[8],
    output [15:0]m_axis_outputI_tdata[8],m_axis_outputQ_tdata[8]);
 
logic m_axis_outputI_inter_tready[8],m_axis_outputQ_inter_tready[8];
logic m_axis_outputI_inter_tvalid[8],m_axis_outputQ_inter_tvalid[8];
logic m_axis_outputI_inter_tlast[8],m_axis_outputQ_inter_tlast[8];
logic [7:0]m_axis_outputI_inter_tdata[8],m_axis_outputQ_inter_tdata[8];


genvar j;
generate
    for (j = 0; j < `radio_transmit_lane_number; j = j + 1)begin: duc_transmit

        interpolation inter2(
            .clk_250m(clk_250m),
            .clk_500m(clk_500m),
            .reset(reset),
            .s_axis_inputI_tvalid(s_axis_inputI_tvalid[j]),
            .s_axis_inputI_tlast(s_axis_inputI_tlast[j]),
            .s_axis_inputI_tready(s_axis_inputI_tready[j]),
            .s_axis_inputI_tdata(s_axis_inputI_tdata[j]),
            .s_axis_inputQ_tvalid(s_axis_inputQ_tvalid[j]),
            .s_axis_inputQ_tlast(s_axis_inputQ_tlast[j]),
            .s_axis_inputQ_tready(s_axis_inputQ_tready[j]),
            .s_axis_inputQ_tdata(s_axis_inputQ_tdata[j]),
            
            .m_axis_outputI_tready(m_axis_outputI_tready[j]),
            .m_axis_outputI_tvalid(m_axis_outputI_inter_tvalid[j]),
            .m_axis_outputI_tlast(m_axis_outputI_inter_tlast[j]),
            .m_axis_outputI_tdata(m_axis_outputI_inter_tdata[j]),
            .m_axis_outputQ_tready(m_axis_outputQ_tready[j]),
            .m_axis_outputQ_tvalid(m_axis_outputQ_inter_tvalid[j]),
            .m_axis_outputQ_tlast(m_axis_outputQ_inter_tlast[j]),
            .m_axis_outputQ_tdata(m_axis_outputQ_inter_tdata[j]));
                
    
        duc duc(
             .aclk                  (clk_500m),//if no interpolation clk_250m,if interpolation2 clk_500m
//             .aclk                  (clk_250m),
             .reset                 (reset),
             .s_axis_data_tvalid_I  (m_axis_outputI_inter_tvalid[j]),
             .s_axis_data_tvalid_Q  (m_axis_outputQ_inter_tvalid[j]),
             .s_axis_dataI_tready   (m_axis_outputI_inter_tready[j]),
             .s_axis_dataQ_tready   (m_axis_outputQ_inter_tready[j]),
             .s_axis_data_tdata_I   (m_axis_outputI_inter_tdata[j]),
             .s_axis_data_tdata_Q   (m_axis_outputQ_inter_tdata[j]),
             .s_axis_data_tlast_I(m_axis_outputI_inter_tlast[j]),
             .s_axis_data_tlast_Q(m_axis_outputQ_inter_tlast[j]),

//             .s_axis_data_tvalid_I  (s_axis_inputI_tvalid[j]),
//             .s_axis_data_tvalid_Q  (s_axis_inputQ_tvalid[j]),
//             .s_axis_dataI_tready   (s_axis_inputI_tready[j]),
//             .s_axis_dataQ_tready   (s_axis_inputQ_tready[j]),
//             .s_axis_data_tdata_I   (s_axis_inputI_tdata[j]),
//             .s_axis_data_tdata_Q   (s_axis_inputQ_tdata[j]),
//             .s_axis_data_tlast_I   (s_axis_inputI_tlast[j]),
//             .s_axis_data_tlast_Q   (s_axis_inputQ_tlast[j]),
             
             .m_axis_data_tready_duc_I(m_axis_outputI_tready[j]),
             .m_axis_data_tready_duc_Q(m_axis_outputQ_tready[j]),
             .m_axis_data_tvalid_duc_I(m_axis_outputI_tvalid[j]),
             .m_axis_data_tvalid_duc_Q(m_axis_outputQ_tvalid[j]),
             .m_axis_data_tdata_duc_I (m_axis_outputI_tdata[j]),
             .m_axis_data_tdata_duc_Q (m_axis_outputQ_tdata[j]),
             .m_axis_data_tlast_duc_I (m_axis_outputI_tlast[j]),
             .m_axis_data_tlast_duc_Q (m_axis_outputQ_tlast[j])); 
end
endgenerate

endmodule
