// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1.1 (lin64) Build 3286242 Wed Jul 28 13:09:46 MDT 2021
// Date        : Thu Aug 26 04:14:33 2021
// Host        : caohy168 running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ sub_duc_sim_netlist.v
// Design      : sub_duc
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcvu37p-fsvh2892-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "sub_duc,c_addsub_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_14,Vivado 2021.1.1" *) 
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
  (* c_add_mode = "1" *) 
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
R78ufmzicqlet/86uB1t7E6deL2YALeY0Myh3Eim4j/hKRnoJ4QhTh/K+VeqSXDcgMz8/pXMJFwr
PJRI7J6sabtPvL+0UKX+5kp8+it6Bsoh8MCOgZ7yW9HSaER+i1dXWtZACqy/3b6dRPH9H3hdQ2Wg
HM94nVVcSnHqxJbH03mV4/suj2Do2OHCrXR7YUvzz7lUxG4ef77OGbQaJyR0MqQveUQtOzvTQ2Ys
/RssdwNqsUHPwOkVlRlDkFrDfRaG5f1x1K1Q+TbfioPUAg067l09XJ8LRtu4zT+X3J7UKwDrCM0F
JJc+HNoCOaSIsgHalzr5FY0QuSPlpJyo65PNBA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hm8vxETgV6XaDKwoE3wsFJbLuSeStjSinSTEmkcR6RNq4gayy4c1yTQ/C1ltpyemNfxLssA6owbH
hT6baT1Mf3hkjy9gQvvt4baky5Pn/ejmAvEPGdTohcHeRFjOgMB/5TsZx4ctw7T/GjRKCbyJTwmr
pVZqcgWU7u1RQxcH+59fyJdJRJJ622JqpCTXjZEIXL7Ba3SS/f6vOOs9tJu3M+mFLTu9QZWHSnJv
X2/XGFFybGT3rfPUVtjGDYA1P2NWmtls7Rp24zA684w+BvNpmKxba8CTw0GP2TfE6Ylh7rR8ApVu
+ocRa5390tyBu3/z721MxUN3ZsOkO3DqBeBGXQ==

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
