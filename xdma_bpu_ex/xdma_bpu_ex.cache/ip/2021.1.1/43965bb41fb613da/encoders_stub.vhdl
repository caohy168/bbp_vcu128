-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.1.1 (lin64) Build 3286242 Wed Jul 28 13:09:46 MDT 2021
-- Date        : Thu Aug 26 04:15:23 2021
-- Host        : caohy168 running 64-bit Ubuntu 20.04.3 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ encoders_stub.vhdl
-- Design      : encoders
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcvu37p-fsvh2892-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    bb_out_ce0 : out STD_LOGIC;
    bb_out_we0 : out STD_LOGIC;
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
    data_in_TVALID : in STD_LOGIC;
    data_in_TREADY : out STD_LOGIC;
    data_in_TDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    bb_out_address0 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    bb_out_d0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    recd_out_TVALID : out STD_LOGIC;
    recd_out_TREADY : in STD_LOGIC;
    recd_out_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    alpha_to_out_address0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    alpha_to_out_d0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    index_of_out_address0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    index_of_out_d0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    gg_out_address0 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    gg_out_d0 : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "bb_out_ce0,bb_out_we0,alpha_to_out_ce0,alpha_to_out_we0,index_of_out_ce0,index_of_out_we0,gg_out_ce0,gg_out_we0,ap_clk,ap_rst_n,ap_start,ap_done,ap_idle,ap_ready,data_in_TVALID,data_in_TREADY,data_in_TDATA[31:0],bb_out_address0[4:0],bb_out_d0[31:0],recd_out_TVALID,recd_out_TREADY,recd_out_TDATA[31:0],alpha_to_out_address0[7:0],alpha_to_out_d0[31:0],index_of_out_address0[7:0],index_of_out_d0[31:0],gg_out_address0[4:0],gg_out_d0[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "encode_rs,Vivado 2021.1.1";
begin
end;
