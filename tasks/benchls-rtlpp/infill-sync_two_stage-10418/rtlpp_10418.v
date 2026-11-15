module rtlpp_10418 (
	reset,
	clock,
	Din,
	Dout);
input 	reset;
input 	clock;
input 	Din;
output 	Dout;

reg fstate_state2;
reg fstate_state3;
wire Dout1_combout;

[MASKED]

assign Dout1_combout = fstate_state3 & ~reset;
assign Dout = Dout1_combout;

endmodule