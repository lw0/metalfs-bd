-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.1
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity op_mem_read_impl_Loo_2 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    word_stream_with_strb_V_data_V_dout : IN STD_LOGIC_VECTOR (511 downto 0);
    word_stream_with_strb_V_data_V_empty_n : IN STD_LOGIC;
    word_stream_with_strb_V_data_V_read : OUT STD_LOGIC;
    word_stream_with_strb_V_strb_V_dout : IN STD_LOGIC_VECTOR (63 downto 0);
    word_stream_with_strb_V_strb_V_empty_n : IN STD_LOGIC;
    word_stream_with_strb_V_strb_V_read : OUT STD_LOGIC;
    word_stream_with_strb_V_last_V_dout : IN STD_LOGIC_VECTOR (0 downto 0);
    word_stream_with_strb_V_last_V_empty_n : IN STD_LOGIC;
    word_stream_with_strb_V_last_V_read : OUT STD_LOGIC;
    mtl_word_stream_V_data_V_din : OUT STD_LOGIC_VECTOR (63 downto 0);
    mtl_word_stream_V_data_V_full_n : IN STD_LOGIC;
    mtl_word_stream_V_data_V_write : OUT STD_LOGIC;
    mtl_word_stream_V_strb_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    mtl_word_stream_V_strb_V_full_n : IN STD_LOGIC;
    mtl_word_stream_V_strb_V_write : OUT STD_LOGIC;
    mtl_word_stream_V_last_V_din : OUT STD_LOGIC_VECTOR (0 downto 0);
    mtl_word_stream_V_last_V_full_n : IN STD_LOGIC;
    mtl_word_stream_V_last_V_write : OUT STD_LOGIC );
end;


architecture behav of op_mem_read_impl_Loo_2 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (8 downto 0) := "000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (8 downto 0) := "000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (8 downto 0) := "000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (8 downto 0) := "000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (8 downto 0) := "000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (8 downto 0) := "001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (8 downto 0) := "010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (8 downto 0) := "100000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_40 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000000";
    constant ap_const_lv32_7F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001111111";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_80 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000010000000";
    constant ap_const_lv32_BF : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000010111111";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";
    constant ap_const_lv32_C0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000011000000";
    constant ap_const_lv32_FF : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000011111111";
    constant ap_const_lv32_18 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011000";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_100 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000100000000";
    constant ap_const_lv32_13F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000100111111";
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";
    constant ap_const_lv32_27 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100111";
    constant ap_const_lv32_140 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000101000000";
    constant ap_const_lv32_17F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000101111111";
    constant ap_const_lv32_28 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101000";
    constant ap_const_lv32_2F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101111";
    constant ap_const_lv32_180 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000110000000";
    constant ap_const_lv32_1BF : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000110111111";
    constant ap_const_lv32_30 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110000";
    constant ap_const_lv32_37 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110111";
    constant ap_const_lv32_1C0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000111000000";
    constant ap_const_lv32_1FF : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000111111111";
    constant ap_const_lv32_38 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111000";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal word_stream_with_strb_V_data_V_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal word_stream_with_strb_V_strb_V_blk_n : STD_LOGIC;
    signal word_stream_with_strb_V_last_V_blk_n : STD_LOGIC;
    signal mtl_word_stream_V_data_V_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal ap_CS_fsm_state9 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state9 : signal is "none";
    signal mtl_word_stream_V_strb_V_blk_n : STD_LOGIC;
    signal mtl_word_stream_V_last_V_blk_n : STD_LOGIC;
    signal tmp_last_V_reg_348 : STD_LOGIC_VECTOR (0 downto 0);
    signal word_stream_with_strb_V_data_V0_status : STD_LOGIC;
    signal mtl_word_stream_V_data_V1_status : STD_LOGIC;
    signal ap_block_state2 : BOOLEAN;
    signal tmp_data_V_10_reg_353 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_strb_V_10_reg_358 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_data_V_11_reg_363 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_strb_V_11_reg_368 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_data_V_12_reg_373 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_strb_V_12_reg_378 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_data_V_13_reg_383 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_strb_V_13_reg_388 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_data_V_14_reg_393 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_strb_V_14_reg_398 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_data_V_15_reg_403 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_strb_V_15_reg_408 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_data_V_16_reg_413 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_strb_V_16_reg_418 : STD_LOGIC_VECTOR (7 downto 0);
    signal word_stream_with_strb_V_data_V0_update : STD_LOGIC;
    signal mtl_word_stream_V_data_V1_update : STD_LOGIC;
    signal tmp_data_V_fu_198_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_strb_V_fu_203_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_block_state1 : BOOLEAN;


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


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state9) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1) and (tmp_last_V_reg_348 = ap_const_lv1_1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((mtl_word_stream_V_data_V1_status = ap_const_logic_0) or (word_stream_with_strb_V_data_V0_status = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                tmp_data_V_10_reg_353 <= word_stream_with_strb_V_data_V_dout(127 downto 64);
                tmp_data_V_11_reg_363 <= word_stream_with_strb_V_data_V_dout(191 downto 128);
                tmp_data_V_12_reg_373 <= word_stream_with_strb_V_data_V_dout(255 downto 192);
                tmp_data_V_13_reg_383 <= word_stream_with_strb_V_data_V_dout(319 downto 256);
                tmp_data_V_14_reg_393 <= word_stream_with_strb_V_data_V_dout(383 downto 320);
                tmp_data_V_15_reg_403 <= word_stream_with_strb_V_data_V_dout(447 downto 384);
                tmp_data_V_16_reg_413 <= word_stream_with_strb_V_data_V_dout(511 downto 448);
                tmp_last_V_reg_348 <= word_stream_with_strb_V_last_V_dout;
                tmp_strb_V_10_reg_358 <= word_stream_with_strb_V_strb_V_dout(15 downto 8);
                tmp_strb_V_11_reg_368 <= word_stream_with_strb_V_strb_V_dout(23 downto 16);
                tmp_strb_V_12_reg_378 <= word_stream_with_strb_V_strb_V_dout(31 downto 24);
                tmp_strb_V_13_reg_388 <= word_stream_with_strb_V_strb_V_dout(39 downto 32);
                tmp_strb_V_14_reg_398 <= word_stream_with_strb_V_strb_V_dout(47 downto 40);
                tmp_strb_V_15_reg_408 <= word_stream_with_strb_V_strb_V_dout(55 downto 48);
                tmp_strb_V_16_reg_418 <= word_stream_with_strb_V_strb_V_dout(63 downto 56);
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state7, ap_CS_fsm_state8, ap_CS_fsm_state9, tmp_last_V_reg_348, word_stream_with_strb_V_data_V0_status, mtl_word_stream_V_data_V1_status)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if ((not(((mtl_word_stream_V_data_V1_status = ap_const_logic_0) or (word_stream_with_strb_V_data_V0_status = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state3) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state4 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state4) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state5 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state5) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state6;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when ap_ST_fsm_state6 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state6) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state7;
                else
                    ap_NS_fsm <= ap_ST_fsm_state6;
                end if;
            when ap_ST_fsm_state7 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state7) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state8;
                else
                    ap_NS_fsm <= ap_ST_fsm_state7;
                end if;
            when ap_ST_fsm_state8 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state8) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state9;
                else
                    ap_NS_fsm <= ap_ST_fsm_state8;
                end if;
            when ap_ST_fsm_state9 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state9) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1) and (tmp_last_V_reg_348 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state9) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1) and (tmp_last_V_reg_348 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state9;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);
    ap_CS_fsm_state7 <= ap_CS_fsm(6);
    ap_CS_fsm_state8 <= ap_CS_fsm(7);
    ap_CS_fsm_state9 <= ap_CS_fsm(8);

    ap_block_state1_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_block_state2_assign_proc : process(word_stream_with_strb_V_data_V0_status, mtl_word_stream_V_data_V1_status)
    begin
                ap_block_state2 <= ((mtl_word_stream_V_data_V1_status = ap_const_logic_0) or (word_stream_with_strb_V_data_V0_status = ap_const_logic_0));
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state9, tmp_last_V_reg_348, mtl_word_stream_V_data_V1_status)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state9) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1) and (tmp_last_V_reg_348 = ap_const_lv1_1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
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


    ap_ready_assign_proc : process(ap_CS_fsm_state9, tmp_last_V_reg_348, mtl_word_stream_V_data_V1_status)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state9) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1) and (tmp_last_V_reg_348 = ap_const_lv1_1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    mtl_word_stream_V_data_V1_status <= (mtl_word_stream_V_strb_V_full_n and mtl_word_stream_V_last_V_full_n and mtl_word_stream_V_data_V_full_n);

    mtl_word_stream_V_data_V1_update_assign_proc : process(ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state7, ap_CS_fsm_state8, ap_CS_fsm_state9, word_stream_with_strb_V_data_V0_status, mtl_word_stream_V_data_V1_status)
    begin
        if ((((ap_const_logic_1 = ap_CS_fsm_state8) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1)) or ((ap_const_logic_1 = ap_CS_fsm_state7) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1)) or ((ap_const_logic_1 = ap_CS_fsm_state6) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1)) or ((ap_const_logic_1 = ap_CS_fsm_state5) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1)) or ((ap_const_logic_1 = ap_CS_fsm_state4) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1)) or ((ap_const_logic_1 = ap_CS_fsm_state3) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1)) or (not(((mtl_word_stream_V_data_V1_status = ap_const_logic_0) or (word_stream_with_strb_V_data_V0_status = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2)) or ((ap_const_logic_1 = ap_CS_fsm_state9) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1)))) then 
            mtl_word_stream_V_data_V1_update <= ap_const_logic_1;
        else 
            mtl_word_stream_V_data_V1_update <= ap_const_logic_0;
        end if; 
    end process;


    mtl_word_stream_V_data_V_blk_n_assign_proc : process(mtl_word_stream_V_data_V_full_n, ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state7, ap_CS_fsm_state8, ap_CS_fsm_state9)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state8) or (ap_const_logic_1 = ap_CS_fsm_state7) or (ap_const_logic_1 = ap_CS_fsm_state6) or (ap_const_logic_1 = ap_CS_fsm_state5) or (ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state9))) then 
            mtl_word_stream_V_data_V_blk_n <= mtl_word_stream_V_data_V_full_n;
        else 
            mtl_word_stream_V_data_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    mtl_word_stream_V_data_V_din_assign_proc : process(ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state7, ap_CS_fsm_state8, ap_CS_fsm_state9, word_stream_with_strb_V_data_V0_status, mtl_word_stream_V_data_V1_status, tmp_data_V_10_reg_353, tmp_data_V_11_reg_363, tmp_data_V_12_reg_373, tmp_data_V_13_reg_383, tmp_data_V_14_reg_393, tmp_data_V_15_reg_403, tmp_data_V_16_reg_413, tmp_data_V_fu_198_p1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state9) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1))) then 
            mtl_word_stream_V_data_V_din <= tmp_data_V_16_reg_413;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state8) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1))) then 
            mtl_word_stream_V_data_V_din <= tmp_data_V_15_reg_403;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state7) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1))) then 
            mtl_word_stream_V_data_V_din <= tmp_data_V_14_reg_393;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state6) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1))) then 
            mtl_word_stream_V_data_V_din <= tmp_data_V_13_reg_383;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state5) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1))) then 
            mtl_word_stream_V_data_V_din <= tmp_data_V_12_reg_373;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state4) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1))) then 
            mtl_word_stream_V_data_V_din <= tmp_data_V_11_reg_363;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state3) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1))) then 
            mtl_word_stream_V_data_V_din <= tmp_data_V_10_reg_353;
        elsif ((not(((mtl_word_stream_V_data_V1_status = ap_const_logic_0) or (word_stream_with_strb_V_data_V0_status = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            mtl_word_stream_V_data_V_din <= tmp_data_V_fu_198_p1;
        else 
            mtl_word_stream_V_data_V_din <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    mtl_word_stream_V_data_V_write <= mtl_word_stream_V_data_V1_update;

    mtl_word_stream_V_last_V_blk_n_assign_proc : process(mtl_word_stream_V_last_V_full_n, ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state7, ap_CS_fsm_state8, ap_CS_fsm_state9)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state8) or (ap_const_logic_1 = ap_CS_fsm_state7) or (ap_const_logic_1 = ap_CS_fsm_state6) or (ap_const_logic_1 = ap_CS_fsm_state5) or (ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state9))) then 
            mtl_word_stream_V_last_V_blk_n <= mtl_word_stream_V_last_V_full_n;
        else 
            mtl_word_stream_V_last_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    mtl_word_stream_V_last_V_din_assign_proc : process(ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state7, ap_CS_fsm_state8, ap_CS_fsm_state9, tmp_last_V_reg_348, word_stream_with_strb_V_data_V0_status, mtl_word_stream_V_data_V1_status)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state9) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1))) then 
            mtl_word_stream_V_last_V_din <= tmp_last_V_reg_348;
        elsif ((((ap_const_logic_1 = ap_CS_fsm_state8) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1)) or ((ap_const_logic_1 = ap_CS_fsm_state7) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1)) or ((ap_const_logic_1 = ap_CS_fsm_state6) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1)) or ((ap_const_logic_1 = ap_CS_fsm_state5) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1)) or ((ap_const_logic_1 = ap_CS_fsm_state4) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1)) or ((ap_const_logic_1 = ap_CS_fsm_state3) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1)) or (not(((mtl_word_stream_V_data_V1_status = ap_const_logic_0) or (word_stream_with_strb_V_data_V0_status = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
            mtl_word_stream_V_last_V_din <= ap_const_lv1_0;
        else 
            mtl_word_stream_V_last_V_din <= "X";
        end if; 
    end process;

    mtl_word_stream_V_last_V_write <= mtl_word_stream_V_data_V1_update;

    mtl_word_stream_V_strb_V_blk_n_assign_proc : process(mtl_word_stream_V_strb_V_full_n, ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state7, ap_CS_fsm_state8, ap_CS_fsm_state9)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state8) or (ap_const_logic_1 = ap_CS_fsm_state7) or (ap_const_logic_1 = ap_CS_fsm_state6) or (ap_const_logic_1 = ap_CS_fsm_state5) or (ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state9))) then 
            mtl_word_stream_V_strb_V_blk_n <= mtl_word_stream_V_strb_V_full_n;
        else 
            mtl_word_stream_V_strb_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    mtl_word_stream_V_strb_V_din_assign_proc : process(ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state7, ap_CS_fsm_state8, ap_CS_fsm_state9, word_stream_with_strb_V_data_V0_status, mtl_word_stream_V_data_V1_status, tmp_strb_V_10_reg_358, tmp_strb_V_11_reg_368, tmp_strb_V_12_reg_378, tmp_strb_V_13_reg_388, tmp_strb_V_14_reg_398, tmp_strb_V_15_reg_408, tmp_strb_V_16_reg_418, tmp_strb_V_fu_203_p1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state9) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1))) then 
            mtl_word_stream_V_strb_V_din <= tmp_strb_V_16_reg_418;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state8) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1))) then 
            mtl_word_stream_V_strb_V_din <= tmp_strb_V_15_reg_408;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state7) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1))) then 
            mtl_word_stream_V_strb_V_din <= tmp_strb_V_14_reg_398;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state6) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1))) then 
            mtl_word_stream_V_strb_V_din <= tmp_strb_V_13_reg_388;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state5) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1))) then 
            mtl_word_stream_V_strb_V_din <= tmp_strb_V_12_reg_378;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state4) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1))) then 
            mtl_word_stream_V_strb_V_din <= tmp_strb_V_11_reg_368;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state3) and (mtl_word_stream_V_data_V1_status = ap_const_logic_1))) then 
            mtl_word_stream_V_strb_V_din <= tmp_strb_V_10_reg_358;
        elsif ((not(((mtl_word_stream_V_data_V1_status = ap_const_logic_0) or (word_stream_with_strb_V_data_V0_status = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            mtl_word_stream_V_strb_V_din <= tmp_strb_V_fu_203_p1;
        else 
            mtl_word_stream_V_strb_V_din <= "XXXXXXXX";
        end if; 
    end process;

    mtl_word_stream_V_strb_V_write <= mtl_word_stream_V_data_V1_update;
    tmp_data_V_fu_198_p1 <= word_stream_with_strb_V_data_V_dout(64 - 1 downto 0);
    tmp_strb_V_fu_203_p1 <= word_stream_with_strb_V_strb_V_dout(8 - 1 downto 0);
    word_stream_with_strb_V_data_V0_status <= (word_stream_with_strb_V_strb_V_empty_n and word_stream_with_strb_V_last_V_empty_n and word_stream_with_strb_V_data_V_empty_n);

    word_stream_with_strb_V_data_V0_update_assign_proc : process(ap_CS_fsm_state2, word_stream_with_strb_V_data_V0_status, mtl_word_stream_V_data_V1_status)
    begin
        if ((not(((mtl_word_stream_V_data_V1_status = ap_const_logic_0) or (word_stream_with_strb_V_data_V0_status = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            word_stream_with_strb_V_data_V0_update <= ap_const_logic_1;
        else 
            word_stream_with_strb_V_data_V0_update <= ap_const_logic_0;
        end if; 
    end process;


    word_stream_with_strb_V_data_V_blk_n_assign_proc : process(word_stream_with_strb_V_data_V_empty_n, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            word_stream_with_strb_V_data_V_blk_n <= word_stream_with_strb_V_data_V_empty_n;
        else 
            word_stream_with_strb_V_data_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    word_stream_with_strb_V_data_V_read <= word_stream_with_strb_V_data_V0_update;

    word_stream_with_strb_V_last_V_blk_n_assign_proc : process(word_stream_with_strb_V_last_V_empty_n, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            word_stream_with_strb_V_last_V_blk_n <= word_stream_with_strb_V_last_V_empty_n;
        else 
            word_stream_with_strb_V_last_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    word_stream_with_strb_V_last_V_read <= word_stream_with_strb_V_data_V0_update;

    word_stream_with_strb_V_strb_V_blk_n_assign_proc : process(word_stream_with_strb_V_strb_V_empty_n, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            word_stream_with_strb_V_strb_V_blk_n <= word_stream_with_strb_V_strb_V_empty_n;
        else 
            word_stream_with_strb_V_strb_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    word_stream_with_strb_V_strb_V_read <= word_stream_with_strb_V_data_V0_update;
end behav;
