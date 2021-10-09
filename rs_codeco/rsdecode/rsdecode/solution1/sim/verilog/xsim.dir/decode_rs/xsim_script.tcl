set_param project.enableReportConfiguration 0
load_feature core
current_fileset
xsim {decode_rs} -view {{decode_rs_dataflow_ana.wcfg}} -tclbatch {decode_rs.tcl} -protoinst {decode_rs.protoinst}
