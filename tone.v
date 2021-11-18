
//	This module takes the tone as input and generates a sound signal that can be directly fed to the buzzer to produce a sound

module tone_generator(
	input clk,
	//	The clk signal is needed to calculate time and also for synchronicity
	input [21:0] tone,
	//	This input is needed to set how many clock cycles should make up 1 half period of the output sound signal
	output reg sound
	//	The output sound signal to be provided to the piezo buzzer to generate sound
);

reg [21:0] num;

always@(posedge clk) begin
    if(num == tone)	begin
        sound <= ~sound;	// Invert the output signal when number of clock cycles elapsed is equal to tone
        num <= 0;			//	Set the counter back to 0
    end
    else    begin
        num <= num + 1;		// Increment counter by 1
    end
end

endmodule