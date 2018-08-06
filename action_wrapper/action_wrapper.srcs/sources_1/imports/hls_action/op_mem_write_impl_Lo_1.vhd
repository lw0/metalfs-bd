-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.1
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity op_mem_write_impl_Lo_1 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    aligned_stream_V_data_V_dout : IN STD_LOGIC_VECTOR (63 downto 0);
    aligned_stream_V_data_V_empty_n : IN STD_LOGIC;
    aligned_stream_V_data_V_read : OUT STD_LOGIC;
    aligned_stream_V_strb_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    aligned_stream_V_strb_V_empty_n : IN STD_LOGIC;
    aligned_stream_V_strb_V_read : OUT STD_LOGIC;
    aligned_stream_V_last_V_dout : IN STD_LOGIC_VECTOR (0 downto 0);
    aligned_stream_V_last_V_empty_n : IN STD_LOGIC;
    aligned_stream_V_last_V_read : OUT STD_LOGIC;
    word_stream_V_data_V_din : OUT STD_LOGIC_VECTOR (511 downto 0);
    word_stream_V_data_V_full_n : IN STD_LOGIC;
    word_stream_V_data_V_write : OUT STD_LOGIC;
    word_stream_V_strb_V_din : OUT STD_LOGIC_VECTOR (63 downto 0);
    word_stream_V_strb_V_full_n : IN STD_LOGIC;
    word_stream_V_strb_V_write : OUT STD_LOGIC;
    word_stream_V_last_V_din : OUT STD_LOGIC_VECTOR (0 downto 0);
    word_stream_V_last_V_full_n : IN STD_LOGIC;
    word_stream_V_last_V_write : OUT STD_LOGIC );
end;


architecture behav of op_mem_write_impl_Lo_1 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv3_7 : STD_LOGIC_VECTOR (2 downto 0) := "111";
    constant ap_const_lv3_6 : STD_LOGIC_VECTOR (2 downto 0) := "110";
    constant ap_const_lv3_5 : STD_LOGIC_VECTOR (2 downto 0) := "101";
    constant ap_const_lv3_4 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv3_3 : STD_LOGIC_VECTOR (2 downto 0) := "011";
    constant ap_const_lv3_2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_const_lv3_1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv512_lc_1 : STD_LOGIC_VECTOR (511 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_1C0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000111000000";
    constant ap_const_lv32_1FF : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000111111111";
    constant ap_const_lv32_38 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111000";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv32_180 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000110000000";
    constant ap_const_lv32_1BF : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000110111111";
    constant ap_const_lv32_30 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110000";
    constant ap_const_lv32_37 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110111";
    constant ap_const_lv32_140 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000101000000";
    constant ap_const_lv32_17F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000101111111";
    constant ap_const_lv32_28 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101000";
    constant ap_const_lv32_2F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101111";
    constant ap_const_lv32_100 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000100000000";
    constant ap_const_lv32_13F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000100111111";
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";
    constant ap_const_lv32_27 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100111";
    constant ap_const_lv32_C0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000011000000";
    constant ap_const_lv32_FF : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000011111111";
    constant ap_const_lv32_18 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011000";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_80 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000010000000";
    constant ap_const_lv32_BF : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000010111111";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";
    constant ap_const_lv32_40 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000000";
    constant ap_const_lv32_7F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001111111";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal aligned_stream_V_data_V_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal aligned_stream_V_strb_V_blk_n : STD_LOGIC;
    signal aligned_stream_V_last_V_blk_n : STD_LOGIC;
    signal word_stream_V_data_V_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal tmp_9_fu_523_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal demorgan_fu_534_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal word_stream_V_strb_V_blk_n : STD_LOGIC;
    signal word_stream_V_last_V_blk_n : STD_LOGIC;
    signal current_subword_V_1_s_load_fu_316_p1 : STD_LOGIC_VECTOR (2 downto 0);
    signal current_subword_V_1_s_reg_556 : STD_LOGIC_VECTOR (2 downto 0);
    signal aligned_stream_V_data_V0_status : STD_LOGIC;
    signal tmp_last_V_reg_562 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_Result_35_fu_331_p5 : STD_LOGIC_VECTOR (511 downto 0);
    signal p_Result_36_fu_343_p5 : STD_LOGIC_VECTOR (63 downto 0);
    signal p_Result_33_fu_355_p5 : STD_LOGIC_VECTOR (511 downto 0);
    signal p_Result_34_fu_367_p5 : STD_LOGIC_VECTOR (63 downto 0);
    signal p_Result_31_fu_379_p5 : STD_LOGIC_VECTOR (511 downto 0);
    signal p_Result_32_fu_391_p5 : STD_LOGIC_VECTOR (63 downto 0);
    signal p_Result_29_fu_403_p5 : STD_LOGIC_VECTOR (511 downto 0);
    signal p_Result_30_fu_415_p5 : STD_LOGIC_VECTOR (63 downto 0);
    signal p_Result_27_fu_427_p5 : STD_LOGIC_VECTOR (511 downto 0);
    signal p_Result_28_fu_439_p5 : STD_LOGIC_VECTOR (63 downto 0);
    signal p_Result_25_fu_451_p5 : STD_LOGIC_VECTOR (511 downto 0);
    signal p_Result_26_fu_463_p5 : STD_LOGIC_VECTOR (63 downto 0);
    signal p_Result_23_fu_475_p5 : STD_LOGIC_VECTOR (511 downto 0);
    signal p_Result_24_fu_487_p5 : STD_LOGIC_VECTOR (63 downto 0);
    signal p_Result_s_fu_499_p5 : STD_LOGIC_VECTOR (511 downto 0);
    signal p_Result_22_fu_511_p5 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_phi_mux_out_element_data_V_2_phi_fu_289_p4 : STD_LOGIC_VECTOR (511 downto 0);
    signal p_Val2_2_reg_211 : STD_LOGIC_VECTOR (511 downto 0);
    signal word_stream_V_data_V1_status : STD_LOGIC;
    signal ap_predicate_op56_write_state3 : BOOLEAN;
    signal ap_block_state3 : BOOLEAN;
    signal ap_block_state1 : BOOLEAN;
    signal ap_phi_mux_out_element_1_2_phi_fu_302_p4 : STD_LOGIC_VECTOR (63 downto 0);
    signal p_Val2_s_reg_223 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_data_V_reg_235 : STD_LOGIC_VECTOR (511 downto 0);
    signal tmp_strb_V_6_reg_260 : STD_LOGIC_VECTOR (63 downto 0);
    signal aligned_stream_V_data_V0_update : STD_LOGIC;
    signal word_stream_V_data_V1_update : STD_LOGIC;
    signal current_subword_V_1_fu_184 : STD_LOGIC_VECTOR (2 downto 0);
    signal current_subword_V_fu_539_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal tmp_s_fu_528_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);


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
                elsif ((not(((word_stream_V_data_V1_status = ap_const_logic_0) and (ap_predicate_op56_write_state3 = ap_const_boolean_1))) and (tmp_last_V_reg_562 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    current_subword_V_1_fu_184_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((word_stream_V_data_V1_status = ap_const_logic_0) and (ap_predicate_op56_write_state3 = ap_const_boolean_1))) and (demorgan_fu_534_p2 = ap_const_lv1_0) and (tmp_9_fu_523_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                current_subword_V_1_fu_184 <= current_subword_V_fu_539_p2;
            elsif (((not(((word_stream_V_data_V1_status = ap_const_logic_0) and (ap_predicate_op56_write_state3 = ap_const_boolean_1))) and (ap_predicate_op56_write_state3 = ap_const_boolean_1) and (ap_const_logic_1 = ap_CS_fsm_state3)) or (not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
                current_subword_V_1_fu_184 <= ap_const_lv3_0;
            end if; 
        end if;
    end process;

    p_Val2_2_reg_211_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                p_Val2_2_reg_211 <= ap_const_lv512_lc_1;
            elsif ((not(((word_stream_V_data_V1_status = ap_const_logic_0) and (ap_predicate_op56_write_state3 = ap_const_boolean_1))) and (tmp_last_V_reg_562 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                p_Val2_2_reg_211 <= ap_phi_mux_out_element_data_V_2_phi_fu_289_p4;
            end if; 
        end if;
    end process;

    p_Val2_s_reg_223_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                p_Val2_s_reg_223 <= ap_const_lv64_0;
            elsif ((not(((word_stream_V_data_V1_status = ap_const_logic_0) and (ap_predicate_op56_write_state3 = ap_const_boolean_1))) and (tmp_last_V_reg_562 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                p_Val2_s_reg_223 <= ap_phi_mux_out_element_1_2_phi_fu_302_p4;
            end if; 
        end if;
    end process;

    tmp_data_V_reg_235_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = aligned_stream_V_data_V0_status) and (current_subword_V_1_s_load_fu_316_p1 = ap_const_lv3_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                tmp_data_V_reg_235 <= p_Result_s_fu_499_p5;
            elsif (((ap_const_logic_1 = aligned_stream_V_data_V0_status) and (current_subword_V_1_s_load_fu_316_p1 = ap_const_lv3_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                tmp_data_V_reg_235 <= p_Result_23_fu_475_p5;
            elsif (((ap_const_logic_1 = aligned_stream_V_data_V0_status) and (current_subword_V_1_s_load_fu_316_p1 = ap_const_lv3_2) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                tmp_data_V_reg_235 <= p_Result_25_fu_451_p5;
            elsif (((ap_const_logic_1 = aligned_stream_V_data_V0_status) and (current_subword_V_1_s_load_fu_316_p1 = ap_const_lv3_3) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                tmp_data_V_reg_235 <= p_Result_27_fu_427_p5;
            elsif (((ap_const_logic_1 = aligned_stream_V_data_V0_status) and (current_subword_V_1_s_load_fu_316_p1 = ap_const_lv3_4) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                tmp_data_V_reg_235 <= p_Result_29_fu_403_p5;
            elsif (((ap_const_logic_1 = aligned_stream_V_data_V0_status) and (current_subword_V_1_s_load_fu_316_p1 = ap_const_lv3_5) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                tmp_data_V_reg_235 <= p_Result_31_fu_379_p5;
            elsif (((ap_const_logic_1 = aligned_stream_V_data_V0_status) and (current_subword_V_1_s_load_fu_316_p1 = ap_const_lv3_6) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                tmp_data_V_reg_235 <= p_Result_33_fu_355_p5;
            elsif (((ap_const_logic_1 = aligned_stream_V_data_V0_status) and (current_subword_V_1_s_load_fu_316_p1 = ap_const_lv3_7) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                tmp_data_V_reg_235 <= p_Result_35_fu_331_p5;
            elsif (not((ap_const_boolean_1 = ap_const_boolean_1))) then 
                tmp_data_V_reg_235 <= p_Val2_2_reg_211;
            end if; 
        end if;
    end process;

    tmp_strb_V_6_reg_260_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = aligned_stream_V_data_V0_status) and (current_subword_V_1_s_load_fu_316_p1 = ap_const_lv3_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                tmp_strb_V_6_reg_260 <= p_Result_22_fu_511_p5;
            elsif (((ap_const_logic_1 = aligned_stream_V_data_V0_status) and (current_subword_V_1_s_load_fu_316_p1 = ap_const_lv3_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                tmp_strb_V_6_reg_260 <= p_Result_24_fu_487_p5;
            elsif (((ap_const_logic_1 = aligned_stream_V_data_V0_status) and (current_subword_V_1_s_load_fu_316_p1 = ap_const_lv3_2) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                tmp_strb_V_6_reg_260 <= p_Result_26_fu_463_p5;
            elsif (((ap_const_logic_1 = aligned_stream_V_data_V0_status) and (current_subword_V_1_s_load_fu_316_p1 = ap_const_lv3_3) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                tmp_strb_V_6_reg_260 <= p_Result_28_fu_439_p5;
            elsif (((ap_const_logic_1 = aligned_stream_V_data_V0_status) and (current_subword_V_1_s_load_fu_316_p1 = ap_const_lv3_4) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                tmp_strb_V_6_reg_260 <= p_Result_30_fu_415_p5;
            elsif (((ap_const_logic_1 = aligned_stream_V_data_V0_status) and (current_subword_V_1_s_load_fu_316_p1 = ap_const_lv3_5) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                tmp_strb_V_6_reg_260 <= p_Result_32_fu_391_p5;
            elsif (((ap_const_logic_1 = aligned_stream_V_data_V0_status) and (current_subword_V_1_s_load_fu_316_p1 = ap_const_lv3_6) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                tmp_strb_V_6_reg_260 <= p_Result_34_fu_367_p5;
            elsif (((ap_const_logic_1 = aligned_stream_V_data_V0_status) and (current_subword_V_1_s_load_fu_316_p1 = ap_const_lv3_7) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                tmp_strb_V_6_reg_260 <= p_Result_36_fu_343_p5;
            elsif (not((ap_const_boolean_1 = ap_const_boolean_1))) then 
                tmp_strb_V_6_reg_260 <= p_Val2_s_reg_223;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = aligned_stream_V_data_V0_status) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                current_subword_V_1_s_reg_556 <= current_subword_V_1_fu_184;
                tmp_last_V_reg_562 <= aligned_stream_V_last_V_dout;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, ap_CS_fsm_state3, aligned_stream_V_data_V0_status, tmp_last_V_reg_562, word_stream_V_data_V1_status, ap_predicate_op56_write_state3)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = aligned_stream_V_data_V0_status) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                if ((not(((word_stream_V_data_V1_status = ap_const_logic_0) and (ap_predicate_op56_write_state3 = ap_const_boolean_1))) and (tmp_last_V_reg_562 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                elsif ((not(((word_stream_V_data_V1_status = ap_const_logic_0) and (ap_predicate_op56_write_state3 = ap_const_boolean_1))) and (tmp_last_V_reg_562 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    aligned_stream_V_data_V0_status <= (aligned_stream_V_strb_V_empty_n and aligned_stream_V_last_V_empty_n and aligned_stream_V_data_V_empty_n);

    aligned_stream_V_data_V0_update_assign_proc : process(ap_CS_fsm_state2, aligned_stream_V_data_V0_status)
    begin
        if (((ap_const_logic_1 = aligned_stream_V_data_V0_status) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            aligned_stream_V_data_V0_update <= ap_const_logic_1;
        else 
            aligned_stream_V_data_V0_update <= ap_const_logic_0;
        end if; 
    end process;


    aligned_stream_V_data_V_blk_n_assign_proc : process(aligned_stream_V_data_V_empty_n, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            aligned_stream_V_data_V_blk_n <= aligned_stream_V_data_V_empty_n;
        else 
            aligned_stream_V_data_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    aligned_stream_V_data_V_read <= aligned_stream_V_data_V0_update;

    aligned_stream_V_last_V_blk_n_assign_proc : process(aligned_stream_V_last_V_empty_n, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            aligned_stream_V_last_V_blk_n <= aligned_stream_V_last_V_empty_n;
        else 
            aligned_stream_V_last_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    aligned_stream_V_last_V_read <= aligned_stream_V_data_V0_update;

    aligned_stream_V_strb_V_blk_n_assign_proc : process(aligned_stream_V_strb_V_empty_n, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            aligned_stream_V_strb_V_blk_n <= aligned_stream_V_strb_V_empty_n;
        else 
            aligned_stream_V_strb_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    aligned_stream_V_strb_V_read <= aligned_stream_V_data_V0_update;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);

    ap_block_state1_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_block_state3_assign_proc : process(word_stream_V_data_V1_status, ap_predicate_op56_write_state3)
    begin
                ap_block_state3 <= ((word_stream_V_data_V1_status = ap_const_logic_0) and (ap_predicate_op56_write_state3 = ap_const_boolean_1));
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state3, tmp_last_V_reg_562, word_stream_V_data_V1_status, ap_predicate_op56_write_state3)
    begin
        if ((not(((word_stream_V_data_V1_status = ap_const_logic_0) and (ap_predicate_op56_write_state3 = ap_const_boolean_1))) and (tmp_last_V_reg_562 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
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


    ap_phi_mux_out_element_1_2_phi_fu_302_p4_assign_proc : process(ap_CS_fsm_state3, tmp_9_fu_523_p2, demorgan_fu_534_p2, tmp_strb_V_6_reg_260)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
            if (((demorgan_fu_534_p2 = ap_const_lv1_0) and (tmp_9_fu_523_p2 = ap_const_lv1_0))) then 
                ap_phi_mux_out_element_1_2_phi_fu_302_p4 <= tmp_strb_V_6_reg_260;
            elsif (((demorgan_fu_534_p2 = ap_const_lv1_1) or (tmp_9_fu_523_p2 = ap_const_lv1_1))) then 
                ap_phi_mux_out_element_1_2_phi_fu_302_p4 <= ap_const_lv64_0;
            else 
                ap_phi_mux_out_element_1_2_phi_fu_302_p4 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            end if;
        else 
            ap_phi_mux_out_element_1_2_phi_fu_302_p4 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    ap_phi_mux_out_element_data_V_2_phi_fu_289_p4_assign_proc : process(ap_CS_fsm_state3, tmp_9_fu_523_p2, demorgan_fu_534_p2, tmp_data_V_reg_235)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
            if (((demorgan_fu_534_p2 = ap_const_lv1_0) and (tmp_9_fu_523_p2 = ap_const_lv1_0))) then 
                ap_phi_mux_out_element_data_V_2_phi_fu_289_p4 <= tmp_data_V_reg_235;
            elsif (((demorgan_fu_534_p2 = ap_const_lv1_1) or (tmp_9_fu_523_p2 = ap_const_lv1_1))) then 
                ap_phi_mux_out_element_data_V_2_phi_fu_289_p4 <= ap_const_lv512_lc_1;
            else 
                ap_phi_mux_out_element_data_V_2_phi_fu_289_p4 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            end if;
        else 
            ap_phi_mux_out_element_data_V_2_phi_fu_289_p4 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    ap_predicate_op56_write_state3_assign_proc : process(tmp_9_fu_523_p2, demorgan_fu_534_p2)
    begin
                ap_predicate_op56_write_state3 <= ((demorgan_fu_534_p2 = ap_const_lv1_1) or (tmp_9_fu_523_p2 = ap_const_lv1_1));
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state3, tmp_last_V_reg_562, word_stream_V_data_V1_status, ap_predicate_op56_write_state3)
    begin
        if ((not(((word_stream_V_data_V1_status = ap_const_logic_0) and (ap_predicate_op56_write_state3 = ap_const_boolean_1))) and (tmp_last_V_reg_562 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    current_subword_V_1_s_load_fu_316_p1 <= current_subword_V_1_fu_184;
    current_subword_V_fu_539_p2 <= std_logic_vector(unsigned(current_subword_V_1_s_reg_556) + unsigned(ap_const_lv3_1));
    demorgan_fu_534_p2 <= (tmp_s_fu_528_p2 and tmp_last_V_reg_562);
    p_Result_22_fu_511_p5 <= (p_Val2_s_reg_223(63 downto 8) & aligned_stream_V_strb_V_dout);
    p_Result_23_fu_475_p5 <= (p_Val2_2_reg_211(511 downto 128) & aligned_stream_V_data_V_dout & p_Val2_2_reg_211(63 downto 0));
    p_Result_24_fu_487_p5 <= (p_Val2_s_reg_223(63 downto 16) & aligned_stream_V_strb_V_dout & p_Val2_s_reg_223(7 downto 0));
    p_Result_25_fu_451_p5 <= (p_Val2_2_reg_211(511 downto 192) & aligned_stream_V_data_V_dout & p_Val2_2_reg_211(127 downto 0));
    p_Result_26_fu_463_p5 <= (p_Val2_s_reg_223(63 downto 24) & aligned_stream_V_strb_V_dout & p_Val2_s_reg_223(15 downto 0));
    p_Result_27_fu_427_p5 <= (p_Val2_2_reg_211(511 downto 256) & aligned_stream_V_data_V_dout & p_Val2_2_reg_211(191 downto 0));
    p_Result_28_fu_439_p5 <= (p_Val2_s_reg_223(63 downto 32) & aligned_stream_V_strb_V_dout & p_Val2_s_reg_223(23 downto 0));
    p_Result_29_fu_403_p5 <= (p_Val2_2_reg_211(511 downto 320) & aligned_stream_V_data_V_dout & p_Val2_2_reg_211(255 downto 0));
    p_Result_30_fu_415_p5 <= (p_Val2_s_reg_223(63 downto 40) & aligned_stream_V_strb_V_dout & p_Val2_s_reg_223(31 downto 0));
    p_Result_31_fu_379_p5 <= (p_Val2_2_reg_211(511 downto 384) & aligned_stream_V_data_V_dout & p_Val2_2_reg_211(319 downto 0));
    p_Result_32_fu_391_p5 <= (p_Val2_s_reg_223(63 downto 48) & aligned_stream_V_strb_V_dout & p_Val2_s_reg_223(39 downto 0));
    p_Result_33_fu_355_p5 <= (p_Val2_2_reg_211(511 downto 448) & aligned_stream_V_data_V_dout & p_Val2_2_reg_211(383 downto 0));
    p_Result_34_fu_367_p5 <= (p_Val2_s_reg_223(63 downto 56) & aligned_stream_V_strb_V_dout & p_Val2_s_reg_223(47 downto 0));
    p_Result_35_fu_331_p5 <= (aligned_stream_V_data_V_dout & p_Val2_2_reg_211(447 downto 0));
    p_Result_36_fu_343_p5 <= (aligned_stream_V_strb_V_dout & p_Val2_s_reg_223(55 downto 0));
    p_Result_s_fu_499_p5 <= (p_Val2_2_reg_211(511 downto 64) & aligned_stream_V_data_V_dout);
    tmp_9_fu_523_p2 <= "1" when (current_subword_V_1_s_reg_556 = ap_const_lv3_7) else "0";
    tmp_s_fu_528_p2 <= "0" when (tmp_strb_V_6_reg_260 = ap_const_lv64_0) else "1";
    word_stream_V_data_V1_status <= (word_stream_V_strb_V_full_n and word_stream_V_last_V_full_n and word_stream_V_data_V_full_n);

    word_stream_V_data_V1_update_assign_proc : process(ap_CS_fsm_state3, word_stream_V_data_V1_status, ap_predicate_op56_write_state3)
    begin
        if ((not(((word_stream_V_data_V1_status = ap_const_logic_0) and (ap_predicate_op56_write_state3 = ap_const_boolean_1))) and (ap_predicate_op56_write_state3 = ap_const_boolean_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            word_stream_V_data_V1_update <= ap_const_logic_1;
        else 
            word_stream_V_data_V1_update <= ap_const_logic_0;
        end if; 
    end process;


    word_stream_V_data_V_blk_n_assign_proc : process(word_stream_V_data_V_full_n, ap_CS_fsm_state3, tmp_9_fu_523_p2, demorgan_fu_534_p2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) and ((demorgan_fu_534_p2 = ap_const_lv1_1) or (tmp_9_fu_523_p2 = ap_const_lv1_1)))) then 
            word_stream_V_data_V_blk_n <= word_stream_V_data_V_full_n;
        else 
            word_stream_V_data_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    word_stream_V_data_V_din <= tmp_data_V_reg_235;
    word_stream_V_data_V_write <= word_stream_V_data_V1_update;

    word_stream_V_last_V_blk_n_assign_proc : process(word_stream_V_last_V_full_n, ap_CS_fsm_state3, tmp_9_fu_523_p2, demorgan_fu_534_p2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) and ((demorgan_fu_534_p2 = ap_const_lv1_1) or (tmp_9_fu_523_p2 = ap_const_lv1_1)))) then 
            word_stream_V_last_V_blk_n <= word_stream_V_last_V_full_n;
        else 
            word_stream_V_last_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    word_stream_V_last_V_din <= tmp_last_V_reg_562;
    word_stream_V_last_V_write <= word_stream_V_data_V1_update;

    word_stream_V_strb_V_blk_n_assign_proc : process(word_stream_V_strb_V_full_n, ap_CS_fsm_state3, tmp_9_fu_523_p2, demorgan_fu_534_p2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) and ((demorgan_fu_534_p2 = ap_const_lv1_1) or (tmp_9_fu_523_p2 = ap_const_lv1_1)))) then 
            word_stream_V_strb_V_blk_n <= word_stream_V_strb_V_full_n;
        else 
            word_stream_V_strb_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    word_stream_V_strb_V_din <= tmp_strb_V_6_reg_260;
    word_stream_V_strb_V_write <= word_stream_V_data_V1_update;
end behav;