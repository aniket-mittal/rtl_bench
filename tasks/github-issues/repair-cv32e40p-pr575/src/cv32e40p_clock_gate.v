module cv32e40p_clock_gate (
	clk_i,
	en_i,
	scan_cg_en_i,
	clk_o
);
	reg _sv2v_0;
	input wire clk_i;
	input wire en_i;
	input wire scan_cg_en_i;
	output wire clk_o;
	reg clk_en;
	always @(*) begin
		if (_sv2v_0)
			;
		if (clk_i == 1'b0)
			clk_en <= en_i | scan_cg_en_i;
	end
	assign clk_o = clk_i & clk_en;
	initial _sv2v_0 = 0;
endmodule
