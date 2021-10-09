`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd
// Engineer: caohuiyang
// 
// Create Date: 2020/03/10 12:38:15
// Design Name: Telecommunications processing unit
// Module Name: tpu
// Project Name: BFB(base frequency band) research group
// Target Devices: xcvu9p
// Tool Versions: vivado 2019.2
// Description: 
// 
// Dependencies: 
// base on matlab simulation
// Revision:V1.0
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
//parameter radio_receive_lane_number = 8;//2--lane2;4--lane4;8--lane8
`include "bbp_parameter.vh"
module radio_receive(
    input clk_250m,clk_500m,
    input reset,

    output logic m_axis_outputI_tvalid[8],
    input  m_axis_outputI_tready[8],
    output logic [7:0]m_axis_outputI_tdata[8],
    output logic m_axis_outputI_tlast[8],
    output logic m_axis_outputQ_tvalid[8],
    input  m_axis_outputQ_tready[8],
    output logic [7:0]m_axis_outputQ_tdata[8],
    output logic m_axis_outputQ_tlast[8],
    
    output  s_axis_inputI_tready[8],s_axis_inputQ_tready[8],
    input s_axis_inputI_tvalid[8],s_axis_inputQ_tvalid[8],
    input s_axis_inputI_tlast[8],s_axis_inputQ_tlast[8],
    input [15:0]s_axis_inputI_tdata[8],s_axis_inputQ_tdata[8]

    );

logic m_axis_data_tready_ddc_I[8],m_axis_data_tready_ddc_Q[8];
logic m_axis_data_tvalid_ddc_I[8],m_axis_data_tvalid_ddc_Q[8];
logic m_axis_data_tlast_ddc_I[8],m_axis_data_tlast_ddc_Q[8];
logic [7:0]m_axis_data_tdata_ddc_I[8],m_axis_data_tdata_ddc_Q[8];

//ila_radio_receive ila_radio_receive (
//    .clk(clk_500m),
    
//    .probe0(m_axis_outputI_tvalid[0]),
//    .probe1(m_axis_outputI_tready[0]),
//    .probe2(m_axis_outputI_tdata[0]),
//    .probe3(m_axis_outputI_tlast[0]),
//    .probe4(s_axis_inputI_tready[0]),
//    .probe5(s_axis_inputI_tvalid[0]),
//    .probe6(s_axis_inputI_tlast[0]),
//    .probe7(s_axis_inputI_tdata[0]));
//    .probe8(m_axis_data_tready_ddc_I[0]),
//    .probe9(m_axis_data_tvalid_ddc_I[0]),
//    .probe10(m_axis_data_tlast_ddc_I[0]),
//    .probe11(m_axis_data_tdata_ddc_I[0]));
        
genvar i;
generate
    for (i = 0; i < `radio_receive_lane_number; i = i + 1)begin: radio_receive
    ddc ddc(
        .aclk(clk_500m),////if no interpolation clk_250m,if interpolation2 clk_500m
//        .aclk(clk_250m),
        .reset(reset),
        .s_axis_data_tvalid_I(s_axis_inputI_tvalid[i]),
        .s_axis_data_tvalid_Q(s_axis_inputQ_tvalid[i]),
        .s_axis_data_tlast_I(s_axis_inputI_tlast[i]),
        .s_axis_data_tlast_Q(s_axis_inputQ_tlast[i]),
        .s_axis_data_tready_I(s_axis_inputI_tready[i]),
        .s_axis_data_tready_Q(s_axis_inputQ_tready[i]),
        .s_axis_data_tdata_I(s_axis_inputI_tdata[i]),
        .s_axis_data_tdata_Q(s_axis_inputQ_tdata[i]),
//have decimation     
        .m_axis_data_tready_ddc_I(m_axis_data_tready_ddc_I[i]),
        .m_axis_data_tready_ddc_Q(m_axis_data_tready_ddc_Q[i]),
        .m_axis_data_tvalid_ddc_I(m_axis_data_tvalid_ddc_I[i]),
        .m_axis_data_tvalid_ddc_Q(m_axis_data_tvalid_ddc_Q[i]),
        .m_axis_data_tlast_ddc_I(m_axis_data_tlast_ddc_I[i]),
        .m_axis_data_tlast_ddc_Q(m_axis_data_tlast_ddc_Q[i]),
        .m_axis_data_tdata_ddc_I(m_axis_data_tdata_ddc_I[i]),
        .m_axis_data_tdata_ddc_Q(m_axis_data_tdata_ddc_Q[i])
//no decimation
//        .m_axis_data_tready_ddc_I(m_axis_outputI_tready[i]),
//        .m_axis_data_tready_ddc_Q(m_axis_outputQ_tready[i]),
//        .m_axis_data_tvalid_ddc_I(m_axis_outputI_tvalid[i]),
//        .m_axis_data_tvalid_ddc_Q(m_axis_outputQ_tvalid[i]),
//        .m_axis_data_tlast_ddc_I(m_axis_outputI_tlast[i]),
//        .m_axis_data_tlast_ddc_Q(m_axis_outputQ_tlast[i]),
//        .m_axis_data_tdata_ddc_I(m_axis_outputI_tdata[i]),
//        .m_axis_data_tdata_ddc_Q(m_axis_outputQ_tdata[i])
);     

decimation decimation(
    .clk_500m(clk_500m),
    .clk_250m(clk_250m),
    .reset(reset),
    .s_axis_data_tready_I(m_axis_data_tready_ddc_I[i]),
    .s_axis_data_tready_Q(m_axis_data_tready_ddc_Q[i]),
    .s_axis_data_tvalid_I(m_axis_data_tvalid_ddc_I[i]),
    .s_axis_data_tvalid_Q(m_axis_data_tvalid_ddc_Q[i]),
    .s_axis_data_tlast_I(m_axis_data_tlast_ddc_I[i]),
    .s_axis_data_tlast_Q(m_axis_data_tlast_ddc_Q[i]),
    .s_axis_data_tdata_I(m_axis_data_tdata_ddc_I[i]),
    .s_axis_data_tdata_Q(m_axis_data_tdata_ddc_Q[i]),
    
    .m_axis_data_tready_I(m_axis_outputI_tready[i]),
    .m_axis_data_tready_Q(m_axis_outputQ_tready[i]),
    .m_axis_data_tvalid_I(m_axis_outputI_tvalid[i]),
    .m_axis_data_tvalid_Q(m_axis_outputQ_tvalid[i]),
    .m_axis_data_tlast_I(m_axis_outputI_tlast[i]),      
    .m_axis_data_tlast_Q(m_axis_outputQ_tlast[i]),      
    .m_axis_data_tdata_I(m_axis_outputI_tdata[i]),
    .m_axis_data_tdata_Q(m_axis_outputQ_tdata[i]));  
        
//   dec2 dec2_I(
//    .aclk(clk_250m),
//    .aclk1(clk_500m),
//    .reset(reset),
//    .s_axis_data_tvalid(m_axis_data_tvalid_ddc_I[i]),
//    .s_axis_data_tlast(m_axis_data_tlast_ddc_I[i]),
//    .s_axis_data_tready(m_axis_data_tready_ddc_I[i]),
//    .s_axis_data_tdata(m_axis_data_tdata_ddc_I[i]),
//    .m_axis_data_tready(m_axis_outputI_tready[i]),
//    .m_axis_data_tvalid(m_axis_outputI_tvalid[i]),
//    .m_axis_data_tlast(m_axis_outputI_tlast[i]),
//    .m_axis_data_tdata(m_axis_outputI_tdata[i]));
    
//   dec2 dec2_Q(
//    .aclk(clk_250m),
//    .aclk1(clk_500m),
//    .reset(reset),
//    .s_axis_data_tvalid(m_axis_data_tvalid_ddc_Q[i]),
//    .s_axis_data_tlast(m_axis_data_tlast_ddc_Q[i]),
//    .s_axis_data_tready(m_axis_data_tready_ddc_Q[i]),
//    .s_axis_data_tdata(m_axis_data_tdata_ddc_Q[i]),
//    .m_axis_data_tready(m_axis_outputQ_tready[i]),
//    .m_axis_data_tvalid(m_axis_outputQ_tvalid[i]),
//    .m_axis_data_tlast(m_axis_outputQ_tlast[i]),
//    .m_axis_data_tdata(m_axis_outputQ_tdata[i]));
end
endgenerate
    

//genvar j;
//generate
//    for (j = 0; j < 8; j = j + 1)begin: decimation
//decimation decimation(
//    .aclk(clk_500m),
//    .aclk1(clk_250m),
//    .reset(reset),
//    .s_axis_data_tready_I(m_axis_data_tready_ddc_I[j]),
//    .s_axis_data_tready_Q(m_axis_data_tready_ddc_Q[j]),
//    .s_axis_data_tvalid_I(m_axis_data_tvalid_ddc_I[j]),
//    .s_axis_data_tvalid_Q(m_axis_data_tvalid_ddc_Q[j]),
////    .s_axis_data_tready(),
//    .s_axis_data_tdata_I(m_axis_data_tdata_ddc_I[j]),
//    .s_axis_data_tdata_Q(m_axis_data_tdata_ddc_Q[j]),
    
//    .m_axis_data_tready_ddc_I(m_axis_outputI_tready[j]),
//    .m_axis_data_tready_ddc_Q(m_axis_outputQ_tready[j]),
//    .m_axis_data_tvalid_ddc_I(m_axis_outputI_tvalid[j]),
//    .m_axis_data_tvalid_ddc_Q(m_axis_outputQ_tvalid[j]),
//    .m_axis_data_tdata_ddc_I(m_axis_outputI_tdata[j]),
//    .m_axis_data_tdata_ddc_Q(m_axis_outputQ_tdata[j]));
//end
//endgenerate
      
//genvar i,j;
//generate
//    for (i = 0; i < 8; i = i + 1)begin:layer1_transmit_laneI
//        assign m_axis_outputI_tvalid[i] = s_axis_inputI_tvalid[i];
//        assign m_axis_outputQ_tvalid[i] = s_axis_inputQ_tvalid[i];
//        assign m_axis_outputI_tdata[i] = s_axis_inputI_tdata[i];
//        assign m_axis_outputQ_tdata[i] = s_axis_inputQ_tdata[i];
//end
//endgenerate  

endmodule
