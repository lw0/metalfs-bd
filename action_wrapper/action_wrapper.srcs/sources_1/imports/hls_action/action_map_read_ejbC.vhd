-- ==============================================================
-- File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.1
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ==============================================================

--
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity action_map_read_ejbC_ram is 
    generic(
            mem_type    : string := "block"; 
            dwidth     : integer := 64; 
            awidth     : integer := 9; 
            mem_size    : integer := 512
    ); 
    port (
          addr0     : in std_logic_vector(awidth-1 downto 0); 
          ce0       : in std_logic; 
          d0        : in std_logic_vector(dwidth-1 downto 0); 
          we0       : in std_logic; 
          clk        : in std_logic 
    ); 
end entity; 


architecture rtl of action_map_read_ejbC_ram is 

type mem_array is array (0 to mem_size-1) of std_logic_vector (dwidth-1 downto 0); 
shared variable ram : mem_array := (others=>(others=>'0'));

attribute syn_ramstyle : string; 
attribute syn_ramstyle of ram : variable is "block_ram";
attribute ram_style : string;
attribute ram_style of ram : variable is mem_type;

begin 



p_memory_access_0: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            if (we0 = '1') then 
                ram(CONV_INTEGER(addr0)) := d0; 
            end if;
        end if;
    end if;
end process;


end rtl;


Library IEEE;
use IEEE.std_logic_1164.all;

entity action_map_read_ejbC is
    generic (
        DataWidth : INTEGER := 64;
        AddressRange : INTEGER := 512;
        AddressWidth : INTEGER := 9);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of action_map_read_ejbC is
    component action_map_read_ejbC_ram is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            d0 : IN STD_LOGIC_VECTOR;
            we0 : IN STD_LOGIC);
    end component;



begin
    action_map_read_ejbC_ram_U :  component action_map_read_ejbC_ram
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        d0 => d0,
        we0 => we0);

end architecture;


