`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd_thz    
// Engineer: caohuiyang 
// 
// Create Date: 05/31/2021 06:56:10 PM
// Design Name: 
// Module Name: rs_encoder_empty
// Project Name: 
// Target Devices: 
// Tool Versions: vivado 2021 May 31
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rs_encoder_empty(
    input aclk,
    input aresetn,
    input [07:00]s_axis_input_tdata,
    input s_axis_input_tvalid,
    output logic s_axis_input_tready,
    input s_axis_input_tlast,
    
    output logic[07:00]m_axis_output_tdata,
    output logic m_axis_output_tvalid,
    input m_axis_output_tready,
    output logic m_axis_output_tlast
    );

 assign s_axis_input_tready=m_axis_output_tready;
 logic pos_edge;
 logic sig_r0,sig_r1;
 always @(posedge aclk)
  begin
      if(~aresetn)
	    begin
		   sig_r0 <= 1'b0;
		   sig_r1 <= 1'b0;
		end
	  else
	    begin
		   sig_r0 <= s_axis_input_tvalid;
		   sig_r1 <= sig_r0;
		end
  end
 assign pos_edge = ~sig_r1 & sig_r0;
    
logic [31:00]rs_counter;
logic [31:00]rs_state;
always @(posedge aclk)begin
    if (!aresetn) begin
      rs_counter=0;
      rs_state=0;
      m_axis_output_tdata=0;
      m_axis_output_tvalid=0;
      m_axis_output_tlast=0;
    end
    else begin
        case (rs_state)
         0:begin
            if (pos_edge)
              rs_state <=1;
            else
              rs_state <=0;end
         1:begin
            if(rs_counter<=257)begin
                rs_counter++;
                rs_state <=1;
                end
            else begin
                rs_counter=0;
                rs_state <=0;
            end end
        endcase
        
        if(rs_counter>=0 && rs_counter<238)begin
            m_axis_output_tdata=s_axis_input_tdata;
            m_axis_output_tvalid=s_axis_input_tvalid;
            
        end
        else if(rs_counter>=238 && rs_counter<254)begin
            m_axis_output_tdata=0;
            m_axis_output_tvalid=1;
        end
        else begin
            m_axis_output_tdata=0;
            m_axis_output_tvalid=0;
        end
        
        if(rs_counter==253)m_axis_output_tlast=1;
        else m_axis_output_tlast=0;
    end end
endmodule
