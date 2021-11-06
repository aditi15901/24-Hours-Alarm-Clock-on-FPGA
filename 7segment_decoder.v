//decoder module for 7segment displaylay
//design sources

module display_decoder(
    input [3:0] in,
    output reg [6:0] display
);

always @(in)
begin
  case(in)
  0: display= 7'b0000001; //displays zero on the seven segment
  1: display= 7'b1001111; //displays 1
  2: display= 7'b0010010; //displays 2
  3: display= 7'b0000110; //displays 3
  4: display= 7'b1001100; //displays 4
  5: display= 7'b0100100; //displays 5
  6: display= 7'b0100000; //displays 6
  7: display= 7'b0001111; //displays 7
  8: display= 7'b0000000; //displays 8
  9: display= 7'b0001100; //displays 9
  endcase
end

endmodule