# CS203-Project
CS203-Project

GROUP MEMBERS :-
• Aditi Das – 2020CSB1064
• Jugal Chapatwala – 2020CSB1082
• Shruti Sikri – 2020CSB1128

IMPLEMENTING A SIMPLE ALARM CLOCK

FILES AND USES:-
  1. alarm_module.v.    : Contains the module of the base alarm clock functionality.
  2. slow_clock.v.      : Contains the module to slow down the input clock frequency (100 MHz for Basys3) to a 1Hz clock.
  3. 7segment_decoder.v : Contains the code to convert the input number (BCD format) into the code used to display it on 7 segment-display.
  4. constraint.xdc*    : Contains the information about the input/output ports used in the FPGA.
  5. 7seg-driver.v*     : Contains the code for the driver module which will help in displaying the ouput of 7segment-decoder on the FPGA display.
  
 NOTE:- Starred(*) files can be further modified.
