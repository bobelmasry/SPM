## Clock
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

## Slide Switches (SW[15:0])
set_property PACKAGE_PIN V17 [get_ports {SW[0]}]
set_property PACKAGE_PIN V16 [get_ports {SW[1]}]
set_property PACKAGE_PIN W16 [get_ports {SW[2]}]
set_property PACKAGE_PIN W17 [get_ports {SW[3]}]
set_property PACKAGE_PIN W15 [get_ports {SW[4]}]
set_property PACKAGE_PIN V15 [get_ports {SW[5]}]
set_property PACKAGE_PIN W14 [get_ports {SW[6]}]
set_property PACKAGE_PIN W13 [get_ports {SW[7]}]
set_property PACKAGE_PIN V2  [get_ports {SW[8]}]
set_property PACKAGE_PIN T3  [get_ports {SW[9]}]
set_property PACKAGE_PIN T2  [get_ports {SW[10]}]
set_property PACKAGE_PIN R3  [get_ports {SW[11]}]
set_property PACKAGE_PIN W2  [get_ports {SW[12]}]
set_property PACKAGE_PIN U1  [get_ports {SW[13]}]
set_property PACKAGE_PIN T1  [get_ports {SW[14]}]
set_property PACKAGE_PIN R2  [get_ports {SW[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SW[*]}]

## Push Buttons
set_property PACKAGE_PIN U18 [get_ports BTNC]  ;# Center
set_property PACKAGE_PIN W19 [get_ports BTNL]  ;# Left
set_property PACKAGE_PIN T17 [get_ports BTNR]  ;# Right
set_property PACKAGE_PIN T18 [get_ports reset]  ;# Top
set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports BTNC]
set_property IOSTANDARD LVCMOS33 [get_ports BTNL]
set_property IOSTANDARD LVCMOS33 [get_ports BTNR]

## LEDs
set_property PACKAGE_PIN U16 [get_ports U16]
set_property IOSTANDARD LVCMOS33 [get_ports U16]

## 7-Segment Display Segments (active-low)
set_property PACKAGE_PIN W7 [get_ports {SEG[0]}]  ;# a
set_property PACKAGE_PIN W6 [get_ports {SEG[1]}]  ;# b
set_property PACKAGE_PIN U8 [get_ports {SEG[2]}]  ;# c
set_property PACKAGE_PIN V8 [get_ports {SEG[3]}]  ;# d
set_property PACKAGE_PIN U5 [get_ports {SEG[4]}]  ;# e
set_property PACKAGE_PIN V5 [get_ports {SEG[5]}]  ;# f
set_property PACKAGE_PIN U7 [get_ports {SEG[6]}]  ;# g
set_property IOSTANDARD LVCMOS33 [get_ports {SEG[*]}]

## 7-Segment Display Anodes (active-low)
set_property PACKAGE_PIN U2 [get_ports {AN[0]}]
set_property PACKAGE_PIN U4 [get_ports {AN[1]}]
set_property PACKAGE_PIN V4 [get_ports {AN[2]}]
set_property PACKAGE_PIN W4 [get_ports {AN[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[*]}]
