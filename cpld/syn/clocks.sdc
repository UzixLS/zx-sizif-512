create_clock -period 28.8MHz -name {clk_28mhz} [get_ports {clk28}]

# clkcpu up to 14 MHz
create_generated_clock -name {clkcpu} -divide_by 2 -source [get_ports {clk28}] [get_registers {cpu0|clkcpu}]

derive_clock_uncertainty
derive_clocks -period 7.2MHz

# set some small values to make fitter pay attention
set_max_delay -to [get_ports xd[*]] 19ns
set_max_delay -from [get_registers mem0|xd_out_latch[*]] -to [get_ports xd[*]] 13ns
set_max_delay -to [get_ports n_vwr] 7.5ns
set_max_delay -to [get_ports vd[*]] 9.5ns
set_max_delay -from [get_ports vd[*]] 2.75ns
set_max_delay -from [get_ports n_rd] 2.2ns
set_max_delay -from [get_ports n_wr] 2.2ns
set_max_delay -from [get_ports n_mreq] 2.2ns
set_max_delay -from [get_ports n_iorqge] 2.2ns
set_max_delay -from [get_ports n_rfsh] 2.2ns
