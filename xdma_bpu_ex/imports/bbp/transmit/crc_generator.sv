`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd_thz
// Engineer: caohuiyang
// QQ:2685997598
// Create Date: 2020/02/25 14:11:21
// Design Name: 
// Module Name: crc_generator
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
module crc_generator#(
        `ifdef self_rs
            parameter RS_CNT                        = 232
        `else  
            parameter RS_CNT                        = 236
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
output logic m_axis_output_tlast
    );
    

//integer fp_r, fp_w, cnt;
//initial begin
  //fp_r = $fopen("data_in.txt", "r");
  //fp_w = $fopen("/home/caohy/work/tpu_total/intermediate/CrcDataOut","w");
 
  //while(m_axis_output_tvalid) begin
    //cnt = $fscanf(fp_r, "%d %d %d", reg1, reg2, reg3);
//  $display("crc_data_out=%d", crc_data_out);
  //  $fwrite(fp_w, "%d\n", crc_data_out);
 //end //end
    
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
      
logic [15:0]data_in_i=0;logic [15:0]data_in_j=0;
byte crc_data_in[RS_CNT];
logic [15:0]axi_in_i=0;
always@(posedge clk)
    begin
        if(s_axis_input_tvalid)begin
            if(axi_in_i<RS_CNT)axi_in_i<=axi_in_i+1;
            else axi_in_i<=0;
            crc_data_in[axi_in_i]<=s_axis_input_tdata;end
        else axi_in_i<=0;
    end 
    
 logic [15:0]data_in_x=0;logic [15:0]data_in_y=0;
 logic [15:0]crc_data_state=0;
 logic vld_i=0;
 logic sop_i=0;
 logic eop_i=0;
 logic data_i=0;;
 
 always @(*)begin
     if(crc_data_state==1)vld_i<=1;
     else vld_i<=0;
     if(vld_i&(data_in_x==0)&(data_in_y==0))sop_i<=1;
     else sop_i<=0;
     if(vld_i&(data_in_x==7)&(data_in_y==RS_CNT-1))eop_i<=1;
     else eop_i<=0;
     if(vld_i)data_i<=crc_data_in[data_in_y][7-data_in_x];
     else data_i<=0;
     end
      
  always @(posedge clk)begin
     if (reset) begin
        crc_data_state=0;
     end
     else begin
        case (crc_data_state)
           0: begin
              if (s_axis_input_tlast)
                crc_data_state <=1;
              else
                crc_data_state <=0;
           end
           1:begin
                if(data_in_x<7)data_in_x<=data_in_x+1;
                else data_in_x<=0;
                if(data_in_x==7)begin
                    if(data_in_y<RS_CNT-1)data_in_y<=data_in_y+1;
                    else data_in_y<=0;end
                else data_in_y<=data_in_y;
                if((data_in_x==7)&(data_in_y==RS_CNT-1))crc_data_state<=0;
                else crc_data_state<=1;
                
           end
        endcase
        end
        end
logic vld_o,sop_o,eop_o,data_o;
crc24_insert_1bit crc24_insert_1bit
(
    .clk(clk),
    .rst_n(!reset),
    .vld_i(vld_i),
    .sop_i(sop_i),
    .eop_i(eop_i),
    .data_i(data_i),
    .vld_o(vld_o),
    .sop_o(sop_o),
    .eop_o(eop_o),
    .data_o(data_o)
);
logic [15:0]data_out_i=0;logic [15:0]data_out_j=0;

byte crc_data_out[RS_CNT+3]; 
logic [7:0]crc_data_out_mem[RS_CNT+3];
always@(posedge clk)
    begin
        if(vld_o)begin
            if(data_out_j<7)data_out_j<=data_out_j+1;
            else data_out_j<=0;
            if(data_out_i<=RS_CNT+2)begin
                if(data_out_j==7)data_out_i<=data_out_i+1;
                else data_out_i<=data_out_i;end
            else data_out_i<=0;
            end
         crc_data_out[data_out_i][7-data_out_j]<=data_o;
         
    end 

 logic [15:0]axi_out_state=0;
 logic [15:0]axi_out_delay=0;
 logic [15:0]axi_out_i=0; 
  always @(posedge clk)begin
     if (reset) begin
        axi_out_state=0;
     end
     else begin
        case (axi_out_state)
           0: begin
              if (eop_o)
                axi_out_state <=1;
              else
                axi_out_state <=0;
           end
           1:begin
                if(m_axis_output_tready)
                    begin
                        if(axi_out_i<RS_CNT+2)
                            begin
                                axi_out_i<=axi_out_i+1;
                                axi_out_state<=1;
                            end
                        else 
                            begin
                                axi_out_i<=0;
                                axi_out_state<=0;
                            end
                    end
                 end
            endcase
        end
        end
 
always@(posedge clk)
    begin
        if(m_axis_output_tready)begin
            if((axi_out_i>=0)&&(axi_out_i<=RS_CNT+2)&&(axi_out_state==1))begin
                m_axis_output_tvalid<=1;
                m_axis_output_tdata<=crc_data_out[axi_out_i];
                end
            else begin
                m_axis_output_tvalid<=0;
                m_axis_output_tdata<=0;
                end
            if((axi_out_i==RS_CNT+2)&&(axi_out_state==1))m_axis_output_tlast<=1;
            else m_axis_output_tlast<=0;
            
            if(m_axis_output_tvalid)begin
//            fp_w = $fopen("/home/caohy/work/tpu_total/intermediate/CrcDataOut","w");
            //$display("crc_data_out[%d]= %d ", axi_out_i,crc_data_out[axi_out_i]);end
            //$display("fp_w= %s ", fp_w);end
            //$writememh ("/home/caohy/work/tpu_total/intermediate/CrcDataOut", crc_data_out[axi_out_i]);end
            
           end end
        else begin
                m_axis_output_tvalid<=0;
                m_axis_output_tdata<=0;
                m_axis_output_tlast<=0;
            end
    end   

endmodule
