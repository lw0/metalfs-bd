
################################################################
# This is a generated script based on design: action_wrapper
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2018.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source action_wrapper_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# hls_action

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcku060-ffva1156-2-e
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name action_wrapper

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:ip:axi_perf_mon:5.0\
xilinx.com:ip:axi_protocol_converter:2.1\
xilinx.com:ip:axis_switch:1.1\
"

   set list_ips_missing ""
   common::send_msg_id "BD_TCL-006" "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_msg_id "BD_TCL-115" "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

##################################################################
# CHECK Modules
##################################################################
set bCheckModules 1
if { $bCheckModules == 1 } {
   set list_check_mods "\ 
hls_action\
"

   set list_mods_missing ""
   common::send_msg_id "BD_TCL-006" "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_msg_id "BD_TCL-115" "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_msg_id "BD_TCL-008" "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

if { $bCheckIPsPassed != 1 } {
  common::send_msg_id "BD_TCL-1003" "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set m_axi_host_mem [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_host_mem ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {64} \
   CONFIG.DATA_WIDTH {512} \
   CONFIG.NUM_READ_OUTSTANDING {2} \
   CONFIG.NUM_WRITE_OUTSTANDING {2} \
   CONFIG.PROTOCOL {AXI4} \
   ] $m_axi_host_mem
  set s_axi_ctrl_reg [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 s_axi_ctrl_reg ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {9} \
   CONFIG.ARUSER_WIDTH {0} \
   CONFIG.AWUSER_WIDTH {0} \
   CONFIG.BUSER_WIDTH {0} \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.HAS_BRESP {1} \
   CONFIG.HAS_BURST {0} \
   CONFIG.HAS_CACHE {0} \
   CONFIG.HAS_LOCK {0} \
   CONFIG.HAS_PROT {0} \
   CONFIG.HAS_QOS {0} \
   CONFIG.HAS_REGION {0} \
   CONFIG.HAS_RRESP {1} \
   CONFIG.HAS_WSTRB {1} \
   CONFIG.ID_WIDTH {0} \
   CONFIG.MAX_BURST_LENGTH {1} \
   CONFIG.NUM_READ_OUTSTANDING {1} \
   CONFIG.NUM_READ_THREADS {1} \
   CONFIG.NUM_WRITE_OUTSTANDING {1} \
   CONFIG.NUM_WRITE_THREADS {1} \
   CONFIG.PROTOCOL {AXI4LITE} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   CONFIG.RUSER_BITS_PER_BYTE {0} \
   CONFIG.RUSER_WIDTH {0} \
   CONFIG.SUPPORTS_NARROW_BURST {0} \
   CONFIG.WUSER_BITS_PER_BYTE {0} \
   CONFIG.WUSER_WIDTH {0} \
   ] $s_axi_ctrl_reg

  # Create ports
  set ap_clk [ create_bd_port -dir I -type clk ap_clk ]
  set ap_rst_n [ create_bd_port -dir I -type rst ap_rst_n ]
  set interrupt [ create_bd_port -dir O -type intr interrupt ]

  # Create instance: axi_perf_mon_0, and set properties
  set axi_perf_mon_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_perf_mon:5.0 axi_perf_mon_0 ]
  set_property -dict [ list \
   CONFIG.C_NUM_MONITOR_SLOTS {8} \
   CONFIG.C_NUM_OF_COUNTERS {10} \
   CONFIG.C_SLOT_0_AXI_PROTOCOL {AXI4S} \
   CONFIG.C_SLOT_1_AXI_PROTOCOL {AXI4S} \
   CONFIG.C_SLOT_2_AXI_PROTOCOL {AXI4S} \
   CONFIG.C_SLOT_3_AXI_PROTOCOL {AXI4S} \
   CONFIG.C_SLOT_4_AXI_PROTOCOL {AXI4S} \
   CONFIG.C_SLOT_5_AXI_PROTOCOL {AXI4S} \
   CONFIG.C_SLOT_6_AXI_PROTOCOL {AXI4S} \
   CONFIG.C_SLOT_7_AXI_PROTOCOL {AXI4S} \
 ] $axi_perf_mon_0

  # Create instance: axi_protocol_convert_0, and set properties
  set axi_protocol_convert_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_protocol_converter:2.1 axi_protocol_convert_0 ]

  # Create instance: axi_protocol_convert_1, and set properties
  set axi_protocol_convert_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_protocol_converter:2.1 axi_protocol_convert_1 ]

  # Create instance: axis_switch_0, and set properties
  set axis_switch_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_switch:1.1 axis_switch_0 ]
  set_property -dict [ list \
   CONFIG.DECODER_REG {1} \
   CONFIG.HAS_TLAST {1} \
   CONFIG.HAS_TREADY {1} \
   CONFIG.HAS_TSTRB {1} \
   CONFIG.NUM_MI {8} \
   CONFIG.NUM_SI {8} \
   CONFIG.ROUTING_MODE {1} \
   CONFIG.TDATA_NUM_BYTES {8} \
   CONFIG.TDEST_WIDTH {0} \
   CONFIG.TID_WIDTH {0} \
   CONFIG.TUSER_WIDTH {0} \
 ] $axis_switch_0

  # Create instance: hls_action_0, and set properties
  set block_name hls_action
  set block_cell_name hls_action_0
  if { [catch {set hls_action_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $hls_action_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.SUPPORTS_NARROW_BURST {1} \
   CONFIG.NUM_READ_OUTSTANDING {2} \
   CONFIG.NUM_WRITE_OUTSTANDING {2} \
   CONFIG.MAX_BURST_LENGTH {256} \
 ] [get_bd_intf_pins /hls_action_0/m_axi_host_mem]

  set_property -dict [ list \
   CONFIG.SUPPORTS_NARROW_BURST {1} \
   CONFIG.NUM_READ_OUTSTANDING {2} \
   CONFIG.NUM_WRITE_OUTSTANDING {2} \
   CONFIG.MAX_BURST_LENGTH {256} \
 ] [get_bd_intf_pins /hls_action_0/m_axi_perfmon_ctrl_reg]

  set_property -dict [ list \
   CONFIG.SUPPORTS_NARROW_BURST {1} \
   CONFIG.NUM_READ_OUTSTANDING {2} \
   CONFIG.NUM_WRITE_OUTSTANDING {2} \
   CONFIG.MAX_BURST_LENGTH {256} \
 ] [get_bd_intf_pins /hls_action_0/m_axi_switch_ctrl_reg]

  set_property -dict [ list \
   CONFIG.NUM_READ_OUTSTANDING {1} \
   CONFIG.NUM_WRITE_OUTSTANDING {1} \
 ] [get_bd_intf_pins /hls_action_0/s_axi_ctrl_reg]

  # Create interface connections
  connect_bd_intf_net -intf_net axi_protocol_convert_0_M_AXI [get_bd_intf_pins axi_protocol_convert_0/M_AXI] [get_bd_intf_pins axis_switch_0/S_AXI_CTRL]
  connect_bd_intf_net -intf_net axi_protocol_convert_1_M_AXI [get_bd_intf_pins axi_perf_mon_0/S_AXI] [get_bd_intf_pins axi_protocol_convert_1/M_AXI]
  connect_bd_intf_net -intf_net axis_switch_0_M00_AXIS [get_bd_intf_pins axis_switch_0/M00_AXIS] [get_bd_intf_pins hls_action_0/axis_s_0]
connect_bd_intf_net -intf_net [get_bd_intf_nets axis_switch_0_M00_AXIS] [get_bd_intf_pins axi_perf_mon_0/SLOT_0_AXIS] [get_bd_intf_pins axis_switch_0/M00_AXIS]
  connect_bd_intf_net -intf_net axis_switch_0_M01_AXIS [get_bd_intf_pins axis_switch_0/M01_AXIS] [get_bd_intf_pins hls_action_0/axis_s_1]
connect_bd_intf_net -intf_net [get_bd_intf_nets axis_switch_0_M01_AXIS] [get_bd_intf_pins axi_perf_mon_0/SLOT_1_AXIS] [get_bd_intf_pins axis_switch_0/M01_AXIS]
  connect_bd_intf_net -intf_net axis_switch_0_M02_AXIS [get_bd_intf_pins axis_switch_0/M02_AXIS] [get_bd_intf_pins hls_action_0/axis_s_2]
connect_bd_intf_net -intf_net [get_bd_intf_nets axis_switch_0_M02_AXIS] [get_bd_intf_pins axi_perf_mon_0/SLOT_2_AXIS] [get_bd_intf_pins axis_switch_0/M02_AXIS]
  connect_bd_intf_net -intf_net axis_switch_0_M03_AXIS [get_bd_intf_pins axis_switch_0/M03_AXIS] [get_bd_intf_pins hls_action_0/axis_s_3]
connect_bd_intf_net -intf_net [get_bd_intf_nets axis_switch_0_M03_AXIS] [get_bd_intf_pins axi_perf_mon_0/SLOT_3_AXIS] [get_bd_intf_pins axis_switch_0/M03_AXIS]
  connect_bd_intf_net -intf_net axis_switch_0_M04_AXIS [get_bd_intf_pins axis_switch_0/M04_AXIS] [get_bd_intf_pins hls_action_0/axis_s_4]
connect_bd_intf_net -intf_net [get_bd_intf_nets axis_switch_0_M04_AXIS] [get_bd_intf_pins axi_perf_mon_0/SLOT_4_AXIS] [get_bd_intf_pins axis_switch_0/M04_AXIS]
  connect_bd_intf_net -intf_net axis_switch_0_M05_AXIS [get_bd_intf_pins axis_switch_0/M05_AXIS] [get_bd_intf_pins hls_action_0/axis_s_5]
connect_bd_intf_net -intf_net [get_bd_intf_nets axis_switch_0_M05_AXIS] [get_bd_intf_pins axi_perf_mon_0/SLOT_5_AXIS] [get_bd_intf_pins axis_switch_0/M05_AXIS]
  connect_bd_intf_net -intf_net axis_switch_0_M06_AXIS [get_bd_intf_pins axis_switch_0/M06_AXIS] [get_bd_intf_pins hls_action_0/axis_s_6]
connect_bd_intf_net -intf_net [get_bd_intf_nets axis_switch_0_M06_AXIS] [get_bd_intf_pins axi_perf_mon_0/SLOT_6_AXIS] [get_bd_intf_pins axis_switch_0/M06_AXIS]
  connect_bd_intf_net -intf_net axis_switch_0_M07_AXIS [get_bd_intf_pins axis_switch_0/M07_AXIS] [get_bd_intf_pins hls_action_0/axis_s_7]
connect_bd_intf_net -intf_net [get_bd_intf_nets axis_switch_0_M07_AXIS] [get_bd_intf_pins axi_perf_mon_0/SLOT_7_AXIS] [get_bd_intf_pins axis_switch_0/M07_AXIS]
  connect_bd_intf_net -intf_net hls_action_0_axis_m_0 [get_bd_intf_pins axis_switch_0/S00_AXIS] [get_bd_intf_pins hls_action_0/axis_m_0]
  connect_bd_intf_net -intf_net hls_action_0_axis_m_1 [get_bd_intf_pins axis_switch_0/S01_AXIS] [get_bd_intf_pins hls_action_0/axis_m_1]
  connect_bd_intf_net -intf_net hls_action_0_axis_m_2 [get_bd_intf_pins axis_switch_0/S02_AXIS] [get_bd_intf_pins hls_action_0/axis_m_2]
  connect_bd_intf_net -intf_net hls_action_0_axis_m_3 [get_bd_intf_pins axis_switch_0/S03_AXIS] [get_bd_intf_pins hls_action_0/axis_m_3]
  connect_bd_intf_net -intf_net hls_action_0_axis_m_4 [get_bd_intf_pins axis_switch_0/S04_AXIS] [get_bd_intf_pins hls_action_0/axis_m_4]
  connect_bd_intf_net -intf_net hls_action_0_axis_m_5 [get_bd_intf_pins axis_switch_0/S05_AXIS] [get_bd_intf_pins hls_action_0/axis_m_5]
  connect_bd_intf_net -intf_net hls_action_0_axis_m_6 [get_bd_intf_pins axis_switch_0/S06_AXIS] [get_bd_intf_pins hls_action_0/axis_m_6]
  connect_bd_intf_net -intf_net hls_action_0_axis_m_7 [get_bd_intf_pins axis_switch_0/S07_AXIS] [get_bd_intf_pins hls_action_0/axis_m_7]
  connect_bd_intf_net -intf_net hls_action_0_m_axi_host_mem [get_bd_intf_ports m_axi_host_mem] [get_bd_intf_pins hls_action_0/m_axi_host_mem]
  connect_bd_intf_net -intf_net hls_action_0_m_axi_perfmon_ctrl_reg [get_bd_intf_pins axi_protocol_convert_1/S_AXI] [get_bd_intf_pins hls_action_0/m_axi_perfmon_ctrl_reg]
  connect_bd_intf_net -intf_net hls_action_0_m_axi_switch_ctrl_reg [get_bd_intf_pins axi_protocol_convert_0/S_AXI] [get_bd_intf_pins hls_action_0/m_axi_switch_ctrl_reg]
  connect_bd_intf_net -intf_net s_axi_ctrl_reg_0_1 [get_bd_intf_ports s_axi_ctrl_reg] [get_bd_intf_pins hls_action_0/s_axi_ctrl_reg]

  # Create port connections
  connect_bd_net -net ap_clk_0_1 [get_bd_ports ap_clk] [get_bd_pins axi_perf_mon_0/core_aclk] [get_bd_pins axi_perf_mon_0/s_axi_aclk] [get_bd_pins axi_perf_mon_0/slot_0_axis_aclk] [get_bd_pins axi_perf_mon_0/slot_1_axis_aclk] [get_bd_pins axi_perf_mon_0/slot_2_axis_aclk] [get_bd_pins axi_perf_mon_0/slot_3_axis_aclk] [get_bd_pins axi_perf_mon_0/slot_4_axis_aclk] [get_bd_pins axi_perf_mon_0/slot_5_axis_aclk] [get_bd_pins axi_perf_mon_0/slot_6_axis_aclk] [get_bd_pins axi_perf_mon_0/slot_7_axis_aclk] [get_bd_pins axi_protocol_convert_0/aclk] [get_bd_pins axi_protocol_convert_1/aclk] [get_bd_pins axis_switch_0/aclk] [get_bd_pins axis_switch_0/s_axi_ctrl_aclk] [get_bd_pins hls_action_0/ap_clk]
  connect_bd_net -net ap_rst_n_0_1 [get_bd_ports ap_rst_n] [get_bd_pins axi_perf_mon_0/core_aresetn] [get_bd_pins axi_perf_mon_0/s_axi_aresetn] [get_bd_pins axi_perf_mon_0/slot_0_axis_aresetn] [get_bd_pins axi_perf_mon_0/slot_1_axis_aresetn] [get_bd_pins axi_perf_mon_0/slot_2_axis_aresetn] [get_bd_pins axi_perf_mon_0/slot_3_axis_aresetn] [get_bd_pins axi_perf_mon_0/slot_4_axis_aresetn] [get_bd_pins axi_perf_mon_0/slot_5_axis_aresetn] [get_bd_pins axi_perf_mon_0/slot_6_axis_aresetn] [get_bd_pins axi_perf_mon_0/slot_7_axis_aresetn] [get_bd_pins axi_protocol_convert_0/aresetn] [get_bd_pins axi_protocol_convert_1/aresetn] [get_bd_pins axis_switch_0/aresetn] [get_bd_pins axis_switch_0/s_axi_ctrl_aresetn] [get_bd_pins hls_action_0/ap_rst_n]
  connect_bd_net -net hls_action_0_interrupt [get_bd_ports interrupt] [get_bd_pins hls_action_0/interrupt]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


common::send_msg_id "BD_TCL-1000" "WARNING" "This Tcl script was generated from a block design that has not been validated. It is possible that design <$design_name> may result in errors during validation."

