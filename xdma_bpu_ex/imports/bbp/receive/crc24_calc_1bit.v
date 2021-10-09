`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd_thz
// Engineer: caohy
// 
// Create Date: 2020/02/25 14:11:21
// Design Name: 
// Module Name: crc24_calc_1bit
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
module crc24_calc_1bit
(
    input               clk     ,
    input               rst_n   ,
    input               init    ,
    input               valid   ,
    input               data    ,
    output  reg [23:0]  crc
);


parameter CRC_INIT_VALUE = 24'h0;


always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
        crc <= CRC_INIT_VALUE;
    else if (init)
        crc <= CRC_INIT_VALUE;
    else if (valid)
        crc <= nextCRC24_D1(data, crc);
end


  // polynomial: x^24 + x^23 + x^18 + x^17 + x^14 + x^11 + x^10 + x^7 + x^6 + x^5 + x^4 + x^3 + x^1 + 1
  // data width: 1
  // convention: the first serial bit is D[0]
  function [23:0] nextCRC24_D1;

    input Data;
    input [23:0] crc;
    reg [0:0] d;
    reg [23:0] c;
    reg [23:0] newcrc;
  begin
    d[0] = Data;
    c = crc;

    newcrc[0] = d[0] ^ c[23];
    newcrc[1] = d[0] ^ c[0] ^ c[23];
    newcrc[2] = c[1];
    newcrc[3] = d[0] ^ c[2] ^ c[23];
    newcrc[4] = d[0] ^ c[3] ^ c[23];
    newcrc[5] = d[0] ^ c[4] ^ c[23];
    newcrc[6] = d[0] ^ c[5] ^ c[23];
    newcrc[7] = d[0] ^ c[6] ^ c[23];
    newcrc[8] = c[7];
    newcrc[9] = c[8];
    newcrc[10] = d[0] ^ c[9] ^ c[23];
    newcrc[11] = d[0] ^ c[10] ^ c[23];
    newcrc[12] = c[11];
    newcrc[13] = c[12];
    newcrc[14] = d[0] ^ c[13] ^ c[23];
    newcrc[15] = c[14];
    newcrc[16] = c[15];
    newcrc[17] = d[0] ^ c[16] ^ c[23];
    newcrc[18] = d[0] ^ c[17] ^ c[23];
    newcrc[19] = c[18];
    newcrc[20] = c[19];
    newcrc[21] = c[20];
    newcrc[22] = c[21];
    newcrc[23] = d[0] ^ c[22] ^ c[23];
    nextCRC24_D1 = newcrc;
  end
  endfunction


endmodule
