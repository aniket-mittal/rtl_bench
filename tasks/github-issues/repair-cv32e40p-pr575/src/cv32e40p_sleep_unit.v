module cv32e40p_sleep_unit (
	clk_ungated_i,
	rst_n,
	clk_gated_o,
	scan_cg_en_i,
	core_sleep_o,
	fetch_enable_i,
	fetch_enable_o,
	if_busy_i,
	ctrl_busy_i,
	lsu_busy_i,
	apu_busy_i,
	pulp_clock_en_i,
	p_elw_start_i,
	p_elw_finish_i,
	debug_p_elw_no_sleep_i,
	wake_from_sleep_i
);
	parameter PULP_CLUSTER = 0;
	input wire clk_ungated_i;
	input wire rst_n;
	output wire clk_gated_o;
	input wire scan_cg_en_i;
	output wire core_sleep_o;
	input wire fetch_enable_i;
	output wire fetch_enable_o;
	input wire if_busy_i;
	input wire ctrl_busy_i;
	input wire lsu_busy_i;
	input wire apu_busy_i;
	input wire pulp_clock_en_i;
	input wire p_elw_start_i;
	input wire p_elw_finish_i;
	input wire debug_p_elw_no_sleep_i;
	input wire wake_from_sleep_i;
	reg fetch_enable_q;
	wire fetch_enable_d;
	reg core_busy_q;
	wire core_busy_d;
	reg p_elw_busy_q;
	wire p_elw_busy_d;
	wire clock_en;
	assign fetch_enable_d = (fetch_enable_i ? 1'b1 : fetch_enable_q);
	generate
		if (PULP_CLUSTER) begin : PULP_SLEEP
			assign core_busy_d = (p_elw_busy_d ? if_busy_i || apu_busy_i : 1'b1);
			assign clock_en = fetch_enable_q && (pulp_clock_en_i || core_busy_q);
			assign core_sleep_o = (p_elw_busy_d && !core_busy_q) && !debug_p_elw_no_sleep_i;
			assign p_elw_busy_d = (p_elw_start_i ? 1'b1 : (p_elw_finish_i ? 1'b0 : p_elw_busy_q));
		end
		else begin : NO_PULP_SLEEP
			assign core_busy_d = ((if_busy_i || ctrl_busy_i) || lsu_busy_i) || apu_busy_i;
			assign clock_en = fetch_enable_q && (wake_from_sleep_i || core_busy_q);
			assign core_sleep_o = fetch_enable_q && !clock_en;
			assign p_elw_busy_d = 1'b0;
		end
	endgenerate
	always @(posedge clk_ungated_i or negedge rst_n)
		if (rst_n == 1'b0) begin
			core_busy_q <= 1'b0;
			p_elw_busy_q <= 1'b0;
			fetch_enable_q <= 1'b0;
		end
		else begin
			core_busy_q <= core_busy_d;
			p_elw_busy_q <= p_elw_busy_d;
			fetch_enable_q <= fetch_enable_d;
		end
	assign fetch_enable_o = fetch_enable_q;
	cv32e40p_clock_gate core_clock_gate_i(
		.clk_i(clk_ungated_i),
		.en_i(clock_en),
		.scan_cg_en_i(scan_cg_en_i),
		.clk_o(clk_gated_o)
	);
endmodule
