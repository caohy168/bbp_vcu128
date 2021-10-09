#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst_n", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_start", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_done", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_idle", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_ready", 1, hls_out, -1, "", "", 1),
	Port_Property("recd_in_TDATA", 32, hls_in, 0, "axis", "in_data", 1),
	Port_Property("recd_in_TVALID", 1, hls_in, 0, "axis", "in_vld", 1),
	Port_Property("recd_in_TREADY", 1, hls_out, 0, "axis", "in_acc", 1),
	Port_Property("recd_out_TDATA", 32, hls_out, 1, "axis", "out_data", 1),
	Port_Property("recd_out_TVALID", 1, hls_out, 1, "axis", "out_vld", 1),
	Port_Property("recd_out_TREADY", 1, hls_in, 1, "axis", "out_acc", 1),
	Port_Property("recd_gf_out_address0", 8, hls_out, 2, "ap_memory", "mem_address", 1),
	Port_Property("recd_gf_out_ce0", 1, hls_out, 2, "ap_memory", "mem_ce", 1),
	Port_Property("recd_gf_out_we0", 1, hls_out, 2, "ap_memory", "mem_we", 1),
	Port_Property("recd_gf_out_d0", 32, hls_out, 2, "ap_memory", "mem_din", 1),
	Port_Property("syn_error_out", 32, hls_in, 3, "ap_none", "in_data", 1),
	Port_Property("alpha_to_out_address0", 8, hls_out, 4, "ap_memory", "mem_address", 1),
	Port_Property("alpha_to_out_ce0", 1, hls_out, 4, "ap_memory", "mem_ce", 1),
	Port_Property("alpha_to_out_we0", 1, hls_out, 4, "ap_memory", "mem_we", 1),
	Port_Property("alpha_to_out_d0", 32, hls_out, 4, "ap_memory", "mem_din", 1),
	Port_Property("index_of_out_address0", 8, hls_out, 5, "ap_memory", "mem_address", 1),
	Port_Property("index_of_out_ce0", 1, hls_out, 5, "ap_memory", "mem_ce", 1),
	Port_Property("index_of_out_we0", 1, hls_out, 5, "ap_memory", "mem_we", 1),
	Port_Property("index_of_out_d0", 32, hls_out, 5, "ap_memory", "mem_din", 1),
	Port_Property("gg_out_address0", 5, hls_out, 6, "ap_memory", "mem_address", 1),
	Port_Property("gg_out_ce0", 1, hls_out, 6, "ap_memory", "mem_ce", 1),
	Port_Property("gg_out_we0", 1, hls_out, 6, "ap_memory", "mem_we", 1),
	Port_Property("gg_out_d0", 32, hls_out, 6, "ap_memory", "mem_din", 1),
};
const char* HLS_Design_Meta::dut_name = "decode_rs";
