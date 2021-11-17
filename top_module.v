module clock(
	input clk,
	input [14:0] sw,
	input [3:0]  btn,
	/*
	btn[0]: reset
	btn[1]: load_time
	btn[2]: load_alarm
	btn[3]: STOP_alarm
	*/
	output [6:0] led,
	output [6:0] seg,
	output [3:0] an,
	output sound
);

wire [1:0] h_out1;
wire [3:0] h_out0, m_out0, m_out1;
wire [6:0] n0, n1, n2, n3;

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
		 									.seconds(led[5:0]),
		 									.sound(sound)
											);

display_decoder dd0(.in(m_out0), .display(n0));
display_decoder dd1(.in(m_out1), .display(n1));
display_decoder dd2(.in(h_out0), .display(n2));
display_decoder dd3(.in({1'b0, 1'b0, h_out1}), .display(n3));

driver_module dm(.clk(clk), .reset(btn[0]), .num0(n0), .num1(n1), .num2(n2), .num3(n3), .num(seg), .an(an));

endmodule
