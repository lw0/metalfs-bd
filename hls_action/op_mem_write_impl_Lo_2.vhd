-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.1
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity op_mem_write_impl_Lo_2 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    start_full_n : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    start_out : OUT STD_LOGIC;
    start_write : OUT STD_LOGIC;
    p_read : IN STD_LOGIC_VECTOR (7 downto 0);
    aligned_stream_V_data_V_din : OUT STD_LOGIC_VECTOR (63 downto 0);
    aligned_stream_V_data_V_full_n : IN STD_LOGIC;
    aligned_stream_V_data_V_write : OUT STD_LOGIC;
    aligned_stream_V_strb_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    aligned_stream_V_strb_V_full_n : IN STD_LOGIC;
    aligned_stream_V_strb_V_write : OUT STD_LOGIC;
    aligned_stream_V_last_V_din : OUT STD_LOGIC_VECTOR (0 downto 0);
    aligned_stream_V_last_V_full_n : IN STD_LOGIC;
    aligned_stream_V_last_V_write : OUT STD_LOGIC;
    p_read1 : IN STD_LOGIC_VECTOR (63 downto 0);
    p_read2 : IN STD_LOGIC_VECTOR (7 downto 0);
    p_read3 : IN STD_LOGIC_VECTOR (63 downto 0);
    p_read4 : IN STD_LOGIC_VECTOR (7 downto 0);
    axis_s_0_TDATA : IN STD_LOGIC_VECTOR (63 downto 0);
    axis_s_0_TVALID : IN STD_LOGIC;
    axis_s_0_TREADY : OUT STD_LOGIC;
    axis_s_0_TSTRB : IN STD_LOGIC_VECTOR (7 downto 0);
    axis_s_0_TLAST : IN STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of op_mem_write_impl_Lo_2 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (5 downto 0) := "000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (5 downto 0) := "000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (5 downto 0) := "001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (5 downto 0) := "010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (5 downto 0) := "100000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv8_FF : STD_LOGIC_VECTOR (7 downto 0) := "11111111";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";

    signal real_start : STD_LOGIC;
    signal start_once_reg : STD_LOGIC := '0';
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal internal_ap_ready : STD_LOGIC;
    signal aligned_stream_V_data_V_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal tmp_last_V_load_reg_434 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_last_V_4_reg_468 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal aligned_stream_V_strb_V_blk_n : STD_LOGIC;
    signal aligned_stream_V_last_V_blk_n : STD_LOGIC;
    signal axis_s_0_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal tmp_5_i_fu_230_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal tmp_last_V_load_load_fu_285_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal tmp_data_V_3_fu_313_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_data_V_3_reg_438 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_strb_V_3_fu_346_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_strb_V_3_reg_443 : STD_LOGIC_VECTOR (7 downto 0);
    signal current_element_data_fu_354_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal current_element_data_reg_448 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_151_fu_359_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_151_reg_453 : STD_LOGIC_VECTOR (0 downto 0);
    signal current_element_strb_fu_363_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal current_element_strb_reg_458 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_153_fu_372_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_153_reg_463 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_last_V_4_fu_376_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal current_element_1_i_reg_183 : STD_LOGIC_VECTOR (0 downto 0);
    signal aligned_stream_V_data_V1_status : STD_LOGIC;
    signal ap_predicate_op67_write_state6 : BOOLEAN;
    signal ap_block_state6 : BOOLEAN;
    signal current_element_i_reg_195 : STD_LOGIC_VECTOR (0 downto 0);
    signal aligned_stream_V_data_V1_update : STD_LOGIC;
    signal insert_padding_eleme_fu_112 : STD_LOGIC_VECTOR (7 downto 0);
    signal insert_padding_eleme_5_fu_236_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_block_state2 : BOOLEAN;
    signal tmp_data_V_fu_116 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_strb_V_fu_120 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_last_V_fu_124 : STD_LOGIC_VECTOR (0 downto 0);
    signal r_V_fu_288_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_fu_293_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_7_fu_303_p4 : STD_LOGIC_VECTOR (62 downto 0);
    signal tmp_6_fu_297_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal r_V_2_fu_321_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_150_fu_326_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_s_fu_336_p4 : STD_LOGIC_VECTOR (6 downto 0);
    signal tmp_9_fu_330_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_152_fu_368_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (5 downto 0);


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
                elsif ((not(((ap_const_logic_0 = aligned_stream_V_data_V1_status) and (ap_predicate_op67_write_state6 = ap_const_boolean_1))) and (tmp_last_V_load_reg_434 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state6))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    start_once_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                start_once_reg <= ap_const_logic_0;
            else
                if (((internal_ap_ready = ap_const_logic_0) and (real_start = ap_const_logic_1))) then 
                    start_once_reg <= ap_const_logic_1;
                elsif ((internal_ap_ready = ap_const_logic_1)) then 
                    start_once_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    current_element_1_i_reg_183_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((ap_const_logic_0 = aligned_stream_V_data_V1_status) and (ap_predicate_op67_write_state6 = ap_const_boolean_1))) and (tmp_last_V_load_reg_434 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state6))) then 
                current_element_1_i_reg_183 <= tmp_153_reg_463;
            elsif ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                current_element_1_i_reg_183 <= ap_const_lv1_0;
            end if; 
        end if;
    end process;

    current_element_i_reg_195_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((ap_const_logic_0 = aligned_stream_V_data_V1_status) and (ap_predicate_op67_write_state6 = ap_const_boolean_1))) and (tmp_last_V_load_reg_434 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state6))) then 
                current_element_i_reg_195 <= tmp_151_reg_453;
            elsif ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                current_element_i_reg_195 <= ap_const_lv1_0;
            end if; 
        end if;
    end process;

    insert_padding_eleme_fu_112_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((tmp_5_i_fu_230_p2 = ap_const_lv1_1) and (axis_s_0_TVALID = ap_const_logic_0))) and (tmp_5_i_fu_230_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                insert_padding_eleme_fu_112 <= ap_const_lv8_0;
            elsif ((not(((tmp_5_i_fu_230_p2 = ap_const_lv1_1) and (axis_s_0_TVALID = ap_const_logic_0))) and (tmp_5_i_fu_230_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                insert_padding_eleme_fu_112 <= insert_padding_eleme_5_fu_236_p2;
            elsif ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                insert_padding_eleme_fu_112 <= p_read;
            end if; 
        end if;
    end process;

    tmp_data_V_fu_116_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((tmp_5_i_fu_230_p2 = ap_const_lv1_1) and (axis_s_0_TVALID = ap_const_logic_0))) and (tmp_5_i_fu_230_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                tmp_data_V_fu_116 <= axis_s_0_TDATA;
            elsif ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                tmp_data_V_fu_116 <= ap_const_lv64_0;
            end if; 
        end if;
    end process;

    tmp_last_V_fu_124_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((tmp_5_i_fu_230_p2 = ap_const_lv1_1) and (axis_s_0_TVALID = ap_const_logic_0))) and (tmp_5_i_fu_230_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                tmp_last_V_fu_124 <= axis_s_0_TLAST;
            elsif ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                tmp_last_V_fu_124 <= ap_const_lv1_0;
            end if; 
        end if;
    end process;

    tmp_strb_V_fu_120_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((tmp_5_i_fu_230_p2 = ap_const_lv1_1) and (axis_s_0_TVALID = ap_const_logic_0))) and (tmp_5_i_fu_230_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                tmp_strb_V_fu_120 <= axis_s_0_TSTRB;
            elsif ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                tmp_strb_V_fu_120 <= ap_const_lv8_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                current_element_data_reg_448 <= current_element_data_fu_354_p2;
                current_element_strb_reg_458 <= current_element_strb_fu_363_p2;
                tmp_151_reg_453 <= tmp_151_fu_359_p1;
                tmp_153_reg_463 <= tmp_153_fu_372_p1;
                tmp_data_V_3_reg_438 <= tmp_data_V_3_fu_313_p3;
                tmp_last_V_load_reg_434 <= tmp_last_V_fu_124;
                tmp_strb_V_3_reg_443 <= tmp_strb_V_3_fu_346_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_last_V_load_load_fu_285_p1 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                tmp_last_V_4_reg_468 <= tmp_last_V_4_fu_376_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (real_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, axis_s_0_TVALID, ap_CS_fsm_state5, ap_CS_fsm_state6, tmp_last_V_load_reg_434, ap_CS_fsm_state4, ap_CS_fsm_state2, tmp_5_i_fu_230_p2, tmp_last_V_load_load_fu_285_p1, ap_CS_fsm_state3, aligned_stream_V_data_V1_status, ap_predicate_op67_write_state6)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if ((not(((tmp_5_i_fu_230_p2 = ap_const_lv1_1) and (axis_s_0_TVALID = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                if (((tmp_last_V_load_load_fu_285_p1 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state4 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state4) and (ap_const_logic_1 = aligned_stream_V_data_V1_status))) then
                    ap_NS_fsm <= ap_ST_fsm_state6;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state5 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state5) and (ap_const_logic_1 = aligned_stream_V_data_V1_status))) then
                    ap_NS_fsm <= ap_ST_fsm_state6;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when ap_ST_fsm_state6 => 
                if ((not(((ap_const_logic_0 = aligned_stream_V_data_V1_status) and (ap_predicate_op67_write_state6 = ap_const_boolean_1))) and (tmp_last_V_load_reg_434 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state6))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                elsif ((not(((ap_const_logic_0 = aligned_stream_V_data_V1_status) and (ap_predicate_op67_write_state6 = ap_const_boolean_1))) and (tmp_last_V_load_reg_434 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state6))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state6;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXX";
        end case;
    end process;
    aligned_stream_V_data_V1_status <= (aligned_stream_V_strb_V_full_n and aligned_stream_V_last_V_full_n and aligned_stream_V_data_V_full_n);

    aligned_stream_V_data_V1_update_assign_proc : process(ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state4, aligned_stream_V_data_V1_status, ap_predicate_op67_write_state6)
    begin
        if ((((ap_const_logic_1 = ap_CS_fsm_state4) and (ap_const_logic_1 = aligned_stream_V_data_V1_status)) or (not(((ap_const_logic_0 = aligned_stream_V_data_V1_status) and (ap_predicate_op67_write_state6 = ap_const_boolean_1))) and (ap_const_logic_1 = ap_CS_fsm_state6) and (ap_predicate_op67_write_state6 = ap_const_boolean_1)) or ((ap_const_logic_1 = ap_CS_fsm_state5) and (ap_const_logic_1 = aligned_stream_V_data_V1_status)))) then 
            aligned_stream_V_data_V1_update <= ap_const_logic_1;
        else 
            aligned_stream_V_data_V1_update <= ap_const_logic_0;
        end if; 
    end process;


    aligned_stream_V_data_V_blk_n_assign_proc : process(aligned_stream_V_data_V_full_n, ap_CS_fsm_state5, ap_CS_fsm_state6, tmp_last_V_load_reg_434, tmp_last_V_4_reg_468, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state5) or ((tmp_last_V_4_reg_468 = ap_const_lv1_0) and (tmp_last_V_load_reg_434 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state6)))) then 
            aligned_stream_V_data_V_blk_n <= aligned_stream_V_data_V_full_n;
        else 
            aligned_stream_V_data_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    aligned_stream_V_data_V_din_assign_proc : process(ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state4, tmp_data_V_3_reg_438, current_element_data_reg_448, aligned_stream_V_data_V1_status, ap_predicate_op67_write_state6)
    begin
        if ((not(((ap_const_logic_0 = aligned_stream_V_data_V1_status) and (ap_predicate_op67_write_state6 = ap_const_boolean_1))) and (ap_const_logic_1 = ap_CS_fsm_state6) and (ap_predicate_op67_write_state6 = ap_const_boolean_1))) then 
            aligned_stream_V_data_V_din <= current_element_data_reg_448;
        elsif ((((ap_const_logic_1 = ap_CS_fsm_state4) and (ap_const_logic_1 = aligned_stream_V_data_V1_status)) or ((ap_const_logic_1 = ap_CS_fsm_state5) and (ap_const_logic_1 = aligned_stream_V_data_V1_status)))) then 
            aligned_stream_V_data_V_din <= tmp_data_V_3_reg_438;
        else 
            aligned_stream_V_data_V_din <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    aligned_stream_V_data_V_write <= aligned_stream_V_data_V1_update;

    aligned_stream_V_last_V_blk_n_assign_proc : process(aligned_stream_V_last_V_full_n, ap_CS_fsm_state5, ap_CS_fsm_state6, tmp_last_V_load_reg_434, tmp_last_V_4_reg_468, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state5) or ((tmp_last_V_4_reg_468 = ap_const_lv1_0) and (tmp_last_V_load_reg_434 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state6)))) then 
            aligned_stream_V_last_V_blk_n <= aligned_stream_V_last_V_full_n;
        else 
            aligned_stream_V_last_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    aligned_stream_V_last_V_din_assign_proc : process(ap_CS_fsm_state5, ap_CS_fsm_state6, tmp_last_V_4_reg_468, ap_CS_fsm_state4, aligned_stream_V_data_V1_status, ap_predicate_op67_write_state6)
    begin
        if ((not(((ap_const_logic_0 = aligned_stream_V_data_V1_status) and (ap_predicate_op67_write_state6 = ap_const_boolean_1))) and (ap_const_logic_1 = ap_CS_fsm_state6) and (ap_predicate_op67_write_state6 = ap_const_boolean_1))) then 
            aligned_stream_V_last_V_din <= ap_const_lv1_1;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state5) and (ap_const_logic_1 = aligned_stream_V_data_V1_status))) then 
            aligned_stream_V_last_V_din <= tmp_last_V_4_reg_468;
        elsif (((ap_const_logic_1 = ap_CS_fsm_state4) and (ap_const_logic_1 = aligned_stream_V_data_V1_status))) then 
            aligned_stream_V_last_V_din <= ap_const_lv1_0;
        else 
            aligned_stream_V_last_V_din <= "X";
        end if; 
    end process;

    aligned_stream_V_last_V_write <= aligned_stream_V_data_V1_update;

    aligned_stream_V_strb_V_blk_n_assign_proc : process(aligned_stream_V_strb_V_full_n, ap_CS_fsm_state5, ap_CS_fsm_state6, tmp_last_V_load_reg_434, tmp_last_V_4_reg_468, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state5) or ((tmp_last_V_4_reg_468 = ap_const_lv1_0) and (tmp_last_V_load_reg_434 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state6)))) then 
            aligned_stream_V_strb_V_blk_n <= aligned_stream_V_strb_V_full_n;
        else 
            aligned_stream_V_strb_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    aligned_stream_V_strb_V_din_assign_proc : process(ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state4, tmp_strb_V_3_reg_443, current_element_strb_reg_458, aligned_stream_V_data_V1_status, ap_predicate_op67_write_state6)
    begin
        if ((not(((ap_const_logic_0 = aligned_stream_V_data_V1_status) and (ap_predicate_op67_write_state6 = ap_const_boolean_1))) and (ap_const_logic_1 = ap_CS_fsm_state6) and (ap_predicate_op67_write_state6 = ap_const_boolean_1))) then 
            aligned_stream_V_strb_V_din <= current_element_strb_reg_458;
        elsif ((((ap_const_logic_1 = ap_CS_fsm_state4) and (ap_const_logic_1 = aligned_stream_V_data_V1_status)) or ((ap_const_logic_1 = ap_CS_fsm_state5) and (ap_const_logic_1 = aligned_stream_V_data_V1_status)))) then 
            aligned_stream_V_strb_V_din <= tmp_strb_V_3_reg_443;
        else 
            aligned_stream_V_strb_V_din <= "XXXXXXXX";
        end if; 
    end process;

    aligned_stream_V_strb_V_write <= aligned_stream_V_data_V1_update;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);

    ap_block_state1_assign_proc : process(real_start, ap_done_reg)
    begin
                ap_block_state1 <= ((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_block_state2_assign_proc : process(axis_s_0_TVALID, tmp_5_i_fu_230_p2)
    begin
                ap_block_state2 <= ((tmp_5_i_fu_230_p2 = ap_const_lv1_1) and (axis_s_0_TVALID = ap_const_logic_0));
    end process;


    ap_block_state6_assign_proc : process(aligned_stream_V_data_V1_status, ap_predicate_op67_write_state6)
    begin
                ap_block_state6 <= ((ap_const_logic_0 = aligned_stream_V_data_V1_status) and (ap_predicate_op67_write_state6 = ap_const_boolean_1));
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state6, tmp_last_V_load_reg_434, aligned_stream_V_data_V1_status, ap_predicate_op67_write_state6)
    begin
        if ((not(((ap_const_logic_0 = aligned_stream_V_data_V1_status) and (ap_predicate_op67_write_state6 = ap_const_boolean_1))) and (tmp_last_V_load_reg_434 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state6))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(real_start, ap_CS_fsm_state1)
    begin
        if (((real_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_predicate_op67_write_state6_assign_proc : process(tmp_last_V_load_reg_434, tmp_last_V_4_reg_468)
    begin
                ap_predicate_op67_write_state6 <= ((tmp_last_V_4_reg_468 = ap_const_lv1_0) and (tmp_last_V_load_reg_434 = ap_const_lv1_1));
    end process;

    ap_ready <= internal_ap_ready;

    axis_s_0_TDATA_blk_n_assign_proc : process(axis_s_0_TVALID, ap_CS_fsm_state2, tmp_5_i_fu_230_p2)
    begin
        if (((tmp_5_i_fu_230_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            axis_s_0_TDATA_blk_n <= axis_s_0_TVALID;
        else 
            axis_s_0_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    axis_s_0_TREADY_assign_proc : process(axis_s_0_TVALID, ap_CS_fsm_state2, tmp_5_i_fu_230_p2)
    begin
        if ((not(((tmp_5_i_fu_230_p2 = ap_const_lv1_1) and (axis_s_0_TVALID = ap_const_logic_0))) and (tmp_5_i_fu_230_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            axis_s_0_TREADY <= ap_const_logic_1;
        else 
            axis_s_0_TREADY <= ap_const_logic_0;
        end if; 
    end process;

    current_element_data_fu_354_p2 <= std_logic_vector(shift_right(unsigned(tmp_data_V_fu_116),to_integer(unsigned('0' & p_read3(31-1 downto 0)))));
    current_element_strb_fu_363_p2 <= std_logic_vector(shift_right(unsigned(tmp_strb_V_fu_120),to_integer(unsigned('0' & p_read4(8-1 downto 0)))));
    insert_padding_eleme_5_fu_236_p2 <= std_logic_vector(unsigned(insert_padding_eleme_fu_112) + unsigned(ap_const_lv8_FF));

    internal_ap_ready_assign_proc : process(ap_CS_fsm_state6, tmp_last_V_load_reg_434, aligned_stream_V_data_V1_status, ap_predicate_op67_write_state6)
    begin
        if ((not(((ap_const_logic_0 = aligned_stream_V_data_V1_status) and (ap_predicate_op67_write_state6 = ap_const_boolean_1))) and (tmp_last_V_load_reg_434 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state6))) then 
            internal_ap_ready <= ap_const_logic_1;
        else 
            internal_ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    r_V_2_fu_321_p2 <= std_logic_vector(shift_left(unsigned(tmp_strb_V_fu_120),to_integer(unsigned('0' & p_read2(8-1 downto 0)))));
    r_V_fu_288_p2 <= std_logic_vector(shift_left(unsigned(tmp_data_V_fu_116),to_integer(unsigned('0' & p_read1(31-1 downto 0)))));

    real_start_assign_proc : process(ap_start, start_full_n, start_once_reg)
    begin
        if (((start_once_reg = ap_const_logic_0) and (start_full_n = ap_const_logic_0))) then 
            real_start <= ap_const_logic_0;
        else 
            real_start <= ap_start;
        end if; 
    end process;

    start_out <= real_start;

    start_write_assign_proc : process(real_start, start_once_reg)
    begin
        if (((start_once_reg = ap_const_logic_0) and (real_start = ap_const_logic_1))) then 
            start_write <= ap_const_logic_1;
        else 
            start_write <= ap_const_logic_0;
        end if; 
    end process;

    tmp_150_fu_326_p1 <= r_V_2_fu_321_p2(1 - 1 downto 0);
    tmp_151_fu_359_p1 <= current_element_data_fu_354_p2(1 - 1 downto 0);
    tmp_152_fu_368_p1 <= current_element_strb_fu_363_p2(2 - 1 downto 0);
    tmp_153_fu_372_p1 <= current_element_strb_fu_363_p2(1 - 1 downto 0);
    tmp_5_i_fu_230_p2 <= "1" when (insert_padding_eleme_fu_112 = ap_const_lv8_0) else "0";
    tmp_6_fu_297_p2 <= (tmp_fu_293_p1 or current_element_i_reg_195);
    tmp_7_fu_303_p4 <= r_V_fu_288_p2(63 downto 1);
    tmp_9_fu_330_p2 <= (tmp_150_fu_326_p1 or current_element_1_i_reg_183);
    tmp_data_V_3_fu_313_p3 <= (tmp_7_fu_303_p4 & tmp_6_fu_297_p2);
    tmp_fu_293_p1 <= r_V_fu_288_p2(1 - 1 downto 0);
    tmp_last_V_4_fu_376_p2 <= "1" when (tmp_152_fu_368_p1 = ap_const_lv2_0) else "0";
    tmp_last_V_load_load_fu_285_p1 <= tmp_last_V_fu_124;
    tmp_s_fu_336_p4 <= r_V_2_fu_321_p2(7 downto 1);
    tmp_strb_V_3_fu_346_p3 <= (tmp_s_fu_336_p4 & tmp_9_fu_330_p2);
end behav;
