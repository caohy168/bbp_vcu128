// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps

`define TV_OUT_recd_out_TDATA "./impl_rtl.encode_rs.autotvout_recd_out.dat"

`define AUTOTB_TRANSACTION_NUM 1

module AESL_axi_s_recd_out (
    input clk,
    input reset,
    input [32 - 1:0] TRAN_recd_out_TDATA,
    input TRAN_recd_out_TVALID,
    output TRAN_recd_out_TREADY,
    input ready,
    input done,
    output [31:0] transaction);

    wire TRAN_recd_out_TVALID_temp;
    wire recd_out_TDATA_full;
    wire recd_out_TDATA_empty;
    reg recd_out_TDATA_write_en;
    reg [32 - 1:0] recd_out_TDATA_write_data;
    reg recd_out_TDATA_read_en;
    wire [32 - 1:0] recd_out_TDATA_read_data;
    
    fifo #(255, 32) fifo_recd_out_TDATA (
        .reset(1'b0),
        .write_clock(clk),
        .write_en(recd_out_TDATA_write_en),
        .write_data(recd_out_TDATA_write_data),
        .read_clock(clk),
        .read_en(recd_out_TDATA_read_en),
        .read_data(recd_out_TDATA_read_data),
        .full(recd_out_TDATA_full),
        .empty(recd_out_TDATA_empty));
    
    always @ (*) begin
        recd_out_TDATA_write_en <= TRAN_recd_out_TVALID;
        recd_out_TDATA_write_data <= TRAN_recd_out_TDATA;
        recd_out_TDATA_read_en <= 0;
    end
    assign TRAN_recd_out_TVALID = TRAN_recd_out_TVALID_temp;

    
    assign TRAN_recd_out_TREADY = ~(recd_out_TDATA_full);
    
    function is_blank_char(input [7:0] in_char);
        if (in_char == " " || in_char == "\011" || in_char == "\012" || in_char == "\015") begin
            is_blank_char = 1;
        end else begin
            is_blank_char = 0;
        end
    endfunction
    
    function [191:0] read_token(input integer fp);
        integer ret;
        begin
            read_token = "";
                    ret = 0;
                    ret = $fscanf(fp,"%s",read_token);
        end
    endfunction
    
    function [191:0] rm_0x(input [191:0] token);
        reg [191:0] token_tmp;
        integer i;
        begin
            token_tmp = "";
            for (i = 0; token[15:0] != "0x"; token = token >> 8) begin
                token_tmp = (token[7:0] << (8 * i)) | token_tmp;
                i = i + 1;
            end
            rm_0x = token_tmp;
        end
    endfunction
    
    reg done_1;
    
    always @ (posedge clk or reset) begin
        if (~reset) begin
            done_1 <= 0;
        end else begin
            done_1 <= done;
        end
    end
    
    reg [31:0] transaction_save_recd_out_TDATA;
    
    assign transaction = transaction_save_recd_out_TDATA;
    
    initial begin : AXI_stream_receiver_recd_out_TDATA
        integer fp;
        reg [32 - 1:0] data;
        reg [8 * 5:1] str;
        
        transaction_save_recd_out_TDATA = 0;
        fifo_recd_out_TDATA.clear();
        wait (reset === 1);
        forever begin
            @ (negedge clk);
            if (done_1 == 1) begin
                fp = $fopen(`TV_OUT_recd_out_TDATA, "a");
                if (fp == 0) begin // Failed to open file
                    $display("ERROR: Failed to open file \"%s\"!", `TV_OUT_recd_out_TDATA);
                    $finish;
                end
                $fdisplay(fp, "[[transaction]] %d", transaction_save_recd_out_TDATA);
                while (~fifo_recd_out_TDATA.empty) begin
                    fifo_recd_out_TDATA.pop(data);
                    $fdisplay(fp, "0x%x", data);
                end
                $fdisplay(fp, "[[/transaction]]");
                transaction_save_recd_out_TDATA = transaction_save_recd_out_TDATA + 1;
                fifo_recd_out_TDATA.clear();
                $fclose(fp);
            end
        end
    end

endmodule
