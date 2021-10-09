`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd_thz    
// Engineer: caohuiyang
// 
// Create Date: 06/01/2021 02:48:31 AM
// Design Name: 
// Module Name: rs_decoder_empty
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


module rs_decoder_empty(
    input aclk,
    input aresetn,
    input [7:0]s_axis_input_tdata,
    input s_axis_input_tvalid,
    input s_axis_input_tlast,
    output logic s_axis_input_tready,
    output logic [7:0]m_axis_output_tdata,
    output logic m_axis_output_tvalid,
    input m_axis_output_tready,
    output logic m_axis_output_tlast
    );
assign s_axis_input_tready=m_axis_output_tready;
logic [31:00]rs_decoder_cnt;
always @(posedge aclk)begin
    if (!aresetn) begin
      rs_decoder_cnt=0;
      m_axis_output_tvalid=0;
      m_axis_output_tdata=0;
      m_axis_output_tlast=0;
    end
    else begin
        if(s_axis_input_tvalid)rs_decoder_cnt++;
        else rs_decoder_cnt=0;
        
        if(rs_decoder_cnt<=239)begin
            m_axis_output_tdata=s_axis_input_tdata;
            m_axis_output_tvalid=s_axis_input_tvalid;
        end
        else begin
            m_axis_output_tdata=0;
            m_axis_output_tvalid=0;
        end
        
         if(rs_decoder_cnt==239)begin
            m_axis_output_tlast=1;
        end
        else begin
            m_axis_output_tlast=0;
        end
    end
    
     
end  

    
    
endmodule
