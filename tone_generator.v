//MODULE for alarm buzzer
//Single tone generator
//Rings when alarm goes off
//Stopes when STOP_alarm button is pressed

module tone_generator( clk, tone, sound );

input clk;
input [21:0] tone;
output reg sound;
wire sound_next;
wire sound_invert;

reg [21:0] num;
wire [21:0] next_num;

always@(posedge clk) begin
    if(num == tone)
    begin
        sound <= sound_invert;
        num <= 22'd0;
    end
    else
    begin
        sound <= sound_next;
        num <= next_num;
    end
end

assign next_num = num + 22'b1;
assign sound_next = sound;
assign sound_invert = ~sound;
endmodule
