`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd_thz
// Engineer: caohuiyang
// 
// Create Date: 2020/03/10 12:38:15
// Design Name: Telecommunications processing unit
// Module Name: layer1_transmit
// Project Name: BFB(base frequency band) search group
// Target Devices: xcvu9p
// Tool Versions: vivado 2020.2
// Description: 
// layer1 transnit module of the system
// Dependencies: 
// Matlab simulation
// Revision:V1.0
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
//parameter layer1_transmit_lane_number = 8;//2--lane2;4--lane4;8--lane8
`include "bbp_parameter.vh"
module layer1_transmit(
input clk,reset,

    output logic m_axis_outputI_tvalid[8],
    input  m_axis_outputI_tready[8],
    output logic [15:0]m_axis_outputI_tdata[8],
    output logic m_axis_outputI_tlast[8],
    output logic m_axis_outputQ_tvalid[8],
    input  m_axis_outputQ_tready[8],
    output logic [15:0]m_axis_outputQ_tdata[8],
    output logic m_axis_outputQ_tlast[8],
    
    output logic m_axis_outputI_tvalid_8[8],
    input  m_axis_outputI_tready_8[8],
    output logic [7:0]m_axis_outputI_tdata_8[8],
    output logic m_axis_outputI_tlast_8[8],
    output logic m_axis_outputQ_tvalid_8[8],
    input  m_axis_outputQ_tready_8[8],
    output logic [7:0]m_axis_outputQ_tdata_8[8],
    output logic m_axis_outputQ_tlast_8[8],
    
    output logic m_axis_outputI_tvalid_qam256[8],
    input m_axis_outputI_tready_qam256[8],
    output logic [15:0]m_axis_outputI_tdata_qam256[8],
    output logic m_axis_outputI_tlast_qam256[8],
    output logic m_axis_outputQ_tvalid_qam256[8],
    input m_axis_outputQ_tready_qam256[8],
    output logic [15:0]m_axis_outputQ_tdata_qam256[8],
    output logic m_axis_outputQ_tlast_qam256[8],
    
    output logic m_axis_outputI_tvalid_qam1024[8],
    input m_axis_outputI_tready_qam1024[8],
    output logic [15:0]m_axis_outputI_tdata_qam1024[8],
    output logic m_axis_outputI_tlast_qam1024[8],
    output logic m_axis_outputQ_tvalid_qam1024[8],
    input m_axis_outputQ_tready_qam1024[8],
    output logic [15:0]m_axis_outputQ_tdata_qam1024[8],
    output logic m_axis_outputQ_tlast_qam1024[8],

`ifdef apsk
    output logic m_axis_outputI_tvalid_a[8],
//    input  m_axis_outputI_tready_a[8],
    output logic [31:0]m_axis_outputI_tdata_a[8],
//    output logic m_axis_outputI_tlast_a[8],
    output logic m_axis_outputQ_tvalid_a[8],
//    input  m_axis_outputQ_tready_a[8],
    output logic [31:0]m_axis_outputQ_tdata_a[8],
//    output logic m_axis_outputQ_tlast_a[8],
`endif

    input s_axis_input_tvalid,
    output logic s_axis_input_tready,
    input [63:0]s_axis_input_tdata,
    input s_axis_input_tlast
);

logic mac_block_data_tvalid[8];
logic[7:0]mac_block_data[8];
logic mac_block_data_tlast[8];
logic crc_generator_tready[8];
mac_block mac_block(
.clk(clk),
.reset(reset),

.s_axis_input_tvalid(s_axis_input_tvalid),
.s_axis_input_tready(s_axis_input_tready),
.s_axis_input_tdata(s_axis_input_tdata),
.s_axis_input_tlast(s_axis_input_tlast),

.m_axis_output_tvalid(mac_block_data_tvalid),
.m_axis_output_tready(crc_generator_tready),
.m_axis_output_tdata(mac_block_data),
.m_axis_output_tlast(mac_block_data_tlast)
    );
    
logic [7:0]crc_gen_data[8];
logic crc_gen_data_tvalid[8];
logic crc_gen_data_tlast[8];
logic rs_enc_tready[8];
logic [7:0]rs_enc_data[8];
logic rs_enc_data_tvalid[8];
logic rs_enc_data_tlast[8];
logic interleaver_tready[8];
logic [7:0]interleaver_data[8];
logic interleaver_data_tvalid[8];
logic interleaver_data_tlast[8];
logic scrambler_tready[8];
logic [7:0]scrambler_data[8];
logic scrambler_tvalid[8];
logic scrambler_tlast[8]; 
logic modulate_tready[8];

genvar i;
generate
    for (i = 0; i < `layer1_transmit_lane_number; i = i + 1)begin:layer1_transmit_lane
        channel_codes channel_codes(
            .clk(clk),
            .reset(reset),
            
            .s_axis_input_tvalid(mac_block_data_tvalid[i]),
            .s_axis_input_tready(crc_generator_tready[i]),
            .s_axis_input_tdata(mac_block_data[i]),
            .s_axis_input_tlast(mac_block_data_tlast[i]),
   
            .m_axis_output_tdata (rs_enc_data[i]),       
            .m_axis_output_tvalid(rs_enc_data_tvalid[i]),
            .m_axis_output_tready(interleaver_tready[i]),
            .m_axis_output_tlast (rs_enc_data_tlast[i]));
        
        energy_balance energy_balance(
            .clk(clk),
            .reset(reset),
        
            .s_axis_input_tvalid(rs_enc_data_tvalid[i]),
            .s_axis_input_tready(interleaver_tready[i]),
            .s_axis_input_tdata(rs_enc_data[i]),
            .s_axis_input_tlast(rs_enc_data_tlast[i]),
    
            .m_axis_output_tvalid(scrambler_tvalid[i]),
            .m_axis_output_tready(modulate_tready[i]),
            .m_axis_output_tdata(scrambler_data[i]),
            .m_axis_output_tlast(scrambler_tlast[i]));  
    
//        interleaver interleaver(
//            .clk(clk),
//            .reset(reset),
        
//            .s_axis_input_tvalid(rs_enc_data_tvalid[i]),
//            .s_axis_input_tready(interleaver_tready[i]),
//            .s_axis_input_tdata(rs_enc_data[i]),
//            .s_axis_input_tlast(rs_enc_data_tlast[i]),
        
//            .m_axis_output_tvalid(interleaver_data_tvalid[i]),
//            .m_axis_output_tready(scrambler_tready[i]),
//            .m_axis_output_tdata(interleaver_data[i]),
//            .m_axis_output_tlast(interleaver_data_tlast[i])
//            );
        
//        scrambler scrambler(
//            .clk(clk),
//            .reset(reset),
            
//            .s_axis_input_tvalid(interleaver_data_tvalid[i]),
//            .s_axis_input_tready(scrambler_tready[i]),
//            .s_axis_input_tdata(interleaver_data[i]),
//            .s_axis_input_tlast(interleaver_data_tlast[i]),
            
//            .m_axis_output_tvalid(scrambler_tvalid[i]),
//            .m_axis_output_tready(modulate_tready[i]),
//            .m_axis_output_tdata(scrambler_data[i]),
//            .m_axis_output_tlast(scrambler_tlast[i]));  

        modulation modulation(
            .clk(clk),
            .reset(reset),
            
            .s_axis_input_tvalid(scrambler_tvalid[i]),
            .s_axis_input_tready(modulate_tready[i] ),
            .s_axis_input_tdata (scrambler_data[i]  ),
            .s_axis_input_tlast (scrambler_tlast[i] ),
//radio loop
            .m_axis_outputI_tvalid_8(m_axis_outputI_tvalid_8[i]),
            .m_axis_outputI_tready_8(m_axis_outputI_tready_8[i]),
            .m_axis_outputI_tdata_8(m_axis_outputI_tdata_8[i]),
            .m_axis_outputI_tlast_8(m_axis_outputI_tlast_8[i]),
            .m_axis_outputQ_tvalid_8(m_axis_outputQ_tvalid_8[i]),
            .m_axis_outputQ_tready_8(m_axis_outputQ_tready_8[i]),
            .m_axis_outputQ_tdata_8(m_axis_outputQ_tdata_8[i]),
            .m_axis_outputQ_tlast_8(m_axis_outputQ_tlast_8[i]),
//layer1 loop
            .m_axis_outputI_tvalid(m_axis_outputI_tvalid[i]),
            .m_axis_outputI_tready(m_axis_outputI_tready[i]),
            .m_axis_outputI_tdata(m_axis_outputI_tdata[i]),
            .m_axis_outputI_tlast(m_axis_outputI_tlast[i]),
            .m_axis_outputQ_tvalid(m_axis_outputQ_tvalid[i]),
            .m_axis_outputQ_tready(m_axis_outputQ_tready[i]),
            .m_axis_outputQ_tdata(m_axis_outputQ_tdata[i]),
            .m_axis_outputQ_tlast(m_axis_outputQ_tlast[i]),

            .m_axis_outputI_tvalid_qam256(m_axis_outputI_tvalid_qam256[i]),
            .m_axis_outputI_tready_qam256(m_axis_outputI_tready_qam256[i]),
            .m_axis_outputI_tdata_qam256 (m_axis_outputI_tdata_qam256[i]),
            .m_axis_outputI_tlast_qam256 (m_axis_outputI_tlast_qam256[i]),
            .m_axis_outputQ_tvalid_qam256(m_axis_outputQ_tvalid_qam256[i]),
            .m_axis_outputQ_tready_qam256(m_axis_outputQ_tready_qam256[i]),
            .m_axis_outputQ_tdata_qam256 (m_axis_outputQ_tdata_qam256[i]),
            .m_axis_outputQ_tlast_qam256 (m_axis_outputQ_tlast_qam256[i]),
            
            .m_axis_outputI_tvalid_qam1024(m_axis_outputI_tvalid_qam1024[i]),
            .m_axis_outputI_tready_qam1024(m_axis_outputI_tready_qam1024[i]),
            .m_axis_outputI_tdata_qam1024 (m_axis_outputI_tdata_qam1024[i]),
            .m_axis_outputI_tlast_qam1024 (m_axis_outputI_tlast_qam1024[i]),
            .m_axis_outputQ_tvalid_qam1024(m_axis_outputQ_tvalid_qam1024[i]),
            .m_axis_outputQ_tready_qam1024(m_axis_outputQ_tready_qam1024[i]),
            .m_axis_outputQ_tdata_qam1024 (m_axis_outputQ_tdata_qam1024[i]),
            .m_axis_outputQ_tlast_qam1024 (m_axis_outputQ_tlast_qam1024[i]),
            
            .m_axis_outputI_tvalid_apsk64(),
            .m_axis_outputI_tready_apsk64(),
            .m_axis_outputI_tdata_apsk64 (),
            .m_axis_outputI_tlast_apsk64 (),
            .m_axis_outputQ_tvalid_apsk64(),
            .m_axis_outputQ_tready_apsk64(),
            .m_axis_outputQ_tdata_apsk64 (),
            .m_axis_outputQ_tlast_apsk64 ());


//        qam qam(
//            .clk(clk),
//            .reset(reset),
            
//            .s_axis_input_tvalid(scrambler_tvalid[i]),
//            .s_axis_input_tready(modulate_tready[i] ),
//            .s_axis_input_tdata (scrambler_data[i]  ),
//            .s_axis_input_tlast (scrambler_tlast[i] ),
            
//            .m_axis_outputI_tvalid(m_axis_outputI_tvalid[i]),
//            .m_axis_outputI_tready(m_axis_outputI_tready[i]),
//            .m_axis_outputI_tdata(m_axis_outputI_tdata[i]),
//            .m_axis_outputI_tlast(m_axis_outputI_tlast[i]),
//            .m_axis_outputQ_tvalid(m_axis_outputQ_tvalid[i]),
//            .m_axis_outputQ_tready(m_axis_outputQ_tready[i]),
//            .m_axis_outputQ_tdata(m_axis_outputQ_tdata[i]),
//            .m_axis_outputQ_tlast(m_axis_outputQ_tlast[i]),
            
//            .m_axis_outputI_tvalid_8(m_axis_outputI_tvalid_8[i]),
//            .m_axis_outputI_tready_8(m_axis_outputI_tready_8[i]),
//            .m_axis_outputI_tdata_8(m_axis_outputI_tdata_8[i]),
//            .m_axis_outputI_tlast_8(m_axis_outputI_tlast_8[i]),
//            .m_axis_outputQ_tvalid_8(m_axis_outputQ_tvalid_8[i]),
//            .m_axis_outputQ_tready_8(m_axis_outputQ_tready_8[i]),
//            .m_axis_outputQ_tdata_8(m_axis_outputQ_tdata_8[i]),
//            .m_axis_outputQ_tlast_8(m_axis_outputQ_tlast_8[i]),
            
//            .m_axis_outputI_tvalid_qam256(m_axis_outputI_tvalid_qam256[i]),
//            .m_axis_outputI_tready_qam256(m_axis_outputI_tready_qam256[i]),
//            .m_axis_outputI_tdata_qam256 (m_axis_outputI_tdata_qam256[i]),
//            .m_axis_outputI_tlast_qam256 (m_axis_outputI_tlast_qam256[i]),
//            .m_axis_outputQ_tvalid_qam256(m_axis_outputQ_tvalid_qam256[i]),
//            .m_axis_outputQ_tready_qam256(m_axis_outputQ_tready_qam256[i]),
//            .m_axis_outputQ_tdata_qam256 (m_axis_outputQ_tdata_qam256[i]),
//            .m_axis_outputQ_tlast_qam256 (m_axis_outputQ_tlast_qam256[i]),
            
//            .m_axis_outputI_tvalid_qam1024(m_axis_outputI_tvalid_qam1024[i]),
//            .m_axis_outputI_tready_qam1024(m_axis_outputI_tready_qam1024[i]),
//            .m_axis_outputI_tdata_qam1024 (m_axis_outputI_tdata_qam1024[i]),
//            .m_axis_outputI_tlast_qam1024 (m_axis_outputI_tlast_qam1024[i]),
//            .m_axis_outputQ_tvalid_qam1024(m_axis_outputQ_tvalid_qam1024[i]),
//            .m_axis_outputQ_tready_qam1024(m_axis_outputQ_tready_qam1024[i]),
//            .m_axis_outputQ_tdata_qam1024 (m_axis_outputQ_tdata_qam1024[i]),
//            .m_axis_outputQ_tlast_qam1024 (m_axis_outputQ_tlast_qam1024[i])
            
//            );     

//    `ifdef apsk
//        apskmod_call apskmod_call(
//            .clk(clk),
//            .reset(reset),
          
//            .s_axis_input_tvalid(rs_enc_data_tvalid[i]),
//            .s_axis_input_tready( ),
//            .s_axis_input_tdata (rs_enc_data[i]  ),
//            .s_axis_input_tlast (rs_enc_data_tlast[i] ),
            
//            .m_axis_outputI_tvalid(m_axis_outputI_tvalid_a[i]),
//            .m_axis_outputI_tdata(m_axis_outputI_tdata_a[i]),
//            .m_axis_outputQ_tvalid(m_axis_outputQ_tvalid_a[i]),
//            .m_axis_outputQ_tdata(m_axis_outputQ_tdata_a[i]));
//    `endif                   
         
end
endgenerate      
          
endmodule
