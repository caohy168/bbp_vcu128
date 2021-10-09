`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd
// Engineer: caohuiyang
// 
// Create Date: 2020/03/02 13:12:24
// Design Name: 
// Module Name: eqam
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
module eqam(
input clk,reset,

input  s_axis_inputI_tvalid,
output logic s_axis_inputI_tready,
input  [15:0]s_axis_inputI_tdata,
input  s_axis_inputI_tlast,
input  s_axis_inputQ_tvalid,
output logic s_axis_inputQ_tready,
input  [15:0]s_axis_inputQ_tdata,
input  s_axis_inputQ_tlast,

input  s_axis_inputI_tvalid_qam256,
output logic s_axis_inputI_tready_qam256,
input  [15:0]s_axis_inputI_tdata_qam256,
input  s_axis_inputI_tlast_qam256,
input  s_axis_inputQ_tvalid_qam256,
output logic s_axis_inputQ_tready_qam256,
input  [15:0]s_axis_inputQ_tdata_qam256,
input  s_axis_inputQ_tlast_qam256,

input  s_axis_inputI_tvalid_qam1024,
output logic s_axis_inputI_tready_qam1024,
input  [15:0]s_axis_inputI_tdata_qam1024,
input  s_axis_inputI_tlast_qam1024,
input  s_axis_inputQ_tvalid_qam1024,
output logic s_axis_inputQ_tready_qam1024,
input  [15:0]s_axis_inputQ_tdata_qam1024,
input  s_axis_inputQ_tlast_qam1024,

input  s_axis_inputI_tvalid_8,
output logic s_axis_inputI_tready_8,
input  [7:0]s_axis_inputI_tdata_8,
input  s_axis_inputI_tlast_8,
input  s_axis_inputQ_tvalid_8,
output logic s_axis_inputQ_tready_8,
input  [7:0]s_axis_inputQ_tdata_8,
input  s_axis_inputQ_tlast_8,

output logic m_axis_output_tvalid,
input m_axis_output_tready,
output logic[7:0]m_axis_output_tdata,
output logic m_axis_output_tlast,

output logic m_axis_output_tvalid_qam256,
input m_axis_output_tready_qam256,
output logic[7:0]m_axis_output_tdata_qam256,
output logic m_axis_output_tlast_qam256,

output logic m_axis_output_tvalid_qam1024,
input m_axis_output_tready_qam1024,
output logic[7:0]m_axis_output_tdata_qam1024,
output logic m_axis_output_tlast_qam1024
    );
//assign s_axis_inputI_tready_8 =1;
//assign s_axis_inputQ_tready_8 =1;
    
logic[15:0]tready_state; 
assign s_axis_inputI_tready = (tready_state==2)?0:1;
assign s_axis_inputQ_tready = (tready_state==2)?0:1;
always @(posedge clk)begin
    if (reset) begin
      tready_state=0;
    end
    else begin
      case (tready_state)
         0:begin
            if (s_axis_inputI_tlast && s_axis_inputI_tvalid)
              tready_state <=1;
            else
              tready_state <=0;end
         1:begin
            if (!s_axis_inputI_tvalid)
            tready_state <=2;
            else
            tready_state <=1;end
         2:begin
            if(m_axis_output_tlast)tready_state<=0;
            else tready_state<=2;end 
      endcase
      end end
      
logic[15:0]tready_state_8; 
assign s_axis_inputI_tready_8 = (tready_state_8==2)?0:1;
assign s_axis_inputQ_tready_8 = (tready_state_8==2)?0:1;
always @(posedge clk)begin
    if (reset) begin
      tready_state_8=0;
    end
    else begin
      case (tready_state_8)
         0:begin
            if (s_axis_inputI_tlast_8 && s_axis_inputI_tvalid_8)
              tready_state_8 <=1;
            else
              tready_state_8 <=0;end
         1:begin
            if (!s_axis_inputI_tvalid_8)
            tready_state_8 <=2;
            else
            tready_state_8 <=1;end
         2:begin
            if(m_axis_output_tlast)tready_state_8<=0;
            else tready_state_8<=2;end 
      endcase
      end end
      
logic[15:0]tready_state_qam256; 
assign s_axis_inputI_tready_qam256 = (tready_state_qam256==2)?0:1;
assign s_axis_inputQ_tready_qam256 = (tready_state_qam256==2)?0:1;
always @(posedge clk)begin
    if (reset) begin
      tready_state_qam256=0;
    end
    else begin
      case (tready_state_qam256)
         0:begin
            if (s_axis_inputI_tlast_qam256 && s_axis_inputI_tvalid_qam256)
              tready_state_qam256 <=1;
            else
              tready_state_qam256 <=0;end
         1:begin
            if (!s_axis_inputI_tvalid_qam256)
            tready_state_qam256 <=2;
            else
            tready_state_qam256 <=1;end
         2:begin
            if(m_axis_output_tlast_qam256)tready_state_qam256<=0;
            else tready_state_qam256<=2;end 
      endcase
      end end
      
logic[15:0]tready_state_qam1024; 
assign s_axis_inputI_tready_qam1024 = (tready_state_qam1024==2)?0:1;
assign s_axis_inputQ_tready_qam1024 = (tready_state_qam1024==2)?0:1;
always @(posedge clk)begin
    if (reset) begin
      tready_state_qam1024=0;
    end
    else begin
      case (tready_state_qam1024)
         0:begin
            if (s_axis_inputI_tlast_qam1024 && s_axis_inputI_tvalid_qam1024)
              tready_state_qam1024 <=1;
            else
              tready_state_qam1024 <=0;end
         1:begin
            if (!s_axis_inputI_tvalid_qam1024)
            tready_state_qam1024 <=2;
            else
            tready_state_qam1024 <=1;end
         2:begin
            if(m_axis_output_tlast_qam1024)tready_state_qam1024<=0;
            else tready_state_qam1024<=2;end 
      endcase
      end end
      
logic signed[15:0]Isymbol[340:1];
logic signed[15:0]Qsymbol[340:1];   
logic signed[7:0]Isymbol_8[340:1];
logic signed[7:0]Qsymbol_8[340:1];   
logic signed[15:0]Isymbol_qam256[255:1];
logic signed[15:0]Qsymbol_qam256[255:1];   
logic signed[15:0]Isymbol_qam1024[204:1];
logic signed[15:0]Qsymbol_qam1024[204:1];   

logic [15:0]axi_inI_i=1;
logic [15:0]axi_inQ_i=1;
logic [15:0]axi_inI_i8=1;
logic [15:0]axi_inQ_i8=1;
logic [15:0]axi_inI_i_qam256=1;
logic [15:0]axi_inQ_i_qam256=1;
logic [15:0]axi_inI_i_qam1024=1;
logic [15:0]axi_inQ_i_qam1024=1;

always@(posedge clk)
    begin
        if(s_axis_inputI_tvalid)begin
            if(axi_inI_i<340)axi_inI_i<=axi_inI_i+1;
            else axi_inI_i<=1;
            Isymbol[axi_inI_i]<=s_axis_inputI_tdata;
           end
        else axi_inI_i<=1;
        if(s_axis_inputQ_tvalid)begin
            if(axi_inQ_i<340)axi_inQ_i<=axi_inQ_i+1;
            else axi_inQ_i<=1;
            Qsymbol[axi_inQ_i]<=s_axis_inputQ_tdata;
           end
        else axi_inQ_i<=1;
        
        if(s_axis_inputI_tvalid_8)begin
            if(axi_inI_i8<340)axi_inI_i8<=axi_inI_i8+1;
            else axi_inI_i8<=1;
            Isymbol_8[axi_inI_i8]<=s_axis_inputI_tdata_8;
           end
        else axi_inI_i8<=1;
        if(s_axis_inputQ_tvalid_8)begin
            if(axi_inQ_i8<340)axi_inQ_i8<=axi_inQ_i8+1;
            else axi_inQ_i8<=1;
            Qsymbol_8[axi_inQ_i8]<=s_axis_inputQ_tdata_8;
           end
        else axi_inQ_i8<=1;
        
        if(s_axis_inputI_tvalid_qam1024)begin
            if(axi_inI_i_qam1024<204)axi_inI_i_qam1024<=axi_inI_i_qam1024+1;
            else axi_inI_i_qam1024<=1;
            Isymbol_qam1024[axi_inI_i_qam1024]<=s_axis_inputI_tdata_qam1024;
           end
        else axi_inI_i_qam1024<=1;
        if(s_axis_inputQ_tvalid_qam1024)begin
            if(axi_inQ_i_qam1024<204)axi_inQ_i_qam1024<=axi_inQ_i_qam1024+1;
            else axi_inQ_i_qam1024<=1;
            Qsymbol_qam1024[axi_inQ_i_qam1024]<=s_axis_inputQ_tdata_qam1024;
           end
        else axi_inQ_i_qam1024<=1;
    end  
    
logic [6:1]qam_gray_bin[340:1];   
logic [8:1]qam256_bin[255:1];
logic [10:1]qam1024_bin[204:1];
genvar i;
generate
    for (i = 1; i <=340; i = i + 1)begin: qam_gray_bin_process
        always@(*)begin
//            case(Isymbol[i])//16bit I/Q input
            case(Isymbol_8[i])//8bit I/Q input
            -7:qam_gray_bin[i][6:4]<=3'b000;
            -5:qam_gray_bin[i][6:4]<=3'b001;
            -1:qam_gray_bin[i][6:4]<=3'b010;
            -3:qam_gray_bin[i][6:4]<=3'b011;
            +7:qam_gray_bin[i][6:4]<=3'b100;
            +5:qam_gray_bin[i][6:4]<=3'b101;
            +1:qam_gray_bin[i][6:4]<=3'b110;
            +3:qam_gray_bin[i][6:4]<=3'b111;
            endcase
//            case(Qsymbol[i])//16bit I/Q input
            case(Qsymbol_8[i])//8bit I/Q input
            +7:qam_gray_bin[i][3:1]<=3'b000;
            +5:qam_gray_bin[i][3:1]<=3'b001;
            +1:qam_gray_bin[i][3:1]<=3'b010;
            +3:qam_gray_bin[i][3:1]<=3'b011;
            -7:qam_gray_bin[i][3:1]<=3'b100;
            -5:qam_gray_bin[i][3:1]<=3'b101;
            -1:qam_gray_bin[i][3:1]<=3'b110;
            -3:qam_gray_bin[i][3:1]<=3'b111;
            endcase
            end end
endgenerate   

//logic signed[7:0]IEncmodel_qam256[0:255]={
//-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,
//-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,    
//-9,-9,-9,-9,-9,-9,-9,-9,-9,-9,-9,-9,-9,-9,-9,-9,   
//-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,
//-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,    
//-3,-3,-3,-3,-3,-3,-3,-3,-3,-3,-3,-3,-3,-3,-3,-3,
//-7,-7,-7,-7,-7,-7,-7,-7,-7,-7,-7,-7,-7,-7,-7,-7,
//-5,-5,-5,-5,5,-5,-5,-5,-5,-5,-5,-5,-5,-5,-5,-5,
//15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,
//13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,     
//9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,
//11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,
//1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1, 
//3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,
//7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
//5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5};
//logic signed[7:0]QEncmodel_qam256[0:255]={
//    15, 13,  9, 11, 1, 3, 7, 5, -15, -13, -9, -11, -1, -3, -7, -5, //-15(0-15)
//    15, 13,  9, 11, 1, 3, 7, 5, -15, -13, -9,  11, -1, -3, -7, -5, //-13(16-31)
//    15, 13,  9, 11, 1, 3, 7, 5, -15, -13, -9, -11, -1, -3, -7, -5, //-9(32-47)
//    15, 13,  9, 11, 1, 3, 7, 5, -15, -13, -9, -11, -1, -3, -7, -5, //-11(48-63)
//    15, 13,  9, 11, 1, 3, 7, 5, -15, -13, -9, -11, -1, -3, -7, -5, //-1(64-79)
//    15, 13,  9, 11, 1, 3, 7, 5, -15, -13, -9, -11, -1, -3, -7, -5, //-3(80-95)
//    15, 13,  9, 11, 1, 3, 7, 5, -15, -13, -9, -11, -1, -3, -7, -5, //-7(96-111)
//    15, 13,  9, 11, 1, 3, 7, 5, -15, -13, -9, -11, -1, -3, -7, -5, //-5(112-127)
//    15, 13,  9, 11, 1, 3, 7, 5, -15, -13, -9, -11, -1, -3, -7, -5, //15(128-143)
//    15, 13,  9, 11, 1, 3, 7, 5, -15, -13, -9, -11, -1, -3, -7, -5, //13(144-159)
//    15, 13,  9, 11, 1, 3, 7, 5, -15, -13, -9, -11, -1, -3, -7, -5, //9(160-175)
//    15, 13,  9, 11, 1, 3, 7, 5, -15, -13, -9, -11, -1, -3, -7, -5, //11(176-191)
//    15, 13,  9, 11, 1, 3, 7, 5, -15, -13, -9, -11, -1, -3, -7, -5, //1(192-207)
//    15, 13,  9, 11, 1, 3, 7, 5, -15, -13, -9, -11, -1, -3, -7, -5, //3(208-223)
//    15, 13,  9, 11, 1, 3, 7, 5, -15, -13, -9, -11, -1, -3, -7, -5, //7(224-239)
//    15, 13,  9, 11, 1, 3, 7, 5, -15, -13, -9, -11, -1, -3, -7, -5};//5(240-255)
genvar l;
generate
    for (l = 1; l <=255; l = l + 1)begin: qam256_bin_process
        always@(*)begin
            case(Isymbol_qam256[l])
            -15:begin
                    case(Qsymbol_qam256[l])
                        15:begin    qam256_bin[l][8:1]=0;
                            end
                        13:begin    qam256_bin[l][8:1]=1;
                            end
                        9:begin     qam256_bin[l][8:1]=2;
                            end
                        11:begin    qam256_bin[l][8:1]=3;
                            end
                        1:begin     qam256_bin[l][8:1]=4;
                            end
                        3:begin     qam256_bin[l][8:1]=5;
                           end
                        7:begin     qam256_bin[l][8:1]=6;
                            end
                        5:begin     qam256_bin[l][8:1]=7;
                            end
                        -15:begin   qam256_bin[l][8:1]=8;
                            end
                        -13:begin   qam256_bin[l][8:1]=9;
                            end
                        -9:begin    qam256_bin[l][8:1]=10;
                            end
                        -11:begin   qam256_bin[l][8:1]=11;
                            end
                        -1:begin    qam256_bin[l][8:1]=12;
                            end
                        -3:begin    qam256_bin[l][8:1]=13;
                            end
                        -7:begin    qam256_bin[l][8:1]=14;
                            end
                        -5:begin    qam256_bin[l][8:1]=15;
                            end
                        endcase
                end
            -13:begin
                    case(Qsymbol_qam256[l])
                        15:begin    qam256_bin[l][8:1]=16;
                            end
                        13:begin    qam256_bin[l][8:1]=17;
                            end
                        9:begin     qam256_bin[l][8:1]=18;
                            end
                        11:begin    qam256_bin[l][8:1]=19;
                            end
                        1:begin     qam256_bin[l][8:1]=20;
                            end
                        3:begin     qam256_bin[l][8:1]=21;
                           end
                        7:begin     qam256_bin[l][8:1]=22;
                            end
                        5:begin     qam256_bin[l][8:1]=23;
                            end
                        -15:begin   qam256_bin[l][8:1]=24;
                            end
                        -13:begin   qam256_bin[l][8:1]=25;
                            end
                        -9:begin    qam256_bin[l][8:1]=26;
                            end
                        -11:begin   qam256_bin[l][8:1]=27;
                            end
                        -1:begin    qam256_bin[l][8:1]=28;
                            end
                        -3:begin    qam256_bin[l][8:1]=29;
                            end
                        -7:begin    qam256_bin[l][8:1]=30;
                            end
                        -5:begin    qam256_bin[l][8:1]=31;
                            end
                        endcase
                end
            -9:begin
                    case(Qsymbol_qam256[l])
                        15:begin    qam256_bin[l][8:1]=32;
                            end
                        13:begin    qam256_bin[l][8:1]=33;
                            end
                        9:begin     qam256_bin[l][8:1]=34;
                            end
                        11:begin    qam256_bin[l][8:1]=35;
                            end
                        1:begin     qam256_bin[l][8:1]=36;
                            end
                        3:begin     qam256_bin[l][8:1]=37;
                           end
                        7:begin     qam256_bin[l][8:1]=38;
                            end
                        5:begin     qam256_bin[l][8:1]=39;
                            end
                        -15:begin   qam256_bin[l][8:1]=40;
                            end
                        -13:begin   qam256_bin[l][8:1]=41;
                            end
                        -9:begin    qam256_bin[l][8:1]=42;
                            end
                        -11:begin   qam256_bin[l][8:1]=43;
                            end
                        -1:begin    qam256_bin[l][8:1]=44;
                            end
                        -3:begin    qam256_bin[l][8:1]=45;
                            end
                        -7:begin    qam256_bin[l][8:1]=46;
                            end
                        -5:begin    qam256_bin[l][8:1]=47;
                            end
                        endcase
                end
            -11:begin
                    case(Qsymbol_qam256[l])
                        15:begin    qam256_bin[l][8:1]=48;
                            end
                        13:begin    qam256_bin[l][8:1]=49;
                            end
                        9:begin     qam256_bin[l][8:1]=50;
                            end
                        11:begin    qam256_bin[l][8:1]=51;
                            end
                        1:begin     qam256_bin[l][8:1]=52;
                            end
                        3:begin     qam256_bin[l][8:1]=53;
                           end
                        7:begin     qam256_bin[l][8:1]=54;
                            end
                        5:begin     qam256_bin[l][8:1]=55;
                            end
                        -15:begin   qam256_bin[l][8:1]=56;
                            end
                        -13:begin   qam256_bin[l][8:1]=57;
                            end
                        -9:begin    qam256_bin[l][8:1]=58;
                            end
                        -11:begin   qam256_bin[l][8:1]=59;
                            end
                        -1:begin    qam256_bin[l][8:1]=60;
                            end
                        -3:begin    qam256_bin[l][8:1]=61;
                            end
                        -7:begin    qam256_bin[l][8:1]=62;
                            end
                        -5:begin    qam256_bin[l][8:1]=63;
                            end
                        endcase
                end
            -1:begin
                    case(Qsymbol_qam256[l])
                        15:begin    qam256_bin[l][8:1]=64;
                            end
                        13:begin    qam256_bin[l][8:1]=65;
                            end
                        9:begin     qam256_bin[l][8:1]=66;
                            end
                        11:begin    qam256_bin[l][8:1]=67;
                            end
                        1:begin     qam256_bin[l][8:1]=68;
                            end
                        3:begin     qam256_bin[l][8:1]=69;
                           end
                        7:begin     qam256_bin[l][8:1]=70;
                            end
                        5:begin     qam256_bin[l][8:1]=71;
                            end
                        -15:begin   qam256_bin[l][8:1]=72;
                            end
                        -13:begin   qam256_bin[l][8:1]=73;
                            end
                        -9:begin    qam256_bin[l][8:1]=74;
                            end
                        -11:begin   qam256_bin[l][8:1]=75;
                            end
                        -1:begin    qam256_bin[l][8:1]=76;
                            end
                        -3:begin    qam256_bin[l][8:1]=77;
                            end
                        -7:begin    qam256_bin[l][8:1]=78;
                            end
                        -5:begin    qam256_bin[l][8:1]=79;
                            end
                        endcase
                end
            -3:begin
                    case(Qsymbol_qam256[l])
                        15:begin    qam256_bin[l][8:1]=80;
                            end
                        13:begin    qam256_bin[l][8:1]=81;
                            end
                        9:begin     qam256_bin[l][8:1]=82;
                            end
                        11:begin    qam256_bin[l][8:1]=83;
                            end
                        1:begin     qam256_bin[l][8:1]=84;
                            end
                        3:begin     qam256_bin[l][8:1]=85;
                           end
                        7:begin     qam256_bin[l][8:1]=86;
                            end
                        5:begin     qam256_bin[l][8:1]=87;
                            end
                        -15:begin   qam256_bin[l][8:1]=88;
                            end
                        -13:begin   qam256_bin[l][8:1]=89;
                            end
                        -9:begin    qam256_bin[l][8:1]=90;
                            end
                        -11:begin   qam256_bin[l][8:1]=91;
                            end
                        -1:begin    qam256_bin[l][8:1]=92;
                            end
                        -3:begin    qam256_bin[l][8:1]=93;
                            end
                        -7:begin    qam256_bin[l][8:1]=94;
                            end
                        -5:begin    qam256_bin[l][8:1]=95;
                            end
                        endcase                        
                end
            -7:begin
                     case(Qsymbol_qam256[l])
                        15:begin    qam256_bin[l][8:1]=96;
                            end
                        13:begin    qam256_bin[l][8:1]=97; 
                            end
                        9:begin     qam256_bin[l][8:1]=98; 
                            end
                        11:begin    qam256_bin[l][8:1]=99; 
                            end
                        1:begin     qam256_bin[l][8:1]=100;
                            end
                        3:begin     qam256_bin[l][8:1]=101;
                           end
                        7:begin     qam256_bin[l][8:1]=102;
                            end
                        5:begin     qam256_bin[l][8:1]=103;
                            end
                        -15:begin   qam256_bin[l][8:1]=104;
                            end
                        -13:begin   qam256_bin[l][8:1]=105;
                            end
                        -9:begin    qam256_bin[l][8:1]=106;
                            end
                        -11:begin   qam256_bin[l][8:1]=107;
                            end
                        -1:begin    qam256_bin[l][8:1]=108;
                            end
                        -3:begin    qam256_bin[l][8:1]=109;
                            end
                        -7:begin    qam256_bin[l][8:1]=110;
                            end
                        -5:begin    qam256_bin[l][8:1]=111;
                            end
                        endcase                        
                end
            -5:begin
                     case(Qsymbol_qam256[l])
                        15:begin    qam256_bin[l][8:1]=112;
                            end
                        13:begin    qam256_bin[l][8:1]=113;
                            end
                        9:begin     qam256_bin[l][8:1]=114;
                            end
                        11:begin    qam256_bin[l][8:1]=115;
                            end
                        1:begin     qam256_bin[l][8:1]=116;
                            end
                        3:begin     qam256_bin[l][8:1]=117;
                           end
                        7:begin     qam256_bin[l][8:1]=118;
                            end
                        5:begin     qam256_bin[l][8:1]=119;
                            end
                        -15:begin   qam256_bin[l][8:1]=120;
                            end
                        -13:begin   qam256_bin[l][8:1]=121;
                            end
                        -9:begin    qam256_bin[l][8:1]=122;
                            end
                        -11:begin   qam256_bin[l][8:1]=123;
                            end
                        -1:begin    qam256_bin[l][8:1]=124;
                            end
                        -3:begin    qam256_bin[l][8:1]=125;
                            end
                        -7:begin    qam256_bin[l][8:1]=126;
                            end
                        -5:begin    qam256_bin[l][8:1]=127;
                            end
                        endcase                        
                end
            15:begin
                    case(Qsymbol_qam256[l])
                        15:begin    qam256_bin[l][8:1]=128;
                            end
                        13:begin    qam256_bin[l][8:1]=129;
                            end
                        9:begin     qam256_bin[l][8:1]=130;
                            end
                        11:begin    qam256_bin[l][8:1]=131;
                            end
                        1:begin     qam256_bin[l][8:1]=132;
                            end
                        3:begin     qam256_bin[l][8:1]=133;
                           end
                        7:begin     qam256_bin[l][8:1]=134;
                            end
                        5:begin     qam256_bin[l][8:1]=135;
                            end
                        -15:begin   qam256_bin[l][8:1]=136;
                            end
                        -13:begin   qam256_bin[l][8:1]=137;
                            end
                        -9:begin    qam256_bin[l][8:1]=138;
                            end
                        -11:begin   qam256_bin[l][8:1]=139;
                            end
                        -1:begin    qam256_bin[l][8:1]=140;
                            end
                        -3:begin    qam256_bin[l][8:1]=141;
                            end
                        -7:begin    qam256_bin[l][8:1]=142;
                            end
                        -5:begin    qam256_bin[l][8:1]=143;
                            end
                        endcase                        
                end
            13:begin
                    case(Qsymbol_qam256[l])
                        15:begin    qam256_bin[l][8:1]=144;
                            end
                        13:begin    qam256_bin[l][8:1]=145;
                            end
                        9:begin     qam256_bin[l][8:1]=146;
                            end
                        11:begin    qam256_bin[l][8:1]=147;
                            end
                        1:begin     qam256_bin[l][8:1]=148;
                            end
                        3:begin     qam256_bin[l][8:1]=149;
                           end
                        7:begin     qam256_bin[l][8:1]=150;
                            end
                        5:begin     qam256_bin[l][8:1]=151;
                            end
                        -15:begin   qam256_bin[l][8:1]=152;
                            end
                        -13:begin   qam256_bin[l][8:1]=153;
                            end
                        -9:begin    qam256_bin[l][8:1]=154;
                            end
                        -11:begin   qam256_bin[l][8:1]=155;
                            end
                        -1:begin    qam256_bin[l][8:1]=156;
                            end
                        -3:begin    qam256_bin[l][8:1]=157;
                            end
                        -7:begin    qam256_bin[l][8:1]=158;
                            end
                        -5:begin    qam256_bin[l][8:1]=159;
                            end
                        endcase                        
                end
            9:begin
                    case(Qsymbol_qam256[l])
                        15:begin    qam256_bin[l][8:1]=160;
                            end
                        13:begin    qam256_bin[l][8:1]=161;
                            end
                        9:begin     qam256_bin[l][8:1]=162;
                            end
                        11:begin    qam256_bin[l][8:1]=163;
                            end
                        1:begin     qam256_bin[l][8:1]=164;
                            end
                        3:begin     qam256_bin[l][8:1]=165;
                           end
                        7:begin     qam256_bin[l][8:1]=166;
                            end
                        5:begin     qam256_bin[l][8:1]=167;
                            end
                        -15:begin   qam256_bin[l][8:1]=168;
                            end
                        -13:begin   qam256_bin[l][8:1]=169;
                            end
                        -9:begin    qam256_bin[l][8:1]=170;
                            end
                        -11:begin   qam256_bin[l][8:1]=171;
                            end
                        -1:begin    qam256_bin[l][8:1]=172;
                            end
                        -3:begin    qam256_bin[l][8:1]=173;
                            end
                        -7:begin    qam256_bin[l][8:1]=174;
                            end
                        -5:begin    qam256_bin[l][8:1]=175;
                            end
                        endcase                        
                end
            11:begin
                    case(Qsymbol_qam256[l])
                        15:begin    qam256_bin[l][8:1]=176;
                            end
                        13:begin    qam256_bin[l][8:1]=177; 
                            end
                        9:begin     qam256_bin[l][8:1]=178; 
                            end
                        11:begin    qam256_bin[l][8:1]=179; 
                            end
                        1:begin     qam256_bin[l][8:1]=180; 
                            end
                        3:begin     qam256_bin[l][8:1]=181; 
                           end
                        7:begin     qam256_bin[l][8:1]=182; 
                            end
                        5:begin     qam256_bin[l][8:1]=183; 
                            end
                        -15:begin   qam256_bin[l][8:1]=184; 
                            end
                        -13:begin   qam256_bin[l][8:1]=185; 
                            end
                        -9:begin    qam256_bin[l][8:1]=186; 
                            end
                        -11:begin   qam256_bin[l][8:1]=187; 
                            end
                        -1:begin    qam256_bin[l][8:1]=188; 
                            end
                        -3:begin    qam256_bin[l][8:1]=189; 
                            end
                        -7:begin    qam256_bin[l][8:1]=190; 
                            end
                        -5:begin    qam256_bin[l][8:1]=191; 
                            end
                        endcase                        
                end
            1:begin
                    case(Qsymbol_qam256[l])
                        15:begin    qam256_bin[l][8:1]=192;
                            end
                        13:begin    qam256_bin[l][8:1]=193; 
                            end
                        9:begin     qam256_bin[l][8:1]=194; 
                            end
                        11:begin    qam256_bin[l][8:1]=195; 
                            end
                        1:begin     qam256_bin[l][8:1]=196; 
                            end
                        3:begin     qam256_bin[l][8:1]=197; 
                           end
                        7:begin     qam256_bin[l][8:1]=198; 
                            end
                        5:begin     qam256_bin[l][8:1]=199; 
                            end
                        -15:begin   qam256_bin[l][8:1]=200; 
                            end
                        -13:begin   qam256_bin[l][8:1]=201; 
                            end
                        -9:begin    qam256_bin[l][8:1]=202; 
                            end
                        -11:begin   qam256_bin[l][8:1]=203; 
                            end
                        -1:begin    qam256_bin[l][8:1]=204; 
                            end
                        -3:begin    qam256_bin[l][8:1]=205; 
                            end
                        -7:begin    qam256_bin[l][8:1]=206; 
                            end
                        -5:begin    qam256_bin[l][8:1]=207; 
                            end
                        endcase                        
                end
            3:begin
                    case(Qsymbol_qam256[l])
                        15:begin    qam256_bin[l][8:1]=208;
                            end
                        13:begin    qam256_bin[l][8:1]=209;
                            end
                        9:begin     qam256_bin[l][8:1]=210;
                            end
                        11:begin    qam256_bin[l][8:1]=211;
                            end
                        1:begin     qam256_bin[l][8:1]=212;
                            end
                        3:begin     qam256_bin[l][8:1]=213;
                           end
                        7:begin     qam256_bin[l][8:1]=214;
                            end
                        5:begin     qam256_bin[l][8:1]=215;
                            end
                        -15:begin   qam256_bin[l][8:1]=216;
                            end
                        -13:begin   qam256_bin[l][8:1]=217;
                            end
                        -9:begin    qam256_bin[l][8:1]=218;
                            end
                        -11:begin   qam256_bin[l][8:1]=219;
                            end
                        -1:begin    qam256_bin[l][8:1]=220;
                            end
                        -3:begin    qam256_bin[l][8:1]=221;
                            end
                        -7:begin    qam256_bin[l][8:1]=222;
                            end
                        -5:begin    qam256_bin[l][8:1]=223;
                            end
                        endcase                        
                end
            7:begin
                    case(Qsymbol_qam256[l])
                        15:begin    qam256_bin[l][8:1]=224;
                            end
                        13:begin    qam256_bin[l][8:1]=225;
                            end
                        9:begin     qam256_bin[l][8:1]=226;
                            end
                        11:begin    qam256_bin[l][8:1]=227;
                            end
                        1:begin     qam256_bin[l][8:1]=228;
                            end
                        3:begin     qam256_bin[l][8:1]=229;
                           end
                        7:begin     qam256_bin[l][8:1]=230;
                            end
                        5:begin     qam256_bin[l][8:1]=231;
                            end
                        -15:begin   qam256_bin[l][8:1]=232;
                            end
                        -13:begin   qam256_bin[l][8:1]=233;
                            end
                        -9:begin    qam256_bin[l][8:1]=234;
                            end
                        -11:begin   qam256_bin[l][8:1]=235;
                            end
                        -1:begin    qam256_bin[l][8:1]=236;
                            end
                        -3:begin    qam256_bin[l][8:1]=237;
                            end
                        -7:begin    qam256_bin[l][8:1]=238;
                            end
                        -5:begin    qam256_bin[l][8:1]=239;
                            end
                        endcase                        
                end
            5:begin
                    case(Qsymbol_qam256[l])
                        15:begin    qam256_bin[l][8:1]=240;
                            end
                        13:begin    qam256_bin[l][8:1]=241;
                            end
                        9:begin     qam256_bin[l][8:1]=242;
                            end
                        11:begin    qam256_bin[l][8:1]=243;
                            end
                        1:begin     qam256_bin[l][8:1]=244;
                            end
                        3:begin     qam256_bin[l][8:1]=245;
                           end
                        7:begin     qam256_bin[l][8:1]=246;
                            end
                        5:begin     qam256_bin[l][8:1]=247;
                            end
                        -15:begin   qam256_bin[l][8:1]=248;
                            end
                        -13:begin   qam256_bin[l][8:1]=249;
                            end
                        -9:begin    qam256_bin[l][8:1]=250;
                            end
                        -11:begin   qam256_bin[l][8:1]=251;
                            end
                        -1:begin    qam256_bin[l][8:1]=252;
                            end
                        -3:begin    qam256_bin[l][8:1]=253;
                            end
                        -7:begin    qam256_bin[l][8:1]=254;
                            end
                        -5:begin    qam256_bin[l][8:1]=255;
                            end
                        endcase                        
                end
            endcase

            end end
endgenerate 

//logic signed[7:0]IEncmodel_qam1024[0:1023]={
//   -31,-31,-31,-31,-31,-31,-31,-31,-31,-31,-31,-31,-31,-31,-31,-31,-31,-31,-31,-31,-31,-31,-31,-31,-31,-31,-31,-31,-31,-31,-31,-31,
//   -29,-29,-29,-29,-29,-29,-29,-29,-29,-29,-29,-29,-29,-29,-29,-29,-29,-29,-29,-29,-29,-29,-29,-29,-29,-29,-29,-29,-29,-29,-29,-29,
//   -25,-25,-25,-25,-25,-25,-25,-25,-25,-25,-25,-25,-25,-25,-25,-25,-25,-25,-25,-25,-25,-25,-25,-25,-25,-25,-25,-25,-25,-25,-25,-25,
//   -27,-27,-27,-27,-27,-27,-27,-27,-27,-27,-27,-27,-27,-27,-27,-27,-27,-27,-27,-27,-27,-27,-27,-27,-27,-27,-27,-27,-27,-27,-27,-27,
//   -17,-17,-17,-17,-17,-17,-17,-17,-17,-17,-17,-17,-17,-17,-17,-17,-17,-17,-17,-17,-17,-17,-17,-17,-17,-17,-17,-17,-17,-17,-17,-17,
//   -19,-19,-19,-19,-19,-19,-19,-19,-19,-19,-19,-19,-19,-19,-19,-19,-19,-19,-19,-19,-19,-19,-19,-19,-19,-19,-19,-19,-19,-19,-19,-19,
//   -23,-23,-23,-23,-23,-23,-23,-23,-23,-23,-23,-23,-23,-23,-23,-23,-23,-23,-23,-23,-23,-23,-23,-23,-23,-23,-23,-23,-23,-23,-23,-23,
//   -21,-21,-21,-21,-21,-21,-21,-21,-21,-21,-21,-21,-21,-21,-21,-21,-21,-21,-21,-21,-21,-21,-21,-21,-21,-21,-21,-21,-21,-21,-21,-21, 
//    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
//    -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, 
//    -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, 
//    -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5, -5,
//   -15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,-15,
//   -13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13,-13, 
//    -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9,
//   -11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11,-11, 
//    31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 
//    29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 
//    25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 
//    27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 
//    17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 
//    19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 
//    23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23,
//    21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21,  
//     1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  
//     3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  
//     7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  7,  
//     5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5, 
//    15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 
//    13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13,  
//     9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9, 
//    11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11};
//logic signed[7:0]QEncmodel_qam1024[0:1023]={
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11,
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11, 
//    31, 29, 25, 27, 17, 19, 23, 21, 1, 3, 7, 5, 15, 13, 9, 11,-31,-29,-25,-27,-17,-19,-23,-21, -1, -3, -7, -5,-15,-13, -9,-11};
genvar m;
generate
    for (m = 1; m <=255; m = m + 1)begin: qam1024_bin_process
        always@(*)begin
            case(Isymbol_qam1024[m])
            -31:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=0;
                            end                    
                        29:begin    qam1024_bin[m][10:1]=1;
                            end                    
                        25:begin    qam1024_bin[m][10:1]=2;
                            end                    
                        27:begin    qam1024_bin[m][10:1]=3;
                            end                    
                        17:begin    qam1024_bin[m][10:1]=4;
                            end                    
                        19:begin    qam1024_bin[m][10:1]=5;
                            end                    
                        23:begin    qam1024_bin[m][10:1]=6;
                            end                    
                        21:begin    qam1024_bin[m][10:1]=7;
                            end                    
                        1:begin     qam1024_bin[m][10:1]=8;
                            end                    
                        3:begin     qam1024_bin[m][10:1]=9;
                            end                    
                        7:begin     qam1024_bin[m][10:1]=10;
                            end                    
                        5:begin     qam1024_bin[m][10:1]=11;
                            end                    
                        15:begin    qam1024_bin[m][10:1]=12;
                            end                    
                        13:begin    qam1024_bin[m][10:1]=13;
                            end                    
                        9:begin     qam1024_bin[m][10:1]=14;
                            end                    
                        11:begin    qam1024_bin[m][10:1]=15;
                            end                    
                        -31:begin   qam1024_bin[m][10:1]=16;
                            end                    
                        -29:begin   qam1024_bin[m][10:1]=17;
                            end                    
                        -25:begin   qam1024_bin[m][10:1]=18;
                            end                    
                        -27:begin   qam1024_bin[m][10:1]=19;
                            end                    
                        -17:begin   qam1024_bin[m][10:1]=20;
                            end                    
                        -19:begin   qam1024_bin[m][10:1]=21;
                            end                    
                        -23:begin   qam1024_bin[m][10:1]=22;
                            end                    
                        -21:begin   qam1024_bin[m][10:1]=23;
                            end                    
                        -1:begin    qam1024_bin[m][10:1]=24;
                            end                    
                        -3:begin    qam1024_bin[m][10:1]=25;
                            end                    
                        -7:begin    qam1024_bin[m][10:1]=26;
                            end                    
                        -5:begin    qam1024_bin[m][10:1]=27;
                            end                    
                        -15:begin   qam1024_bin[m][10:1]=28;
                            end                    
                        -13:begin   qam1024_bin[m][10:1]=29;
                            end                    
                        -9:begin    qam1024_bin[m][10:1]=30;
                            end                    
                        -11:begin   qam1024_bin[m][10:1]=31;
                            end
                        endcase
                end
            -29:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=32;
                            end                    
                        29:begin    qam1024_bin[m][10:1]=33;
                            end                    
                        25:begin    qam1024_bin[m][10:1]=34;
                            end                    
                        27:begin    qam1024_bin[m][10:1]=35;
                            end                    
                        17:begin    qam1024_bin[m][10:1]=36;
                            end                    
                        19:begin    qam1024_bin[m][10:1]=37;
                            end                    
                        23:begin    qam1024_bin[m][10:1]=38;
                            end                    
                        21:begin    qam1024_bin[m][10:1]=39;
                            end                    
                        1:begin     qam1024_bin[m][10:1]=40;
                            end                    
                        3:begin     qam1024_bin[m][10:1]=41;
                            end                    
                        7:begin     qam1024_bin[m][10:1]=42;
                            end                      
                        5:begin     qam1024_bin[m][10:1]=43;
                            end                        
                        15:begin    qam1024_bin[m][10:1]=44;
                            end                      
                        13:begin    qam1024_bin[m][10:1]=45;
                            end                      
                        9:begin     qam1024_bin[m][10:1]=46;
                            end                       
                        11:begin    qam1024_bin[m][10:1]=47;
                            end                       
                        -31:begin   qam1024_bin[m][10:1]=48;
                            end                       
                        -29:begin   qam1024_bin[m][10:1]=49;
                            end                   
                        -25:begin   qam1024_bin[m][10:1]=50;
                            end                      
                        -27:begin   qam1024_bin[m][10:1]=51;
                            end                       
                        -17:begin   qam1024_bin[m][10:1]=52;
                            end                      
                        -19:begin   qam1024_bin[m][10:1]=53;
                            end                      
                        -23:begin   qam1024_bin[m][10:1]=54;
                            end                      
                        -21:begin   qam1024_bin[m][10:1]=55;
                            end                       
                        -1:begin    qam1024_bin[m][10:1]=56;
                            end                       
                        -3:begin    qam1024_bin[m][10:1]=57;
                            end                       
                        -7:begin    qam1024_bin[m][10:1]=58;
                            end                      
                        -5:begin    qam1024_bin[m][10:1]=59;
                            end                   
                        -15:begin   qam1024_bin[m][10:1]=60;
                            end                   
                        -13:begin   qam1024_bin[m][10:1]=61;
                            end                    
                        -9:begin    qam1024_bin[m][10:1]=62;
                            end                    
                        -11:begin   qam1024_bin[m][10:1]=63;
                            end
                        endcase
                end
            -25:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=64;
                            end                            
                        29:begin    qam1024_bin[m][10:1]=65;
                            end                            
                        25:begin    qam1024_bin[m][10:1]=66;
                            end                            
                        27:begin    qam1024_bin[m][10:1]=67;
                            end                            
                        17:begin    qam1024_bin[m][10:1]=68;
                            end                            
                        19:begin    qam1024_bin[m][10:1]=69;
                            end                            
                        23:begin    qam1024_bin[m][10:1]=70;
                            end                    
                        21:begin    qam1024_bin[m][10:1]=71;
                            end                            
                        1:begin     qam1024_bin[m][10:1]=72;
                            end                            
                        3:begin     qam1024_bin[m][10:1]=73;
                            end                            
                        7:begin     qam1024_bin[m][10:1]=74;
                            end                            
                        5:begin     qam1024_bin[m][10:1]=75;
                            end                            
                        15:begin    qam1024_bin[m][10:1]=76;
                            end                            
                        13:begin    qam1024_bin[m][10:1]=77;
                            end                            
                        9:begin     qam1024_bin[m][10:1]=78;
                            end                            
                        11:begin    qam1024_bin[m][10:1]=79;
                            end                            
                        -31:begin   qam1024_bin[m][10:1]=80;
                            end                       
                        -29:begin   qam1024_bin[m][10:1]=81;
                            end                            
                        -25:begin   qam1024_bin[m][10:1]=82;
                            end                            
                        -27:begin   qam1024_bin[m][10:1]=83;
                            end                            
                        -17:begin   qam1024_bin[m][10:1]=84;
                            end                            
                        -19:begin   qam1024_bin[m][10:1]=85;
                            end                            
                        -23:begin   qam1024_bin[m][10:1]=86;
                            end                            
                        -21:begin   qam1024_bin[m][10:1]=87;
                            end                            
                        -1:begin    qam1024_bin[m][10:1]=88;
                            end                            
                        -3:begin    qam1024_bin[m][10:1]=89;
                            end                            
                        -7:begin    qam1024_bin[m][10:1]=90;
                            end                      
                        -5:begin    qam1024_bin[m][10:1]=91;
                            end                            
                        -15:begin   qam1024_bin[m][10:1]=92;
                            end                            
                        -13:begin   qam1024_bin[m][10:1]=93;
                            end                          
                        -9:begin    qam1024_bin[m][10:1]=94;
                            end                          
                        -11:begin   qam1024_bin[m][10:1]=95;
                            end
                        endcase
                end
            -27:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=96;
                            end                            
                        29:begin    qam1024_bin[m][10:1]=97;
                            end                           
                        25:begin    qam1024_bin[m][10:1]=98;
                            end                          
                        27:begin    qam1024_bin[m][10:1]=99;
                            end                            
                        17:begin    qam1024_bin[m][10:1]=100;
                            end                          
                        19:begin    qam1024_bin[m][10:1]=101;
                            end                          
                        23:begin    qam1024_bin[m][10:1]=102;
                            end                          
                        21:begin    qam1024_bin[m][10:1]=103;
                            end                          
                        1:begin     qam1024_bin[m][10:1]=104;
                            end                          
                        3:begin     qam1024_bin[m][10:1]=105;
                            end                          
                        7:begin     qam1024_bin[m][10:1]=106;
                            end                          
                        5:begin     qam1024_bin[m][10:1]=107;
                            end                          
                        15:begin    qam1024_bin[m][10:1]=108;
                            end                          
                        13:begin    qam1024_bin[m][10:1]=109;
                            end                            
                        9:begin     qam1024_bin[m][10:1]=110;
                            end                          
                        11:begin    qam1024_bin[m][10:1]=111;
                            end                          
                        -31:begin   qam1024_bin[m][10:1]=112;
                            end                          
                        -29:begin   qam1024_bin[m][10:1]=113;
                            end                          
                        -25:begin   qam1024_bin[m][10:1]=114;
                            end                          
                        -27:begin   qam1024_bin[m][10:1]=115;
                            end                          
                        -17:begin   qam1024_bin[m][10:1]=116;
                            end                          
                        -19:begin   qam1024_bin[m][10:1]=117;
                            end                          
                        -23:begin   qam1024_bin[m][10:1]=118;
                            end                          
                        -21:begin   qam1024_bin[m][10:1]=119;
                            end                            
                        -1:begin    qam1024_bin[m][10:1]=120;
                            end                            
                        -3:begin    qam1024_bin[m][10:1]=121;
                            end                           
                        -7:begin    qam1024_bin[m][10:1]=122;
                            end                          
                        -5:begin    qam1024_bin[m][10:1]=123;
                            end                           
                        -15:begin   qam1024_bin[m][10:1]=124;
                            end                          
                        -13:begin   qam1024_bin[m][10:1]=125;
                            end                          
                        -9:begin    qam1024_bin[m][10:1]=126;
                            end                          
                        -11:begin   qam1024_bin[m][10:1]=127;
                            end
                        endcase
                end
            -17:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=128; 
                            end                             
                        29:begin    qam1024_bin[m][10:1]=129; 
                            end                               
                        25:begin    qam1024_bin[m][10:1]=130;
                            end                           
                        27:begin    qam1024_bin[m][10:1]=131;
                            end                          
                        17:begin    qam1024_bin[m][10:1]=132;
                            end                          
                        19:begin    qam1024_bin[m][10:1]=133;
                            end                          
                        23:begin    qam1024_bin[m][10:1]=134;
                            end                           
                        21:begin    qam1024_bin[m][10:1]=135;
                            end                           
                        1:begin     qam1024_bin[m][10:1]=136;
                            end                          
                        3:begin     qam1024_bin[m][10:1]=137;
                            end                          
                        7:begin     qam1024_bin[m][10:1]=138;
                            end                           
                        5:begin     qam1024_bin[m][10:1]=139;
                            end                              
                        15:begin    qam1024_bin[m][10:1]=140;
                            end                            
                        13:begin    qam1024_bin[m][10:1]=141;
                            end                           
                        9:begin     qam1024_bin[m][10:1]=142;
                            end                           
                        11:begin    qam1024_bin[m][10:1]=143;
                            end                           
                        -31:begin   qam1024_bin[m][10:1]=144;
                            end                           
                        -29:begin   qam1024_bin[m][10:1]=145;
                            end                           
                        -25:begin   qam1024_bin[m][10:1]=146;
                            end                           
                        -27:begin   qam1024_bin[m][10:1]=147;
                            end                           
                        -17:begin   qam1024_bin[m][10:1]=148;
                            end                           
                        -19:begin   qam1024_bin[m][10:1]=149;
                            end                              
                        -23:begin   qam1024_bin[m][10:1]=150;
                            end                           
                        -21:begin   qam1024_bin[m][10:1]=151;
                            end                          
                        -1:begin    qam1024_bin[m][10:1]=152;
                            end                           
                        -3:begin    qam1024_bin[m][10:1]=153;
                            end                           
                        -7:begin    qam1024_bin[m][10:1]=154;
                            end                            
                        -5:begin    qam1024_bin[m][10:1]=155;
                            end                            
                        -15:begin   qam1024_bin[m][10:1]=156;
                            end                           
                        -13:begin   qam1024_bin[m][10:1]=157;
                            end                          
                        -9:begin    qam1024_bin[m][10:1]=158;
                            end                              
                        -11:begin   qam1024_bin[m][10:1]=159;
                            end
                        endcase
                end
            -19:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=160; 
                            end                              
                        29:begin    qam1024_bin[m][10:1]=161; 
                            end                                
                        25:begin    qam1024_bin[m][10:1]=162;
                            end                           
                        27:begin    qam1024_bin[m][10:1]=163;
                            end                           
                        17:begin    qam1024_bin[m][10:1]=164;
                            end                           
                        19:begin    qam1024_bin[m][10:1]=165;
                            end                           
                        23:begin    qam1024_bin[m][10:1]=166;
                            end                           
                        21:begin    qam1024_bin[m][10:1]=167;
                            end                           
                        1:begin     qam1024_bin[m][10:1]=168;
                            end                           
                        3:begin     qam1024_bin[m][10:1]=169;
                            end                             
                        7:begin     qam1024_bin[m][10:1]=170;
                            end                           
                        5:begin     qam1024_bin[m][10:1]=171;
                            end                            
                        15:begin    qam1024_bin[m][10:1]=172;
                            end                           
                        13:begin    qam1024_bin[m][10:1]=173;
                            end                           
                        9:begin     qam1024_bin[m][10:1]=174;
                            end                           
                        11:begin    qam1024_bin[m][10:1]=175;
                            end                           
                        -31:begin   qam1024_bin[m][10:1]=176;
                            end                           
                        -29:begin   qam1024_bin[m][10:1]=177;
                            end                           
                        -25:begin   qam1024_bin[m][10:1]=178;
                            end                           
                        -27:begin   qam1024_bin[m][10:1]=179;
                            end                             
                        -17:begin   qam1024_bin[m][10:1]=180;
                            end                           
                        -19:begin   qam1024_bin[m][10:1]=181;
                            end                            
                        -23:begin   qam1024_bin[m][10:1]=182;
                            end                           
                        -21:begin   qam1024_bin[m][10:1]=183;
                            end                           
                        -1:begin    qam1024_bin[m][10:1]=184;
                            end                           
                        -3:begin    qam1024_bin[m][10:1]=185;
                            end                           
                        -7:begin    qam1024_bin[m][10:1]=186;
                            end                           
                        -5:begin    qam1024_bin[m][10:1]=187;
                            end                           
                        -15:begin   qam1024_bin[m][10:1]=188;
                            end                           
                        -13:begin   qam1024_bin[m][10:1]=189;
                            end                          
                        -9:begin    qam1024_bin[m][10:1]=190;
                            end                           
                        -11:begin   qam1024_bin[m][10:1]=191;
                            end
                        endcase
                end
            -23:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=192; 
                            end                               
                        29:begin    qam1024_bin[m][10:1]=193; 
                            end                                
                        25:begin    qam1024_bin[m][10:1]=194;
                            end                           
                        27:begin    qam1024_bin[m][10:1]=195;
                            end                           
                        17:begin    qam1024_bin[m][10:1]=196;
                            end                           
                        19:begin    qam1024_bin[m][10:1]=197;
                            end                           
                        23:begin    qam1024_bin[m][10:1]=198;
                            end                           
                        21:begin    qam1024_bin[m][10:1]=199;
                            end                             
                        1:begin     qam1024_bin[m][10:1]=200;
                            end                          
                        3:begin     qam1024_bin[m][10:1]=201;
                            end                          
                        7:begin     qam1024_bin[m][10:1]=202;
                            end                          
                        5:begin     qam1024_bin[m][10:1]=203;
                            end                          
                        15:begin    qam1024_bin[m][10:1]=204;
                            end                           
                        13:begin    qam1024_bin[m][10:1]=205;
                            end                          
                        9:begin     qam1024_bin[m][10:1]=206;
                            end                          
                        11:begin    qam1024_bin[m][10:1]=207;
                            end                          
                        -31:begin   qam1024_bin[m][10:1]=208;
                            end                          
                        -29:begin   qam1024_bin[m][10:1]=209;
                            end                             
                        -25:begin   qam1024_bin[m][10:1]=210;
                            end                           
                        -27:begin   qam1024_bin[m][10:1]=211;
                            end                           
                        -17:begin   qam1024_bin[m][10:1]=212;
                            end                          
                        -19:begin   qam1024_bin[m][10:1]=213;
                            end                           
                        -23:begin   qam1024_bin[m][10:1]=214;
                            end                          
                        -21:begin   qam1024_bin[m][10:1]=215;
                            end                          
                        -1:begin    qam1024_bin[m][10:1]=216;
                            end                           
                        -3:begin    qam1024_bin[m][10:1]=217;
                            end                          
                        -7:begin    qam1024_bin[m][10:1]=218;
                            end                          
                        -5:begin    qam1024_bin[m][10:1]=219;
                            end                             
                        -15:begin   qam1024_bin[m][10:1]=220;
                            end                          
                        -13:begin   qam1024_bin[m][10:1]=221;
                            end                          
                        -9:begin    qam1024_bin[m][10:1]=222;
                            end                          
                        -11:begin   qam1024_bin[m][10:1]=223;
                            end
                        endcase
                end
            -21:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=224; 
                            end                                
                        29:begin    qam1024_bin[m][10:1]=225; 
                            end                                 
                        25:begin    qam1024_bin[m][10:1]=226;
                            end                           
                        27:begin    qam1024_bin[m][10:1]=227;
                            end                          
                        17:begin    qam1024_bin[m][10:1]=228;
                            end                          
                        19:begin    qam1024_bin[m][10:1]=229;
                            end                             
                        23:begin    qam1024_bin[m][10:1]=230;
                            end                          
                        21:begin    qam1024_bin[m][10:1]=231;
                            end                          
                        1:begin     qam1024_bin[m][10:1]=232;
                            end                           
                        3:begin     qam1024_bin[m][10:1]=233;
                            end                          
                        7:begin     qam1024_bin[m][10:1]=234;
                            end                          
                        5:begin     qam1024_bin[m][10:1]=235;
                            end                          
                        15:begin    qam1024_bin[m][10:1]=236;
                            end                          
                        13:begin    qam1024_bin[m][10:1]=237;
                            end                          
                        9:begin     qam1024_bin[m][10:1]=238;
                            end                          
                        11:begin    qam1024_bin[m][10:1]=239;
                            end                             
                        -31:begin   qam1024_bin[m][10:1]=240;
                            end                          
                        -29:begin   qam1024_bin[m][10:1]=241;
                            end                           
                        -25:begin   qam1024_bin[m][10:1]=242;
                            end                          
                        -27:begin   qam1024_bin[m][10:1]=243;
                            end                          
                        -17:begin   qam1024_bin[m][10:1]=244;
                            end                          
                        -19:begin   qam1024_bin[m][10:1]=245;
                            end                          
                        -23:begin   qam1024_bin[m][10:1]=246;
                            end                          
                        -21:begin   qam1024_bin[m][10:1]=247;
                            end                           
                        -1:begin    qam1024_bin[m][10:1]=248;
                            end                          
                        -3:begin    qam1024_bin[m][10:1]=249;
                            end                             
                        -7:begin    qam1024_bin[m][10:1]=250;
                            end                          
                        -5:begin    qam1024_bin[m][10:1]=251;
                            end                          
                        -15:begin   qam1024_bin[m][10:1]=252;
                            end                          
                        -13:begin   qam1024_bin[m][10:1]=253;
                            end                          
                        -9:begin    qam1024_bin[m][10:1]=254;
                            end                          
                        -11:begin   qam1024_bin[m][10:1]=255;
                            end
                        endcase
                end    
             -1:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=256; 
                            end                               
                        29:begin    qam1024_bin[m][10:1]=257; 
                            end                                 
                        25:begin    qam1024_bin[m][10:1]=258;
                            end                          
                        27:begin    qam1024_bin[m][10:1]=259;
                            end                             
                        17:begin    qam1024_bin[m][10:1]=260;
                            end                           
                        19:begin    qam1024_bin[m][10:1]=261;
                            end                          
                        23:begin    qam1024_bin[m][10:1]=262;
                            end                          
                        21:begin    qam1024_bin[m][10:1]=263;
                            end                          
                        1:begin     qam1024_bin[m][10:1]=264;
                            end                          
                        3:begin     qam1024_bin[m][10:1]=265;
                            end                           
                        7:begin     qam1024_bin[m][10:1]=266;
                            end                          
                        5:begin     qam1024_bin[m][10:1]=267;
                            end                           
                        15:begin    qam1024_bin[m][10:1]=268;
                            end                           
                        13:begin    qam1024_bin[m][10:1]=269;
                            end                             
                        9:begin     qam1024_bin[m][10:1]=270;
                            end                           
                        11:begin    qam1024_bin[m][10:1]=271;
                            end                           
                        -31:begin   qam1024_bin[m][10:1]=272;
                            end                           
                        -29:begin   qam1024_bin[m][10:1]=273;
                            end                          
                        -25:begin   qam1024_bin[m][10:1]=274;
                            end                           
                        -27:begin   qam1024_bin[m][10:1]=275;
                            end                          
                        -17:begin   qam1024_bin[m][10:1]=276;
                            end                          
                        -19:begin   qam1024_bin[m][10:1]=277;
                            end                          
                        -23:begin   qam1024_bin[m][10:1]=278;
                            end                          
                        -21:begin   qam1024_bin[m][10:1]=279;
                            end                             
                        -1:begin    qam1024_bin[m][10:1]=280;
                            end                          
                        -3:begin    qam1024_bin[m][10:1]=281;
                            end                          
                        -7:begin    qam1024_bin[m][10:1]=282;
                            end                          
                        -5:begin    qam1024_bin[m][10:1]=283;
                            end                          
                        -15:begin   qam1024_bin[m][10:1]=284;
                            end                          
                        -13:begin   qam1024_bin[m][10:1]=285;
                            end                          
                        -9:begin    qam1024_bin[m][10:1]=286;
                            end                          
                        -11:begin   qam1024_bin[m][10:1]=287;
                            end
                        endcase
                end  
             -3:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=288; 
                            end                               
                        29:begin    qam1024_bin[m][10:1]=289; 
                            end                                    
                        25:begin    qam1024_bin[m][10:1]=290;
                            end                          
                        27:begin    qam1024_bin[m][10:1]=291;
                            end                           
                        17:begin    qam1024_bin[m][10:1]=292;
                            end                          
                        19:begin    qam1024_bin[m][10:1]=293;
                            end                           
                        23:begin    qam1024_bin[m][10:1]=294;
                            end                           
                        21:begin    qam1024_bin[m][10:1]=295;
                            end                           
                        1:begin     qam1024_bin[m][10:1]=296;
                            end                          
                        3:begin     qam1024_bin[m][10:1]=297;
                            end                          
                        7:begin     qam1024_bin[m][10:1]=298;
                            end                           
                        5:begin     qam1024_bin[m][10:1]=299;
                            end                             
                        15:begin    qam1024_bin[m][10:1]=300;
                            end                          
                        13:begin    qam1024_bin[m][10:1]=301;
                            end                          
                        9:begin     qam1024_bin[m][10:1]=302;
                            end                          
                        11:begin    qam1024_bin[m][10:1]=303;
                            end                          
                        -31:begin   qam1024_bin[m][10:1]=304;
                            end                          
                        -29:begin   qam1024_bin[m][10:1]=305;
                            end                          
                        -25:begin   qam1024_bin[m][10:1]=306;
                            end                          
                        -27:begin   qam1024_bin[m][10:1]=307;
                            end                          
                        -17:begin   qam1024_bin[m][10:1]=308;
                            end                          
                        -19:begin   qam1024_bin[m][10:1]=309;
                            end                             
                        -23:begin   qam1024_bin[m][10:1]=310;
                            end                           
                        -21:begin   qam1024_bin[m][10:1]=311;
                            end                           
                        -1:begin    qam1024_bin[m][10:1]=312;
                            end                           
                        -3:begin    qam1024_bin[m][10:1]=313;
                            end                           
                        -7:begin    qam1024_bin[m][10:1]=314;
                            end                          
                        -5:begin    qam1024_bin[m][10:1]=315;
                            end                          
                        -15:begin   qam1024_bin[m][10:1]=316;
                            end                          
                        -13:begin   qam1024_bin[m][10:1]=317;
                            end                          
                        -9:begin    qam1024_bin[m][10:1]=318;
                            end                          
                        -11:begin   qam1024_bin[m][10:1]=319;
                            end
                        endcase
                end   
            -7:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=320; 
                            end                                  
                        29:begin    qam1024_bin[m][10:1]=321; 
                            end                                   
                        25:begin    qam1024_bin[m][10:1]=322;
                            end                          
                        27:begin    qam1024_bin[m][10:1]=323;
                            end                          
                        17:begin    qam1024_bin[m][10:1]=324;
                            end                          
                        19:begin    qam1024_bin[m][10:1]=325;
                            end                          
                        23:begin    qam1024_bin[m][10:1]=326;
                            end                          
                        21:begin    qam1024_bin[m][10:1]=327;
                            end                          
                        1:begin     qam1024_bin[m][10:1]=328;
                            end                          
                        3:begin     qam1024_bin[m][10:1]=329;
                            end                             
                        7:begin     qam1024_bin[m][10:1]=330;
                            end                          
                        5:begin     qam1024_bin[m][10:1]=331;
                            end                          
                        15:begin    qam1024_bin[m][10:1]=332;
                            end                          
                        13:begin    qam1024_bin[m][10:1]=333;
                            end                          
                        9:begin     qam1024_bin[m][10:1]=334;
                            end                           
                        11:begin    qam1024_bin[m][10:1]=335;
                            end                         
                        -31:begin   qam1024_bin[m][10:1]=336;
                            end                          
                        -29:begin   qam1024_bin[m][10:1]=337;
                            end                          
                        -25:begin   qam1024_bin[m][10:1]=338;
                            end                          
                        -27:begin   qam1024_bin[m][10:1]=339;
                            end                          
                        -17:begin   qam1024_bin[m][10:1]=340;
                            end                             
                        -19:begin   qam1024_bin[m][10:1]=341;
                            end                           
                        -23:begin   qam1024_bin[m][10:1]=342;
                            end                          
                        -21:begin   qam1024_bin[m][10:1]=343;
                            end                          
                        -1:begin    qam1024_bin[m][10:1]=344;
                            end                          
                        -3:begin    qam1024_bin[m][10:1]=345;
                            end                          
                        -7:begin    qam1024_bin[m][10:1]=346;
                            end                          
                        -5:begin    qam1024_bin[m][10:1]=347;
                            end                          
                        -15:begin   qam1024_bin[m][10:1]=348;
                            end                          
                        -13:begin   qam1024_bin[m][10:1]=349;
                            end                          
                        -9:begin    qam1024_bin[m][10:1]=350;
                            end                          
                        -11:begin   qam1024_bin[m][10:1]=351;
                            end
                        endcase
                end       
            -5:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=352; 
                            end                                 
                        29:begin    qam1024_bin[m][10:1]=353; 
                            end                                  
                        25:begin    qam1024_bin[m][10:1]=354;
                            end                          
                        27:begin    qam1024_bin[m][10:1]=355;
                            end                          
                        17:begin    qam1024_bin[m][10:1]=356;
                            end                          
                        19:begin    qam1024_bin[m][10:1]=357;
                            end                          
                        23:begin    qam1024_bin[m][10:1]=358;
                            end                          
                        21:begin    qam1024_bin[m][10:1]=359;
                            end                             
                        1:begin     qam1024_bin[m][10:1]=360;
                            end                          
                        3:begin     qam1024_bin[m][10:1]=361;
                            end                          
                        7:begin     qam1024_bin[m][10:1]=362;
                            end                          
                        5:begin     qam1024_bin[m][10:1]=363;
                            end                          
                        15:begin    qam1024_bin[m][10:1]=364;
                            end                          
                        13:begin    qam1024_bin[m][10:1]=365;
                            end                          
                        9:begin     qam1024_bin[m][10:1]=366;
                            end                          
                        11:begin    qam1024_bin[m][10:1]=367;
                            end                         
                        -31:begin   qam1024_bin[m][10:1]=368;
                            end                          
                        -29:begin   qam1024_bin[m][10:1]=369;
                            end                             
                        -25:begin   qam1024_bin[m][10:1]=370;
                            end                          
                        -27:begin   qam1024_bin[m][10:1]=371;
                            end                          
                        -17:begin   qam1024_bin[m][10:1]=372;
                            end                           
                        -19:begin   qam1024_bin[m][10:1]=373;
                            end                          
                        -23:begin   qam1024_bin[m][10:1]=374;
                            end                          
                        -21:begin   qam1024_bin[m][10:1]=375;
                            end                          
                        -1:begin    qam1024_bin[m][10:1]=376;
                            end                          
                        -3:begin    qam1024_bin[m][10:1]=377;
                            end                           
                        -7:begin    qam1024_bin[m][10:1]=378;
                            end                          
                        -5:begin    qam1024_bin[m][10:1]=379;
                            end                             
                        -15:begin   qam1024_bin[m][10:1]=380;
                            end                          
                        -13:begin   qam1024_bin[m][10:1]=381;
                            end                          
                        -9:begin    qam1024_bin[m][10:1]=382;
                            end                          
                        -11:begin   qam1024_bin[m][10:1]=383;
                            end
                        endcase
                end 
            -15:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=384; 
                            end                                 
                        29:begin    qam1024_bin[m][10:1]=385; 
                            end                                   
                        25:begin    qam1024_bin[m][10:1]=386;
                            end                           
                        27:begin    qam1024_bin[m][10:1]=387;
                            end                           
                        17:begin    qam1024_bin[m][10:1]=388;
                            end                           
                        19:begin    qam1024_bin[m][10:1]=389;
                            end                             
                        23:begin    qam1024_bin[m][10:1]=390;
                            end                          
                        21:begin    qam1024_bin[m][10:1]=391;
                            end                           
                        1:begin     qam1024_bin[m][10:1]=392;
                            end                           
                        3:begin     qam1024_bin[m][10:1]=393;
                            end                           
                        7:begin     qam1024_bin[m][10:1]=394;
                            end                           
                        5:begin     qam1024_bin[m][10:1]=395;
                            end                           
                        15:begin    qam1024_bin[m][10:1]=396;
                            end                            
                        13:begin    qam1024_bin[m][10:1]=397;
                            end                           
                        9:begin     qam1024_bin[m][10:1]=398;
                            end                           
                        11:begin    qam1024_bin[m][10:1]=399;
                            end                         
                        -31:begin   qam1024_bin[m][10:1]=400;
                            end                          
                        -29:begin   qam1024_bin[m][10:1]=401;
                            end                          
                        -25:begin   qam1024_bin[m][10:1]=402;
                            end                          
                        -27:begin   qam1024_bin[m][10:1]=403;
                            end                          
                        -17:begin   qam1024_bin[m][10:1]=404;
                            end                           
                        -19:begin   qam1024_bin[m][10:1]=405;
                            end                          
                        -23:begin   qam1024_bin[m][10:1]=406;
                            end                          
                        -21:begin   qam1024_bin[m][10:1]=407;
                            end                           
                        -1:begin    qam1024_bin[m][10:1]=408;
                            end                          
                        -3:begin    qam1024_bin[m][10:1]=409;
                            end                             
                        -7:begin    qam1024_bin[m][10:1]=410;
                            end                           
                        -5:begin    qam1024_bin[m][10:1]=411;
                            end                           
                        -15:begin   qam1024_bin[m][10:1]=412;
                            end                          
                        -13:begin   qam1024_bin[m][10:1]=413;
                            end                          
                        -9:begin    qam1024_bin[m][10:1]=414;
                            end                          
                        -11:begin   qam1024_bin[m][10:1]=415;
                            end
                        endcase
                end 
             -13:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=416; 
                            end                                 
                        29:begin    qam1024_bin[m][10:1]=417; 
                            end                                    
                        25:begin    qam1024_bin[m][10:1]=418;
                            end                          
                        27:begin    qam1024_bin[m][10:1]=419;
                            end                             
                        17:begin    qam1024_bin[m][10:1]=420;
                            end                          
                        19:begin    qam1024_bin[m][10:1]=421;
                            end                          
                        23:begin    qam1024_bin[m][10:1]=422;
                            end                          
                        21:begin    qam1024_bin[m][10:1]=423;
                            end                           
                        1:begin     qam1024_bin[m][10:1]=424;
                            end                          
                        3:begin     qam1024_bin[m][10:1]=425;
                            end                          
                        7:begin     qam1024_bin[m][10:1]=426;
                            end                          
                        5:begin     qam1024_bin[m][10:1]=427;
                            end                          
                        15:begin    qam1024_bin[m][10:1]=428;
                            end                           
                        13:begin    qam1024_bin[m][10:1]=429;
                            end                             
                        9:begin     qam1024_bin[m][10:1]=430;
                            end                           
                        11:begin    qam1024_bin[m][10:1]=431;
                            end                          
                        -31:begin   qam1024_bin[m][10:1]=432;
                            end                          
                        -29:begin   qam1024_bin[m][10:1]=433;
                            end                          
                        -25:begin   qam1024_bin[m][10:1]=434;
                            end                          
                        -27:begin   qam1024_bin[m][10:1]=435;
                            end                          
                        -17:begin   qam1024_bin[m][10:1]=436;
                            end                         
                        -19:begin   qam1024_bin[m][10:1]=437;
                            end                          
                        -23:begin   qam1024_bin[m][10:1]=438;
                            end                          
                        -21:begin   qam1024_bin[m][10:1]=439;
                            end                             
                        -1:begin    qam1024_bin[m][10:1]=410;
                            end                             
                        -3:begin    qam1024_bin[m][10:1]=441;
                            end                          
                        -7:begin    qam1024_bin[m][10:1]=442;
                            end                          
                        -5:begin    qam1024_bin[m][10:1]=443;
                            end                          
                        -15:begin   qam1024_bin[m][10:1]=444;
                            end                          
                        -13:begin   qam1024_bin[m][10:1]=445;
                            end                          
                        -9:begin    qam1024_bin[m][10:1]=446;
                            end                          
                        -11:begin   qam1024_bin[m][10:1]=447;
                            end
                        endcase
                end 
            -9:begin/////////////////////////////////////////////////////////////
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=448; 
                            end                            
                        29:begin    qam1024_bin[m][10:1]=449; 
                            end                                       
                        25:begin    qam1024_bin[m][10:1]=450;
                            end                          
                        27:begin    qam1024_bin[m][10:1]=451;
                            end                          
                        17:begin    qam1024_bin[m][10:1]=452;
                            end                           
                        19:begin    qam1024_bin[m][10:1]=453;
                            end                           
                        23:begin    qam1024_bin[m][10:1]=454;
                            end                           
                        21:begin    qam1024_bin[m][10:1]=455;
                            end                           
                        1:begin     qam1024_bin[m][10:1]=456;
                            end                           
                        3:begin     qam1024_bin[m][10:1]=457;
                            end                           
                        7:begin     qam1024_bin[m][10:1]=458;
                            end                           
                        5:begin     qam1024_bin[m][10:1]=459;
                            end                          
                        15:begin    qam1024_bin[m][10:1]=460;
                            end                             
                        13:begin    qam1024_bin[m][10:1]=461;
                            end                             
                        9:begin     qam1024_bin[m][10:1]=462;
                            end                             
                        11:begin    qam1024_bin[m][10:1]=463;
                            end                             
                        -31:begin   qam1024_bin[m][10:1]=464;
                            end                             
                        -29:begin   qam1024_bin[m][10:1]=465;
                            end                         
                        -25:begin   qam1024_bin[m][10:1]=466;
                            end                             
                        -27:begin   qam1024_bin[m][10:1]=467;
                            end                             
                        -17:begin   qam1024_bin[m][10:1]=468;
                            end                             
                        -19:begin   qam1024_bin[m][10:1]=469;
                            end                                
                        -23:begin   qam1024_bin[m][10:1]=470;
                            end                             
                        -21:begin   qam1024_bin[m][10:1]=471;
                            end                             
                        -1:begin    qam1024_bin[m][10:1]=472;
                            end                             
                        -3:begin    qam1024_bin[m][10:1]=473;
                            end                             
                        -7:begin    qam1024_bin[m][10:1]=474;
                            end                             
                        -5:begin    qam1024_bin[m][10:1]=475;
                            end                             
                        -15:begin   qam1024_bin[m][10:1]=476;
                            end                             
                        -13:begin   qam1024_bin[m][10:1]=477;
                            end                             
                        -9:begin    qam1024_bin[m][10:1]=478;
                            end                             
                        -11:begin   qam1024_bin[m][10:1]=479;
                            end
                        endcase
                end
            -11:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=480; 
                            end                                   
                        29:begin    qam1024_bin[m][10:1]=481; 
                            end                                        
                        25:begin    qam1024_bin[m][10:1]=482;
                            end                             
                        27:begin    qam1024_bin[m][10:1]=483;
                            end                             
                        17:begin    qam1024_bin[m][10:1]=484;
                            end                             
                        19:begin    qam1024_bin[m][10:1]=485;
                            end                             
                        23:begin    qam1024_bin[m][10:1]=486;
                            end                             
                        21:begin    qam1024_bin[m][10:1]=487;
                            end                             
                        1:begin     qam1024_bin[m][10:1]=488;
                            end                             
                        3:begin     qam1024_bin[m][10:1]=489;
                            end                          
                        7:begin     qam1024_bin[m][10:1]=490;
                            end                         
                        5:begin     qam1024_bin[m][10:1]=491;
                            end                             
                        15:begin    qam1024_bin[m][10:1]=492;
                            end                             
                        13:begin    qam1024_bin[m][10:1]=493;
                            end                             
                        9:begin     qam1024_bin[m][10:1]=494;
                            end                             
                        11:begin    qam1024_bin[m][10:1]=495;
                            end                             
                        -31:begin   qam1024_bin[m][10:1]=496;
                            end                         
                        -29:begin   qam1024_bin[m][10:1]=497;
                            end                         
                        -25:begin   qam1024_bin[m][10:1]=498;
                            end                         
                        -27:begin   qam1024_bin[m][10:1]=499;
                            end                             
                        -17:begin   qam1024_bin[m][10:1]=500;
                            end                             
                        -19:begin   qam1024_bin[m][10:1]=501;
                            end                             
                        -23:begin   qam1024_bin[m][10:1]=502;
                            end                         
                        -21:begin   qam1024_bin[m][10:1]=503;
                            end                         
                        -1:begin    qam1024_bin[m][10:1]=504;
                            end                         
                        -3:begin    qam1024_bin[m][10:1]=505;
                            end                         
                        -7:begin    qam1024_bin[m][10:1]=506;
                            end                             
                        -5:begin    qam1024_bin[m][10:1]=507;
                            end                             
                        -15:begin   qam1024_bin[m][10:1]=508;
                            end                             
                        -13:begin   qam1024_bin[m][10:1]=509;
                            end                             
                        -9:begin    qam1024_bin[m][10:1]=510;
                            end                             
                        -11:begin   qam1024_bin[m][10:1]=511;
                            end
                        endcase
                end
             31:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=512; 
                            end                                 
                        29:begin    qam1024_bin[m][10:1]=513; 
                            end                                       
                        25:begin    qam1024_bin[m][10:1]=514;
                            end                             
                        27:begin    qam1024_bin[m][10:1]=515;
                            end                             
                        17:begin    qam1024_bin[m][10:1]=516;
                            end                             
                        19:begin    qam1024_bin[m][10:1]=517;
                            end                             
                        23:begin    qam1024_bin[m][10:1]=518;
                            end                             
                        21:begin    qam1024_bin[m][10:1]=519;
                            end                             
                        1:begin     qam1024_bin[m][10:1]=520;
                            end                             
                        3:begin     qam1024_bin[m][10:1]=521;
                            end                          
                        7:begin     qam1024_bin[m][10:1]=522;
                            end                         
                        5:begin     qam1024_bin[m][10:1]=523;
                            end                             
                        15:begin    qam1024_bin[m][10:1]=524;
                            end                         
                        13:begin    qam1024_bin[m][10:1]=525;
                            end                             
                        9:begin     qam1024_bin[m][10:1]=526;
                            end                         
                        11:begin    qam1024_bin[m][10:1]=527;
                            end                             
                        -31:begin   qam1024_bin[m][10:1]=528;
                            end                         
                        -29:begin   qam1024_bin[m][10:1]=529;
                            end                         
                        -25:begin   qam1024_bin[m][10:1]=530;
                            end                         
                        -27:begin   qam1024_bin[m][10:1]=531;
                            end                         
                        -17:begin   qam1024_bin[m][10:1]=532;
                            end                             
                        -19:begin   qam1024_bin[m][10:1]=533;
                            end                             
                        -23:begin   qam1024_bin[m][10:1]=534;
                            end                         
                        -21:begin   qam1024_bin[m][10:1]=535;
                            end                             
                        -1:begin    qam1024_bin[m][10:1]=536;
                            end                             
                        -3:begin    qam1024_bin[m][10:1]=537;
                            end                         
                        -7:begin    qam1024_bin[m][10:1]=538;
                            end                             
                        -5:begin    qam1024_bin[m][10:1]=539;
                            end                             
                        -15:begin   qam1024_bin[m][10:1]=540;
                            end                             
                        -13:begin   qam1024_bin[m][10:1]=541;
                            end                             
                        -9:begin    qam1024_bin[m][10:1]=542;
                            end                             
                        -11:begin   qam1024_bin[m][10:1]=543;
                            end
                        endcase
                end
            29:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=544; 
                            end                                  
                        29:begin    qam1024_bin[m][10:1]=545; 
                            end                                       
                        25:begin    qam1024_bin[m][10:1]=546;
                            end                             
                        27:begin    qam1024_bin[m][10:1]=547;
                            end                             
                        17:begin    qam1024_bin[m][10:1]=548;
                            end                             
                        19:begin    qam1024_bin[m][10:1]=549;
                            end                             
                        23:begin    qam1024_bin[m][10:1]=550;
                            end                             
                        21:begin    qam1024_bin[m][10:1]=551;
                            end                             
                        1:begin     qam1024_bin[m][10:1]=552;
                            end                             
                        3:begin     qam1024_bin[m][10:1]=553;
                            end                          
                        7:begin     qam1024_bin[m][10:1]=554;
                            end                             
                        5:begin     qam1024_bin[m][10:1]=555;
                            end                             
                        15:begin    qam1024_bin[m][10:1]=556;
                            end                             
                        13:begin    qam1024_bin[m][10:1]=557;
                            end                             
                        9:begin     qam1024_bin[m][10:1]=558;
                            end                             
                        11:begin    qam1024_bin[m][10:1]=559;
                            end                             
                        -31:begin   qam1024_bin[m][10:1]=560;
                            end                             
                        -29:begin   qam1024_bin[m][10:1]=561;
                            end                             
                        -25:begin   qam1024_bin[m][10:1]=562;
                            end                             
                        -27:begin   qam1024_bin[m][10:1]=563;
                            end                             
                        -17:begin   qam1024_bin[m][10:1]=564;
                            end                             
                        -19:begin   qam1024_bin[m][10:1]=565;
                            end                             
                        -23:begin   qam1024_bin[m][10:1]=566;
                            end                             
                        -21:begin   qam1024_bin[m][10:1]=567;
                            end                             
                        -1:begin    qam1024_bin[m][10:1]=568;
                            end                             
                        -3:begin    qam1024_bin[m][10:1]=569;
                            end                         
                        -7:begin    qam1024_bin[m][10:1]=570;
                            end                             
                        -5:begin    qam1024_bin[m][10:1]=571;
                            end                             
                        -15:begin   qam1024_bin[m][10:1]=572;
                            end                             
                        -13:begin   qam1024_bin[m][10:1]=573;
                            end                             
                        -9:begin    qam1024_bin[m][10:1]=574;
                            end                             
                        -11:begin   qam1024_bin[m][10:1]=575;
                            end
                        endcase
                end
            25:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=576; 
                            end                                
                        29:begin    qam1024_bin[m][10:1]=577; 
                            end                                     
                        25:begin    qam1024_bin[m][10:1]=578;
                            end                             
                        27:begin    qam1024_bin[m][10:1]=579;
                            end                             
                        17:begin    qam1024_bin[m][10:1]=580;
                            end                             
                        19:begin    qam1024_bin[m][10:1]=581;
                            end                             
                        23:begin    qam1024_bin[m][10:1]=582;
                            end                             
                        21:begin    qam1024_bin[m][10:1]=583;
                            end                             
                        1:begin     qam1024_bin[m][10:1]=584;
                            end                             
                        3:begin     qam1024_bin[m][10:1]=585;
                            end                          
                        7:begin     qam1024_bin[m][10:1]=586;
                            end                             
                        5:begin     qam1024_bin[m][10:1]=587;
                            end                             
                        15:begin    qam1024_bin[m][10:1]=588;
                            end                             
                        13:begin    qam1024_bin[m][10:1]=589;
                            end                             
                        9:begin     qam1024_bin[m][10:1]=590;
                            end                             
                        11:begin    qam1024_bin[m][10:1]=591;
                            end                             
                        -31:begin   qam1024_bin[m][10:1]=592;
                            end                             
                        -29:begin   qam1024_bin[m][10:1]=593;
                            end                             
                        -25:begin   qam1024_bin[m][10:1]=594;
                            end                             
                        -27:begin   qam1024_bin[m][10:1]=595;
                            end                             
                        -17:begin   qam1024_bin[m][10:1]=596;
                            end                             
                        -19:begin   qam1024_bin[m][10:1]=597;
                            end                             
                        -23:begin   qam1024_bin[m][10:1]=598;
                            end                             
                        -21:begin   qam1024_bin[m][10:1]=599;
                            end                             
                        -1:begin    qam1024_bin[m][10:1]=600;
                            end                             
                        -3:begin    qam1024_bin[m][10:1]=601;
                            end                         
                        -7:begin    qam1024_bin[m][10:1]=602;
                            end                             
                        -5:begin    qam1024_bin[m][10:1]=603;
                            end                             
                        -15:begin   qam1024_bin[m][10:1]=604;
                            end                             
                        -13:begin   qam1024_bin[m][10:1]=605;
                            end                             
                        -9:begin    qam1024_bin[m][10:1]=606;
                            end                             
                        -11:begin   qam1024_bin[m][10:1]=607;
                            end
                        endcase
                end
            27:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=608; 
                            end                               
                        29:begin    qam1024_bin[m][10:1]=609; 
                            end                                        
                        25:begin    qam1024_bin[m][10:1]=610;
                            end                             
                        27:begin    qam1024_bin[m][10:1]=611;
                            end                             
                        17:begin    qam1024_bin[m][10:1]=612;
                            end                             
                        19:begin    qam1024_bin[m][10:1]=613;
                            end                             
                        23:begin    qam1024_bin[m][10:1]=614;
                            end                             
                        21:begin    qam1024_bin[m][10:1]=615;
                            end                             
                        1:begin     qam1024_bin[m][10:1]=616;
                            end                             
                        3:begin     qam1024_bin[m][10:1]=617;
                            end                         
                        7:begin     qam1024_bin[m][10:1]=618;
                            end                         
                        5:begin     qam1024_bin[m][10:1]=619;
                            end                             
                        15:begin    qam1024_bin[m][10:1]=620;
                            end                             
                        13:begin    qam1024_bin[m][10:1]=621;
                            end                         
                        9:begin     qam1024_bin[m][10:1]=622;
                            end                             
                        11:begin    qam1024_bin[m][10:1]=623;
                            end                             
                        -31:begin   qam1024_bin[m][10:1]=624;
                            end                             
                        -29:begin   qam1024_bin[m][10:1]=625;
                            end                             
                        -25:begin   qam1024_bin[m][10:1]=626;
                            end                             
                        -27:begin   qam1024_bin[m][10:1]=627;
                            end                             
                        -17:begin   qam1024_bin[m][10:1]=628;
                            end                             
                        -19:begin   qam1024_bin[m][10:1]=629;
                            end                                
                        -23:begin   qam1024_bin[m][10:1]=630;
                            end                             
                        -21:begin   qam1024_bin[m][10:1]=631;
                            end                             
                        -1:begin    qam1024_bin[m][10:1]=632;
                            end                             
                        -3:begin    qam1024_bin[m][10:1]=633;
                            end                         
                        -7:begin    qam1024_bin[m][10:1]=634;
                            end                             
                        -5:begin    qam1024_bin[m][10:1]=635;
                            end                             
                        -15:begin   qam1024_bin[m][10:1]=636;
                            end                             
                        -13:begin   qam1024_bin[m][10:1]=637;
                            end                             
                        -9:begin    qam1024_bin[m][10:1]=638;
                            end                             
                        -11:begin   qam1024_bin[m][10:1]=639;
                            end
                        endcase
                end
            17:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=640; 
                            end                              
                        29:begin    qam1024_bin[m][10:1]=641; 
                            end                                        
                        25:begin    qam1024_bin[m][10:1]=642;
                            end                             
                        27:begin    qam1024_bin[m][10:1]=643;
                            end                             
                        17:begin    qam1024_bin[m][10:1]=644;
                            end                             
                        19:begin    qam1024_bin[m][10:1]=645;
                            end                             
                        23:begin    qam1024_bin[m][10:1]=646;
                            end                             
                        21:begin    qam1024_bin[m][10:1]=647;
                            end                             
                        1:begin     qam1024_bin[m][10:1]=648;
                            end                             
                        3:begin     qam1024_bin[m][10:1]=649;
                            end                         
                        7:begin     qam1024_bin[m][10:1]=650;
                            end                             
                        5:begin     qam1024_bin[m][10:1]=651;
                            end                             
                        15:begin    qam1024_bin[m][10:1]=652;
                            end                             
                        13:begin    qam1024_bin[m][10:1]=653;
                            end                             
                        9:begin     qam1024_bin[m][10:1]=654;
                            end                             
                        11:begin    qam1024_bin[m][10:1]=655;
                            end                             
                        -31:begin   qam1024_bin[m][10:1]=656;
                            end                             
                        -29:begin   qam1024_bin[m][10:1]=657;
                            end                             
                        -25:begin   qam1024_bin[m][10:1]=658;
                            end                             
                        -27:begin   qam1024_bin[m][10:1]=659;
                            end                             
                        -17:begin   qam1024_bin[m][10:1]=660;
                            end                             
                        -19:begin   qam1024_bin[m][10:1]=661;
                            end                             
                        -23:begin   qam1024_bin[m][10:1]=662;
                            end                             
                        -21:begin   qam1024_bin[m][10:1]=663;
                            end                             
                        -1:begin    qam1024_bin[m][10:1]=664;
                            end                             
                        -3:begin    qam1024_bin[m][10:1]=665;
                            end                         
                        -7:begin    qam1024_bin[m][10:1]=666;
                            end                             
                        -5:begin    qam1024_bin[m][10:1]=667;
                            end                             
                        -15:begin   qam1024_bin[m][10:1]=668;
                            end                             
                        -13:begin   qam1024_bin[m][10:1]=669;
                            end                             
                        -9:begin    qam1024_bin[m][10:1]=670;
                            end                             
                        -11:begin   qam1024_bin[m][10:1]=671;
                            end
                        endcase
                end
             19:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=672; 
                            end                              
                        29:begin    qam1024_bin[m][10:1]=673; 
                            end                                       
                        25:begin    qam1024_bin[m][10:1]=674;
                            end                             
                        27:begin    qam1024_bin[m][10:1]=675;
                            end                             
                        17:begin    qam1024_bin[m][10:1]=676;
                            end                             
                        19:begin    qam1024_bin[m][10:1]=677;
                            end                             
                        23:begin    qam1024_bin[m][10:1]=678;
                            end                             
                        21:begin    qam1024_bin[m][10:1]=679;
                            end                             
                        1:begin     qam1024_bin[m][10:1]=680;
                            end                             
                        3:begin     qam1024_bin[m][10:1]=681;
                            end                          
                        7:begin     qam1024_bin[m][10:1]=682;
                            end                             
                        5:begin     qam1024_bin[m][10:1]=683;
                            end                             
                        15:begin    qam1024_bin[m][10:1]=684;
                            end                             
                        13:begin    qam1024_bin[m][10:1]=685;
                            end                             
                        9:begin     qam1024_bin[m][10:1]=686;
                            end                             
                        11:begin    qam1024_bin[m][10:1]=687;
                            end                             
                        -31:begin   qam1024_bin[m][10:1]=688;
                            end                             
                        -29:begin   qam1024_bin[m][10:1]=689;
                            end                             
                        -25:begin   qam1024_bin[m][10:1]=690;
                            end                         
                        -27:begin   qam1024_bin[m][10:1]=691;
                            end                             
                        -17:begin   qam1024_bin[m][10:1]=692;
                            end                             
                        -19:begin   qam1024_bin[m][10:1]=693;
                            end                             
                        -23:begin   qam1024_bin[m][10:1]=694;
                            end                             
                        -21:begin   qam1024_bin[m][10:1]=695;
                            end                         
                        -1:begin    qam1024_bin[m][10:1]=696;
                            end                             
                        -3:begin    qam1024_bin[m][10:1]=697;
                            end                             
                        -7:begin    qam1024_bin[m][10:1]=698;
                            end                             
                        -5:begin    qam1024_bin[m][10:1]=699;
                            end                             
                        -15:begin   qam1024_bin[m][10:1]=700;
                            end                             
                        -13:begin   qam1024_bin[m][10:1]=701;
                            end                             
                        -9:begin    qam1024_bin[m][10:1]=702;
                            end                             
                        -11:begin   qam1024_bin[m][10:1]=703;
                            end
                        endcase
                end    
            23:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=704; 
                            end                             
                        29:begin    qam1024_bin[m][10:1]=705; 
                            end                                    
                        25:begin    qam1024_bin[m][10:1]=706;
                            end                         
                        27:begin    qam1024_bin[m][10:1]=707;
                            end                         
                        17:begin    qam1024_bin[m][10:1]=708;
                            end                         
                        19:begin    qam1024_bin[m][10:1]=709;
                            end                             
                        23:begin    qam1024_bin[m][10:1]=710;
                            end                         
                        21:begin    qam1024_bin[m][10:1]=711;
                            end                         
                        1:begin     qam1024_bin[m][10:1]=712;
                            end                             
                        3:begin     qam1024_bin[m][10:1]=713;
                            end                          
                        7:begin     qam1024_bin[m][10:1]=714;
                            end                             
                        5:begin     qam1024_bin[m][10:1]=715;
                            end                             
                        15:begin    qam1024_bin[m][10:1]=716;
                            end                             
                        13:begin    qam1024_bin[m][10:1]=717;
                            end                             
                        9:begin     qam1024_bin[m][10:1]=718;
                            end                             
                        11:begin    qam1024_bin[m][10:1]=719;
                            end                             
                        -31:begin   qam1024_bin[m][10:1]=720;
                            end                             
                        -29:begin   qam1024_bin[m][10:1]=721;
                            end                             
                        -25:begin   qam1024_bin[m][10:1]=722;
                            end                         
                        -27:begin   qam1024_bin[m][10:1]=723;
                            end                             
                        -17:begin   qam1024_bin[m][10:1]=724;
                            end                             
                        -19:begin   qam1024_bin[m][10:1]=725;
                            end                             
                        -23:begin   qam1024_bin[m][10:1]=726;
                            end                             
                        -21:begin   qam1024_bin[m][10:1]=727;
                            end                             
                        -1:begin    qam1024_bin[m][10:1]=728;
                            end                             
                        -3:begin    qam1024_bin[m][10:1]=729;
                            end                             
                        -7:begin    qam1024_bin[m][10:1]=730;
                            end                         
                        -5:begin    qam1024_bin[m][10:1]=731;
                            end                             
                        -15:begin   qam1024_bin[m][10:1]=732;
                            end                             
                        -13:begin   qam1024_bin[m][10:1]=733;
                            end                             
                        -9:begin    qam1024_bin[m][10:1]=734;
                            end                             
                        -11:begin   qam1024_bin[m][10:1]=735;
                            end
                        endcase
                end        
            21:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=736; 
                            end                             
                        29:begin    qam1024_bin[m][10:1]=737; 
                            end                                   
                        25:begin    qam1024_bin[m][10:1]=738;
                            end                         
                        27:begin    qam1024_bin[m][10:1]=739;
                            end                         
                        17:begin    qam1024_bin[m][10:1]=740;
                            end                         
                        19:begin    qam1024_bin[m][10:1]=741;
                            end                             
                        23:begin    qam1024_bin[m][10:1]=742;
                            end                         
                        21:begin    qam1024_bin[m][10:1]=743;
                            end                         
                        1:begin     qam1024_bin[m][10:1]=744;
                            end                             
                        3:begin     qam1024_bin[m][10:1]=745;
                            end                          
                        7:begin     qam1024_bin[m][10:1]=746;
                            end                             
                        5:begin     qam1024_bin[m][10:1]=747;
                            end                             
                        15:begin    qam1024_bin[m][10:1]=748;
                            end                             
                        13:begin    qam1024_bin[m][10:1]=749;
                            end                             
                        9:begin     qam1024_bin[m][10:1]=750;
                            end                             
                        11:begin    qam1024_bin[m][10:1]=751;
                            end                             
                        -31:begin   qam1024_bin[m][10:1]=752;
                            end                             
                        -29:begin   qam1024_bin[m][10:1]=753;
                            end                             
                        -25:begin   qam1024_bin[m][10:1]=754;
                            end                         
                        -27:begin   qam1024_bin[m][10:1]=755;
                            end                             
                        -17:begin   qam1024_bin[m][10:1]=756;
                            end                             
                        -19:begin   qam1024_bin[m][10:1]=757;
                            end                             
                        -23:begin   qam1024_bin[m][10:1]=758;
                            end                             
                        -21:begin   qam1024_bin[m][10:1]=759;
                            end                             
                        -1:begin    qam1024_bin[m][10:1]=760;
                            end                             
                        -3:begin    qam1024_bin[m][10:1]=761;
                            end                             
                        -7:begin    qam1024_bin[m][10:1]=762;
                            end                             
                        -5:begin    qam1024_bin[m][10:1]=763;
                            end                             
                        -15:begin   qam1024_bin[m][10:1]=764;
                            end                             
                        -13:begin   qam1024_bin[m][10:1]=765;
                            end                             
                        -9:begin    qam1024_bin[m][10:1]=766;
                            end                             
                        -11:begin   qam1024_bin[m][10:1]=767;
                            end
                        endcase
                end   
              1:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=768; 
                            end                             
                        29:begin    qam1024_bin[m][10:1]=769; 
                            end                                      
                        25:begin    qam1024_bin[m][10:1]=770;
                            end                             
                        27:begin    qam1024_bin[m][10:1]=771;
                            end                             
                        17:begin    qam1024_bin[m][10:1]=772;
                            end                             
                        19:begin    qam1024_bin[m][10:1]=773;
                            end                             
                        23:begin    qam1024_bin[m][10:1]=774;
                            end                             
                        21:begin    qam1024_bin[m][10:1]=775;
                            end                             
                        1:begin     qam1024_bin[m][10:1]=776;
                            end                             
                        3:begin     qam1024_bin[m][10:1]=777;
                            end                          
                        7:begin     qam1024_bin[m][10:1]=778;
                            end                             
                        5:begin     qam1024_bin[m][10:1]=779;
                            end                             
                        15:begin    qam1024_bin[m][10:1]=780;
                            end                             
                        13:begin    qam1024_bin[m][10:1]=781;
                            end                             
                        9:begin     qam1024_bin[m][10:1]=782;
                            end                             
                        11:begin    qam1024_bin[m][10:1]=783;
                            end                             
                        -31:begin   qam1024_bin[m][10:1]=784;
                            end                             
                        -29:begin   qam1024_bin[m][10:1]=785;
                            end                             
                        -25:begin   qam1024_bin[m][10:1]=786;
                            end                             
                        -27:begin   qam1024_bin[m][10:1]=787;
                            end                             
                        -17:begin   qam1024_bin[m][10:1]=788;
                            end                             
                        -19:begin   qam1024_bin[m][10:1]=789;
                            end                                
                        -23:begin   qam1024_bin[m][10:1]=790;
                            end                             
                        -21:begin   qam1024_bin[m][10:1]=791;
                            end                             
                        -1:begin    qam1024_bin[m][10:1]=792;
                            end                         
                        -3:begin    qam1024_bin[m][10:1]=793;
                            end                             
                        -7:begin    qam1024_bin[m][10:1]=794;
                            end                             
                        -5:begin    qam1024_bin[m][10:1]=795;
                            end                             
                        -15:begin   qam1024_bin[m][10:1]=796;
                            end                             
                        -13:begin   qam1024_bin[m][10:1]=797;
                            end                             
                        -9:begin    qam1024_bin[m][10:1]=798;
                            end                             
                        -11:begin   qam1024_bin[m][10:1]=799;
                            end
                        endcase
                end    
             3:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=800; 
                            end                             
                        29:begin    qam1024_bin[m][10:1]=801; 
                            end                                     
                        25:begin    qam1024_bin[m][10:1]=802;
                            end                             
                        27:begin    qam1024_bin[m][10:1]=803;
                            end                             
                        17:begin    qam1024_bin[m][10:1]=804;
                            end                             
                        19:begin    qam1024_bin[m][10:1]=805;
                            end                             
                        23:begin    qam1024_bin[m][10:1]=806;
                            end                             
                        21:begin    qam1024_bin[m][10:1]=807;
                            end                             
                        1:begin     qam1024_bin[m][10:1]=808;
                            end                             
                        3:begin     qam1024_bin[m][10:1]=809;
                            end                          
                        7:begin     qam1024_bin[m][10:1]=810;
                            end                             
                        5:begin     qam1024_bin[m][10:1]=811;
                            end                             
                        15:begin    qam1024_bin[m][10:1]=812;
                            end                             
                        13:begin    qam1024_bin[m][10:1]=813;
                            end                             
                        9:begin     qam1024_bin[m][10:1]=814;
                            end                             
                        11:begin    qam1024_bin[m][10:1]=815;
                            end                         
                        -31:begin   qam1024_bin[m][10:1]=816;
                            end                             
                        -29:begin   qam1024_bin[m][10:1]=817;
                            end                             
                        -25:begin   qam1024_bin[m][10:1]=818;
                            end                             
                        -27:begin   qam1024_bin[m][10:1]=819;
                            end                             
                        -17:begin   qam1024_bin[m][10:1]=820;
                            end                             
                        -19:begin   qam1024_bin[m][10:1]=821;
                            end                             
                        -23:begin   qam1024_bin[m][10:1]=822;
                            end                             
                        -21:begin   qam1024_bin[m][10:1]=823;
                            end                             
                        -1:begin    qam1024_bin[m][10:1]=824;
                            end                             
                        -3:begin    qam1024_bin[m][10:1]=825;
                            end                             
                        -7:begin    qam1024_bin[m][10:1]=826;
                            end                             
                        -5:begin    qam1024_bin[m][10:1]=827;
                            end                             
                        -15:begin   qam1024_bin[m][10:1]=828;
                            end                             
                        -13:begin   qam1024_bin[m][10:1]=829;
                            end                             
                        -9:begin    qam1024_bin[m][10:1]=830;
                            end                             
                        -11:begin   qam1024_bin[m][10:1]=831;
                            end
                        endcase
                end    
            7:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=832; 
                            end                             
                        29:begin    qam1024_bin[m][10:1]=833; 
                            end                                   
                        25:begin    qam1024_bin[m][10:1]=834;
                            end                             
                        27:begin    qam1024_bin[m][10:1]=835;
                            end                             
                        17:begin    qam1024_bin[m][10:1]=836;
                            end                             
                        19:begin    qam1024_bin[m][10:1]=837;
                            end                             
                        23:begin    qam1024_bin[m][10:1]=838;
                            end                             
                        21:begin    qam1024_bin[m][10:1]=839;
                            end                             
                        1:begin     qam1024_bin[m][10:1]=840;
                            end                             
                        3:begin     qam1024_bin[m][10:1]=841;
                            end                          
                        7:begin     qam1024_bin[m][10:1]=842;
                            end                         
                        5:begin     qam1024_bin[m][10:1]=843;
                            end                             
                        15:begin    qam1024_bin[m][10:1]=844;
                            end                             
                        13:begin    qam1024_bin[m][10:1]=845;
                            end                             
                        9:begin     qam1024_bin[m][10:1]=846;
                            end                             
                        11:begin    qam1024_bin[m][10:1]=847;
                            end                             
                        -31:begin   qam1024_bin[m][10:1]=848;
                            end                             
                        -29:begin   qam1024_bin[m][10:1]=849;
                            end                             
                        -25:begin   qam1024_bin[m][10:1]=850;
                            end                             
                        -27:begin   qam1024_bin[m][10:1]=851;
                            end                             
                        -17:begin   qam1024_bin[m][10:1]=852;
                            end                             
                        -19:begin   qam1024_bin[m][10:1]=853;
                            end                             
                        -23:begin   qam1024_bin[m][10:1]=854;
                            end                         
                        -21:begin   qam1024_bin[m][10:1]=855;
                            end                             
                        -1:begin    qam1024_bin[m][10:1]=856;
                            end                             
                        -3:begin    qam1024_bin[m][10:1]=857;
                            end                             
                        -7:begin    qam1024_bin[m][10:1]=858;
                            end                             
                        -5:begin    qam1024_bin[m][10:1]=859;
                            end                             
                        -15:begin   qam1024_bin[m][10:1]=860;
                            end                             
                        -13:begin   qam1024_bin[m][10:1]=861;
                            end                             
                        -9:begin    qam1024_bin[m][10:1]=862;
                            end                             
                        -11:begin   qam1024_bin[m][10:1]=863;
                            end
                        endcase
                end     
            5:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=864; 
                            end                             
                        29:begin    qam1024_bin[m][10:1]=865; 
                            end                                      
                        25:begin    qam1024_bin[m][10:1]=866;
                            end                             
                        27:begin    qam1024_bin[m][10:1]=867;
                            end                             
                        17:begin    qam1024_bin[m][10:1]=868;
                            end                             
                        19:begin    qam1024_bin[m][10:1]=869;
                            end                             
                        23:begin    qam1024_bin[m][10:1]=870;
                            end                             
                        21:begin    qam1024_bin[m][10:1]=871;
                            end                             
                        1:begin     qam1024_bin[m][10:1]=872;
                            end                             
                        3:begin     qam1024_bin[m][10:1]=873;
                            end                          
                        7:begin     qam1024_bin[m][10:1]=874;
                            end                             
                        5:begin     qam1024_bin[m][10:1]=875;
                            end                             
                        15:begin    qam1024_bin[m][10:1]=876;
                            end                             
                        13:begin    qam1024_bin[m][10:1]=877;
                            end                             
                        9:begin     qam1024_bin[m][10:1]=878;
                            end                             
                        11:begin    qam1024_bin[m][10:1]=879;
                            end                             
                        -31:begin   qam1024_bin[m][10:1]=880;
                            end                             
                        -29:begin   qam1024_bin[m][10:1]=881;
                            end                             
                        -25:begin   qam1024_bin[m][10:1]=882;
                            end                             
                        -27:begin   qam1024_bin[m][10:1]=883;
                            end                             
                        -17:begin   qam1024_bin[m][10:1]=884;
                            end                             
                        -19:begin   qam1024_bin[m][10:1]=885;
                            end                             
                        -23:begin   qam1024_bin[m][10:1]=886;
                            end                             
                        -21:begin   qam1024_bin[m][10:1]=887;
                            end                             
                        -1:begin    qam1024_bin[m][10:1]=888;
                            end                         
                        -3:begin    qam1024_bin[m][10:1]=889;
                            end                             
                        -7:begin    qam1024_bin[m][10:1]=890;
                            end                             
                        -5:begin    qam1024_bin[m][10:1]=891;
                            end                             
                        -15:begin   qam1024_bin[m][10:1]=892;
                            end                             
                        -13:begin   qam1024_bin[m][10:1]=893;
                            end                             
                        -9:begin    qam1024_bin[m][10:1]=894;
                            end                             
                        -11:begin   qam1024_bin[m][10:1]=895;
                            end
                        endcase
                end 
            15:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=896; 
                            end                             
                        29:begin    qam1024_bin[m][10:1]=897; 
                            end                                      
                        25:begin    qam1024_bin[m][10:1]=898;
                            end                             
                        27:begin    qam1024_bin[m][10:1]=899;
                            end                             
                        17:begin    qam1024_bin[m][10:1]=900;
                            end                             
                        19:begin    qam1024_bin[m][10:1]=901;
                            end                             
                        23:begin    qam1024_bin[m][10:1]=902;
                            end                             
                        21:begin    qam1024_bin[m][10:1]=903;
                            end                             
                        1:begin     qam1024_bin[m][10:1]=904;
                            end                             
                        3:begin     qam1024_bin[m][10:1]=905;
                            end                          
                        7:begin     qam1024_bin[m][10:1]=906;
                            end                             
                        5:begin     qam1024_bin[m][10:1]=907;
                            end                             
                        15:begin    qam1024_bin[m][10:1]=908;
                            end                             
                        13:begin    qam1024_bin[m][10:1]=909;
                            end                             
                        9:begin     qam1024_bin[m][10:1]=910;
                            end                             
                        11:begin    qam1024_bin[m][10:1]=911;
                            end                             
                        -31:begin   qam1024_bin[m][10:1]=912;
                            end                             
                        -29:begin   qam1024_bin[m][10:1]=913;
                            end                             
                        -25:begin   qam1024_bin[m][10:1]=914;
                            end                             
                        -27:begin   qam1024_bin[m][10:1]=915;
                            end                             
                        -17:begin   qam1024_bin[m][10:1]=916;
                            end                             
                        -19:begin   qam1024_bin[m][10:1]=917;
                            end                             
                        -23:begin   qam1024_bin[m][10:1]=918;
                            end                             
                        -21:begin   qam1024_bin[m][10:1]=919;
                            end                             
                        -1:begin    qam1024_bin[m][10:1]=920;
                            end                             
                        -3:begin    qam1024_bin[m][10:1]=921;
                            end                             
                        -7:begin    qam1024_bin[m][10:1]=922;
                            end                             
                        -5:begin    qam1024_bin[m][10:1]=923;
                            end                             
                        -15:begin   qam1024_bin[m][10:1]=924;
                            end                             
                        -13:begin   qam1024_bin[m][10:1]=925;
                            end                             
                        -9:begin    qam1024_bin[m][10:1]=926;
                            end                             
                        -11:begin   qam1024_bin[m][10:1]=927;
                            end                         
                        endcase                         
                end                                     
            13:begin                                    
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=928; 
                            end                             
                        29:begin    qam1024_bin[m][10:1]=929; 
                            end                                      
                        25:begin    qam1024_bin[m][10:1]=930;
                            end                         
                        27:begin    qam1024_bin[m][10:1]=931;
                            end                             
                        17:begin    qam1024_bin[m][10:1]=932;
                            end                             
                        19:begin    qam1024_bin[m][10:1]=933;
                            end                             
                        23:begin    qam1024_bin[m][10:1]=934;
                            end                             
                        21:begin    qam1024_bin[m][10:1]=935;
                            end                             
                        1:begin     qam1024_bin[m][10:1]=936;
                            end                         
                        3:begin     qam1024_bin[m][10:1]=937;
                            end                          
                        7:begin     qam1024_bin[m][10:1]=938;
                            end                             
                        5:begin     qam1024_bin[m][10:1]=939;
                            end                             
                        15:begin    qam1024_bin[m][10:1]=940;
                            end                             
                        13:begin    qam1024_bin[m][10:1]=941;
                            end                             
                        9:begin     qam1024_bin[m][10:1]=942;
                            end                             
                        11:begin    qam1024_bin[m][10:1]=943;
                            end                             
                        -31:begin   qam1024_bin[m][10:1]=944;
                            end                             
                        -29:begin   qam1024_bin[m][10:1]=945;
                            end                             
                        -25:begin   qam1024_bin[m][10:1]=946;
                            end                             
                        -27:begin   qam1024_bin[m][10:1]=947;
                            end                             
                        -17:begin   qam1024_bin[m][10:1]=948;
                            end                             
                        -19:begin   qam1024_bin[m][10:1]=949;
                            end                                
                        -23:begin   qam1024_bin[m][10:1]=950;
                            end                             
                        -21:begin   qam1024_bin[m][10:1]=951;
                            end                             
                        -1:begin    qam1024_bin[m][10:1]=952;
                            end                             
                        -3:begin    qam1024_bin[m][10:1]=953;
                            end                             
                        -7:begin    qam1024_bin[m][10:1]=954;
                            end                             
                        -5:begin    qam1024_bin[m][10:1]=955;
                            end                             
                        -15:begin   qam1024_bin[m][10:1]=956;
                            end                             
                        -13:begin   qam1024_bin[m][10:1]=957;
                            end                             
                        -9:begin    qam1024_bin[m][10:1]=958;
                            end                             
                        -11:begin   qam1024_bin[m][10:1]=959;
                            end
                        endcase
                end 
            9:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=960; 
                            end                             
                        29:begin    qam1024_bin[m][10:1]=961; 
                            end                                      
                        25:begin    qam1024_bin[m][10:1]=962;
                            end                             
                        27:begin    qam1024_bin[m][10:1]=963;
                            end                             
                        17:begin    qam1024_bin[m][10:1]=964;
                            end                             
                        19:begin    qam1024_bin[m][10:1]=965;
                            end                             
                        23:begin    qam1024_bin[m][10:1]=966;
                            end                             
                        21:begin    qam1024_bin[m][10:1]=967;
                            end                             
                        1:begin     qam1024_bin[m][10:1]=968;
                            end                             
                        3:begin     qam1024_bin[m][10:1]=969;
                            end                          
                        7:begin     qam1024_bin[m][10:1]=970;
                            end                             
                        5:begin     qam1024_bin[m][10:1]=971;
                            end                             
                        15:begin    qam1024_bin[m][10:1]=972;
                            end                             
                        13:begin    qam1024_bin[m][10:1]=973;
                            end                             
                        9:begin     qam1024_bin[m][10:1]=974;
                            end                             
                        11:begin    qam1024_bin[m][10:1]=975;
                            end                             
                        -31:begin   qam1024_bin[m][10:1]=976;
                            end                             
                        -29:begin   qam1024_bin[m][10:1]=977;
                            end                             
                        -25:begin   qam1024_bin[m][10:1]=978;
                            end                             
                        -27:begin   qam1024_bin[m][10:1]=979;
                            end                             
                        -17:begin   qam1024_bin[m][10:1]=980;
                            end                             
                        -19:begin   qam1024_bin[m][10:1]=981;
                            end                         
                        -23:begin   qam1024_bin[m][10:1]=982;
                            end                            
                        -21:begin   qam1024_bin[m][10:1]=983;
                            end                            
                        -1:begin    qam1024_bin[m][10:1]=984;
                            end                            
                        -3:begin    qam1024_bin[m][10:1]=985;
                            end                            
                        -7:begin    qam1024_bin[m][10:1]=986;
                            end                            
                        -5:begin    qam1024_bin[m][10:1]=987;
                            end                            
                        -15:begin   qam1024_bin[m][10:1]=988;
                            end                            
                        -13:begin   qam1024_bin[m][10:1]=989;
                            end                            
                        -9:begin    qam1024_bin[m][10:1]=990;
                            end                            
                        -11:begin   qam1024_bin[m][10:1]=991;
                            end
                        endcase
                end       
            11:begin
                    case(Qsymbol_qam1024[m])
                        31:begin    qam1024_bin[m][10:1]=992;  
                            end                               
                        29:begin    qam1024_bin[m][10:1]=993;  
                            end                                    
                        25:begin    qam1024_bin[m][10:1]=994;  
                            end                               
                        27:begin    qam1024_bin[m][10:1]=995;  
                            end                               
                        17:begin    qam1024_bin[m][10:1]=996;  
                            end                               
                        19:begin    qam1024_bin[m][10:1]=997;  
                            end                               
                        23:begin    qam1024_bin[m][10:1]=998;  
                            end                               
                        21:begin    qam1024_bin[m][10:1]=999;  
                            end                               
                        1:begin     qam1024_bin[m][10:1]=1000; 
                            end                               
                        3:begin     qam1024_bin[m][10:1]=1001; 
                            end                          
                        7:begin     qam1024_bin[m][10:1]=1002;
                            end                              
                        5:begin     qam1024_bin[m][10:1]=1003;
                            end                              
                        15:begin    qam1024_bin[m][10:1]=1004;
                            end                              
                        13:begin    qam1024_bin[m][10:1]=1005;
                            end                              
                        9:begin     qam1024_bin[m][10:1]=1006;
                            end                              
                        11:begin    qam1024_bin[m][10:1]=1007;
                            end                              
                        -31:begin   qam1024_bin[m][10:1]=1008;
                            end                              
                        -29:begin   qam1024_bin[m][10:1]=1009;
                            end                              
                        -25:begin   qam1024_bin[m][10:1]=1010;
                            end                              
                        -27:begin   qam1024_bin[m][10:1]=1011;
                            end                              
                        -17:begin   qam1024_bin[m][10:1]=1012;
                            end                              
                        -19:begin   qam1024_bin[m][10:1]=1013;
                            end                              
                        -23:begin   qam1024_bin[m][10:1]=1014;
                            end                         
                        -21:begin   qam1024_bin[m][10:1]=1015;
                            end                         
                        -1:begin    qam1024_bin[m][10:1]=1016;
                            end                         
                        -3:begin    qam1024_bin[m][10:1]=1017;
                            end                         
                        -7:begin    qam1024_bin[m][10:1]=1018;
                            end                         
                        -5:begin    qam1024_bin[m][10:1]=1019;
                            end                         
                        -15:begin   qam1024_bin[m][10:1]=1020;
                            end                         
                        -13:begin   qam1024_bin[m][10:1]=1021;
                            end                         
                        -9:begin    qam1024_bin[m][10:1]=1022;
                            end                         
                        -11:begin   qam1024_bin[m][10:1]=1023;
                            end
                        endcase
                end                                                
            endcase
            end end
endgenerate 


logic [6:1]grayinv32[1:64]={0,1,3,2,7,6,4,5,15,14,12,13,8,9,11,10,31,30,28,29,24,25,27,26,16,17,19,18,
23,22,20,21,63,62,60,61,56,57,59,58,48,49,51,50,55,54,52,53,32,33,35,34,39,38,36,37,47,46,44,45,40,41,43,42};
logic [6:1]qam_bin[340:1];
logic [1:2040]data_out=0;
logic [1:2040]data_out1024=0;
genvar j;
generate
    for (j = 1; j <=340; j = j + 1)begin: data_out_process
        always@(*)begin
            qam_bin[j]<=grayinv32[qam_gray_bin[j]+1];
            end 
        always@(posedge clk)begin
            data_out[(6*(j-1)+1):(6*(j-1)+6)]<=qam_bin[j];
            end 
    end
    
    for (j = 1; j <=204; j = j + 1)begin: data_out1024_process
        always@(posedge clk)begin
            data_out1024[(10*(j-1)+1):(10*(j-1)+10)]<=qam1024_bin[j];
            end 
    end
endgenerate   
logic [8:1]qam_output[255:1];
logic [8:1]qam1024_output[255:1];
genvar k;
generate
    for (k = 1; k <=255; k = k + 1)begin: qam_output_process
        always@(posedge clk)begin
            qam_output[k]<=data_out[(8*(k-1)+1):(8*(k-1)+8)];
            qam1024_output[k]<=data_out1024[(8*(k-1)+1):(8*(k-1)+8)];
            end 
    end
endgenerate 
//qam 64 output process
logic[15:0]axi_out_i=0;  
logic[15:0]axi_out_state; 
always @(posedge clk)begin
if (reset) begin
  axi_out_state=0;
end
else begin
  case (axi_out_state)
     0: begin
//        if (s_axis_inputI_tlast||s_axis_inputQ_tlast)//16 bit I/Q output
        if (s_axis_inputI_tlast_8 && s_axis_inputI_tvalid_8)//8 bit I/Q output
          axi_out_state <=1;
        else
          axi_out_state <=0;
     end
     1: begin
        if (m_axis_output_tready)
          axi_out_state <=2;
        else
          axi_out_state <=1;
     end
     
     2:begin
        if(axi_out_i<340)
            begin
                axi_out_i<=axi_out_i+1;
                axi_out_state<=2;
            end
        else begin
            axi_out_i<=0;
            axi_out_state<=0;
        end 
     end
  endcase
  end end
  
always@(posedge clk)
      begin
          if((axi_out_i>=1)&&(axi_out_i<=255)&&(axi_out_state==2))begin
              m_axis_output_tvalid<=1;
              m_axis_output_tdata<=qam_output[axi_out_i];
              end
          else begin
              m_axis_output_tvalid<=0;
              m_axis_output_tdata<=0;
              end
          if((axi_out_i==255)&&(axi_out_state==2))m_axis_output_tlast<=1;
          else m_axis_output_tlast<=0;
      end   
//qam 256 output process
logic[15:0]axi_out_i_qam256=0;  
logic[15:0]axi_out_state_qam256; 
always @(posedge clk)begin
if (reset) begin
  axi_out_state_qam256=0;
end
else begin
  case (axi_out_state_qam256)
     0: begin
//        if (s_axis_inputI_tlast||s_axis_inputQ_tlast)//16 bit I/Q output
        if (s_axis_inputI_tlast_qam256 && s_axis_inputI_tvalid_qam256)//8 bit I/Q output
          axi_out_state_qam256 <=1;
        else
          axi_out_state_qam256 <=0;
     end
     1: begin
        if (m_axis_output_tready_qam256)
          axi_out_state_qam256 <=2;
        else
          axi_out_state_qam256 <=1;
     end
     
     2:begin
        if(axi_out_i_qam256<340)
            begin
                axi_out_i_qam256<=axi_out_i_qam256+1;
                axi_out_state_qam256<=2;
            end
        else begin
            axi_out_i_qam256<=0;
            axi_out_state_qam256<=0;
        end 
     end
  endcase
  end end
  
always@(posedge clk)
      begin
          if((axi_out_i_qam256>=1)&&(axi_out_i_qam256<=255)&&(axi_out_state_qam256==2))begin
              m_axis_output_tvalid_qam256<=1;
              m_axis_output_tdata_qam256<=qam256_bin[axi_out_i_qam256];
              end
          else begin
              m_axis_output_tvalid_qam256<=0;
              m_axis_output_tdata_qam256<=0;
              end
          if((axi_out_i_qam256==255)&&(axi_out_state_qam256==2))m_axis_output_tlast_qam256<=1;
          else m_axis_output_tlast_qam256<=0;
      end   
      
//qam 1024 output process
logic[15:0]axi_out_i_qam1024=0;  
logic[15:0]axi_out_state_qam1024; 
always @(posedge clk)begin
if (reset) begin
  axi_out_state_qam1024=0;
end
else begin
  case (axi_out_state_qam1024)
     0: begin
//        if (s_axis_inputI_tlast||s_axis_inputQ_tlast)//16 bit I/Q output
        if (s_axis_inputI_tlast_qam1024 && s_axis_inputI_tvalid_qam1024)//8 bit I/Q output
          axi_out_state_qam1024 <=1;
        else
          axi_out_state_qam1024 <=0;
     end
     1: begin
        if (m_axis_output_tready_qam1024)
          axi_out_state_qam1024 <=2;
        else
          axi_out_state_qam1024 <=1;
     end
     
     2:begin
        if(axi_out_i_qam1024<340)
            begin
                axi_out_i_qam1024<=axi_out_i_qam1024+1;
                axi_out_state_qam1024<=2;
            end
        else begin
            axi_out_i_qam1024<=0;
            axi_out_state_qam1024<=0;
        end 
     end
  endcase
  end end
  
always@(posedge clk)
      begin
          if((axi_out_i_qam1024>=1)&&(axi_out_i_qam1024<=255)&&(axi_out_state_qam1024==2))begin
              m_axis_output_tvalid_qam1024<=1;
              m_axis_output_tdata_qam1024<=qam1024_output[axi_out_i_qam1024];
              end
          else begin
              m_axis_output_tvalid_qam1024<=0;
              m_axis_output_tdata_qam1024<=0;
              end
          if((axi_out_i_qam1024==255)&&(axi_out_state_qam1024==2))m_axis_output_tlast_qam1024<=1;
          else m_axis_output_tlast_qam1024<=0;
      end   
endmodule
