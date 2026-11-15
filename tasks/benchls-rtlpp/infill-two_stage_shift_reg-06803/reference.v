module rtlpp_06803 (
	reset,
	clock,
	Din,
	Dout
);
	input 	reset;
	input 	clock;
	input 	Din;
	output 	Dout;

	wire gnd;
	wire vcc;
	wire unknown;

	assign gnd = 1'b0;
	assign vcc = 1'b1;
	assign unknown = 1'bx;

	reg \fstate_state2_regout ;
	reg \fstate_state3_regout ;

	wire \Dout_combout ;

	// Process for fstate.state2 register
	always @(posedge clock or posedge reset) begin
		if (reset)
			\fstate_state2_regout <= 1'b0;
		else
			\fstate_state2_regout <= Din;
	end

	// Process for fstate.state3 register
	always @(posedge clock or posedge reset) begin
		if (reset)
			\fstate_state3_regout <= 1'b0;
		else
			\fstate_state3_regout <= \fstate_state2_regout ;
	end

	// Combinational logic for Dout
	assign \Dout_combout = \fstate_state3_regout ;

	// Output assignment
	assign Dout = \Dout_combout ;

endmodule