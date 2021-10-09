// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1.1 (lin64) Build 3286242 Wed Jul 28 13:09:46 MDT 2021
// Date        : Thu Aug 26 04:14:34 2021
// Host        : caohy168 running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/caohy168/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.gen/sources_1/ip/add_duc/add_duc_sim_netlist.v
// Design      : add_duc
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcvu37p-fsvh2892-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "add_duc,c_addsub_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_14,Vivado 2021.1.1" *) 
(* NotValidForBitStream *)
module add_duc
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
  add_duc_c_addsub_v12_0_14 U0
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
COj0C0ILpswUOTOx2cRs++CBIZJ/WfdlevVTTCHGWr/KjX3IBuo72IDQIblPbKdxi9BRPcpH9gvE
IZ1ySM8XKenDf2tfPZW0TYULFsU1PGNgllhhUFp/66QGU60hoPqI3hQauu19RvHhSpXFvMyH5zdX
+XeveptQJlhDGWjRNHA0GAMfDlY38efthRwzl9nzP+98I1lYustHx0+tPXSPGQ8Nr2Gddo9lAxHf
A3dLwCVo7UBc14Ip6WGV4sdQ9fxYcBtc1eyFjRopJGDUcanVg1e1LxqQDzCC6NTjEzWL3AdZRNa2
ipYEv6r5fxUcRQGXyQ9mncDdzcLY5gY8YF3dKQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UJrg4j3G1O20nIa4uXBxuwPOACapH48D4guBITgBwMSiC7HUEfIlm04UI0A1A7bweHSq43ErFegz
7NHRb3nBI6Pk0KSHGkoyTB+TmiCUCfBaFUplFFhoTgoWfaZDQx02UknvoPLt6Yd5RTJX+q9Oxea7
18HVTYiABIAhLGA8uWHtaV7jdex357j/c82DLefI1/27+wJNOM00x6Cs0ZE9cRUSsgY7O22l99CJ
p+M53dzHyHkFrBHEObsmOULV4TYv3y52taShB2mUe7sSRyEXWe29Vh1hkDc6O++yqnSzIMvEIKal
/tbKrYoM47uhquTvI/T4Tn5tdaHG9QcQ6FVhMw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 14464)
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
