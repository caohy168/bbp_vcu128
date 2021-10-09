`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd_thz
// Engineer: caohuiyang
// 
// Create Date: 2020/03/10 12:38:15
// add comment line to be more understand and modify 2020/11/11
// Design Name: tpu transmit module
// Module Name: tpu
// Project Name: BFB(base frequency band) research group
// Target Devices:vcu128
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
`include "bbp_parameter.vh"
// the name include right means data from 10G MAC to tpu base band processor to RF
//parameter mux_number = 8;//2--lane2;4--lane4;8--lane8
//localparam   [15:0] DMA_BYTE_CNT = 16'h01D8;//caohy--dma package length 472=236*2
//localparam   [15:0] DMA_CNT = (DMA_BYTE_CNT/8+2);//caohy--dma package length 472=236*2
//localparam   [15:0] RS_CNT = 236;
module datastream_transfer #(
        //pcie parameter
        parameter AXI_DATA_WIDTH               = 64,
        parameter C_S_AXIS_DATA_WIDTH          = AXI_DATA_WIDTH,
        parameter C_M_AXIS_DATA_WIDTH          = AXI_DATA_WIDTH,
        //10g mac parameter
        parameter AXIS_TDATA_WIDTH =  64,
        parameter AXIS_TKEEP_WIDTH =  AXIS_TDATA_WIDTH/8,
        
        `ifdef self_rs
            parameter RS_CNT                        = 232,
            parameter DMA_BYTE_CNT                  = RS_CNT*2, 
            parameter DMA_CNT                       = DMA_BYTE_CNT/8+2,     
            parameter Buff_End                      = 58,    
            parameter Data_Cnt                      = 232  
        `else  
            parameter RS_CNT                        = 236,
            parameter DMA_BYTE_CNT                  = RS_CNT*2, 
            parameter DMA_CNT                       = DMA_BYTE_CNT/8+2, 
            parameter Buff_End                      = 59, 
            parameter Data_Cnt                      = 236    
        `endif
       
    )(

  input                        aclk,
  input                        pcie_user_clk,
  input                        reset,
  
  //DATA FROM PCIE
  // H2C AXI ST interface to user Channel 0
  input   [C_M_AXIS_DATA_WIDTH-1:0]   rx_axis_tdata_pcie ,
  input                               rx_axis_tlast_pcie ,
  input   [C_M_AXIS_DATA_WIDTH/8-1:0] rx_axis_tuser_pcie ,
  input   [C_M_AXIS_DATA_WIDTH/8-1:0] rx_axis_tkeep_pcie ,
  input                               rx_axis_tvalid_pcie,
  output logic                        rx_axis_tready_pcie,  
  `ifdef optiacal_10g
      //DATA FROM 10G MAC
      input [AXIS_TDATA_WIDTH-1:0] rx_axis_tdata_10g,
      input [AXIS_TKEEP_WIDTH-1:0] rx_axis_tkeep_10g,
      input                        rx_axis_tvalid_10g,
      input                        rx_axis_tlast_10g,
      input                        rx_axis_tuser_10g,
      output logic                 rx_axis_tready_10g,
  `endif
  //DATA TO TPU BAESBAND 
  output logic[AXIS_TDATA_WIDTH-1:0]tx_axis_tdata_right,
  output logic[AXIS_TKEEP_WIDTH-1:0]tx_axis_tkeep_right,
  output logic                      tx_axis_tvalid_right,
  output logic                      tx_axis_tlast_right,
  output logic                      tx_axis_tuser_right,
  input                             tx_axis_tready_right
  );

`ifdef self_check
    assign rx_axis_tready_pcie=tx_axis_tready_right;   
    logic [15:00]tranfer_state_right_pcie,pkg_cnt_right_pcie;
    logic [63:00]lane2_pkg_dat_right_pcie[Buff_End:1];
    logic [07:00]lane2_pkg_dat8_right_pcie[Buff_End*8:1];
    logic [15:00]lane2_pcie_i;
    always @ (posedge aclk) begin
        if(`mux_number==2)begin//receive date from pcie put into 64bit buffer lane2_pkg_dat_right_pcie
            if(rx_axis_tvalid_pcie)begin
                lane2_pcie_i=lane2_pcie_i+1;
                lane2_pkg_dat_right_pcie[lane2_pcie_i]=rx_axis_tdata_pcie;
            end
            else lane2_pcie_i=0;
        end
        else lane2_pkg_dat_right_pcie=lane2_pkg_dat_right_pcie;
        //transfer 64bit databus to 8bit databus by 64bit buffer lane2_pkg_dat_right ans 8bit buffer lane2_pkg_dat8_right
        lane2_pkg_dat8_right_pcie[8*lane2_pcie_i-7][07:00]=lane2_pkg_dat_right_pcie[lane2_pcie_i][07:00];
        lane2_pkg_dat8_right_pcie[8*lane2_pcie_i-6][07:00]=lane2_pkg_dat_right_pcie[lane2_pcie_i][15:08];
        lane2_pkg_dat8_right_pcie[8*lane2_pcie_i-5][07:00]=lane2_pkg_dat_right_pcie[lane2_pcie_i][23:16];
        lane2_pkg_dat8_right_pcie[8*lane2_pcie_i-4][07:00]=lane2_pkg_dat_right_pcie[lane2_pcie_i][31:24];
        lane2_pkg_dat8_right_pcie[8*lane2_pcie_i-3][07:00]=lane2_pkg_dat_right_pcie[lane2_pcie_i][39:32];
        lane2_pkg_dat8_right_pcie[8*lane2_pcie_i-2][07:00]=lane2_pkg_dat_right_pcie[lane2_pcie_i][47:40];
        lane2_pkg_dat8_right_pcie[8*lane2_pcie_i-1][07:00]=lane2_pkg_dat_right_pcie[lane2_pcie_i][55:48];
        lane2_pkg_dat8_right_pcie[8*lane2_pcie_i-0][07:00]=lane2_pkg_dat_right_pcie[lane2_pcie_i][63:56];
    end
    //data tranfer state control
    //state0 wait data tranfer from pcie
    //state1 save data from 10g MAC into bufer(lane2_pkg_dat_right and lane2_pkg_dat8_right) 
    //transfer the date to tpu baseband process
    always @ (posedge aclk) begin
        case (`mux_number)
            2:begin
                if (reset)begin
                    tranfer_state_right_pcie=0;
                    pkg_cnt_right_pcie=0;
                  end
                else
                  case (tranfer_state_right_pcie)
                      0:begin//wait
                        if(rx_axis_tvalid_pcie)tranfer_state_right_pcie=1;
                        else tranfer_state_right_pcie=0;
                        pkg_cnt_right_pcie=0;
                      end
                      1:begin//save data
                        if(pkg_cnt_right_pcie<(Buff_End+1))begin
                        pkg_cnt_right_pcie++;
                        tranfer_state_right_pcie=1;
                        end
                        else begin
                        tranfer_state_right_pcie=2;
                        pkg_cnt_right_pcie=0;
                        end
                      end
                      2:begin//transfer data
                        if(pkg_cnt_right_pcie<(Buff_End+1)*4)begin
                        pkg_cnt_right_pcie++;
                        tranfer_state_right_pcie=2;
                        end
                        else begin
                        tranfer_state_right_pcie=0;
                        pkg_cnt_right_pcie=0;
                        end
                      end
                      3:begin//
                      end
                      4:begin//
                      end
                      default : begin
                        tranfer_state_right_pcie=0;
                        pkg_cnt_right_pcie=0;
                      end
                    endcase
            end
            4: begin
            end
            8:begin
                if (reset)begin
                    tranfer_state_right_pcie=0;
                    pkg_cnt_right_pcie=0;
                  end
                else
                  case (tranfer_state_right_pcie)
                      0:begin//wait
                        if(rx_axis_tvalid_pcie)tranfer_state_right_pcie=1;
                        else tranfer_state_right_pcie=0;
                        pkg_cnt_right_pcie=0;
                      end
                      1:begin//transfer date 
                        if(pkg_cnt_right_pcie<Data_Cnt)begin
                        pkg_cnt_right_pcie++;
                        tranfer_state_right_pcie=1;
                        end
                        else begin
                        tranfer_state_right_pcie=0;
                        pkg_cnt_right_pcie=0;
                        end
                      end
                      2:begin//
                      end
                      3:begin//
                      end
                      4:begin//
                      end
                      default : begin
                        tranfer_state_right_pcie=0;
                        pkg_cnt_right_pcie=0;
                      end
                    endcase
            end
            default:begin
                if (reset)begin
                    tranfer_state_right_pcie=0;
                    pkg_cnt_right_pcie=0;
                  end
                else
                  case (tranfer_state_right_pcie)
                      0:begin//wait
                        if(rx_axis_tvalid_pcie)tranfer_state_right_pcie=1;
                        else tranfer_state_right_pcie=0;
                        pkg_cnt_right_pcie=0;
                      end
                      1:begin//transfer date 
                        if(pkg_cnt_right_pcie<Data_Cnt)begin
                        pkg_cnt_right_pcie++;
                        tranfer_state_right_pcie=1;
                        end
                        else begin
                        tranfer_state_right_pcie=0;
                        pkg_cnt_right_pcie=0;
                        end
                      end
                      2:begin//
                      end
                      3:begin//
                      end
                      4:begin//
                      end
                      default : begin
                        tranfer_state_right_pcie=0;
                        pkg_cnt_right_pcie=0;
                      end
                    endcase
              end
        endcase  
    end  
    
//////////////////////////////////////////////////////wait    
    logic [63:00]pkg_dat_pcie[DMA_CNT:1];
    logic [15:00]dat_pcie_i;
    always @ (posedge aclk) 
        begin
            
            if(rx_axis_tvalid_pcie)begin
                dat_pcie_i=dat_pcie_i+1;
                pkg_dat_pcie[dat_pcie_i]=rx_axis_tdata_pcie;
            end
            else dat_pcie_i=0;
            
        end
    //send the data to base band
    logic [15:00]state_sb;//sb means send data to base band
    logic [15:00]dat_pcie_j;
    
    logic [15:00]pkg_send_cnt=0;
    always @ (posedge aclk) begin
        case (`mux_number)
            2:begin
                if(pkg_send_cnt<RS_CNT && tranfer_state_right_pcie==2)begin
                        tx_axis_tdata_right[07:00]=lane2_pkg_dat8_right_pcie[2*(pkg_send_cnt+1)-1];
                        tx_axis_tdata_right[15:08]=lane2_pkg_dat8_right_pcie[2*(pkg_send_cnt+1)-0];
                        tx_axis_tdata_right[63:16]=0;
                    end
                else tx_axis_tdata_right=0; 
                
                if(tranfer_state_right_pcie==2 && pkg_send_cnt<=RS_CNT-1)begin
                    tx_axis_tvalid_right=1;
                    tx_axis_tkeep_right=8'hff;
                end
                else begin
                    tx_axis_tvalid_right=0;
                    tx_axis_tkeep_right=0;
                end
                if( pkg_send_cnt==RS_CNT-1)tx_axis_tlast_right=1;
                else tx_axis_tlast_right=0;
                tx_axis_tuser_right=1;
                
                if(tranfer_state_right_pcie==2)pkg_send_cnt++;
                else pkg_send_cnt=0;
            end
            8:begin
                tx_axis_tkeep_right = 8'hff;
                tx_axis_tuser_right = 0;
                rx_axis_tready_pcie=tx_axis_tready_right;
                if(reset)
                    begin
                        tx_axis_tdata_right=0;
                        tx_axis_tvalid_right=0;
                        tx_axis_tlast_right=0;
                        tx_axis_tuser_right=1;
                        tx_axis_tkeep_right=0;
                        state_sb=0;
                        dat_pcie_j=1;
                    end
                else
                    begin
                         case (state_sb)
                          0:begin//base state wait pcie data save into the buffer over
                            if(dat_pcie_i==DMA_CNT-2)state_sb=1;
                            else state_sb=0;
                            dat_pcie_j=1;
                          end
                          1:begin//send data from pcie buffer to base band by axi stream interface
                            if(dat_pcie_j<(DMA_CNT-1))tx_axis_tdata_right =pkg_dat_pcie[dat_pcie_j];
                            else if(dat_pcie_j>=(DMA_CNT-1) && dat_pcie_j<=(RS_CNT))tx_axis_tdata_right=64'h01234567_89abcdef;
                            else tx_axis_tdata_right=0;  
                            
                            if(dat_pcie_j==(RS_CNT))tx_axis_tlast_right = 1;
                            else tx_axis_tlast_right = 0;
                            
                            if(dat_pcie_j<=(RS_CNT))begin
                            tx_axis_tvalid_right=1;
                            tx_axis_tkeep_right=8'hff;
                            end
                            else begin
                                tx_axis_tvalid_right=0;
                                tx_axis_tkeep_right=0;
                            end
                            
                            if(dat_pcie_j==(RS_CNT+2))state_sb = 0;
                            else state_sb = 1;
                            
                            dat_pcie_j++;
                          end
                          2:begin//
                          end
                          3:begin//
                          end
                          4:begin//
                          end
                          default:begin
                            tx_axis_tdata_right=0;
                            tx_axis_tvalid_right=0;
                            tx_axis_tlast_right=0;
                            tx_axis_tuser_right=1;
                            tx_axis_tkeep_right=0;
                            state_sb=0;
                            dat_pcie_j=1;
                          end
                        endcase
                    end
                end
            default : begin
                tx_axis_tkeep_right = 8'hff;
                tx_axis_tuser_right = 0;
                rx_axis_tready_pcie=tx_axis_tready_right;
                if(reset)
                    begin
                        tx_axis_tdata_right=0;
                        tx_axis_tvalid_right=0;
                        tx_axis_tlast_right=0;
                        tx_axis_tuser_right=1;
                        tx_axis_tkeep_right=0;
                        state_sb=0;
                        dat_pcie_j=1;
                    end
                else
                    begin
                         case (state_sb)
                          0:begin//base state wait pcie data save into the buffer over
                            if(dat_pcie_i==DMA_CNT-2)state_sb=1;
                            else state_sb=0;
                            dat_pcie_j=1;
                          end
                          1:begin//send data from pcie buffer to base band by axi stream interface
                            if(dat_pcie_j<(DMA_CNT-1))tx_axis_tdata_right =pkg_dat_pcie[dat_pcie_j];
                            else if(dat_pcie_j>=(DMA_CNT-1) && dat_pcie_j<=(RS_CNT))tx_axis_tdata_right=64'h01234567_89abcdef;
                            else tx_axis_tdata_right=0;  
                            
                            if(dat_pcie_j==(RS_CNT))tx_axis_tlast_right = 1;
                            else tx_axis_tlast_right = 0;
                            
                            if(dat_pcie_j<=(RS_CNT))begin
                            tx_axis_tvalid_right=1;
                            tx_axis_tkeep_right=8'hff;
                            end
                            else begin
                                tx_axis_tvalid_right=0;
                                tx_axis_tkeep_right=0;
                            end
                            
                            if(dat_pcie_j==(RS_CNT+2))state_sb = 0;
                            else state_sb = 1;
                            
                            dat_pcie_j++;
                          end
                          2:begin//
                          end
                          3:begin//
                          end
                          4:begin//
                          end
                          default:begin
                            tx_axis_tdata_right=0;
                            tx_axis_tvalid_right=0;
                            tx_axis_tlast_right=0;
                            tx_axis_tuser_right=1;
                            tx_axis_tkeep_right=0;
                            state_sb=0;
                            dat_pcie_j=1;
                          end
                        endcase
                    end
                end
        endcase  
    end         

`endif

`ifdef pcie_endpoint
    assign rx_axis_tready_pcie=tx_axis_tready_right;   
    logic [15:00]tranfer_state_right_pcie,pkg_cnt_right_pcie;
    logic [63:00]lane2_pkg_dat_right_pcie[59:1];
    logic [07:00]lane2_pkg_dat8_right_pcie[472:1];
    logic [15:00]lane2_pcie_i;
    always @ (posedge pcie_user_clk) begin
        if(`mux_number==2)begin//receive date from pcie put into 64bit buffer lane2_pkg_dat_right_pcie
            if(rx_axis_tvalid_pcie)begin
                lane2_pcie_i=lane2_pcie_i+1;
                lane2_pkg_dat_right_pcie[lane2_pcie_i]=rx_axis_tdata_pcie;
            end
            else lane2_pcie_i=0;
        end
        else lane2_pkg_dat_right_pcie=lane2_pkg_dat_right_pcie;
        //transfer 64bit databus to 8bit databus by 64bit buffer lane2_pkg_dat_right ans 8bit buffer lane2_pkg_dat8_right
        lane2_pkg_dat8_right_pcie[8*lane2_pcie_i-7][07:00]=lane2_pkg_dat_right_pcie[lane2_pcie_i][07:00];
        lane2_pkg_dat8_right_pcie[8*lane2_pcie_i-6][07:00]=lane2_pkg_dat_right_pcie[lane2_pcie_i][15:08];
        lane2_pkg_dat8_right_pcie[8*lane2_pcie_i-5][07:00]=lane2_pkg_dat_right_pcie[lane2_pcie_i][23:16];
        lane2_pkg_dat8_right_pcie[8*lane2_pcie_i-4][07:00]=lane2_pkg_dat_right_pcie[lane2_pcie_i][31:24];
        lane2_pkg_dat8_right_pcie[8*lane2_pcie_i-3][07:00]=lane2_pkg_dat_right_pcie[lane2_pcie_i][39:32];
        lane2_pkg_dat8_right_pcie[8*lane2_pcie_i-2][07:00]=lane2_pkg_dat_right_pcie[lane2_pcie_i][47:40];
        lane2_pkg_dat8_right_pcie[8*lane2_pcie_i-1][07:00]=lane2_pkg_dat_right_pcie[lane2_pcie_i][55:48];
        lane2_pkg_dat8_right_pcie[8*lane2_pcie_i-0][07:00]=lane2_pkg_dat_right_pcie[lane2_pcie_i][63:56];
    end
    //data tranfer state control
    //state0 wait data tranfer from pcie
    //state1 save data from 10g MAC into bufer(lane2_pkg_dat_right and lane2_pkg_dat8_right) 
    //transfer the date to tpu baseband process
    always @ (posedge pcie_user_clk) begin
        case (`mux_number)
            2:begin
                if (reset)begin
                    tranfer_state_right_pcie=0;
                    pkg_cnt_right_pcie=0;
                  end
                else
                  case (tranfer_state_right_pcie)
                      0:begin//wait
                        if(rx_axis_tvalid_pcie)tranfer_state_right_pcie=1;
                        else tranfer_state_right_pcie=0;
                        pkg_cnt_right_pcie=0;
                      end
                      1:begin//save data
                        if(pkg_cnt_right_pcie<60)begin
                        pkg_cnt_right_pcie++;
                        tranfer_state_right_pcie=1;
                        end
                        else begin
                        tranfer_state_right_pcie=2;
                        pkg_cnt_right_pcie=0;
                        end
                      end
                      2:begin//transfer data
                        if(pkg_cnt_right_pcie<240)begin
                        pkg_cnt_right_pcie++;
                        tranfer_state_right_pcie=2;
                        end
                        else begin
                        tranfer_state_right_pcie=0;
                        pkg_cnt_right_pcie=0;
                        end
                      end
                      3:begin//
                      end
                      4:begin//
                      end
                      default : begin
                        tranfer_state_right_pcie=0;
                        pkg_cnt_right_pcie=0;
                      end
                    endcase
            end
            4: begin
            end
            8:begin
                if (reset)begin
                    tranfer_state_right_pcie=0;
                    pkg_cnt_right_pcie=0;
                  end
                else
                  case (tranfer_state_right_pcie)
                      0:begin//wait
                        if(rx_axis_tvalid_pcie)tranfer_state_right_pcie=1;
                        else tranfer_state_right_pcie=0;
                        pkg_cnt_right_pcie=0;
                      end
                      1:begin//transfer date 
                        if(pkg_cnt_right_pcie<236)begin
                        pkg_cnt_right_pcie++;
                        tranfer_state_right_pcie=1;
                        end
                        else begin
                        tranfer_state_right_pcie=0;
                        pkg_cnt_right_pcie=0;
                        end
                      end
                      2:begin//
                      end
                      3:begin//
                      end
                      4:begin//
                      end
                      default : begin
                        tranfer_state_right_pcie=0;
                        pkg_cnt_right_pcie=0;
                      end
                    endcase
            end
            default:begin
                if (reset)begin
                    tranfer_state_right_pcie=0;
                    pkg_cnt_right_pcie=0;
                  end
                else
                  case (tranfer_state_right_pcie)
                      0:begin//wait
                        if(rx_axis_tvalid_pcie)tranfer_state_right_pcie=1;
                        else tranfer_state_right_pcie=0;
                        pkg_cnt_right_pcie=0;
                      end
                      1:begin//transfer date 
                        if(pkg_cnt_right_pcie<236)begin
                        pkg_cnt_right_pcie++;
                        tranfer_state_right_pcie=1;
                        end
                        else begin
                        tranfer_state_right_pcie=0;
                        pkg_cnt_right_pcie=0;
                        end
                      end
                      2:begin//
                      end
                      3:begin//
                      end
                      4:begin//
                      end
                      default : begin
                        tranfer_state_right_pcie=0;
                        pkg_cnt_right_pcie=0;
                      end
                    endcase
              end
        endcase  
    end  
    
    
    logic [63:00]pkg_dat_pcie[DMA_CNT:1];
    logic [15:00]dat_pcie_i;
    always @ (posedge pcie_user_clk) 
        begin
            
            if(rx_axis_tvalid_pcie)begin
                dat_pcie_i=dat_pcie_i+1;
                pkg_dat_pcie[dat_pcie_i]=rx_axis_tdata_pcie;
            end
            else dat_pcie_i=0;
            
        end
    //send the data to base band
    logic [15:00]state_sb;//sb means send data to base band
    logic [15:00]dat_pcie_j;
    
    logic [15:00]pkg_send_cnt=0;
    always @ (posedge aclk) begin
        case (`mux_number)
            2:begin
                if(pkg_send_cnt<236 && tranfer_state_right_pcie==2)begin
                        tx_axis_tdata_right[07:00]=lane2_pkg_dat8_right_pcie[2*(pkg_send_cnt+1)-1];
                        tx_axis_tdata_right[15:08]=lane2_pkg_dat8_right_pcie[2*(pkg_send_cnt+1)-0];
                        tx_axis_tdata_right[63:16]=0;
                    end
                else tx_axis_tdata_right=0; 
                
                if(tranfer_state_right_pcie==2 && pkg_send_cnt<=235)begin
                    tx_axis_tvalid_right=1;
                    tx_axis_tkeep_right=8'hff;
                end
                else begin
                    tx_axis_tvalid_right=0;
                    tx_axis_tkeep_right=0;
                end
                if( pkg_send_cnt==235)tx_axis_tlast_right=1;
                else tx_axis_tlast_right=0;
                tx_axis_tuser_right=1;
                
                if(tranfer_state_right_pcie==2)pkg_send_cnt++;
                else pkg_send_cnt=0;
            end
            8:begin
                tx_axis_tkeep_right = 8'hff;
                tx_axis_tuser_right = 0;
                rx_axis_tready_pcie=tx_axis_tready_right;
                if(reset)
                    begin
                        tx_axis_tdata_right=0;
                        tx_axis_tvalid_right=0;
                        tx_axis_tlast_right=0;
                        tx_axis_tuser_right=1;
                        tx_axis_tkeep_right=0;
                        state_sb=0;
                        dat_pcie_j=1;
                    end
                else
                    begin
                         case (state_sb)
                          0:begin//base state wait pcie data save into the buffer over
                            if(dat_pcie_i==DMA_CNT-2)state_sb=1;
                            else state_sb=0;
                            dat_pcie_j=1;
                          end
                          1:begin//send data from pcie buffer to base band by axi stream interface
                            if(dat_pcie_j<(DMA_CNT-1))tx_axis_tdata_right =pkg_dat_pcie[dat_pcie_j];
                            else if(dat_pcie_j>=(DMA_CNT-1) && dat_pcie_j<=(RS_CNT))tx_axis_tdata_right=64'h01234567_89abcdef;
                            else tx_axis_tdata_right=0;  
                            
                            if(dat_pcie_j==(RS_CNT))tx_axis_tlast_right = 1;
                            else tx_axis_tlast_right = 0;
                            
                            if(dat_pcie_j<=(RS_CNT))begin
                            tx_axis_tvalid_right=1;
                            tx_axis_tkeep_right=8'hff;
                            end
                            else begin
                                tx_axis_tvalid_right=0;
                                tx_axis_tkeep_right=0;
                            end
                            
                            if(dat_pcie_j==(RS_CNT+2))state_sb = 0;
                            else state_sb = 1;
                            
                            dat_pcie_j++;
                          end
                          2:begin//
                          end
                          3:begin//
                          end
                          4:begin//
                          end
                          default:begin
                            tx_axis_tdata_right=0;
                            tx_axis_tvalid_right=0;
                            tx_axis_tlast_right=0;
                            tx_axis_tuser_right=1;
                            tx_axis_tkeep_right=0;
                            state_sb=0;
                            dat_pcie_j=1;
                          end
                        endcase
                    end
                end
            default : begin
                tx_axis_tkeep_right = 8'hff;
                tx_axis_tuser_right = 0;
                rx_axis_tready_pcie=tx_axis_tready_right;
                if(reset)
                    begin
                        tx_axis_tdata_right=0;
                        tx_axis_tvalid_right=0;
                        tx_axis_tlast_right=0;
                        tx_axis_tuser_right=1;
                        tx_axis_tkeep_right=0;
                        state_sb=0;
                        dat_pcie_j=1;
                    end
                else
                    begin
                         case (state_sb)
                          0:begin//base state wait pcie data save into the buffer over
                            if(dat_pcie_i==DMA_CNT-2)state_sb=1;
                            else state_sb=0;
                            dat_pcie_j=1;
                          end
                          1:begin//send data from pcie buffer to base band by axi stream interface
                            if(dat_pcie_j<(DMA_CNT-1))tx_axis_tdata_right =pkg_dat_pcie[dat_pcie_j];
                            else if(dat_pcie_j>=(DMA_CNT-1) && dat_pcie_j<=(RS_CNT))tx_axis_tdata_right=64'h01234567_89abcdef;
                            else tx_axis_tdata_right=0;  
                            
                            if(dat_pcie_j==(RS_CNT))tx_axis_tlast_right = 1;
                            else tx_axis_tlast_right = 0;
                            
                            if(dat_pcie_j<=(RS_CNT))begin
                            tx_axis_tvalid_right=1;
                            tx_axis_tkeep_right=8'hff;
                            end
                            else begin
                                tx_axis_tvalid_right=0;
                                tx_axis_tkeep_right=0;
                            end
                            
                            if(dat_pcie_j==(RS_CNT+2))state_sb = 0;
                            else state_sb = 1;
                            
                            dat_pcie_j++;
                          end
                          2:begin//
                          end
                          3:begin//
                          end
                          4:begin//
                          end
                          default:begin
                            tx_axis_tdata_right=0;
                            tx_axis_tvalid_right=0;
                            tx_axis_tlast_right=0;
                            tx_axis_tuser_right=1;
                            tx_axis_tkeep_right=0;
                            state_sb=0;
                            dat_pcie_j=1;
                          end
                        endcase
                    end
                end
        endcase  
    end         

`endif

`ifdef optiacal_10g
    assign rx_axis_tready_10g=tx_axis_tready_right;   
    logic [15:00]tranfer_state_right,pkg_cnt_right;
    logic [63:00]lane2_pkg_dat_right[59:1];
    logic [07:00]lane2_pkg_dat8_right[472:1];
    logic [15:00]lane2_i;
    always @ (posedge aclk) begin
        if(`mux_number==2)begin//receive date from 10g MAC put into 64bit buffer lane2_pkg_dat_right
            if(rx_axis_tvalid_10g)begin
                lane2_i=lane2_i+1;
                lane2_pkg_dat_right[lane2_i]=rx_axis_tdata_10g;
            end
            else lane2_i=0;
        end
        else lane2_pkg_dat_right=lane2_pkg_dat_right;
        //transfer 64bit databus to 8bit databus by 64bit buffer lane2_pkg_dat_right ans 8bit buffer lane2_pkg_dat8_right
        lane2_pkg_dat8_right[8*lane2_i-7][07:00]=lane2_pkg_dat_right[lane2_i][07:00];
        lane2_pkg_dat8_right[8*lane2_i-6][07:00]=lane2_pkg_dat_right[lane2_i][15:08];
        lane2_pkg_dat8_right[8*lane2_i-5][07:00]=lane2_pkg_dat_right[lane2_i][23:16];
        lane2_pkg_dat8_right[8*lane2_i-4][07:00]=lane2_pkg_dat_right[lane2_i][31:24];
        lane2_pkg_dat8_right[8*lane2_i-3][07:00]=lane2_pkg_dat_right[lane2_i][39:32];
        lane2_pkg_dat8_right[8*lane2_i-2][07:00]=lane2_pkg_dat_right[lane2_i][47:40];
        lane2_pkg_dat8_right[8*lane2_i-1][07:00]=lane2_pkg_dat_right[lane2_i][55:48];
        lane2_pkg_dat8_right[8*lane2_i-0][07:00]=lane2_pkg_dat_right[lane2_i][63:56];
    end
    
    //data tranfer state control
    //state0 wait data tranfer from 10g MAC
    //state1 save data from 10g MAC into bufer(lane2_pkg_dat_right and lane2_pkg_dat8_right) 
    //transfer the date to tpu baseband process
    always @ (posedge aclk) begin
        case (`mux_number)
            2:begin
                if (reset)begin
                    tranfer_state_right=0;
                    pkg_cnt_right=0;
                  end
                else
                  case (tranfer_state_right)
                      0:begin//wait
                        if(rx_axis_tvalid_10g)tranfer_state_right=1;
                        else tranfer_state_right=0;
                        pkg_cnt_right=0;
                      end
                      1:begin//save data
                        if(pkg_cnt_right<60)begin
                        pkg_cnt_right++;
                        tranfer_state_right=1;
                        end
                        else begin
                        tranfer_state_right=2;
                        pkg_cnt_right=0;
                        end
                      end
                      2:begin//transfer data
                        if(pkg_cnt_right<240)begin
                        pkg_cnt_right++;
                        tranfer_state_right=2;
                        end
                        else begin
                        tranfer_state_right=0;
                        pkg_cnt_right=0;
                        end
                      end
                      3:begin//
                      end
                      4:begin//
                      end
                      default : begin
                        tranfer_state_right=0;
                        pkg_cnt_right=0;
                      end
                    endcase
            end
            4: begin
            end
            8:begin
                if (reset)begin
                    tranfer_state_right=0;
                    pkg_cnt_right=0;
                  end
                else
                  case (tranfer_state_right)
                      0:begin//wait
                        if(rx_axis_tvalid_10g)tranfer_state_right=1;
                        else tranfer_state_right=0;
                        pkg_cnt_right=0;
                      end
                      1:begin//transfer date 
                        if(pkg_cnt_right<236)begin
                        pkg_cnt_right++;
                        tranfer_state_right=1;
                        end
                        else begin
                        tranfer_state_right=0;
                        pkg_cnt_right=0;
                        end
                      end
                      2:begin//
                      end
                      3:begin//
                      end
                      4:begin//
                      end
                      default : begin
                        tranfer_state_right=0;
                        pkg_cnt_right=0;
                      end
                    endcase
            end
            default:begin
                if (reset)begin
                    tranfer_state_right=0;
                    pkg_cnt_right=0;
                  end
                else
                  case (tranfer_state_right)
                      0:begin//wait
                        if(rx_axis_tvalid_10g)tranfer_state_right=1;
                        else tranfer_state_right=0;
                        pkg_cnt_right=0;
                      end
                      1:begin//transfer date 
                        if(pkg_cnt_right<236)begin
                        pkg_cnt_right++;
                        tranfer_state_right=1;
                        end
                        else begin
                        tranfer_state_right=0;
                        pkg_cnt_right=0;
                        end
                      end
                      2:begin//
                      end
                      3:begin//
                      end
                      4:begin//
                      end
                      default : begin
                        tranfer_state_right=0;
                        pkg_cnt_right=0;
                      end
                    endcase
              end
        endcase  
    end  
      
    always @ (posedge aclk) begin
        case (`mux_number)
            2:begin//tranfer the data from lane1-2
                if(pkg_cnt_right<236 && tranfer_state_right==2)begin
                    tx_axis_tdata_right[07:00]=lane2_pkg_dat8_right[2*(pkg_cnt_right+1)-1];
                    tx_axis_tdata_right[15:08]=lane2_pkg_dat8_right[2*(pkg_cnt_right+1)-0];
                    tx_axis_tdata_right[63:16]=0;
                end
                else tx_axis_tdata_right=0;  
            end
            4: begin
            end
            8:begin//package length from 10g mac 236*2,when lane 8 the vaild data equal to 236*2/8=59,the rest of data be filled by 64'h01234567_89abcdef
                if(pkg_cnt_right<59)tx_axis_tdata_right=rx_axis_tdata_10g;
                else if(pkg_cnt_right>=59 && pkg_cnt_right<=235)tx_axis_tdata_right=64'h01234567_89abcdef;
                else tx_axis_tdata_right=0;  
            end
            default : begin
                if(pkg_cnt_right<59)tx_axis_tdata_right=rx_axis_tdata_10g;
                else if(pkg_cnt_right>=59 && pkg_cnt_right<=235)tx_axis_tdata_right=64'h01234567_89abcdef;
                else tx_axis_tdata_right=0;  
              end
        endcase
           
    end 
    
    always @ (*) begin
        case (`mux_number)
            2:begin
                if(tranfer_state_right==2 && pkg_cnt_right<=235)begin
                    tx_axis_tvalid_right=1;
                    tx_axis_tkeep_right=8'hff;
                end
                else begin
                    tx_axis_tvalid_right=0;
                    tx_axis_tkeep_right=0;
                end
                if( pkg_cnt_right==235)tx_axis_tlast_right=1;
                else tx_axis_tlast_right=0;
                tx_axis_tuser_right=1;
            end
            4: begin
            end
            8:begin
                if(tranfer_state_right==1 && pkg_cnt_right<=235)begin
                    tx_axis_tvalid_right=1;
                    tx_axis_tkeep_right=8'hff;
                end
                else begin
                    tx_axis_tvalid_right=0;
                    tx_axis_tkeep_right=0;
                end
                if( pkg_cnt_right==235)tx_axis_tlast_right=1;
                else tx_axis_tlast_right=0;
                tx_axis_tuser_right=1;
            end
            default : begin
                if(tranfer_state_right==1 && pkg_cnt_right<=235)begin
                    tx_axis_tvalid_right=1;
                    tx_axis_tkeep_right=8'hff;
                end
                else begin
                    tx_axis_tvalid_right=0;
                    tx_axis_tkeep_right=0;
                end
                if( pkg_cnt_right==235)tx_axis_tlast_right=1;
                else tx_axis_tlast_right=0;
                tx_axis_tuser_right=1;
              end
        endcase  
    end 
`endif


endmodule