module clock_follow (
	input clk_in,
	output clk_out
);

reg rp = 1'b0;
reg rn = 1'b0;

always @(posedge clk_in) begin
	rp <= ~rp;
end

[MASKED]

assign clk_out = ~rp ^ rn;

endmodule