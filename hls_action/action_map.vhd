-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.1
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity action_map is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    m_axi_mem_in_V_AWVALID : OUT STD_LOGIC;
    m_axi_mem_in_V_AWREADY : IN STD_LOGIC;
    m_axi_mem_in_V_AWADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_mem_in_V_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_mem_in_V_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_mem_in_V_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_mem_in_V_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_mem_in_V_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_mem_in_V_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_mem_in_V_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_mem_in_V_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_mem_in_V_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_mem_in_V_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_mem_in_V_WVALID : OUT STD_LOGIC;
    m_axi_mem_in_V_WREADY : IN STD_LOGIC;
    m_axi_mem_in_V_WDATA : OUT STD_LOGIC_VECTOR (511 downto 0);
    m_axi_mem_in_V_WSTRB : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_mem_in_V_WLAST : OUT STD_LOGIC;
    m_axi_mem_in_V_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_mem_in_V_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_mem_in_V_ARVALID : OUT STD_LOGIC;
    m_axi_mem_in_V_ARREADY : IN STD_LOGIC;
    m_axi_mem_in_V_ARADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_mem_in_V_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_mem_in_V_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_mem_in_V_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_mem_in_V_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_mem_in_V_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_mem_in_V_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_mem_in_V_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_mem_in_V_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_mem_in_V_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_mem_in_V_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_mem_in_V_RVALID : IN STD_LOGIC;
    m_axi_mem_in_V_RREADY : OUT STD_LOGIC;
    m_axi_mem_in_V_RDATA : IN STD_LOGIC_VECTOR (511 downto 0);
    m_axi_mem_in_V_RLAST : IN STD_LOGIC;
    m_axi_mem_in_V_RID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_mem_in_V_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_mem_in_V_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_mem_in_V_BVALID : IN STD_LOGIC;
    m_axi_mem_in_V_BREADY : OUT STD_LOGIC;
    m_axi_mem_in_V_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_mem_in_V_BID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_mem_in_V_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    mem_in_V_offset : IN STD_LOGIC_VECTOR (57 downto 0);
    job_slot_V_read : IN STD_LOGIC_VECTOR (63 downto 0);
    job_extent_count_V_r : IN STD_LOGIC_VECTOR (9 downto 0);
    job_extent_address_V : IN STD_LOGIC_VECTOR (63 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (8 downto 0) );
end;


architecture behav of action_map is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv512_lc_1 : STD_LOGIC_VECTOR (511 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv9_102 : STD_LOGIC_VECTOR (8 downto 0) := "100000010";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv64_1 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000001";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv9_104 : STD_LOGIC_VECTOR (8 downto 0) := "100000100";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal read_extmap_extents_1_ce0 : STD_LOGIC;
    signal read_extmap_extents_1_we0 : STD_LOGIC;
    signal read_extmap_extents_1_q0 : STD_LOGIC_VECTOR (63 downto 0);
    signal read_extmap_extents_2_ce0 : STD_LOGIC;
    signal read_extmap_extents_2_we0 : STD_LOGIC;
    signal read_extmap_extents_s_ce0 : STD_LOGIC;
    signal read_extmap_extents_s_we0 : STD_LOGIC;
    signal write_extmap_extents_1_ce0 : STD_LOGIC;
    signal write_extmap_extents_1_we0 : STD_LOGIC;
    signal write_extmap_extents_1_q0 : STD_LOGIC_VECTOR (63 downto 0);
    signal write_extmap_extents_2_ce0 : STD_LOGIC;
    signal write_extmap_extents_2_we0 : STD_LOGIC;
    signal write_extmap_extents_ce0 : STD_LOGIC;
    signal write_extmap_extents_we0 : STD_LOGIC;
    signal grp_mtl_extmap_load_fu_117_ap_start : STD_LOGIC;
    signal grp_mtl_extmap_load_fu_117_ap_done : STD_LOGIC;
    signal grp_mtl_extmap_load_fu_117_ap_idle : STD_LOGIC;
    signal grp_mtl_extmap_load_fu_117_ap_ready : STD_LOGIC;
    signal grp_mtl_extmap_load_fu_117_map_extents_begin_V_address0 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_mtl_extmap_load_fu_117_map_extents_begin_V_ce0 : STD_LOGIC;
    signal grp_mtl_extmap_load_fu_117_map_extents_begin_V_we0 : STD_LOGIC;
    signal grp_mtl_extmap_load_fu_117_map_extents_begin_V_d0 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_mtl_extmap_load_fu_117_map_extents_begin_V_q0 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_mtl_extmap_load_fu_117_map_extents_count_V_address0 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_mtl_extmap_load_fu_117_map_extents_count_V_ce0 : STD_LOGIC;
    signal grp_mtl_extmap_load_fu_117_map_extents_count_V_we0 : STD_LOGIC;
    signal grp_mtl_extmap_load_fu_117_map_extents_count_V_d0 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_mtl_extmap_load_fu_117_map_extents_nextlblo_address0 : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_mtl_extmap_load_fu_117_map_extents_nextlblo_ce0 : STD_LOGIC;
    signal grp_mtl_extmap_load_fu_117_map_extents_nextlblo_we0 : STD_LOGIC;
    signal grp_mtl_extmap_load_fu_117_map_extents_nextlblo_d0 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_AWVALID : STD_LOGIC;
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_AWADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_AWID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_AWLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_AWSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_AWBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_AWLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_AWCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_AWPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_AWQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_AWREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_AWUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_WVALID : STD_LOGIC;
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_WDATA : STD_LOGIC_VECTOR (511 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_WSTRB : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_WLAST : STD_LOGIC;
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_WID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_WUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARVALID : STD_LOGIC;
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARADDR : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARLEN : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARSIZE : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARBURST : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARLOCK : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARCACHE : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARPROT : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARQOS : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARREGION : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_RREADY : STD_LOGIC;
    signal grp_mtl_extmap_load_fu_117_m_axi_mem_V_BREADY : STD_LOGIC;
    signal grp_mtl_extmap_load_fu_117_ap_return_0 : STD_LOGIC_VECTOR (9 downto 0);
    signal grp_mtl_extmap_load_fu_117_ap_return_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal grp_mtl_extmap_load_fu_117_ap_return_2 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_phi_mux_agg_result_V_phi_fu_106_p6 : STD_LOGIC_VECTOR (8 downto 0);
    signal agg_result_V_reg_102 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_block_state2_on_subcall_done : BOOLEAN;
    signal grp_mtl_extmap_load_fu_117_ap_start_reg : STD_LOGIC := '0';
    signal ap_return_preg : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);

    component mtl_extmap_load IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        map_extents_begin_V_address0 : OUT STD_LOGIC_VECTOR (8 downto 0);
        map_extents_begin_V_ce0 : OUT STD_LOGIC;
        map_extents_begin_V_we0 : OUT STD_LOGIC;
        map_extents_begin_V_d0 : OUT STD_LOGIC_VECTOR (63 downto 0);
        map_extents_begin_V_q0 : IN STD_LOGIC_VECTOR (63 downto 0);
        map_extents_count_V_address0 : OUT STD_LOGIC_VECTOR (8 downto 0);
        map_extents_count_V_ce0 : OUT STD_LOGIC;
        map_extents_count_V_we0 : OUT STD_LOGIC;
        map_extents_count_V_d0 : OUT STD_LOGIC_VECTOR (63 downto 0);
        map_extents_nextlblo_address0 : OUT STD_LOGIC_VECTOR (8 downto 0);
        map_extents_nextlblo_ce0 : OUT STD_LOGIC;
        map_extents_nextlblo_we0 : OUT STD_LOGIC;
        map_extents_nextlblo_d0 : OUT STD_LOGIC_VECTOR (63 downto 0);
        map_extent_count_V_w : IN STD_LOGIC_VECTOR (9 downto 0);
        extent_address_V : IN STD_LOGIC_VECTOR (63 downto 0);
        m_axi_mem_V_AWVALID : OUT STD_LOGIC;
        m_axi_mem_V_AWREADY : IN STD_LOGIC;
        m_axi_mem_V_AWADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_mem_V_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_mem_V_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
        m_axi_mem_V_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_mem_V_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_mem_V_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_mem_V_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_mem_V_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_mem_V_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_mem_V_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_mem_V_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_mem_V_WVALID : OUT STD_LOGIC;
        m_axi_mem_V_WREADY : IN STD_LOGIC;
        m_axi_mem_V_WDATA : OUT STD_LOGIC_VECTOR (511 downto 0);
        m_axi_mem_V_WSTRB : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_mem_V_WLAST : OUT STD_LOGIC;
        m_axi_mem_V_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_mem_V_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_mem_V_ARVALID : OUT STD_LOGIC;
        m_axi_mem_V_ARREADY : IN STD_LOGIC;
        m_axi_mem_V_ARADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
        m_axi_mem_V_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_mem_V_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
        m_axi_mem_V_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_mem_V_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_mem_V_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
        m_axi_mem_V_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_mem_V_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
        m_axi_mem_V_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_mem_V_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
        m_axi_mem_V_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axi_mem_V_RVALID : IN STD_LOGIC;
        m_axi_mem_V_RREADY : OUT STD_LOGIC;
        m_axi_mem_V_RDATA : IN STD_LOGIC_VECTOR (511 downto 0);
        m_axi_mem_V_RLAST : IN STD_LOGIC;
        m_axi_mem_V_RID : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_mem_V_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_mem_V_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        m_axi_mem_V_BVALID : IN STD_LOGIC;
        m_axi_mem_V_BREADY : OUT STD_LOGIC;
        m_axi_mem_V_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
        m_axi_mem_V_BID : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axi_mem_V_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        mem_V_offset : IN STD_LOGIC_VECTOR (57 downto 0);
        ap_return_0 : OUT STD_LOGIC_VECTOR (9 downto 0);
        ap_return_1 : OUT STD_LOGIC_VECTOR (63 downto 0);
        ap_return_2 : OUT STD_LOGIC_VECTOR (63 downto 0) );
    end component;


    component action_map_read_eibs IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (8 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (63 downto 0);
        q0 : OUT STD_LOGIC_VECTOR (63 downto 0) );
    end component;


    component action_map_read_ejbC IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (8 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (63 downto 0) );
    end component;



begin
    read_extmap_extents_1_U : component action_map_read_eibs
    generic map (
        DataWidth => 64,
        AddressRange => 512,
        AddressWidth => 9)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => grp_mtl_extmap_load_fu_117_map_extents_begin_V_address0,
        ce0 => read_extmap_extents_1_ce0,
        we0 => read_extmap_extents_1_we0,
        d0 => grp_mtl_extmap_load_fu_117_map_extents_begin_V_d0,
        q0 => read_extmap_extents_1_q0);

    read_extmap_extents_2_U : component action_map_read_ejbC
    generic map (
        DataWidth => 64,
        AddressRange => 512,
        AddressWidth => 9)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => grp_mtl_extmap_load_fu_117_map_extents_count_V_address0,
        ce0 => read_extmap_extents_2_ce0,
        we0 => read_extmap_extents_2_we0,
        d0 => grp_mtl_extmap_load_fu_117_map_extents_count_V_d0);

    read_extmap_extents_s_U : component action_map_read_ejbC
    generic map (
        DataWidth => 64,
        AddressRange => 512,
        AddressWidth => 9)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => grp_mtl_extmap_load_fu_117_map_extents_nextlblo_address0,
        ce0 => read_extmap_extents_s_ce0,
        we0 => read_extmap_extents_s_we0,
        d0 => grp_mtl_extmap_load_fu_117_map_extents_nextlblo_d0);

    write_extmap_extents_1_U : component action_map_read_eibs
    generic map (
        DataWidth => 64,
        AddressRange => 512,
        AddressWidth => 9)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => grp_mtl_extmap_load_fu_117_map_extents_begin_V_address0,
        ce0 => write_extmap_extents_1_ce0,
        we0 => write_extmap_extents_1_we0,
        d0 => grp_mtl_extmap_load_fu_117_map_extents_begin_V_d0,
        q0 => write_extmap_extents_1_q0);

    write_extmap_extents_2_U : component action_map_read_ejbC
    generic map (
        DataWidth => 64,
        AddressRange => 512,
        AddressWidth => 9)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => grp_mtl_extmap_load_fu_117_map_extents_count_V_address0,
        ce0 => write_extmap_extents_2_ce0,
        we0 => write_extmap_extents_2_we0,
        d0 => grp_mtl_extmap_load_fu_117_map_extents_count_V_d0);

    write_extmap_extents_U : component action_map_read_ejbC
    generic map (
        DataWidth => 64,
        AddressRange => 512,
        AddressWidth => 9)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => grp_mtl_extmap_load_fu_117_map_extents_nextlblo_address0,
        ce0 => write_extmap_extents_ce0,
        we0 => write_extmap_extents_we0,
        d0 => grp_mtl_extmap_load_fu_117_map_extents_nextlblo_d0);

    grp_mtl_extmap_load_fu_117 : component mtl_extmap_load
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_mtl_extmap_load_fu_117_ap_start,
        ap_done => grp_mtl_extmap_load_fu_117_ap_done,
        ap_idle => grp_mtl_extmap_load_fu_117_ap_idle,
        ap_ready => grp_mtl_extmap_load_fu_117_ap_ready,
        map_extents_begin_V_address0 => grp_mtl_extmap_load_fu_117_map_extents_begin_V_address0,
        map_extents_begin_V_ce0 => grp_mtl_extmap_load_fu_117_map_extents_begin_V_ce0,
        map_extents_begin_V_we0 => grp_mtl_extmap_load_fu_117_map_extents_begin_V_we0,
        map_extents_begin_V_d0 => grp_mtl_extmap_load_fu_117_map_extents_begin_V_d0,
        map_extents_begin_V_q0 => grp_mtl_extmap_load_fu_117_map_extents_begin_V_q0,
        map_extents_count_V_address0 => grp_mtl_extmap_load_fu_117_map_extents_count_V_address0,
        map_extents_count_V_ce0 => grp_mtl_extmap_load_fu_117_map_extents_count_V_ce0,
        map_extents_count_V_we0 => grp_mtl_extmap_load_fu_117_map_extents_count_V_we0,
        map_extents_count_V_d0 => grp_mtl_extmap_load_fu_117_map_extents_count_V_d0,
        map_extents_nextlblo_address0 => grp_mtl_extmap_load_fu_117_map_extents_nextlblo_address0,
        map_extents_nextlblo_ce0 => grp_mtl_extmap_load_fu_117_map_extents_nextlblo_ce0,
        map_extents_nextlblo_we0 => grp_mtl_extmap_load_fu_117_map_extents_nextlblo_we0,
        map_extents_nextlblo_d0 => grp_mtl_extmap_load_fu_117_map_extents_nextlblo_d0,
        map_extent_count_V_w => job_extent_count_V_r,
        extent_address_V => job_extent_address_V,
        m_axi_mem_V_AWVALID => grp_mtl_extmap_load_fu_117_m_axi_mem_V_AWVALID,
        m_axi_mem_V_AWREADY => ap_const_logic_0,
        m_axi_mem_V_AWADDR => grp_mtl_extmap_load_fu_117_m_axi_mem_V_AWADDR,
        m_axi_mem_V_AWID => grp_mtl_extmap_load_fu_117_m_axi_mem_V_AWID,
        m_axi_mem_V_AWLEN => grp_mtl_extmap_load_fu_117_m_axi_mem_V_AWLEN,
        m_axi_mem_V_AWSIZE => grp_mtl_extmap_load_fu_117_m_axi_mem_V_AWSIZE,
        m_axi_mem_V_AWBURST => grp_mtl_extmap_load_fu_117_m_axi_mem_V_AWBURST,
        m_axi_mem_V_AWLOCK => grp_mtl_extmap_load_fu_117_m_axi_mem_V_AWLOCK,
        m_axi_mem_V_AWCACHE => grp_mtl_extmap_load_fu_117_m_axi_mem_V_AWCACHE,
        m_axi_mem_V_AWPROT => grp_mtl_extmap_load_fu_117_m_axi_mem_V_AWPROT,
        m_axi_mem_V_AWQOS => grp_mtl_extmap_load_fu_117_m_axi_mem_V_AWQOS,
        m_axi_mem_V_AWREGION => grp_mtl_extmap_load_fu_117_m_axi_mem_V_AWREGION,
        m_axi_mem_V_AWUSER => grp_mtl_extmap_load_fu_117_m_axi_mem_V_AWUSER,
        m_axi_mem_V_WVALID => grp_mtl_extmap_load_fu_117_m_axi_mem_V_WVALID,
        m_axi_mem_V_WREADY => ap_const_logic_0,
        m_axi_mem_V_WDATA => grp_mtl_extmap_load_fu_117_m_axi_mem_V_WDATA,
        m_axi_mem_V_WSTRB => grp_mtl_extmap_load_fu_117_m_axi_mem_V_WSTRB,
        m_axi_mem_V_WLAST => grp_mtl_extmap_load_fu_117_m_axi_mem_V_WLAST,
        m_axi_mem_V_WID => grp_mtl_extmap_load_fu_117_m_axi_mem_V_WID,
        m_axi_mem_V_WUSER => grp_mtl_extmap_load_fu_117_m_axi_mem_V_WUSER,
        m_axi_mem_V_ARVALID => grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARVALID,
        m_axi_mem_V_ARREADY => m_axi_mem_in_V_ARREADY,
        m_axi_mem_V_ARADDR => grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARADDR,
        m_axi_mem_V_ARID => grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARID,
        m_axi_mem_V_ARLEN => grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARLEN,
        m_axi_mem_V_ARSIZE => grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARSIZE,
        m_axi_mem_V_ARBURST => grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARBURST,
        m_axi_mem_V_ARLOCK => grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARLOCK,
        m_axi_mem_V_ARCACHE => grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARCACHE,
        m_axi_mem_V_ARPROT => grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARPROT,
        m_axi_mem_V_ARQOS => grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARQOS,
        m_axi_mem_V_ARREGION => grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARREGION,
        m_axi_mem_V_ARUSER => grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARUSER,
        m_axi_mem_V_RVALID => m_axi_mem_in_V_RVALID,
        m_axi_mem_V_RREADY => grp_mtl_extmap_load_fu_117_m_axi_mem_V_RREADY,
        m_axi_mem_V_RDATA => m_axi_mem_in_V_RDATA,
        m_axi_mem_V_RLAST => m_axi_mem_in_V_RLAST,
        m_axi_mem_V_RID => m_axi_mem_in_V_RID,
        m_axi_mem_V_RUSER => m_axi_mem_in_V_RUSER,
        m_axi_mem_V_RRESP => m_axi_mem_in_V_RRESP,
        m_axi_mem_V_BVALID => ap_const_logic_0,
        m_axi_mem_V_BREADY => grp_mtl_extmap_load_fu_117_m_axi_mem_V_BREADY,
        m_axi_mem_V_BRESP => ap_const_lv2_0,
        m_axi_mem_V_BID => ap_const_lv1_0,
        m_axi_mem_V_BUSER => ap_const_lv1_0,
        mem_V_offset => mem_in_V_offset,
        ap_return_0 => grp_mtl_extmap_load_fu_117_ap_return_0,
        ap_return_1 => grp_mtl_extmap_load_fu_117_ap_return_1,
        ap_return_2 => grp_mtl_extmap_load_fu_117_ap_return_2);





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
                ap_return_preg(1) <= '0';
                ap_return_preg(2) <= '0';
                ap_return_preg(8) <= '0';
            else
                if (((ap_const_boolean_0 = ap_block_state2_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                                        ap_return_preg(2 downto 1) <= ap_phi_mux_agg_result_V_phi_fu_106_p6(2 downto 1);                    ap_return_preg(8) <= ap_phi_mux_agg_result_V_phi_fu_106_p6(8);
                end if; 
            end if;
        end if;
    end process;


    grp_mtl_extmap_load_fu_117_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_mtl_extmap_load_fu_117_ap_start_reg <= ap_const_logic_0;
            else
                if ((((ap_start = ap_const_logic_1) and (job_slot_V_read = ap_const_lv64_0) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1) and (job_slot_V_read = ap_const_lv64_1)))) then 
                    grp_mtl_extmap_load_fu_117_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_mtl_extmap_load_fu_117_ap_ready = ap_const_logic_1)) then 
                    grp_mtl_extmap_load_fu_117_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    agg_result_V_reg_102_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not((job_slot_V_read = ap_const_lv64_0)) and not((job_slot_V_read = ap_const_lv64_1)) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                agg_result_V_reg_102(1) <= '0';
                agg_result_V_reg_102(2) <= '1';
            elsif ((((job_slot_V_read = ap_const_lv64_0) and (ap_const_boolean_0 = ap_block_state2_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state2)) or ((ap_const_boolean_0 = ap_block_state2_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state2) and (job_slot_V_read = ap_const_lv64_1)))) then 
                agg_result_V_reg_102(1) <= '1';
                agg_result_V_reg_102(2) <= '0';
            end if; 
        end if;
    end process;
    agg_result_V_reg_102(0) <= '0';
    agg_result_V_reg_102(8 downto 3) <= "100000";
    ap_return_preg(0) <= '0';
    ap_return_preg(7 downto 3) <= "00000";

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_state2, ap_block_state2_on_subcall_done)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_boolean_0 = ap_block_state2_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);

    ap_block_state2_on_subcall_done_assign_proc : process(job_slot_V_read, grp_mtl_extmap_load_fu_117_ap_done)
    begin
                ap_block_state2_on_subcall_done <= (((job_slot_V_read = ap_const_lv64_0) and (grp_mtl_extmap_load_fu_117_ap_done = ap_const_logic_0)) or ((grp_mtl_extmap_load_fu_117_ap_done = ap_const_logic_0) and (job_slot_V_read = ap_const_lv64_1)));
    end process;


    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state2, ap_block_state2_on_subcall_done)
    begin
        if ((((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((ap_const_boolean_0 = ap_block_state2_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
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


    ap_phi_mux_agg_result_V_phi_fu_106_p6_assign_proc : process(job_slot_V_read, agg_result_V_reg_102, ap_CS_fsm_state2)
    begin
        if ((((job_slot_V_read = ap_const_lv64_0) and (ap_const_logic_1 = ap_CS_fsm_state2)) or ((ap_const_logic_1 = ap_CS_fsm_state2) and (job_slot_V_read = ap_const_lv64_1)))) then 
            ap_phi_mux_agg_result_V_phi_fu_106_p6 <= ap_const_lv9_102;
        else 
            ap_phi_mux_agg_result_V_phi_fu_106_p6 <= agg_result_V_reg_102;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state2, ap_block_state2_on_subcall_done)
    begin
        if (((ap_const_boolean_0 = ap_block_state2_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_return_assign_proc : process(ap_phi_mux_agg_result_V_phi_fu_106_p6, ap_CS_fsm_state2, ap_block_state2_on_subcall_done, ap_return_preg)
    begin
        if (((ap_const_boolean_0 = ap_block_state2_on_subcall_done) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_return <= ap_phi_mux_agg_result_V_phi_fu_106_p6;
        else 
            ap_return <= ap_return_preg;
        end if; 
    end process;

    grp_mtl_extmap_load_fu_117_ap_start <= grp_mtl_extmap_load_fu_117_ap_start_reg;

    grp_mtl_extmap_load_fu_117_map_extents_begin_V_q0_assign_proc : process(job_slot_V_read, read_extmap_extents_1_q0, write_extmap_extents_1_q0, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
            if ((job_slot_V_read = ap_const_lv64_0)) then 
                grp_mtl_extmap_load_fu_117_map_extents_begin_V_q0 <= read_extmap_extents_1_q0;
            elsif ((job_slot_V_read = ap_const_lv64_1)) then 
                grp_mtl_extmap_load_fu_117_map_extents_begin_V_q0 <= write_extmap_extents_1_q0;
            else 
                grp_mtl_extmap_load_fu_117_map_extents_begin_V_q0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            end if;
        else 
            grp_mtl_extmap_load_fu_117_map_extents_begin_V_q0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    m_axi_mem_in_V_ARADDR <= grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARADDR;
    m_axi_mem_in_V_ARBURST <= grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARBURST;
    m_axi_mem_in_V_ARCACHE <= grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARCACHE;
    m_axi_mem_in_V_ARID <= grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARID;
    m_axi_mem_in_V_ARLEN <= grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARLEN;
    m_axi_mem_in_V_ARLOCK <= grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARLOCK;
    m_axi_mem_in_V_ARPROT <= grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARPROT;
    m_axi_mem_in_V_ARQOS <= grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARQOS;
    m_axi_mem_in_V_ARREGION <= grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARREGION;
    m_axi_mem_in_V_ARSIZE <= grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARSIZE;
    m_axi_mem_in_V_ARUSER <= grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARUSER;

    m_axi_mem_in_V_ARVALID_assign_proc : process(ap_CS_fsm_state1, job_slot_V_read, grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARVALID, ap_CS_fsm_state2)
    begin
        if ((((job_slot_V_read = ap_const_lv64_0) and (ap_const_logic_1 = ap_CS_fsm_state2)) or ((ap_const_logic_1 = ap_CS_fsm_state2) and (job_slot_V_read = ap_const_lv64_1)) or ((job_slot_V_read = ap_const_lv64_0) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((ap_const_logic_1 = ap_CS_fsm_state1) and (job_slot_V_read = ap_const_lv64_1)))) then 
            m_axi_mem_in_V_ARVALID <= grp_mtl_extmap_load_fu_117_m_axi_mem_V_ARVALID;
        else 
            m_axi_mem_in_V_ARVALID <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_mem_in_V_AWADDR <= ap_const_lv64_0;
    m_axi_mem_in_V_AWBURST <= ap_const_lv2_0;
    m_axi_mem_in_V_AWCACHE <= ap_const_lv4_0;
    m_axi_mem_in_V_AWID <= ap_const_lv1_0;
    m_axi_mem_in_V_AWLEN <= ap_const_lv32_0;
    m_axi_mem_in_V_AWLOCK <= ap_const_lv2_0;
    m_axi_mem_in_V_AWPROT <= ap_const_lv3_0;
    m_axi_mem_in_V_AWQOS <= ap_const_lv4_0;
    m_axi_mem_in_V_AWREGION <= ap_const_lv4_0;
    m_axi_mem_in_V_AWSIZE <= ap_const_lv3_0;
    m_axi_mem_in_V_AWUSER <= ap_const_lv1_0;
    m_axi_mem_in_V_AWVALID <= ap_const_logic_0;
    m_axi_mem_in_V_BREADY <= ap_const_logic_0;

    m_axi_mem_in_V_RREADY_assign_proc : process(ap_CS_fsm_state1, job_slot_V_read, grp_mtl_extmap_load_fu_117_m_axi_mem_V_RREADY, ap_CS_fsm_state2)
    begin
        if ((((job_slot_V_read = ap_const_lv64_0) and (ap_const_logic_1 = ap_CS_fsm_state2)) or ((ap_const_logic_1 = ap_CS_fsm_state2) and (job_slot_V_read = ap_const_lv64_1)) or ((job_slot_V_read = ap_const_lv64_0) and (ap_const_logic_1 = ap_CS_fsm_state1)) or ((ap_const_logic_1 = ap_CS_fsm_state1) and (job_slot_V_read = ap_const_lv64_1)))) then 
            m_axi_mem_in_V_RREADY <= grp_mtl_extmap_load_fu_117_m_axi_mem_V_RREADY;
        else 
            m_axi_mem_in_V_RREADY <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_mem_in_V_WDATA <= ap_const_lv512_lc_1;
    m_axi_mem_in_V_WID <= ap_const_lv1_0;
    m_axi_mem_in_V_WLAST <= ap_const_logic_0;
    m_axi_mem_in_V_WSTRB <= ap_const_lv64_0;
    m_axi_mem_in_V_WUSER <= ap_const_lv1_0;
    m_axi_mem_in_V_WVALID <= ap_const_logic_0;

    read_extmap_extents_1_ce0_assign_proc : process(job_slot_V_read, grp_mtl_extmap_load_fu_117_map_extents_begin_V_ce0, ap_CS_fsm_state2)
    begin
        if (((job_slot_V_read = ap_const_lv64_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            read_extmap_extents_1_ce0 <= grp_mtl_extmap_load_fu_117_map_extents_begin_V_ce0;
        else 
            read_extmap_extents_1_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    read_extmap_extents_1_we0_assign_proc : process(job_slot_V_read, grp_mtl_extmap_load_fu_117_map_extents_begin_V_we0, ap_CS_fsm_state2)
    begin
        if (((job_slot_V_read = ap_const_lv64_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            read_extmap_extents_1_we0 <= grp_mtl_extmap_load_fu_117_map_extents_begin_V_we0;
        else 
            read_extmap_extents_1_we0 <= ap_const_logic_0;
        end if; 
    end process;


    read_extmap_extents_2_ce0_assign_proc : process(job_slot_V_read, grp_mtl_extmap_load_fu_117_map_extents_count_V_ce0, ap_CS_fsm_state2)
    begin
        if (((job_slot_V_read = ap_const_lv64_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            read_extmap_extents_2_ce0 <= grp_mtl_extmap_load_fu_117_map_extents_count_V_ce0;
        else 
            read_extmap_extents_2_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    read_extmap_extents_2_we0_assign_proc : process(job_slot_V_read, grp_mtl_extmap_load_fu_117_map_extents_count_V_we0, ap_CS_fsm_state2)
    begin
        if (((job_slot_V_read = ap_const_lv64_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            read_extmap_extents_2_we0 <= grp_mtl_extmap_load_fu_117_map_extents_count_V_we0;
        else 
            read_extmap_extents_2_we0 <= ap_const_logic_0;
        end if; 
    end process;


    read_extmap_extents_s_ce0_assign_proc : process(job_slot_V_read, grp_mtl_extmap_load_fu_117_map_extents_nextlblo_ce0, ap_CS_fsm_state2)
    begin
        if (((job_slot_V_read = ap_const_lv64_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            read_extmap_extents_s_ce0 <= grp_mtl_extmap_load_fu_117_map_extents_nextlblo_ce0;
        else 
            read_extmap_extents_s_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    read_extmap_extents_s_we0_assign_proc : process(job_slot_V_read, grp_mtl_extmap_load_fu_117_map_extents_nextlblo_we0, ap_CS_fsm_state2)
    begin
        if (((job_slot_V_read = ap_const_lv64_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            read_extmap_extents_s_we0 <= grp_mtl_extmap_load_fu_117_map_extents_nextlblo_we0;
        else 
            read_extmap_extents_s_we0 <= ap_const_logic_0;
        end if; 
    end process;


    write_extmap_extents_1_ce0_assign_proc : process(job_slot_V_read, grp_mtl_extmap_load_fu_117_map_extents_begin_V_ce0, ap_CS_fsm_state2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (job_slot_V_read = ap_const_lv64_1))) then 
            write_extmap_extents_1_ce0 <= grp_mtl_extmap_load_fu_117_map_extents_begin_V_ce0;
        else 
            write_extmap_extents_1_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    write_extmap_extents_1_we0_assign_proc : process(job_slot_V_read, grp_mtl_extmap_load_fu_117_map_extents_begin_V_we0, ap_CS_fsm_state2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (job_slot_V_read = ap_const_lv64_1))) then 
            write_extmap_extents_1_we0 <= grp_mtl_extmap_load_fu_117_map_extents_begin_V_we0;
        else 
            write_extmap_extents_1_we0 <= ap_const_logic_0;
        end if; 
    end process;


    write_extmap_extents_2_ce0_assign_proc : process(job_slot_V_read, grp_mtl_extmap_load_fu_117_map_extents_count_V_ce0, ap_CS_fsm_state2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (job_slot_V_read = ap_const_lv64_1))) then 
            write_extmap_extents_2_ce0 <= grp_mtl_extmap_load_fu_117_map_extents_count_V_ce0;
        else 
            write_extmap_extents_2_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    write_extmap_extents_2_we0_assign_proc : process(job_slot_V_read, grp_mtl_extmap_load_fu_117_map_extents_count_V_we0, ap_CS_fsm_state2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (job_slot_V_read = ap_const_lv64_1))) then 
            write_extmap_extents_2_we0 <= grp_mtl_extmap_load_fu_117_map_extents_count_V_we0;
        else 
            write_extmap_extents_2_we0 <= ap_const_logic_0;
        end if; 
    end process;


    write_extmap_extents_ce0_assign_proc : process(job_slot_V_read, grp_mtl_extmap_load_fu_117_map_extents_nextlblo_ce0, ap_CS_fsm_state2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (job_slot_V_read = ap_const_lv64_1))) then 
            write_extmap_extents_ce0 <= grp_mtl_extmap_load_fu_117_map_extents_nextlblo_ce0;
        else 
            write_extmap_extents_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    write_extmap_extents_we0_assign_proc : process(job_slot_V_read, grp_mtl_extmap_load_fu_117_map_extents_nextlblo_we0, ap_CS_fsm_state2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (job_slot_V_read = ap_const_lv64_1))) then 
            write_extmap_extents_we0 <= grp_mtl_extmap_load_fu_117_map_extents_nextlblo_we0;
        else 
            write_extmap_extents_we0 <= ap_const_logic_0;
        end if; 
    end process;

end behav;
