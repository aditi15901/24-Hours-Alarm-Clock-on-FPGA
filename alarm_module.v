
/*				CS203 Project

	Implementing a Simple Alarm Clock on FPGA

    Group Members:
	1. Aditi Das 2020csb1064
	2. Jugal Chapatwala 2020csb1082
	3. Shruti Sikri 2020csb1128

*/

module alarm_clock ( 
	input reset,  
	/* reset: It is an active high reset pulse used to set the time to the input hour and minute 
	          (as defined by the hour_in1, hour_in0, minute_in1, and minute_in0 inputs) and the second to 00. It 
			  also sets the alarm value to 0.00.00, and sets the Alarm (output) LOW. For normal 
			  operation, this input pin is set to 0.
	*/
	input clock,  
	/* clock: A 100MHz input clock used to generate each real-time second */
	input [1:0] hour_in1, 
	/* hour_in1: A 2-bit input used to set the most significant hour digit of the clock (if load_time=1),
	             or the most significant hour digit of the alarm (if load_alarm=1). Valid values are 0 to 2. 
	*/ 
	input [3:0] hour_in0, 
	/* hour_in0: A 4-bit input used to set the least significant hour digit of the clock (if load_time = 1),
	             or the least significant hour digit of the alarm (if load_alarm=1). Valid values are 0 to 9.
	*/
	input [3:0] minute_in1,
	/* minute_in1: A 4-bit input used to set the most significant minute digit of the clock (if load_time=1),
				   or the most significant minute digit of the alarm (if load_alarm=1). Valid values are 0 to 5.
	*/
	input [3:0] minute_in0, 
	/* minute_in0: A 4-bit input used to set the least significant minute digit of the clock (if load_time=1),
	               or the least significant minute digit of the alarm (if load_alarm=1). Valid values are 0 to 9. 
	*/
	input load_time,  
	/* load_time: If load_time=1, the time should be set to the values on the inputs hour_in1, hour_in0, minute_in1, and 
	              minute_in0.The second time should be set to 0.If load_time=0, the clock should act normally 
				 (i.e. second should be incremented every 10 clock cycles).
	*/
	input   load_alarm,  
	/* load_alarm: If load_alarm = 1, the alarm time should be set to the values on the inputs hour_in1, hour_in0, minute_in1,
				   and minute_in0. If load_alarm = 0, then there y. 
	*/ 
	input   STOP_alarm,  
	/* STOP_alarm: If the Alarm (output) is HIGH then STOP_alarm = 1 will bring the output back to LOW. */ 
	input   Alarm_ON,  
	/* Alarm_ON: If HIGH, the alarm is ON (and Alarm will go HIGH if the alarm time equals the real time). If low the 
				 the alarm function is OFF. 
	*/
	output reg Alarm,  
	/* Alarm: This will go HIGH if the alarm time equals the current time, and Alarm_ON is HIGH. This will remain HIGH
			  until STOP_alarm goes HIGH, which will bring Alarm back to LOW.
	*/
	output [1:0]  hour_out1, 
	/* hour_out1: The most significant digit of the hour. Valid values are 0 to 2. */
	output [3:0]  hour_out0, 
	/* hour_out0: The least significant digit of the hour. Valid values are 0 to 9. */
	output [3:0]  minute_out1, 
	/* minute_out1: The most significant digit of the minute. Valid values are 0 to 5. */
	output [3:0]  minute_out0, 
	/* minute_out0: The least significant digit of the minute. Valid values are 0 to 9. */
	output [3:0]  second_out1, 
	/* second_out1: The most significant digit of the seconds. Valid values are 0 to 5. */
	output [3:0]  second_out0  
	/* second_out0: The least significant digit of the seconds. Valid values are 0 to 9. */
);
 
// Internal Signal
reg clock_1s; // 1-second clock
reg [3:0] temp_1s; // count for creating 1-s clock 
reg [5:0] temp_hour, temp_minute, temp_second; 
// counter for clock hour, minute and second
reg [1:0] clock_hour1, alarm_hour1; 
/* The most significant hour digit of the temp clock and alarm. */ 
reg [3:0] clock_hour0, alarm_hour0;
/* The least significant hour digit of the temp clock and alarm. */ 
reg [3:0] clock_min1, alarm_min1;
/* The most significant minute digit of the temp clock and alarm.*/ 
reg [3:0] clock_min0, alarm_min0;
/* The least significant minute digit of the temp clock and alarm.*/ 
reg [3:0] clock_sec1, alarm_sec1;
/* The most significant second digit of the temp clock and alarm.*/ 
reg [3:0] clock_sec0, alarm_sec0;
/* The least significant second digit of the temp clock and alarm.*/ 

/********************************************************************/ 
/***************************Function mod10***************************/
/*Function to extract the MSD ( most significant digit) of a number */
/********************************************************************/ 

function [3:0] mod_10;
	input [5:0] number;
	begin
		mod_10 = (number >=50) ? 5 : ((number >= 40)? 4 :((number >= 30)? 3 :((number >= 20)? 2 :((number >= 10)? 1 :0))));
	end
endfunction

/*************************************************/ 
/************* Clock operation********************/
/*************************************************/

always @(posedge clock_1s or posedge reset )
begin
	if(reset) begin 
		// if reset HIGH => alarm time to 00.00.00, Alarm to LOW, clock to hour_in and minute_in and seconds to 00
		alarm_hour1 <= 0;
		alarm_hour0 <= 0;
		alarm_min1 <= 0;
		alarm_min0 <= 0;
		alarm_sec1 <= 0;
		alarm_sec0 <= 0;
		temp_hour <= 0;
		temp_minute <= 0;
		temp_second <= 0;
	end 
	else begin
		if(load_alarm) begin 
			// load_alarm = 1 => set alarm clock to H_in, M_in
			alarm_hour1 <= hour_in1;
			alarm_hour0 <= hour_in0;
			alarm_min1 <= minute_in1;
			alarm_min0 <= minute_in0;
			alarm_sec1 <= 0;
			alarm_sec0 <= 0;
		end 
		if(load_time) begin 
			// load_time =1 => set time to H_in, M_in
			temp_hour <= hour_in1*10 + hour_in0;
			temp_minute <= minute_in1*10 + minute_in0;
			temp_second <= 0;
		end 
		else begin  // load_time =0 , clock operates normally
			temp_second <= temp_second + 1;
		if(temp_second >=59) begin // second > 59 then minute increases
			temp_minute <= temp_minute + 1;
			temp_second <= 0;
		end
		if(temp_minute >=59) begin // minute > 59 then hour increases
			temp_minute <= 0;
			temp_hour <= temp_hour + 1;
		end
		if(temp_hour >= 24) begin // hour > 24 then set hour to 0
			temp_hour <= 0; 
		end
		end
	end
end 

/*************************************************/ 
/*** Using Slow Clock to initialize 1 sec clock***/
/*************************************************/

slowClock sclk(.clk(clock), .new_clk(clock_1s), .reset(reset));

/*************************************************/ 
/********Output of the Clock**********************/ 
/*************************************************/ 

always @(*) begin

	if(temp_hour>=20) begin
		clock_hour1 = 2;
	end
	else begin
		if(temp_hour >=10) 
			clock_hour1  = 1;
		else
			clock_hour1 = 0;
	end
	clock_hour0 = temp_hour - clock_hour1*10; 
	clock_min1 = mod_10(temp_minute); 
	clock_min0 = temp_minute - clock_min1*10;
	clock_sec1 = mod_10(temp_second);
	clock_sec0 = temp_second - clock_sec1*10; 
end

assign hour_out1 = clock_hour1; // the most significant hour digit of the clock
assign hour_out0 = clock_hour0; // the least significant hour digit of the clock
assign minute_out1 = clock_min1; // the most significant minute digit of the clock
assign minute_out0 = clock_min0; // the least significant minute digit of the clock
assign second_out1 = clock_sec1; // the most significant second digit of the clock
assign second_out0 = clock_sec0; // the least significant second digit of the clock 

/*************************************************/ 
/**************** Alarm function******************/
/*************************************************/

always @(posedge clock_1s or posedge reset) begin
	if(reset) 
		Alarm <=0; 
	else begin
		if({alarm_hour1, alarm_hour0, alarm_min1, alarm_min0, alarm_sec1, alarm_sec0}=={clock_hour1, clock_hour0, clock_min1, clock_min0, clock_sec1, clock_sec0})
		begin // if alarm time equals clock time, it will pulse high the Alarm signal with Alarm_ON=1
			if(Alarm_ON) Alarm <= 1; 
		end
		if(STOP_alarm)
			Alarm <=0; // when STOP_alarm = 1, the Alarm signal becomes LOW
	end
end

endmodule 
