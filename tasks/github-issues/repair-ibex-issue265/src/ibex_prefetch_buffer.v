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
	reg _sv2v_0;
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
	output reg instr_req_o;
	input wire instr_gnt_i;
	output wire [31:0] instr_addr_o;
	input wire [31:0] instr_rdata_i;
	input wire instr_err_i;
	input wire instr_pmp_err_i;
	input wire instr_rvalid_i;
	output wire busy_o;
	reg [1:0] pf_fsm_cs;
	reg [1:0] pf_fsm_ns;
	reg [31:0] instr_addr_q;
	wire [31:0] fetch_addr;
	reg [31:0] instr_addr;
	wire [31:0] instr_addr_w_aligned;
	reg addr_valid;
	reg pmp_err_q;
	wire instr_or_pmp_err;
	reg fifo_valid;
	wire fifo_ready;
	wire fifo_clear;
	assign busy_o = (pf_fsm_cs != 2'd0) | instr_req_o;
	assign instr_or_pmp_err = instr_err_i | pmp_err_q;
	ibex_fetch_fifo fifo_i(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.clear_i(fifo_clear),
		.in_addr_i(instr_addr_q),
		.in_rdata_i(instr_rdata_i),
		.in_err_i(instr_or_pmp_err),
		.in_valid_i(fifo_valid),
		.in_ready_o(fifo_ready),
		.out_valid_o(valid_o),
		.out_ready_i(ready_i),
		.out_rdata_o(rdata_o),
		.out_addr_o(addr_o),
		.out_err_o(err_o),
		.out_valid_stored_o()
	);
	assign fetch_addr = {instr_addr_q[31:2], 2'b00} + 32'd4;
	assign fifo_clear = branch_i;
	always @(*) begin
		if (_sv2v_0)
			;
		instr_req_o = 1'b0;
		instr_addr = fetch_addr;
		fifo_valid = 1'b0;
		addr_valid = 1'b0;
		pf_fsm_ns = pf_fsm_cs;
		(* full_case, parallel_case *)
		case (pf_fsm_cs)
			2'd0: begin
				instr_addr = fetch_addr;
				instr_req_o = 1'b0;
				if (branch_i)
					instr_addr = addr_i;
				if (req_i && (fifo_ready || branch_i)) begin
					instr_req_o = 1'b1;
					addr_valid = 1'b1;
					pf_fsm_ns = (instr_gnt_i ? 2'd2 : 2'd1);
				end
			end
			2'd1: begin
				instr_addr = instr_addr_q;
				instr_req_o = 1'b1;
				if (branch_i) begin
					instr_addr = addr_i;
					addr_valid = 1'b1;
				end
				pf_fsm_ns = (instr_gnt_i || pmp_err_q ? 2'd2 : 2'd1);
			end
			2'd2: begin
				instr_addr = fetch_addr;
				if (branch_i)
					instr_addr = addr_i;
				if (req_i && (fifo_ready || branch_i)) begin
					if (instr_rvalid_i || pmp_err_q) begin
						instr_req_o = 1'b1;
						fifo_valid = 1'b1;
						addr_valid = 1'b1;
						pf_fsm_ns = (instr_gnt_i ? 2'd2 : 2'd1);
					end
					else if (branch_i) begin
						addr_valid = 1'b1;
						pf_fsm_ns = 2'd3;
					end
				end
				else if (instr_rvalid_i || pmp_err_q) begin
					fifo_valid = 1'b1;
					pf_fsm_ns = 2'd0;
				end
			end
			2'd3: begin
				instr_addr = instr_addr_q;
				if (branch_i) begin
					instr_addr = addr_i;
					addr_valid = 1'b1;
				end
				if (instr_rvalid_i) begin
					instr_req_o = 1'b1;
					pf_fsm_ns = (instr_gnt_i ? 2'd2 : 2'd1);
				end
			end
			default: pf_fsm_ns = 2'b0x;
		endcase
	end
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni) begin
			pf_fsm_cs <= 2'd0;
			instr_addr_q <= 1'sb0;
			pmp_err_q <= 1'sb0;
		end
		else begin
			pf_fsm_cs <= pf_fsm_ns;
			if (addr_valid) begin
				instr_addr_q <= instr_addr;
				pmp_err_q <= instr_pmp_err_i;
			end
		end
	assign instr_addr_w_aligned = {instr_addr[31:2], 2'b00};
	assign instr_addr_o = instr_addr_w_aligned;
	initial _sv2v_0 = 0;
endmodule
