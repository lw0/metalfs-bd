-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.1
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity op_passthrough387 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    axis_s_2_TDATA : IN STD_LOGIC_VECTOR (63 downto 0);
    axis_s_2_TVALID : IN STD_LOGIC;
    axis_s_2_TREADY : OUT STD_LOGIC;
    axis_s_2_TSTRB : IN STD_LOGIC_VECTOR (7 downto 0);
    axis_s_2_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    axis_m_2_TDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
    axis_m_2_TVALID : OUT STD_LOGIC;
    axis_m_2_TREADY : IN STD_LOGIC;
    axis_m_2_TSTRB : OUT STD_LOGIC_VECTOR (7 downto 0);
    axis_m_2_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0);
    p_read : IN STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of op_passthrough387 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal axis_s_2_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal p_read_3_read_fu_30_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal axis_m_2_TDATA_blk_n : STD_LOGIC;
    signal ap_block_state1 : BOOLEAN;
    signal ap_block_state2 : BOOLEAN;
    signal ap_sig_ioackin_axis_m_2_TREADY : STD_LOGIC;
    signal ap_block_state2_io : BOOLEAN;
    signal tmp_last_V_fu_69_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_reg_ioackin_axis_m_2_TREADY : STD_LOGIC := '0';
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_condition_111 : BOOLEAN;
    signal ap_condition_65 : BOOLEAN;


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
                elsif ((not(((ap_const_boolean_1 = ap_block_state2_io) or ((p_read = ap_const_lv1_1) and (axis_s_2_TVALID = ap_const_logic_0)))) and (ap_const_logic_1 = ap_CS_fsm_state2) and ((tmp_last_V_fu_69_p1 = ap_const_lv1_1) or (p_read_3_read_fu_30_p2 = ap_const_lv1_0)))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_reg_ioackin_axis_m_2_TREADY_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ioackin_axis_m_2_TREADY <= ap_const_logic_0;
            else
                if (((p_read = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    if ((ap_const_boolean_1 = ap_condition_65)) then 
                        ap_reg_ioackin_axis_m_2_TREADY <= ap_const_logic_0;
                    elsif ((ap_const_boolean_1 = ap_condition_111)) then 
                        ap_reg_ioackin_axis_m_2_TREADY <= ap_const_logic_1;
                    end if;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, axis_s_2_TVALID, p_read, ap_CS_fsm_state2, p_read_3_read_fu_30_p2, ap_block_state2_io, tmp_last_V_fu_69_p1)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if ((not(((ap_const_boolean_1 = ap_block_state2_io) or ((p_read = ap_const_lv1_1) and (axis_s_2_TVALID = ap_const_logic_0)))) and (ap_const_logic_1 = ap_CS_fsm_state2) and ((tmp_last_V_fu_69_p1 = ap_const_lv1_1) or (p_read_3_read_fu_30_p2 = ap_const_lv1_0)))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                elsif ((not(((ap_const_boolean_1 = ap_block_state2_io) or ((p_read = ap_const_lv1_1) and (axis_s_2_TVALID = ap_const_logic_0)))) and (tmp_last_V_fu_69_p1 = ap_const_lv1_0) and (p_read = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);

    ap_block_state1_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_block_state2_assign_proc : process(axis_s_2_TVALID, p_read)
    begin
                ap_block_state2 <= ((p_read = ap_const_lv1_1) and (axis_s_2_TVALID = ap_const_logic_0));
    end process;


    ap_block_state2_io_assign_proc : process(p_read, ap_sig_ioackin_axis_m_2_TREADY)
    begin
                ap_block_state2_io <= ((p_read = ap_const_lv1_1) and (ap_sig_ioackin_axis_m_2_TREADY = ap_const_logic_0));
    end process;


    ap_condition_111_assign_proc : process(axis_s_2_TVALID, axis_m_2_TREADY, p_read)
    begin
                ap_condition_111 <= (not(((p_read = ap_const_lv1_1) and (axis_s_2_TVALID = ap_const_logic_0))) and (axis_m_2_TREADY = ap_const_logic_1));
    end process;


    ap_condition_65_assign_proc : process(axis_s_2_TVALID, p_read, ap_block_state2_io)
    begin
                ap_condition_65 <= not(((ap_const_boolean_1 = ap_block_state2_io) or ((p_read = ap_const_lv1_1) and (axis_s_2_TVALID = ap_const_logic_0))));
    end process;


    ap_done_assign_proc : process(ap_done_reg, axis_s_2_TVALID, p_read, ap_CS_fsm_state2, p_read_3_read_fu_30_p2, ap_block_state2_io, tmp_last_V_fu_69_p1)
    begin
        if ((not(((ap_const_boolean_1 = ap_block_state2_io) or ((p_read = ap_const_lv1_1) and (axis_s_2_TVALID = ap_const_logic_0)))) and (ap_const_logic_1 = ap_CS_fsm_state2) and ((tmp_last_V_fu_69_p1 = ap_const_lv1_1) or (p_read_3_read_fu_30_p2 = ap_const_lv1_0)))) then 
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


    ap_ready_assign_proc : process(axis_s_2_TVALID, p_read, ap_CS_fsm_state2, p_read_3_read_fu_30_p2, ap_block_state2_io, tmp_last_V_fu_69_p1)
    begin
        if ((not(((ap_const_boolean_1 = ap_block_state2_io) or ((p_read = ap_const_lv1_1) and (axis_s_2_TVALID = ap_const_logic_0)))) and (ap_const_logic_1 = ap_CS_fsm_state2) and ((tmp_last_V_fu_69_p1 = ap_const_lv1_1) or (p_read_3_read_fu_30_p2 = ap_const_lv1_0)))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_ioackin_axis_m_2_TREADY_assign_proc : process(axis_m_2_TREADY, ap_reg_ioackin_axis_m_2_TREADY)
    begin
        if ((ap_reg_ioackin_axis_m_2_TREADY = ap_const_logic_0)) then 
            ap_sig_ioackin_axis_m_2_TREADY <= axis_m_2_TREADY;
        else 
            ap_sig_ioackin_axis_m_2_TREADY <= ap_const_logic_1;
        end if; 
    end process;

    axis_m_2_TDATA <= axis_s_2_TDATA;

    axis_m_2_TDATA_blk_n_assign_proc : process(axis_m_2_TREADY, p_read, ap_CS_fsm_state2)
    begin
        if (((p_read = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            axis_m_2_TDATA_blk_n <= axis_m_2_TREADY;
        else 
            axis_m_2_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    axis_m_2_TLAST <= axis_s_2_TLAST;
    axis_m_2_TSTRB <= axis_s_2_TSTRB;

    axis_m_2_TVALID_assign_proc : process(axis_s_2_TVALID, p_read, ap_CS_fsm_state2, ap_reg_ioackin_axis_m_2_TREADY)
    begin
        if ((not(((p_read = ap_const_lv1_1) and (axis_s_2_TVALID = ap_const_logic_0))) and (p_read = ap_const_lv1_1) and (ap_reg_ioackin_axis_m_2_TREADY = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            axis_m_2_TVALID <= ap_const_logic_1;
        else 
            axis_m_2_TVALID <= ap_const_logic_0;
        end if; 
    end process;


    axis_s_2_TDATA_blk_n_assign_proc : process(axis_s_2_TVALID, p_read, ap_CS_fsm_state2)
    begin
        if (((p_read = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            axis_s_2_TDATA_blk_n <= axis_s_2_TVALID;
        else 
            axis_s_2_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    axis_s_2_TREADY_assign_proc : process(axis_s_2_TVALID, p_read, ap_CS_fsm_state2, ap_block_state2_io)
    begin
        if ((not(((ap_const_boolean_1 = ap_block_state2_io) or ((p_read = ap_const_lv1_1) and (axis_s_2_TVALID = ap_const_logic_0)))) and (p_read = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            axis_s_2_TREADY <= ap_const_logic_1;
        else 
            axis_s_2_TREADY <= ap_const_logic_0;
        end if; 
    end process;

    p_read_3_read_fu_30_p2 <= p_read;
    tmp_last_V_fu_69_p1 <= axis_s_2_TLAST;
end behav;
