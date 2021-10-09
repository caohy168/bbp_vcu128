`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: htgd_thz    
// Engineer: caohuiyang
// 
// Create Date: 04/25/2021 07:15:40 PM
// Design Name: 
// Module Name: package_gen
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

`include "bbp_parameter.vh"
//`define ethernet80
module package_gen#(
  `ifdef ethernet80
         parameter AXI_DATA_WIDTH               = 512,//be modify 256bit to support 40G
  `else  
         parameter AXI_DATA_WIDTH               = 64,
  `endif
         parameter C_M_AXIS_DATA_WIDTH          = AXI_DATA_WIDTH,
  `ifdef self_rs
         parameter PKG_END                      = 58,  
         parameter PKG_interval_Num             = 30000
  `else  parameter PKG_END                      = 59,   
         parameter PKG_interval_Num             = 15000
  `endif
        
    )(
      input clk,reset,
      output logic[C_M_AXIS_DATA_WIDTH-1:0]   axis_tdata_gen,
      output logic                            axis_tlast_gen,
      output logic[C_M_AXIS_DATA_WIDTH/8-1:0] axis_tuser_gen,
      output logic[C_M_AXIS_DATA_WIDTH/8-1:0] axis_tkeep_gen,
      output logic                            axis_tvalid_gen,
      input                                   axis_tready_gen
    );

`ifdef ethernet80
     logic[AXI_DATA_WIDTH-1:0]data_vector[59]= {
      'h1f1e1d1c1b1a191817161514131211100f0e0d0c0b0a090807060504030201001f1e1d1c1b1a191817161514131211100f0e0d0c0b0a09080706050403020100,
      'h3f3e3d3c3b3a393837363534333231302f2e2d2c2b2a292827262524232221203f3e3d3c3b3a393837363534333231302f2e2d2c2b2a29282726252423222120,
      'h5f5e5d5c5b5a595857565554535251504f4e4d4c4b4a494847464544434241405f5e5d5c5b5a595857565554535251504f4e4d4c4b4a49484746454443424140,
      'h7f7e7d7c7b7a797877767574737271706f6e6d6c6b6a696867666564636261607f7e7d7c7b7a797877767574737271706f6e6d6c6b6a69686766656463626160,                
      'h9f9e9d9c9b9a999897969594939291908f8e8d8c8b8a898887868584838281809f9e9d9c9b9a999897969594939291908f8e8d8c8b8a89888786858483828180,                             
      'hbfbebdbcbbbab9b8b7b6b5b4b3b2b1b0afaeadacabaaa9a8a7a6a5a4a3a2a1a0bfbebdbcbbbab9b8b7b6b5b4b3b2b1b0afaeadacabaaa9a8a7a6a5a4a3a2a1a0,                             
      'hdfdedddcdbdad9d8d7d6d5d4d3d2d1d0cfcecdcccbcac9c8c7c6c5c4c3c2c1c0dfdedddcdbdad9d8d7d6d5d4d3d2d1d0cfcecdcccbcac9c8c7c6c5c4c3c2c1c0,
      'hfffefdfcfbfaf9f8f7f6f5f4f3f2f1f0efeeedecebeae9e8e7e6e5e4e3e2e1e0fffefdfcfbfaf9f8f7f6f5f4f3f2f1f0efeeedecebeae9e8e7e6e5e4e3e2e1e0,
      'h1f1e1d1c1b1a191817161514131211100f0e0d0c0b0a090807060504030201001f1e1d1c1b1a191817161514131211100f0e0d0c0b0a09080706050403020100,
      'h3f3e3d3c3b3a393837363534333231302f2e2d2c2b2a292827262524232221203f3e3d3c3b3a393837363534333231302f2e2d2c2b2a29282726252423222120,
      'h5f5e5d5c5b5a595857565554535251504f4e4d4c4b4a494847464544434241405f5e5d5c5b5a595857565554535251504f4e4d4c4b4a49484746454443424140,
      'h7f7e7d7c7b7a797877767574737271706f6e6d6c6b6a696867666564636261607f7e7d7c7b7a797877767574737271706f6e6d6c6b6a69686766656463626160,                
      'h9f9e9d9c9b9a999897969594939291908f8e8d8c8b8a898887868584838281809f9e9d9c9b9a999897969594939291908f8e8d8c8b8a89888786858483828180,                             
      'hbfbebdbcbbbab9b8b7b6b5b4b3b2b1b0afaeadacabaaa9a8a7a6a5a4a3a2a1a0bfbebdbcbbbab9b8b7b6b5b4b3b2b1b0afaeadacabaaa9a8a7a6a5a4a3a2a1a0,                             
      'hdfdedddcdbdad9d8d7d6d5d4d3d2d1d0cfcecdcccbcac9c8c7c6c5c4c3c2c1c0dfdedddcdbdad9d8d7d6d5d4d3d2d1d0cfcecdcccbcac9c8c7c6c5c4c3c2c1c0,
      'hfffefdfcfbfaf9f8f7f6f5f4f3f2f1f0efeeedecebeae9e8e7e6e5e4e3e2e1e0fffefdfcfbfaf9f8f7f6f5f4f3f2f1f0efeeedecebeae9e8e7e6e5e4e3e2e1e0,
      'h1f1e1d1c1b1a191817161514131211100f0e0d0c0b0a090807060504030201001f1e1d1c1b1a191817161514131211100f0e0d0c0b0a09080706050403020100,
      'h3f3e3d3c3b3a393837363534333231302f2e2d2c2b2a292827262524232221203f3e3d3c3b3a393837363534333231302f2e2d2c2b2a29282726252423222120,
      'h5f5e5d5c5b5a595857565554535251504f4e4d4c4b4a494847464544434241405f5e5d5c5b5a595857565554535251504f4e4d4c4b4a49484746454443424140,
      'h7f7e7d7c7b7a797877767574737271706f6e6d6c6b6a696867666564636261607f7e7d7c7b7a797877767574737271706f6e6d6c6b6a69686766656463626160,                
      'h9f9e9d9c9b9a999897969594939291908f8e8d8c8b8a898887868584838281809f9e9d9c9b9a999897969594939291908f8e8d8c8b8a89888786858483828180,                             
      'hbfbebdbcbbbab9b8b7b6b5b4b3b2b1b0afaeadacabaaa9a8a7a6a5a4a3a2a1a0bfbebdbcbbbab9b8b7b6b5b4b3b2b1b0afaeadacabaaa9a8a7a6a5a4a3a2a1a0,                             
      'hdfdedddcdbdad9d8d7d6d5d4d3d2d1d0cfcecdcccbcac9c8c7c6c5c4c3c2c1c0dfdedddcdbdad9d8d7d6d5d4d3d2d1d0cfcecdcccbcac9c8c7c6c5c4c3c2c1c0,
      'hfffefdfcfbfaf9f8f7f6f5f4f3f2f1f0efeeedecebeae9e8e7e6e5e4e3e2e1e0fffefdfcfbfaf9f8f7f6f5f4f3f2f1f0efeeedecebeae9e8e7e6e5e4e3e2e1e0,
      'h1f1e1d1c1b1a191817161514131211100f0e0d0c0b0a090807060504030201001f1e1d1c1b1a191817161514131211100f0e0d0c0b0a09080706050403020100,
      'h3f3e3d3c3b3a393837363534333231302f2e2d2c2b2a292827262524232221203f3e3d3c3b3a393837363534333231302f2e2d2c2b2a29282726252423222120,
      'h5f5e5d5c5b5a595857565554535251504f4e4d4c4b4a494847464544434241405f5e5d5c5b5a595857565554535251504f4e4d4c4b4a49484746454443424140,
      'h7f7e7d7c7b7a797877767574737271706f6e6d6c6b6a696867666564636261607f7e7d7c7b7a797877767574737271706f6e6d6c6b6a69686766656463626160,                
      'h9f9e9d9c9b9a999897969594939291908f8e8d8c8b8a898887868584838281809f9e9d9c9b9a999897969594939291908f8e8d8c8b8a89888786858483828180,                             
      'hbfbebdbcbbbab9b8b7b6b5b4b3b2b1b0afaeadacabaaa9a8a7a6a5a4a3a2a1a0bfbebdbcbbbab9b8b7b6b5b4b3b2b1b0afaeadacabaaa9a8a7a6a5a4a3a2a1a0,                             
      'hdfdedddcdbdad9d8d7d6d5d4d3d2d1d0cfcecdcccbcac9c8c7c6c5c4c3c2c1c0dfdedddcdbdad9d8d7d6d5d4d3d2d1d0cfcecdcccbcac9c8c7c6c5c4c3c2c1c0,
      'hfffefdfcfbfaf9f8f7f6f5f4f3f2f1f0efeeedecebeae9e8e7e6e5e4e3e2e1e0fffefdfcfbfaf9f8f7f6f5f4f3f2f1f0efeeedecebeae9e8e7e6e5e4e3e2e1e0,
      'h1f1e1d1c1b1a191817161514131211100f0e0d0c0b0a090807060504030201001f1e1d1c1b1a191817161514131211100f0e0d0c0b0a09080706050403020100,
      'h3f3e3d3c3b3a393837363534333231302f2e2d2c2b2a292827262524232221203f3e3d3c3b3a393837363534333231302f2e2d2c2b2a29282726252423222120,
      'h5f5e5d5c5b5a595857565554535251504f4e4d4c4b4a494847464544434241405f5e5d5c5b5a595857565554535251504f4e4d4c4b4a49484746454443424140,
      'h7f7e7d7c7b7a797877767574737271706f6e6d6c6b6a696867666564636261607f7e7d7c7b7a797877767574737271706f6e6d6c6b6a69686766656463626160,                
      'h9f9e9d9c9b9a999897969594939291908f8e8d8c8b8a898887868584838281809f9e9d9c9b9a999897969594939291908f8e8d8c8b8a89888786858483828180,                             
      'hbfbebdbcbbbab9b8b7b6b5b4b3b2b1b0afaeadacabaaa9a8a7a6a5a4a3a2a1a0bfbebdbcbbbab9b8b7b6b5b4b3b2b1b0afaeadacabaaa9a8a7a6a5a4a3a2a1a0,                             
      'hdfdedddcdbdad9d8d7d6d5d4d3d2d1d0cfcecdcccbcac9c8c7c6c5c4c3c2c1c0dfdedddcdbdad9d8d7d6d5d4d3d2d1d0cfcecdcccbcac9c8c7c6c5c4c3c2c1c0,
      'hfffefdfcfbfaf9f8f7f6f5f4f3f2f1f0efeeedecebeae9e8e7e6e5e4e3e2e1e0fffefdfcfbfaf9f8f7f6f5f4f3f2f1f0efeeedecebeae9e8e7e6e5e4e3e2e1e0,
      'h1f1e1d1c1b1a191817161514131211100f0e0d0c0b0a090807060504030201001f1e1d1c1b1a191817161514131211100f0e0d0c0b0a09080706050403020100,
      'h3f3e3d3c3b3a393837363534333231302f2e2d2c2b2a292827262524232221203f3e3d3c3b3a393837363534333231302f2e2d2c2b2a29282726252423222120,
      'h5f5e5d5c5b5a595857565554535251504f4e4d4c4b4a494847464544434241405f5e5d5c5b5a595857565554535251504f4e4d4c4b4a49484746454443424140,
      'h7f7e7d7c7b7a797877767574737271706f6e6d6c6b6a696867666564636261607f7e7d7c7b7a797877767574737271706f6e6d6c6b6a69686766656463626160,                
      'h9f9e9d9c9b9a999897969594939291908f8e8d8c8b8a898887868584838281809f9e9d9c9b9a999897969594939291908f8e8d8c8b8a89888786858483828180,                             
      'hbfbebdbcbbbab9b8b7b6b5b4b3b2b1b0afaeadacabaaa9a8a7a6a5a4a3a2a1a0bfbebdbcbbbab9b8b7b6b5b4b3b2b1b0afaeadacabaaa9a8a7a6a5a4a3a2a1a0,                             
      'hdfdedddcdbdad9d8d7d6d5d4d3d2d1d0cfcecdcccbcac9c8c7c6c5c4c3c2c1c0dfdedddcdbdad9d8d7d6d5d4d3d2d1d0cfcecdcccbcac9c8c7c6c5c4c3c2c1c0,
      'hfffefdfcfbfaf9f8f7f6f5f4f3f2f1f0efeeedecebeae9e8e7e6e5e4e3e2e1e0fffefdfcfbfaf9f8f7f6f5f4f3f2f1f0efeeedecebeae9e8e7e6e5e4e3e2e1e0,
      'h1f1e1d1c1b1a191817161514131211100f0e0d0c0b0a090807060504030201001f1e1d1c1b1a191817161514131211100f0e0d0c0b0a09080706050403020100,
      'h3f3e3d3c3b3a393837363534333231302f2e2d2c2b2a292827262524232221203f3e3d3c3b3a393837363534333231302f2e2d2c2b2a29282726252423222120,
      'h5f5e5d5c5b5a595857565554535251504f4e4d4c4b4a494847464544434241405f5e5d5c5b5a595857565554535251504f4e4d4c4b4a49484746454443424140,
      'h7f7e7d7c7b7a797877767574737271706f6e6d6c6b6a696867666564636261607f7e7d7c7b7a797877767574737271706f6e6d6c6b6a69686766656463626160,                
      'h9f9e9d9c9b9a999897969594939291908f8e8d8c8b8a898887868584838281809f9e9d9c9b9a999897969594939291908f8e8d8c8b8a89888786858483828180,                             
      'hbfbebdbcbbbab9b8b7b6b5b4b3b2b1b0afaeadacabaaa9a8a7a6a5a4a3a2a1a0bfbebdbcbbbab9b8b7b6b5b4b3b2b1b0afaeadacabaaa9a8a7a6a5a4a3a2a1a0,                             
      'hdfdedddcdbdad9d8d7d6d5d4d3d2d1d0cfcecdcccbcac9c8c7c6c5c4c3c2c1c0dfdedddcdbdad9d8d7d6d5d4d3d2d1d0cfcecdcccbcac9c8c7c6c5c4c3c2c1c0,
      'hfffefdfcfbfaf9f8f7f6f5f4f3f2f1f0efeeedecebeae9e8e7e6e5e4e3e2e1e0fffefdfcfbfaf9f8f7f6f5f4f3f2f1f0efeeedecebeae9e8e7e6e5e4e3e2e1e0,
      'h1f1e1d1c1b1a191817161514131211100f0e0d0c0b0a090807060504030201001f1e1d1c1b1a191817161514131211100f0e0d0c0b0a09080706050403020100,
      'h3f3e3d3c3b3a393837363534333231302f2e2d2c2b2a292827262524232221203f3e3d3c3b3a393837363534333231302f2e2d2c2b2a29282726252423222120,
      'h5f5e5d5c5b5a595857565554535251504f4e4d4c4b4a494847464544434241405f5e5d5c5b5a595857565554535251504f4e4d4c4b4a49484746454443424140};
`else  
     logic[AXI_DATA_WIDTH-1:0]data_vector[59]= {
      'h0706050403020100,
      'h0f0e0d0c0b0a0908,
      'h1716151413121110,
      'h1f1e1d1c1b1a1918,
      'h2726252423222120,
      'h2f2e2d2c2b2a2928,
      'h3736353433323130,
      'h3f3e3d3c3b3a3938,                             
      'h4746454443424140,                             
      'h4f4e4d4c4b4a4948,                             
      'h5756555453525150,                             
      'h5f5e5d5c5b5a5958,                             
      'h6766656463626160,                             
      'h6f6e6d6c6b6a6968,                             
      'h7776757473727170,                             
      'h7f7e7d7c7b7a7978,                             
      'h8786858483828180,                             
      'h8f8e8d8c8b8a8988,                             
      'h9796959493929190,
      'h9f9e9d9c9b9a9998,
      'ha7a6a5a4a3a2a1a0,
      'hafaeadacabaaa9a8,
      'hb7b6b5b4b3b2b1b0,                             
      'hbfbebdbcbbbab9b8,
      'hc7c6c5c4c3c2c1c0,                             
      'hcfcecdcccbcac9c8,  
      'hd7d6d5d4d3d2d1d0, 
      'hdfdedddcdbdad9d8,      
      'he7e6e5e4e3e2e1e0,                    
      'hefeeedecebeae9e8,                             
      'hf7f6f5f4f3f2f1f0,                             
      'hfffefdfcfbfaf9f8,      
      'h0706050403020100,
      'h0f0e0d0c0b0a0908,
      'h1716151413121110,
      'h1f1e1d1c1b1a1918,
      'h2726252423222120,
      'h2f2e2d2c2b2a2928,
      'h3736353433323130,
      'h3f3e3d3c3b3a3938,                             
      'h4746454443424140,                             
      'h4f4e4d4c4b4a4948,                             
      'h5756555453525150,                             
      'h5f5e5d5c5b5a5958,                             
      'h6766656463626160,                             
      'h6f6e6d6c6b6a6968,                             
      'h7776757473727170,                             
      'h7f7e7d7c7b7a7978,                             
      'h8786858483828180,                             
      'h8f8e8d8c8b8a8988,                             
      'h9796959493929190,
      'h9f9e9d9c9b9a9998,
      'ha7a6a5a4a3a2a1a0,
      'hafaeadacabaaa9a8,
      'hb7b6b5b4b3b2b1b0,                             
      'hbfbebdbcbbbab9b8,
      'hc7c6c5c4c3c2c1c0,                             
      'hcfcecdcccbcac9c8,  
      'hd7d6d5d4d3d2d1d0};
`endif
 
logic[15:0]pkg_gen_state,dat_cnt,pkg_interval,pkg_cnt; 

always @(posedge clk)begin
    if (reset) begin
      pkg_gen_state=0;
      axis_tdata_gen=0;
      axis_tlast_gen=0;
      axis_tuser_gen=0;
      axis_tkeep_gen=0;
      axis_tvalid_gen=0;
      dat_cnt=0;
      pkg_interval=0;
      pkg_cnt=0;
    end
    else begin
        if(axis_tready_gen==0)begin
            pkg_gen_state=pkg_gen_state;
            axis_tdata_gen=axis_tdata_gen;
            axis_tlast_gen=axis_tlast_gen;
            axis_tuser_gen=axis_tuser_gen;
            axis_tkeep_gen=axis_tkeep_gen;
            axis_tvalid_gen=axis_tvalid_gen;
            dat_cnt=0;
            pkg_cnt=0;
            pkg_interval=0;
            pkg_cnt=0;
        end
        else begin
            case (pkg_gen_state)
                0:
                    begin
                      axis_tdata_gen=0;
                      axis_tlast_gen=0;
                      axis_tuser_gen=0;
                      axis_tkeep_gen=0;
                      axis_tvalid_gen=0;
                      dat_cnt=0;
                      if(pkg_interval<PKG_interval_Num)begin
                        pkg_interval=pkg_interval+1;
                        pkg_gen_state=0;
                      end              
                      else begin
                        pkg_interval=0;
                        pkg_gen_state=1;
                      end
                    end
                1:
                    begin   
                        if(dat_cnt<PKG_END)begin
                            axis_tdata_gen=data_vector[dat_cnt];
                            axis_tvalid_gen=1;
                        end
                        else begin
                            axis_tdata_gen=0;
                            axis_tvalid_gen=0;
                        end
                        if(dat_cnt==PKG_END-1)begin
                            axis_tlast_gen=1;
                            pkg_gen_state=2;
                        end
                        else begin
                            axis_tlast_gen=0;
                            `ifdef ethernet80
                                axis_tkeep_gen='hffffffff_ffffffff;    
                            `else  
                                axis_tkeep_gen='hff;
                            `endif
                            pkg_gen_state=1;
                        end
                        dat_cnt=dat_cnt+1;                  
                    end
                2:
                    begin
                        if(pkg_cnt<(`dma_send_pkg_mun-1))begin
                            pkg_cnt=pkg_cnt+1;
                            pkg_gen_state=0;
                        end
                        else begin
                            pkg_cnt=0;
                            pkg_gen_state=3;
                        end
                        axis_tlast_gen=0;
                        axis_tdata_gen=0;
                        axis_tvalid_gen=0;
                        axis_tkeep_gen=0;
                    end 
                3:
                    begin
                        pkg_gen_state=pkg_gen_state;
                        axis_tdata_gen=0;
                        axis_tlast_gen=0;
                        axis_tuser_gen=0;
                        axis_tkeep_gen=0;
                        axis_tvalid_gen=0;
                        dat_cnt=0;
                        pkg_cnt=0;
                        pkg_interval=0;  
                    end
                default:
                    begin
                        pkg_gen_state=0;
                        axis_tdata_gen=0;
                        axis_tlast_gen=0;
                        axis_tuser_gen=0;
                        axis_tkeep_gen=0;
                        axis_tvalid_gen=0;
                        dat_cnt=0;
                        pkg_cnt=0;
                        pkg_interval=0;
                    end
            endcase
        end
       end
      end
endmodule
