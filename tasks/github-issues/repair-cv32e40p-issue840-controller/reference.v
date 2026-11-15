module cv32e40p_controller (
	clk,
	clk_ungated_i,
	rst_n,
	fetch_enable_i,
	ctrl_busy_o,
	is_decoding_o,
	is_fetch_failed_i,
	deassert_we_o,
	illegal_insn_i,
	ecall_insn_i,
	mret_insn_i,
	uret_insn_i,
	dret_insn_i,
	mret_dec_i,
	uret_dec_i,
	dret_dec_i,
	wfi_i,
	ebrk_insn_i,
	fencei_insn_i,
	csr_status_i,
	hwlp_mask_o,
	instr_valid_i,
	instr_req_o,
	pc_set_o,
	pc_mux_o,
	exc_pc_mux_o,
	trap_addr_mux_o,
	pc_id_i,
	is_compressed_i,
	hwlp_start_addr_i,
	hwlp_end_addr_i,
	hwlp_counter_i,
	hwlp_dec_cnt_o,
	hwlp_jump_o,
	hwlp_targ_addr_o,
	data_req_ex_i,
	data_we_ex_i,
	data_misaligned_i,
	data_load_event_i,
	data_err_i,
	data_err_ack_o,
	mult_multicycle_i,
	apu_en_i,
	apu_read_dep_i,
	apu_write_dep_i,
	apu_stall_o,
	branch_taken_ex_i,
	ctrl_transfer_insn_in_id_i,
	ctrl_transfer_insn_in_dec_i,
	irq_req_ctrl_i,
	irq_sec_ctrl_i,
	irq_id_ctrl_i,
	irq_wu_ctrl_i,
	current_priv_lvl_i,
	irq_ack_o,
	irq_id_o,
	exc_cause_o,
	debug_mode_o,
	debug_cause_o,
	debug_csr_save_o,
	debug_req_i,
	debug_single_step_i,
	debug_ebreakm_i,
	debug_ebreaku_i,
	trigger_match_i,
	debug_p_elw_no_sleep_o,
	debug_wfi_no_sleep_o,
	debug_havereset_o,
	debug_running_o,
	debug_halted_o,
	wake_from_sleep_o,
	csr_save_if_o,
	csr_save_id_o,
	csr_save_ex_o,
	csr_cause_o,
	csr_irq_sec_o,
	csr_restore_mret_id_o,
	csr_restore_uret_id_o,
	csr_restore_dret_id_o,
	csr_save_cause_o,
	regfile_we_id_i,
	regfile_alu_waddr_id_i,
	regfile_we_ex_i,
	regfile_waddr_ex_i,
	regfile_we_wb_i,
	regfile_alu_we_fw_i,
	operand_a_fw_mux_sel_o,
	operand_b_fw_mux_sel_o,
	operand_c_fw_mux_sel_o,
	reg_d_ex_is_reg_a_i,
	reg_d_ex_is_reg_b_i,
	reg_d_ex_is_reg_c_i,
	reg_d_wb_is_reg_a_i,
	reg_d_wb_is_reg_b_i,
	reg_d_wb_is_reg_c_i,
	reg_d_alu_is_reg_a_i,
	reg_d_alu_is_reg_b_i,
	reg_d_alu_is_reg_c_i,
	halt_if_o,
	halt_id_o,
	misaligned_stall_o,
	jr_stall_o,
	load_stall_o,
	id_ready_i,
	id_valid_i,
	ex_valid_i,
	wb_ready_i,
	perf_pipeline_stall_o
);
	reg _sv2v_0;
	parameter COREV_CLUSTER = 0;
	parameter COREV_PULP = 1;
	input wire clk;
	input wire clk_ungated_i;
	input wire rst_n;
	input wire fetch_enable_i;
	output reg ctrl_busy_o;
	output reg is_decoding_o;
	input wire is_fetch_failed_i;
	output reg deassert_we_o;
	input wire illegal_insn_i;
	input wire ecall_insn_i;
	input wire mret_insn_i;
	input wire uret_insn_i;
	input wire dret_insn_i;
	input wire mret_dec_i;
	input wire uret_dec_i;
	input wire dret_dec_i;
	input wire wfi_i;
	input wire ebrk_insn_i;
	input wire fencei_insn_i;
	input wire csr_status_i;
	output reg hwlp_mask_o;
	input wire instr_valid_i;
	output reg instr_req_o;
	output reg pc_set_o;
	output reg [3:0] pc_mux_o;
	output reg [2:0] exc_pc_mux_o;
	output reg [1:0] trap_addr_mux_o;
	input wire [31:0] pc_id_i;
	input wire is_compressed_i;
	input wire [63:0] hwlp_start_addr_i;
	input wire [63:0] hwlp_end_addr_i;
	input wire [63:0] hwlp_counter_i;
	output reg [1:0] hwlp_dec_cnt_o;
	output wire hwlp_jump_o;
	output reg [31:0] hwlp_targ_addr_o;
	input wire data_req_ex_i;
	input wire data_we_ex_i;
	input wire data_misaligned_i;
	input wire data_load_event_i;
	input wire data_err_i;
	output reg data_err_ack_o;
	input wire mult_multicycle_i;
	input wire apu_en_i;
	input wire apu_read_dep_i;
	input wire apu_write_dep_i;
	output wire apu_stall_o;
	input wire branch_taken_ex_i;
	input wire [1:0] ctrl_transfer_insn_in_id_i;
	input wire [1:0] ctrl_transfer_insn_in_dec_i;
	input wire irq_req_ctrl_i;
	input wire irq_sec_ctrl_i;
	input wire [4:0] irq_id_ctrl_i;
	input wire irq_wu_ctrl_i;
	input wire [1:0] current_priv_lvl_i;
	output reg irq_ack_o;
	output reg [4:0] irq_id_o;
	output reg [4:0] exc_cause_o;
	output wire debug_mode_o;
	output reg [2:0] debug_cause_o;
	output reg debug_csr_save_o;
	input wire debug_req_i;
	input wire debug_single_step_i;
	input wire debug_ebreakm_i;
	input wire debug_ebreaku_i;
	input wire trigger_match_i;
	output wire debug_p_elw_no_sleep_o;
	output wire debug_wfi_no_sleep_o;
	output wire debug_havereset_o;
	output wire debug_running_o;
	output wire debug_halted_o;
	output wire wake_from_sleep_o;
	output reg csr_save_if_o;
	output reg csr_save_id_o;
	output reg csr_save_ex_o;
	output reg [5:0] csr_cause_o;
	output reg csr_irq_sec_o;
	output reg csr_restore_mret_id_o;
	output reg csr_restore_uret_id_o;
	output reg csr_restore_dret_id_o;
	output reg csr_save_cause_o;
	input wire regfile_we_id_i;
	input wire [5:0] regfile_alu_waddr_id_i;
	input wire regfile_we_ex_i;
	input wire [5:0] regfile_waddr_ex_i;
	input wire regfile_we_wb_i;
	input wire regfile_alu_we_fw_i;
	output reg [1:0] operand_a_fw_mux_sel_o;
	output reg [1:0] operand_b_fw_mux_sel_o;
	output reg [1:0] operand_c_fw_mux_sel_o;
	input wire reg_d_ex_is_reg_a_i;
	input wire reg_d_ex_is_reg_b_i;
	input wire reg_d_ex_is_reg_c_i;
	input wire reg_d_wb_is_reg_a_i;
	input wire reg_d_wb_is_reg_b_i;
	input wire reg_d_wb_is_reg_c_i;
	input wire reg_d_alu_is_reg_a_i;
	input wire reg_d_alu_is_reg_b_i;
	input wire reg_d_alu_is_reg_c_i;
	output reg halt_if_o;
	output reg halt_id_o;
	output wire misaligned_stall_o;
	output reg jr_stall_o;
	output reg load_stall_o;
	input wire id_ready_i;
	input wire id_valid_i;
	input wire ex_valid_i;
	input wire wb_ready_i;
	output reg perf_pipeline_stall_o;
	reg [4:0] ctrl_fsm_cs;
	reg [4:0] ctrl_fsm_ns;
	reg [2:0] debug_fsm_cs;
	reg [2:0] debug_fsm_ns;
	reg jump_done;
	reg jump_done_q;
	reg jump_in_dec;
	reg branch_in_id_dec;
	reg branch_in_id;
	reg data_err_q;
	reg debug_mode_q;
	reg debug_mode_n;
	reg ebrk_force_debug_mode;
	reg is_hwlp_illegal;
	wire is_hwlp_body;
	reg illegal_insn_q;
	reg illegal_insn_n;
	reg debug_req_entry_q;
	reg debug_req_entry_n;
	reg debug_force_wakeup_q;
	reg debug_force_wakeup_n;
	wire hwlp_end0_eq_pc;
	wire hwlp_end1_eq_pc;
	wire hwlp_counter0_gt_1;
	wire hwlp_counter1_gt_1;
	wire hwlp_counter0_eq_1;
	wire hwlp_counter1_eq_1;
	wire hwlp_end0_eq_pc_plus4;
	wire hwlp_end1_eq_pc_plus4;
	wire hwlp_start0_leq_pc;
	wire hwlp_start1_leq_pc;
	wire hwlp_end0_geq_pc;
	wire hwlp_end1_geq_pc;
	reg hwlp_end_4_id_d;
	reg hwlp_end_4_id_q;
	reg debug_req_q;
	wire debug_req_pending;
	wire wfi_active;
	localparam cv32e40p_pkg_BRANCH_COND = 2'b11;
	localparam cv32e40p_pkg_BRANCH_JAL = 2'b01;
	localparam cv32e40p_pkg_BRANCH_JALR = 2'b10;
	localparam cv32e40p_pkg_DBG_CAUSE_EBREAK = 3'h1;
	localparam cv32e40p_pkg_DBG_CAUSE_HALTREQ = 3'h3;
	localparam cv32e40p_pkg_DBG_CAUSE_STEP = 3'h4;
	localparam cv32e40p_pkg_DBG_CAUSE_TRIGGER = 3'h2;
	localparam cv32e40p_pkg_EXC_CAUSE_BREAKPOINT = 5'h03;
	localparam cv32e40p_pkg_EXC_CAUSE_ECALL_MMODE = 5'h0b;
	localparam cv32e40p_pkg_EXC_CAUSE_ECALL_UMODE = 5'h08;
	localparam cv32e40p_pkg_EXC_CAUSE_ILLEGAL_INSN = 5'h02;
	localparam cv32e40p_pkg_EXC_CAUSE_INSTR_FAULT = 5'h01;
	localparam cv32e40p_pkg_EXC_CAUSE_LOAD_FAULT = 5'h05;
	localparam cv32e40p_pkg_EXC_CAUSE_STORE_FAULT = 5'h07;
	localparam cv32e40p_pkg_EXC_PC_DBD = 3'b010;
	localparam cv32e40p_pkg_EXC_PC_DBE = 3'b011;
	localparam cv32e40p_pkg_EXC_PC_EXCEPTION = 3'b000;
	localparam cv32e40p_pkg_EXC_PC_IRQ = 3'b001;
	localparam cv32e40p_pkg_PC_BOOT = 4'b0000;
	localparam cv32e40p_pkg_PC_BRANCH = 4'b0011;
	localparam cv32e40p_pkg_PC_DRET = 4'b0111;
	localparam cv32e40p_pkg_PC_EXCEPTION = 4'b0100;
	localparam cv32e40p_pkg_PC_FENCEI = 4'b0001;
	localparam cv32e40p_pkg_PC_HWLOOP = 4'b1000;
	localparam cv32e40p_pkg_PC_JUMP = 4'b0010;
	localparam cv32e40p_pkg_PC_MRET = 4'b0101;
	localparam cv32e40p_pkg_PC_URET = 4'b0110;
	localparam cv32e40p_pkg_TRAP_MACHINE = 2'b00;
	localparam cv32e40p_pkg_TRAP_USER = 2'b01;
	always @(*) begin
		if (_sv2v_0)
			;
		instr_req_o = 1'b1;
		data_err_ack_o = 1'b0;
		csr_save_if_o = 1'b0;
		csr_save_id_o = 1'b0;
		csr_save_ex_o = 1'b0;
		csr_restore_mret_id_o = 1'b0;
		csr_restore_uret_id_o = 1'b0;
		csr_restore_dret_id_o = 1'b0;
		csr_save_cause_o = 1'b0;
		exc_cause_o = 1'sb0;
		exc_pc_mux_o = cv32e40p_pkg_EXC_PC_IRQ;
		trap_addr_mux_o = cv32e40p_pkg_TRAP_MACHINE;
		csr_cause_o = 1'sb0;
		csr_irq_sec_o = 1'b0;
		pc_mux_o = cv32e40p_pkg_PC_BOOT;
		pc_set_o = 1'b0;
		jump_done = jump_done_q;
		ctrl_fsm_ns = ctrl_fsm_cs;
		ctrl_busy_o = 1'b1;
		halt_if_o = 1'b0;
		halt_id_o = 1'b0;
		is_decoding_o = 1'b0;
		irq_ack_o = 1'b0;
		irq_id_o = 5'b00000;
		jump_in_dec = (ctrl_transfer_insn_in_dec_i == cv32e40p_pkg_BRANCH_JALR) || (ctrl_transfer_insn_in_dec_i == cv32e40p_pkg_BRANCH_JAL);
		branch_in_id = ctrl_transfer_insn_in_id_i == cv32e40p_pkg_BRANCH_COND;
		branch_in_id_dec = ctrl_transfer_insn_in_dec_i == cv32e40p_pkg_BRANCH_COND;
		ebrk_force_debug_mode = (debug_ebreakm_i && (current_priv_lvl_i == 2'b11)) || (debug_ebreaku_i && (current_priv_lvl_i == 2'b00));
		debug_csr_save_o = 1'b0;
		debug_cause_o = cv32e40p_pkg_DBG_CAUSE_EBREAK;
		debug_mode_n = debug_mode_q;
		illegal_insn_n = illegal_insn_q;
		debug_req_entry_n = debug_req_entry_q;
		debug_force_wakeup_n = debug_force_wakeup_q;
		perf_pipeline_stall_o = 1'b0;
		hwlp_mask_o = 1'b0;
		is_hwlp_illegal = 1'b0;
		hwlp_dec_cnt_o = 1'sb0;
		hwlp_end_4_id_d = 1'b0;
		hwlp_targ_addr_o = ((hwlp_start1_leq_pc && hwlp_end1_geq_pc) && !(hwlp_start0_leq_pc && hwlp_end0_geq_pc) ? hwlp_start_addr_i[32+:32] : hwlp_start_addr_i[0+:32]);
		(* full_case, parallel_case *)
		case (ctrl_fsm_cs)
			5'd0: begin
				is_decoding_o = 1'b0;
				instr_req_o = 1'b0;
				if (fetch_enable_i == 1'b1)
					ctrl_fsm_ns = 5'd1;
			end
			5'd1: begin
				is_decoding_o = 1'b0;
				instr_req_o = 1'b1;
				pc_mux_o = cv32e40p_pkg_PC_BOOT;
				pc_set_o = 1'b1;
				if (debug_req_pending) begin
					ctrl_fsm_ns = 5'd12;
					debug_force_wakeup_n = 1'b1;
				end
				else
					ctrl_fsm_ns = 5'd4;
			end
			5'd3: begin
				is_decoding_o = 1'b0;
				ctrl_busy_o = 1'b0;
				instr_req_o = 1'b0;
				halt_if_o = 1'b1;
				halt_id_o = 1'b1;
				ctrl_fsm_ns = 5'd2;
			end
			5'd2: begin
				is_decoding_o = 1'b0;
				instr_req_o = 1'b0;
				halt_if_o = 1'b1;
				halt_id_o = 1'b1;
				if (wake_from_sleep_o) begin
					if (debug_req_pending) begin
						ctrl_fsm_ns = 5'd12;
						debug_force_wakeup_n = 1'b1;
					end
					else
						ctrl_fsm_ns = 5'd4;
				end
				else
					ctrl_busy_o = 1'b0;
			end
			5'd4: begin
				is_decoding_o = 1'b0;
				ctrl_fsm_ns = 5'd5;
				if (irq_req_ctrl_i && ~(debug_req_pending || debug_mode_q)) begin
					halt_if_o = 1'b1;
					halt_id_o = 1'b1;
					pc_set_o = 1'b1;
					pc_mux_o = cv32e40p_pkg_PC_EXCEPTION;
					exc_pc_mux_o = cv32e40p_pkg_EXC_PC_IRQ;
					exc_cause_o = irq_id_ctrl_i;
					csr_irq_sec_o = irq_sec_ctrl_i;
					irq_ack_o = 1'b1;
					irq_id_o = irq_id_ctrl_i;
					if (irq_sec_ctrl_i)
						trap_addr_mux_o = cv32e40p_pkg_TRAP_MACHINE;
					else
						trap_addr_mux_o = (current_priv_lvl_i == 2'b00 ? cv32e40p_pkg_TRAP_USER : cv32e40p_pkg_TRAP_MACHINE);
					csr_save_cause_o = 1'b1;
					csr_cause_o = {1'b1, irq_id_ctrl_i};
					csr_save_if_o = 1'b1;
				end
			end
			5'd5:
				if (branch_taken_ex_i) begin
					is_decoding_o = 1'b0;
					pc_mux_o = cv32e40p_pkg_PC_BRANCH;
					pc_set_o = 1'b1;
				end
				else if (data_err_i) begin
					is_decoding_o = 1'b0;
					halt_if_o = 1'b1;
					halt_id_o = 1'b1;
					csr_save_ex_o = 1'b1;
					csr_save_cause_o = 1'b1;
					data_err_ack_o = 1'b1;
					csr_cause_o = {1'b0, (data_we_ex_i ? cv32e40p_pkg_EXC_CAUSE_STORE_FAULT : cv32e40p_pkg_EXC_CAUSE_LOAD_FAULT)};
					ctrl_fsm_ns = 5'd9;
				end
				else if (is_fetch_failed_i) begin
					is_decoding_o = 1'b0;
					halt_id_o = 1'b1;
					halt_if_o = 1'b1;
					csr_save_if_o = 1'b1;
					csr_save_cause_o = !debug_mode_q;
					csr_cause_o = {1'b0, cv32e40p_pkg_EXC_CAUSE_INSTR_FAULT};
					ctrl_fsm_ns = 5'd9;
				end
				else if (instr_valid_i) begin : blk_decode_level1
					is_decoding_o = 1'b1;
					illegal_insn_n = 1'b0;
					if ((debug_req_pending || trigger_match_i) & ~debug_mode_q) begin
						halt_if_o = 1'b1;
						halt_id_o = 1'b1;
						ctrl_fsm_ns = 5'd13;
						debug_req_entry_n = 1'b1;
					end
					else if (irq_req_ctrl_i && ~debug_mode_q) begin
						hwlp_mask_o = (COREV_PULP ? 1'b1 : 1'b0);
						is_decoding_o = 1'b0;
						halt_if_o = 1'b1;
						halt_id_o = 1'b1;
						pc_set_o = 1'b1;
						pc_mux_o = cv32e40p_pkg_PC_EXCEPTION;
						exc_pc_mux_o = cv32e40p_pkg_EXC_PC_IRQ;
						exc_cause_o = irq_id_ctrl_i;
						csr_irq_sec_o = irq_sec_ctrl_i;
						irq_ack_o = 1'b1;
						irq_id_o = irq_id_ctrl_i;
						if (irq_sec_ctrl_i)
							trap_addr_mux_o = cv32e40p_pkg_TRAP_MACHINE;
						else
							trap_addr_mux_o = (current_priv_lvl_i == 2'b00 ? cv32e40p_pkg_TRAP_USER : cv32e40p_pkg_TRAP_MACHINE);
						csr_save_cause_o = 1'b1;
						csr_cause_o = {1'b1, irq_id_ctrl_i};
						csr_save_id_o = 1'b1;
					end
					else begin
						is_hwlp_illegal = is_hwlp_body & (((((((jump_in_dec || branch_in_id_dec) || mret_insn_i) || uret_insn_i) || dret_insn_i) || is_compressed_i) || fencei_insn_i) || wfi_active);
						if (illegal_insn_i || is_hwlp_illegal) begin
							halt_if_o = 1'b1;
							halt_id_o = 1'b0;
							ctrl_fsm_ns = (id_ready_i ? 5'd8 : 5'd5);
							illegal_insn_n = 1'b1;
						end
						else
							(* full_case, parallel_case *)
							case (1'b1)
								jump_in_dec: begin
									pc_mux_o = cv32e40p_pkg_PC_JUMP;
									if (~jr_stall_o && ~jump_done_q) begin
										pc_set_o = 1'b1;
										jump_done = 1'b1;
									end
								end
								ebrk_insn_i: begin
									halt_if_o = 1'b1;
									halt_id_o = 1'b0;
									if (debug_mode_q)
										ctrl_fsm_ns = 5'd13;
									else if (ebrk_force_debug_mode)
										ctrl_fsm_ns = 5'd13;
									else
										ctrl_fsm_ns = (id_ready_i ? 5'd8 : 5'd5);
								end
								wfi_active: begin
									halt_if_o = 1'b1;
									halt_id_o = 1'b0;
									ctrl_fsm_ns = (id_ready_i ? 5'd8 : 5'd5);
								end
								ecall_insn_i: begin
									halt_if_o = 1'b1;
									halt_id_o = 1'b0;
									ctrl_fsm_ns = (id_ready_i ? 5'd8 : 5'd5);
								end
								fencei_insn_i: begin
									halt_if_o = 1'b1;
									halt_id_o = 1'b0;
									ctrl_fsm_ns = (id_ready_i ? 5'd8 : 5'd5);
								end
								(mret_insn_i | uret_insn_i) | dret_insn_i: begin
									halt_if_o = 1'b1;
									halt_id_o = 1'b0;
									ctrl_fsm_ns = (id_ready_i ? 5'd8 : 5'd5);
								end
								csr_status_i: begin
									halt_if_o = 1'b1;
									ctrl_fsm_ns = (id_ready_i ? 5'd8 : 5'd5);
								end
								data_load_event_i: begin
									ctrl_fsm_ns = (id_ready_i ? 5'd7 : 5'd5);
									halt_if_o = 1'b1;
								end
								default: begin
									if (is_hwlp_body) begin
										ctrl_fsm_ns = (hwlp_end0_eq_pc_plus4 || hwlp_end1_eq_pc_plus4 ? 5'd5 : 5'd15);
										if (hwlp_end0_eq_pc && hwlp_counter0_gt_1) begin
											pc_mux_o = cv32e40p_pkg_PC_HWLOOP;
											if (~jump_done_q) begin
												pc_set_o = 1'b1;
												jump_done = 1'b1;
												hwlp_dec_cnt_o[0] = 1'b1;
											end
										end
										if (hwlp_end1_eq_pc && hwlp_counter1_gt_1) begin
											pc_mux_o = cv32e40p_pkg_PC_HWLOOP;
											if (~jump_done_q) begin
												pc_set_o = 1'b1;
												jump_done = 1'b1;
												hwlp_dec_cnt_o[1] = 1'b1;
											end
										end
									end
									if (hwlp_end0_eq_pc && hwlp_counter0_eq_1)
										hwlp_dec_cnt_o[0] = 1'b1;
									if (hwlp_end1_eq_pc && hwlp_counter1_eq_1)
										hwlp_dec_cnt_o[1] = 1'b1;
								end
							endcase
						if (debug_single_step_i & ~debug_mode_q) begin
							halt_if_o = 1'b1;
							if (id_ready_i)
								(* full_case, parallel_case *)
								case (1'b1)
									illegal_insn_i | ecall_insn_i: ctrl_fsm_ns = 5'd8;
									~ebrk_force_debug_mode & ebrk_insn_i: ctrl_fsm_ns = 5'd8;
									mret_insn_i | uret_insn_i: ctrl_fsm_ns = 5'd8;
									branch_in_id: ctrl_fsm_ns = 5'd14;
									default: ctrl_fsm_ns = 5'd13;
								endcase
						end
					end
				end
				else begin
					is_decoding_o = 1'b0;
					perf_pipeline_stall_o = data_load_event_i;
				end
			5'd15:
				if (COREV_PULP) begin
					if (instr_valid_i) begin
						is_decoding_o = 1'b1;
						if ((debug_req_pending || trigger_match_i) & ~debug_mode_q) begin
							halt_if_o = 1'b1;
							halt_id_o = 1'b1;
							ctrl_fsm_ns = 5'd13;
							debug_req_entry_n = 1'b1;
						end
						else if (irq_req_ctrl_i && ~debug_mode_q) begin
							hwlp_mask_o = (COREV_PULP ? 1'b1 : 1'b0);
							is_decoding_o = 1'b0;
							halt_if_o = 1'b1;
							halt_id_o = 1'b1;
							pc_set_o = 1'b1;
							pc_mux_o = cv32e40p_pkg_PC_EXCEPTION;
							exc_pc_mux_o = cv32e40p_pkg_EXC_PC_IRQ;
							exc_cause_o = irq_id_ctrl_i;
							csr_irq_sec_o = irq_sec_ctrl_i;
							irq_ack_o = 1'b1;
							irq_id_o = irq_id_ctrl_i;
							if (irq_sec_ctrl_i)
								trap_addr_mux_o = cv32e40p_pkg_TRAP_MACHINE;
							else
								trap_addr_mux_o = (current_priv_lvl_i == 2'b00 ? cv32e40p_pkg_TRAP_USER : cv32e40p_pkg_TRAP_MACHINE);
							csr_save_cause_o = 1'b1;
							csr_cause_o = {1'b1, irq_id_ctrl_i};
							csr_save_id_o = 1'b1;
							ctrl_fsm_ns = 5'd5;
						end
						else begin
							is_hwlp_illegal = ((((((jump_in_dec || branch_in_id_dec) || mret_insn_i) || uret_insn_i) || dret_insn_i) || is_compressed_i) || fencei_insn_i) || wfi_active;
							if (illegal_insn_i || is_hwlp_illegal) begin
								halt_if_o = 1'b1;
								halt_id_o = 1'b1;
								ctrl_fsm_ns = 5'd8;
								illegal_insn_n = 1'b1;
							end
							else
								(* full_case, parallel_case *)
								case (1'b1)
									ebrk_insn_i: begin
										halt_if_o = 1'b1;
										halt_id_o = 1'b1;
										if (debug_mode_q)
											ctrl_fsm_ns = 5'd13;
										else if (ebrk_force_debug_mode)
											ctrl_fsm_ns = 5'd13;
										else
											ctrl_fsm_ns = 5'd8;
									end
									ecall_insn_i: begin
										halt_if_o = 1'b1;
										halt_id_o = 1'b1;
										ctrl_fsm_ns = 5'd8;
									end
									csr_status_i: begin
										halt_if_o = 1'b1;
										ctrl_fsm_ns = (id_ready_i ? 5'd8 : 5'd15);
									end
									data_load_event_i: begin
										ctrl_fsm_ns = (id_ready_i ? 5'd7 : 5'd15);
										halt_if_o = 1'b1;
									end
									default: begin
										if (hwlp_end1_eq_pc_plus4) begin
											if (hwlp_counter1_gt_1) begin
												hwlp_end_4_id_d = 1'b1;
												hwlp_targ_addr_o = hwlp_start_addr_i[32+:32];
												ctrl_fsm_ns = 5'd15;
											end
											else
												ctrl_fsm_ns = (is_hwlp_body ? 5'd15 : 5'd5);
										end
										if (hwlp_end0_eq_pc_plus4) begin
											if (hwlp_counter0_gt_1) begin
												hwlp_end_4_id_d = 1'b1;
												hwlp_targ_addr_o = hwlp_start_addr_i[0+:32];
												ctrl_fsm_ns = 5'd15;
											end
											else
												ctrl_fsm_ns = (is_hwlp_body ? 5'd15 : 5'd5);
										end
										hwlp_dec_cnt_o[0] = hwlp_end0_eq_pc;
										hwlp_dec_cnt_o[1] = hwlp_end1_eq_pc;
									end
								endcase
							if (debug_single_step_i & ~debug_mode_q) begin
								halt_if_o = 1'b1;
								if (id_ready_i)
									(* full_case, parallel_case *)
									case (1'b1)
										illegal_insn_i | ecall_insn_i: ctrl_fsm_ns = 5'd8;
										~ebrk_force_debug_mode & ebrk_insn_i: ctrl_fsm_ns = 5'd8;
										mret_insn_i | uret_insn_i: ctrl_fsm_ns = 5'd8;
										branch_in_id: ctrl_fsm_ns = 5'd14;
										default: ctrl_fsm_ns = 5'd13;
									endcase
							end
						end
					end
					else begin
						is_decoding_o = 1'b0;
						perf_pipeline_stall_o = data_load_event_i;
					end
				end
			5'd8: begin
				is_decoding_o = 1'b0;
				halt_if_o = 1'b1;
				halt_id_o = 1'b1;
				if (data_err_i) begin
					csr_save_ex_o = 1'b1;
					csr_save_cause_o = 1'b1;
					data_err_ack_o = 1'b1;
					csr_cause_o = {1'b0, (data_we_ex_i ? cv32e40p_pkg_EXC_CAUSE_STORE_FAULT : cv32e40p_pkg_EXC_CAUSE_LOAD_FAULT)};
					ctrl_fsm_ns = 5'd9;
					illegal_insn_n = 1'b0;
				end
				else if (ex_valid_i) begin
					ctrl_fsm_ns = 5'd9;
					if (illegal_insn_q) begin
						csr_save_id_o = 1'b1;
						csr_save_cause_o = !debug_mode_q;
						csr_cause_o = {1'b0, cv32e40p_pkg_EXC_CAUSE_ILLEGAL_INSN};
					end
					else
						(* full_case, parallel_case *)
						case (1'b1)
							ebrk_insn_i: begin
								csr_save_id_o = 1'b1;
								csr_save_cause_o = 1'b1;
								csr_cause_o = {1'b0, cv32e40p_pkg_EXC_CAUSE_BREAKPOINT};
							end
							ecall_insn_i: begin
								csr_save_id_o = 1'b1;
								csr_save_cause_o = !debug_mode_q;
								csr_cause_o = {1'b0, (current_priv_lvl_i == 2'b00 ? cv32e40p_pkg_EXC_CAUSE_ECALL_UMODE : cv32e40p_pkg_EXC_CAUSE_ECALL_MMODE)};
							end
							default:
								;
						endcase
				end
			end
			5'd6:
				if (COREV_CLUSTER == 1'b1) begin
					is_decoding_o = 1'b0;
					halt_if_o = 1'b1;
					halt_id_o = 1'b1;
					ctrl_fsm_ns = 5'd5;
					perf_pipeline_stall_o = data_load_event_i;
					if (irq_req_ctrl_i && ~(debug_req_pending || debug_mode_q)) begin
						is_decoding_o = 1'b0;
						halt_if_o = 1'b1;
						halt_id_o = 1'b1;
						pc_set_o = 1'b1;
						pc_mux_o = cv32e40p_pkg_PC_EXCEPTION;
						exc_pc_mux_o = cv32e40p_pkg_EXC_PC_IRQ;
						exc_cause_o = irq_id_ctrl_i;
						csr_irq_sec_o = irq_sec_ctrl_i;
						irq_ack_o = 1'b1;
						irq_id_o = irq_id_ctrl_i;
						if (irq_sec_ctrl_i)
							trap_addr_mux_o = cv32e40p_pkg_TRAP_MACHINE;
						else
							trap_addr_mux_o = (current_priv_lvl_i == 2'b00 ? cv32e40p_pkg_TRAP_USER : cv32e40p_pkg_TRAP_MACHINE);
						csr_save_cause_o = 1'b1;
						csr_cause_o = {1'b1, irq_id_ctrl_i};
						csr_save_id_o = 1'b1;
					end
				end
			5'd7:
				if (COREV_CLUSTER == 1'b1) begin
					is_decoding_o = 1'b0;
					halt_if_o = 1'b1;
					halt_id_o = 1'b1;
					if (id_ready_i)
						ctrl_fsm_ns = ((debug_req_pending || trigger_match_i) & ~debug_mode_q ? 5'd13 : 5'd6);
					else
						ctrl_fsm_ns = 5'd7;
					perf_pipeline_stall_o = data_load_event_i;
				end
			5'd9: begin
				is_decoding_o = 1'b0;
				halt_if_o = 1'b1;
				halt_id_o = 1'b1;
				ctrl_fsm_ns = 5'd5;
				if (data_err_q) begin
					pc_mux_o = cv32e40p_pkg_PC_EXCEPTION;
					pc_set_o = 1'b1;
					trap_addr_mux_o = cv32e40p_pkg_TRAP_MACHINE;
					exc_pc_mux_o = cv32e40p_pkg_EXC_PC_EXCEPTION;
					exc_cause_o = (data_we_ex_i ? cv32e40p_pkg_EXC_CAUSE_LOAD_FAULT : cv32e40p_pkg_EXC_CAUSE_STORE_FAULT);
				end
				else if (is_fetch_failed_i) begin
					pc_mux_o = cv32e40p_pkg_PC_EXCEPTION;
					pc_set_o = 1'b1;
					trap_addr_mux_o = cv32e40p_pkg_TRAP_MACHINE;
					exc_pc_mux_o = (debug_mode_q ? cv32e40p_pkg_EXC_PC_DBE : cv32e40p_pkg_EXC_PC_EXCEPTION);
					exc_cause_o = cv32e40p_pkg_EXC_CAUSE_INSTR_FAULT;
				end
				else if (illegal_insn_q) begin
					pc_mux_o = cv32e40p_pkg_PC_EXCEPTION;
					pc_set_o = 1'b1;
					trap_addr_mux_o = cv32e40p_pkg_TRAP_MACHINE;
					exc_pc_mux_o = (debug_mode_q ? cv32e40p_pkg_EXC_PC_DBE : cv32e40p_pkg_EXC_PC_EXCEPTION);
					illegal_insn_n = 1'b0;
					if (debug_single_step_i && ~debug_mode_q)
						ctrl_fsm_ns = 5'd12;
				end
				else
					(* full_case, parallel_case *)
					case (1'b1)
						ebrk_insn_i: begin
							pc_mux_o = cv32e40p_pkg_PC_EXCEPTION;
							pc_set_o = 1'b1;
							trap_addr_mux_o = cv32e40p_pkg_TRAP_MACHINE;
							exc_pc_mux_o = cv32e40p_pkg_EXC_PC_EXCEPTION;
							if (debug_single_step_i && ~debug_mode_q)
								ctrl_fsm_ns = 5'd12;
						end
						ecall_insn_i: begin
							pc_mux_o = cv32e40p_pkg_PC_EXCEPTION;
							pc_set_o = 1'b1;
							trap_addr_mux_o = cv32e40p_pkg_TRAP_MACHINE;
							exc_pc_mux_o = (debug_mode_q ? cv32e40p_pkg_EXC_PC_DBE : cv32e40p_pkg_EXC_PC_EXCEPTION);
							if (debug_single_step_i && ~debug_mode_q)
								ctrl_fsm_ns = 5'd12;
						end
						mret_insn_i: begin
							csr_restore_mret_id_o = !debug_mode_q;
							ctrl_fsm_ns = 5'd10;
						end
						uret_insn_i: begin
							csr_restore_uret_id_o = !debug_mode_q;
							ctrl_fsm_ns = 5'd10;
						end
						dret_insn_i: begin
							csr_restore_dret_id_o = 1'b1;
							ctrl_fsm_ns = 5'd10;
						end
						csr_status_i: begin
							if (hwlp_end0_eq_pc && hwlp_counter0_gt_1) begin
								pc_mux_o = cv32e40p_pkg_PC_HWLOOP;
								pc_set_o = 1'b1;
								hwlp_dec_cnt_o[0] = 1'b1;
							end
							if (hwlp_end1_eq_pc && hwlp_counter1_gt_1) begin
								pc_mux_o = cv32e40p_pkg_PC_HWLOOP;
								pc_set_o = 1'b1;
								hwlp_dec_cnt_o[1] = 1'b1;
							end
						end
						wfi_i:
							if (debug_req_pending) begin
								ctrl_fsm_ns = 5'd12;
								debug_force_wakeup_n = 1'b1;
							end
							else
								ctrl_fsm_ns = 5'd3;
						fencei_insn_i: begin
							pc_mux_o = cv32e40p_pkg_PC_FENCEI;
							pc_set_o = 1'b1;
						end
						default:
							;
					endcase
			end
			5'd10: begin
				is_decoding_o = 1'b0;
				ctrl_fsm_ns = 5'd5;
				(* full_case, parallel_case *)
				case (1'b1)
					mret_dec_i: begin
						pc_mux_o = (debug_mode_q ? cv32e40p_pkg_PC_EXCEPTION : cv32e40p_pkg_PC_MRET);
						pc_set_o = 1'b1;
						exc_pc_mux_o = cv32e40p_pkg_EXC_PC_DBE;
					end
					uret_dec_i: begin
						pc_mux_o = (debug_mode_q ? cv32e40p_pkg_PC_EXCEPTION : cv32e40p_pkg_PC_URET);
						pc_set_o = 1'b1;
						exc_pc_mux_o = cv32e40p_pkg_EXC_PC_DBE;
					end
					dret_dec_i: begin
						pc_mux_o = cv32e40p_pkg_PC_DRET;
						pc_set_o = 1'b1;
						debug_mode_n = 1'b0;
					end
					default:
						;
				endcase
				if (debug_single_step_i && ~debug_mode_q)
					ctrl_fsm_ns = 5'd12;
			end
			5'd14: begin
				is_decoding_o = 1'b0;
				halt_if_o = 1'b1;
				if (branch_taken_ex_i) begin
					pc_mux_o = cv32e40p_pkg_PC_BRANCH;
					pc_set_o = 1'b1;
				end
				ctrl_fsm_ns = 5'd13;
			end
			5'd11: begin
				is_decoding_o = 1'b0;
				pc_set_o = 1'b1;
				pc_mux_o = cv32e40p_pkg_PC_EXCEPTION;
				exc_pc_mux_o = cv32e40p_pkg_EXC_PC_DBD;
				if (~debug_mode_q) begin
					csr_save_cause_o = 1'b1;
					csr_save_id_o = 1'b1;
					debug_csr_save_o = 1'b1;
					if (trigger_match_i)
						debug_cause_o = cv32e40p_pkg_DBG_CAUSE_TRIGGER;
					else if (ebrk_force_debug_mode & ebrk_insn_i)
						debug_cause_o = cv32e40p_pkg_DBG_CAUSE_EBREAK;
					else if (debug_req_entry_q)
						debug_cause_o = cv32e40p_pkg_DBG_CAUSE_HALTREQ;
				end
				debug_req_entry_n = 1'b0;
				ctrl_fsm_ns = 5'd5;
				debug_mode_n = 1'b1;
			end
			5'd12: begin
				is_decoding_o = 1'b0;
				pc_set_o = 1'b1;
				pc_mux_o = cv32e40p_pkg_PC_EXCEPTION;
				exc_pc_mux_o = cv32e40p_pkg_EXC_PC_DBD;
				csr_save_cause_o = 1'b1;
				debug_csr_save_o = 1'b1;
				if (debug_force_wakeup_q)
					debug_cause_o = cv32e40p_pkg_DBG_CAUSE_HALTREQ;
				else if (debug_single_step_i)
					debug_cause_o = cv32e40p_pkg_DBG_CAUSE_STEP;
				csr_save_if_o = 1'b1;
				ctrl_fsm_ns = 5'd5;
				debug_mode_n = 1'b1;
				debug_force_wakeup_n = 1'b0;
			end
			5'd13: begin
				is_decoding_o = 1'b0;
				halt_if_o = 1'b1;
				halt_id_o = 1'b1;
				perf_pipeline_stall_o = data_load_event_i;
				if (data_err_i) begin
					csr_save_ex_o = 1'b1;
					csr_save_cause_o = 1'b1;
					data_err_ack_o = 1'b1;
					csr_cause_o = {1'b0, (data_we_ex_i ? cv32e40p_pkg_EXC_CAUSE_STORE_FAULT : cv32e40p_pkg_EXC_CAUSE_LOAD_FAULT)};
					ctrl_fsm_ns = 5'd9;
				end
				else if ((((debug_mode_q | trigger_match_i) | (ebrk_force_debug_mode & ebrk_insn_i)) | data_load_event_i) | debug_req_entry_q)
					ctrl_fsm_ns = 5'd11;
				else
					ctrl_fsm_ns = 5'd12;
			end
			default: begin
				is_decoding_o = 1'b0;
				instr_req_o = 1'b0;
				ctrl_fsm_ns = 5'd0;
			end
		endcase
	end
	generate
		if (COREV_PULP) begin : gen_hwlp
			assign hwlp_jump_o = (hwlp_end_4_id_d && !hwlp_end_4_id_q ? 1'b1 : 1'b0);
			always @(posedge clk or negedge rst_n)
				if (!rst_n)
					hwlp_end_4_id_q <= 1'b0;
				else
					hwlp_end_4_id_q <= hwlp_end_4_id_d;
			assign hwlp_end0_eq_pc = hwlp_end_addr_i[0+:32] == (pc_id_i + 4);
			assign hwlp_end1_eq_pc = hwlp_end_addr_i[32+:32] == (pc_id_i + 4);
			assign hwlp_counter0_gt_1 = hwlp_counter_i[0+:32] > 1;
			assign hwlp_counter1_gt_1 = hwlp_counter_i[32+:32] > 1;
			assign hwlp_counter0_eq_1 = hwlp_counter_i[0+:32] == 1;
			assign hwlp_counter1_eq_1 = hwlp_counter_i[32+:32] == 1;
			assign hwlp_end0_eq_pc_plus4 = hwlp_end_addr_i[0+:32] == (pc_id_i + 8);
			assign hwlp_end1_eq_pc_plus4 = hwlp_end_addr_i[32+:32] == (pc_id_i + 8);
			assign hwlp_start0_leq_pc = hwlp_start_addr_i[0+:32] <= pc_id_i;
			assign hwlp_start1_leq_pc = hwlp_start_addr_i[32+:32] <= pc_id_i;
			assign hwlp_end0_geq_pc = hwlp_end_addr_i[0+:32] >= (pc_id_i + 4);
			assign hwlp_end1_geq_pc = hwlp_end_addr_i[32+:32] >= (pc_id_i + 4);
			assign is_hwlp_body = ((hwlp_start0_leq_pc && hwlp_end0_geq_pc) && hwlp_counter0_gt_1) || ((hwlp_start1_leq_pc && hwlp_end1_geq_pc) && hwlp_counter1_gt_1);
		end
		else begin : gen_no_hwlp
			assign hwlp_jump_o = 1'b0;
			wire [1:1] sv2v_tmp_64C4D;
			assign sv2v_tmp_64C4D = 1'b0;
			always @(*) hwlp_end_4_id_q = sv2v_tmp_64C4D;
			assign hwlp_end0_eq_pc = 1'b0;
			assign hwlp_end1_eq_pc = 1'b0;
			assign hwlp_counter0_gt_1 = 1'b0;
			assign hwlp_counter1_gt_1 = 1'b0;
			assign hwlp_counter0_eq_1 = 1'b0;
			assign hwlp_counter1_eq_1 = 1'b0;
			assign hwlp_end0_eq_pc_plus4 = 1'b0;
			assign hwlp_end1_eq_pc_plus4 = 1'b0;
			assign hwlp_start0_leq_pc = 1'b0;
			assign hwlp_start1_leq_pc = 1'b0;
			assign hwlp_end0_geq_pc = 1'b0;
			assign hwlp_end1_geq_pc = 1'b0;
			assign is_hwlp_body = 1'b0;
		end
	endgenerate
	always @(*) begin
		if (_sv2v_0)
			;
		load_stall_o = 1'b0;
		deassert_we_o = 1'b0;
		if (~is_decoding_o)
			deassert_we_o = 1'b1;
		if (illegal_insn_i)
			deassert_we_o = 1'b1;
		if ((((data_req_ex_i == 1'b1) && (regfile_we_ex_i == 1'b1)) || ((wb_ready_i == 1'b0) && (regfile_we_wb_i == 1'b1))) && ((((reg_d_ex_is_reg_a_i == 1'b1) || (reg_d_ex_is_reg_b_i == 1'b1)) || (reg_d_ex_is_reg_c_i == 1'b1)) || ((is_decoding_o && (regfile_we_id_i && !data_misaligned_i)) && (regfile_waddr_ex_i == regfile_alu_waddr_id_i)))) begin
			deassert_we_o = 1'b1;
			load_stall_o = 1'b1;
		end
		if ((ctrl_transfer_insn_in_dec_i == cv32e40p_pkg_BRANCH_JALR) && ((((regfile_we_wb_i == 1'b1) && (reg_d_wb_is_reg_a_i == 1'b1)) || ((regfile_we_ex_i == 1'b1) && (reg_d_ex_is_reg_a_i == 1'b1))) || ((regfile_alu_we_fw_i == 1'b1) && (reg_d_alu_is_reg_a_i == 1'b1)))) begin
			jr_stall_o = 1'b1;
			deassert_we_o = 1'b1;
		end
		else
			jr_stall_o = 1'b0;
	end
	assign misaligned_stall_o = data_misaligned_i;
	assign apu_stall_o = apu_read_dep_i | (apu_write_dep_i & ~apu_en_i);
	localparam cv32e40p_pkg_SEL_FW_EX = 2'b01;
	localparam cv32e40p_pkg_SEL_FW_WB = 2'b10;
	localparam cv32e40p_pkg_SEL_REGFILE = 2'b00;
	always @(*) begin
		if (_sv2v_0)
			;
		operand_a_fw_mux_sel_o = cv32e40p_pkg_SEL_REGFILE;
		operand_b_fw_mux_sel_o = cv32e40p_pkg_SEL_REGFILE;
		operand_c_fw_mux_sel_o = cv32e40p_pkg_SEL_REGFILE;
		if (regfile_we_wb_i == 1'b1) begin
			if (reg_d_wb_is_reg_a_i == 1'b1)
				operand_a_fw_mux_sel_o = cv32e40p_pkg_SEL_FW_WB;
			if (reg_d_wb_is_reg_b_i == 1'b1)
				operand_b_fw_mux_sel_o = cv32e40p_pkg_SEL_FW_WB;
			if (reg_d_wb_is_reg_c_i == 1'b1)
				operand_c_fw_mux_sel_o = cv32e40p_pkg_SEL_FW_WB;
		end
		if (regfile_alu_we_fw_i == 1'b1) begin
			if (reg_d_alu_is_reg_a_i == 1'b1)
				operand_a_fw_mux_sel_o = cv32e40p_pkg_SEL_FW_EX;
			if (reg_d_alu_is_reg_b_i == 1'b1)
				operand_b_fw_mux_sel_o = cv32e40p_pkg_SEL_FW_EX;
			if (reg_d_alu_is_reg_c_i == 1'b1)
				operand_c_fw_mux_sel_o = cv32e40p_pkg_SEL_FW_EX;
		end
		if (data_misaligned_i) begin
			operand_a_fw_mux_sel_o = cv32e40p_pkg_SEL_FW_EX;
			operand_b_fw_mux_sel_o = cv32e40p_pkg_SEL_REGFILE;
		end
		else if (mult_multicycle_i)
			operand_c_fw_mux_sel_o = cv32e40p_pkg_SEL_FW_EX;
	end
	always @(posedge clk or negedge rst_n) begin : UPDATE_REGS
		if (rst_n == 1'b0) begin
			ctrl_fsm_cs <= 5'd0;
			jump_done_q <= 1'b0;
			data_err_q <= 1'b0;
			debug_mode_q <= 1'b0;
			illegal_insn_q <= 1'b0;
			debug_req_entry_q <= 1'b0;
			debug_force_wakeup_q <= 1'b0;
		end
		else begin
			ctrl_fsm_cs <= ctrl_fsm_ns;
			jump_done_q <= jump_done & ~id_ready_i;
			data_err_q <= data_err_i;
			debug_mode_q <= debug_mode_n;
			illegal_insn_q <= illegal_insn_n;
			debug_req_entry_q <= debug_req_entry_n;
			debug_force_wakeup_q <= debug_force_wakeup_n;
		end
	end
	assign wake_from_sleep_o = (irq_wu_ctrl_i || debug_req_pending) || debug_mode_q;
	assign debug_mode_o = debug_mode_q;
	assign debug_req_pending = debug_req_i || debug_req_q;
	assign debug_p_elw_no_sleep_o = ((debug_mode_q || debug_req_q) || debug_single_step_i) || trigger_match_i;
	assign debug_wfi_no_sleep_o = (((debug_mode_q || debug_req_pending) || debug_single_step_i) || trigger_match_i) || COREV_CLUSTER;
	assign wfi_active = wfi_i & ~debug_wfi_no_sleep_o;
	always @(posedge clk_ungated_i or negedge rst_n)
		if (!rst_n)
			debug_req_q <= 1'b0;
		else if (debug_req_i)
			debug_req_q <= 1'b1;
		else if (debug_mode_q)
			debug_req_q <= 1'b0;
	always @(posedge clk or negedge rst_n)
		if (rst_n == 1'b0)
			debug_fsm_cs <= 3'b001;
		else
			debug_fsm_cs <= debug_fsm_ns;
	always @(*) begin
		if (_sv2v_0)
			;
		debug_fsm_ns = debug_fsm_cs;
		case (debug_fsm_cs)
			3'b001:
				if (debug_mode_n || (ctrl_fsm_ns == 5'd4)) begin
					if (debug_mode_n)
						debug_fsm_ns = 3'b100;
					else
						debug_fsm_ns = 3'b010;
				end
			3'b010:
				if (debug_mode_n)
					debug_fsm_ns = 3'b100;
			3'b100:
				if (!debug_mode_n)
					debug_fsm_ns = 3'b010;
			default: debug_fsm_ns = 3'b001;
		endcase
	end
	localparam cv32e40p_pkg_HAVERESET_INDEX = 0;
	assign debug_havereset_o = debug_fsm_cs[cv32e40p_pkg_HAVERESET_INDEX];
	localparam cv32e40p_pkg_RUNNING_INDEX = 1;
	assign debug_running_o = debug_fsm_cs[cv32e40p_pkg_RUNNING_INDEX];
	localparam cv32e40p_pkg_HALTED_INDEX = 2;
	assign debug_halted_o = debug_fsm_cs[cv32e40p_pkg_HALTED_INDEX];
	initial _sv2v_0 = 0;
endmodule
