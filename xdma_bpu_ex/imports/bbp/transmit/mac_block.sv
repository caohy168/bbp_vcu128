`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd_thz
// Engineer: caohy
// 
// Create Date: 2020/03/10 12:38:15
// Design Name: Telecommunications processing unit
// Module Name: mac_block
// Project Name: BFB(base frequency band) search group
// Target Devices: xcvu9p
// Tool Versions: vivado 2020.2
// Description: 
// 
// Dependencies: 
// Matlab simulation
// Revision:V1.0
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module mac_block#(
        `ifdef self_rs
            parameter RS_CNT                        = 232
        `else  
            parameter RS_CNT                        = 236
        `endif
    )(
input clk,reset,

input s_axis_input_tvalid,
output logic s_axis_input_tready,
input [63:0]s_axis_input_tdata,
input s_axis_input_tlast,

output logic m_axis_output_tvalid[8],
input  m_axis_output_tready[8],
output logic [7:0]m_axis_output_tdata[8],
output logic m_axis_output_tlast[8]);

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
            if(m_axis_output_tlast[0])tready_state<=0;
            else tready_state<=2;end 
      endcase
      end end
logic [15:0]data_in_i=0;
//logic [15:0]data_in_j=0;
byte crc_data_in[8][RS_CNT];

always@(posedge clk)
    begin
        if(s_axis_input_tvalid)begin
//            if(data_in_j<7)data_in_j<=data_in_j+1;
//            else data_in_j<=0;
            if(data_in_i<RS_CNT-1)begin
                data_in_i<=data_in_i+1;
//                if(data_in_j==7)data_in_i<=data_in_i+1;
                end
            else 
                data_in_i<=data_in_i;
            
            crc_data_in[0][data_in_i]<=s_axis_input_tdata[07:00];
            crc_data_in[1][data_in_i]<=s_axis_input_tdata[15:08];
            crc_data_in[2][data_in_i]<=s_axis_input_tdata[23:16];
            crc_data_in[3][data_in_i]<=s_axis_input_tdata[31:24];
            crc_data_in[4][data_in_i]<=s_axis_input_tdata[39:32];
            crc_data_in[5][data_in_i]<=s_axis_input_tdata[47:40];
            crc_data_in[6][data_in_i]<=s_axis_input_tdata[55:48];
            crc_data_in[7][data_in_i]<=s_axis_input_tdata[63:56];
            
            end
        else data_in_i<=0;

    end 
    
//logic[15:0]axi_out_i=0;  
//logic[15:0]axi_out_state; 
//    always @(posedge clk)begin
//        if (reset) begin
//          axi_out_state=0;
//        end
//        else begin
//          case (axi_out_state)
//             0: begin
//                if (s_axis_input_tlast)
//                  axi_out_state <=1;
//                else
//                  axi_out_state <=0;
//             end
//             1: begin
//                if (s_axis_input_tlast)
//                  axi_out_state <=1;
//                else
//                  axi_out_state <=0;
//             end
//             2:begin
//                if(axi_out_i<236)
//                    begin
//                        axi_out_i<=axi_out_i+1;
//                        axi_out_state<=1;
//                    end
//                else begin
//                    axi_out_i<=0;
//                    axi_out_state<=0;
//                end 
//             end
//          endcase
//          end end
logic[15:0]axi_out_i[8];  
logic[15:0]axi_out_state[8];           
genvar j;
generate
  for (j = 0; j < 8; j = j + 1)begin: mac_block    
      always @(posedge clk)begin
          if (reset) begin
            axi_out_i[j]<=0;
            axi_out_state[j]<=0;
          end
          else begin
            case (axi_out_state[j])
               0: begin
                  if (s_axis_input_tlast && s_axis_input_tvalid)
                    axi_out_state[j] <=1;
                  else
                    axi_out_state[j] <=0;
               end
               1: begin
                  if (m_axis_output_tready[j])
                    axi_out_state[j] <=2;
                  else
                    axi_out_state[j] <=1;
               end
               2:begin
                  if(axi_out_i[j]<236)
                      begin
                          axi_out_i[j]<=axi_out_i[j]+1;
                          axi_out_state[j]<=2;
                      end
                  else begin
                      axi_out_i[j]<=0;
                      axi_out_state[j]<=0;
                  end 
               end
            endcase
            end end
             
    always@(posedge clk)
          begin
              if((axi_out_i[j]>=0)&&(axi_out_i[j]<=RS_CNT-1)&&(axi_out_state[j]==2))begin
                  m_axis_output_tvalid[j]<=1;
                  m_axis_output_tdata[j]<=crc_data_in[j][axi_out_i[j]];
                  end
              else begin
                  m_axis_output_tvalid[j]<=0;
                  m_axis_output_tdata[j]<=0;
                  end
              if((axi_out_i[j]==RS_CNT-1)&&(axi_out_state[j]==2))m_axis_output_tlast[j]<=1;
              else m_axis_output_tlast[j]<=0;
          end  
    end
endgenerate 

endmodule
