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

always @(posedge clock or posedge reset) begin
	if (reset) begin
		fstate_state2 <= 1'b0;
		fstate_state3 <= 1'b0;
	end else begin
		fstate_state2 <= Din;
		fstate_state3 <= fstate_state2 & ~reset;
	end
end

assign Dout1_combout = fstate_state3 & ~reset;
assign Dout = Dout1_combout;

endmodule