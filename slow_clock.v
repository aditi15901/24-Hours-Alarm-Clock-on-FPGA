
// This module is used to set an internal clock of 1 second that can used to track the passage of time in our system

module slowClock(
	input clk,
	//	The orginal clock that needs to slowed down i.e. the 100MHz clock of FPGA
	input reset,
	//	To reset the output clock signal to inital value
	output reg new_clk
	//	The slowed down clock i.e 1Hz clock signal to measure the passage of a second in alarm_module written in "alarm_module.v"
);

reg [27:0] counter;
//	It counts the number of positive edges that elapsed i.e number of clock cycles that took place

always@(posedge reset or posedge clk)

begin
    if (reset == 1'b1)
        begin
            new_clk <= 0;
            counter <= 0;					//	Resets the counter to 0
        end
    else
        begin
            counter <= counter + 1;			//	Incrementing the counter by 1 at each posedge
            if (counter == 50_000_000)		//	50,000,000 cycles of clk signal is equivalent to half time period of new_clk signal.
                begin
                    counter <= 0;
                    new_clk <= ~new_clk;	//	Half period, therefore inverts itself
                end
        end
end

endmodule
