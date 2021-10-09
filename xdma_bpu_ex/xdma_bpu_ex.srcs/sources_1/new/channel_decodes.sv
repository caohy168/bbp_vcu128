`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd
// Engineer:caohuiyang 
// 
// Create Date: 09/24/2021 01:58:57 AM
// Design Name: 
// Module Name: channel_decodes
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

module channel_decodes(
    input clk,reset,
    
    input s_axis_input_tvalid,
    output logic s_axis_input_tready,
    input [7:0]s_axis_input_tdata,
    input s_axis_input_tlast,
    
    output logic m_axis_output_tvalid,
    input  m_axis_output_tready,
    output logic [7:0]m_axis_output_tdata,
    output logic m_axis_output_tlast,
    
    output logic event_s_error,
    output logic event_s_right);

logic rs_decoder_tready;
logic [7:0]rs_decoder_data;
logic rs_decoder_data_tvalid;
logic rs_decoder_data_tlast;
logic crc_detector_tready;  
//logic event_s_error;
//logic event_s_right;

  `ifdef empty_rs
     rs_decoder_empty rs_decoder_empty(
    .aclk(clk),
    .aresetn(!reset),
    .s_axis_input_tdata(s_axis_input_tdata),
    .s_axis_input_tvalid(s_axis_input_tvalid),
    .s_axis_input_tlast(s_axis_input_tlast),
    .s_axis_input_tready(s_axis_input_tready),
    .m_axis_output_tdata(rs_decoder_data),
    .m_axis_output_tvalid(rs_decoder_data_tvalid),
    .m_axis_output_tready(crc_detector_tready),
    .m_axis_output_tlast(rs_decoder_data_tlast));
 `else
    begin
          `ifdef self_rs
             rs_decoder_self rs_decoder_self(
            .aclk(clk),
            .aresetn(!reset),
            .s_axis_input_tdata(s_axis_input_tdata),
            .s_axis_input_tvalid(s_axis_input_tvalid),
            .s_axis_input_tlast(s_axis_input_tlast),
            .s_axis_input_tready(s_axis_input_tready),
            .m_axis_output_tdata(rs_decoder_data),
            .m_axis_output_tvalid(rs_decoder_data_tvalid),
            .m_axis_output_tready(crc_detector_tready),
            .m_axis_output_tlast(rs_decoder_data_tlast));
          `else
             rs_decoder rs_decoder(
            .aclk(clk),
            .aresetn(!reset),
            .s_axis_input_tdata(s_axis_input_tdata),
            .s_axis_input_tvalid(s_axis_input_tvalid),
            .s_axis_input_tlast(s_axis_input_tlast),
            .s_axis_input_tready(s_axis_input_tready),
            .m_axis_output_tdata(rs_decoder_data),
            .m_axis_output_tvalid(rs_decoder_data_tvalid),
            .m_axis_output_tready(crc_detector_tready),
            .m_axis_output_tlast(rs_decoder_data_tlast),
            .m_axis_stat_tready(1'b1));
         `endif
    end
 `endif
    
 crc_detector crc_detector(
    .clk(clk),
    .reset(reset),
    
    .s_axis_input_tvalid(rs_decoder_data_tvalid),
    .s_axis_input_tready(crc_detector_tready),
    .s_axis_input_tdata(rs_decoder_data),
    .s_axis_input_tlast(rs_decoder_data_tlast),
    
    .m_axis_output_tvalid(m_axis_output_tvalid),
    .m_axis_output_tready(m_axis_output_tready),
    .m_axis_output_tdata(m_axis_output_tdata),
    .m_axis_output_tlast(m_axis_output_tlast),
    
    .event_s_error(event_s_error),
    .event_s_right(event_s_right));


endmodule
