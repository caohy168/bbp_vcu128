`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd_thz
// Engineer: caohy
// 
// Create Date: 2020/03/03 15:31:42
// Design Name: 
// Module Name: crc_detector
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
module crc_detector#(
        `ifdef self_rs
            parameter RS_CNT   = 232
        `else  
            parameter RS_CNT   = 236
        `endif
    )(
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
output logic event_s_right
    );
logic[15:0]tready_state; 
assign s_axis_input_tready = (tready_state==2)?0:1;
always @(posedge clk)begin
    if (reset) begin
      tready_state=0;
    end
    else begin
      case (tready_state)
         0:begin
            if (s_axis_input_tlast && s_axis_input_tvalid)
              tready_state <=1;
            else
              tready_state <=0;end
         1:begin
            if (!s_axis_input_tvalid)
            tready_state <=2;
            else
            tready_state <=1;end
         2:begin
            if(m_axis_output_tlast)tready_state<=0;
            else tready_state<=2;end 
      endcase
      end end       
          
logic[7:0]crc_source[3];
logic[7:0]crc_valid[3]; 
logic[7:0]axi_datin[RS_CNT];   
logic [7:0]crc_generator_data;
logic crc_generator_tvalid;
logic crc_generator_tlast;

logic [15:0]axi_in_i=1;
always@(posedge clk)
    begin
        if(s_axis_input_tvalid)begin
            if(axi_in_i<RS_CNT+3)axi_in_i<=axi_in_i+1;
            else axi_in_i<=1;
            if((axi_in_i<=RS_CNT+3)&&(axi_in_i>RS_CNT))
            crc_source[axi_in_i-RS_CNT-1]<=s_axis_input_tdata;
            if((axi_in_i<=RS_CNT)&&(axi_in_i>0))
            axi_datin[axi_in_i-1]<=s_axis_input_tdata;
           end
        else axi_in_i<=1;
    end  
logic [15:0]axi_out_i=1;
always@(posedge clk)
    begin
        if(crc_generator_tvalid)begin
            if(axi_out_i<RS_CNT+3)axi_out_i<=axi_out_i+1;
            else axi_out_i<=1;
            if((axi_out_i<=RS_CNT+3)&&(axi_out_i>RS_CNT))
            crc_valid[axi_out_i-237]<=crc_generator_data;
           end
        else axi_out_i<=1;
    end      

logic s_axis_input_tvalid_map;
logic s_axis_input_tready_map;
logic [7:0]s_axis_input_tdata_map;
logic s_axis_input_tlast_map;
logic[15:0]axi_in_map_i=0;  

always@(posedge clk)
      begin
          if(s_axis_input_tvalid)axi_in_map_i<=axi_in_map_i+1;
          else axi_in_map_i<=0;
          if((axi_in_map_i>=0)&&(axi_in_map_i<RS_CNT)&&(s_axis_input_tvalid))begin
              s_axis_input_tvalid_map<=1;
              s_axis_input_tdata_map<=s_axis_input_tdata;
              end
          else begin
              s_axis_input_tvalid_map<=0;
              s_axis_input_tdata_map<=0;
              end
          if((axi_in_map_i==RS_CNT-1)&&(s_axis_input_tvalid))s_axis_input_tlast_map<=1;
          else s_axis_input_tlast_map<=0;
      end   
crc_generator crc_generator(
    .clk(clk),
    .reset(reset),

    .s_axis_input_tvalid(s_axis_input_tvalid_map),
    .s_axis_input_tready(s_axis_input_tready_map),
    .s_axis_input_tdata(s_axis_input_tdata_map),
    .s_axis_input_tlast(s_axis_input_tlast_map),
    
    .m_axis_output_tvalid(crc_generator_tvalid),
    .m_axis_output_tready(m_axis_output_tready),
    .m_axis_output_tdata(crc_generator_data),
    .m_axis_output_tlast(crc_generator_tlast));
    
logic[15:0]axi_out_j=0;  
logic[15:0]axi_out_state; 
always @(posedge clk)begin
if (reset) begin
  axi_out_state=0;
end
else begin
  case (axi_out_state)
     0: begin
        if (crc_generator_tlast && crc_generator_tvalid)
          axi_out_state <=1;
        else
          axi_out_state <=0;
     end
     1: begin
        if (m_axis_output_tready)
          axi_out_state <=2;
        else
          axi_out_state <=1;
     end
     2:begin
        if(axi_out_j<RS_CNT)
            begin
                axi_out_j<=axi_out_j+1;
                axi_out_state<=2;
            end
        else begin
            axi_out_j<=0;
            axi_out_state<=0;
        end 
     end
  endcase
  end end
  
always@(posedge clk)
      begin
          if((axi_out_j>=1)&&(axi_out_j<=RS_CNT)&&(axi_out_state==2))begin
              m_axis_output_tvalid<=1;
              m_axis_output_tdata<=axi_datin[axi_out_j-1];
              end
          else begin
              m_axis_output_tvalid<=0;
              m_axis_output_tdata<=0;
              end
          if((axi_out_j==RS_CNT)&&(axi_out_state==2))begin
            if(crc_source==crc_valid)begin
                event_s_right<=1;
                event_s_error<=0;end
            else begin
                event_s_right<=0;
                event_s_error<=1;end
            m_axis_output_tlast<=1;end
          else begin
            m_axis_output_tlast<=0;
            event_s_right<=0;
            event_s_error<=0;end
      end   
endmodule
