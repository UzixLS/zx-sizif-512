create_clock -period 14.4MHz -name {clk_14mhz} [get_ports {clk14}]
create_clock -period 32.2MHz -name {clk_32mhz} [get_ports {clk32}]

derive_clock_uncertainty
derive_clocks -period 7.2MHz
