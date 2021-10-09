// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
// Date        : Thu Sep 30 03:11:32 2021
// Host        : ubuntu running 64-bit Ubuntu 18.04.6 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/caohuiyang/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.runs/dds_125m_q_synth_1/dds_125m_q_sim_netlist.v
// Design      : dds_125m_q
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcvu37p-fsvh2892-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dds_125m_q,dds_compiler_v6_0_21,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dds_compiler_v6_0_21,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module dds_125m_q
   (aclk,
    m_axis_data_tvalid,
    m_axis_data_tdata,
    m_axis_phase_tvalid,
    m_axis_phase_tdata);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 aclk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME aclk_intf, ASSOCIATED_BUSIF M_AXIS_PHASE:S_AXIS_CONFIG:M_AXIS_DATA:S_AXIS_PHASE, ASSOCIATED_RESET aresetn, ASSOCIATED_CLKEN aclken, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input aclk;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_DATA TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXIS_DATA, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *) output m_axis_data_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_DATA TDATA" *) output [7:0]m_axis_data_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_PHASE TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXIS_PHASE, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *) output m_axis_phase_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_PHASE TDATA" *) output [15:0]m_axis_phase_tdata;

  wire aclk;
  wire [7:0]m_axis_data_tdata;
  wire m_axis_data_tvalid;
  wire [15:0]m_axis_phase_tdata;
  wire m_axis_phase_tvalid;
  wire NLW_U0_debug_axi_resync_in_UNCONNECTED;
  wire NLW_U0_debug_core_nd_UNCONNECTED;
  wire NLW_U0_debug_phase_nd_UNCONNECTED;
  wire NLW_U0_event_phase_in_invalid_UNCONNECTED;
  wire NLW_U0_event_pinc_invalid_UNCONNECTED;
  wire NLW_U0_event_poff_invalid_UNCONNECTED;
  wire NLW_U0_event_s_config_tlast_missing_UNCONNECTED;
  wire NLW_U0_event_s_config_tlast_unexpected_UNCONNECTED;
  wire NLW_U0_event_s_phase_chanid_incorrect_UNCONNECTED;
  wire NLW_U0_event_s_phase_tlast_missing_UNCONNECTED;
  wire NLW_U0_event_s_phase_tlast_unexpected_UNCONNECTED;
  wire NLW_U0_m_axis_data_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_phase_tlast_UNCONNECTED;
  wire NLW_U0_s_axis_config_tready_UNCONNECTED;
  wire NLW_U0_s_axis_phase_tready_UNCONNECTED;
  wire [0:0]NLW_U0_debug_axi_chan_in_UNCONNECTED;
  wire [15:0]NLW_U0_debug_axi_pinc_in_UNCONNECTED;
  wire [15:0]NLW_U0_debug_axi_poff_in_UNCONNECTED;
  wire [15:0]NLW_U0_debug_phase_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_data_tuser_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_phase_tuser_UNCONNECTED;

  (* C_ACCUMULATOR_WIDTH = "16" *) 
  (* C_AMPLITUDE = "1" *) 
  (* C_CHANNELS = "1" *) 
  (* C_CHAN_WIDTH = "1" *) 
  (* C_DEBUG_INTERFACE = "0" *) 
  (* C_HAS_ACLKEN = "0" *) 
  (* C_HAS_ARESETN = "0" *) 
  (* C_HAS_M_DATA = "1" *) 
  (* C_HAS_M_PHASE = "1" *) 
  (* C_HAS_PHASEGEN = "1" *) 
  (* C_HAS_PHASE_OUT = "1" *) 
  (* C_HAS_SINCOS = "1" *) 
  (* C_HAS_S_CONFIG = "0" *) 
  (* C_HAS_S_PHASE = "0" *) 
  (* C_HAS_TLAST = "0" *) 
  (* C_HAS_TREADY = "0" *) 
  (* C_LATENCY = "3" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MODE_OF_OPERATION = "0" *) 
  (* C_MODULUS = "9" *) 
  (* C_M_DATA_HAS_TUSER = "0" *) 
  (* C_M_DATA_TDATA_WIDTH = "8" *) 
  (* C_M_DATA_TUSER_WIDTH = "1" *) 
  (* C_M_PHASE_HAS_TUSER = "0" *) 
  (* C_M_PHASE_TDATA_WIDTH = "16" *) 
  (* C_M_PHASE_TUSER_WIDTH = "1" *) 
  (* C_NEGATIVE_COSINE = "0" *) 
  (* C_NEGATIVE_SINE = "0" *) 
  (* C_NOISE_SHAPING = "0" *) 
  (* C_OPTIMISE_GOAL = "1" *) 
  (* C_OUTPUTS_REQUIRED = "0" *) 
  (* C_OUTPUT_FORM = "0" *) 
  (* C_OUTPUT_WIDTH = "8" *) 
  (* C_PHASE_ANGLE_WIDTH = "8" *) 
  (* C_PHASE_INCREMENT = "2" *) 
  (* C_PHASE_INCREMENT_VALUE = "0001100110011001,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_PHASE_OFFSET = "0" *) 
  (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_POR_MODE = "0" *) 
  (* C_RESYNC = "0" *) 
  (* C_S_CONFIG_SYNC_MODE = "0" *) 
  (* C_S_CONFIG_TDATA_WIDTH = "1" *) 
  (* C_S_PHASE_HAS_TUSER = "0" *) 
  (* C_S_PHASE_TDATA_WIDTH = "1" *) 
  (* C_S_PHASE_TUSER_WIDTH = "1" *) 
  (* C_USE_DSP48 = "0" *) 
  (* C_XDEVICEFAMILY = "virtexuplusHBM" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  dds_125m_q_dds_compiler_v6_0_21 U0
       (.aclk(aclk),
        .aclken(1'b1),
        .aresetn(1'b1),
        .debug_axi_chan_in(NLW_U0_debug_axi_chan_in_UNCONNECTED[0]),
        .debug_axi_pinc_in(NLW_U0_debug_axi_pinc_in_UNCONNECTED[15:0]),
        .debug_axi_poff_in(NLW_U0_debug_axi_poff_in_UNCONNECTED[15:0]),
        .debug_axi_resync_in(NLW_U0_debug_axi_resync_in_UNCONNECTED),
        .debug_core_nd(NLW_U0_debug_core_nd_UNCONNECTED),
        .debug_phase(NLW_U0_debug_phase_UNCONNECTED[15:0]),
        .debug_phase_nd(NLW_U0_debug_phase_nd_UNCONNECTED),
        .event_phase_in_invalid(NLW_U0_event_phase_in_invalid_UNCONNECTED),
        .event_pinc_invalid(NLW_U0_event_pinc_invalid_UNCONNECTED),
        .event_poff_invalid(NLW_U0_event_poff_invalid_UNCONNECTED),
        .event_s_config_tlast_missing(NLW_U0_event_s_config_tlast_missing_UNCONNECTED),
        .event_s_config_tlast_unexpected(NLW_U0_event_s_config_tlast_unexpected_UNCONNECTED),
        .event_s_phase_chanid_incorrect(NLW_U0_event_s_phase_chanid_incorrect_UNCONNECTED),
        .event_s_phase_tlast_missing(NLW_U0_event_s_phase_tlast_missing_UNCONNECTED),
        .event_s_phase_tlast_unexpected(NLW_U0_event_s_phase_tlast_unexpected_UNCONNECTED),
        .m_axis_data_tdata(m_axis_data_tdata),
        .m_axis_data_tlast(NLW_U0_m_axis_data_tlast_UNCONNECTED),
        .m_axis_data_tready(1'b0),
        .m_axis_data_tuser(NLW_U0_m_axis_data_tuser_UNCONNECTED[0]),
        .m_axis_data_tvalid(m_axis_data_tvalid),
        .m_axis_phase_tdata(m_axis_phase_tdata),
        .m_axis_phase_tlast(NLW_U0_m_axis_phase_tlast_UNCONNECTED),
        .m_axis_phase_tready(1'b0),
        .m_axis_phase_tuser(NLW_U0_m_axis_phase_tuser_UNCONNECTED[0]),
        .m_axis_phase_tvalid(m_axis_phase_tvalid),
        .s_axis_config_tdata(1'b0),
        .s_axis_config_tlast(1'b0),
        .s_axis_config_tready(NLW_U0_s_axis_config_tready_UNCONNECTED),
        .s_axis_config_tvalid(1'b0),
        .s_axis_phase_tdata(1'b0),
        .s_axis_phase_tlast(1'b0),
        .s_axis_phase_tready(NLW_U0_s_axis_phase_tready_UNCONNECTED),
        .s_axis_phase_tuser(1'b0),
        .s_axis_phase_tvalid(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.1.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
fFWuR0gKcbKF9SZdFG5ejdrq0TGO6Iv7rPyTlyVNT4mgN1+4xy5PYxvV9AXtjb1sCIJbAFmDRgWB
dZ2KTv49+cu5UNfZNMLdSl/o5GjG8iPKFw/o9YEFUW7zbRBaXYW2Vwnz5tLKcz9LOVvYqfWqCtAt
RDIGa1nQAERHTbiwYB8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
flK1Gx6HNtT3plVgwdXkUkP+q2R/gm+IMPSBBPAbsv9sz3FXpJEpQ3wJ59/4OEH+YgxAUYHonl2k
u6jQNMy+r4s+542GDnI7hVBPCdX5nv+ifEsRGh8IRcGfztr3rjGTYtI8cjQ8rDjel47odV9u3Aaa
yRdE2Chv6y6u8m0Dqf5BRp5mArp194NPy5aWfCxgYsRjCGS/YGHFOq+L5WNg0Zios+SnjWAx6u30
/Xxq0pb2sH1H/REPHY4l52FkRBnI0/G+klS4ecthrZgQUTTV7pnZW8nc5eAwfoXDtQNiFoMraiSw
FcMDfVaqgi8FyVBD0cA8K4XXEcxPqmZadwKhZg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
ZEN+aSDqcOxixSvbKSEIq9QmZV+ynEBr86Mbym1cFAkFhr9w03qRA3ItHt3ZhI2EdaEwFZZ/Z026
nRi8Gt05BN6rUxItw/WbP5hDBbcGfHQlutMBg6Yw+4tmyyNH0v8J0S+6CI5I3fp/OcUlBO6B8Msf
2ADSMc8u8euZ1N+qkNE=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fCbsif2KaJBG397XXIfXW7JKlnXSNgeln7aWxYRVho9o5j9XzpuvZby7z5R4qeUnXKTLV4dlipwJ
iKx7hGP8k8JvwzgkiaJRXmtgHJDDsb7oXovQp8DOGI3CBoR1i/MLaBNtQ1zQn2fIKbmIOjr7kpKh
LI315141B0R/m9H7Do/3+mdBwZo1n+RoO35CsjGtHH7jJYtjkDbWC6VLCnTlDZVc5AWousE2Kz/r
7Y+451Z77wzFKB0zSjCKFgA/+gK/9jqkPZy3XSrN4BeIAtn8VsBjaXb1Hti1xnJBNNSINxIbF3/8
2FjGYG9AfHUdFXSMJ//wy+GoobyhmOzu+HmZgg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UUVMXL5+IweVclzX5VztCQcdWKOCGte4DoErWmN1rDFbrtszseLLx9h9fpRzqXWHWTxwpwESr/l9
uEDLtsxGzrNYdfmACVrKRd7poa0EAheHaCdzwPSYjXEGaIvcUYFFqW7wpFAvdqWD2AE1JEDFM8dn
NmEGLBpJx4vH9x9DHrdn8edU+TvtFlPkvnvf3xCGPdfeO6VZUuJPJ42+JLut9W5p+NYOSyz8k2QF
0uXFac3soCUPjDLGEv9s2sm3O4lsVjB9b87P04trKS+rsRxqA0VLZFmcPPnEpYKGf4Q/kU24ztHl
S8DcJahOz31Nfp5qRq8ECmjw6nwUex/A+9mOtQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
FF2hlsx1X90aQaozxN83ZMhsC8msTytf1QsVStuPegE+0A0zBGSjd5Pt3UclJJNIfBhQHXnGCfSf
za3pd/IMnIXcLsFaFQ8iIDT6+gY7fipWkz9gQjXQk+LwIN5XwcNuasQAO2aDz8c4ZDboeukxURE1
m8z11C5exnBdUWVPUEosv7uy7fd40LahTAbDH7yrchffdkwWhcOOL/mnojQdUiPT42lVfJYMnIlf
IU+VND9SA4S5+CGxr0gkJG9zPCLKUDVj27zPYSTw86CsLfJAdgjCbqUcE3XI1XOQ8ij2iiVEqX49
lCKKZ8KQSMNhxP3RReN4AlbyjuWcf11qq9ETvA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qj5HRFoCpKmpqssGdnGRE+uaP5cMKP172sYTQDalJP29DPzQWSYmf9UkXYORPoOqRWJZk5lVHIBn
WPkaQZgQv8G+rYSIPZjBqKNVQG7FjJmlXOV5P9p9U6ZzQwD/ygPFyd4sDs1RqHYYqABxNlmdiz7H
V4ddfFZL6W/ZHjG/z/5lxxl/Fcwm9NevMavnqaRkYX1Q8eYgNgVgQ5EjqQEm/51ywInCGL/V3cg+
PxrsKmY+ntZDjeMuYbOMpcAoE0KQ193t1OowejLmgwUbdb+UPvoI24/53HpmRMd9ubS4Fk6i6k/u
g+2SE/I33Ge+EZpzaWjC+sLatTTS/irYGJJUfg==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
a2iZRIwhwA7Gpy/BncXvxnqYprPvJm4smMfsMmU98XlJS5UKTjozbxuAt/KmQRaI5gBxXU9b891a
2scd9wlpfNTwN01iCG3Ceyt7Ef3Nk/7gapwcFbTsTimzhtN5/X1S7PMDFgFOMuBtUkXK8vNS2dL8
zGULzuSwRQ/9dqIh7ILiS6UxNuJJUGRmdC8b7akto8jZAsltMtu6kewmdAeSJ78/RKo9aJ2CWfUR
hXDBZUYLZEcJV+ctvCTntn5gMsaNmFglGrb3s3RGriTOxKSYF4w03Tc/vBP2dSvzwN4fNiVRS9Gp
QJfRQgFVdicTAx+XDuPkyUgrqCQgFQuhm9H+CoELXGnlZoceyTTYLQjDENGaFsm4YnABfXcA5gEH
zAFu+6dnJ68hBr1OeUPztah4WzZ2j3hY9DdPQH8/6CtVg4z+AkOiiDQp6hA9NjGxSOAZNIYzOVNz
UfMamXZByJDjGrFLOpRCkon8xODiz3ozYqnwliFV/687NH8pGqndJ2UB

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
RcyhG0CpcRAO6lg/sXNHR238WF+HE2zlNdwWBPNOwda4zEshFbc/T2U5LXNiJVCWmIf71IXWp/da
NtgHnwdUP/N09Bzx7UZ8f9wl4TM0FdFofX/xnnrvudZGjDVtcRqP25hBY+oOW0vTLYj0K2yTtZ47
du3b+6bfdRKc+rzNKynIzYjsZrRuOwVlrm3al6oslecDCb7N+lXB/cUSzQm3xu+mO/GgPpjUE3tN
S5RFWLFd1J4hFuvk0j6r8fz2s5NkgLApUY7o9CBUgKJAZgX61nsavChPtfJcT5Rr0C68JGVnkkr7
l/loc/9MLvD1kSInCj4DWkNO227WkCy2iZ4KQg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
EdpUy10IcyPJnOyPcm9EzihkDCWe3mjjK9K9FeRPovLOdoJAgZRptkpyoMiGMtFOThP0UO4Z+pio
O9UGOYwt18rOUWluqGlkakpvDl4UqTwrCH361MXiUSs9eRsw3F0hAOkwdj/VQxpD783SpCRuH14u
gRkB/pLNeH5wSqyoJS8iNzh56BfyOLfc0iGRLyZ2sNqoXCGymlV3qglJicAWAXG8Qf3Rvuf90tBT
bwk185ilEurRwHuMI88vCGjTjxTH4ndxRxNw6lkZfP0Ciqt3JVZt63WnCKj3QzS8mrdiUmOjABiW
pXZhq2kUfGQmpXAtNhCyMzE+QYgOVLbcoGEKvA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
a7Pe4jyXv0cnwMCE9EvKcGa3Xa2pD4M3oQsDxC0clDnZCn2L6+0By+/iPBiW6UnUz5UbKFp3EyB7
IMHkbYzRoFCdfVdtroWbeWMTRuOCeXfRJgm9gmNsBWh+/jVAGhdXeANISHdAx6QWjjQAd0zanxfX
yGXdpoWU4+vVO/0WAdtlLYnm91ZBxfDMrEDm3eyUyGuSagpmi4mPN/Y7HEvylDJO30O0ZSE/H6Ff
dn19y0laRAgXe4YUgv7v7J+20IaadQ/dFNeEgTPac3btaBoNOkX/5F3D9NArZL+lpJ+wNCJi3OuX
922T1SnC4OBGia5fMMqK7cWuGYhe9raNwU1k9Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 46720)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
