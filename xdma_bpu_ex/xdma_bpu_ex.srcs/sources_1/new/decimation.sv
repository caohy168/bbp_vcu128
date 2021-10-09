`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd
// Engineer: caohuiyang
// 
// Create Date: 10/08/2021 09:41:16 PM
// Design Name: 
// Module Name: decimation
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


module decimation(
    input clk_250m,clk_500m,
    input reset,

    input s_axis_data_tvalid_I,s_axis_data_tvalid_Q,
    input s_axis_data_tlast_I,s_axis_data_tlast_Q,
    output logic s_axis_data_tready_I,s_axis_data_tready_Q,
    input [7:0]s_axis_data_tdata_I,s_axis_data_tdata_Q,
    input m_axis_data_tready_I,m_axis_data_tready_Q,
    output logic m_axis_data_tvalid_I,m_axis_data_tvalid_Q,
    output logic m_axis_data_tlast_I,m_axis_data_tlast_Q,
    output logic [7:0]m_axis_data_tdata_I,m_axis_data_tdata_Q
    );
    
assign s_axis_data_tready_I=1;
assign s_axis_data_tready_Q=1;
logic [15:00]m_axis_data_cnt=1;

logic m_axis_data_tvalid_Ineg,m_axis_data_tvalid_Qneg;
logic m_axis_data_tlast_Ineg,m_axis_data_tlast_Qneg;
logic [7:0]m_axis_data_tdata_Ineg,m_axis_data_tdata_Qneg;

always_ff @(negedge clk_250m)begin
    m_axis_data_tvalid_Ineg=s_axis_data_tvalid_I;
    m_axis_data_tvalid_Qneg=s_axis_data_tvalid_Q;
    m_axis_data_tdata_Ineg=s_axis_data_tdata_I;
    m_axis_data_tdata_Qneg=s_axis_data_tdata_Q;
    if(m_axis_data_tvalid_I)m_axis_data_cnt++;
    else m_axis_data_cnt=1;
    if(m_axis_data_cnt==340)begin
        m_axis_data_tlast_Ineg=1;
        m_axis_data_tlast_Qneg=1;
    end
    else begin
        m_axis_data_tlast_Ineg=0;
        m_axis_data_tlast_Qneg=0;
    end
end

always_ff @(posedge clk_250m)begin
    m_axis_data_tvalid_I=m_axis_data_tvalid_Ineg;
    m_axis_data_tvalid_Q=m_axis_data_tvalid_Qneg;
    m_axis_data_tdata_I=m_axis_data_tdata_Ineg;
    m_axis_data_tdata_Q=m_axis_data_tdata_Qneg;
    m_axis_data_tlast_I=m_axis_data_tlast_Ineg;
    m_axis_data_tlast_Q=m_axis_data_tlast_Qneg;
end

endmodule
