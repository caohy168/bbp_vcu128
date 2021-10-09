-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Wed Apr 21 19:43:49 2021
-- Host        : ubuntu running 64-bit Ubuntu 20.04.2 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/caohy168/Work/bbp_vcu128/xdma_bpu_ex/imports/mac_phy/src/mac_phy_xlconstant_1b1_0/mac_phy_xlconstant_1b1_0_stub.vhdl
-- Design      : mac_phy_xlconstant_1b1_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcvu37p-fsvh2892-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mac_phy_xlconstant_1b1_0 is
  Port ( 
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end mac_phy_xlconstant_1b1_0;

architecture stub of mac_phy_xlconstant_1b1_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "dout[0:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "xlconstant_v1_1_7_xlconstant,Vivado 2020.2";
begin
end;
