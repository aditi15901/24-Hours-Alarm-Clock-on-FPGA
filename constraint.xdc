##constraint file for alarm clock

##	Switches sw 0-3:	LSD of minute input.
##	Switches sw 4-7:	MSD of minute input.
##	Switches sw 8-11:	LSD of hour input.
##	Switches sw 12-13:	MSD of hour input.
##	Switch 	 sw 15:		To turn on/off the alarm functionality.
##
##	Center Button:		Reset the clock.
##	Left Button:		Load the alarm time onto the clock.
##	Right Button:		Load the clock time.
##	Up Button:		To bring the alarm signal to LOW.
##
##	Display an 0:		LSD of minute output.
##	Display an 1:		MSD of minute output.
##	Display an 2:		LSD of hour output.
##	Display an 3:		MSD of hour output.


## Clock signal
set_property PACKAGE_PIN W5 [get_ports clock]							
	set_property IOSTANDARD LVCMOS33 [get_ports clock]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clock]
	
## Switches

#bits of 2nd digit of the minute of the clock starting from LSB to MSB
set_property PACKAGE_PIN V17 [get_ports {minute_in0[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {minute_in0[0]}]
set_property PACKAGE_PIN V16 [get_ports {minute_in0[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {minute_in0[1]}]
set_property PACKAGE_PIN W16 [get_ports {minute_in0[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {minute_in0[2]}]
set_property PACKAGE_PIN W17 [get_ports {minute_in0[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {minute_in0[3]}]
	
#bits of 1st digit of the minute of the clock starting from LSB to MSB
set_property PACKAGE_PIN W15 [get_ports {minute_in1[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {minute_in1[0]}]
set_property PACKAGE_PIN V15 [get_ports {minute_in1[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {minute_in1[1]}]
set_property PACKAGE_PIN W14 [get_ports {minute_in1[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {minute_in1[2]}]
set_property PACKAGE_PIN W13 [get_ports {minute_in1[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {minute_in1[3]}]
	
#bits of 2nd digit of the hour of the clock starting from LSB to MSB
set_property PACKAGE_PIN V2 [get_ports {hour_in0[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {hour_in0[0]}]
set_property PACKAGE_PIN T3 [get_ports {hour_in0[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {hour_in0[1]}]
set_property PACKAGE_PIN T2 [get_ports {hour_in0[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {hour_in0[2]}]
set_property PACKAGE_PIN R3 [get_ports {hour_in0[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {hour_in0[3]}]
	
#bits of 1st digit of the hour of the clock starting from LSB to MSB
set_property PACKAGE_PIN W2 [get_ports {hour_in1[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {hour_in1[0]}]
set_property PACKAGE_PIN U1 [get_ports {hour_in0[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {hour_in0[1]}]
	
##switch for Alarm_ON
set_property PACKAGE_PIN R2 [get_ports {Alarm_ON}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Alarm_ON}]
	
#set_property PACKAGE_PIN T1 [get_ports {sw[15]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[15]}]
 
## LEDs

#6-bit seconds as LEDs. 
set_property PACKAGE_PIN U16 [get_ports {seconds[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seconds[0]}]
set_property PACKAGE_PIN E19 [get_ports {seconds[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seconds[1]}]
set_property PACKAGE_PIN U19 [get_ports {seconds[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seconds[2]}]
set_property PACKAGE_PIN V19 [get_ports {seconds[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seconds[3]}]
set_property PACKAGE_PIN W18 [get_ports {seconds[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seconds[4]}]
set_property PACKAGE_PIN U15 [get_ports {seconds[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seconds[5]}]
	

#set_property PACKAGE_PIN U14 [get_ports {led[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
#set_property PACKAGE_PIN V14 [get_ports {led[7]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]
#set_property PACKAGE_PIN V13 [get_ports {led[8]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[8]}]
#set_property PACKAGE_PIN V3 [get_ports {led[9]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[9]}]
#set_property PACKAGE_PIN W3 [get_ports {led[10]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[10]}]
#set_property PACKAGE_PIN U3 [get_ports {led[11]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[11]}]
#set_property PACKAGE_PIN P3 [get_ports {led[12]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[12]}]
#set_property PACKAGE_PIN N3 [get_ports {led[13]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[13]}]
#set_property PACKAGE_PIN P1 [get_ports {led[14]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[14]}]

##LED glows when alarm goes off
set_property PACKAGE_PIN L1 [get_ports {Alarm}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {Alarm}]

	
##Buttons

##reset button	CENTRAL BUTTON
set_property PACKAGE_PIN U18 [get_ports reset]	
	set_property IOSTANDARD LVCMOS33 [get_ports reset]

##STOP_alarm UP BUTTON
set_property PACKAGE_PIN T18 [get_ports STOP_alarm]						
	set_property IOSTANDARD LVCMOS33 [get_ports STOP_alarm]
	
##load_alarm  LEFT BUTTON
set_property PACKAGE_PIN W19 [get_ports load_alarm]						
	set_property IOSTANDARD LVCMOS33 [get_ports load_alarm]
	
#load_time RIGHT BUTTON
set_property PACKAGE_PIN T17 [get_ports load_time]						
	set_property IOSTANDARD LVCMOS33 [get_ports load_time]
	

#set_property PACKAGE_PIN U17 [get_ports btnD]						
	#set_property IOSTANDARD LVCMOS33 [get_ports btnD]
 
 
 
 
