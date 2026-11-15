module prim_flop_2sync (
	clk_i,
	rst_ni,
	d_i,
	q_o
);
	parameter signed [31:0] Width = 16;
	parameter [Width - 1:0] ResetValue = 1'sb0;
	parameter signed [31:0] CdcLatencyPs = 1000;
	parameter signed [31:0] CdcJitterPs = 1000;
	input clk_i;
	input rst_ni;
	input [Width - 1:0] d_i;
	output wire [Width - 1:0] q_o;
	wire [Width - 1:0] d_o;
	prim_cdc_rand_delay #(
		.DataWidth(Width),
		.UseSourceClock(0),
		.LatencyPs(CdcLatencyPs),
		.JitterPs(CdcJitterPs)
	) u_prim_cdc_rand_delay(
		.src_clk(),
		.src_data(d_i),
		.dst_clk(clk_i),
		.dst_data(d_o)
	);
	wire [Width - 1:0] intq;
	prim_flop #(
		.Width(Width),
		.ResetValue(ResetValue)
	) u_sync_1(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.d_i(d_o),
		.q_o(intq)
	);
	prim_flop #(
		.Width(Width),
		.ResetValue(ResetValue)
	) u_sync_2(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.d_i(intq),
		.q_o(q_o)
	);
endmodule
