# CS203-Project
CS203-Project

GROUP MEMBERS :-
• Aditi Das – 2020CSB1064
• Jugal Chapatwala – 2020CSB1082
• Shruti Sikri – 2020CSB11280

IMPLEMENTING A SIMPLE ALARM CLOCK WITH FPGA BOARD (BASYS3) AND PIEZO BUZZER

FILES AND USES:-
  1. alarm_module.v.      : Contains the module of the base Alarm Clock functionality.
  2. slow_clock.v         : Contains the module to slow down the input clock frequency (100 MHz for Basys3) to a 1Hz clock.
  3. 7segment_decoder.v.  : Contains the code to convert the input number (BCD format) into the code used to display it on 7 segment-display.
  4. constraint.xdc       : Contains the information about the input/output ports used in the FPGA.
  5. 7seg-driver.v        : Contains the code for the driver module which will help in displaying the output of 7segment-decoder on the FPGA display.
  6. top_module.v         : Takes input from FPGA and displays the output in 7segment display after calling the alarm_clock and display_decoder modules.
  7. Module Hierarchy.pdf : Contains the module hierarchy of our Project.
  8. tone_generator.v     : Contains the module for generating the tone of the piezo buzzer when the Alarm goes off.
  
