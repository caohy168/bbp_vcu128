`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd_thz
// Engineer: caohy
// 
// Create Date: 2020/02/27 11:15:16
// Design Name: 
// Module Name: interleaver
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
module interleaver(
input clk,reset,

input s_axis_input_tvalid,
output logic s_axis_input_tready,
input [7:0]s_axis_input_tdata,
input s_axis_input_tlast,

output logic m_axis_output_tvalid,
input  m_axis_output_tready,
output logic [7:0]m_axis_output_tdata,
output logic m_axis_output_tlast
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
              
logic [1:2040]data_in=0;
logic [1:340]interleaver_datain[1:6];
logic [15:0]data_in_i=0;
always@(posedge clk)
    begin
        if(s_axis_input_tvalid)begin
            if(data_in_i<255)data_in_i<=data_in_i+1;
            else data_in_i<=0;
            data_in[8*data_in_i+1]<=s_axis_input_tdata[7];
            data_in[8*data_in_i+2]<=s_axis_input_tdata[6];
            data_in[8*data_in_i+3]<=s_axis_input_tdata[5];
            data_in[8*data_in_i+4]<=s_axis_input_tdata[4];
            data_in[8*data_in_i+5]<=s_axis_input_tdata[3];
            data_in[8*data_in_i+6]<=s_axis_input_tdata[2];
            data_in[8*data_in_i+7]<=s_axis_input_tdata[1];
            data_in[8*data_in_i+8]<=s_axis_input_tdata[0];end
        else data_in_i<=0;
    end 
always@(*)
        begin
            interleaver_datain[1]<=data_in[340*0+1:340*1];
            interleaver_datain[2]<=data_in[340*1+1:340*2];
            interleaver_datain[3]<=data_in[340*2+1:340*3];
            interleaver_datain[4]<=data_in[340*3+1:340*4];
            interleaver_datain[5]<=data_in[340*4+1:340*5];
            interleaver_datain[6]<=data_in[340*5+1:340*6];
        end 
        
logic [1:2040]data_out=0;
logic [7:0]data_out8[255:1];
genvar i,j;
generate
    for (j = 0; j < 340; j = j + 1)begin: interleaver
        always@(*)begin
            data_out[(1+j*6):(6+j*6)]<={interleaver_datain[1][1*(j+1)],interleaver_datain[2][1*(j+1)],interleaver_datain[3][1*(j+1)],
            interleaver_datain[4][1*(j+1)],interleaver_datain[5][1*(j+1)],interleaver_datain[6][1*(j+1)]};
            end end
endgenerate

generate
    for (i = 1; i <= 255; i = i + 1)begin: interleaver8
        always@(*)  begin
            data_out8[i][7:0]<={data_out[(i-1)*8+1],data_out[(i-1)*8+2],data_out[(i-1)*8+3],data_out[(i-1)*8+4],
            data_out[(i-1)*8+5],data_out[(i-1)*8+6],data_out[(i-1)*8+7],data_out[(i-1)*8+8]};end
    end
endgenerate

//logic[15:0]axi_out_i;
//always@(posedge clk)
//    begin
//        if(s_axis_input_tlast)begin
//            if(axi_out_i<=255)axi_out_i<=axi_out_i+1;end
//        else axi_out_i<=0;
//    end   

//logic[15:0]axi_out_state; 
//always @(posedge clk)begin
//if (reset) begin
//  axi_out_state=0;
//end
//else begin
//  case (axi_out_state)
//     0: begin
//        if (s_axis_input_tvalid)
//          axi_out_state <=1;
//        else
//          axi_out_state <=0;
//     end
//     1:begin
//        if(axi_out_i==256)axi_out_state<=0;
//        else axi_out_state<=1;
//     end
//  endcase
//  end end
  
//always@(posedge clk)
//      begin
//          if((axi_out_i>=1)&&(axi_out_i<=255)&&(axi_out_state==1))begin
//              m_axis_output_tvalid<=1;
//              m_axis_output_tdata<=data_out8[axi_out_i];
//              end
//          else begin
//              m_axis_output_tvalid<=0;
//              m_axis_output_tdata<=0;
//              end
//          if((axi_out_i==255)&&(axi_out_state==1))m_axis_output_tlast<=1;
//          else m_axis_output_tlast<=0;
//      end   
logic[15:0]axi_out_i;  
logic[15:0]axi_out_state;           
      always @(posedge clk)begin
          if (reset) begin
            axi_out_i<=0;
            axi_out_state<=0;
          end
          else begin
            case (axi_out_state)
               0: begin
                  if (s_axis_input_tlast && s_axis_input_tvalid)
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
                  if(axi_out_i<255)
                      begin
                          axi_out_i<=axi_out_i+1;
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
              if((axi_out_i>=1)&&(axi_out_i<=255)&&(axi_out_state==2))begin
                  m_axis_output_tvalid<=1;
                  m_axis_output_tdata<=data_out8[axi_out_i];
                  end
              else begin
                  m_axis_output_tvalid<=0;
                  m_axis_output_tdata<=0;
                  end
              if((axi_out_i==255)&&(axi_out_state==2))m_axis_output_tlast<=1;
              else m_axis_output_tlast<=0;
          end  

endmodule
