/*				CS203 Project

	Implementing a Simple Alarm Clock on FPGA

    Group Members:
	1. Aditi Das 2020csb1064
	2. Jugal Chapatwala 2020csb1082
	3. Shruti Sikri 2020csb1128

*/

module clock(
	input clk,
	//	Connect FPGA clock here
	input [14:0] sw,
	//	Connect all the FPGA switches here
	input [3:0]  btn,
	//	Connect all the FPGA buttons here
	/*
	btn[0]: RESET
	btn[1]: LOAD_TIME
	btn[2]: LOAD_ALARM
	btn[3]: STOP_ALARM
	*/
	output [6:0] led,
	//	Connect them with FPGA leds
	output [6:0] seg,
	output [3:0] an
	//	Connect them with the 7-seg display of the FPGA
);

wire [1:0] h_out1;
wire [3:0] h_out0, m_out0, m_out1;
wire [6:0] n0, n1, n2, n3;

//	Setting up connections for the alarm_module written in "alarm_module.v"
alarm_clock aclk(.clock(clk), .reset(btn[0]), .minute_in0({sw[3], sw[2], sw[1], sw[0]}),
											.minute_in1({sw[7], sw[6], sw[5], sw[4]}),
											.hour_in0({sw[11], sw[10], sw[9], sw[8]}),
											.hour_in1({sw[13], sw[12]}),
											.load_time(btn[1]), .load_alarm(btn[2]), .STOP_alarm(btn[3]),
											.Alarm_ON(sw[14]), .Alarm(led[6]),
											.hour_out0(h_out0),
											.hour_out1(h_out1),
											.minute_out0(m_out0),
											.minute_out1(m_out1),
											.seconds(led[5:0])
											);

//	Setting up connections for display_decoder module written in "7segment_decoder.v"
display_decoder dd0(.in(m_out0), .display(n0));
display_decoder dd1(.in(m_out1), .display(n1));
display_decoder dd2(.in(h_out0), .display(n2));
display_decoder dd3(.in({1'b0, 1'b0, h_out1}), .display(n3));

//	Setting up connections for driver_module written in "7seg_driver.v"
driver_module dm(.clk(clk), .reset(btn[0]), .num0(n0), .num1(n1), .num2(n2), .num3(n3), .num(seg), .an(an));

endmodule