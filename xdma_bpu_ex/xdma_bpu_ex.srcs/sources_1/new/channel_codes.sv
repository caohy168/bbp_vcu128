`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd
// Engineer: caohuiyang
// 
// Create Date: 09/24/2021 01:23:23 AM
// Design Name: 
// Module Name: channel_codes
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

module channel_codes(
    input clk,reset,
    
    input s_axis_input_tvalid,
    output logic s_axis_input_tready,
    input [7:0]s_axis_input_tdata,
    input s_axis_input_tlast,
    
    output logic m_axis_output_tvalid,
    input  m_axis_output_tready,
    output logic [7:0]m_axis_output_tdata,
    output logic m_axis_output_tlast);

logic [7:0]crc_gen_data;
logic crc_gen_data_tvalid;
logic crc_gen_data_tlast;
logic rs_enc_tready;

    crc_generator crc_generator(
        .clk(clk),
        .reset(reset),
        
        .s_axis_input_tvalid(s_axis_input_tvalid),
        .s_axis_input_tready(s_axis_input_tready),
        .s_axis_input_tdata(s_axis_input_tdata),
        .s_axis_input_tlast(s_axis_input_tlast),
        
        .m_axis_output_tvalid(crc_gen_data_tvalid),
        .m_axis_output_tready(rs_enc_tready),
        .m_axis_output_tdata(crc_gen_data),
        .m_axis_output_tlast(crc_gen_data_tlast));
        
         `ifdef empty_rs
            rs_encoder_empty rs_encoder_empty(
              .aclk(clk),
              .aresetn(!reset),
              .s_axis_input_tdata(crc_gen_data),
              .s_axis_input_tvalid(crc_gen_data_tvalid),
              .s_axis_input_tready(rs_enc_tready),
              .s_axis_input_tlast(crc_gen_data_tlast),
              
              .m_axis_output_tdata (m_axis_output_tdata),       
              .m_axis_output_tvalid(m_axis_output_tvalid),
              .m_axis_output_tready(m_axis_output_tready),
              .m_axis_output_tlast (m_axis_output_tlast));
         `else
            begin
                `ifdef self_rs
                    rs_encoder_self rs_encoder_self(
                      .aclk(clk),
                      .aresetn(!reset),
                      .s_axis_input_tdata(crc_gen_data),
                      .s_axis_input_tvalid(crc_gen_data_tvalid),
                      .s_axis_input_tready(rs_enc_tready),
                      .s_axis_input_tlast(crc_gen_data_tlast),
                      
                      .m_axis_output_tdata (m_axis_output_tdata),
                      .m_axis_output_tvalid(m_axis_output_tvalid),
                      .m_axis_output_tready(m_axis_output_tready),
                      .m_axis_output_tlast (m_axis_output_tlast));
                `else
                    rs_encoder rs_encoder(
                      .aclk(clk),
                      .aresetn(!reset),
                      .s_axis_input_tdata(crc_gen_data),
                      .s_axis_input_tvalid(crc_gen_data_tvalid),
                      .s_axis_input_tready(rs_enc_tready),
                      .s_axis_input_tlast(crc_gen_data_tlast),
                      
                      .m_axis_output_tdata (m_axis_output_tdata),
                      .m_axis_output_tvalid(m_axis_output_tvalid),
                      .m_axis_output_tready(m_axis_output_tready),
                      .m_axis_output_tlast (m_axis_output_tlast));
                `endif
            end
         `endif
endmodule
