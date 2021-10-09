`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: thgd_thz
// Engineer: caohuiyang
// 
// Create Date: 05/18/2021 06:22:42 PM
// Design Name: 
// Module Name: apskdemod_call
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// the apsk mod and demod have some problem,I think maybe some problem at apsk modem IP core.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module apskdemod_call(
    input clk,reset,
    
    output logic demodout_tvalid,
    input demodout_tready,
    output logic[7:0]demodout_tdata,
    output logic demodout_tlast,
    
    input apskI_tvalid,
    input [31:0]apskI_tdata,
    input apskQ_tvalid,
    input [31:0]apskQ_tdata);
    
logic ap_start=1;
logic ap_done,ap_idle,ap_ready;
logic mod_datin_tvalid,mod_datin_tready;
logic [8:1]mod_datin_tdata;   

logic [31:0]demod_datout;
logic demod_datout_tvalid;
//assign demodout_tdata=demod_datout[7:0];
//assign demodout_tvalid=demod_datout_tvalid;
logic demod_datout_tready;
assign demod_datout_tready=demodout_tready;
logic [31:0]demod_inputI_tdata,demod_inputQ_tdata;
logic demod_inputI_tvalid,demod_inputQ_tvalid;
logic demod_inputI_tready,demod_inputQ_tready;

 
logic [32:1]apskI_datain_temp[1:340];
logic [32:1]apskQ_datain_temp[1:340]; 

logic [15:0]axi_in_i=1;
logic [15:0]axi_in_j=1;

always@(posedge clk)
    begin
        if(reset)begin
            axi_in_i=1;
            axi_in_j=1;
        end
        else begin
            if(apskI_tvalid)begin
                apskI_datain_temp[axi_in_i]=apskI_tdata;
                if(axi_in_i<340)axi_in_i=axi_in_i+1;
                else axi_in_i=1;
            end
            else axi_in_i=1;
            
            if(apskQ_tvalid)begin
                apskQ_datain_temp[axi_in_j]=apskQ_tdata;
                if(axi_in_j<340)axi_in_j=axi_in_j+1;
                else axi_in_j<=1;
            end
            else axi_in_j=1;
        end
        
    end 

logic [15:0]apsk_state,apskIin_cnt,apskQin_cnt,IQ_interval_cnt;

always @(posedge clk)begin
    if (reset) begin
      apsk_state=0;
      apskIin_cnt=1;
      apskQin_cnt=1;
      demod_inputI_tvalid=0;
      demod_inputQ_tvalid=0;
      demod_inputI_tdata=0;
      demod_inputQ_tdata=0;
      IQ_interval_cnt=0;
    end
    else begin
      case (apsk_state)
         0:begin
            if (apskI_tvalid)
                apsk_state =1;
            else
                apsk_state =0;end
         1:begin
            if (!apskI_tvalid)
                apsk_state =2;
            else 
                apsk_state =1;end//state0-1 receive IQ data 
         2:begin
            if(demod_inputI_tready)begin
                if(apskIin_cnt<341)begin                    
                    demod_inputI_tdata  =apskI_datain_temp[apskIin_cnt];
                    demod_inputI_tvalid =1;
                    apskIin_cnt=apskIin_cnt+1;
                    apsk_state =2;

                end
                else begin
                    apskIin_cnt=1;
                    apsk_state =4;
                    demod_inputI_tdata  =0;
                    demod_inputI_tvalid =0;
                end
                demod_inputQ_tdata  =0;
                demod_inputQ_tvalid =0;
                end
            else apsk_state =2; end
        3:begin
            if(demod_inputQ_tready)begin
                if(apskQin_cnt<341)begin
                    demod_inputQ_tdata  =apskQ_datain_temp[apskQin_cnt];
                    demod_inputQ_tvalid =1;
                    apskQin_cnt=apskQin_cnt+1;
                    apsk_state =3;
                end
                else begin
                    apskQin_cnt=1;
                    apsk_state =0;
                    demod_inputQ_tdata  =0;
                    demod_inputQ_tvalid =0;
                end
                demod_inputI_tdata  =0;
                demod_inputI_tvalid =0;
                end
            else apsk_state =3; end
        4:begin
            if(IQ_interval_cnt<10)begin
                apsk_state= 4;
                IQ_interval_cnt=IQ_interval_cnt+1;
                end
            else begin
                apsk_state= 3;
                IQ_interval_cnt=0;
                end
        end
      endcase
      end end
 
apskdemod64 apskdemod64 (
        .ap_clk(clk),
        .ap_rst_n(!reset),
        .ap_start(ap_start),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),
        .demod_datout_TDATA(demod_datout),
        .demod_datout_TVALID(demod_datout_tvalid),
        .demod_datout_TREADY(demod_datout_tready),
        .demodi_TDATA(demod_inputI_tdata),
        .demodi_TVALID(demod_inputI_tvalid),
        .demodi_TREADY(demod_inputI_tready),
        .demodq_TDATA(demod_inputQ_tdata),
        .demodq_TVALID(demod_inputQ_tvalid),
        .demodq_TREADY(demod_inputQ_tready));
        
logic [15:0]axi_out_i=1;
logic [8:1]apsk_out[255:1];
logic [6:1]apsk_demodout[340:1];
logic [1:2040]data_out=0;
always@(posedge clk)
    begin
        if(demod_datout_tvalid)begin
            if(axi_out_i<340)axi_out_i<=axi_out_i+1;
            else axi_out_i<=1;
            apsk_demodout[axi_out_i]<=demod_datout[5:0];end
        else axi_out_i<=1;
    end 
genvar j;
generate
    for (j = 1; j <=340; j = j + 1)begin: apsk_bin_process
        always@(posedge clk)begin
            data_out[(6*(j-1)+1):(6*(j-1)+6)]<=apsk_demodout[j];
            end 
    end
endgenerate

genvar k;
generate
    for (k = 1; k <=255; k = k + 1)begin: qam_output_process
        always@(posedge clk)begin
            apsk_out[k]<=data_out[(8*(k-1)+1):(8*(k-1)+8)];
            end 
    end
endgenerate 

logic [31:00]apsk_out_state;
logic [31:00]apsk_out_cnt;

always @(posedge clk)begin
    if (reset) begin
      apsk_out_state=0;
      demodout_tvalid=0;
      demodout_tdata=0;
      demodout_tlast=0;
      apsk_out_cnt=1;
    end
    else begin
      case (apsk_out_state)
         0:begin
            if (demod_datout_tvalid)
                apsk_out_state =1;
            else
                apsk_out_state =0;end
         1:begin
            if (!demod_datout_tvalid)//data has been transfer
                apsk_out_state =2;
            else 
                apsk_out_state =1;end
         2:begin
            if(demodout_tready)begin
                if(apsk_out_cnt<255)begin                    
                    demodout_tdata  =apsk_out[apsk_out_cnt];
                    demodout_tvalid =1;
                    apsk_out_cnt=apsk_out_cnt+1;
                    apsk_out_state =2;

                end
                else begin
                    apsk_out_cnt=1;
                    apsk_out_state =0;
                    demodout_tdata  =0;
                    demodout_tvalid =0;
                end
            end
            else apsk_out_state =2; end

      endcase
      end end

endmodule
