# CS203-Project

**GROUP MEMBERS :-**

* Aditi Das – 2020CSB1064
* Jugal Chapatwala – 2020CSB1082
* Shruti Sikri – 2020CSB1128

---

**IMPLEMENTING A SIMPLE ALARM CLOCK ON FPGA BOARD (BASYS3) WITH PIEZO BUZZER**

### FILES AND USES:-

1. **alarm_module.v**       : Contains the module of the base Alarm Clock functionality.
2. **slow_clock.v**         : Contains the module to slow down the input clock frequency (100 MHz for Basys3) to a 1Hz clock.
3. **7segment_decoder.v**   : Contains the code to convert the input number (BCD format) into the code used to display it on 7 segment-display.
4. **constraint.xdc**       : Contains the information about the input/output ports used in the FPGA.
5. **7seg-driver.v**        : Contains the code for the driver module which will help in displaying the output of 7segment-decoder on the FPGA display.
6. **top_module.v**         : Instantiates and sets up connections for all the sub-modules. It also provides interface of variables that are used in                                               "constraint.xcd" file to set-up connections with buttons, switches, leds and displays.
9. **Module Hierarchy.pdf** : Contains the module hierarchy of our Project.
10. **tone_generator.v**    : Contains the module for generating the tone of the piezo buzzer when the Alarm goes off.

### GUIDE FOR FPGA BOARD:-

#### Switches-

1. **sw 0-3**                  : LSD of minute input.
2. **sw 4-7**                  : MSD of minute input.
3. **sw 8-11**                 : LSD of hour input.
4. **sw 12-13**                : MSD of hour input.
5. **sw 15**                   : To turn on/off the alarm functionality.

#### LEDs:-
1. **Leds 0-5**               : Displays the seconds in binary notation. It displays seconds from 0 to 59, after which it resets to 0 and starts over. 
                                Hence, LEDs 0-5 glow according to the current second in binary.
2. **Led 15**                 : Glows when the Alarm sets off along with the Buzzer tone.


#### Buttons-

1. **Center Button**          : Resets the clock i.e. alarm time and clock time to 24:00 and 00:00 respectively.
2. **Right Button**           : Loads the alarm time onto the clock.
3. **Left Button**            : Loads the clock time.
4. **Up Button**              : To bring the alarm signal to LOW.

A **Piezo Buzzer** is connected to the FPGA board through a breadboard and connecting wires. It goes off when Alarm is high.
