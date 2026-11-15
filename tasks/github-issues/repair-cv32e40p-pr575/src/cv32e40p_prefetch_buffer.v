module cv32e40p_prefetch_buffer (
	clk,
	rst_n,
	req_i,
	branch_i,
	branch_addr_i,
	hwlp_jump_i,
	hwlp_target_i,
	fetch_ready_i,
	fetch_valid_o,
	fetch_rdata_o,
	instr_req_o,
	instr_gnt_i,
	instr_addr_o,
	instr_rdata_i,
	instr_rvalid_i,
	instr_err_i,
	instr_err_pmp_i,
	busy_o
);
	parameter PULP_OBI = 0;
	parameter PULP_XPULP = 1;
	input wire clk;
	input wire rst_n;
	input wire req_i;
	input wire branch_i;
	input wire [31:0] branch_addr_i;
	input wire hwlp_jump_i;
	input wire [31:0] hwlp_target_i;
	input wire fetch_ready_i;
	output wire fetch_valid_o;
	output wire [31:0] fetch_rdata_o;
	output wire instr_req_o;
	input wire instr_gnt_i;
	output wire [31:0] instr_addr_o;
	input wire [31:0] instr_rdata_i;
	input wire instr_rvalid_i;
	input wire instr_err_i;
	input wire instr_err_pmp_i;
	output wire busy_o;
	localparam FIFO_DEPTH = 2;
	localparam [31:0] FIFO_ADDR_DEPTH = 1;
	wire trans_valid;
	wire trans_ready;
	wire [31:0] trans_addr;
	wire fifo_flush;
	wire fifo_flush_but_first;
	wire [FIFO_ADDR_DEPTH:0] fifo_cnt;
	wire [31:0] fifo_rdata;
	wire fifo_push;
	wire fifo_pop;
	wire resp_valid;
	wire [31:0] resp_rdata;
	wire resp_err;
	wire fifo_empty;
	cv32e40p_prefetch_controller #(
		.DEPTH(FIFO_DEPTH),
		.PULP_OBI(PULP_OBI),
		.PULP_XPULP(PULP_XPULP)
	) prefetch_controller_i(
		.clk(clk),
		.rst_n(rst_n),
		.req_i(req_i),
		.branch_i(branch_i),
		.branch_addr_i(branch_addr_i),
		.busy_o(busy_o),
		.hwlp_jump_i(hwlp_jump_i),
		.hwlp_target_i(hwlp_target_i),
		.trans_valid_o(trans_valid),
		.trans_ready_i(trans_ready),
		.trans_addr_o(trans_addr),
		.resp_valid_i(resp_valid),
		.fetch_ready_i(fetch_ready_i),
		.fetch_valid_o(fetch_valid_o),
		.fifo_push_o(fifo_push),
		.fifo_pop_o(fifo_pop),
		.fifo_flush_o(fifo_flush),
		.fifo_flush_but_first_o(fifo_flush_but_first),
		.fifo_cnt_i(fifo_cnt),
		.fifo_empty_i(fifo_empty)
	);
	wire fifo_full;
	cv32e40p_fifo #(
		.FALL_THROUGH(1'b0),
		.DATA_WIDTH(32),
		.DEPTH(FIFO_DEPTH)
	) fifo_i(
		.clk_i(clk),
		.rst_ni(rst_n),
		.flush_i(fifo_flush),
		.flush_but_first_i(fifo_flush_but_first),
		.testmode_i(1'b0),
		.full_o(fifo_full),
		.empty_o(fifo_empty),
		.cnt_o(fifo_cnt),
		.data_i(resp_rdata),
		.push_i(fifo_push),
		.data_o(fifo_rdata),
		.pop_i(fifo_pop)
	);
	assign fetch_rdata_o = (fifo_empty ? resp_rdata : fifo_rdata);
	cv32e40p_obi_interface #(.TRANS_STABLE(0)) instruction_obi_i(
		.clk(clk),
		.rst_n(rst_n),
		.trans_valid_i(trans_valid),
		.trans_ready_o(trans_ready),
		.trans_addr_i({trans_addr[31:2], 2'b00}),
		.trans_we_i(1'b0),
		.trans_be_i(4'b1111),
		.trans_wdata_i(32'b00000000000000000000000000000000),
		.trans_atop_i(6'b000000),
		.resp_valid_o(resp_valid),
		.resp_rdata_o(resp_rdata),
		.resp_err_o(resp_err),
		.obi_req_o(instr_req_o),
		.obi_gnt_i(instr_gnt_i),
		.obi_addr_o(instr_addr_o),
		.obi_we_o(),
		.obi_be_o(),
		.obi_wdata_o(),
		.obi_atop_o(),
		.obi_rdata_i(instr_rdata_i),
		.obi_rvalid_i(instr_rvalid_i),
		.obi_err_i(instr_err_i)
	);
endmodule
