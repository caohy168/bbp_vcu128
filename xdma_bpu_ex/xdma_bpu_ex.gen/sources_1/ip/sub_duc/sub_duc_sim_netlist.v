// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1.1 (lin64) Build 3286242 Wed Jul 28 13:09:46 MDT 2021
// Date        : Thu Aug 26 04:14:34 2021
// Host        : caohy168 running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/caohy168/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.gen/sources_1/ip/sub_duc/sub_duc_sim_netlist.v
// Design      : sub_duc
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcvu37p-fsvh2892-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "sub_duc,c_addsub_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_14,Vivado 2021.1.1" *) 
(* NotValidForBitStream *)
module sub_duc
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
  sub_duc_c_addsub_v12_0_14 U0
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
hsWIbHqirXDNmclTB92GJl5bYHyCutYV1V0jkBt7tI3Jn2iN4TVZEPMhpUDtsF9HyxKsJyxP+JZy
ccQloc6BJBI5E80dgQK5YJrhz4LD1+pa0HgtFInmu4517YXMPI+AOUyvD17QenamWMn5o8Hym/8w
Oy7CINg0DtCU2+zEm95OiUODIoBYOrryeGtiiHEu5qmRaku5SDFLHNkY4rVmFpZ75YZEOFPR21Ix
2yF+HVpqfpz2o/O45MbLPGOyVBoKXgu2YcRBNGPVca5WjXhaCEJWSVtUXJPNjw4DiWKKuSW//v4A
hreUwXxVQqOoTkTGscwRXKTSA5fhgIq+YVdC1A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
WgXdX0xauLmbvjafSl92qQHG96zYZ7Av2a9mlYWjhzQqkLw29XoczkRdIPIGp28od1I7RDMAbwne
R2jhf1HUqqC87RAS+V21m5YI4lTzAmXx/PddnVsC0leg+bBK6LHx1jg0xkhrO9dEn3YFuf+sJ18E
lQrzFv7mhIsbwuN6iCIGoZZ/Pi+P9bfJGONKk8hnpUfYpEBbGmBZjyi6SgB48ewRdVa8fh5Rnfrc
VMsQe8lzKuv92SjH6b3BEPTot8rn6jOV/gmYGDtyGKfkoaXxH8fATyCp1biCiNifIbkHlUCC+ofL
ys6iLZ1BMbpHxkavMjPbAqeI7c1df5QBC4T1vg==

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
