`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd_thz
// Engineer: caohy
// 
// Create Date: 11/08/2020 07:03:37 PM
// Design Name: 
// Module Name: kcu105_10gbaser
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
`timescale 1 ps / 1 ps
module kcu105_10gbaser #(
        parameter AXIS_TDATA_WIDTH =  64,
        parameter AXIS_TKEEP_WIDTH =  AXIS_TDATA_WIDTH/8
    )(

  input        refclk_p,
  input        refclk_n,
  input        reset,
  output [0:0] xphy_txp,
  output [0:0] xphy_txn,
  input  [0:0] xphy_rxp,
  input  [0:0] xphy_rxn,
  output [1:0] tx_disable,       
  output [2:0] leds,
  //rx receive from 10g MAC
  input                              rx_axis_aclk,//250m
  output logic[AXIS_TDATA_WIDTH-1:0] rx_axis_tdata,
  output logic[AXIS_TKEEP_WIDTH-1:0] rx_axis_tkeep,
  output logic                       rx_axis_tvalid,
  output logic                       rx_axis_tlast,
  output logic                       rx_axis_tuser,
  input                              rx_axis_tready,
  
  input [63:0]s_axis_tx_tdata,
  input [07:0]s_axis_tx_tkeep,
  input       s_axis_tx_tlast,
  output      s_axis_tx_tready,
  input [00:0]s_axis_tx_tuser,
  input       s_axis_tx_tvalid);
  

wire clk156;
wire reset_d;

logic [AXIS_TDATA_WIDTH-1:0] bbs_axis_tdata0;
logic [AXIS_TKEEP_WIDTH-1:0] bbs_axis_tkeep0;
logic                        bbs_axis_tvalid0;
logic                        bbs_axis_tlast0;
logic                        bbs_axis_tuser0;
logic                        bbs_axis_tready0;

bb_data_loopback_fifo bb_data_loopback_fifo (
  .s_axis_aresetn   (!reset),
  .s_axis_aclk      (rx_axis_aclk),
  .s_axis_tvalid    (s_axis_tx_tvalid),
  .s_axis_tready    (s_axis_tx_tready),
  .s_axis_tdata     (s_axis_tx_tdata),
  .s_axis_tkeep     (s_axis_tx_tkeep),
  .s_axis_tlast     (s_axis_tx_tlast),
  .s_axis_tuser     (s_axis_tx_tuser),
  .m_axis_aclk      (clk156),
  .m_axis_tvalid    (bbs_axis_tvalid0),
  .m_axis_tready    (bbs_axis_tready0),
  .m_axis_tdata     (bbs_axis_tdata0),
  .m_axis_tkeep     (bbs_axis_tkeep0),
  .m_axis_tlast     (bbs_axis_tlast0),
  .m_axis_tuser     (bbs_axis_tuser0));

wire [7:0]    xphy_status_ch;
wire          rx_statistics_valid_ch;
wire [29 : 0] rx_statistics_vector_ch;
wire          tx_statistics_valid_ch;
wire [25 : 0] tx_statistics_vector_ch;

wire [47 : 0] tg_config_ch;
wire          resetdone_ch;

logic         sim_speedup_control_ch;
reg [15:0]    reset_counter = 16'h00;

`ifdef OOB_SIM  
  reg [3:0]     reset_pulse = 4'b0000;
`else
  reg [3:0]     reset_pulse = 4'b1110;
`endif

wire       reset_sys;
wire [0:0] s_axi_aresetn;

wire [63:0]m_axis_rx_tdata;
wire [07:0]m_axis_rx_tkeep;
wire       m_axis_rx_tlast;
wire       m_axis_rx_tuser;
wire       m_axis_rx_tvalid;

// control gen_mon logic
reg  [31:0]tb_tg_config_ch = 0;
assign     tg_config_ch = {16'b0, tb_tg_config_ch};
reg  [03:0]tg_config_ch_state;
reg  [31:0]tg_config_ch_cnt;


always@(posedge clk156)begin
     if(reset)begin
         tg_config_ch_state  <= 0;
         tb_tg_config_ch     <= 0 ;
         tg_config_ch_cnt   <= 0 ;
     end
     else begin
         case(tg_config_ch_state)
             0:begin
                 tb_tg_config_ch        <= 0 ;
                 if(xphy_status_ch==8'h01)tg_config_ch_state<= 1;
                 else tg_config_ch_state<= 0;
                end
             1:begin
                 if(tg_config_ch_cnt==5000)
                     tg_config_ch_state    <= 2;
                 else tg_config_ch_state   <= 1;
                 tg_config_ch_cnt    <=tg_config_ch_cnt+1;
                 tb_tg_config_ch     <= 0 ;
             end
             2:begin
                 tg_config_ch_state   <= tg_config_ch_state;
                 tg_config_ch_cnt     <= tg_config_ch_cnt;
                 tb_tg_config_ch      <= 32'h004f_0002;
             end
             default:begin
             tg_config_ch_state   <= 0;
             tg_config_ch_cnt     <= 0;
             tb_tg_config_ch      <= 0;
             end
         endcase
     end
 end
 
// Initial reset pulse
always @(posedge clk156)
  begin
    if (!reset_counter[15])
      reset_counter   <=   reset_counter + 1'b1;   
    else
      reset_counter   <=   reset_counter;
  end

always @(posedge clk156)
  begin
   if(reset_counter[15])
      reset_pulse   <=   {1'b0, reset_pulse[3:1]};
  end
  
debouncer # (
         .SHIFT_REG_LEN (4))
debounce_reset
     (
         .clk   (clk156),
         .d_in  (reset),
         .d_out (reset_d)
     );

assign   reset_sys  =   reset_pulse[0] ||  reset_d;

axi_stream_gen_mon_0  //data source
# (
    .XIL_MAC_ID_THIS (48'h111100000000),// 00:00:00:00:11:11
    .XIL_MAC_ID_OTHER(48'h222200000000) // 00:00:00:00:22:22
  )  
axi_stream_gen_mon_0
(
    // Slave AXI-Lite Interface for register
    // reads and writes
        .s_axi_clk      (clk156),
        .s_axi_areset_n (!reset_sys),
    
        .rx_axis_tdata  (m_axis_rx_tdata ),
        .rx_axis_tkeep  (m_axis_rx_tkeep ),
        .rx_axis_tvalid (m_axis_rx_tvalid),
        .rx_axis_tlast  (m_axis_rx_tlast ),
        .rx_axis_tuser  (m_axis_rx_tuser ),
        .rx_axis_tready (                ),    
    
        .tg_config      (tg_config_ch    ),
    // AXI Stream Interface
    // Connects to the Ethernet MAC
        .axis_reset_n   (!reset_sys      ),
        .axis_clk       (clk156          ),             
   
        .tx_axis_tdata  (),
        .tx_axis_tkeep  (),
        .tx_axis_tvalid (),
        .tx_axis_tlast  (),
        .tx_axis_tuser  (),
        .tx_axis_tready (),
    //Other status signals
        .phy_status     (xphy_status_ch  ),
        
        .bb_rx_axis_aclk  (rx_axis_aclk  ),
        .bb_rx_axis_tdata (rx_axis_tdata ),
        .bb_rx_axis_tkeep (rx_axis_tkeep ),
        .bb_rx_axis_tvalid(rx_axis_tvalid),
        .bb_rx_axis_tlast (rx_axis_tlast ),
        .bb_rx_axis_tuser (rx_axis_tuser ),
        .bb_rx_axis_tready(rx_axis_tready)
    );

mac_phy_wrapper mac_phy_wrapper_i

       (     
        .s_axi_aresetn(s_axi_aresetn),
       
        .m_axis_rx_0_tdata (m_axis_rx_tdata),
        .m_axis_rx_0_tkeep (m_axis_rx_tkeep),
        .m_axis_rx_0_tlast (m_axis_rx_tlast),
        .m_axis_rx_0_tuser (m_axis_rx_tuser),
        .m_axis_rx_0_tvalid(m_axis_rx_tvalid),

        .s_axis_tx_0_tdata (bbs_axis_tdata0 ),
        .s_axis_tx_0_tkeep (bbs_axis_tkeep0 ),
        .s_axis_tx_0_tlast (bbs_axis_tlast0 ),
        .s_axis_tx_0_tready(bbs_axis_tready0),
        .s_axis_tx_0_tuser (bbs_axis_tuser0 ),
        .s_axis_tx_0_tvalid(bbs_axis_tvalid0),


        .core_status_ch0                    (xphy_status_ch           ),
        .prtad_ch0                          (5'b0                     ),
        .tx_disable_ch0                     (tx_disable[0]            ),
        .resetdone_ch0                      (resetdone_ch             ),
        // Output from PCS-PMA Ch0
        .core_clk156_out                    (clk156                   ), 
          
        .rx_statistics_ch0_vector           (rx_statistics_vector_ch  ),
        .rx_statistics_ch0_valid            (rx_statistics_valid_ch   ),
        .tx_statistics_ch0_vector           (tx_statistics_vector_ch  ),
        .tx_statistics_ch0_valid            (tx_statistics_valid_ch   ),

        .s_axis_pause_ch0_tdata             (16'b0                    ),
        .s_axis_pause_ch0_tvalid            (1'b0                     ),

        .rxn_ch0                            (xphy_rxn[0]              ),
        .rxp_ch0                            (xphy_rxp[0]              ),
        .txn_ch0                            (xphy_txn[0]              ),
        .txp_ch0                            (xphy_txp[0]              ),
        .sim_speedup_control_ch0            (sim_speedup_control_ch   ),
//        .sim_speedup_control_ch0            (), 

        .aux_resetn                         (!reset_sys               ),
        .mb_clk                             (clk156                   ),

        .refclk_diff_port_clk_n             (refclk_n                 ),
        .refclk_diff_port_clk_p             (refclk_p                 ),

        .reset                              (reset_sys                ),
        .reset_n                            (!reset_sys               )

        );

assign leds[0] = xphy_status_ch[0];
assign leds[1] = 0;
assign leds[2] = resetdone_ch;

endmodule
