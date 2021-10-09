`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: htgd_thz
// Engineer: caohuiayng  
// 
// Create Date: 11/08/2020 06:39:03 PM
// Design Name: 
// Module Name: bbp_parameter
// Project Name: 
// Target Devices: vcu128
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
`define mux_number   8
//2--lane2,4--lane4,8--lane8.
//The parameter(in datastream_transfer.sv)describe support the number of lane for 10g xhaul plan.
`define layer1_transmit_lane_number   8
`define layer1_receive_lane_number   8
//2--lane2;4--lane4;8--lane8.
//The parameter(layer1_transmit.sv)describe the number of layer1 transmit lane for 10g xhaul plan.
`define radio_transmit_lane_number   8
`define radio_receive_lane_number   8
//2--lane2;4--lane4;8--lane8.
//The parameter(radio_transmit.sv)describe the number of radio transmit lane for 10g xhaul plan.
`define self_check
//`define ethernet80//default is 10Gbps,if define this macro the design can support 80Gbps 8 lanes * 8 groups 
`define groups 1  //if nodefine ethernet10 groups use 1, if define ethernet80 groups use 8.
`define radio
//`define empty_rs
`define self_rs
`define qam
//`define apsk
//`define pcie_endpoint
//`define optiacal_10g
//10g optiacal interface be used to acess to mainnetwork server. pcie interface be used to satellite communication center backboard.
`define dma_send_pkg_mun 8
`define dma_receive_pkg_mun 8