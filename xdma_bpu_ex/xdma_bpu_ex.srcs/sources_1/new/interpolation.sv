`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd
// Engineer: caohuiyang
// 
// Create Date: 09/29/2021 08:34:30 PM
// Design Name: 
// Module Name: interpolation
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
module interpolation(
    input clk_250m,clk_500m,
    input reset,
    
    input  s_axis_inputI_tvalid,
    output logic s_axis_inputI_tready,
    input  [7:0]s_axis_inputI_tdata,
    input  s_axis_inputI_tlast,
    input  s_axis_inputQ_tvalid,
    output logic s_axis_inputQ_tready,
    input  [7:0]s_axis_inputQ_tdata,
    input  s_axis_inputQ_tlast,
    
    input m_axis_outputI_tready,m_axis_outputQ_tready,
    output logic m_axis_outputI_tvalid,m_axis_outputQ_tvalid,
    output logic m_axis_outputI_tlast,m_axis_outputQ_tlast,
    output logic [15:0]m_axis_outputI_tdata,m_axis_outputQ_tdata);
    
    logic s_axis_inputI_tready=1;
    logic s_axis_inputQ_tready=1;
    logic clk_250m_flag=1;
    always_ff @(posedge clk_500m)begin
        clk_250m_flag=~clk_250m_flag;
        if(m_axis_outputI_tready)begin
            m_axis_outputI_tvalid=s_axis_inputI_tvalid;
            if(clk_250m_flag && s_axis_inputI_tvalid)begin
                m_axis_outputI_tdata=s_axis_inputI_tdata;
            end
            else begin
                m_axis_outputI_tdata=0;
            end
            if(~clk_250m_flag && s_axis_inputI_tvalid)begin
                m_axis_outputI_tlast=s_axis_inputI_tlast; 
            end
            else begin
                m_axis_outputI_tlast=0; 
            end
        end
        else begin
            m_axis_outputI_tdata=0;
            m_axis_outputI_tlast=0; 
        end     
        if(m_axis_outputQ_tready)begin
            m_axis_outputQ_tvalid=s_axis_inputQ_tvalid;
            if(clk_250m_flag && s_axis_inputQ_tvalid)begin
                m_axis_outputQ_tdata=s_axis_inputQ_tdata;
            end
            else begin
                m_axis_outputQ_tdata=0;
            end
            
            if(~clk_250m_flag && s_axis_inputQ_tvalid)begin
                m_axis_outputQ_tlast=s_axis_inputQ_tlast; 
            end
            else begin
                m_axis_outputQ_tlast=0; 
            end
        end
        else begin
            m_axis_outputQ_tdata=0;
            m_axis_outputQ_tlast=0; 
        end
end
    
endmodule
