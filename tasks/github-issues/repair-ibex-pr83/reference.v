module ibex_cs_registers (
	clk_i,
	rst_ni,
	core_id_i,
	cluster_id_i,
	boot_addr_i,
	csr_access_i,
	csr_addr_i,
	csr_wdata_i,
	csr_op_i,
	csr_rdata_o,
	m_irq_enable_o,
	mepc_o,
	debug_cause_i,
	debug_csr_save_i,
	depc_o,
	debug_single_step_o,
	debug_ebreakm_o,
	pc_if_i,
	pc_id_i,
	csr_save_if_i,
	csr_save_id_i,
	csr_restore_mret_i,
	csr_restore_dret_i,
	csr_cause_i,
	csr_save_cause_i,
	illegal_csr_insn_o,
	insn_ret_i,
	id_valid_i,
	is_compressed_i,
	is_decoding_i,
	imiss_i,
	pc_set_i,
	jump_i,
	branch_i,
	branch_taken_i,
	mem_load_i,
	mem_store_i,
	lsu_busy_i
);
	reg _sv2v_0;
	parameter [31:0] MHPMCounterNum = 8;
	parameter [31:0] MHPMCounterWidth = 40;
	parameter [0:0] RV32E = 0;
	parameter [0:0] RV32M = 0;
	input wire clk_i;
	input wire rst_ni;
	input wire [3:0] core_id_i;
	input wire [5:0] cluster_id_i;
	input wire [31:0] boot_addr_i;
	input wire csr_access_i;
	input wire [11:0] csr_addr_i;
	input wire [31:0] csr_wdata_i;
	input wire [1:0] csr_op_i;
	output wire [31:0] csr_rdata_o;
	output wire m_irq_enable_o;
	output wire [31:0] mepc_o;
	input wire [2:0] debug_cause_i;
	input wire debug_csr_save_i;
	output wire [31:0] depc_o;
	output wire debug_single_step_o;
	output wire debug_ebreakm_o;
	input wire [31:0] pc_if_i;
	input wire [31:0] pc_id_i;
	input wire csr_save_if_i;
	input wire csr_save_id_i;
	input wire csr_restore_mret_i;
	input wire csr_restore_dret_i;
	input wire [5:0] csr_cause_i;
	input wire csr_save_cause_i;
	output wire illegal_csr_insn_o;
	input wire insn_ret_i;
	input wire id_valid_i;
	input wire is_compressed_i;
	input wire is_decoding_i;
	input wire imiss_i;
	input wire pc_set_i;
	input wire jump_i;
	input wire branch_i;
	input wire branch_taken_i;
	input wire mem_load_i;
	input wire mem_store_i;
	input wire lsu_busy_i;
	localparam [1:0] MXL = 2'd1;
	localparam [31:0] MISA_VALUE = ((((((((4 | (RV32E << 4)) | 0) | 256) | (RV32M << 12)) | 0) | 0) | 0) | 0) | (MXL << 30);
	reg [31:0] mcountinhibit_n;
	reg [31:0] mcountinhibit_q;
	wire [31:0] mcountinhibit;
	wire [31:0] mcountinhibit_force;
	reg mcountinhibit_we;
	reg [63:0] mhpmcounter_mask [0:31];
	reg [2047:0] mhpmcounter_n;
	reg [2047:0] mhpmcounter_q;
	reg [31:0] mhpmcounter_we;
	reg [31:0] mhpmcounterh_we;
	reg [31:0] mhpmcounter_incr;
	reg [31:0] mhpmevent [0:31];
	wire [4:0] mhpmcounter_idx;
	reg [31:0] csr_wdata_int;
	reg [31:0] csr_rdata_int;
	reg csr_we_int;
	reg [31:0] mepc_q;
	reg [31:0] mepc_n;
	reg [31:0] dcsr_q;
	reg [31:0] dcsr_n;
	reg [31:0] depc_q;
	reg [31:0] depc_n;
	reg [31:0] dscratch0_q;
	reg [31:0] dscratch0_n;
	reg [31:0] dscratch1_q;
	reg [31:0] dscratch1_n;
	reg [5:0] mcause_q;
	reg [5:0] mcause_n;
	reg [3:0] mstatus_q;
	reg [3:0] mstatus_n;
	reg [31:0] exception_pc;
	reg illegal_csr;
	wire illegal_csr_priv;
	wire illegal_csr_write;
	wire [11:0] csr_addr;
	assign csr_addr = {csr_addr_i};
	assign mhpmcounter_idx = csr_addr[4:0];
	assign illegal_csr_priv = 1'b0;
	assign illegal_csr_write = (csr_addr[11:10] == 2'b11) && csr_we_int;
	assign illegal_csr_insn_o = (illegal_csr | illegal_csr_write) | illegal_csr_priv;
	localparam [11:0] ibex_defines_CSR_MASK_MCOUNTER = 12'hfe0;
	localparam [11:0] ibex_defines_CSR_OFF_MCOUNTER = 12'hb00;
	localparam [11:0] ibex_defines_CSR_OFF_MCOUNTERH = 12'hb80;
	localparam [11:0] ibex_defines_CSR_OFF_MCOUNTER_SETUP = 12'h320;
	always @(*) begin
		if (_sv2v_0)
			;
		csr_rdata_int = 1'sb0;
		illegal_csr = 1'b0;
		(* full_case, parallel_case *)
		case (csr_addr_i)
			12'h300: csr_rdata_int = {19'b0000000000000000000, mstatus_q[1-:2], 3'b000, mstatus_q[2], 3'h0, mstatus_q[3], 3'h0};
			12'h305: csr_rdata_int = boot_addr_i;
			12'h341: csr_rdata_int = mepc_q;
			12'h342: csr_rdata_int = {mcause_q[5], 26'b00000000000000000000000000, mcause_q[4:0]};
			12'hf14: csr_rdata_int = {21'b000000000000000000000, cluster_id_i[5:0], 1'b0, core_id_i[3:0]};
			12'h301: csr_rdata_int = MISA_VALUE;
			12'h7b0: csr_rdata_int = dcsr_q;
			12'h7b1: csr_rdata_int = depc_q;
			12'h7b2: csr_rdata_int = dscratch0_q;
			12'h7b3: csr_rdata_int = dscratch1_q;
			12'h320: csr_rdata_int = mcountinhibit;
			12'hb00: csr_rdata_int = mhpmcounter_q[2015-:32];
			12'hb80: csr_rdata_int = mhpmcounter_q[2047-:32];
			12'hb02: csr_rdata_int = mhpmcounter_q[1887-:32];
			12'hb82: csr_rdata_int = mhpmcounter_q[1919-:32];
			default:
				if ((csr_addr & ibex_defines_CSR_MASK_MCOUNTER) == ibex_defines_CSR_OFF_MCOUNTER_SETUP) begin
					csr_rdata_int = mhpmevent[mhpmcounter_idx];
					if (((csr_addr[4:0] == 5'b00000) || (csr_addr[4:0] == 5'b00001)) || (csr_addr[4:0] == 5'b00010))
						illegal_csr = csr_access_i;
				end
				else if ((csr_addr & ibex_defines_CSR_MASK_MCOUNTER) == ibex_defines_CSR_OFF_MCOUNTER) begin
					csr_rdata_int = mhpmcounter_q[((31 - mhpmcounter_idx) * 64) + 31-:32];
					if (((csr_addr[4:0] == 5'b00000) || (csr_addr[4:0] == 5'b00001)) || (csr_addr[4:0] == 5'b00010))
						illegal_csr = csr_access_i;
				end
				else if ((csr_addr & ibex_defines_CSR_MASK_MCOUNTER) == ibex_defines_CSR_OFF_MCOUNTERH) begin
					csr_rdata_int = mhpmcounter_q[((31 - mhpmcounter_idx) * 64) + 63-:32];
					if (((csr_addr[4:0] == 5'b00000) || (csr_addr[4:0] == 5'b00001)) || (csr_addr[4:0] == 5'b00010))
						illegal_csr = csr_access_i;
				end
				else
					illegal_csr = csr_access_i;
		endcase
	end
	always @(*) begin
		if (_sv2v_0)
			;
		mepc_n = mepc_q;
		depc_n = depc_q;
		dcsr_n = dcsr_q;
		dscratch0_n = dscratch0_q;
		dscratch1_n = dscratch1_q;
		mstatus_n = mstatus_q;
		mcause_n = mcause_q;
		exception_pc = pc_id_i;
		mcountinhibit_we = 1'b0;
		mhpmcounter_we = 1'sb0;
		mhpmcounterh_we = 1'sb0;
		(* full_case, parallel_case *)
		case (csr_addr_i)
			12'h300:
				if (csr_we_int)
					mstatus_n = {csr_wdata_int[3], csr_wdata_int[7], 2'b11};
			12'h341:
				if (csr_we_int)
					mepc_n = csr_wdata_int;
			12'h342:
				if (csr_we_int)
					mcause_n = {csr_wdata_int[31], csr_wdata_int[4:0]};
			12'h7b0:
				if (csr_we_int) begin
					dcsr_n = csr_wdata_int;
					dcsr_n[31-:4] = 4'd4;
					dcsr_n[1-:2] = 2'b11;
					dcsr_n[3] = 1'b0;
					dcsr_n[4] = 1'b0;
					dcsr_n[10] = 1'b0;
					dcsr_n[9] = 1'b0;
					dcsr_n[5] = 1'b0;
					dcsr_n[14] = 1'b0;
					dcsr_n[27-:12] = 12'h000;
				end
			12'h7b1:
				if (csr_we_int && (csr_wdata_int[0] == 1'b0))
					depc_n = csr_wdata_int;
			12'h7b2:
				if (csr_we_int)
					dscratch0_n = csr_wdata_int;
			12'h7b3:
				if (csr_we_int)
					dscratch1_n = csr_wdata_int;
			12'h320:
				if (csr_we_int)
					mcountinhibit_we = 1'b1;
			12'hb00:
				if (csr_we_int)
					mhpmcounter_we[0] = 1'b1;
			12'hb80:
				if (csr_we_int)
					mhpmcounterh_we[0] = 1'b1;
			12'hb02:
				if (csr_we_int)
					mhpmcounter_we[2] = 1'b1;
			12'hb82:
				if (csr_we_int)
					mhpmcounterh_we[2] = 1'b1;
			default:
				if (csr_we_int == 1'b1) begin
					if ((csr_addr & ibex_defines_CSR_MASK_MCOUNTER) == ibex_defines_CSR_OFF_MCOUNTER)
						mhpmcounter_we[mhpmcounter_idx] = 1'b1;
					else if ((csr_addr & ibex_defines_CSR_MASK_MCOUNTER) == ibex_defines_CSR_OFF_MCOUNTERH)
						mhpmcounterh_we[mhpmcounter_idx] = 1'b1;
				end
		endcase
		(* full_case, parallel_case *)
		case (1'b1)
			csr_save_cause_i: begin
				(* full_case, parallel_case *)
				case (1'b1)
					csr_save_if_i: exception_pc = pc_if_i;
					csr_save_id_i: exception_pc = pc_id_i;
					default:
						;
				endcase
				if (debug_csr_save_i) begin
					dcsr_n[1-:2] = 2'b11;
					dcsr_n[8-:3] = debug_cause_i;
					depc_n = exception_pc;
				end
				else begin
					mstatus_n[2] = mstatus_q[3];
					mstatus_n[3] = 1'b0;
					mstatus_n[1-:2] = 2'b11;
					mepc_n = exception_pc;
					mcause_n = csr_cause_i;
				end
			end
			csr_restore_mret_i: begin
				mstatus_n[3] = mstatus_q[2];
				mstatus_n[2] = 1'b1;
			end
			csr_restore_dret_i: begin
				mstatus_n[3] = mstatus_q[2];
				mstatus_n[2] = 1'b1;
			end
			default:
				;
		endcase
	end
	always @(*) begin
		if (_sv2v_0)
			;
		csr_we_int = 1'b1;
		(* full_case, parallel_case *)
		case (csr_op_i)
			2'd1: csr_wdata_int = csr_wdata_i;
			2'd2: csr_wdata_int = csr_wdata_i | csr_rdata_o;
			2'd3: csr_wdata_int = ~csr_wdata_i & csr_rdata_o;
			2'd0: begin
				csr_wdata_int = csr_wdata_i;
				csr_we_int = 1'b0;
			end
			default: begin
				csr_wdata_int = 1'sbx;
				csr_we_int = 1'bx;
			end
		endcase
	end
	assign csr_rdata_o = csr_rdata_int;
	assign m_irq_enable_o = mstatus_q[3];
	assign mepc_o = mepc_q;
	assign depc_o = depc_q;
	assign debug_single_step_o = dcsr_q[2];
	assign debug_ebreakm_o = dcsr_q[15];
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni) begin
			mstatus_q <= 4'b0011;
			mepc_q <= 1'sb0;
			mcause_q <= 1'sb0;
			depc_q <= 1'sb0;
			dcsr_q <= 32'h00000003;
			dscratch0_q <= 1'sb0;
			dscratch1_q <= 1'sb0;
		end
		else begin
			mstatus_q <= {mstatus_n[3], mstatus_n[2], 2'b11};
			mepc_q <= mepc_n;
			mcause_q <= mcause_n;
			depc_q <= depc_n;
			dcsr_q <= dcsr_n;
			dscratch0_q <= dscratch0_n;
			dscratch1_q <= dscratch1_n;
		end
	always @(*) begin : mcountinhibit_update
		if (_sv2v_0)
			;
		if (mcountinhibit_we == 1'b1)
			mcountinhibit_n = csr_wdata_int;
		else
			mcountinhibit_n = mcountinhibit_q;
		mcountinhibit_n[1] = 1'b0;
	end
	assign mcountinhibit_force = {{29 - MHPMCounterNum {1'b1}}, {MHPMCounterNum {1'b0}}, 3'b000};
	assign mcountinhibit = mcountinhibit_q | mcountinhibit_force;
	always @(*) begin : gen_mhpmcounter_incr
		if (_sv2v_0)
			;
		mhpmcounter_incr[0] = 1'b1;
		mhpmcounter_incr[1] = 1'b0;
		mhpmcounter_incr[2] = insn_ret_i;
		mhpmcounter_incr[3] = lsu_busy_i;
		mhpmcounter_incr[4] = imiss_i & ~pc_set_i;
		mhpmcounter_incr[5] = mem_load_i;
		mhpmcounter_incr[6] = mem_store_i;
		mhpmcounter_incr[7] = jump_i;
		mhpmcounter_incr[8] = branch_i;
		mhpmcounter_incr[9] = branch_taken_i;
		mhpmcounter_incr[10] = (is_compressed_i & id_valid_i) & is_decoding_i;
		begin : sv2v_autoblock_1
			reg [31:0] i;
			for (i = 3 + MHPMCounterNum; i < 32; i = i + 1)
				begin : gen_mhpmcounter_incr_inactive
					mhpmcounter_incr[i] = 1'b0;
				end
		end
	end
	always @(*) begin : gen_mhpmevent
		if (_sv2v_0)
			;
		begin : sv2v_autoblock_2
			reg signed [31:0] i;
			for (i = 0; i < 32; i = i + 1)
				begin : gen_mhpmevent_active
					mhpmevent[i] = 1'sb0;
					mhpmevent[i][i] = 1'b1;
				end
		end
		mhpmevent[1] = 1'sb0;
		begin : sv2v_autoblock_3
			reg [31:0] i;
			for (i = 3 + MHPMCounterNum; i < 32; i = i + 1)
				begin : gen_mhpmevent_inactive
					mhpmevent[i] = 1'sb0;
				end
		end
	end
	always @(*) begin : gen_mask
		if (_sv2v_0)
			;
		begin : sv2v_autoblock_4
			reg signed [31:0] i;
			for (i = 0; i < 3; i = i + 1)
				begin : gen_mask_fixed
					mhpmcounter_mask[i] = {64 {1'b1}};
				end
		end
		begin : sv2v_autoblock_5
			reg [31:0] i;
			for (i = 3; i < (3 + MHPMCounterNum); i = i + 1)
				begin : gen_mask_configurable
					mhpmcounter_mask[i] = {{64 - MHPMCounterWidth {1'b0}}, {MHPMCounterWidth {1'b1}}};
				end
		end
		begin : sv2v_autoblock_6
			reg [31:0] i;
			for (i = 3 + MHPMCounterNum; i < 32; i = i + 1)
				begin : gen_mask_inactive
					mhpmcounter_mask[i] = 1'sb0;
				end
		end
	end
	always @(*) begin : mhpmcounter_update
		if (_sv2v_0)
			;
		mhpmcounter_n = mhpmcounter_q;
		begin : sv2v_autoblock_7
			reg signed [31:0] i;
			for (i = 0; i < 32; i = i + 1)
				begin : gen_mhpmcounter_update
					if (mhpmcounter_incr[i] & ~mcountinhibit[i])
						mhpmcounter_n[(31 - i) * 64+:64] = mhpmcounter_mask[i] & (mhpmcounter_q[(31 - i) * 64+:64] + 64'h0000000000000001);
					if (mhpmcounter_we[i])
						mhpmcounter_n[((31 - i) * 64) + 31-:32] = mhpmcounter_mask[i][31:0] & csr_wdata_int;
					else if (mhpmcounterh_we[i])
						mhpmcounter_n[((31 - i) * 64) + 63-:32] = mhpmcounter_mask[i][63:32] & csr_wdata_int;
				end
		end
	end
	always @(posedge clk_i or negedge rst_ni) begin : perf_counter_registers
		if (!rst_ni) begin
			mcountinhibit_q <= 1'sb0;
			begin : sv2v_autoblock_8
				reg signed [31:0] i;
				for (i = 0; i < 32; i = i + 1)
					mhpmcounter_q[(31 - i) * 64+:64] <= 1'sb0;
			end
		end
		else begin
			mhpmcounter_q <= mhpmcounter_n;
			mcountinhibit_q <= mcountinhibit_n;
		end
	end
	initial _sv2v_0 = 0;
endmodule
