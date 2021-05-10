create_clock -period 28.8MHz -name {clk_28mhz} [get_ports {clk28}]

# clkcpu up to 14 MHz
create_generated_clock -name {clkcpu} -divide_by 4 -source [get_ports {clk28}] [get_registers {cpucontrol:cpucontrol0|clkcpu}]

derive_clock_uncertainty
derive_clocks -period 7.2MHz
