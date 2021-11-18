module tone_generator(
	input clk,
	input [21:0] tone,
	output reg sound
);

wire sound_next;
wire sound_invert;

reg [21:0] num;

always@(posedge clk) begin
    if(num == tone)
    begin
        sound <= sound_invert;
        num <= 0;
    end
    else
    begin
        sound <= sound_next;
        num <= num + 1;
    end
end

assign sound_next = sound;
assign sound_invert = ~sound;

endmodule