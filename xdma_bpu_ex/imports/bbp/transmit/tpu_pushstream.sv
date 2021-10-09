`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd_thz
// Engineer: caohy
// 
// Create Date: 2020/11/17 12:38:15
// Design Name: Telecommunications processing unit
// Module Name: tpu_upstream
// Project Name: BFB(base frequency band) research group
// Target Devices: kcu105
// Tool Versions: vivado 2020.2
// Description: 
// 
// Dependencies: 
// base on matlab simulation
// Revision:V1.0
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tpu_pushstream(
input clk_250m,clk_500m,reset,

input s_axis_input_tvalid,
output logic s_axis_input_tready,
input [63:0]s_axis_input_tdata,
input s_axis_input_tlast,

output logic      m_axis_outputDAI_tvalid[8],  
output logic      m_axis_outputDAQ_tvalid[8],
output logic      m_axis_outputDAI_tlast[8],
output logic      m_axis_outputDAQ_tlast[8],     
output logic[15:0]m_axis_outputDAI_tdata[8],
output logic[15:0]m_axis_outputDAQ_tdata[8],

output logic        m_axis_outputDAI_tvalid_qam256[8],
input               m_axis_outputDAI_tready_qam256[8],
output logic [15:0] m_axis_outputDAI_tdata_qam256[8],
output logic        m_axis_outputDAI_tlast_qam256[8],
output logic        m_axis_outputDAQ_tvalid_qam256[8],
input               m_axis_outputDAQ_tready_qam256[8],
output logic [15:0] m_axis_outputDAQ_tdata_qam256[8],
output logic        m_axis_outputDAQ_tlast_qam256[8],

output logic        m_axis_outputDAI_tvalid_qam1024[8],
input               m_axis_outputDAI_tready_qam1024[8],
output logic [15:0] m_axis_outputDAI_tdata_qam1024[8],
output logic        m_axis_outputDAI_tlast_qam1024[8],
output logic        m_axis_outputDAQ_tvalid_qam1024[8],
input               m_axis_outputDAQ_tready_qam1024[8],
output logic [15:0] m_axis_outputDAQ_tdata_qam1024[8],
output logic        m_axis_outputDAQ_tlast_qam1024[8],

output logic      m_axis_outputDAI_tvalid_a[8],  
output logic      m_axis_outputDAQ_tvalid_a[8],
//output logic      m_axis_outputDAI_tlast_a[8],
//output logic      m_axis_outputDAQ_tlast_a[8],     
output logic[31:0]m_axis_outputDAI_tdata_a[8],
output logic[31:0]m_axis_outputDAQ_tdata_a[8]);

//logic      m_axis_outputDAI_tvalid_a[8];  
//logic      m_axis_outputDAQ_tvalid_a[8];
//logic      m_axis_outputDAI_tlast_a[8];
//logic      m_axis_outputDAQ_tlast_a[8];     
//logic[31:0]m_axis_outputDAI_tdata_a[8];
//logic[31:0]m_axis_outputDAQ_tdata_a[8];

logic m_axis_outputI_tvalid_8[8];
logic m_axis_outputI_tready_8[8];
logic [7:0]m_axis_outputI_tdata_8[8];
logic m_axis_outputI_tlast_8[8];
logic m_axis_outputQ_tvalid_8[8];
logic m_axis_outputQ_tready_8[8];
logic [7:0]m_axis_outputQ_tdata_8[8];
logic m_axis_outputQ_tlast_8[8];

logic m_axis_outputI_tvalid[8];
logic m_axis_outputI_tready[8]={1,1,1,1,1,1,1,1};
logic [15:0]m_axis_outputI_tdata[8];
logic m_axis_outputI_tlast[8];
logic m_axis_outputQ_tvalid[8];
logic m_axis_outputQ_tready[8]={1,1,1,1,1,1,1,1};
logic [15:0]m_axis_outputQ_tdata[8];
logic m_axis_outputQ_tlast[8];

logic m_axis_outputI_tvalid_radio[8];
logic  m_axis_outputI_tready_radio[8]={1,1,1,1,1,1,1,1};
logic [15:0]m_axis_outputI_tdata_radio[8];
logic m_axis_outputI_tlast_radio[8];
logic m_axis_outputQ_tvalid_radio[8];
logic  m_axis_outputQ_tready_radio[8]={1,1,1,1,1,1,1,1};
logic [15:0]m_axis_outputQ_tdata_radio[8];
logic m_axis_outputQ_tlast_radio[8];

logic m_axis_outputI_tvalid_radio8[8];
logic m_axis_outputI_tready_radio8[8]={1,1,1,1,1,1,1,1};
logic [7:0]m_axis_outputI_tdata_radio8[8];
logic m_axis_outputI_tlast_radio8[8];
logic m_axis_outputQ_tvalid_radio8[8];
logic m_axis_outputQ_tready_radio8[8]={1,1,1,1,1,1,1,1};
logic [7:0]m_axis_outputQ_tdata_radio8[8];
logic m_axis_outputQ_tlast_radio8[8];


layer1_push layer1_pushstream(
    .clk(clk_250m),
    .reset(reset),

    .s_axis_input_tvalid(s_axis_input_tvalid),
    .s_axis_input_tready(s_axis_input_tready),
    .s_axis_input_tdata(s_axis_input_tdata),
    .s_axis_input_tlast(s_axis_input_tlast),

    .m_axis_outputI_tvalid(m_axis_outputI_tvalid),
    .m_axis_outputI_tready(m_axis_outputI_tready),
    .m_axis_outputI_tdata(m_axis_outputI_tdata),
    .m_axis_outputI_tlast(m_axis_outputI_tlast),
    .m_axis_outputQ_tvalid(m_axis_outputQ_tvalid),
    .m_axis_outputQ_tready(m_axis_outputQ_tready),
    .m_axis_outputQ_tdata(m_axis_outputQ_tdata),
    .m_axis_outputQ_tlast(m_axis_outputQ_tlast),
    
    .m_axis_outputI_tvalid_8(m_axis_outputI_tvalid_8),
    .m_axis_outputI_tready_8(m_axis_outputI_tready_8),
    .m_axis_outputI_tdata_8(m_axis_outputI_tdata_8),
    .m_axis_outputI_tlast_8(m_axis_outputI_tlast_8),
    .m_axis_outputQ_tvalid_8(m_axis_outputQ_tvalid_8),
    .m_axis_outputQ_tready_8(m_axis_outputQ_tready_8),
    .m_axis_outputQ_tdata_8(m_axis_outputQ_tdata_8),
    .m_axis_outputQ_tlast_8(m_axis_outputQ_tlast_8),
    
    .m_axis_outputI_tvalid_qam256(m_axis_outputDAI_tvalid_qam256),
    .m_axis_outputI_tready_qam256(m_axis_outputDAI_tready_qam256),
    .m_axis_outputI_tdata_qam256 (m_axis_outputDAI_tdata_qam256 ),
    .m_axis_outputI_tlast_qam256 (m_axis_outputDAI_tlast_qam256 ),
    .m_axis_outputQ_tvalid_qam256(m_axis_outputDAQ_tvalid_qam256),
    .m_axis_outputQ_tready_qam256(m_axis_outputDAQ_tready_qam256),
    .m_axis_outputQ_tdata_qam256 (m_axis_outputDAQ_tdata_qam256 ),
    .m_axis_outputQ_tlast_qam256 (m_axis_outputDAQ_tlast_qam256 ),
    
    .m_axis_outputI_tvalid_qam1024(m_axis_outputDAI_tvalid_qam1024),
    .m_axis_outputI_tready_qam1024(m_axis_outputDAI_tready_qam1024),
    .m_axis_outputI_tdata_qam1024 (m_axis_outputDAI_tdata_qam1024 ),
    .m_axis_outputI_tlast_qam1024 (m_axis_outputDAI_tlast_qam1024 ),
    .m_axis_outputQ_tvalid_qam1024(m_axis_outputDAQ_tvalid_qam1024),
    .m_axis_outputQ_tready_qam1024(m_axis_outputDAQ_tready_qam1024),
    .m_axis_outputQ_tdata_qam1024 (m_axis_outputDAQ_tdata_qam1024 ),
    .m_axis_outputQ_tlast_qam1024 (m_axis_outputDAQ_tlast_qam1024 ),
    
    .m_axis_outputI_tvalid_a(m_axis_outputDAI_tvalid_a),
//    .m_axis_outputI_tready_a(m_axis_outputDAI_tready_a),
    .m_axis_outputI_tdata_a (m_axis_outputDAI_tdata_a ),
//    .m_axis_outputI_tlast_a (m_axis_outputDAI_tlast_a ),
    .m_axis_outputQ_tvalid_a(m_axis_outputDAQ_tvalid_a),
//    .m_axis_outputQ_tready_a(m_axis_outputDAQ_tready_a),
    .m_axis_outputQ_tdata_a (m_axis_outputDAQ_tdata_a ));
//    .m_axis_outputQ_tlast_a (m_axis_outputDAQ_tlast_a ));
    
    
genvar i;
generate
    for (i = 0; i < 8; i = i + 1)begin: buffer
        axis_fifo_t axis_fifo_tI  (
          .s_axis_aresetn(!reset),
          .s_axis_aclk(clk_250m),
          .s_axis_tvalid(m_axis_outputI_tvalid[i]),
          .s_axis_tready(m_axis_outputI_tready[i]),
          .s_axis_tdata(m_axis_outputI_tdata[i]),
          .s_axis_tlast(m_axis_outputI_tlast[i]),
          .m_axis_tvalid(m_axis_outputI_tvalid_radio[i]),
          .m_axis_tready(m_axis_outputI_tready_radio[i]),
          .m_axis_tdata(m_axis_outputI_tdata_radio[i]),
          .m_axis_tlast(m_axis_outputI_tlast_radio[i]));
             
        axis_fifo_t axis_fifo_tQ  (
          .s_axis_aresetn(!reset),
          .s_axis_aclk(clk_250m),
          .s_axis_tvalid(m_axis_outputQ_tvalid[i]),
          .s_axis_tready(m_axis_outputQ_tready[i]),
          .s_axis_tdata(m_axis_outputQ_tdata[i]),
          .s_axis_tlast(m_axis_outputQ_tlast[i]),
          .m_axis_tvalid(m_axis_outputQ_tvalid_radio[i]),
          .m_axis_tready(m_axis_outputQ_tready_radio[i]),
          .m_axis_tdata(m_axis_outputQ_tdata_radio[i]),
          .m_axis_tlast(m_axis_outputQ_tlast_radio[i]));
          
         axis_fifo_t8 axis_fifo_t8I  (
          .s_axis_aresetn(!reset),
          .s_axis_aclk(clk_250m),
          .s_axis_tvalid(m_axis_outputI_tvalid_8[i]),
          .s_axis_tready(m_axis_outputI_tready_8[i]),
          .s_axis_tdata(m_axis_outputI_tdata_8[i]),
          .s_axis_tlast(m_axis_outputI_tlast_8[i]),
          .m_axis_tvalid(m_axis_outputI_tvalid_radio8[i]),
          .m_axis_tready(m_axis_outputI_tready_radio8[i]),
          .m_axis_tdata(m_axis_outputI_tdata_radio8[i]),
          .m_axis_tlast(m_axis_outputI_tlast_radio8[i]));
          
        axis_fifo_t8 axis_fifo_t8Q  (
          .s_axis_aresetn(!reset),
          .s_axis_aclk(clk_250m),
          .s_axis_tvalid(m_axis_outputQ_tvalid_8[i]),
          .s_axis_tready(m_axis_outputQ_tready_8[i]),
          .s_axis_tdata(m_axis_outputQ_tdata_8[i]),
          .s_axis_tlast(m_axis_outputQ_tlast_8[i]),
          .m_axis_tvalid(m_axis_outputQ_tvalid_radio8[i]),
          .m_axis_tready(m_axis_outputQ_tready_radio8[i]),
          .m_axis_tdata(m_axis_outputQ_tdata_radio8[i]),
          .m_axis_tlast(m_axis_outputQ_tlast_radio8[i]));
end
endgenerate

`ifdef radio
    radio_push radio_pushstream(
        .clk_250m(clk_250m),
        .clk_500m(clk_500m),
        .reset(reset),
        
        .m_axis_outputDAI_tvalid(m_axis_outputDAI_tvalid),   
        .m_axis_outputDAQ_tvalid(m_axis_outputDAQ_tvalid),
        .m_axis_outputDAI_tlast (m_axis_outputDAI_tlast),
        .m_axis_outputDAQ_tlast (m_axis_outputDAQ_tlast),     
        .m_axis_outputDAI_tdata (m_axis_outputDAI_tdata),
        .m_axis_outputDAQ_tdata (m_axis_outputDAQ_tdata),
      
        .s_axis_inputI_tvalid_8(m_axis_outputI_tvalid_radio8),
        .s_axis_inputI_tready_8(m_axis_outputI_tready_radio8),
        .s_axis_inputI_tdata_8(m_axis_outputI_tdata_radio8),
        .s_axis_inputI_tlast_8(m_axis_outputI_tlast_radio8),
        .s_axis_inputQ_tvalid_8(m_axis_outputQ_tvalid_radio8),
        .s_axis_inputQ_tready_8(m_axis_outputQ_tready_radio8),
        .s_axis_inputQ_tdata_8(m_axis_outputQ_tdata_radio8),
        .s_axis_inputQ_tlast_8(m_axis_outputQ_tlast_radio8));
`endif

endmodule
