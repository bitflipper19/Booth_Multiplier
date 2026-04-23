## Clock signal
set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS33 } [get_ports { clk }];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk}];

## Inputs

# mxr[3:0]  (MSB:LSB = R15, M13, L16, J15)
set_property -dict { PACKAGE_PIN R15 IOSTANDARD LVCMOS33 } [get_ports { mxr[3] }];
set_property -dict { PACKAGE_PIN M13 IOSTANDARD LVCMOS33 } [get_ports { mxr[2] }];
set_property -dict { PACKAGE_PIN L16 IOSTANDARD LVCMOS33 } [get_ports { mxr[1] }];
set_property -dict { PACKAGE_PIN J15 IOSTANDARD LVCMOS33 } [get_ports { mxr[0] }];

# mxd[3:0]  (MSB:LSB = R13, U18, T18, R17)
set_property -dict { PACKAGE_PIN R13 IOSTANDARD LVCMOS33 } [get_ports { mxd[3] }];
set_property -dict { PACKAGE_PIN U18 IOSTANDARD LVCMOS33 } [get_ports { mxd[2] }];
set_property -dict { PACKAGE_PIN T18 IOSTANDARD LVCMOS33 } [get_ports { mxd[1] }];
set_property -dict { PACKAGE_PIN R17 IOSTANDARD LVCMOS33 } [get_ports { mxd[0] }];

# Control signals
set_property -dict { PACKAGE_PIN V10 IOSTANDARD LVCMOS33 } [get_ports { rst }];
set_property -dict { PACKAGE_PIN U11 IOSTANDARD LVCMOS33 } [get_ports { start }];

## Outputs

# result[7:0]  (MSB:LSB = U17:H17)
set_property -dict { PACKAGE_PIN U17 IOSTANDARD LVCMOS33 } [get_ports { result[7] }];
set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 } [get_ports { result[6] }];
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports { result[5] }];
set_property -dict { PACKAGE_PIN R18 IOSTANDARD LVCMOS33 } [get_ports { result[4] }];
set_property -dict { PACKAGE_PIN N14 IOSTANDARD LVCMOS33 } [get_ports { result[3] }];
set_property -dict { PACKAGE_PIN J13 IOSTANDARD LVCMOS33 } [get_ports { result[2] }];
set_property -dict { PACKAGE_PIN K15 IOSTANDARD LVCMOS33 } [get_ports { result[1] }];
set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 } [get_ports { result[0] }];

# done
set_property -dict { PACKAGE_PIN V11 IOSTANDARD LVCMOS33 } [get_ports { done }];