module driver_module(
	input [6:0]	num0,
	//	The number that is to be displayed in the rightmost display
	input [6:0]	num1,
	//	The number that is to be displayed in the center-right display
	input [6:0]	num2,
	//	The number that is to be displayed in the center-left display
	input [6:0]	num3,
	//	The number that is to be displayed in the leftmost display
	input clk,
	//	For synchronicity
	input reset,
	//	To reset the display
	output reg [6:0] num,
	output reg [3:0] an
	//	These outputs should be feeded to the 7-seg display in order to display the above 4 numbers in the correct order
);

/*
	The driver module is needed because in the in-built 7-seg display of the FPGA board the corresponding segments of each
	display (left, center-left, center-right and right) have a common cathode. The anodes are different though so we can choose
	which display is to remain active. The driver module rapidy flips through the displays and the number that needs to be
	displayed in order to trick human eye into believing that each display is showing a different number.
*/

reg [1:0] counter;
//	To flip through the different anodes
reg [9:0] sclk;
//	The FPGA in-built clock was proving too fast as the numbers vanished rapidly. To counter this we slowed the flipping process a bit

always @(posedge clk) begin
	sclk <= sclk + 1;
end

always @(posedge sclk[9] or posedge reset) begin
	if(reset) begin
		counter <= 0;		//	Reset counter to 0
		an <= 4'b0000;		//	Set all anodes active
		num <= 7'b0000000;	//	Set all segments active
	end
	else	begin	
		case(counter)
		2'b00: begin
			an <= 4'b1110;	//	Leftmost display active
			num <= num0;	//	Display num0
		end
		2'b01: begin
			an <= 4'b1101;	//	Center-Left display active
			num <= num1;	//	Display num1
		end
		2'b10: begin
			an <= 4'b1011;	//	Center-Right display active
			num <= num2;	//	Display num2
		end
		2'b11: begin
			an <= 4'b0111;	//	Rightmost display active
			num <= num3;	//	Display num3
		end
		endcase
		counter <= counter + 1;	//	Increase counter to flip through states
	end
end

endmodule