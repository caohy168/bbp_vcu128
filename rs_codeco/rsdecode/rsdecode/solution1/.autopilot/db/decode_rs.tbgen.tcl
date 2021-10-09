set moduleName decode_rs
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {decode_rs}
set C_modelType { void 0 }
set C_modelArgList {
	{ recd_in int 32 regular {axi_s 0 volatile  { recd_in Data } }  }
	{ recd_out int 32 regular {axi_s 1 volatile  { recd_out Data } }  }
	{ recd_gf_out int 32 regular {array 255 { 0 3 } 0 1 }  }
	{ syn_error_out int 32 unused  }
	{ alpha_to_out int 32 regular {array 256 { 0 3 } 0 1 }  }
	{ index_of_out int 32 regular {array 256 { 0 3 } 0 1 }  }
	{ gg_out int 32 regular {array 21 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "recd_in", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "recd_in","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "recd_out", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "recd_out","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "recd_gf_out", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "recd_gf_out","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "syn_error_out", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "syn_error_out","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "alpha_to_out", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "alpha_to_out","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "index_of_out", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "index_of_out","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "gg_out", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "gg_out","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 29
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ recd_in_TDATA sc_in sc_lv 32 signal 0 } 
	{ recd_in_TVALID sc_in sc_logic 1 invld 0 } 
	{ recd_in_TREADY sc_out sc_logic 1 inacc 0 } 
	{ recd_out_TDATA sc_out sc_lv 32 signal 1 } 
	{ recd_out_TVALID sc_out sc_logic 1 outvld 1 } 
	{ recd_out_TREADY sc_in sc_logic 1 outacc 1 } 
	{ recd_gf_out_address0 sc_out sc_lv 8 signal 2 } 
	{ recd_gf_out_ce0 sc_out sc_logic 1 signal 2 } 
	{ recd_gf_out_we0 sc_out sc_logic 1 signal 2 } 
	{ recd_gf_out_d0 sc_out sc_lv 32 signal 2 } 
	{ syn_error_out sc_in sc_lv 32 signal 3 } 
	{ alpha_to_out_address0 sc_out sc_lv 8 signal 4 } 
	{ alpha_to_out_ce0 sc_out sc_logic 1 signal 4 } 
	{ alpha_to_out_we0 sc_out sc_logic 1 signal 4 } 
	{ alpha_to_out_d0 sc_out sc_lv 32 signal 4 } 
	{ index_of_out_address0 sc_out sc_lv 8 signal 5 } 
	{ index_of_out_ce0 sc_out sc_logic 1 signal 5 } 
	{ index_of_out_we0 sc_out sc_logic 1 signal 5 } 
	{ index_of_out_d0 sc_out sc_lv 32 signal 5 } 
	{ gg_out_address0 sc_out sc_lv 5 signal 6 } 
	{ gg_out_ce0 sc_out sc_logic 1 signal 6 } 
	{ gg_out_we0 sc_out sc_logic 1 signal 6 } 
	{ gg_out_d0 sc_out sc_lv 32 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "recd_in_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "recd_in", "role": "TDATA" }} , 
 	{ "name": "recd_in_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "recd_in", "role": "TVALID" }} , 
 	{ "name": "recd_in_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "recd_in", "role": "TREADY" }} , 
 	{ "name": "recd_out_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "recd_out", "role": "TDATA" }} , 
 	{ "name": "recd_out_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "recd_out", "role": "TVALID" }} , 
 	{ "name": "recd_out_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "recd_out", "role": "TREADY" }} , 
 	{ "name": "recd_gf_out_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "recd_gf_out", "role": "address0" }} , 
 	{ "name": "recd_gf_out_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "recd_gf_out", "role": "ce0" }} , 
 	{ "name": "recd_gf_out_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "recd_gf_out", "role": "we0" }} , 
 	{ "name": "recd_gf_out_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "recd_gf_out", "role": "d0" }} , 
 	{ "name": "syn_error_out", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "syn_error_out", "role": "default" }} , 
 	{ "name": "alpha_to_out_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "alpha_to_out", "role": "address0" }} , 
 	{ "name": "alpha_to_out_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "alpha_to_out", "role": "ce0" }} , 
 	{ "name": "alpha_to_out_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "alpha_to_out", "role": "we0" }} , 
 	{ "name": "alpha_to_out_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "alpha_to_out", "role": "d0" }} , 
 	{ "name": "index_of_out_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "index_of_out", "role": "address0" }} , 
 	{ "name": "index_of_out_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "index_of_out", "role": "ce0" }} , 
 	{ "name": "index_of_out_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "index_of_out", "role": "we0" }} , 
 	{ "name": "index_of_out_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "index_of_out", "role": "d0" }} , 
 	{ "name": "gg_out_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "gg_out", "role": "address0" }} , 
 	{ "name": "gg_out_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gg_out", "role": "ce0" }} , 
 	{ "name": "gg_out_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gg_out", "role": "we0" }} , 
 	{ "name": "gg_out_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gg_out", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27"],
		"CDFG" : "decode_rs",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "recd_in", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "recd_in_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "recd_out", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "recd_out_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "recd_gf_out", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "syn_error_out", "Type" : "None", "Direction" : "I"},
			{"Name" : "alpha_to_out", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "index_of_out", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "gg_out", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "alpha_to", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "index_of", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "gg", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "recd", "Type" : "Memory", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.alpha_to_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.index_of_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.gg_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.recd_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.elp_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.d_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.l_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.u_lu_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.s_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.root_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.loc_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.z_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.reg_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.srem_10ns_9ns_8_14_1_U1", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.srem_10ns_9ns_8_14_seq_1_U2", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.srem_32ns_9ns_8_36_1_U3", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.srem_32ns_9ns_8_36_1_U4", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.srem_10ns_9ns_8_14_1_U5", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.srem_32ns_9ns_32_36_1_U6", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.srem_32ns_9ns_8_36_1_U7", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.srem_14s_9ns_8_18_1_U8", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_10ns_9ns_10_14_1_U9", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.srem_32ns_9ns_9_36_seq_1_U10", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.srem_11ns_9ns_8_15_seq_1_U11", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_9ns_4ns_9s_14_4_1_U12", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_recd_in_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_recd_out_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	decode_rs {
		recd_in {Type I LastRead 13 FirstWrite -1}
		recd_out {Type O LastRead -1 FirstWrite 67}
		recd_gf_out {Type O LastRead -1 FirstWrite 18}
		syn_error_out {Type I LastRead -1 FirstWrite -1}
		alpha_to_out {Type O LastRead -1 FirstWrite 7}
		index_of_out {Type O LastRead -1 FirstWrite 7}
		gg_out {Type O LastRead -1 FirstWrite 12}
		alpha_to {Type IO LastRead -1 FirstWrite -1}
		index_of {Type IO LastRead -1 FirstWrite -1}
		gg {Type IO LastRead -1 FirstWrite -1}
		recd {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "2", "EnableSignal" : "ap_enable_pp2"}
	{"Pipeline" : "3", "EnableSignal" : "ap_enable_pp3"}
	{"Pipeline" : "4", "EnableSignal" : "ap_enable_pp4"}
	{"Pipeline" : "5", "EnableSignal" : "ap_enable_pp5"}
	{"Pipeline" : "7", "EnableSignal" : "ap_enable_pp7"}
	{"Pipeline" : "8", "EnableSignal" : "ap_enable_pp8"}
	{"Pipeline" : "9", "EnableSignal" : "ap_enable_pp9"}
	{"Pipeline" : "12", "EnableSignal" : "ap_enable_pp12"}
	{"Pipeline" : "15", "EnableSignal" : "ap_enable_pp15"}
	{"Pipeline" : "16", "EnableSignal" : "ap_enable_pp16"}
	{"Pipeline" : "17", "EnableSignal" : "ap_enable_pp17"}
	{"Pipeline" : "18", "EnableSignal" : "ap_enable_pp18"}
	{"Pipeline" : "19", "EnableSignal" : "ap_enable_pp19"}
	{"Pipeline" : "20", "EnableSignal" : "ap_enable_pp20"}
	{"Pipeline" : "21", "EnableSignal" : "ap_enable_pp21"}
	{"Pipeline" : "22", "EnableSignal" : "ap_enable_pp22"}
	{"Pipeline" : "23", "EnableSignal" : "ap_enable_pp23"}
	{"Pipeline" : "24", "EnableSignal" : "ap_enable_pp24"}
	{"Pipeline" : "25", "EnableSignal" : "ap_enable_pp25"}
	{"Pipeline" : "26", "EnableSignal" : "ap_enable_pp26"}
	{"Pipeline" : "27", "EnableSignal" : "ap_enable_pp27"}
	{"Pipeline" : "28", "EnableSignal" : "ap_enable_pp28"}
]}

set Spec2ImplPortList { 
	recd_in { axis {  { recd_in_TDATA in_data 0 32 }  { recd_in_TVALID in_vld 0 1 }  { recd_in_TREADY in_acc 1 1 } } }
	recd_out { axis {  { recd_out_TDATA out_data 1 32 }  { recd_out_TVALID out_vld 1 1 }  { recd_out_TREADY out_acc 0 1 } } }
	recd_gf_out { ap_memory {  { recd_gf_out_address0 mem_address 1 8 }  { recd_gf_out_ce0 mem_ce 1 1 }  { recd_gf_out_we0 mem_we 1 1 }  { recd_gf_out_d0 mem_din 1 32 } } }
	syn_error_out { ap_none {  { syn_error_out in_data 0 32 } } }
	alpha_to_out { ap_memory {  { alpha_to_out_address0 mem_address 1 8 }  { alpha_to_out_ce0 mem_ce 1 1 }  { alpha_to_out_we0 mem_we 1 1 }  { alpha_to_out_d0 mem_din 1 32 } } }
	index_of_out { ap_memory {  { index_of_out_address0 mem_address 1 8 }  { index_of_out_ce0 mem_ce 1 1 }  { index_of_out_we0 mem_we 1 1 }  { index_of_out_d0 mem_din 1 32 } } }
	gg_out { ap_memory {  { gg_out_address0 mem_address 1 5 }  { gg_out_ce0 mem_ce 1 1 }  { gg_out_we0 mem_we 1 1 }  { gg_out_d0 mem_din 1 32 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
