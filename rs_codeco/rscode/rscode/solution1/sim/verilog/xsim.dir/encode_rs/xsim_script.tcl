set_param project.enableReportConfiguration 0
load_feature core
current_fileset
xsim {encode_rs} -view {{encode_rs_dataflow_ana.wcfg}} -tclbatch {encode_rs.tcl} -protoinst {encode_rs.protoinst}
