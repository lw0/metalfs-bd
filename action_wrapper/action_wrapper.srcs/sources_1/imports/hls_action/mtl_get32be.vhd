-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.1
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mtl_get32be is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    busline_V_read : IN STD_LOGIC_VECTOR (511 downto 0);
    lowest_byte_V : IN STD_LOGIC_VECTOR (5 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of mtl_get32be is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv10_1F : STD_LOGIC_VECTOR (9 downto 0) := "0000011111";
    constant ap_const_lv32_1FF : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000111111111";
    constant ap_const_lv10_1FF : STD_LOGIC_VECTOR (9 downto 0) := "0111111111";
    constant ap_const_lv512_lc_3 : STD_LOGIC_VECTOR (511 downto 0) := "11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111";
    constant ap_const_lv32_18 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011000";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal tmp_fu_78_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_reg_211 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_231_fu_84_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal tmp_231_reg_218 : STD_LOGIC_VECTOR (9 downto 0);
    signal tmp_233_fu_88_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal tmp_233_reg_224 : STD_LOGIC_VECTOR (9 downto 0);
    signal tmp_235_fu_94_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal tmp_235_reg_229 : STD_LOGIC_VECTOR (9 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal r_V_fu_52_p3 : STD_LOGIC_VECTOR (8 downto 0);
    signal Lo_assign_cast_fu_64_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal Hi_assign_fu_68_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal Lo_assign_fu_60_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal Hi_assign_cast_fu_74_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_232_fu_100_p4 : STD_LOGIC_VECTOR (511 downto 0);
    signal tmp_234_fu_110_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal tmp_236_fu_115_p3 : STD_LOGIC_VECTOR (9 downto 0);
    signal tmp_238_fu_127_p3 : STD_LOGIC_VECTOR (9 downto 0);
    signal tmp_239_fu_133_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal tmp_237_fu_120_p3 : STD_LOGIC_VECTOR (511 downto 0);
    signal tmp_240_fu_139_p1 : STD_LOGIC_VECTOR (511 downto 0);
    signal tmp_241_fu_143_p1 : STD_LOGIC_VECTOR (511 downto 0);
    signal tmp_242_fu_147_p2 : STD_LOGIC_VECTOR (511 downto 0);
    signal tmp_243_fu_153_p2 : STD_LOGIC_VECTOR (511 downto 0);
    signal p_Result_s_fu_159_p2 : STD_LOGIC_VECTOR (511 downto 0);
    signal tmp_245_fu_175_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_s_fu_179_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_51_fu_189_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_Result_s_73_fu_165_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal agg_result_V_fu_199_p5 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_return_preg : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_return_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_return_preg <= ap_const_lv32_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
                    ap_return_preg <= agg_result_V_fu_199_p5;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    tmp_231_reg_218(8 downto 3) <= tmp_231_fu_84_p1(8 downto 3);
                    tmp_233_reg_224(9 downto 3) <= tmp_233_fu_88_p2(9 downto 3);
                    tmp_235_reg_229(9 downto 3) <= tmp_235_fu_94_p2(9 downto 3);
                tmp_reg_211 <= tmp_fu_78_p2;
            end if;
        end if;
    end process;
    tmp_231_reg_218(2 downto 0) <= "000";
    tmp_231_reg_218(9) <= '0';
    tmp_233_reg_224(2 downto 0) <= "001";
    tmp_235_reg_229(2 downto 0) <= "111";

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;
    Hi_assign_cast_fu_74_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(Hi_assign_fu_68_p2),32));
    Hi_assign_fu_68_p2 <= std_logic_vector(unsigned(ap_const_lv10_1F) + unsigned(Lo_assign_cast_fu_64_p1));
    Lo_assign_cast_fu_64_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(r_V_fu_52_p3),10));
    Lo_assign_fu_60_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(r_V_fu_52_p3),32));
    agg_result_V_fu_199_p5 <= (((tmp_245_fu_175_p1 & tmp_s_fu_179_p4) & tmp_51_fu_189_p4) & p_Result_s_73_fu_165_p4);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);

    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or ((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_return_assign_proc : process(ap_CS_fsm_state2, agg_result_V_fu_199_p5, ap_return_preg)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            ap_return <= agg_result_V_fu_199_p5;
        else 
            ap_return <= ap_return_preg;
        end if; 
    end process;

    p_Result_s_73_fu_165_p4 <= p_Result_s_fu_159_p2(31 downto 24);
    p_Result_s_fu_159_p2 <= (tmp_243_fu_153_p2 and tmp_242_fu_147_p2);
    r_V_fu_52_p3 <= (lowest_byte_V & ap_const_lv3_0);
    tmp_231_fu_84_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(r_V_fu_52_p3),10));
    
    tmp_232_fu_100_p4_proc : process(busline_V_read)
    variable vlo_cpy : STD_LOGIC_VECTOR(512+32 - 1 downto 0);
    variable vhi_cpy : STD_LOGIC_VECTOR(512+32 - 1 downto 0);
    variable v0_cpy : STD_LOGIC_VECTOR(512 - 1 downto 0);
    variable tmp_232_fu_100_p4_i : integer;
    variable section : STD_LOGIC_VECTOR(512 - 1 downto 0);
    variable tmp_mask : STD_LOGIC_VECTOR(512 - 1 downto 0);
    variable resvalue, res_value, res_mask : STD_LOGIC_VECTOR(512 - 1 downto 0);
    begin
        vlo_cpy := (others => '0');
        vlo_cpy(9 - 1 downto 0) := ap_const_lv32_1FF(9 - 1 downto 0);
        vhi_cpy := (others => '0');
        vhi_cpy(9 - 1 downto 0) := ap_const_lv32_0(9 - 1 downto 0);
        v0_cpy := busline_V_read;
        if (vlo_cpy(9 - 1 downto 0) > vhi_cpy(9 - 1 downto 0)) then
            vhi_cpy(9-1 downto 0) := std_logic_vector(512-1-unsigned(ap_const_lv32_0(9-1 downto 0)));
            vlo_cpy(9-1 downto 0) := std_logic_vector(512-1-unsigned(ap_const_lv32_1FF(9-1 downto 0)));
            for tmp_232_fu_100_p4_i in 0 to 512-1 loop
                v0_cpy(tmp_232_fu_100_p4_i) := busline_V_read(512-1-tmp_232_fu_100_p4_i);
            end loop;
        end if;
        res_value := std_logic_vector(shift_right(unsigned(v0_cpy), to_integer(unsigned('0' & vlo_cpy(9-1 downto 0)))));

        section := (others=>'0');
        section(9-1 downto 0) := std_logic_vector(unsigned(vhi_cpy(9-1 downto 0)) - unsigned(vlo_cpy(9-1 downto 0)));
        tmp_mask := (others => '1');
        res_mask := std_logic_vector(shift_left(unsigned(tmp_mask),to_integer(unsigned('0' & section(31-1 downto 0)))));
        res_mask := res_mask(512-2 downto 0) & '0';
        resvalue := res_value and not res_mask;
        tmp_232_fu_100_p4 <= resvalue(512-1 downto 0);
    end process;

    tmp_233_fu_88_p2 <= std_logic_vector(unsigned(tmp_231_fu_84_p1) - unsigned(Hi_assign_fu_68_p2));
    tmp_234_fu_110_p2 <= (tmp_231_reg_218 xor ap_const_lv10_1FF);
    tmp_235_fu_94_p2 <= std_logic_vector(unsigned(Hi_assign_fu_68_p2) - unsigned(tmp_231_fu_84_p1));
    tmp_236_fu_115_p3 <= 
        tmp_233_reg_224 when (tmp_reg_211(0) = '1') else 
        tmp_235_reg_229;
    tmp_237_fu_120_p3 <= 
        tmp_232_fu_100_p4 when (tmp_reg_211(0) = '1') else 
        busline_V_read;
    tmp_238_fu_127_p3 <= 
        tmp_234_fu_110_p2 when (tmp_reg_211(0) = '1') else 
        tmp_231_reg_218;
    tmp_239_fu_133_p2 <= std_logic_vector(unsigned(ap_const_lv10_1FF) - unsigned(tmp_236_fu_115_p3));
    tmp_240_fu_139_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_238_fu_127_p3),512));
    tmp_241_fu_143_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_239_fu_133_p2),512));
    tmp_242_fu_147_p2 <= std_logic_vector(shift_right(unsigned(tmp_237_fu_120_p3),to_integer(unsigned('0' & tmp_240_fu_139_p1(31-1 downto 0)))));
    tmp_243_fu_153_p2 <= std_logic_vector(shift_right(unsigned(ap_const_lv512_lc_3),to_integer(unsigned('0' & tmp_241_fu_143_p1(31-1 downto 0)))));
    tmp_245_fu_175_p1 <= p_Result_s_fu_159_p2(8 - 1 downto 0);
    tmp_51_fu_189_p4 <= p_Result_s_fu_159_p2(23 downto 16);
    tmp_fu_78_p2 <= "1" when (unsigned(Lo_assign_fu_60_p1) > unsigned(Hi_assign_cast_fu_74_p1)) else "0";
    tmp_s_fu_179_p4 <= p_Result_s_fu_159_p2(15 downto 8);
end behav;
