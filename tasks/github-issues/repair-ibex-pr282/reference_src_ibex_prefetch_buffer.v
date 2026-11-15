module ibex_prefetch_buffer (
	clk_i,
	rst_ni,
	req_i,
	branch_i,
	addr_i,
	ready_i,
	valid_o,
	rdata_o,
	addr_o,
	err_o,
	instr_req_o,
	instr_gnt_i,
	instr_addr_o,
	instr_rdata_i,
	instr_err_i,
	instr_pmp_err_i,
	instr_rvalid_i,
	busy_o
);
	input wire clk_i;
	input wire rst_ni;
	input wire req_i;
	input wire branch_i;
	input wire [31:0] addr_i;
	input wire ready_i;
	output wire valid_o;
	output wire [31:0] rdata_o;
	output wire [31:0] addr_o;
	output wire err_o;
	output wire instr_req_o;
	input wire instr_gnt_i;
	output wire [31:0] instr_addr_o;
	input wire [31:0] instr_rdata_i;
	input wire instr_err_i;
	input wire instr_pmp_err_i;
	input wire instr_rvalid_i;
	output wire busy_o;
	localparam [31:0] NUM_REQS = 2;
	wire valid_req;
	wire valid_req_d;
	reg valid_req_q;
	wire gnt_or_pmp_err;
	wire rvalid_or_pmp_err;
	wire [1:0] rdata_outstanding_n;
	wire [1:0] rdata_outstanding_s;
	reg [1:0] rdata_outstanding_q;
	wire [1:0] branch_abort_n;
	wire [1:0] branch_abort_s;
	reg [1:0] branch_abort_q;
	reg [31:0] instr_addr_q;
	wire [31:0] fetch_addr;
	wire [31:0] instr_addr;
	wire [31:0] instr_addr_w_aligned;
	wire addr_valid;
	reg pmp_err_q;
	wire instr_or_pmp_err;
	wire fifo_valid;
	wire fifo_ready;
	wire fifo_clear;
	assign busy_o = |rdata_outstanding_q | instr_req_o;
	assign instr_or_pmp_err = instr_err_i | pmp_err_q;
	assign fifo_clear = branch_i;
	ibex_fetch_fifo fifo_i(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.clear_i(fifo_clear),
		.in_valid_i(fifo_valid),
		.in_addr_i(instr_addr_q),
		.in_rdata_i(instr_rdata_i),
		.in_err_i(instr_or_pmp_err),
		.in_ready_o(fifo_ready),
		.out_valid_o(valid_o),
		.out_ready_i(ready_i),
		.out_rdata_o(rdata_o),
		.out_addr_o(addr_o),
		.out_err_o(err_o)
	);
	assign valid_req = (req_i & (fifo_ready | branch_i)) & ~&rdata_outstanding_q;
	assign gnt_or_pmp_err = instr_gnt_i | (pmp_err_q & ~branch_i);
	assign rvalid_or_pmp_err = instr_rvalid_i | pmp_err_q;
	assign valid_req_d = (branch_i | valid_req_q) & ~(valid_req & instr_gnt_i);
	assign addr_valid = (branch_i | ((req_i & fifo_ready) & ~rdata_outstanding_q[0])) | ((rvalid_or_pmp_err & ~branch_abort_q[0]) & ((valid_req & instr_gnt_i) | rdata_outstanding_q[1]));
	assign fetch_addr = {instr_addr_q[31:2], 2'b00} + 32'd4;
	assign instr_addr = (branch_i ? addr_i : (valid_req_q ? instr_addr_q : fetch_addr));
	assign instr_addr_w_aligned = {instr_addr[31:2], 2'b00};
	genvar _gv_i_3;
	generate
		for (_gv_i_3 = 0; _gv_i_3 < NUM_REQS; _gv_i_3 = _gv_i_3 + 1) begin : g_outstanding_reqs
			localparam i = _gv_i_3;
			if (i == 0) begin : g_req0
				assign rdata_outstanding_n[i] = (valid_req & gnt_or_pmp_err) | rdata_outstanding_q[i];
				assign branch_abort_n[i] = (branch_i & rdata_outstanding_q[i]) | branch_abort_q[i];
			end
			else begin : g_reqtop
				assign rdata_outstanding_n[i] = ((valid_req & instr_gnt_i) & (&rdata_outstanding_q[i - 1:0])) | rdata_outstanding_q[i];
				assign branch_abort_n[i] = (branch_i & rdata_outstanding_q[i]) | branch_abort_q[i];
			end
		end
	endgenerate
	assign rdata_outstanding_s = (rvalid_or_pmp_err ? {1'b0, rdata_outstanding_n[1:1]} : rdata_outstanding_n);
	assign branch_abort_s = (rvalid_or_pmp_err ? {1'b0, branch_abort_n[1:1]} : branch_abort_n);
	assign fifo_valid = (rdata_outstanding_q[0] & ~branch_abort_q[0]) & rvalid_or_pmp_err;
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni) begin
			valid_req_q <= 1'b0;
			rdata_outstanding_q <= 'b0;
			branch_abort_q <= 'b0;
		end
		else begin
			valid_req_q <= valid_req_d;
			rdata_outstanding_q <= rdata_outstanding_s;
			branch_abort_q <= branch_abort_s;
		end
	always @(posedge clk_i)
		if (addr_valid) begin
			instr_addr_q <= instr_addr;
			pmp_err_q <= instr_pmp_err_i;
		end
	assign instr_req_o = valid_req;
	assign instr_addr_o = instr_addr_w_aligned;
endmodule
