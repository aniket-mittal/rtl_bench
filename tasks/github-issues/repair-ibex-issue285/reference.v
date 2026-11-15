module ibex_cs_registers (
	clk_i,
	rst_ni,
	hart_id_i,
	priv_mode_o,
	csr_mtvec_o,
	csr_mtvec_init_i,
	boot_addr_i,
	csr_access_i,
	csr_addr_i,
	csr_wdata_i,
	csr_op_i,
	csr_rdata_o,
	irq_software_i,
	irq_timer_i,
	irq_external_i,
	irq_fast_i,
	irq_pending_o,
	csr_msip_o,
	csr_mtip_o,
	csr_meip_o,
	csr_mfip_o,
	csr_mstatus_mie_o,
	csr_mepc_o,
	csr_pmp_cfg_o,
	csr_pmp_addr_o,
	debug_mode_i,
	debug_cause_i,
	debug_csr_save_i,
	csr_depc_o,
	debug_single_step_o,
	debug_ebreakm_o,
	pc_if_i,
	pc_id_i,
	csr_save_if_i,
	csr_save_id_i,
	csr_restore_mret_i,
	csr_save_cause_i,
	csr_mcause_i,
	csr_mtval_i,
	illegal_csr_insn_o,
	instr_new_id_i,
	instr_ret_i,
	instr_ret_compressed_i,
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
	parameter [0:0] PMPEnable = 0;
	parameter [31:0] PMPGranularity = 0;
	parameter [31:0] PMPNumRegions = 4;
	parameter [0:0] RV32E = 0;
	parameter [0:0] RV32M = 0;
	input wire clk_i;
	input wire rst_ni;
	input wire [31:0] hart_id_i;
	output wire [1:0] priv_mode_o;
	output wire [31:0] csr_mtvec_o;
	input wire csr_mtvec_init_i;
	input wire [31:0] boot_addr_i;
	input wire csr_access_i;
	input wire [11:0] csr_addr_i;
	input wire [31:0] csr_wdata_i;
	input wire [1:0] csr_op_i;
	output wire [31:0] csr_rdata_o;
	input wire irq_software_i;
	input wire irq_timer_i;
	input wire irq_external_i;
	input wire [14:0] irq_fast_i;
	output wire irq_pending_o;
	output wire csr_msip_o;
	output wire csr_mtip_o;
	output wire csr_meip_o;
	output wire [14:0] csr_mfip_o;
	output wire csr_mstatus_mie_o;
	output wire [31:0] csr_mepc_o;
	output wire [(PMPNumRegions * 6) - 1:0] csr_pmp_cfg_o;
	output wire [(PMPNumRegions * 34) - 1:0] csr_pmp_addr_o;
	input wire debug_mode_i;
	input wire [2:0] debug_cause_i;
	input wire debug_csr_save_i;
	output wire [31:0] csr_depc_o;
	output wire debug_single_step_o;
	output wire debug_ebreakm_o;
	input wire [31:0] pc_if_i;
	input wire [31:0] pc_id_i;
	input wire csr_save_if_i;
	input wire csr_save_id_i;
	input wire csr_restore_mret_i;
	input wire csr_save_cause_i;
	input wire [5:0] csr_mcause_i;
	input wire [31:0] csr_mtval_i;
	output wire illegal_csr_insn_o;
	input wire instr_new_id_i;
	input wire instr_ret_i;
	input wire instr_ret_compressed_i;
	input wire imiss_i;
	input wire pc_set_i;
	input wire jump_i;
	input wire branch_i;
	input wire branch_taken_i;
	input wire mem_load_i;
	input wire mem_store_i;
	input wire lsu_busy_i;
	localparam [1:0] MXL = 2'd1;
	function automatic [31:0] sv2v_cast_32;
		input reg [31:0] inp;
		sv2v_cast_32 = inp;
	endfunction
	localparam [31:0] MISA_VALUE = ((((((((4 | (sv2v_cast_32(RV32E) << 4)) | 0) | 256) | (sv2v_cast_32(RV32M) << 12)) | 0) | 0) | 0) | 0) | (sv2v_cast_32(MXL) << 30);
	reg [31:0] exception_pc;
	reg [3:0] mstatus_q;
	reg [3:0] mstatus_d;
	reg [17:0] mie_q;
	reg [17:0] mie_d;
	reg [31:0] mscratch_q;
	reg [31:0] mscratch_d;
	reg [31:0] mepc_q;
	reg [31:0] mepc_d;
	reg [5:0] mcause_q;
	reg [5:0] mcause_d;
	reg [31:0] mtval_q;
	reg [31:0] mtval_d;
	reg [31:0] mtvec_q;
	reg [31:0] mtvec_d;
	wire [17:0] mip;
	reg [31:0] dcsr_q;
	reg [31:0] dcsr_d;
	reg [31:0] depc_q;
	reg [31:0] depc_d;
	reg [31:0] dscratch0_q;
	reg [31:0] dscratch0_d;
	reg [31:0] dscratch1_q;
	reg [31:0] dscratch1_d;
	reg [3:0] mstack_q;
	reg [3:0] mstack_d;
	reg [31:0] mstack_epc_q;
	reg [31:0] mstack_epc_d;
	reg [5:0] mstack_cause_q;
	reg [5:0] mstack_cause_d;
	localparam [31:0] ibex_pkg_PMP_MAX_REGIONS = 16;
	reg [31:0] pmp_addr_rdata [0:15];
	localparam [31:0] ibex_pkg_PMP_CFG_W = 8;
	wire [7:0] pmp_cfg_rdata [0:15];
	reg [31:0] mcountinhibit_d;
	reg [31:0] mcountinhibit_q;
	wire [31:0] mcountinhibit;
	wire [31:0] mcountinhibit_force;
	reg mcountinhibit_we;
	reg [63:0] mhpmcounter_mask [0:31];
	reg [2047:0] mhpmcounter_d;
	reg [2047:0] mhpmcounter_q;
	reg [31:0] mhpmcounter_we;
	reg [31:0] mhpmcounterh_we;
	reg [31:0] mhpmcounter_incr;
	reg [31:0] mhpmevent [0:31];
	wire [4:0] mhpmcounter_idx;
	reg [31:0] csr_wdata_int;
	reg [31:0] csr_rdata_int;
	wire csr_we_int;
	reg csr_wreq;
	reg illegal_csr;
	wire illegal_csr_priv;
	wire illegal_csr_write;
	wire [7:0] unused_boot_addr;
	assign unused_boot_addr = boot_addr_i[7:0];
	wire [11:0] csr_addr;
	assign csr_addr = {csr_addr_i};
	assign mhpmcounter_idx = csr_addr[4:0];
	assign illegal_csr_priv = 1'b0;
	assign illegal_csr_write = (csr_addr[11:10] == 2'b11) && csr_wreq;
	assign illegal_csr_insn_o = (illegal_csr | illegal_csr_write) | illegal_csr_priv;
	assign mip[17] = irq_software_i & mie_q[17];
	assign mip[16] = irq_timer_i & mie_q[16];
	assign mip[15] = irq_external_i & mie_q[15];
	assign mip[14-:15] = irq_fast_i & mie_q[14-:15];
	localparam [11:0] ibex_pkg_CSR_MASK_MCOUNTER = 12'hfe0;
	localparam [31:0] ibex_pkg_CSR_MEIX_BIT = 11;
	localparam [31:0] ibex_pkg_CSR_MFIX_BIT_HIGH = 30;
	localparam [31:0] ibex_pkg_CSR_MFIX_BIT_LOW = 16;
	localparam [31:0] ibex_pkg_CSR_MSIX_BIT = 3;
	localparam [31:0] ibex_pkg_CSR_MSTATUS_MIE_BIT = 3;
	localparam [31:0] ibex_pkg_CSR_MSTATUS_MPIE_BIT = 7;
	localparam [31:0] ibex_pkg_CSR_MSTATUS_MPP_BIT_HIGH = 12;
	localparam [31:0] ibex_pkg_CSR_MSTATUS_MPP_BIT_LOW = 11;
	localparam [31:0] ibex_pkg_CSR_MTIX_BIT = 7;
	localparam [11:0] ibex_pkg_CSR_OFF_MCOUNTER = 12'hb00;
	localparam [11:0] ibex_pkg_CSR_OFF_MCOUNTERH = 12'hb80;
	localparam [11:0] ibex_pkg_CSR_OFF_MCOUNTER_SETUP = 12'h320;
	always @(*) begin
		if (_sv2v_0)
			;
		csr_rdata_int = 1'sb0;
		illegal_csr = 1'b0;
		(* full_case, parallel_case *)
		case (csr_addr_i)
			12'hf14: csr_rdata_int = hart_id_i;
			12'h300: begin
				csr_rdata_int = 1'sb0;
				csr_rdata_int[ibex_pkg_CSR_MSTATUS_MIE_BIT] = mstatus_q[3];
				csr_rdata_int[ibex_pkg_CSR_MSTATUS_MPIE_BIT] = mstatus_q[2];
				csr_rdata_int[ibex_pkg_CSR_MSTATUS_MPP_BIT_HIGH:ibex_pkg_CSR_MSTATUS_MPP_BIT_LOW] = mstatus_q[1-:2];
			end
			12'h301: csr_rdata_int = MISA_VALUE;
			12'h304: begin
				csr_rdata_int = 1'sb0;
				csr_rdata_int[ibex_pkg_CSR_MSIX_BIT] = mie_q[17];
				csr_rdata_int[ibex_pkg_CSR_MTIX_BIT] = mie_q[16];
				csr_rdata_int[ibex_pkg_CSR_MEIX_BIT] = mie_q[15];
				csr_rdata_int[ibex_pkg_CSR_MFIX_BIT_HIGH:ibex_pkg_CSR_MFIX_BIT_LOW] = mie_q[14-:15];
			end
			12'h340: csr_rdata_int = mscratch_q;
			12'h305: csr_rdata_int = mtvec_q;
			12'h341: csr_rdata_int = mepc_q;
			12'h342: csr_rdata_int = {mcause_q[5], 26'b00000000000000000000000000, mcause_q[4:0]};
			12'h343: csr_rdata_int = mtval_q;
			12'h344: begin
				csr_rdata_int = 1'sb0;
				csr_rdata_int[ibex_pkg_CSR_MSIX_BIT] = mip[17];
				csr_rdata_int[ibex_pkg_CSR_MTIX_BIT] = mip[16];
				csr_rdata_int[ibex_pkg_CSR_MEIX_BIT] = mip[15];
				csr_rdata_int[ibex_pkg_CSR_MFIX_BIT_HIGH:ibex_pkg_CSR_MFIX_BIT_LOW] = mip[14-:15];
			end
			12'h3a0: csr_rdata_int = {pmp_cfg_rdata[3], pmp_cfg_rdata[2], pmp_cfg_rdata[1], pmp_cfg_rdata[0]};
			12'h3a1: csr_rdata_int = {pmp_cfg_rdata[7], pmp_cfg_rdata[6], pmp_cfg_rdata[5], pmp_cfg_rdata[4]};
			12'h3a2: csr_rdata_int = {pmp_cfg_rdata[11], pmp_cfg_rdata[10], pmp_cfg_rdata[9], pmp_cfg_rdata[8]};
			12'h3a3: csr_rdata_int = {pmp_cfg_rdata[15], pmp_cfg_rdata[14], pmp_cfg_rdata[13], pmp_cfg_rdata[12]};
			12'h3b0: csr_rdata_int = pmp_addr_rdata[0];
			12'h3b1: csr_rdata_int = pmp_addr_rdata[1];
			12'h3b2: csr_rdata_int = pmp_addr_rdata[2];
			12'h3b3: csr_rdata_int = pmp_addr_rdata[3];
			12'h3b4: csr_rdata_int = pmp_addr_rdata[4];
			12'h3b5: csr_rdata_int = pmp_addr_rdata[5];
			12'h3b6: csr_rdata_int = pmp_addr_rdata[6];
			12'h3b7: csr_rdata_int = pmp_addr_rdata[7];
			12'h3b8: csr_rdata_int = pmp_addr_rdata[8];
			12'h3b9: csr_rdata_int = pmp_addr_rdata[9];
			12'h3ba: csr_rdata_int = pmp_addr_rdata[10];
			12'h3bb: csr_rdata_int = pmp_addr_rdata[11];
			12'h3bc: csr_rdata_int = pmp_addr_rdata[12];
			12'h3bd: csr_rdata_int = pmp_addr_rdata[13];
			12'h3be: csr_rdata_int = pmp_addr_rdata[14];
			12'h3bf: csr_rdata_int = pmp_addr_rdata[15];
			12'h7b0: begin
				csr_rdata_int = dcsr_q;
				illegal_csr = ~debug_mode_i;
			end
			12'h7b1: begin
				csr_rdata_int = depc_q;
				illegal_csr = ~debug_mode_i;
			end
			12'h7b2: begin
				csr_rdata_int = dscratch0_q;
				illegal_csr = ~debug_mode_i;
			end
			12'h7b3: begin
				csr_rdata_int = dscratch1_q;
				illegal_csr = ~debug_mode_i;
			end
			12'h320: csr_rdata_int = mcountinhibit;
			12'hb00: csr_rdata_int = mhpmcounter_q[2015-:32];
			12'hb80: csr_rdata_int = mhpmcounter_q[2047-:32];
			12'hb02: csr_rdata_int = mhpmcounter_q[1887-:32];
			12'hb82: csr_rdata_int = mhpmcounter_q[1919-:32];
			default:
				if ((csr_addr & ibex_pkg_CSR_MASK_MCOUNTER) == ibex_pkg_CSR_OFF_MCOUNTER_SETUP) begin
					csr_rdata_int = mhpmevent[mhpmcounter_idx];
					if (((csr_addr[4:0] == 5'b00000) || (csr_addr[4:0] == 5'b00001)) || (csr_addr[4:0] == 5'b00010))
						illegal_csr = csr_access_i;
				end
				else if ((csr_addr & ibex_pkg_CSR_MASK_MCOUNTER) == ibex_pkg_CSR_OFF_MCOUNTER) begin
					csr_rdata_int = mhpmcounter_q[((31 - mhpmcounter_idx) * 64) + 31-:32];
					if (((csr_addr[4:0] == 5'b00000) || (csr_addr[4:0] == 5'b00001)) || (csr_addr[4:0] == 5'b00010))
						illegal_csr = csr_access_i;
				end
				else if ((csr_addr & ibex_pkg_CSR_MASK_MCOUNTER) == ibex_pkg_CSR_OFF_MCOUNTERH) begin
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
		exception_pc = pc_id_i;
		mstatus_d = mstatus_q;
		mie_d = mie_q;
		mscratch_d = mscratch_q;
		mepc_d = mepc_q;
		mcause_d = mcause_q;
		mtval_d = mtval_q;
		mtvec_d = (csr_mtvec_init_i ? {boot_addr_i[31:8], 8'b00000001} : mtvec_q);
		dcsr_d = dcsr_q;
		depc_d = depc_q;
		dscratch0_d = dscratch0_q;
		dscratch1_d = dscratch1_q;
		mstack_d = mstack_q;
		mstack_epc_d = mstack_epc_q;
		mstack_cause_d = mstack_cause_q;
		mcountinhibit_we = 1'b0;
		mhpmcounter_we = 1'sb0;
		mhpmcounterh_we = 1'sb0;
		(* full_case, parallel_case *)
		case (csr_addr_i)
			12'h300:
				if (csr_we_int)
					mstatus_d = {csr_wdata_int[ibex_pkg_CSR_MSTATUS_MIE_BIT], csr_wdata_int[ibex_pkg_CSR_MSTATUS_MPIE_BIT], 2'b11};
			12'h304:
				if (csr_we_int) begin
					mie_d[17] = csr_wdata_int[ibex_pkg_CSR_MSIX_BIT];
					mie_d[16] = csr_wdata_int[ibex_pkg_CSR_MTIX_BIT];
					mie_d[15] = csr_wdata_int[ibex_pkg_CSR_MEIX_BIT];
					mie_d[14-:15] = csr_wdata_int[ibex_pkg_CSR_MFIX_BIT_HIGH:ibex_pkg_CSR_MFIX_BIT_LOW];
				end
			12'h340:
				if (csr_we_int)
					mscratch_d = csr_wdata_int;
			12'h341:
				if (csr_we_int)
					mepc_d = {csr_wdata_int[31:1], 1'b0};
			12'h342:
				if (csr_we_int)
					mcause_d = {csr_wdata_int[31], csr_wdata_int[4:0]};
			12'h343:
				if (csr_we_int)
					mtval_d = csr_wdata_int;
			12'h305:
				if (csr_we_int)
					mtvec_d = {csr_wdata_int[31:8], 8'b00000001};
			12'h7b0:
				if (csr_we_int) begin
					dcsr_d = csr_wdata_int;
					dcsr_d[31-:4] = 4'd4;
					dcsr_d[1-:2] = 2'b11;
					dcsr_d[3] = 1'b0;
					dcsr_d[4] = 1'b0;
					dcsr_d[10] = 1'b0;
					dcsr_d[9] = 1'b0;
					dcsr_d[5] = 1'b0;
					dcsr_d[14] = 1'b0;
					dcsr_d[27-:12] = 12'h000;
				end
			12'h7b1:
				if (csr_we_int && (csr_wdata_int[0] == 1'b0))
					depc_d = csr_wdata_int;
			12'h7b2:
				if (csr_we_int)
					dscratch0_d = csr_wdata_int;
			12'h7b3:
				if (csr_we_int)
					dscratch1_d = csr_wdata_int;
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
					if ((csr_addr & ibex_pkg_CSR_MASK_MCOUNTER) == ibex_pkg_CSR_OFF_MCOUNTER)
						mhpmcounter_we[mhpmcounter_idx] = 1'b1;
					else if ((csr_addr & ibex_pkg_CSR_MASK_MCOUNTER) == ibex_pkg_CSR_OFF_MCOUNTERH)
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
					dcsr_d[1-:2] = 2'b11;
					dcsr_d[8-:3] = debug_cause_i;
					depc_d = exception_pc;
				end
				else begin
					mtval_d = csr_mtval_i;
					mstatus_d[3] = 1'b0;
					mstatus_d[2] = mstatus_q[3];
					mstatus_d[1-:2] = 2'b11;
					mepc_d = exception_pc;
					mcause_d = {csr_mcause_i};
					mstack_d[2] = mstatus_q[2];
					mstack_d[1-:2] = mstatus_q[1-:2];
					mstack_epc_d = mepc_q;
					mstack_cause_d = mcause_q;
				end
			end
			csr_restore_mret_i: begin
				mstatus_d[3] = mstatus_q[2];
				mstatus_d[2] = mstack_q[2];
				mstatus_d[1-:2] = mstack_q[1-:2];
				mepc_d = mstack_epc_q;
				mcause_d = mstack_cause_q;
			end
			default:
				;
		endcase
	end
	always @(*) begin
		if (_sv2v_0)
			;
		csr_wreq = 1'b1;
		(* full_case, parallel_case *)
		case (csr_op_i)
			2'd1: csr_wdata_int = csr_wdata_i;
			2'd2: csr_wdata_int = csr_wdata_i | csr_rdata_o;
			2'd3: csr_wdata_int = ~csr_wdata_i & csr_rdata_o;
			2'd0: begin
				csr_wdata_int = csr_wdata_i;
				csr_wreq = 1'b0;
			end
			default: begin
				csr_wdata_int = 1'sbx;
				csr_wreq = 1'bx;
			end
		endcase
	end
	assign csr_we_int = (csr_wreq & ~illegal_csr_priv) & instr_new_id_i;
	assign csr_rdata_o = csr_rdata_int;
	assign csr_msip_o = mip[17];
	assign csr_mtip_o = mip[16];
	assign csr_meip_o = mip[15];
	assign csr_mfip_o = mip[14-:15];
	assign csr_mepc_o = mepc_q;
	assign csr_depc_o = depc_q;
	assign csr_mtvec_o = mtvec_q;
	assign csr_mstatus_mie_o = mstatus_q[3];
	assign debug_single_step_o = dcsr_q[2];
	assign debug_ebreakm_o = dcsr_q[15];
	assign irq_pending_o = ((csr_msip_o | csr_mtip_o) | csr_meip_o) | (|csr_mfip_o);
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni) begin
			mstatus_q <= 4'b0011;
			mie_q <= 1'sb0;
			mscratch_q <= 1'sb0;
			mepc_q <= 1'sb0;
			mcause_q <= 1'sb0;
			mtval_q <= 1'sb0;
			mtvec_q <= 32'b00000000000000000000000000000001;
			dcsr_q <= 32'h40000003;
			depc_q <= 1'sb0;
			dscratch0_q <= 1'sb0;
			dscratch1_q <= 1'sb0;
			mstack_q <= 4'b0011;
			mstack_epc_q <= 1'sb0;
			mstack_cause_q <= 1'sb0;
		end
		else begin
			mstatus_q <= mstatus_d;
			mie_q <= mie_d;
			mscratch_q <= mscratch_d;
			mepc_q <= mepc_d;
			mcause_q <= mcause_d;
			mtval_q <= mtval_d;
			mtvec_q <= mtvec_d;
			dcsr_q <= dcsr_d;
			depc_q <= depc_d;
			dscratch0_q <= dscratch0_d;
			dscratch1_q <= dscratch1_d;
			mstack_q <= mstack_d;
			mstack_epc_q <= mstack_epc_d;
			mstack_cause_q <= mstack_cause_d;
		end
	assign priv_mode_o = mstatus_q[1-:2];
	localparam [11:0] ibex_pkg_CSR_OFF_PMP_ADDR = 12'h3b0;
	localparam [11:0] ibex_pkg_CSR_OFF_PMP_CFG = 12'h3a0;
	generate
		if (PMPEnable) begin : g_pmp_registers
			reg [5:0] pmp_cfg [0:PMPNumRegions - 1];
			reg [5:0] pmp_cfg_wdata [0:PMPNumRegions - 1];
			reg [31:0] pmp_addr [0:PMPNumRegions - 1];
			wire [PMPNumRegions - 1:0] pmp_cfg_we;
			wire [PMPNumRegions - 1:0] pmp_addr_we;
			genvar _gv_i_1;
			for (_gv_i_1 = 0; _gv_i_1 < ibex_pkg_PMP_MAX_REGIONS; _gv_i_1 = _gv_i_1 + 1) begin : g_exp_rd_data
				localparam i = _gv_i_1;
				if (i < PMPNumRegions) begin : g_implemented_regions
					assign pmp_cfg_rdata[i] = {pmp_cfg[i][5], 2'b00, pmp_cfg[i][4-:2], pmp_cfg[i][2], pmp_cfg[i][1], pmp_cfg[i][0]};
					if (PMPGranularity == 0) begin : g_pmp_g0
						wire [32:1] sv2v_tmp_66180;
						assign sv2v_tmp_66180 = pmp_addr[i];
						always @(*) pmp_addr_rdata[i] = sv2v_tmp_66180;
					end
					else if (PMPGranularity == 1) begin : g_pmp_g1
						always @(*) begin
							if (_sv2v_0)
								;
							pmp_addr_rdata[i] = pmp_addr[i];
							if ((pmp_cfg[i][4-:2] == 2'b00) || (pmp_cfg[i][4-:2] == 2'b01))
								pmp_addr_rdata[i][PMPGranularity - 1:0] = 1'sb0;
						end
					end
					else begin : genblk1
						always @(*) begin
							if (_sv2v_0)
								;
							pmp_addr_rdata[i] = pmp_addr[i];
							if ((pmp_cfg[i][4-:2] == 2'b00) || (pmp_cfg[i][4-:2] == 2'b01))
								pmp_addr_rdata[i][PMPGranularity - 1:0] = 1'sb0;
							else if (pmp_cfg[i][4-:2] == 2'b11)
								pmp_addr_rdata[i][PMPGranularity - 2:0] = 1'sb1;
						end
					end
				end
				else begin : g_other_regions
					assign pmp_cfg_rdata[i] = 1'sb0;
					wire [32:1] sv2v_tmp_8D4C0;
					assign sv2v_tmp_8D4C0 = 1'sb0;
					always @(*) pmp_addr_rdata[i] = sv2v_tmp_8D4C0;
				end
			end
			genvar _gv_i_2;
			for (_gv_i_2 = 0; _gv_i_2 < PMPNumRegions; _gv_i_2 = _gv_i_2 + 1) begin : g_pmp_csrs
				localparam i = _gv_i_2;
				assign pmp_cfg_we[i] = (csr_we_int & ~pmp_cfg[i][5]) & (csr_addr == (ibex_pkg_CSR_OFF_PMP_CFG + (i[11:0] >> 2)));
				wire [1:1] sv2v_tmp_54F96;
				assign sv2v_tmp_54F96 = csr_wdata_int[((i % 4) * ibex_pkg_PMP_CFG_W) + 7];
				always @(*) pmp_cfg_wdata[i][5] = sv2v_tmp_54F96;
				always @(*) begin
					if (_sv2v_0)
						;
					(* full_case, parallel_case *)
					case (csr_wdata_int[((i % 4) * ibex_pkg_PMP_CFG_W) + 3+:2])
						2'b00: pmp_cfg_wdata[i][4-:2] = 2'b00;
						2'b01: pmp_cfg_wdata[i][4-:2] = 2'b01;
						2'b10: pmp_cfg_wdata[i][4-:2] = (PMPGranularity == 0 ? 2'b10 : 2'b00);
						2'b11: pmp_cfg_wdata[i][4-:2] = 2'b11;
						default: pmp_cfg_wdata[i][4-:2] = 2'bxx;
					endcase
				end
				wire [1:1] sv2v_tmp_A8DD4;
				assign sv2v_tmp_A8DD4 = csr_wdata_int[((i % 4) * ibex_pkg_PMP_CFG_W) + 2];
				always @(*) pmp_cfg_wdata[i][2] = sv2v_tmp_A8DD4;
				wire [1:1] sv2v_tmp_77CC5;
				assign sv2v_tmp_77CC5 = &csr_wdata_int[(i % 4) * ibex_pkg_PMP_CFG_W+:2];
				always @(*) pmp_cfg_wdata[i][1] = sv2v_tmp_77CC5;
				wire [1:1] sv2v_tmp_2F5D5;
				assign sv2v_tmp_2F5D5 = csr_wdata_int[(i % 4) * ibex_pkg_PMP_CFG_W];
				always @(*) pmp_cfg_wdata[i][0] = sv2v_tmp_2F5D5;
				always @(posedge clk_i or negedge rst_ni)
					if (!rst_ni)
						pmp_cfg[i] <= 6'b000000;
					else if (pmp_cfg_we[i])
						pmp_cfg[i] <= pmp_cfg_wdata[i];
				if (i < (PMPNumRegions - 1)) begin : g_lower
					assign pmp_addr_we[i] = ((csr_we_int & ~pmp_cfg[i][5]) & (pmp_cfg[i + 1][4-:2] != 2'b01)) & (csr_addr == (ibex_pkg_CSR_OFF_PMP_ADDR + i[11:0]));
				end
				else begin : g_upper
					assign pmp_addr_we[i] = (csr_we_int & ~pmp_cfg[i][5]) & (csr_addr == (ibex_pkg_CSR_OFF_PMP_ADDR + i[11:0]));
				end
				always @(posedge clk_i or negedge rst_ni)
					if (!rst_ni)
						pmp_addr[i] <= 'b0;
					else if (pmp_addr_we[i])
						pmp_addr[i] <= csr_wdata_int;
				assign csr_pmp_cfg_o[((PMPNumRegions - 1) - i) * 6+:6] = pmp_cfg[i];
				assign csr_pmp_addr_o[((PMPNumRegions - 1) - i) * 34+:34] = {pmp_addr[i], 2'b00};
			end
		end
		else begin : g_no_pmp_tieoffs
			genvar _gv_i_3;
			for (_gv_i_3 = 0; _gv_i_3 < ibex_pkg_PMP_MAX_REGIONS; _gv_i_3 = _gv_i_3 + 1) begin : g_rdata
				localparam i = _gv_i_3;
				wire [32:1] sv2v_tmp_8D4C0;
				assign sv2v_tmp_8D4C0 = 1'sb0;
				always @(*) pmp_addr_rdata[i] = sv2v_tmp_8D4C0;
				assign pmp_cfg_rdata[i] = 1'sb0;
			end
			genvar _gv_i_4;
			for (_gv_i_4 = 0; _gv_i_4 < PMPNumRegions; _gv_i_4 = _gv_i_4 + 1) begin : g_outputs
				localparam i = _gv_i_4;
				assign csr_pmp_cfg_o[((PMPNumRegions - 1) - i) * 6+:6] = 6'b000000;
				assign csr_pmp_addr_o[((PMPNumRegions - 1) - i) * 34+:34] = 1'sb0;
			end
		end
	endgenerate
	always @(*) begin : mcountinhibit_update
		if (_sv2v_0)
			;
		if (mcountinhibit_we == 1'b1)
			mcountinhibit_d = {csr_wdata_int[31:2], 1'b0, csr_wdata_int[0]};
		else
			mcountinhibit_d = mcountinhibit_q;
	end
	assign mcountinhibit_force = {{29 - MHPMCounterNum {1'b1}}, {MHPMCounterNum {1'b0}}, 3'b000};
	assign mcountinhibit = mcountinhibit_q | mcountinhibit_force;
	always @(*) begin : gen_mhpmcounter_incr
		if (_sv2v_0)
			;
		mhpmcounter_incr[0] = 1'b1;
		mhpmcounter_incr[1] = 1'b0;
		mhpmcounter_incr[2] = instr_ret_i;
		mhpmcounter_incr[3] = lsu_busy_i;
		mhpmcounter_incr[4] = imiss_i & ~pc_set_i;
		mhpmcounter_incr[5] = mem_load_i;
		mhpmcounter_incr[6] = mem_store_i;
		mhpmcounter_incr[7] = jump_i;
		mhpmcounter_incr[8] = branch_i;
		mhpmcounter_incr[9] = branch_taken_i;
		mhpmcounter_incr[10] = instr_ret_compressed_i;
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
		mhpmcounter_d = mhpmcounter_q;
		begin : sv2v_autoblock_7
			reg signed [31:0] i;
			for (i = 0; i < 32; i = i + 1)
				begin : gen_mhpmcounter_update
					if (mhpmcounter_incr[i] & ~mcountinhibit[i])
						mhpmcounter_d[(31 - i) * 64+:64] = mhpmcounter_mask[i] & (mhpmcounter_q[(31 - i) * 64+:64] + 64'h0000000000000001);
					if (mhpmcounter_we[i])
						mhpmcounter_d[((31 - i) * 64) + 31-:32] = mhpmcounter_mask[i][31:0] & csr_wdata_int;
					else if (mhpmcounterh_we[i])
						mhpmcounter_d[((31 - i) * 64) + 63-:32] = mhpmcounter_mask[i][63:32] & csr_wdata_int;
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
			mhpmcounter_q <= mhpmcounter_d;
			mcountinhibit_q <= mcountinhibit_d;
		end
	end
	initial _sv2v_0 = 0;
endmodule
