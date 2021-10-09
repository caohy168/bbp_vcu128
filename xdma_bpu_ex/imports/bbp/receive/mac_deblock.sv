`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/05 14:25:25
// Design Name: 
// Module Name: mac_deblock
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
module mac_deblock#(
        `ifdef self_rs
            parameter RS_CNT   = 232
        `else  
            parameter RS_CNT   = 236
        `endif
    )(
input clk,reset,

input s_axis_input_tvalid[8],
output logic s_axis_input_tready[8],
input [7:0]s_axis_input_tdata[8],
input s_axis_input_tlast[8],
input event_s_error[8],
input event_s_right[8],

output logic m_axis_output_tvalid,
input  m_axis_output_tready,
output logic [63:0]m_axis_output_tdata,
output logic m_axis_output_tlast);

genvar j;
generate
    for (j = 0; j < 8; j = j + 1)begin: tready_process
    logic[15:0]tready_state[8]; 
    assign s_axis_input_tready[j] = (tready_state[j]==2)?0:1;
    always @(posedge clk)begin
        if (reset) begin
          tready_state[j]=0;
        end
        else begin
          case (tready_state[j])
             0:begin
                if (s_axis_input_tlast[j] && s_axis_input_tvalid[j])
                  tready_state[j] <=1;
                else
                  tready_state[j] <=0;end
             1:begin
                if (!s_axis_input_tvalid[j])
                tready_state[j] <=2;
                else
                tready_state[j] <=1;end
             2:begin
                if(m_axis_output_tlast)tready_state[j]<=0;
                else tready_state[j]<=2;end 
          endcase
          end end       
    end
endgenerate 

byte de_crc_data[8][RS_CNT];
logic [15:0]axi_in_i[8];
byte mac_deblock_dat[RS_CNT*8];
genvar i;
generate
    for (i = 0; i < 8; i = i + 1)begin: decrc_receive_process
        always@(posedge clk)
            begin
                if(s_axis_input_tvalid[i])begin
                    if(axi_in_i[i]<RS_CNT)axi_in_i[i]<=axi_in_i[i]+1;
                    else axi_in_i[i]<=0;
//                    mac_deblock_dat[(i+1)*(axi_in_i[i]+1)-1]<=s_axis_input_tdata[i];
                    de_crc_data[i][axi_in_i[i]]<=s_axis_input_tdata[i];end
                else axi_in_i[i]<=0;
            end 
    end
endgenerate 

genvar k,l;
generate
     for (l = 0; l < 8; l = l + 1)begin: deblock_process
        for (k = 0; k < RS_CNT; k = k + 1)begin
        assign mac_deblock_dat[8*k+l]=de_crc_data[l][k];
    end end
endgenerate 

logic[15:0]axi_out_i=0;  
logic[15:0]axi_out_state; 
always @(posedge clk)begin
if (reset) begin
  axi_out_state=0;
end
else begin
  case (axi_out_state)
     0: begin
        if (s_axis_input_tlast[0] && s_axis_input_tvalid[0])
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
        if(axi_out_i<RS_CNT*8)
            begin
                axi_out_i<=axi_out_i+8;
                axi_out_state<=2;
            end
        else begin
            axi_out_i<=0;
            axi_out_state<=0;
        end 
     end
  endcase
  end end
  
always@(posedge clk)
      begin
          if((axi_out_i>=0)&&(axi_out_i<RS_CNT*8)&&(axi_out_state==2))begin
              m_axis_output_tvalid<=1;
              m_axis_output_tdata[07:00]<=mac_deblock_dat[axi_out_i+0];
              m_axis_output_tdata[15:08]<=mac_deblock_dat[axi_out_i+1];
              m_axis_output_tdata[23:16]<=mac_deblock_dat[axi_out_i+2];
              m_axis_output_tdata[31:24]<=mac_deblock_dat[axi_out_i+3];
              m_axis_output_tdata[39:32]<=mac_deblock_dat[axi_out_i+4];
              m_axis_output_tdata[47:40]<=mac_deblock_dat[axi_out_i+5];
              m_axis_output_tdata[55:48]<=mac_deblock_dat[axi_out_i+6];
              m_axis_output_tdata[63:56]<=mac_deblock_dat[axi_out_i+7];
              end
          else begin
              m_axis_output_tvalid<=0;
              m_axis_output_tdata<=0;
              end
          if((axi_out_i==(RS_CNT-1)*8)&&(axi_out_state==2))m_axis_output_tlast<=1;
          else m_axis_output_tlast<=0;
      end   
endmodule
