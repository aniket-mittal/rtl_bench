module prim_cdc_rand_delay (
	src_clk,
	src_data,
	dst_clk,
	dst_data
);
	parameter signed [31:0] DataWidth = 1;
	parameter [0:0] UseSourceClock = 1;
	parameter signed [31:0] LatencyPs = 1000;
	parameter signed [31:0] JitterPs = 1000;
	input wire src_clk;
	input wire [DataWidth - 1:0] src_data;
	input wire dst_clk;
	output wire [DataWidth - 1:0] dst_data;
	assign dst_data = src_data;
endmodule
