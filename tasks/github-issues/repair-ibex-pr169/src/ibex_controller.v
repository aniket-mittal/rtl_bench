module ibex_controller (
	clk_i,
	rst_ni,
	fetch_enable_i,
	ctrl_busy_o,
	first_fetch_o,
	illegal_insn_i,
	ecall_insn_i,
	mret_insn_i,
	dret_insn_i,
	wfi_insn_i,
	ebrk_insn_i,
	csr_status_i,
	instr_valid_i,
	instr_i,
	instr_compressed_i,
	instr_is_compressed_i,
	instr_valid_clear_o,
	id_in_ready_o,
	instr_req_o,
	pc_set_o,
	pc_mux_o,
	exc_pc_mux_o,
	lsu_addr_last_i,
	load_err_i,
	store_err_i,
	branch_set_i,
	jump_set_i,
	irq_i,
	irq_req_ctrl_i,
	irq_id_ctrl_i,
	m_IE_i,
	irq_ack_o,
	irq_id_o,
	exc_cause_o,
	exc_ack_o,
	exc_kill_o,
	debug_req_i,
	debug_cause_o,
	debug_csr_save_o,
	debug_single_step_i,
	debug_ebreakm_i,
	csr_save_if_o,
	csr_save_id_o,
	csr_restore_mret_id_o,
	csr_restore_dret_id_o,
	csr_save_cause_o,
	csr_mtval_o,
	stall_lsu_i,
	stall_multdiv_i,
	stall_jump_i,
	stall_branch_i,
	perf_jump_o,
	perf_tbranch_o
);
	reg _sv2v_0;
	input wire clk_i;
	input wire rst_ni;
	input wire fetch_enable_i;
	output reg ctrl_busy_o;
	output reg first_fetch_o;
	input wire illegal_insn_i;
	input wire ecall_insn_i;
	input wire mret_insn_i;
	input wire dret_insn_i;
	input wire wfi_insn_i;
	input wire ebrk_insn_i;
	input wire csr_status_i;
	input wire instr_valid_i;
	input wire [31:0] instr_i;
	input wire [15:0] instr_compressed_i;
	input wire instr_is_compressed_i;
	output wire instr_valid_clear_o;
	output wire id_in_ready_o;
	output reg instr_req_o;
	output reg pc_set_o;
	output reg [2:0] pc_mux_o;
	output reg [1:0] exc_pc_mux_o;
	input wire [31:0] lsu_addr_last_i;
	input wire load_err_i;
	input wire store_err_i;
	input wire branch_set_i;
	input wire jump_set_i;
	input wire irq_i;
	input wire irq_req_ctrl_i;
	input wire [4:0] irq_id_ctrl_i;
	input wire m_IE_i;
	output reg irq_ack_o;
	output reg [4:0] irq_id_o;
	output reg [5:0] exc_cause_o;
	output reg exc_ack_o;
	output wire exc_kill_o;
	input wire debug_req_i;
	output reg [2:0] debug_cause_o;
	output reg debug_csr_save_o;
	input wire debug_single_step_i;
	input wire debug_ebreakm_i;
	output reg csr_save_if_o;
	output reg csr_save_id_o;
	output reg csr_restore_mret_id_o;
	output reg csr_restore_dret_id_o;
	output reg csr_save_cause_o;
	output reg [31:0] csr_mtval_o;
	input wire stall_lsu_i;
	input wire stall_multdiv_i;
	input wire stall_jump_i;
	input wire stall_branch_i;
	output reg perf_jump_o;
	output reg perf_tbranch_o;
	reg [3:0] ctrl_fsm_cs;
	reg [3:0] ctrl_fsm_ns;
	reg debug_mode_q;
	reg debug_mode_d;
	reg load_err_q;
	wire load_err_d;
	reg store_err_q;
	wire store_err_d;
	wire stall;
	reg halt_if;
	reg halt_id;
	wire exc_req;
	wire exc_req_lsu;
	wire special_req;
	wire enter_debug_mode;
	wire handle_irq;
	assign load_err_d = load_err_i;
	assign store_err_d = store_err_i;
	assign exc_req = (ecall_insn_i | ebrk_insn_i) | illegal_insn_i;
	assign exc_req_lsu = store_err_i | load_err_i;
	assign special_req = ((((mret_insn_i | dret_insn_i) | wfi_insn_i) | csr_status_i) | exc_req) | exc_req_lsu;
	assign enter_debug_mode = debug_req_i & ~debug_mode_q;
	assign handle_irq = (irq_req_ctrl_i & m_IE_i) & ~debug_mode_q;
	assign exc_kill_o = 1'b0;
	function automatic [5:0] sv2v_cast_6;
		input reg [5:0] inp;
		sv2v_cast_6 = inp;
	endfunction
	always @(*) begin
		if (_sv2v_0)
			;
		instr_req_o = 1'b1;
		exc_ack_o = 1'b0;
		csr_save_if_o = 1'b0;
		csr_save_id_o = 1'b0;
		csr_restore_mret_id_o = 1'b0;
		csr_restore_dret_id_o = 1'b0;
		csr_save_cause_o = 1'b0;
		csr_mtval_o = 1'sb0;
		pc_mux_o = 3'd0;
		pc_set_o = 1'b0;
		exc_pc_mux_o = 2'd1;
		exc_cause_o = 6'h00;
		ctrl_fsm_ns = ctrl_fsm_cs;
		ctrl_busy_o = 1'b1;
		first_fetch_o = 1'b0;
		halt_if = 1'b0;
		halt_id = 1'b0;
		irq_ack_o = 1'b0;
		irq_id_o = irq_id_ctrl_i;
		debug_csr_save_o = 1'b0;
		debug_cause_o = 3'h1;
		debug_mode_d = debug_mode_q;
		perf_tbranch_o = 1'b0;
		perf_jump_o = 1'b0;
		(* full_case, parallel_case *)
		case (ctrl_fsm_cs)
			4'd0: begin
				instr_req_o = 1'b0;
				pc_mux_o = 3'd0;
				pc_set_o = 1'b1;
				if (fetch_enable_i)
					ctrl_fsm_ns = 4'd1;
			end
			4'd1: begin
				instr_req_o = 1'b1;
				pc_mux_o = 3'd0;
				pc_set_o = 1'b1;
				ctrl_fsm_ns = 4'd4;
			end
			4'd2: begin
				ctrl_busy_o = 1'b0;
				instr_req_o = 1'b0;
				halt_if = 1'b1;
				halt_id = 1'b1;
				ctrl_fsm_ns = 4'd3;
			end
			4'd3: begin
				ctrl_busy_o = 1'b0;
				instr_req_o = 1'b0;
				halt_if = 1'b1;
				halt_id = 1'b1;
				if (((irq_i || debug_req_i) || debug_mode_q) || debug_single_step_i)
					ctrl_fsm_ns = 4'd4;
			end
			4'd4: begin
				first_fetch_o = 1'b1;
				if (id_in_ready_o)
					ctrl_fsm_ns = 4'd5;
				if (handle_irq) begin
					ctrl_fsm_ns = 4'd7;
					halt_if = 1'b1;
					halt_id = 1'b1;
				end
				if (enter_debug_mode) begin
					ctrl_fsm_ns = 4'd8;
					halt_if = 1'b1;
					halt_id = 1'b1;
				end
			end
			4'd5: begin
				if (instr_valid_i) begin
					if (branch_set_i || jump_set_i) begin
						pc_mux_o = 3'd1;
						pc_set_o = 1'b1;
						perf_tbranch_o = branch_set_i;
						perf_jump_o = jump_set_i;
					end
					else if (special_req) begin
						ctrl_fsm_ns = 4'd6;
						halt_if = 1'b1;
						halt_id = 1'b1;
					end
					if ((enter_debug_mode || handle_irq) && stall)
						halt_if = 1'b1;
					if (debug_single_step_i && !debug_mode_q) begin
						halt_if = 1'b1;
						if (!special_req && !stall)
							ctrl_fsm_ns = 4'd8;
					end
				end
				if (!stall && !special_req) begin
					if (enter_debug_mode) begin
						ctrl_fsm_ns = 4'd8;
						halt_if = 1'b1;
						halt_id = 1'b1;
					end
					else if (handle_irq) begin
						ctrl_fsm_ns = 4'd7;
						halt_if = 1'b1;
						halt_id = 1'b1;
					end
				end
			end
			4'd7: begin
				pc_mux_o = 3'd2;
				pc_set_o = 1'b1;
				exc_pc_mux_o = 2'd1;
				exc_cause_o = sv2v_cast_6({1'b1, irq_id_ctrl_i});
				csr_save_cause_o = 1'b1;
				csr_save_if_o = 1'b1;
				irq_ack_o = 1'b1;
				exc_ack_o = 1'b1;
				ctrl_fsm_ns = 4'd5;
			end
			4'd8: begin
				if (debug_single_step_i || debug_req_i) begin
					pc_mux_o = 3'd2;
					pc_set_o = 1'b1;
					exc_pc_mux_o = 2'd2;
					csr_save_if_o = 1'b1;
					debug_csr_save_o = 1'b1;
					csr_save_cause_o = 1'b1;
					if (debug_single_step_i)
						debug_cause_o = 3'h4;
					else
						debug_cause_o = 3'h3;
					debug_mode_d = 1'b1;
				end
				ctrl_fsm_ns = 4'd5;
			end
			4'd9: begin
				if (ebrk_insn_i) begin
					pc_mux_o = 3'd2;
					pc_set_o = 1'b1;
					exc_pc_mux_o = 2'd2;
					if (debug_ebreakm_i && !debug_mode_q) begin
						csr_save_cause_o = 1'b1;
						csr_save_id_o = 1'b1;
						debug_csr_save_o = 1'b1;
						debug_cause_o = 3'h1;
					end
					debug_mode_d = 1'b1;
				end
				ctrl_fsm_ns = 4'd5;
			end
			4'd6: begin
				halt_if = 1'b1;
				halt_id = 1'b1;
				ctrl_fsm_ns = 4'd5;
				if ((exc_req || store_err_q) || load_err_q) begin
					pc_set_o = 1'b1;
					pc_mux_o = 3'd2;
					exc_pc_mux_o = (debug_mode_q ? 2'd3 : 2'd0);
					csr_save_id_o = 1'b1;
					csr_save_cause_o = 1'b1;
					if (illegal_insn_i) begin
						exc_cause_o = 6'h02;
						csr_mtval_o = (instr_is_compressed_i ? {16'b0000000000000000, instr_compressed_i} : instr_i);
					end
					else if (ecall_insn_i)
						exc_cause_o = 6'h0b;
					else if (ebrk_insn_i) begin
						if (debug_mode_q) begin
							pc_set_o = 1'b0;
							csr_save_id_o = 1'b0;
							csr_save_cause_o = 1'b0;
							ctrl_fsm_ns = 4'd9;
						end
						else if (debug_ebreakm_i) begin
							pc_set_o = 1'b0;
							csr_save_id_o = 1'b0;
							csr_save_cause_o = 1'b0;
							ctrl_fsm_ns = 4'd9;
						end
						else
							exc_cause_o = 6'h03;
					end
					else if (store_err_q) begin
						exc_cause_o = 6'h07;
						csr_mtval_o = lsu_addr_last_i;
					end
					else if (load_err_q) begin
						exc_cause_o = 6'h05;
						csr_mtval_o = lsu_addr_last_i;
					end
				end
				else if (mret_insn_i) begin
					pc_mux_o = 3'd3;
					pc_set_o = 1'b1;
					csr_restore_mret_id_o = 1'b1;
				end
				else if (dret_insn_i) begin
					pc_mux_o = 3'd4;
					pc_set_o = 1'b1;
					csr_restore_dret_id_o = 1'b1;
					debug_mode_d = 1'b0;
				end
				else if (wfi_insn_i)
					ctrl_fsm_ns = 4'd2;
				if (debug_single_step_i && !debug_mode_q) begin
					pc_set_o = 1'b0;
					ctrl_fsm_ns = 4'd8;
				end
			end
			default: begin
				instr_req_o = 1'b0;
				ctrl_fsm_ns = 4'b000x;
			end
		endcase
	end
	assign stall = ((stall_lsu_i | stall_multdiv_i) | stall_jump_i) | stall_branch_i;
	assign id_in_ready_o = ~stall & ~halt_if;
	assign instr_valid_clear_o = ~stall | halt_id;
	always @(posedge clk_i or negedge rst_ni) begin : update_regs
		if (!rst_ni) begin
			ctrl_fsm_cs <= 4'd0;
			debug_mode_q <= 1'b0;
			load_err_q <= 1'b0;
			store_err_q <= 1'b0;
		end
		else begin
			ctrl_fsm_cs <= ctrl_fsm_ns;
			debug_mode_q <= debug_mode_d;
			load_err_q <= load_err_d;
			store_err_q <= store_err_d;
		end
	end
	initial _sv2v_0 = 0;
endmodule
