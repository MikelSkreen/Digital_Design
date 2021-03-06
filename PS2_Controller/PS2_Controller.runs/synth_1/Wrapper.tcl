# 
# Synthesis run script generated by Vivado
# 

debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/mskreen.NI/OneDrive/School/EE 324/PS2_Controller/PS2_Controller.cache/wt} [current_project]
set_property parent.project_path {C:/Users/mskreen.NI/OneDrive/School/EE 324/PS2_Controller/PS2_Controller.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:nexys4:part0:1.1 [current_project]
read_verilog -library xil_defaultlib {
  {C:/Users/mskreen.NI/OneDrive/School/EE 324/PS2_Controller/PS2_Controller.srcs/sources_1/imports/Verilog_Modules/ssegDecoder.v}
  {C:/Users/mskreen.NI/OneDrive/School/EE 324/PS2_Controller/PS2_Controller.srcs/sources_1/new/PS2_Keyboard.v}
  {C:/Users/mskreen.NI/OneDrive/School/EE 324/PS2_Controller/PS2_Controller.srcs/sources_1/new/Wrapper.v}
}
read_xdc {{C:/Users/mskreen.NI/OneDrive/School/EE 324/PS2_Controller/PS2_Controller.srcs/constrs_1/imports/EE 324/Nexys4_Master.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/mskreen.NI/OneDrive/School/EE 324/PS2_Controller/PS2_Controller.srcs/constrs_1/imports/EE 324/Nexys4_Master.xdc}}]

synth_design -top Wrapper -part xc7a100tcsg324-1
write_checkpoint -noxdef Wrapper.dcp
catch { report_utilization -file Wrapper_utilization_synth.rpt -pb Wrapper_utilization_synth.pb }
