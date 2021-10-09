################################################################################

# This XDC is used only for OOC mode of synthesis, implementation
# This constraints file contains default clock frequencies to be used during
# out-of-context flows such as OOC Synthesis and Hierarchical Designs.
# This constraints file is not used in normal top-down synthesis (default flow
# of Vivado)
################################################################################
create_clock -name mb_clk -period 6.400 [get_ports mb_clk]
create_clock -name refclk_diff_port_clk_p -period 6.400 [get_ports refclk_diff_port_clk_p]

################################################################################