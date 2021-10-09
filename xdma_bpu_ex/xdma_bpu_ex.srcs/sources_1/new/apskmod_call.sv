`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: thgd_thz    
// Engineer: caohuiyang
// 
// Create Date: 04/22/2021 01:46:44 AM
// Design Name: 
// Module Name: apsk
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
module apskmod_call(
    input clk,reset,
    
    input s_axis_input_tvalid,
    output logic s_axis_input_tready,
    input [7:0]s_axis_input_tdata,
    input s_axis_input_tlast,
    
    output logic m_axis_outputI_tvalid,
 //   input  m_axis_outputI_tready,
    output logic [31:0]m_axis_outputI_tdata,
 //   output logic m_axis_outputI_tlast,
    output logic m_axis_outputQ_tvalid,
 //  input  m_axis_outputQ_tready,
    output logic [31:0]m_axis_outputQ_tdata
 //  output logic m_axis_outputQ_tlast
    );
 
assign s_axis_input_tready=1;    
//logic[15:0]tready_state; 
//assign s_axis_input_tready = (tready_state==2)?0:1;
//always @(posedge clk)begin
//    if (reset) begin
//      tready_state=0;
//    end
//    else begin
//      case (tready_state)
//         0:begin
//            if (s_axis_input_tlast && s_axis_input_tvalid)
//              tready_state <=1;
//            else
//              tready_state <=0;end
//         1:begin
//            if (!s_axis_input_tvalid)
//            tready_state <=2;
//            else
//            tready_state <=1;end
//         2:begin
//            if(m_axis_outputI_tlast)tready_state<=0;
//            else tready_state<=2;end 
//      endcase
//      end end
logic [15:0]axi_in_i=1;
logic [8:1]apsk_input[255:1];
logic [8:1]apsk_bin[340:1];
logic [1:2040]data_in=0;
always@(posedge clk)
    begin
        if(s_axis_input_tvalid)begin
            if(axi_in_i<255)axi_in_i<=axi_in_i+1;
            else axi_in_i<=1;
            apsk_input[axi_in_i]<=s_axis_input_tdata;
            data_in[8*(axi_in_i-1)+1]<=s_axis_input_tdata[7];
            data_in[8*(axi_in_i-1)+2]<=s_axis_input_tdata[6];
            data_in[8*(axi_in_i-1)+3]<=s_axis_input_tdata[5];
            data_in[8*(axi_in_i-1)+4]<=s_axis_input_tdata[4];
            data_in[8*(axi_in_i-1)+5]<=s_axis_input_tdata[3];
            data_in[8*(axi_in_i-1)+6]<=s_axis_input_tdata[2];
            data_in[8*(axi_in_i-1)+7]<=s_axis_input_tdata[1];
            data_in[8*(axi_in_i-1)+8]<=s_axis_input_tdata[0];end
        else axi_in_i<=1;
    end 
genvar j;
generate
    for (j = 1; j <=340; j = j + 1)begin: qam_bin_process
        always@(*)begin
            apsk_bin[j]<={data_in[6*(j-1)+1],data_in[6*(j-1)+2],data_in[6*(j-1)+3],
                         data_in[6*(j-1)+4],data_in[6*(j-1)+5],data_in[6*(j-1)+6]};
            end end
endgenerate
    
logic ap_start=1;
logic ap_done,ap_idle,ap_ready;
logic [15:0]apsk_state,apskin_cnt;
logic mod_datin_tvalid,mod_datin_tready;
logic [8:1]mod_datin_tdata;

always @(posedge clk)begin
    if (reset) begin
      apsk_state=0;
      apskin_cnt=1;
    end
    else begin
      case (apsk_state)
         0:begin
            if (axi_in_i==255)
              apsk_state =1;
            else
              apsk_state =0;end
         1:begin
            if (apskin_cnt<341)begin
            apsk_state =1;
            mod_datin_tvalid=1;
            mod_datin_tdata=apsk_bin[apskin_cnt];
            apskin_cnt=apskin_cnt+1;
            end
            else begin
            apsk_state =2;
            mod_datin_tvalid=0;
            mod_datin_tdata=0;
            apskin_cnt=1;
            end end
         2:begin
            apsk_state=0;
            mod_datin_tvalid=0;
            mod_datin_tdata=0;
            apskin_cnt=1;
            end 
      endcase
      end end
logic   [31:0] modi_tdata;      
logic   modi_tvalid;
logic   modi_tready=1;
logic   [31:0] modq_tdata;
logic   modq_tvalid;
logic   modq_tready=1; 

assign m_axis_outputI_tvalid=modi_tvalid;
assign m_axis_outputI_tdata=modi_tdata;
assign m_axis_outputQ_tvalid=modq_tvalid;
assign m_axis_outputQ_tdata=modq_tdata;     
      
apskmod64 apskmod64 (
  .ap_clk  (clk),
  .ap_rst_n(!reset),
  .ap_start(ap_start),
  .ap_done (ap_done),
  .ap_idle (ap_idle),
  .ap_ready(ap_ready),
  .mod_datin_TVALID(mod_datin_tvalid),
  .mod_datin_TREADY(mod_datin_tready),
  .mod_datin_TDATA (mod_datin_tdata),
  .modi_TVALID(modi_tvalid),
  .modi_TREADY(modi_tready),
  .modi_TDATA (modi_tdata),
  .modq_TVALID(modq_tvalid),
  .modq_TREADY(modq_tready),
  .modq_TDATA (modq_tdata));
  
logic [31:00]mod_datin_cnt,modout_tdata_cnt;
always @(posedge clk)begin
    if(mod_datin_tvalid)mod_datin_cnt++;
    else mod_datin_cnt=0;
    
    if(modi_tvalid)modout_tdata_cnt++;
    else modout_tdata_cnt=0;
end
  
endmodule
