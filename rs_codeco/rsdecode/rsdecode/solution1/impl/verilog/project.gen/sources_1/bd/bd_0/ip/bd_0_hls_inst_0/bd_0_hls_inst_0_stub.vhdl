-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Thu Aug  5 01:33:51 2021
-- Host        : caohy168 running 64-bit Ubuntu 20.04.2 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/caohy168/Work/bbp_vcu128/rs_codeco/rsdecode/rsdecode/solution1/impl/verilog/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_stub.vhdl
-- Design      : bd_0_hls_inst_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcvu37p-fsvh2892-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bd_0_hls_inst_0 is
  Port ( 
    recd_gf_out_ce0 : out STD_LOGIC;
    recd_gf_out_we0 : out STD_LOGIC;
    alpha_to_out_ce0 : out STD_LOGIC;
    alpha_to_out_we0 : out STD_LOGIC;
    index_of_out_ce0 : out STD_LOGIC;
    index_of_out_we0 : out STD_LOGIC;
    gg_out_ce0 : out STD_LOGIC;
    gg_out_we0 : out STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    recd_in_TVALID : in STD_LOGIC;
    recd_in_TREADY : out STD_LOGIC;
    recd_in_TDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    recd_out_TVALID : out STD_LOGIC;
    recd_out_TREADY : in STD_LOGIC;
    recd_out_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    recd_gf_out_address0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    recd_gf_out_d0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    syn_error_out : in STD_LOGIC_VECTOR ( 31 downto 0 );
    alpha_to_out_address0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    alpha_to_out_d0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    index_of_out_address0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    index_of_out_d0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    gg_out_address0 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    gg_out_d0 : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end bd_0_hls_inst_0;

architecture stub of bd_0_hls_inst_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "recd_gf_out_ce0,recd_gf_out_we0,alpha_to_out_ce0,alpha_to_out_we0,index_of_out_ce0,index_of_out_we0,gg_out_ce0,gg_out_we0,ap_clk,ap_rst_n,ap_start,ap_done,ap_idle,ap_ready,recd_in_TVALID,recd_in_TREADY,recd_in_TDATA[31:0],recd_out_TVALID,recd_out_TREADY,recd_out_TDATA[31:0],recd_gf_out_address0[7:0],recd_gf_out_d0[31:0],syn_error_out[31:0],alpha_to_out_address0[7:0],alpha_to_out_d0[31:0],index_of_out_address0[7:0],index_of_out_d0[31:0],gg_out_address0[4:0],gg_out_d0[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "decode_rs,Vivado 2020.2";
begin
end;