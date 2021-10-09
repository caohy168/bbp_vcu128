`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd_thz
// Engineer: caohy
// 
// Create Date: 2020/02/25 14:11:21
// Design Name: 
// Module Name: crc24_insert_1bit
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
module crc24_insert_1bit
(
    input           clk     ,
    input           rst_n   ,
    input           vld_i   ,
    input           sop_i   ,
    input           eop_i   ,
    input           data_i  ,
    output  reg     vld_o   ,
    output  reg     sop_o   ,
    output  reg     eop_o   ,
    output  reg     data_o
);


wire    [23:0]  crc         ;
wire    [23:0]  crc_result  ;
reg     [4:0]   crc_ins_cnt ;
reg             crc_ins_flag;


crc24_calc_1bit u_crc24_calc
(
    .clk        (clk        ),
    .rst_n      (rst_n      ),
    .init       (eop_o      ),
    .valid      (vld_i      ),
    .data       (data_i     ),
    .crc        (crc        )
);


genvar i;
generate
    for (i = 0; i < 24; i = i + 1)
    begin : crc_bit_reverse
        assign crc_result[i] = crc[23-i];
    end
endgenerate


always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
        crc_ins_cnt <= 5'h0;
    else if (vld_i & eop_i)
        crc_ins_cnt <= 5'h0;
    else if (crc_ins_cnt < 5'd23)
        crc_ins_cnt <= crc_ins_cnt + 1'b1;
end

always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
        crc_ins_flag <= 1'b0;
    else if (vld_i & eop_i)
        crc_ins_flag <= 1'b1;
    else if (crc_ins_flag & crc_ins_cnt < 5'd23)
        crc_ins_flag <= 1'b1;
    else
        crc_ins_flag <= 1'b0;
end

always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
        vld_o <= 1'b0;
    else if (vld_i | crc_ins_flag)
        vld_o <= 1'b1;
    else
        vld_o <= 1'b0;
end

always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
        sop_o <= 1'b0;
    else if (vld_i & sop_i)
        sop_o <= 1'b1;
    else
        sop_o <= 1'b0;
end

always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
        eop_o <= 1'b0;
    else if (crc_ins_flag & (crc_ins_cnt == 5'd23))
        eop_o <= 1'b1;
    else
        eop_o <= 1'b0;
end

always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
        data_o <= 1'b0;
    else if (vld_i)
        data_o <= data_i;
    else if (crc_ins_flag)
        data_o <= crc_result[crc_ins_cnt];
end


endmodule