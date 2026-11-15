module cv32e40p_prefetch_controller (
	clk,
	rst_n,
	req_i,
	branch_i,
	branch_addr_i,
	busy_o,
	hwlp_jump_i,
	hwlp_target_i,
	trans_valid_o,
	trans_ready_i,
	trans_addr_o,
	resp_valid_i,
	fetch_ready_i,
	fetch_valid_o,
	fifo_push_o,
	fifo_pop_o,
	fifo_flush_o,
	fifo_flush_but_first_o,
	fifo_cnt_i,
	fifo_empty_i
);
	reg _sv2v_0;
	parameter PULP_OBI = 0;
	parameter PULP_XPULP = 1;
	parameter DEPTH = 4;
	parameter FIFO_ADDR_DEPTH = (DEPTH > 1 ? $clog2(DEPTH) : 1);
	input wire clk;
	input wire rst_n;
	input wire req_i;
	input wire branch_i;
	input wire [31:0] branch_addr_i;
	output wire busy_o;
	input wire hwlp_jump_i;
	input wire [31:0] hwlp_target_i;
	output wire trans_valid_o;
	input wire trans_ready_i;
	output reg [31:0] trans_addr_o;
	input wire resp_valid_i;
	input wire fetch_ready_i;
	output wire fetch_valid_o;
	output wire fifo_push_o;
	output wire fifo_pop_o;
	output wire fifo_flush_o;
	output wire fifo_flush_but_first_o;
	input wire [FIFO_ADDR_DEPTH:0] fifo_cnt_i;
	input wire fifo_empty_i;
	reg state_q;
	reg next_state;
	reg [FIFO_ADDR_DEPTH:0] cnt_q;
	reg [FIFO_ADDR_DEPTH:0] next_cnt;
	wire count_up;
	wire count_down;
	reg [FIFO_ADDR_DEPTH:0] flush_cnt_q;
	reg [FIFO_ADDR_DEPTH:0] next_flush_cnt;
	reg [31:0] trans_addr_q;
	wire [31:0] trans_addr_incr;
	wire [31:0] aligned_branch_addr;
	wire fifo_valid;
	wire [FIFO_ADDR_DEPTH:0] fifo_cnt_masked;
	wire hwlp_wait_resp_flush;
	reg hwlp_flush_after_resp;
	reg [FIFO_ADDR_DEPTH:0] hwlp_flush_cnt_delayed_q;
	wire hwlp_flush_resp_delayed;
	wire hwlp_flush_resp;
	assign busy_o = (cnt_q != 3'b000) || trans_valid_o;
	assign fetch_valid_o = (fifo_valid || resp_valid_i) && !(branch_i || (flush_cnt_q > 0));
	assign aligned_branch_addr = {branch_addr_i[31:2], 2'b00};
	assign trans_addr_incr = {trans_addr_q[31:2], 2'b00} + 32'd4;
	generate
		if (PULP_OBI == 0) begin : genblk1
			assign trans_valid_o = req_i && ((fifo_cnt_masked + cnt_q) < DEPTH);
		end
		else begin : genblk1
			assign trans_valid_o = (cnt_q == 3'b000 ? req_i && ((fifo_cnt_masked + cnt_q) < DEPTH) : (req_i && ((fifo_cnt_masked + cnt_q) < DEPTH)) && resp_valid_i);
		end
	endgenerate
	assign fifo_cnt_masked = (branch_i || hwlp_jump_i ? {(FIFO_ADDR_DEPTH >= 0 ? FIFO_ADDR_DEPTH + 1 : 1 - FIFO_ADDR_DEPTH) {1'sb0}} : fifo_cnt_i);
	always @(*) begin
		if (_sv2v_0)
			;
		next_state = state_q;
		trans_addr_o = trans_addr_q;
		case (state_q)
			1'd0: begin
				if (branch_i)
					trans_addr_o = aligned_branch_addr;
				else if (hwlp_jump_i)
					trans_addr_o = hwlp_target_i;
				else
					trans_addr_o = trans_addr_incr;
				if ((branch_i || hwlp_jump_i) && !(trans_valid_o && trans_ready_i))
					next_state = 1'd1;
			end
			1'd1: begin
				trans_addr_o = (branch_i ? aligned_branch_addr : trans_addr_q);
				if (trans_valid_o && trans_ready_i)
					next_state = 1'd0;
			end
		endcase
	end
	assign fifo_valid = !fifo_empty_i;
	assign fifo_push_o = (resp_valid_i && (fifo_valid || !fetch_ready_i)) && !(branch_i || (flush_cnt_q > 0));
	assign fifo_pop_o = fifo_valid && fetch_ready_i;
	assign count_up = trans_valid_o && trans_ready_i;
	assign count_down = resp_valid_i;
	always @(*) begin
		if (_sv2v_0)
			;
		case ({count_up, count_down})
			2'b00: next_cnt = cnt_q;
			2'b01: next_cnt = cnt_q - 1'b1;
			2'b10: next_cnt = cnt_q + 1'b1;
			2'b11: next_cnt = cnt_q;
		endcase
	end
	generate
		if (PULP_XPULP) begin : genblk2
			assign fifo_flush_o = branch_i || ((hwlp_jump_i && !fifo_empty_i) && fifo_pop_o);
			assign fifo_flush_but_first_o = (hwlp_jump_i && !fifo_empty_i) && !fifo_pop_o;
			assign hwlp_flush_resp = hwlp_jump_i && !(fifo_empty_i && !resp_valid_i);
			assign hwlp_wait_resp_flush = hwlp_jump_i && (fifo_empty_i && !resp_valid_i);
			always @(posedge clk or negedge rst_n)
				if (~rst_n) begin
					hwlp_flush_after_resp <= 1'b0;
					hwlp_flush_cnt_delayed_q <= 2'b00;
				end
				else if (branch_i) begin
					hwlp_flush_after_resp <= 1'b0;
					hwlp_flush_cnt_delayed_q <= 2'b00;
				end
				else if (hwlp_wait_resp_flush) begin
					hwlp_flush_after_resp <= 1'b1;
					hwlp_flush_cnt_delayed_q <= cnt_q - 1'b1;
				end
				else if (hwlp_flush_resp_delayed) begin
					hwlp_flush_after_resp <= 1'b0;
					hwlp_flush_cnt_delayed_q <= 2'b00;
				end
			assign hwlp_flush_resp_delayed = hwlp_flush_after_resp && resp_valid_i;
		end
		else begin : genblk2
			assign fifo_flush_o = branch_i;
			assign fifo_flush_but_first_o = 1'b0;
			assign hwlp_flush_resp = 1'b0;
			assign hwlp_wait_resp_flush = 1'b0;
			wire [1:1] sv2v_tmp_844E5;
			assign sv2v_tmp_844E5 = 1'b0;
			always @(*) hwlp_flush_after_resp = sv2v_tmp_844E5;
			wire [(FIFO_ADDR_DEPTH >= 0 ? FIFO_ADDR_DEPTH + 1 : 1 - FIFO_ADDR_DEPTH):1] sv2v_tmp_FC45B;
			assign sv2v_tmp_FC45B = 2'b00;
			always @(*) hwlp_flush_cnt_delayed_q = sv2v_tmp_FC45B;
			assign hwlp_flush_resp_delayed = 1'b0;
		end
	endgenerate
	always @(*) begin
		if (_sv2v_0)
			;
		next_flush_cnt = flush_cnt_q;
		if (branch_i || hwlp_flush_resp) begin
			next_flush_cnt = cnt_q;
			if (resp_valid_i && (cnt_q > 0))
				next_flush_cnt = cnt_q - 1'b1;
		end
		else if (hwlp_flush_resp_delayed)
			next_flush_cnt = hwlp_flush_cnt_delayed_q;
		else if (resp_valid_i && (flush_cnt_q > 0))
			next_flush_cnt = flush_cnt_q - 1'b1;
	end
	always @(posedge clk or negedge rst_n)
		if (rst_n == 1'b0) begin
			state_q <= 1'd0;
			cnt_q <= 1'sb0;
			flush_cnt_q <= 1'sb0;
			trans_addr_q <= 1'sb0;
		end
		else begin
			state_q <= next_state;
			cnt_q <= next_cnt;
			flush_cnt_q <= next_flush_cnt;
			if ((branch_i || hwlp_jump_i) || (trans_valid_o && trans_ready_i))
				trans_addr_q <= trans_addr_o;
		end
	initial _sv2v_0 = 0;
endmodule
