create_clock -period 14.4MHz -name {clk_14mhz} [get_ports {clk14}]
create_clock -period 32MHz -name {clk_32mhz} [get_ports {clk32}]

# clkcpu 3.5 or 7 MHz
create_generated_clock -name {clkcpu} -divide_by 2 -source [get_ports {clk14}] [get_registers {clkcpu~reg0}]

# int len in turbo = 66
create_generated_clock -name {n_int} -divide_by 64 -source [get_ports {clk14}] [get_registers {n_int~reg0}]

# hsync len 4.7uS, 14e6/(1/4.7e-6) ~= 65
create_generated_clock -name {hsync} -divide_by 63 -source [get_ports {clk14}] [get_registers {hsync~reg0}]

# chroma carrier
create_generated_clock -name {chroma_carrier} -divide_by 6 -source [get_ports {clk32}] [get_registers {*:chroma_gen1|carrier[15]}]

set_false_path -from [get_registers {r~reg0}] -to [get_clocks {clk_32mhz}]
set_false_path -from [get_registers {g~reg0}] -to [get_clocks {clk_32mhz}]
set_false_path -from [get_registers {b~reg0}] -to [get_clocks {clk_32mhz}]

derive_clock_uncertainty
derive_clocks -period 7.2MHz
