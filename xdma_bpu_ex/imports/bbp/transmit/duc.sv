`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd
// Engineer: caohuiyang
// 
// Create Date: 03/29/2020 06:31:44 PM
// Design Name: 
// Module Name: duc
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
module duc(
    input aclk,reset,
    input s_axis_data_tvalid_I,s_axis_data_tvalid_Q,
    input s_axis_data_tlast_I,s_axis_data_tlast_Q,
    output logic s_axis_dataI_tready,s_axis_dataQ_tready,
    input signed[7:0]s_axis_data_tdata_I,s_axis_data_tdata_Q,
    input m_axis_data_tready_duc_I,m_axis_data_tready_duc_Q,
    output logic m_axis_data_tvalid_duc_I,m_axis_data_tvalid_duc_Q,
    output logic m_axis_data_tlast_duc_I,m_axis_data_tlast_duc_Q,
    output logic [15:0]m_axis_data_tdata_duc_I,m_axis_data_tdata_duc_Q

    );
assign s_axis_dataI_tready=1;
assign s_axis_dataQ_tready=1;
logic s_axis_data_tvalid_I1,s_axis_data_tvalid_I2,s_axis_data_tvalid_I3;
logic s_axis_data_tvalid_Q1,s_axis_data_tvalid_Q2,s_axis_data_tvalid_Q3;
logic s_axis_data_tlast_I1,s_axis_data_tlast_I2,s_axis_data_tlast_I3;
logic s_axis_data_tlast_Q1,s_axis_data_tlast_Q2,s_axis_data_tlast_Q3;
always_ff @(posedge aclk)begin//latch 3 clocks
    s_axis_data_tvalid_I1<=s_axis_data_tvalid_I;
    s_axis_data_tvalid_I2<=s_axis_data_tvalid_I1;
    s_axis_data_tvalid_I3<=s_axis_data_tvalid_I2;
    s_axis_data_tvalid_Q1<=s_axis_data_tvalid_Q;
    s_axis_data_tvalid_Q2<=s_axis_data_tvalid_Q1;
    s_axis_data_tvalid_Q3<=s_axis_data_tvalid_Q2;
    
    s_axis_data_tlast_I1<=s_axis_data_tlast_I;
    s_axis_data_tlast_I2<=s_axis_data_tlast_I1;
    s_axis_data_tlast_I3<=s_axis_data_tlast_I2;
    s_axis_data_tlast_Q1<=s_axis_data_tlast_Q;
    s_axis_data_tlast_Q2<=s_axis_data_tlast_Q1;
    s_axis_data_tlast_Q3<=s_axis_data_tlast_Q2;
//    m_axis_data_tvalid_duc_I<=s_axis_data_tvalid_I1;
//    m_axis_data_tvalid_duc_Q<=s_axis_data_tvalid_Q1;
end
//assign m_axis_data_tvalid_duc_I=1;
//assign m_axis_data_tvalid_duc_Q=1;
//$$$$$$$$$$$$$$Produce carrie$$$$$$$$$$$$$$$$

logic vco_datai_valid,vco_dataq_valid;
logic signed[7:0] vco_datai,vco_dataq;
logic vco_phasei_valid,vco_phaseq_valid;
logic signed[15:0] vco_phasei,vco_phaseq;

dds_125m_i dds_125m_i
   (
    .aclk(aclk),
    .m_axis_data_tvalid(vco_datai_valid),
    .m_axis_data_tdata(vco_datai),
    .m_axis_phase_tvalid(vco_phasei_valid),
    .m_axis_phase_tdata(vco_phasei));
dds_125m_q dds_125m_q
   (
    .aclk(aclk),
    .m_axis_data_tvalid(vco_dataq_valid),
    .m_axis_data_tdata(vco_dataq),
    .m_axis_phase_tvalid(vco_phaseq_valid),
    .m_axis_phase_tdata(vco_phaseq)
  ); 
  
logic signed[7:0]ram_cos_temp[1:680];
logic signed[7:0]ram_sin_temp[1:680];

logic signed[7:0]ram_cos[1:680];
logic signed[7:0]ram_cos1;
logic signed[7:0]ram_sin[1:680];
logic signed[7:0]ram_sin1;
//logic signed[7:0]ram_cos[1:340];
//logic signed[7:0]ram_sin[1:340];
logic [15:0]ram_cos_cnt=1;
logic [15:0]ram_sin_cnt=1;
logic[15:0]ram_cos_state=0; 
logic[15:0]ram_sin_state=0;         

always @(posedge aclk)begin
begin
  case (ram_cos_state)
     0: begin//get the high dot
        if (vco_phasei==-6559)
          ram_cos_state <=1;
        else
          ram_cos_state <=0;
     end
     1: begin//if no interpolation get 340 dot,if interpolation2 get 680 dot
        if (ram_cos_cnt==680)
//        if (ram_cos_cnt==340)
          ram_cos_state <=2;
        else
          ram_cos_state <=1;
        ram_cos_cnt<=ram_cos_cnt+1;
        ram_cos[ram_cos_cnt]<=vco_datai;
        
        ram_cos_temp[ram_cos_cnt]<=vco_datai;
     end
     
     2:begin
        ram_cos_state <=ram_cos_state;
        end 
  endcase
  case (ram_sin_state)
     0: begin//get 0 dot
        if (vco_phaseq==-6565)
          ram_sin_state <=1;
        else
          ram_sin_state <=0;
     end
     1: begin//get 340 dot
        if (ram_sin_cnt==680)
//        if (ram_sin_cnt==340)
          ram_sin_state <=2;
        else
          ram_sin_state <=1;
        ram_sin_cnt<=ram_sin_cnt+1;
        ram_sin[ram_sin_cnt]<=vco_dataq;
        
        ram_sin_temp[ram_sin_cnt]<=vco_dataq;
     end
     
     2:begin
        ram_sin_state <=ram_sin_state;
        end 
  endcase
  end end
  
//$$$$$$$$$$$$$$$$$cos(A+B)$$$$$$$$$$$$$$$$$$
logic [15:0]mult_cnt=1;
always @(posedge aclk)begin
    if(s_axis_data_tvalid_I)mult_cnt<=mult_cnt+1;
    else if(mult_cnt>=680)mult_cnt<=1;
//    else if(mult_cnt>=340)mult_cnt<=1;
    else mult_cnt<=mult_cnt;
    
//    ram_cos1=ram_cos[mult_cnt];
//    ram_sin1=ram_sin[mult_cnt];
    ram_cos1=ram_cos_temp[mult_cnt];
    ram_sin1=ram_sin_temp[mult_cnt];
end
//======cosA*cosB=I*vcoi
logic signed[15:0] cos_sub_data1;
logic signed[15:0] cos_sub_data2; 

logic signed[15:0] temp_cos_sub_data1;
logic signed[15:0] temp_cos_sub_data2; 

mult_gen_duc mult_duc_coscos(
    .CLK(aclk),
    .A(s_axis_data_tdata_I),
    .B(ram_cos1),
    .P(cos_sub_data1));     
//=====sinA*sinB=Q*vcoq
mult_gen_duc mult_duc_sinsin(
    .CLK(aclk),
    .A(s_axis_data_tdata_Q),
    .B(ram_sin1),
    .P(cos_sub_data2));          
always @(posedge aclk)begin
    temp_cos_sub_data1 = s_axis_data_tdata_I * ram_cos1; 
    temp_cos_sub_data2 = s_axis_data_tdata_Q * ram_sin1; 
end                                    
//======= cos(A+B)=cosA*cosB-sinA*sinB       
logic signed[15:0] cos_sub_result;        
sub_duc sub_duc(
    .A(cos_sub_data1),
    .B(cos_sub_data2),
    .CLK(aclk),
    .S(cos_sub_result));    

//always @(*)begin
//    if(ram_cos_cnt==681)
//        $writememh("/home/caohuiyang/Work/bbp_vcu128/dat_interaction/ducddc_memory/cosmemory", ram_cos_temp); 
//    if(ram_sin_cnt==681)
//        $writememh("/home/caohuiyang/Work/bbp_vcu128/dat_interaction/ducddc_memory/sinmemory", ram_sin_temp); 
//end

//always @(*)begin
//    if(reset)begin
//        $readmemh("/home/caohuiyang/Work/bbp_vcu128/dat_interaction/ducddc_memory/duc/cosmemory", ram_cos_temp); 
//        $readmemh("/home/caohuiyang/Work/bbp_vcu128/dat_interaction/ducddc_memory/duc/sinmemory", ram_sin_temp); end
//end

//$$$$$$$$$$$$$$$$$sin(A+B)$$$$$$$$$$$$$$$$$$
//======sinA*cosB=Q*vcoi
logic signed[15:0] sin_add_data1;
mult_gen_duc mult_duc_sincos(
    .CLK(aclk),
    .A(s_axis_data_tdata_Q),
    .B(ram_cos1),
    .P(sin_add_data1));                
//=====cosA*sinB=I*vcoq
logic signed[15:0] sin_add_data2; 
mult_gen_duc mult_duc_cossin(
    .CLK(aclk),
    .A(s_axis_data_tdata_I),
    .B(ram_sin1),
    .P(sin_add_data2));                                               
//======= sin(A+B)=sinA*cosB+cosA*sinB       
logic signed[15:0] sin_add_result;        
add_duc add_duc(
    .A(sin_add_data1),
    .B(sin_add_data2),
    .CLK(aclk),
    .S(sin_add_result));    

logic signed [15:0] cos_sub_result16,sin_add_result16;   
//assign cos_sub_result16=(cos_sub_result)>>14;  
//assign sin_add_result16=(sin_add_result)>>14;
assign cos_sub_result16=cos_sub_result;  
assign sin_add_result16=sin_add_result;
//assign m_axis_data_tdata_duc_I=cos_sub_result[30:15];
//assign m_axis_data_tdata_duc_I=cos_sub_result16;
//assign m_axis_data_tvalid_duc_I=s_axis_data_tvalid_I&&s_axis_data_tvalid_Q;
//assign m_axis_data_tdata_duc_Q=sin_add_result[30:15];
//assign m_axis_data_tdata_duc_Q=sin_add_result16;
//assign m_axis_data_tvalid_duc_Q=s_axis_data_tvalid_I&&s_axis_data_tvalid_Q;

logic signed [15:0] m_axis_data_cnt;
always @(posedge aclk)begin
    if(m_axis_data_tvalid_duc_I)m_axis_data_cnt++;
    else m_axis_data_cnt=0;
end

// async_fifo # (
//    .DSIZE(16),
//    .ASIZE(10))
//    duc_out_fifo_cos(
//    .wclk(aclk),
//    .wrst_n(!reset),
//    .winc(s_axis_data_tvalid_I3),
//    .wdata(cos_sub_result16),
//    .wfull(),
//    .awfull(),
//    .rclk(aclk),
//    .rrst_n(!reset),
//    .rinc(m_axis_data_tready_duc_I),
//    .rdata(m_axis_data_tdata_duc_I),
//    .rempty(),
//    .arempty(),
//    .rvalid(m_axis_data_tvalid_duc_I),
//    .rlast(m_axis_data_tlast_duc_I));


duc_out_fifo duc_out_fifo_cos (
  .s_axis_aresetn(!reset),
  .s_axis_aclk(aclk),
  .s_axis_tvalid(s_axis_data_tvalid_I3),
  .s_axis_tready(s_axis_dataI_tready),
  .s_axis_tdata(cos_sub_result16),
  .s_axis_tlast(s_axis_data_tlast_I3),
  .m_axis_tvalid(m_axis_data_tvalid_duc_I),
  .m_axis_tready(m_axis_data_tready_duc_I),
  .m_axis_tdata(m_axis_data_tdata_duc_I),
  .m_axis_tlast(m_axis_data_tlast_duc_I)
);

// async_fifo # (
//    .DSIZE(16),
//    .ASIZE(10))
//    duc_out_fifo_sin(
//    .wclk(aclk),
//    .wrst_n(!reset),
//    .winc(s_axis_data_tvalid_Q3),
//    .wdata(sin_add_result16),
//    .wfull(),
//    .awfull(),
//    .rclk(aclk),
//    .rrst_n(!reset),
//    .rinc(m_axis_data_tready_duc_Q),
//    .rdata(m_axis_data_tdata_duc_Q),
//    .rempty(),
//    .arempty(),
//    .rvalid(m_axis_data_tvalid_duc_Q),
//    .rlast(m_axis_data_tlast_duc_Q));

duc_out_fifo duc_out_fifo_sin (
  .s_axis_aresetn(!reset),
  .s_axis_aclk(aclk),
  .s_axis_tvalid(s_axis_data_tvalid_Q3),
  .s_axis_tready(s_axis_dataQ_tready),
  .s_axis_tdata(sin_add_result16),
  .s_axis_tlast(s_axis_data_tlast_Q3),
  .m_axis_tvalid(m_axis_data_tvalid_duc_Q),
  .m_axis_tready(m_axis_data_tready_duc_Q),
  .m_axis_tdata(m_axis_data_tdata_duc_Q),
  .m_axis_tlast(m_axis_data_tlast_duc_Q)
);
endmodule
