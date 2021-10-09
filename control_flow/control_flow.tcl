#start_gui
#vivado -mode tcl

set_param general.maxthreads 32
open_project /home/caohy168/Work/bbp_vcu128/xdma_bpu_ex/xdma_bpu_ex.xpr -quiet
update_compile_order -fileset sources_1
launch_simulation
#open_wave_config /home/caohy/Work/dual_line_process/xdma_bpu_tx/board_behav.wcfg
#source board.tcl
run -all
close_sim
#open_project /home/caohy168/Work/bbp_vcu128/xdma_bpu_rx/xdma_bpu_ex.xpr -quiet
#update_compile_order -fileset sources_1
#launch_simulation
#run -all
#close_sim

#diff -s /home/caohy/Work/dual_line_process/dat_interaction/receive/target/package1 /home/caohy/Work/dual_line_process/dat_interaction/transmit/source/package1
#diff -s /home/caohy/Work/dual_line_process/dat_interaction/receive/target/package2 /home/caohy/Work/dual_line_process/dat_interaction/transmit/source/package2
