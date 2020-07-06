create_clock -period 28.8MHz -name {clk_28mhz} [get_ports {clk28}]

# clkcpu 3.5 or 7 MHz
create_generated_clock -name {clkcpu} -divide_by 4 -source [get_ports {clk28}] [get_registers {clkcpu~reg0}]

# int len in turbo = 66
create_generated_clock -name {n_int} -divide_by 128 -source [get_ports {clk28}] [get_registers {n_int~reg0}]

# hsync len 4.7uS, 14e6/(1/4.7e-6) ~= 65
create_generated_clock -name {hsync} -divide_by 126 -source [get_ports {clk28}] [get_registers {hsync~reg0}]

derive_clock_uncertainty
derive_clocks -period 7.2MHz
