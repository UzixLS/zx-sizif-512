derive_clock_uncertainty
create_clock -period 14.4MHz -name {clk_14mhz} [get_ports {clk14}]
create_clock -period 32.1MHz -name {clk_32mhz} [get_ports {clk32}]
create_generated_clock -name {clkcpu} -source [get_ports {clk14}] -divide_by 2 [get_registers {clkcpu~reg0}]
create_generated_clock -name {clk4} -source [get_ports {clk32}] -divide_by 8 [get_registers {vgcnt_rtl_0|dffs[2]}]
set_false_path -from [get_registers {port_dosff[3]}] -to [get_registers {vg_index~reg0}]
set_false_path -from [get_registers {vg_rawr~reg0}] -to [get_registers {attr[3]}]
