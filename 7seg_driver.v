
`timescale 1ns/1ps

module driver_module(
	input [6:0]	num0,
	input [6:0]	num1,
	input [6:0]	num2,
	input [6:0]	num3,
	input clk,
	input reset,
	output reg [6:0] num,
	output reg [3:0] an
);

reg [1:0] counter;

initial begin
	counter <= 0;
end

always @(posedge clk or posedge reset) begin
	if(reset) begin
		counter <= 0;
		an <= 4'b0000;
		num <= 7'b0000000;
	end
	else	begin
		case(counter)
		2'b00: begin
			an <= 4'b1110;
			num <= num0;
		end
		2'b01: begin
			an <= 4'b1101;
			num <= num1;
		end
		2'b10: begin
			an <= 4'b1011;
			num <= num2;
		end
		2'b11: begin
			an <= 4'b0111;
			num <= num3;
		end
		endcase
		counter <= counter + 1;
	end
end

endmodule