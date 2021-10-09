# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "/home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.runs/synth_1/baseband_processor.tcl"
  variable category "vivado_synth"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
OPTRACE "synth_1" START { ROLLUP_AUTO }
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
OPTRACE "Creating in-memory project" START { }
create_project -in_memory -part xcvu37p-fsvh2892-2L-e

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.cache/wt [current_project]
set_property parent.project_path /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part xilinx.com:vcu128:part0:1.0 [current_project]
set_property ip_repo_paths {
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/apsk_mdem/apskmod
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.srcs/sources_1/ip/rscodeco/rsdecode
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.srcs/sources_1/ip/rscodeco/rscode
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/apsk_mdem/apskdemod
} [current_project]
update_ip_catalog
set_property ip_output_repo /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
read_verilog /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/parameters/bbp_parameter.vh
read_verilog -library xil_defaultlib -sv {
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/receive/bbp_receive.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/bbp_transmit.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.srcs/sources_1/new/channel_codes.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.srcs/sources_1/new/channel_decodes.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/receive/crc_detector.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/crc_generator.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/receive/data_transfer.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/datastream_transfer.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/receive/ddc.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/receive/deintrlv.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.srcs/sources_1/new/demodulation.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/receive/descrambler.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/duc.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.srcs/sources_1/new/energy_balance.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.srcs/sources_1/new/energy_debalance.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/receive/eqam.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/interleaver.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/receive/layer1_pull.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/layer1_push.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/receive/layer1_receive.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/layer1_transmit.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/mac_block.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/receive/mac_deblock.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.srcs/sources_1/new/modulation.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/qam.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/receive/radio_pull.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/radio_push.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/receive/radio_receive.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/radio_transmit.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.srcs/sources_1/new/rs_decoder_self.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.srcs/sources_1/new/rs_encoder_self.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/scrambler.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/receive/tpu_pullstream.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/tpu_pushstream.sv
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.srcs/sources_1/new/baseband_processor.sv
}
read_verilog -library xil_defaultlib {
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/crc24_calc_1bit.v
  /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/crc24_insert_1bit.v
}
read_ip -quiet /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.srcs/sources_1/ip/mult_gen_ddc/mult_gen_ddc.xci
set_property used_in_implementation false [get_files -all /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.srcs/sources_1/ip/mult_gen_ddc/mult_gen_ddc_ooc.xdc]

read_ip -quiet /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/receive/dds_rq/dds_rq.xci
set_property used_in_implementation false [get_files -all /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/receive/dds_rq/dds_rq_ooc.xdc]

read_ip -quiet /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/receive/dds_ri/dds_ri.xci
set_property used_in_implementation false [get_files -all /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/receive/dds_ri/dds_ri_ooc.xdc]

read_ip -quiet /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.srcs/sources_1/ip/mult_gen_duc/mult_gen_duc.xci
set_property used_in_implementation false [get_files -all /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.srcs/sources_1/ip/mult_gen_duc/mult_gen_duc_ooc.xdc]

read_ip -quiet /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/dds_125m_q/dds_125m_q.xci
set_property used_in_implementation false [get_files -all /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/dds_125m_q/dds_125m_q_ooc.xdc]

read_ip -quiet /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/dds_125m_i/dds_125m_i.xci
set_property used_in_implementation false [get_files -all /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/dds_125m_i/dds_125m_i_ooc.xdc]

read_ip -quiet /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.srcs/sources_1/ip/encoders/encoders.xci
set_property used_in_implementation false [get_files -all /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.gen/sources_1/ip/encoders/constraints/encode_rs_ooc.xdc]

read_ip -quiet /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.srcs/sources_1/ip/decoders/decoders.xci
set_property used_in_implementation false [get_files -all /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.gen/sources_1/ip/decoders/constraints/decode_rs_ooc.xdc]

read_ip -quiet /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/receive/ddc_out_fifo/ddc_out_fifo.xci
set_property used_in_implementation false [get_files -all /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/receive/ddc_out_fifo/ddc_out_fifo_ooc.xdc]

read_ip -quiet /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/axis_fifo_t8/axis_fifo_t8.xci
set_property used_in_implementation false [get_files -all /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/axis_fifo_t8/axis_fifo_t8_ooc.xdc]

read_ip -quiet /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/axis_fifo_t/axis_fifo_t.xci
set_property used_in_implementation false [get_files -all /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/axis_fifo_t/axis_fifo_t_ooc.xdc]

read_ip -quiet /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/duc_out_fifo/duc_out_fifo.xci
set_property used_in_implementation false [get_files -all /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/duc_out_fifo/duc_out_fifo_ooc.xdc]

read_ip -quiet /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.srcs/sources_1/ip/bbp_mmc/bbp_mmc.xci
set_property used_in_implementation false [get_files -all /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.srcs/sources_1/ip/bbp_mmc/bbp_mmc_board.xdc]
set_property used_in_implementation false [get_files -all /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.srcs/sources_1/ip/bbp_mmc/bbp_mmc.xdc]
set_property used_in_implementation false [get_files -all /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.srcs/sources_1/ip/bbp_mmc/bbp_mmc_ooc.xdc]

read_ip -quiet /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/receive/add_ddc/add_ddc.xci
set_property used_in_implementation false [get_files -all /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.gen/sources_1/ip/add_ddc/add_ddc_ooc.xdc]

read_ip -quiet /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/receive/sub_ddc/sub_ddc.xci
set_property used_in_implementation false [get_files -all /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.gen/sources_1/ip/sub_ddc/sub_ddc_ooc.xdc]

read_ip -quiet /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/sub_duc/sub_duc.xci
set_property used_in_implementation false [get_files -all /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.gen/sources_1/ip/sub_duc/sub_duc_ooc.xdc]

read_ip -quiet /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/bbp/transmit/add_duc/add_duc.xci
set_property used_in_implementation false [get_files -all /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.gen/sources_1/ip/add_duc/add_duc_ooc.xdc]

OPTRACE "Adding files" END { }
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/xilinx_pcie_xdma_ref_board.xdc
set_property used_in_implementation false [get_files /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/imports/xilinx_pcie_xdma_ref_board.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

OPTRACE "synth_design" START { }
synth_design -top baseband_processor -part xcvu37p-fsvh2892-2L-e
OPTRACE "synth_design" END { }
if { [get_msg_config -count -severity {CRITICAL WARNING}] > 0 } {
 send_msg_id runtcl-6 info "Synthesis results are not added to the cache due to CRITICAL_WARNING"
}


OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef baseband_processor.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
create_report "synth_1_synth_report_utilization_0" "report_utilization -file baseband_processor_utilization_synth.rpt -pb baseband_processor_utilization_synth.pb"
OPTRACE "synth reports" END { }
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "synth_1" END { }
