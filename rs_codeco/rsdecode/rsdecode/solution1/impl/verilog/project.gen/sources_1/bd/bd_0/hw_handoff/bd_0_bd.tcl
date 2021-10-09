
################################################################
# This is a generated script based on design: bd_0
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
set scripts_vivado_version 2020.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source bd_0_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcvu37p-fsvh2892-2L-e
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name bd_0

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
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

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

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
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
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set ap_ctrl [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:acc_handshake_rtl:1.0 ap_ctrl ]

  set recd_in [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 recd_in ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000.0} \
   CONFIG.HAS_TKEEP {0} \
   CONFIG.HAS_TLAST {0} \
   CONFIG.HAS_TREADY {1} \
   CONFIG.HAS_TSTRB {0} \
   CONFIG.LAYERED_METADATA {undef} \
   CONFIG.TDATA_NUM_BYTES {4} \
   CONFIG.TDEST_WIDTH {0} \
   CONFIG.TID_WIDTH {0} \
   CONFIG.TUSER_WIDTH {0} \
   ] $recd_in

  set recd_out [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 recd_out ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000.0} \
   ] $recd_out


  # Create ports
  set alpha_to_out_address0 [ create_bd_port -dir O -from 7 -to 0 -type data alpha_to_out_address0 ]
  set alpha_to_out_ce0 [ create_bd_port -dir O alpha_to_out_ce0 ]
  set alpha_to_out_d0 [ create_bd_port -dir O -from 31 -to 0 -type data alpha_to_out_d0 ]
  set alpha_to_out_we0 [ create_bd_port -dir O alpha_to_out_we0 ]
  set ap_clk [ create_bd_port -dir I -type clk -freq_hz 100000000.0 ap_clk ]
  set ap_rst_n [ create_bd_port -dir I -type rst ap_rst_n ]
  set gg_out_address0 [ create_bd_port -dir O -from 4 -to 0 -type data gg_out_address0 ]
  set gg_out_ce0 [ create_bd_port -dir O gg_out_ce0 ]
  set gg_out_d0 [ create_bd_port -dir O -from 31 -to 0 -type data gg_out_d0 ]
  set gg_out_we0 [ create_bd_port -dir O gg_out_we0 ]
  set index_of_out_address0 [ create_bd_port -dir O -from 7 -to 0 -type data index_of_out_address0 ]
  set index_of_out_ce0 [ create_bd_port -dir O index_of_out_ce0 ]
  set index_of_out_d0 [ create_bd_port -dir O -from 31 -to 0 -type data index_of_out_d0 ]
  set index_of_out_we0 [ create_bd_port -dir O index_of_out_we0 ]
  set recd_gf_out_address0 [ create_bd_port -dir O -from 7 -to 0 -type data recd_gf_out_address0 ]
  set recd_gf_out_ce0 [ create_bd_port -dir O recd_gf_out_ce0 ]
  set recd_gf_out_d0 [ create_bd_port -dir O -from 31 -to 0 -type data recd_gf_out_d0 ]
  set recd_gf_out_we0 [ create_bd_port -dir O recd_gf_out_we0 ]
  set syn_error_out [ create_bd_port -dir I -from 31 -to 0 -type data syn_error_out ]

  # Create instance: hls_inst, and set properties
  set hls_inst [ create_bd_cell -type ip -vlnv xilinx.com:hls:decode_rs:1.0 hls_inst ]

  # Create interface connections
  connect_bd_intf_net -intf_net ap_ctrl_0_1 [get_bd_intf_ports ap_ctrl] [get_bd_intf_pins hls_inst/ap_ctrl]
  connect_bd_intf_net -intf_net hls_inst_recd_out [get_bd_intf_ports recd_out] [get_bd_intf_pins hls_inst/recd_out]
  connect_bd_intf_net -intf_net recd_in_0_1 [get_bd_intf_ports recd_in] [get_bd_intf_pins hls_inst/recd_in]

  # Create port connections
  connect_bd_net -net ap_clk_0_1 [get_bd_ports ap_clk] [get_bd_pins hls_inst/ap_clk]
  connect_bd_net -net ap_rst_n_0_1 [get_bd_ports ap_rst_n] [get_bd_pins hls_inst/ap_rst_n]
  connect_bd_net -net hls_inst_alpha_to_out_address0 [get_bd_ports alpha_to_out_address0] [get_bd_pins hls_inst/alpha_to_out_address0]
  connect_bd_net -net hls_inst_alpha_to_out_ce0 [get_bd_ports alpha_to_out_ce0] [get_bd_pins hls_inst/alpha_to_out_ce0]
  connect_bd_net -net hls_inst_alpha_to_out_d0 [get_bd_ports alpha_to_out_d0] [get_bd_pins hls_inst/alpha_to_out_d0]
  connect_bd_net -net hls_inst_alpha_to_out_we0 [get_bd_ports alpha_to_out_we0] [get_bd_pins hls_inst/alpha_to_out_we0]
  connect_bd_net -net hls_inst_gg_out_address0 [get_bd_ports gg_out_address0] [get_bd_pins hls_inst/gg_out_address0]
  connect_bd_net -net hls_inst_gg_out_ce0 [get_bd_ports gg_out_ce0] [get_bd_pins hls_inst/gg_out_ce0]
  connect_bd_net -net hls_inst_gg_out_d0 [get_bd_ports gg_out_d0] [get_bd_pins hls_inst/gg_out_d0]
  connect_bd_net -net hls_inst_gg_out_we0 [get_bd_ports gg_out_we0] [get_bd_pins hls_inst/gg_out_we0]
  connect_bd_net -net hls_inst_index_of_out_address0 [get_bd_ports index_of_out_address0] [get_bd_pins hls_inst/index_of_out_address0]
  connect_bd_net -net hls_inst_index_of_out_ce0 [get_bd_ports index_of_out_ce0] [get_bd_pins hls_inst/index_of_out_ce0]
  connect_bd_net -net hls_inst_index_of_out_d0 [get_bd_ports index_of_out_d0] [get_bd_pins hls_inst/index_of_out_d0]
  connect_bd_net -net hls_inst_index_of_out_we0 [get_bd_ports index_of_out_we0] [get_bd_pins hls_inst/index_of_out_we0]
  connect_bd_net -net hls_inst_recd_gf_out_address0 [get_bd_ports recd_gf_out_address0] [get_bd_pins hls_inst/recd_gf_out_address0]
  connect_bd_net -net hls_inst_recd_gf_out_ce0 [get_bd_ports recd_gf_out_ce0] [get_bd_pins hls_inst/recd_gf_out_ce0]
  connect_bd_net -net hls_inst_recd_gf_out_d0 [get_bd_ports recd_gf_out_d0] [get_bd_pins hls_inst/recd_gf_out_d0]
  connect_bd_net -net hls_inst_recd_gf_out_we0 [get_bd_ports recd_gf_out_we0] [get_bd_pins hls_inst/recd_gf_out_we0]
  connect_bd_net -net syn_error_out_0_1 [get_bd_ports syn_error_out] [get_bd_pins hls_inst/syn_error_out]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


