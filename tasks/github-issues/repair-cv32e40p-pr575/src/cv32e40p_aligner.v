module cv32e40p_aligner (
	clk,
	rst_n,
	fetch_valid_i,
	aligner_ready_o,
	if_valid_i,
	fetch_rdata_i,
	instr_aligned_o,
	instr_valid_o,
	branch_addr_i,
	branch_i,
	hwlp_addr_i,
	hwlp_update_pc_i,
	pc_o
);
	reg _sv2v_0;
	input wire clk;
	input wire rst_n;
	input wire fetch_valid_i;
	output reg aligner_ready_o;
	input wire if_valid_i;
	input wire [31:0] fetch_rdata_i;
	output reg [31:0] instr_aligned_o;
	output reg instr_valid_o;
	input wire [31:0] branch_addr_i;
	input wire branch_i;
	input wire [31:0] hwlp_addr_i;
	input wire hwlp_update_pc_i;
	output wire [31:0] pc_o;
	reg [2:0] state;
	reg [2:0] next_state;
	reg [15:0] r_instr_h;
	reg [31:0] hwlp_addr_q;
	reg [31:0] pc_q;
	reg [31:0] pc_n;
	reg update_state;
	wire [31:0] pc_plus4;
	wire [31:0] pc_plus2;
	reg aligner_ready_q;
	reg hwlp_update_pc_q;
	assign pc_o = pc_q;
	assign pc_plus2 = pc_q + 2;
	assign pc_plus4 = pc_q + 4;
	always @(posedge clk or negedge rst_n) begin : proc_SEQ_FSM
		if (~rst_n) begin
			state <= 3'd0;
			r_instr_h <= 1'sb0;
			hwlp_addr_q <= 1'sb0;
			pc_q <= 1'sb0;
			aligner_ready_q <= 1'b0;
			hwlp_update_pc_q <= 1'b0;
		end
		else if (update_state) begin
			pc_q <= pc_n;
			state <= next_state;
			r_instr_h <= fetch_rdata_i[31:16];
			aligner_ready_q <= aligner_ready_o;
			hwlp_update_pc_q <= 1'b0;
		end
		else if (hwlp_update_pc_i) begin
			hwlp_addr_q <= hwlp_addr_i;
			hwlp_update_pc_q <= 1'b1;
		end
	end
	always @(*) begin
		if (_sv2v_0)
			;
		pc_n = pc_q;
		instr_valid_o = fetch_valid_i;
		instr_aligned_o = fetch_rdata_i;
		aligner_ready_o = 1'b1;
		update_state = 1'b0;
		next_state = state;
		case (state)
			3'd0:
				if (fetch_rdata_i[1:0] == 2'b11) begin
					next_state = 3'd0;
					pc_n = pc_plus4;
					instr_aligned_o = fetch_rdata_i;
					update_state = fetch_valid_i & if_valid_i;
					if (hwlp_update_pc_i || hwlp_update_pc_q)
						pc_n = (hwlp_update_pc_i ? hwlp_addr_i : hwlp_addr_q);
				end
				else begin
					next_state = 3'd1;
					pc_n = pc_plus2;
					instr_aligned_o = fetch_rdata_i;
					update_state = fetch_valid_i & if_valid_i;
				end
			3'd1:
				if (r_instr_h[1:0] == 2'b11) begin
					next_state = 3'd1;
					pc_n = pc_plus4;
					instr_aligned_o = {fetch_rdata_i[15:0], r_instr_h[15:0]};
					update_state = fetch_valid_i & if_valid_i;
				end
				else begin
					instr_aligned_o = {fetch_rdata_i[31:16], r_instr_h[15:0]};
					next_state = 3'd2;
					instr_valid_o = 1'b1;
					pc_n = pc_plus2;
					aligner_ready_o = !fetch_valid_i;
					update_state = if_valid_i;
				end
			3'd2: begin
				instr_valid_o = !aligner_ready_q || fetch_valid_i;
				if (fetch_rdata_i[1:0] == 2'b11) begin
					next_state = 3'd0;
					pc_n = pc_plus4;
					instr_aligned_o = fetch_rdata_i;
					update_state = (!aligner_ready_q | fetch_valid_i) & if_valid_i;
				end
				else begin
					next_state = 3'd1;
					pc_n = pc_plus2;
					instr_aligned_o = fetch_rdata_i;
					update_state = (!aligner_ready_q | fetch_valid_i) & if_valid_i;
				end
			end
			3'd3:
				if (fetch_rdata_i[17:16] == 2'b11) begin
					next_state = 3'd1;
					instr_valid_o = 1'b0;
					pc_n = pc_q;
					instr_aligned_o = fetch_rdata_i;
					update_state = fetch_valid_i & if_valid_i;
				end
				else begin
					next_state = 3'd0;
					pc_n = pc_plus2;
					instr_aligned_o = {fetch_rdata_i[31:16], fetch_rdata_i[31:16]};
					update_state = fetch_valid_i & if_valid_i;
				end
		endcase
		if (branch_i) begin
			update_state = 1'b1;
			pc_n = branch_addr_i;
			next_state = (branch_addr_i[1] ? 3'd3 : 3'd0);
		end
	end
	initial _sv2v_0 = 0;
endmodule
