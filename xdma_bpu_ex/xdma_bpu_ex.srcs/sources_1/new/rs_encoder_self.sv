`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd
// Engineer: caohuiyang
// 
// Create Date: 08/03/2021 01:39:01 AM
// Design Name: 
// Module Name: rs_encoder_self
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

module rs_encoder_self(
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

wire [31 : 0] data_in_TDATA;
assign data_in_TDATA[31:08]=0;
assign data_in_TDATA[07:00]=s_axis_input_tdata;
wire  data_in_TVALID=s_axis_input_tvalid;
wire  data_in_TREADY;
assign s_axis_input_tready=data_in_TREADY;
wire [4 : 0] bb_out_address0;
wire  bb_out_ce0;
wire  bb_out_we0;
wire [31 : 0] bb_out_d0;
wire [31 : 0] recd_out_TDATA;
wire  recd_out_TVALID;
wire  recd_out_TREADY=1;
wire [7 : 0] alpha_to_out_address0;
wire  alpha_to_out_ce0;
wire  alpha_to_out_we0;
wire [31 : 0] alpha_to_out_d0;
wire [7 : 0] index_of_out_address0;
wire  index_of_out_ce0;
wire  index_of_out_we0;
wire [31 : 0] index_of_out_d0;
wire [4 : 0] gg_out_address0;
wire  gg_out_ce0;
wire  gg_out_we0;
wire [31 : 0] gg_out_d0;

wire ap_clk=aclk;
wire ap_rst=(!aresetn)||(recd_out_state==3);
wire ap_rst_n=!ap_rst;
wire ap_start=1;
wire ap_done;
wire ap_idle;
wire ap_ready;

logic [07:00]recd_out_buffer[255];
logic [15:00]datain_cnt=0;
logic [15:00]recd_cnt=0;
logic [15:00]recd_out_state=0;
logic [15:00]dataout_cnt=0;

always @(posedge aclk)begin
    if (!aresetn) begin
      datain_cnt=235;
      recd_cnt=255;
    end
    else begin
      if(data_in_TVALID)begin
        if(datain_cnt>0)begin
            datain_cnt--;
            recd_out_buffer[datain_cnt]=s_axis_input_tdata;end end
      else datain_cnt = 235;
      if(recd_out_TVALID)begin
        if(recd_cnt>0)begin
            recd_cnt--;
            recd_out_buffer[recd_cnt]=recd_out_TDATA;end end
        else recd_cnt=255;
      end 
 end
always @(posedge aclk)begin
    if (!aresetn) begin
      recd_out_state=0;
      dataout_cnt=255;
    end
    else begin
      case (recd_out_state)
         0:begin
            if (recd_out_TVALID)
              recd_out_state <=1;
            else
              recd_out_state <=0;end
         1:begin
            if (!recd_out_TVALID)
            recd_out_state <=2;
            else
            recd_out_state <=1;end
         2:begin
            if(dataout_cnt>0)begin
                dataout_cnt--;
                m_axis_output_tdata=recd_out_buffer[dataout_cnt];
                m_axis_output_tvalid=1;
                recd_out_state <=2;
            end
            else begin
                m_axis_output_tvalid=0; 
                recd_out_state <=3;
            end
            if(dataout_cnt==0&&m_axis_output_tvalid)
                m_axis_output_tlast=1;
            else
                m_axis_output_tlast=0;
 //           m_axis_output_tlast
         end
         3:begin
                recd_out_state <=0;
                dataout_cnt=255;
         end
      endcase
      end end

encoders encoders(
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .data_in_TDATA(data_in_TDATA),
    .data_in_TVALID(data_in_TVALID),
    .data_in_TREADY(data_in_TREADY),
    .bb_out_address0(bb_out_address0),
    .bb_out_ce0(bb_out_ce0),
    .bb_out_we0(bb_out_we0),
    .bb_out_d0(bb_out_d0),
    .recd_out_TDATA(recd_out_TDATA),
    .recd_out_TVALID(recd_out_TVALID),
    .recd_out_TREADY(recd_out_TREADY),
    .alpha_to_out_address0(alpha_to_out_address0),
    .alpha_to_out_ce0(alpha_to_out_ce0),
    .alpha_to_out_we0(alpha_to_out_we0),
    .alpha_to_out_d0(alpha_to_out_d0),
    .index_of_out_address0(index_of_out_address0),
    .index_of_out_ce0(index_of_out_ce0),
    .index_of_out_we0(index_of_out_we0),
    .index_of_out_d0(index_of_out_d0),
    .gg_out_address0(gg_out_address0),
    .gg_out_ce0(gg_out_ce0),
    .gg_out_we0(gg_out_we0),
    .gg_out_d0(gg_out_d0));
    
endmodule
