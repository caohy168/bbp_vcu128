`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd
// Engineer: caohuiyang
// QQ:2685997598
// Create Date: 08/05/2021 01:50:39 AM
// Design Name: 
// Module Name: rs_decoder_self
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


module rs_decoder_self(
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

wire ready;
wire ready_wire;
wire ap_start=1;
wire ap_done;
wire ap_idle;
wire ap_ready;
wire [31 : 0] recd_in_TDATA;
assign recd_in_TDATA[31:08]=0;
assign recd_in_TDATA[07:00]=s_axis_input_tdata;
wire  recd_in_TVALID=s_axis_input_tvalid;
wire  recd_in_TREADY;
assign s_axis_input_tready=recd_in_TREADY;
wire [31 : 0] recd_out_TDATA;
//assign m_axis_output_tdata=recd_out_TDATA[07:00];
wire  recd_out_TVALID;
//assign m_axis_output_tvalid=recd_out_TVALID;
wire  recd_out_TREADY=m_axis_output_tready;

wire [7 : 0] recd_gf_out_address0;
wire  recd_gf_out_ce0;
wire  recd_gf_out_we0;
wire [31 : 0] recd_gf_out_d0;
wire [31 : 0] syn_error_out;
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
wire ap_rst_n=aresetn;

logic [15:00] data_out_cnt;
logic [15:00] data_out_buff[255];
always @(posedge aclk)begin
    if (!aresetn) begin
      data_out_cnt=0;
    end
    else begin
        if(recd_out_TVALID)begin
            data_out_buff[data_out_cnt]=recd_out_TDATA;
            data_out_cnt++;
            end
        else begin
            data_out_cnt=0;end
        end       
    end 
    
logic [15:00]m_axi_out_state=0;
logic [15:00]m_axis_dataout_cnt=0;

always @(posedge aclk)begin
    if (!aresetn) begin
      m_axi_out_state=0;
      m_axis_dataout_cnt=0;
      m_axis_output_tvalid=0;
      m_axis_output_tdata=0;
      m_axis_output_tlast=0;
    end
    else begin
      case (m_axi_out_state)
         0:begin
            if (recd_out_TVALID)
              m_axi_out_state <=1;
            else
              m_axi_out_state <=0;
              
            m_axis_dataout_cnt=0;
            m_axis_output_tvalid=0;
            m_axis_output_tlast=0;
            
              end
         1:begin
            if (!recd_out_TVALID)
            m_axi_out_state <=2;
            else
            m_axi_out_state <=1;end
         2:begin
            if(m_axis_dataout_cnt<255)begin
                m_axi_out_state <=2;
                m_axis_dataout_cnt++;
                end
            else begin 
                m_axi_out_state <=0;
            end
            if(m_axis_dataout_cnt>19 && m_axis_dataout_cnt<255)begin
                m_axis_output_tdata=data_out_buff[m_axis_dataout_cnt];
                m_axis_output_tvalid=1;
            end
            else begin
                m_axis_output_tvalid=0; 
            end
            if(m_axis_dataout_cnt==254)
                m_axis_output_tlast=1;
            else
                m_axis_output_tlast=0;
 //           m_axis_output_tlast
         end
      endcase
      end end
   
decoders decoders(
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .recd_in_TDATA(recd_in_TDATA),
    .recd_in_TVALID(recd_in_TVALID),
    .recd_in_TREADY(recd_in_TREADY),
    .recd_out_TDATA(recd_out_TDATA),
    .recd_out_TVALID(recd_out_TVALID),
    .recd_out_TREADY(recd_out_TREADY),
    .recd_gf_out_address0(recd_gf_out_address0),
    .recd_gf_out_ce0(recd_gf_out_ce0),
    .recd_gf_out_we0(recd_gf_out_we0),
    .recd_gf_out_d0(recd_gf_out_d0),
    .syn_error_out(syn_error_out),
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
