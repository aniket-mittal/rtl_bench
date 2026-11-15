module rtlpp_06349 (
	X,
	RST,
	CLK,
	y
);
	input 	X;
	input 	RST;
	input 	CLK;
	output  y;

	wire gnd, vcc, unknown;
	reg PR_STATE_B, PR_STATE_C;
	wire Selector1_0_combout, NX_STATE_C_0_combout, y_1_combout;
	
	assign gnd = 1'b0;
	assign vcc = 1'b1;
	assign unknown = 1'bx;
	
	// Clock Control
	wire CLK_out;
	assign CLK_out = CLK;
	
	// RST Control
	wire RST_out;
	assign RST_out = RST;
	
	// FSM logic
	assign Selector1_0_combout = (X & PR_STATE_C);  // Logic for Selector1~0
	assign NX_STATE_C_0_combout = (X & PR_STATE_B); // Logic for NX_STATE.C~0
	assign y_1_combout = (PR_STATE_C | X);          // Logic for y~1
	
	// PR_STATE.B register logic
	always @(posedge CLK_out or posedge RST_out) begin
		if (RST_out) begin
			PR_STATE_B <= 1'b0;
		end else begin
			PR_STATE_B <= Selector1_0_combout;
		end
	end
	
	// PR_STATE.C register logic
	always @(posedge CLK_out or posedge RST_out) begin
		if (RST_out) begin
			PR_STATE_C <= 1'b0;
		end else begin
			PR_STATE_C <= NX_STATE_C_0_combout;
		end
	end
	
	// Output y logic
	assign y = ~y_1_combout;

endmodule