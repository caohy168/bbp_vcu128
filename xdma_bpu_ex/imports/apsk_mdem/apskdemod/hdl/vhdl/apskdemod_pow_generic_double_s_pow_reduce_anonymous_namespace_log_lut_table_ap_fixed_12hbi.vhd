-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity apskdemod_pow_generic_double_s_pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_12hbi_rom is 
    generic(
             DWIDTH     : integer := 87; 
             AWIDTH     : integer := 6; 
             MEM_SIZE    : integer := 64
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of apskdemod_pow_generic_double_s_pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_12hbi_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000", 
    1 => "000001000000000000000000000000000001111111111111110000000000000101010101010100010101010", 
    2 => "000010000000000000000000000000000111111111111111100000000000101010101010100110101010101", 
    3 => "000011000000000000000000000000010001111111111111010000000010001111111111110111000000010", 
    4 => "000100000000000000000000000000011111111111111111000000000101010101010101000101010110010", 
    5 => "000101000000000000000000000000110001111111111110110000001010011010101010010001101101000", 
    6 => "000110000000000000000000000001000111111111111110100000010001111111111111011100000101000", 
    7 => "000111000000000000000000000001100001111111111110010000011100100101010100100100011110101", 
    8 => "001000000000000000000000000001111111111111111110000000101010101010101001101010111010101", 
    9 => "001001000000000000000000000010100001111111111101110000111100101111111110101111011001101", 
    10 => "001010000000000000000000000011000111111111111101100001010011010101010011110001111100011", 
    11 => "001011000000000000000000000011110001111111111101010001101110111010101000110010100011110", 
    12 => "001100000000000000000000000100011111111111111101000010001111111111111101110001010001000", 
    13 => "001101000000000000000000000101010001111111111100110010110111000101010010101110000100111", 
    14 => "001110000000000000000000000110000111111111111100100011100100101010100111101001000000101", 
    15 => "001111000000000000000000000111000001111111111100010100011001001111111100100010000101110", 
    16 => "010000000000000000000000000111111111111111111100000101010101010101010001011001010101010", 
    17 => "010001000000000000000000001001000001111111111011110110011001011010100110001110110000111", 
    18 => "010010000000000000000000001010000111111111111011100111100101111111111011000010011010000", 
    19 => "010011000000000000000000001011010001111111111011011000111011100101001111110100010010011", 
    20 => "010100000000000000000000001100011111111111111011001010011010101010100100100100011011101", 
    21 => "010101000000000000000000001101110001111111111010111100000011101111111001010010110111101", 
    22 => "010110000000000000000000001111000111111111111010101101110111010101001101111111101000011", 
    23 => "010111000000000000000000010000100001111111111010011111110101111010100010101010101111110", 
    24 => "011000000000000000000000010001111111111111111010010001111111111111110111010100010000000", 
    25 => "011001000000000000000000010011100001111111111010000100010110000101001011111100001011001", 
    26 => "011010000000000000000000010101000111111111111001110110111000101010100000100010100011110", 
    27 => "011011000000000000000000010110110001111111111001101001101000001111110101000111011011111", 
    28 => "011100000000000000000000011000011111111111111001011100100101010101001001101010110110010", 
    29 => "011101000000000000000000011010010001111111111001001111110000011010011110001100110101100", 
    30 => "011110000000000000000000011100000111111111111001000011001001111111110010101101011100000", 
    31 => "011111000000000000000000011110000001111111111000110110110010100101000111001100101100110", 
    32 => "100000000000000000000000011111111111111111111000101010101010101010011011101010101010101", 
    33 => "100001000000000000000000100010000001111111111000011110110010101111110000000111011000100", 
    34 => "100010000000000000000000100100000111111111111000010011001011010101000100100010111001011", 
    35 => "100011000000000000000000100110010001111111111000000111110100111010011000111101010000100", 
    36 => "100100000000000000000000101000011111111111110111111100101111111111101101010110100001000", 
    37 => "100101000000000000000000101010110001111111110111110001111101000101000001101110101110010", 
    38 => "100110000000000000000000101101000111111111110111100111011100101010010110000101111011110", 
    39 => "100111000000000000000000101111100001111111110111011101001111001111101010011100001100111", 
    40 => "101000000000000000000000110001111111111111110111010011010101010100111110110001100101010", 
    41 => "101001000000000000000000110100100001111111110111001001101111011010010011000110001000110", 
    42 => "101010000000000000000000110111000111111111110111000000011101111111100111011001111011000", 
    43 => "101011000000000000000000111001110001111111110110110111100001100100111011101101000000000", 
    44 => "101100000000000000000000111100011111111111110110101110111010101010001111111111011011101", 
    45 => "101101000000000000000000111111010001111111110110100110101001101111100100010001010010000", 
    46 => "101110000000000000000001000010000111111111110110011110101111010100111000100010100111011", 
    47 => "101111000000000000000001000101000001111111110110010111001011111010001100110011011111111", 
    48 => "110000000000000000000001000111111111111111110110001111111111111111100001000100000000000", 
    49 => "110001000000000000000001001011000001111111110110001001001100000100110101010100001100000", 
    50 => "110010000000000000000001001110000111111111110110000010110000101010001001100100001000110", 
    51 => "110011000000000000000001010001010001111111110101111100101110001111011101110011111010100", 
    52 => "110100000000000000000001010100011111111111110101110111000101010100110010000011100110010", 
    53 => "110101000000000000000001010111110001111111110101110001110110011010000110010011010000111", 
    54 => "110110000000000000000001011011000111111111110101101101000001111111011010100010111111000", 
    55 => "110111000000000000000001011110100001111111110101101000101000100100101110110010110101111", 
    56 => "111000000000000000000001100001111111111111110101100100101010101010000011000010111010101", 
    57 => "111001000000000000000001100101100001111111110101100001001000101111010111010011010010011", 
    58 => "111010000000000000000001101001000111111111110101011110000011010100101011100100000010011", 
    59 => "111011000000000000000001101100110001111111110101011011011010111001111111110101010000001", 
    60 => "111100000000000000000001110000011111111111110101011001001111111111010100000111000001000", 
    61 => "111101000000000000000001110100010001111111110101010111100011000100101000011001011010101", 
    62 => "111110000000000000000001111000000111111111110101010110010100101001111100101100100010101", 
    63 => "111111000000000000000001111100000001111111110101010101100101001111010001000000011111000" );


begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity apskdemod_pow_generic_double_s_pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_12hbi is
    generic (
        DataWidth : INTEGER := 87;
        AddressRange : INTEGER := 64;
        AddressWidth : INTEGER := 6);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of apskdemod_pow_generic_double_s_pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_12hbi is
    component apskdemod_pow_generic_double_s_pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_12hbi_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    apskdemod_pow_generic_double_s_pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_12hbi_rom_U :  component apskdemod_pow_generic_double_s_pow_reduce_anonymous_namespace_log_lut_table_ap_fixed_12hbi_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


