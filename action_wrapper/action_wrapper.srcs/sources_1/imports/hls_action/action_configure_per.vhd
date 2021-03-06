-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.1
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity action_configure_per is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    m_axi_perfmon_ctrl_V_AWVALID : OUT STD_LOGIC;
    m_axi_perfmon_ctrl_V_AWREADY : IN STD_LOGIC;
    m_axi_perfmon_ctrl_V_AWADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_perfmon_ctrl_V_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_perfmon_ctrl_V_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_perfmon_ctrl_V_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_perfmon_ctrl_V_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_perfmon_ctrl_V_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_perfmon_ctrl_V_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_perfmon_ctrl_V_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_perfmon_ctrl_V_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_perfmon_ctrl_V_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_perfmon_ctrl_V_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_perfmon_ctrl_V_WVALID : OUT STD_LOGIC;
    m_axi_perfmon_ctrl_V_WREADY : IN STD_LOGIC;
    m_axi_perfmon_ctrl_V_WDATA : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_perfmon_ctrl_V_WSTRB : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_perfmon_ctrl_V_WLAST : OUT STD_LOGIC;
    m_axi_perfmon_ctrl_V_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_perfmon_ctrl_V_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_perfmon_ctrl_V_ARVALID : OUT STD_LOGIC;
    m_axi_perfmon_ctrl_V_ARREADY : IN STD_LOGIC;
    m_axi_perfmon_ctrl_V_ARADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_perfmon_ctrl_V_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_perfmon_ctrl_V_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_perfmon_ctrl_V_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_perfmon_ctrl_V_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_perfmon_ctrl_V_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_perfmon_ctrl_V_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_perfmon_ctrl_V_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_perfmon_ctrl_V_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_perfmon_ctrl_V_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_perfmon_ctrl_V_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_perfmon_ctrl_V_RVALID : IN STD_LOGIC;
    m_axi_perfmon_ctrl_V_RREADY : OUT STD_LOGIC;
    m_axi_perfmon_ctrl_V_RDATA : IN STD_LOGIC_VECTOR (31 downto 0);
    m_axi_perfmon_ctrl_V_RLAST : IN STD_LOGIC;
    m_axi_perfmon_ctrl_V_RID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_perfmon_ctrl_V_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_perfmon_ctrl_V_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_perfmon_ctrl_V_BVALID : IN STD_LOGIC;
    m_axi_perfmon_ctrl_V_BREADY : OUT STD_LOGIC;
    m_axi_perfmon_ctrl_V_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_perfmon_ctrl_V_BID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_perfmon_ctrl_V_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    stream_id0 : IN STD_LOGIC_VECTOR (7 downto 0);
    stream_id1 : IN STD_LOGIC_VECTOR (7 downto 0) );
end;


architecture behav of action_configure_per is 
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
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv64_11 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000010001";
    constant ap_const_lv4_F : STD_LOGIC_VECTOR (3 downto 0) := "1111";
    constant ap_const_lv5_0 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    constant ap_const_lv32_15121110 : STD_LOGIC_VECTOR (31 downto 0) := "00010101000100100001000100010000";
    constant ap_const_lv32_12111016 : STD_LOGIC_VECTOR (31 downto 0) := "00010010000100010001000000010110";
    constant ap_const_lv21_1615 : STD_LOGIC_VECTOR (20 downto 0) := "000000001011000010101";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_CS_fsm : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal perfmon_ctrl_V_blk_n_AW : STD_LOGIC;
    signal perfmon_ctrl_V_blk_n_W : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal perfmon_ctrl_V_blk_n_B : STD_LOGIC;
    signal ap_CS_fsm_state9 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state9 : signal is "none";
    signal ap_sig_ioackin_m_axi_perfmon_ctrl_V_AWREADY : STD_LOGIC;
    signal ap_sig_ioackin_m_axi_perfmon_ctrl_V_WREADY : STD_LOGIC;
    signal ap_reg_ioackin_m_axi_perfmon_ctrl_V_AWREADY : STD_LOGIC := '0';
    signal ap_reg_ioackin_m_axi_perfmon_ctrl_V_WREADY : STD_LOGIC := '0';
    signal metrics_0_fu_115_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal metrics_1_fu_139_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal metrics_2_cast_fu_160_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_fu_97_p1 : STD_LOGIC_VECTOR (2 downto 0);
    signal tmp_18_fu_101_p6 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_348_fu_122_p1 : STD_LOGIC_VECTOR (2 downto 0);
    signal tmp_19_fu_126_p6 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_21_fu_146_p4 : STD_LOGIC_VECTOR (20 downto 0);
    signal metrics_2_fu_154_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (8 downto 0);


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


    ap_reg_ioackin_m_axi_perfmon_ctrl_V_AWREADY_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ioackin_m_axi_perfmon_ctrl_V_AWREADY <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                    if (not(((ap_start = ap_const_logic_0) or (ap_sig_ioackin_m_axi_perfmon_ctrl_V_AWREADY = ap_const_logic_0)))) then 
                        ap_reg_ioackin_m_axi_perfmon_ctrl_V_AWREADY <= ap_const_logic_0;
                    elsif (((m_axi_perfmon_ctrl_V_AWREADY = ap_const_logic_1) and (ap_start = ap_const_logic_1))) then 
                        ap_reg_ioackin_m_axi_perfmon_ctrl_V_AWREADY <= ap_const_logic_1;
                    end if;
                end if; 
            end if;
        end if;
    end process;


    ap_reg_ioackin_m_axi_perfmon_ctrl_V_WREADY_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ioackin_m_axi_perfmon_ctrl_V_WREADY <= ap_const_logic_0;
            else
                if ((((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_sig_ioackin_m_axi_perfmon_ctrl_V_WREADY = ap_const_logic_1)) or ((ap_const_logic_1 = ap_CS_fsm_state4) and (ap_sig_ioackin_m_axi_perfmon_ctrl_V_WREADY = ap_const_logic_1)) or ((ap_const_logic_1 = ap_CS_fsm_state3) and (ap_sig_ioackin_m_axi_perfmon_ctrl_V_WREADY = ap_const_logic_1)))) then 
                    ap_reg_ioackin_m_axi_perfmon_ctrl_V_WREADY <= ap_const_logic_0;
                elsif ((((ap_const_logic_1 = ap_CS_fsm_state2) and (m_axi_perfmon_ctrl_V_WREADY = ap_const_logic_1)) or ((m_axi_perfmon_ctrl_V_WREADY = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state4)) or ((ap_const_logic_1 = ap_CS_fsm_state3) and (m_axi_perfmon_ctrl_V_WREADY = ap_const_logic_1)))) then 
                    ap_reg_ioackin_m_axi_perfmon_ctrl_V_WREADY <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, m_axi_perfmon_ctrl_V_BVALID, ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_CS_fsm_state9, ap_sig_ioackin_m_axi_perfmon_ctrl_V_AWREADY, ap_sig_ioackin_m_axi_perfmon_ctrl_V_WREADY)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (ap_sig_ioackin_m_axi_perfmon_ctrl_V_AWREADY = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_sig_ioackin_m_axi_perfmon_ctrl_V_WREADY = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state3) and (ap_sig_ioackin_m_axi_perfmon_ctrl_V_WREADY = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state4 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state4) and (ap_sig_ioackin_m_axi_perfmon_ctrl_V_WREADY = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state9;
            when ap_ST_fsm_state9 => 
                if (((m_axi_perfmon_ctrl_V_BVALID = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state9))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
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
    ap_CS_fsm_state9 <= ap_CS_fsm(8);

    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, m_axi_perfmon_ctrl_V_BVALID, ap_CS_fsm_state9)
    begin
        if ((((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((m_axi_perfmon_ctrl_V_BVALID = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state9)))) then 
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


    ap_ready_assign_proc : process(m_axi_perfmon_ctrl_V_BVALID, ap_CS_fsm_state9)
    begin
        if (((m_axi_perfmon_ctrl_V_BVALID = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state9))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_ioackin_m_axi_perfmon_ctrl_V_AWREADY_assign_proc : process(m_axi_perfmon_ctrl_V_AWREADY, ap_reg_ioackin_m_axi_perfmon_ctrl_V_AWREADY)
    begin
        if ((ap_reg_ioackin_m_axi_perfmon_ctrl_V_AWREADY = ap_const_logic_0)) then 
            ap_sig_ioackin_m_axi_perfmon_ctrl_V_AWREADY <= m_axi_perfmon_ctrl_V_AWREADY;
        else 
            ap_sig_ioackin_m_axi_perfmon_ctrl_V_AWREADY <= ap_const_logic_1;
        end if; 
    end process;


    ap_sig_ioackin_m_axi_perfmon_ctrl_V_WREADY_assign_proc : process(m_axi_perfmon_ctrl_V_WREADY, ap_reg_ioackin_m_axi_perfmon_ctrl_V_WREADY)
    begin
        if ((ap_reg_ioackin_m_axi_perfmon_ctrl_V_WREADY = ap_const_logic_0)) then 
            ap_sig_ioackin_m_axi_perfmon_ctrl_V_WREADY <= m_axi_perfmon_ctrl_V_WREADY;
        else 
            ap_sig_ioackin_m_axi_perfmon_ctrl_V_WREADY <= ap_const_logic_1;
        end if; 
    end process;

    m_axi_perfmon_ctrl_V_ARADDR <= ap_const_lv64_0;
    m_axi_perfmon_ctrl_V_ARBURST <= ap_const_lv2_0;
    m_axi_perfmon_ctrl_V_ARCACHE <= ap_const_lv4_0;
    m_axi_perfmon_ctrl_V_ARID <= ap_const_lv1_0;
    m_axi_perfmon_ctrl_V_ARLEN <= ap_const_lv32_0;
    m_axi_perfmon_ctrl_V_ARLOCK <= ap_const_lv2_0;
    m_axi_perfmon_ctrl_V_ARPROT <= ap_const_lv3_0;
    m_axi_perfmon_ctrl_V_ARQOS <= ap_const_lv4_0;
    m_axi_perfmon_ctrl_V_ARREGION <= ap_const_lv4_0;
    m_axi_perfmon_ctrl_V_ARSIZE <= ap_const_lv3_0;
    m_axi_perfmon_ctrl_V_ARUSER <= ap_const_lv1_0;
    m_axi_perfmon_ctrl_V_ARVALID <= ap_const_logic_0;
    m_axi_perfmon_ctrl_V_AWADDR <= ap_const_lv64_11;
    m_axi_perfmon_ctrl_V_AWBURST <= ap_const_lv2_0;
    m_axi_perfmon_ctrl_V_AWCACHE <= ap_const_lv4_0;
    m_axi_perfmon_ctrl_V_AWID <= ap_const_lv1_0;
    m_axi_perfmon_ctrl_V_AWLEN <= ap_const_lv32_3;
    m_axi_perfmon_ctrl_V_AWLOCK <= ap_const_lv2_0;
    m_axi_perfmon_ctrl_V_AWPROT <= ap_const_lv3_0;
    m_axi_perfmon_ctrl_V_AWQOS <= ap_const_lv4_0;
    m_axi_perfmon_ctrl_V_AWREGION <= ap_const_lv4_0;
    m_axi_perfmon_ctrl_V_AWSIZE <= ap_const_lv3_0;
    m_axi_perfmon_ctrl_V_AWUSER <= ap_const_lv1_0;

    m_axi_perfmon_ctrl_V_AWVALID_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_reg_ioackin_m_axi_perfmon_ctrl_V_AWREADY)
    begin
        if (((ap_reg_ioackin_m_axi_perfmon_ctrl_V_AWREADY = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
            m_axi_perfmon_ctrl_V_AWVALID <= ap_const_logic_1;
        else 
            m_axi_perfmon_ctrl_V_AWVALID <= ap_const_logic_0;
        end if; 
    end process;


    m_axi_perfmon_ctrl_V_BREADY_assign_proc : process(m_axi_perfmon_ctrl_V_BVALID, ap_CS_fsm_state9)
    begin
        if (((m_axi_perfmon_ctrl_V_BVALID = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state9))) then 
            m_axi_perfmon_ctrl_V_BREADY <= ap_const_logic_1;
        else 
            m_axi_perfmon_ctrl_V_BREADY <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_perfmon_ctrl_V_RREADY <= ap_const_logic_0;

    m_axi_perfmon_ctrl_V_WDATA_assign_proc : process(ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_reg_ioackin_m_axi_perfmon_ctrl_V_WREADY, metrics_0_fu_115_p2, metrics_1_fu_139_p2, metrics_2_cast_fu_160_p1)
    begin
        if ((ap_reg_ioackin_m_axi_perfmon_ctrl_V_WREADY = ap_const_logic_0)) then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                m_axi_perfmon_ctrl_V_WDATA <= metrics_2_cast_fu_160_p1;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
                m_axi_perfmon_ctrl_V_WDATA <= metrics_1_fu_139_p2;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
                m_axi_perfmon_ctrl_V_WDATA <= metrics_0_fu_115_p2;
            else 
                m_axi_perfmon_ctrl_V_WDATA <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            end if;
        else 
            m_axi_perfmon_ctrl_V_WDATA <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    m_axi_perfmon_ctrl_V_WID <= ap_const_lv1_0;
    m_axi_perfmon_ctrl_V_WLAST <= ap_const_logic_0;
    m_axi_perfmon_ctrl_V_WSTRB <= ap_const_lv4_F;
    m_axi_perfmon_ctrl_V_WUSER <= ap_const_lv1_0;

    m_axi_perfmon_ctrl_V_WVALID_assign_proc : process(ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state4, ap_reg_ioackin_m_axi_perfmon_ctrl_V_WREADY)
    begin
        if ((((ap_reg_ioackin_m_axi_perfmon_ctrl_V_WREADY = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state2)) or ((ap_reg_ioackin_m_axi_perfmon_ctrl_V_WREADY = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state4)) or ((ap_reg_ioackin_m_axi_perfmon_ctrl_V_WREADY = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state3)))) then 
            m_axi_perfmon_ctrl_V_WVALID <= ap_const_logic_1;
        else 
            m_axi_perfmon_ctrl_V_WVALID <= ap_const_logic_0;
        end if; 
    end process;

    metrics_0_fu_115_p2 <= (tmp_18_fu_101_p6 or ap_const_lv32_15121110);
    metrics_1_fu_139_p2 <= (tmp_19_fu_126_p6 or ap_const_lv32_12111016);
    metrics_2_cast_fu_160_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(metrics_2_fu_154_p2),32));
    metrics_2_fu_154_p2 <= (tmp_21_fu_146_p4 or ap_const_lv21_1615);

    perfmon_ctrl_V_blk_n_AW_assign_proc : process(ap_start, ap_CS_fsm_state1, m_axi_perfmon_ctrl_V_AWREADY)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
            perfmon_ctrl_V_blk_n_AW <= m_axi_perfmon_ctrl_V_AWREADY;
        else 
            perfmon_ctrl_V_blk_n_AW <= ap_const_logic_1;
        end if; 
    end process;


    perfmon_ctrl_V_blk_n_B_assign_proc : process(m_axi_perfmon_ctrl_V_BVALID, ap_CS_fsm_state9)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state9)) then 
            perfmon_ctrl_V_blk_n_B <= m_axi_perfmon_ctrl_V_BVALID;
        else 
            perfmon_ctrl_V_blk_n_B <= ap_const_logic_1;
        end if; 
    end process;


    perfmon_ctrl_V_blk_n_W_assign_proc : process(m_axi_perfmon_ctrl_V_WREADY, ap_CS_fsm_state2, ap_CS_fsm_state3, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state2) or (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            perfmon_ctrl_V_blk_n_W <= m_axi_perfmon_ctrl_V_WREADY;
        else 
            perfmon_ctrl_V_blk_n_W <= ap_const_logic_1;
        end if; 
    end process;

    tmp_18_fu_101_p6 <= ((((tmp_fu_97_p1 & stream_id0) & stream_id0) & stream_id0) & ap_const_lv5_0);
    tmp_19_fu_126_p6 <= ((((tmp_348_fu_122_p1 & stream_id1) & stream_id1) & stream_id0) & ap_const_lv5_0);
    tmp_21_fu_146_p4 <= ((stream_id1 & stream_id1) & ap_const_lv5_0);
    tmp_348_fu_122_p1 <= stream_id1(3 - 1 downto 0);
    tmp_fu_97_p1 <= stream_id0(3 - 1 downto 0);
end behav;
