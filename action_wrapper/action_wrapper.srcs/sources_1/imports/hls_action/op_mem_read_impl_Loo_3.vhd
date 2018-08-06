-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.1
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity op_mem_read_impl_Loo_3 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    mtl_word_stream_aligned_V_data_V_dout : IN STD_LOGIC_VECTOR (63 downto 0);
    mtl_word_stream_aligned_V_data_V_empty_n : IN STD_LOGIC;
    mtl_word_stream_aligned_V_data_V_read : OUT STD_LOGIC;
    mtl_word_stream_aligned_V_strb_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    mtl_word_stream_aligned_V_strb_V_empty_n : IN STD_LOGIC;
    mtl_word_stream_aligned_V_strb_V_read : OUT STD_LOGIC;
    mtl_word_stream_aligned_V_last_V_dout : IN STD_LOGIC_VECTOR (0 downto 0);
    mtl_word_stream_aligned_V_last_V_empty_n : IN STD_LOGIC;
    mtl_word_stream_aligned_V_last_V_read : OUT STD_LOGIC;
    axis_m_0_TDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
    axis_m_0_TVALID : OUT STD_LOGIC;
    axis_m_0_TREADY : IN STD_LOGIC;
    axis_m_0_TSTRB : OUT STD_LOGIC_VECTOR (7 downto 0);
    axis_m_0_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of op_mem_read_impl_Loo_3 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal mtl_word_stream_aligned_V_data_V_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal mtl_word_stream_aligned_V_strb_V_blk_n : STD_LOGIC;
    signal mtl_word_stream_aligned_V_last_V_blk_n : STD_LOGIC;
    signal axis_m_0_TDATA_blk_n : STD_LOGIC;
    signal tmp_s_fu_182_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal brmerge_demorgan_fu_203_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_last_V_reg_227 : STD_LOGIC_VECTOR (0 downto 0);
    signal mtl_word_stream_aligned_V_data_V0_status : STD_LOGIC;
    signal ap_sig_ioackin_axis_m_0_TREADY : STD_LOGIC;
    signal ap_predicate_op25_write_state2 : BOOLEAN;
    signal ap_block_state2_io : BOOLEAN;
    signal ap_phi_mux_previous_element_2_2_phi_fu_145_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_last_V_8_reg_118 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state3_io : BOOLEAN;
    signal previous_element_2_1_reg_131 : STD_LOGIC_VECTOR (0 downto 0);
    signal mtl_word_stream_aligned_V_data_V0_update : STD_LOGIC;
    signal p_3_fu_82 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal tmp_strb_V_fu_86 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_data_V_fu_90 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_reg_ioackin_axis_m_0_TREADY : STD_LOGIC := '0';
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_condition_81 : BOOLEAN;


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
                elsif (((ap_const_boolean_0 = ap_block_state3_io) and (tmp_last_V_reg_227 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_reg_ioackin_axis_m_0_TREADY_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ioackin_axis_m_0_TREADY <= ap_const_logic_0;
            else
                if ((((ap_const_boolean_0 = ap_block_state3_io) and (brmerge_demorgan_fu_203_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3)) or (not(((mtl_word_stream_aligned_V_data_V0_status = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state2_io))) and (ap_predicate_op25_write_state2 = ap_const_boolean_1) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
                    ap_reg_ioackin_axis_m_0_TREADY <= ap_const_logic_0;
                elsif ((((brmerge_demorgan_fu_203_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3) and (axis_m_0_TREADY = ap_const_logic_1)) or ((mtl_word_stream_aligned_V_data_V0_status = ap_const_logic_1) and (ap_predicate_op25_write_state2 = ap_const_boolean_1) and (ap_const_logic_1 = ap_CS_fsm_state2) and (axis_m_0_TREADY = ap_const_logic_1)))) then 
                    ap_reg_ioackin_axis_m_0_TREADY <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    p_3_fu_82_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((mtl_word_stream_aligned_V_data_V0_status = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state2_io))) and (tmp_s_fu_182_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                p_3_fu_82 <= ap_const_lv1_1;
            elsif ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                p_3_fu_82 <= ap_const_lv1_0;
            end if; 
        end if;
    end process;

    previous_element_2_1_reg_131_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_81)) then
                if ((tmp_s_fu_182_p2 = ap_const_lv1_0)) then 
                    previous_element_2_1_reg_131 <= mtl_word_stream_aligned_V_last_V_dout;
                elsif ((tmp_s_fu_182_p2 = ap_const_lv1_1)) then 
                    previous_element_2_1_reg_131 <= tmp_last_V_8_reg_118;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((mtl_word_stream_aligned_V_data_V0_status = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state2_io))) and (tmp_s_fu_182_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                tmp_data_V_fu_90 <= mtl_word_stream_aligned_V_data_V_dout;
                tmp_strb_V_fu_86 <= mtl_word_stream_aligned_V_strb_V_dout;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_state3_io) and (tmp_last_V_reg_227 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                tmp_last_V_8_reg_118 <= ap_phi_mux_previous_element_2_2_phi_fu_145_p4;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((mtl_word_stream_aligned_V_data_V0_status = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state2_io))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                tmp_last_V_reg_227 <= mtl_word_stream_aligned_V_last_V_dout;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, ap_CS_fsm_state3, tmp_last_V_reg_227, mtl_word_stream_aligned_V_data_V0_status, ap_block_state2_io, ap_block_state3_io)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if ((not(((mtl_word_stream_aligned_V_data_V0_status = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state2_io))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                if (((ap_const_boolean_0 = ap_block_state3_io) and (tmp_last_V_reg_227 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                elsif (((ap_const_boolean_0 = ap_block_state3_io) and (tmp_last_V_reg_227 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);

    ap_block_state1_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_block_state2_io_assign_proc : process(ap_sig_ioackin_axis_m_0_TREADY, ap_predicate_op25_write_state2)
    begin
                ap_block_state2_io <= ((ap_sig_ioackin_axis_m_0_TREADY = ap_const_logic_0) and (ap_predicate_op25_write_state2 = ap_const_boolean_1));
    end process;


    ap_block_state3_io_assign_proc : process(brmerge_demorgan_fu_203_p2, ap_sig_ioackin_axis_m_0_TREADY)
    begin
                ap_block_state3_io <= ((brmerge_demorgan_fu_203_p2 = ap_const_lv1_1) and (ap_sig_ioackin_axis_m_0_TREADY = ap_const_logic_0));
    end process;


    ap_condition_81_assign_proc : process(ap_CS_fsm_state2, mtl_word_stream_aligned_V_data_V0_status, ap_block_state2_io)
    begin
                ap_condition_81 <= (not(((mtl_word_stream_aligned_V_data_V0_status = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state2_io))) and (ap_const_logic_1 = ap_CS_fsm_state2));
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state3, tmp_last_V_reg_227, ap_block_state3_io)
    begin
        if (((ap_const_boolean_0 = ap_block_state3_io) and (tmp_last_V_reg_227 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
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


    ap_phi_mux_previous_element_2_2_phi_fu_145_p4_assign_proc : process(ap_CS_fsm_state3, brmerge_demorgan_fu_203_p2, previous_element_2_1_reg_131)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
            if ((brmerge_demorgan_fu_203_p2 = ap_const_lv1_0)) then 
                ap_phi_mux_previous_element_2_2_phi_fu_145_p4 <= previous_element_2_1_reg_131;
            elsif ((brmerge_demorgan_fu_203_p2 = ap_const_lv1_1)) then 
                ap_phi_mux_previous_element_2_2_phi_fu_145_p4 <= ap_const_lv1_1;
            else 
                ap_phi_mux_previous_element_2_2_phi_fu_145_p4 <= "X";
            end if;
        else 
            ap_phi_mux_previous_element_2_2_phi_fu_145_p4 <= "X";
        end if; 
    end process;


    ap_predicate_op25_write_state2_assign_proc : process(tmp_s_fu_182_p2, p_3_fu_82)
    begin
                ap_predicate_op25_write_state2 <= ((p_3_fu_82 = ap_const_lv1_1) and (tmp_s_fu_182_p2 = ap_const_lv1_0));
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state3, tmp_last_V_reg_227, ap_block_state3_io)
    begin
        if (((ap_const_boolean_0 = ap_block_state3_io) and (tmp_last_V_reg_227 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_ioackin_axis_m_0_TREADY_assign_proc : process(axis_m_0_TREADY, ap_reg_ioackin_axis_m_0_TREADY)
    begin
        if ((ap_reg_ioackin_axis_m_0_TREADY = ap_const_logic_0)) then 
            ap_sig_ioackin_axis_m_0_TREADY <= axis_m_0_TREADY;
        else 
            ap_sig_ioackin_axis_m_0_TREADY <= ap_const_logic_1;
        end if; 
    end process;

    axis_m_0_TDATA <= tmp_data_V_fu_90;

    axis_m_0_TDATA_blk_n_assign_proc : process(axis_m_0_TREADY, ap_CS_fsm_state2, tmp_s_fu_182_p2, ap_CS_fsm_state3, brmerge_demorgan_fu_203_p2, p_3_fu_82)
    begin
        if ((((brmerge_demorgan_fu_203_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3)) or ((p_3_fu_82 = ap_const_lv1_1) and (tmp_s_fu_182_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
            axis_m_0_TDATA_blk_n <= axis_m_0_TREADY;
        else 
            axis_m_0_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    axis_m_0_TLAST_assign_proc : process(ap_CS_fsm_state2, ap_CS_fsm_state3, brmerge_demorgan_fu_203_p2, mtl_word_stream_aligned_V_data_V0_status, ap_predicate_op25_write_state2, tmp_last_V_8_reg_118)
    begin
        if (((brmerge_demorgan_fu_203_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            axis_m_0_TLAST <= ap_const_lv1_1;
        elsif (((mtl_word_stream_aligned_V_data_V0_status = ap_const_logic_1) and (ap_predicate_op25_write_state2 = ap_const_boolean_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            axis_m_0_TLAST <= tmp_last_V_8_reg_118;
        else 
            axis_m_0_TLAST <= "X";
        end if; 
    end process;

    axis_m_0_TSTRB <= tmp_strb_V_fu_86;

    axis_m_0_TVALID_assign_proc : process(ap_CS_fsm_state2, ap_CS_fsm_state3, brmerge_demorgan_fu_203_p2, mtl_word_stream_aligned_V_data_V0_status, ap_predicate_op25_write_state2, ap_reg_ioackin_axis_m_0_TREADY)
    begin
        if ((((brmerge_demorgan_fu_203_p2 = ap_const_lv1_1) and (ap_reg_ioackin_axis_m_0_TREADY = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state3)) or ((mtl_word_stream_aligned_V_data_V0_status = ap_const_logic_1) and (ap_reg_ioackin_axis_m_0_TREADY = ap_const_logic_0) and (ap_predicate_op25_write_state2 = ap_const_boolean_1) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
            axis_m_0_TVALID <= ap_const_logic_1;
        else 
            axis_m_0_TVALID <= ap_const_logic_0;
        end if; 
    end process;

    brmerge_demorgan_fu_203_p2 <= (tmp_last_V_reg_227 and p_3_fu_82);
    mtl_word_stream_aligned_V_data_V0_status <= (mtl_word_stream_aligned_V_strb_V_empty_n and mtl_word_stream_aligned_V_last_V_empty_n and mtl_word_stream_aligned_V_data_V_empty_n);

    mtl_word_stream_aligned_V_data_V0_update_assign_proc : process(ap_CS_fsm_state2, mtl_word_stream_aligned_V_data_V0_status, ap_block_state2_io)
    begin
        if ((not(((mtl_word_stream_aligned_V_data_V0_status = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state2_io))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            mtl_word_stream_aligned_V_data_V0_update <= ap_const_logic_1;
        else 
            mtl_word_stream_aligned_V_data_V0_update <= ap_const_logic_0;
        end if; 
    end process;


    mtl_word_stream_aligned_V_data_V_blk_n_assign_proc : process(mtl_word_stream_aligned_V_data_V_empty_n, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            mtl_word_stream_aligned_V_data_V_blk_n <= mtl_word_stream_aligned_V_data_V_empty_n;
        else 
            mtl_word_stream_aligned_V_data_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    mtl_word_stream_aligned_V_data_V_read <= mtl_word_stream_aligned_V_data_V0_update;

    mtl_word_stream_aligned_V_last_V_blk_n_assign_proc : process(mtl_word_stream_aligned_V_last_V_empty_n, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            mtl_word_stream_aligned_V_last_V_blk_n <= mtl_word_stream_aligned_V_last_V_empty_n;
        else 
            mtl_word_stream_aligned_V_last_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    mtl_word_stream_aligned_V_last_V_read <= mtl_word_stream_aligned_V_data_V0_update;

    mtl_word_stream_aligned_V_strb_V_blk_n_assign_proc : process(mtl_word_stream_aligned_V_strb_V_empty_n, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            mtl_word_stream_aligned_V_strb_V_blk_n <= mtl_word_stream_aligned_V_strb_V_empty_n;
        else 
            mtl_word_stream_aligned_V_strb_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    mtl_word_stream_aligned_V_strb_V_read <= mtl_word_stream_aligned_V_data_V0_update;
    tmp_s_fu_182_p2 <= "1" when (mtl_word_stream_aligned_V_strb_V_dout = ap_const_lv8_0) else "0";
end behav;
