# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7z020clg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.cache/wt [current_project]
set_property parent.project_path C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/sources_1/imports/vivado_demo/code/Param.v
set_property file_type "Verilog Header" [get_files C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/sources_1/imports/vivado_demo/code/Param.v]
read_verilog -library xil_defaultlib {
  C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/sources_1/imports/vivado_demo/code/MYIP_TOP.v
  C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/sources_1/imports/vivado_demo/code/accumulator.v
  C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/sources_1/imports/vivado_demo/code/crom.v
  C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/sources_1/imports/vivado_demo/code/dbuf.v
  C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/sources_1/imports/vivado_demo/code/fir.v
  C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/sources_1/imports/vivado_demo/code/multi.v
  C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/sources_1/imports/vivado_demo/code/sysctrl.v
  C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/sources_1/imports/vivado_demo/code/system.v
}
read_edif C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/sources_1/imports/vivado_demo/imple/system_axi_ahblite_bridge_0_wrapper.ngc
read_edif C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/sources_1/imports/vivado_demo/imple/system_axi_clkgen_0_wrapper.ngc
read_edif C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/sources_1/imports/vivado_demo/imple/system_axi_dma_0_wrapper.ngc
read_edif C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/sources_1/imports/vivado_demo/imple/system_axi_hdmi_tx_16b_0_wrapper.ngc
read_edif C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/sources_1/imports/vivado_demo/imple/system_axi_iic_0_wrapper.ngc
read_edif C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/sources_1/imports/vivado_demo/imple/system_axi_interconnect_0_wrapper.ngc
read_edif C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/sources_1/imports/vivado_demo/imple/system_axi_interconnect_1_wrapper.ngc
read_edif C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/sources_1/imports/vivado_demo/imple/system_axi_interconnect_2_wrapper.ngc
read_edif C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/sources_1/imports/vivado_demo/imple/system_axi_interconnect_3_wrapper.ngc
read_edif C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/sources_1/imports/vivado_demo/imple/system_axi_spdif_tx_0_wrapper.ngc
read_edif C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/sources_1/imports/vivado_demo/imple/system_axi_vdma_0_wrapper.ngc
read_edif C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/sources_1/imports/vivado_demo/imple/system_clock_generator_0_wrapper.ngc
read_edif C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/sources_1/imports/vivado_demo/imple/system_processing_system7_0_wrapper.ngc
read_edif C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/sources_1/imports/vivado_demo/imple/system_util_vector_logic_0_wrapper.ngc
read_edif C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/sources_1/imports/vivado_demo/imple/system_vga_flyinglogo_0_wrapper.ngc
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/constrs_1/imports/project_1/system.xdc
set_property used_in_implementation false [get_files C:/Users/tom85/Desktop/DD_FIR_Lab11/DD_FIR/DD_FIR.srcs/constrs_1/imports/project_1/system.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top system -part xc7z020clg484-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef system.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file system_utilization_synth.rpt -pb system_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
