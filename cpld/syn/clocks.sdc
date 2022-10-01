create_clock -period 28.8MHz -name {clk_28mhz} [get_ports {clk28}]

# clkcpu up to 14 MHz
create_generated_clock -name {clkcpu} -divide_by 2 -source [get_ports {clk28}] [get_registers {cpucontrol:cpucontrol0|clkcpu}]

derive_clock_uncertainty
derive_clocks -period 7.2MHz

# One screen read cycle = ~71ns. SRAM speed = 55ns
# So we have about 16ns to setup control signals (n_vwr, va) and read back data (vd)
set_max_delay -from [get_pins -compatibility_mode screen0|*] -to [get_ports n_vwr] 13.3ns
set_max_delay -from [get_pins -compatibility_mode screen0|*] -to [get_ports va[*]] 13.3ns
set_max_delay -from [get_ports vd[*]] -to [get_pins -compatibility_mode screen0|*] 2.7ns
