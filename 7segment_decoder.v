//decoder module for 7segment display
//design sources

module display_decoder(
    input [3:0] in,
	//	A 4-bit number that needs to be converted to 7-segment code
    output reg [6:0] display
	//	The output 7segment code for the given number
);

always @(in)
begin
  case(in)
  0: display= 7'b0000001; //displays 0 on the seven segment
  1: display= 7'b1001111; //displays 1 on the seven segment
  2: display= 7'b0010010; //displays 2 on the seven segment
  3: display= 7'b0000110; //displays 3 on the seven segment
  4: display= 7'b1001100; //displays 4 on the seven segment
  5: display= 7'b0100100; //displays 5 on the seven segment
  6: display= 7'b0100000; //displays 6 on the seven segment
  7: display= 7'b0001111; //displays 7 on the seven segment
  8: display= 7'b0000000; //displays 8 on the seven segment
  9: display= 7'b0000100; //displays 9 on the seven segment
  endcase
end

endmodule
