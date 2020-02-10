set clk_14mhz [get_ports {clk14}]
create_clock -period 14MHz -name {clk_14mhz} $clk_14mhz

set clk_32mhz [get_ports {clk32}]
create_clock -period 32MHz -name {clk_32mhz} $clk_32mhz

create_generated_clock -name {clk_7mhz}   -divide_by 2 -source $clk_14mhz [get_registers {*:zx_ula1|hc0[0]}]
create_generated_clock -name {clk_3_5mhz} -divide_by 4 -source $clk_14mhz [get_registers {*:zx_ula1|hc0[1]}]
create_generated_clock -name {clkcpu} -source [get_registers {*:zx_ula1|hc0[0]}] [get_registers {*:zx_ula1|clkcpu}]

