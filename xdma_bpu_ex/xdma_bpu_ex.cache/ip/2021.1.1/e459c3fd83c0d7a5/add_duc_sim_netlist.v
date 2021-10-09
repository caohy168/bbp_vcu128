// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1.1 (lin64) Build 3286242 Wed Jul 28 13:09:46 MDT 2021
// Date        : Thu Aug 26 04:14:32 2021
// Host        : caohy168 running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ add_duc_sim_netlist.v
// Design      : add_duc
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcvu37p-fsvh2892-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "add_duc,c_addsub_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_14,Vivado 2021.1.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (A,
    B,
    CLK,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [15:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [15:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF s_intf:c_out_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [15:0]S;

  wire [15:0]A;
  wire [15:0]B;
  wire CLK;
  wire [15:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "virtexuplusHBM" *) 
  (* c_a_type = "0" *) 
  (* c_a_width = "16" *) 
  (* c_add_mode = "0" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_value = "0000000000000000" *) 
  (* c_b_width = "16" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "16" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_14 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b1),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.1.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
rTlu/hst59ucMkJti/2GvdTVYcFCHol1paYkzcf5UACD8rjqeUXPcwAFrWUsZ+3bxgkFv2amFb+e
aRMx6BHvlj83wOe5yzLfjSkiux+uNrj/3QzyiNq+Mvy5rFROcMSyVRTSfYfAWsKTtTcIgiTr8Iab
vQfK2RINqRCLQV4WnQ4=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
VSGTlrtL1vsvs6Pi9r7dCRrNqebNR7uNjjPYecnHoqNIuUerwKYo4g9A+4iscoio+5ODVON0HzPh
oFtOGNvgPP1NJI7843oEunCU67QAdMvMc0r69wMxT/JMjb4nUUuoUMH7CKja7q7P4txgy9bEhb2B
xQ5lIf0oX9y7IxAXwNu9JMZcX7USedWqkrM4+RUI5hJgJVVLCUy6oMgBBbUMP8qTyvLf57LpABNJ
R59DQLiBnHnD6tzEhCtiAxc+CQ+I5lBUEWbzkbSzjVd/+1EdfrgSVhGegbDFgH4Y+pqk7oKNSA8w
HHZxOtCqBqOfOnnAIYaLwWJrFy/xR6YPPH/YNA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jvqj27crhRGW+VkR4v0xhzYm8JNNKZC1+zHrv4FJZm0p5yafPlQbXAzbrDu7sfkAP4T/I5o71lsU
o9Coe9muVXeSF0a92Dkl4pcVRUR2AJl7i1Lq9cF2+BPBC3n8GnS01ZIpFzs/eTl4AELNX0quM9JU
GxdTqE4FxBZ03MP5jwE=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dGra5vxd+R/ood+hG4HaEfmPynym65JagBZmPPIWrpY1QC7FzOGeU/QeSSNNeAjuAA2aNc2DsNLO
npjPqfY4N1acl3GNpXIx1KrTvqVH6e2O90uK3XwBdrhPXONsPhNNUJkvEDDjsvToXVooMnsVS+wr
4aW2/dFPeiVdbzAQhnx7W+1MLCHd6Bn6vJdGWLNRO2FWhrYNGQedOjM29K1AEMDk0rRYh3oEKH6G
lU6dN35IQr/Zsk+ZWkl1fP7ZRrIr2GHlsnqBmHnW+B/trilSiCmpSn/SX8Q479x4r5a6UeLEAdfU
Il2bBu2JJQhIIOuU0rhdwgMAqtmf0VbClh4j/Q==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QA37+nXu13lOmo7vJeUfwvG6vCh8Ihq2lDvuunUMsZpz7ha/xBMTan+GHMqXHXMLBVhONDY3q+4l
fPMZnSfPqtarhxJTsr0D7hQ5WY/WEZ/hOcuVtCo9yfbYrlZbZdJicCiEyDEobTqFptUE1+qSt65k
Rqn7fHu+8B7rSKX19/Nwvf3VxrTU5eMxZDhBPyvhBuKr7bMuD2DSseeZJF5jNzT5eaiZbSUripfL
JrW9GO+2WQWWdJTeUEuvU82gSg+6SgEoNKus3gchOZ1csImHrpmdLdqn/z1wMeKTeP1O0wL4Kxp+
1SQK3Uc5FOYLTczyw/lZvU+NhCt8h7DMXK+6cQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lpBzAQBNLluap3K5Vn6vlZ1qIe06Jrrq0XLjpllVK6qHZNgkDxdOxxzZWtYKIgnZrFo5VQG+PAZT
e/+oC8UO2W/+WkSI0N1X5mb1XwTUri7IGmYLuicr/VOZTkpYPsxw4RWFsFw5QbOAD1eCwZsKjqT2
Oh7lZzPCXAyu0rIA96rhEGuhfMG3FKon7pvkBSNz8zcvh5lfqpLtFgcNuksV1irYLFIGJybm5JWo
C/pab9TFgt/+c4kZVBb93F6cNxl3lp5QZB0dBd6SRcls08p+r+rPgSGzXAmGUfPdJgvapID0jszt
0VI1N3PpLZ7yfharFSTy7IK7DeS69Bm1HOBhxQ==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HKeTOB3J9FPGeVlgJMGp2BE17wwVzGEBr3NaSPcLvh2+sErUrw6up/ZCmcuL+fKbHvj+rYHlO9ED
D/N5kj9siM/PIAgmIfySeMO3cO5wWbmAX1lY2qe4pSDjfO4OCUPYP3wo+LKJA1F5WKAnd26YFttZ
5JRDYyWppAC16M5lKkQAEcizBazz/fFth4V+tkoClX9VvOh239/lWuR/URFSpPNTT90gSzdhyShC
BykQfNkce4ZKg3qxpofoUVo/IqWEeE7z7uL8CnBYFVAbo3ppaK9J4buchfNuwnmnhtvtLj1FFcx8
VMFCGjRTnSvcTr5dgQ0VLeAtBczI2jKFG7anOQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
qZpuJWZj4ugjEB61CShdmEPhLqTuyqjlI6m04S23h57R4spAPPrSKZeMitQsNXfKpumEE5PQAg1k
3OCEFUlBjMrCzxonSwKTYx96Qeh2D2TyVjTBidFWTG1U6pgP59/4mvs2L6cnbxFsYGlX5LDDWPiv
PYRCpry6KsgnFj61mMv7PEzbkiwe6bPtTeJFDTtqv3zJ6B/U/Eha/awyHqMB1TL7d8Fyb5COlsZL
//9htVHeUduLLKe49Jieh8qJoEkmMZAuyR7SIcprBAj+qRcuVihXzfNVVxSxwbghXBRtHA4kGELf
8I6j3ZBtiSHTsMfPLaOYmip4xJwLbAaIDx2NJxh+hIW7NbEO1gEa4dYicabOd+2I9URZUoDlWlnn
HfOhSBeh/l+hk9E3cu4EBmmvWpioQoZW6SGeKLzRCa+L9UvSKv0ClvqroShOsriYAseI2eUSBEkP
EAbWAez1EaB10KFiu2p+Vq/8F5MYKE4QiXMbXIYV4H4w1lO3RKj1Ajo4

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dQx9Zlqv9mb8txOdqtQplywYMwdxAh8zZkmBjy2nkPqqwXQ3glJETOnYOzBm5Mp84UEehonB8zHn
jvCvDkc4UQeRew6kyEuI7ZOE2o45tkda33QPsUjokSJEw5n3tjLqviEZU61Rl+VvN9p2lSEv350T
TW2QRatkgVzx6RRKzsnLK9hg9FJy3V6k+4Lr9Op07lIHw4GPEosERfaDJvF+ak+IoftoL44fYbH9
4w2lmA2yw7XO0g2n31flGIG8kpFxozAPuvHG3/FbmGVDaEsL3bebem1sb+I3UDCisCh2RmloH20Q
EpN79c2DbrPMCRQGkOBcMkjTLfwxmdikUKtMYw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
em6wbkIUZsd14Qo+URQKGI6Ft4PsovbA6IFxEJHxu+YAI8MZRSAPMAxjTPlFd+UzLOWqGPaLiWyV
3t1cx00cv+CyKMU7sNyOKwi3fLRE0sb4RT5epDw+zMcIxIJRDmpTX2bvDPzRJ8ScKLMAe4iw0JCz
ylvACyhYiWWYYOvGOQ1p6DPVvB4rvZzukuLV1aGpD2aTyYHeq/ggaOxS/Ex5HPooJPmTa7U6G5xx
waaveLZe9hvRJlvRLgI0Hsyoh0TPeYlLjaD3g9yfF50XuiEbrf2RQMxbxsi6an9rI+HZ0qTlUgbO
X2/pvLjtZJi3/bp3Yh3/i+Eyf6Huay6U4V3kwg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
IsgWTxfNXP8V+HyC09lUNZjIjMYGjaZ9qzjWzGmCiaZJT9BWu51m3hifoB53Zr8+PkmC1yfPeEh2
WMhrQ2xPHx0i0gm7XIQj4m0sk9ezzrkcbKZzWZ2fIR0sVi4MrNbbCCw+l+lsTse3oBm45ZivX61h
zNvgFCMWkCTm4Kduh3GO4dTmDmkki4y47XWmd6RlJpH5hQPgtu6a5Tle2Cyp5T8q1gU8y9JKMbpM
or+E6IYbRRZK0PmGwqb6d7e58Y7p7WFc+AkXKVNTMbYXlT1XcY5CF4FJA+x6RIhvzxgKQCsPpnYy
D/Y7XRa+RafoTZm40tccj/R2msIBbF7bXmMp4w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 14528)
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
