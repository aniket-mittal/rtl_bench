module cv32e40p_cs_registers (
	clk,
	rst_n,
	hart_id_i,
	mtvec_o,
	utvec_o,
	mtvec_mode_o,
	utvec_mode_o,
	mtvec_addr_i,
	csr_mtvec_init_i,
	csr_addr_i,
	csr_wdata_i,
	csr_op_i,
	csr_rdata_o,
	frm_o,
	fflags_i,
	fflags_we_i,
	mie_bypass_o,
	mip_i,
	m_irq_enable_o,
	u_irq_enable_o,
	csr_irq_sec_i,
	sec_lvl_o,
	mepc_o,
	uepc_o,
	mcounteren_o,
	debug_mode_i,
	debug_cause_i,
	debug_csr_save_i,
	depc_o,
	debug_single_step_o,
	debug_ebreakm_o,
	debug_ebreaku_o,
	trigger_match_o,
	pmp_addr_o,
	pmp_cfg_o,
	priv_lvl_o,
	pc_if_i,
	pc_id_i,
	pc_ex_i,
	csr_save_if_i,
	csr_save_id_i,
	csr_save_ex_i,
	csr_restore_mret_i,
	csr_restore_uret_i,
	csr_restore_dret_i,
	csr_cause_i,
	csr_save_cause_i,
	hwlp_start_i,
	hwlp_end_i,
	hwlp_cnt_i,
	hwlp_data_o,
	hwlp_regid_o,
	hwlp_we_o,
	mhpmevent_minstret_i,
	mhpmevent_load_i,
	mhpmevent_store_i,
	mhpmevent_jump_i,
	mhpmevent_branch_i,
	mhpmevent_branch_taken_i,
	mhpmevent_compressed_i,
	mhpmevent_jr_stall_i,
	mhpmevent_imiss_i,
	mhpmevent_ld_stall_i,
	mhpmevent_pipe_stall_i,
	apu_typeconflict_i,
	apu_contention_i,
	apu_dep_i,
	apu_wb_i
);
	reg _sv2v_0;
	parameter N_HWLP = 2;
	parameter N_HWLP_BITS = $clog2(N_HWLP);
	parameter APU = 0;
	parameter A_EXTENSION = 0;
	parameter FPU = 0;
	parameter PULP_SECURE = 0;
	parameter USE_PMP = 0;
	parameter N_PMP_ENTRIES = 16;
	parameter NUM_MHPMCOUNTERS = 1;
	parameter PULP_XPULP = 0;
	parameter PULP_CLUSTER = 0;
	parameter DEBUG_TRIGGER_EN = 1;
	input wire clk;
	input wire rst_n;
	input wire [31:0] hart_id_i;
	output wire [23:0] mtvec_o;
	output wire [23:0] utvec_o;
	output wire [1:0] mtvec_mode_o;
	output wire [1:0] utvec_mode_o;
	input wire [31:0] mtvec_addr_i;
	input wire csr_mtvec_init_i;
	input wire [11:0] csr_addr_i;
	input wire [31:0] csr_wdata_i;
	input wire [1:0] csr_op_i;
	output wire [31:0] csr_rdata_o;
	output wire [2:0] frm_o;
	localparam cv32e40p_pkg_C_FFLAG = 5;
	input wire [4:0] fflags_i;
	input wire fflags_we_i;
	output wire [31:0] mie_bypass_o;
	input wire [31:0] mip_i;
	output wire m_irq_enable_o;
	output wire u_irq_enable_o;
	input wire csr_irq_sec_i;
	output wire sec_lvl_o;
	output wire [31:0] mepc_o;
	output wire [31:0] uepc_o;
	output wire [31:0] mcounteren_o;
	input wire debug_mode_i;
	input wire [2:0] debug_cause_i;
	input wire debug_csr_save_i;
	output wire [31:0] depc_o;
	output wire debug_single_step_o;
	output wire debug_ebreakm_o;
	output wire debug_ebreaku_o;
	output wire trigger_match_o;
	output wire [(N_PMP_ENTRIES * 32) - 1:0] pmp_addr_o;
	output wire [(N_PMP_ENTRIES * 8) - 1:0] pmp_cfg_o;
	output wire [1:0] priv_lvl_o;
	input wire [31:0] pc_if_i;
	input wire [31:0] pc_id_i;
	input wire [31:0] pc_ex_i;
	input wire csr_save_if_i;
	input wire csr_save_id_i;
	input wire csr_save_ex_i;
	input wire csr_restore_mret_i;
	input wire csr_restore_uret_i;
	input wire csr_restore_dret_i;
	input wire [5:0] csr_cause_i;
	input wire csr_save_cause_i;
	input wire [(N_HWLP * 32) - 1:0] hwlp_start_i;
	input wire [(N_HWLP * 32) - 1:0] hwlp_end_i;
	input wire [(N_HWLP * 32) - 1:0] hwlp_cnt_i;
	output wire [31:0] hwlp_data_o;
	output reg [N_HWLP_BITS - 1:0] hwlp_regid_o;
	output reg [2:0] hwlp_we_o;
	input wire mhpmevent_minstret_i;
	input wire mhpmevent_load_i;
	input wire mhpmevent_store_i;
	input wire mhpmevent_jump_i;
	input wire mhpmevent_branch_i;
	input wire mhpmevent_branch_taken_i;
	input wire mhpmevent_compressed_i;
	input wire mhpmevent_jr_stall_i;
	input wire mhpmevent_imiss_i;
	input wire mhpmevent_ld_stall_i;
	input wire mhpmevent_pipe_stall_i;
	input wire apu_typeconflict_i;
	input wire apu_contention_i;
	input wire apu_dep_i;
	input wire apu_wb_i;
	localparam NUM_HPM_EVENTS = 16;
	localparam MTVEC_MODE = 2'b01;
	localparam MAX_N_PMP_ENTRIES = 16;
	localparam MAX_N_PMP_CFG = 4;
	localparam N_PMP_CFG = ((N_PMP_ENTRIES % 4) == 0 ? N_PMP_ENTRIES / 4 : (N_PMP_ENTRIES / 4) + 1);
	localparam MSTATUS_UIE_BIT = 0;
	localparam MSTATUS_SIE_BIT = 1;
	localparam MSTATUS_MIE_BIT = 3;
	localparam MSTATUS_UPIE_BIT = 4;
	localparam MSTATUS_SPIE_BIT = 5;
	localparam MSTATUS_MPIE_BIT = 7;
	localparam MSTATUS_SPP_BIT = 8;
	localparam MSTATUS_MPP_BIT_HIGH = 12;
	localparam MSTATUS_MPP_BIT_LOW = 11;
	localparam MSTATUS_MPRV_BIT = 17;
	localparam [1:0] MXL = 2'd1;
	function automatic [31:0] sv2v_cast_32;
		input reg [31:0] inp;
		sv2v_cast_32 = inp;
	endfunction
	localparam [31:0] MISA_VALUE = (((((((((((A_EXTENSION << 0) | 4) | 0) | 0) | (FPU << 5)) | 256) | 4096) | 0) | 0) | (PULP_SECURE << 20)) | (sv2v_cast_32(PULP_XPULP || PULP_CLUSTER) << 23)) | (sv2v_cast_32(MXL) << 30);
	localparam MHPMCOUNTER_WIDTH = 64;
	localparam PULP_PERF_COUNTERS = 0;
	reg [31:0] csr_wdata_int;
	reg [31:0] csr_rdata_int;
	reg csr_we_int;
	localparam cv32e40p_pkg_C_RM = 3;
	reg [2:0] frm_q;
	reg [2:0] frm_n;
	reg [4:0] fflags_q;
	reg [4:0] fflags_n;
	reg [31:0] mepc_q;
	reg [31:0] mepc_n;
	reg [31:0] uepc_q;
	reg [31:0] uepc_n;
	wire [31:0] tmatch_control_rdata;
	wire [31:0] tmatch_value_rdata;
	wire [15:0] tinfo_types;
	reg [31:0] dcsr_q;
	reg [31:0] dcsr_n;
	reg [31:0] depc_q;
	reg [31:0] depc_n;
	reg [31:0] dscratch0_q;
	reg [31:0] dscratch0_n;
	reg [31:0] dscratch1_q;
	reg [31:0] dscratch1_n;
	reg [31:0] mscratch_q;
	reg [31:0] mscratch_n;
	reg [31:0] exception_pc;
	reg [6:0] mstatus_q;
	reg [6:0] mstatus_n;
	reg [5:0] mcause_q;
	reg [5:0] mcause_n;
	reg [5:0] ucause_q;
	reg [5:0] ucause_n;
	reg [23:0] mtvec_n;
	reg [23:0] mtvec_q;
	reg [23:0] utvec_n;
	reg [23:0] utvec_q;
	reg [1:0] mtvec_mode_n;
	reg [1:0] mtvec_mode_q;
	reg [1:0] utvec_mode_n;
	reg [1:0] utvec_mode_q;
	wire [31:0] mip;
	reg [31:0] mie_q;
	reg [31:0] mie_n;
	reg [31:0] csr_mie_wdata;
	reg csr_mie_we;
	wire is_irq;
	reg [1:0] priv_lvl_n;
	reg [1:0] priv_lvl_q;
	reg [767:0] pmp_reg_q;
	reg [767:0] pmp_reg_n;
	reg [15:0] pmpaddr_we;
	reg [15:0] pmpcfg_we;
	reg [2047:0] mhpmcounter_q;
	reg [1023:0] mhpmevent_q;
	reg [1023:0] mhpmevent_n;
	reg [31:0] mcounteren_q;
	reg [31:0] mcounteren_n;
	reg [31:0] mcountinhibit_q;
	reg [31:0] mcountinhibit_n;
	wire [15:0] hpm_events;
	reg [2047:0] mhpmcounter_increment;
	reg [31:0] mhpmcounter_write_lower;
	reg [31:0] mhpmcounter_write_upper;
	reg [31:0] mhpmcounter_write_increment;
	assign is_irq = csr_cause_i[5];
	assign mip = mip_i;
	localparam cv32e40p_pkg_CSR_OP_CLEAR = 2'b11;
	localparam cv32e40p_pkg_CSR_OP_READ = 2'b00;
	localparam cv32e40p_pkg_CSR_OP_SET = 2'b10;
	localparam cv32e40p_pkg_CSR_OP_WRITE = 2'b01;
	always @(*) begin
		if (_sv2v_0)
			;
		csr_mie_wdata = csr_wdata_i;
		csr_mie_we = 1'b1;
		case (csr_op_i)
			cv32e40p_pkg_CSR_OP_WRITE: csr_mie_wdata = csr_wdata_i;
			cv32e40p_pkg_CSR_OP_SET: csr_mie_wdata = csr_wdata_i | mie_q;
			cv32e40p_pkg_CSR_OP_CLEAR: csr_mie_wdata = ~csr_wdata_i & mie_q;
			cv32e40p_pkg_CSR_OP_READ: begin
				csr_mie_wdata = csr_wdata_i;
				csr_mie_we = 1'b0;
			end
		endcase
	end
	localparam cv32e40p_pkg_IRQ_MASK = 32'hffff0888;
	assign mie_bypass_o = ((csr_addr_i == 12'h304) && csr_mie_we ? csr_mie_wdata & cv32e40p_pkg_IRQ_MASK : mie_q);
	genvar _gv_j_2;
	localparam cv32e40p_pkg_MARCHID = 32'h00000004;
	localparam cv32e40p_pkg_MVENDORID_BANK = 25'h000000c;
	localparam cv32e40p_pkg_MVENDORID_OFFSET = 7'h02;
	generate
		if (PULP_SECURE == 1) begin : genblk1
			always @(*) begin
				if (_sv2v_0)
					;
				case (csr_addr_i)
					12'h001: csr_rdata_int = (FPU == 1 ? {27'b000000000000000000000000000, fflags_q} : {32 {1'sb0}});
					12'h002: csr_rdata_int = (FPU == 1 ? {29'b00000000000000000000000000000, frm_q} : {32 {1'sb0}});
					12'h003: csr_rdata_int = (FPU == 1 ? {24'b000000000000000000000000, frm_q, fflags_q} : {32 {1'sb0}});
					12'h300: csr_rdata_int = {14'b00000000000000, mstatus_q[0], 4'b0000, mstatus_q[2-:2], 3'b000, mstatus_q[3], 2'h0, mstatus_q[4], mstatus_q[5], 2'h0, mstatus_q[6]};
					12'h301: csr_rdata_int = MISA_VALUE;
					12'h304: csr_rdata_int = mie_q;
					12'h305: csr_rdata_int = {mtvec_q, 6'h00, mtvec_mode_q};
					12'h340: csr_rdata_int = mscratch_q;
					12'h341: csr_rdata_int = mepc_q;
					12'h342: csr_rdata_int = {mcause_q[5], 26'b00000000000000000000000000, mcause_q[4:0]};
					12'h344: csr_rdata_int = mip;
					12'hf14: csr_rdata_int = hart_id_i;
					12'hf11: csr_rdata_int = {cv32e40p_pkg_MVENDORID_BANK, cv32e40p_pkg_MVENDORID_OFFSET};
					12'hf12: csr_rdata_int = cv32e40p_pkg_MARCHID;
					12'hf13, 12'h343: csr_rdata_int = 'b0;
					12'h306: csr_rdata_int = mcounteren_q;
					12'h7a0, 12'h7a3, 12'h7a8, 12'h7aa: csr_rdata_int = 'b0;
					12'h7a1: csr_rdata_int = tmatch_control_rdata;
					12'h7a2: csr_rdata_int = tmatch_value_rdata;
					12'h7a4: csr_rdata_int = tinfo_types;
					12'h7b0: csr_rdata_int = dcsr_q;
					12'h7b1: csr_rdata_int = depc_q;
					12'h7b2: csr_rdata_int = dscratch0_q;
					12'h7b3: csr_rdata_int = dscratch1_q;
					12'hb00, 12'hb02, 12'hb03, 12'hb04, 12'hb05, 12'hb06, 12'hb07, 12'hb08, 12'hb09, 12'hb0a, 12'hb0b, 12'hb0c, 12'hb0d, 12'hb0e, 12'hb0f, 12'hb10, 12'hb11, 12'hb12, 12'hb13, 12'hb14, 12'hb15, 12'hb16, 12'hb17, 12'hb18, 12'hb19, 12'hb1a, 12'hb1b, 12'hb1c, 12'hb1d, 12'hb1e, 12'hb1f, 12'hc00, 12'hc02, 12'hc03, 12'hc04, 12'hc05, 12'hc06, 12'hc07, 12'hc08, 12'hc09, 12'hc0a, 12'hc0b, 12'hc0c, 12'hc0d, 12'hc0e, 12'hc0f, 12'hc10, 12'hc11, 12'hc12, 12'hc13, 12'hc14, 12'hc15, 12'hc16, 12'hc17, 12'hc18, 12'hc19, 12'hc1a, 12'hc1b, 12'hc1c, 12'hc1d, 12'hc1e, 12'hc1f: csr_rdata_int = mhpmcounter_q[(csr_addr_i[4:0] * 64) + 31-:32];
					12'hb80, 12'hb82, 12'hb83, 12'hb84, 12'hb85, 12'hb86, 12'hb87, 12'hb88, 12'hb89, 12'hb8a, 12'hb8b, 12'hb8c, 12'hb8d, 12'hb8e, 12'hb8f, 12'hb90, 12'hb91, 12'hb92, 12'hb93, 12'hb94, 12'hb95, 12'hb96, 12'hb97, 12'hb98, 12'hb99, 12'hb9a, 12'hb9b, 12'hb9c, 12'hb9d, 12'hb9e, 12'hb9f, 12'hc80, 12'hc82, 12'hc83, 12'hc84, 12'hc85, 12'hc86, 12'hc87, 12'hc88, 12'hc89, 12'hc8a, 12'hc8b, 12'hc8c, 12'hc8d, 12'hc8e, 12'hc8f, 12'hc90, 12'hc91, 12'hc92, 12'hc93, 12'hc94, 12'hc95, 12'hc96, 12'hc97, 12'hc98, 12'hc99, 12'hc9a, 12'hc9b, 12'hc9c, 12'hc9d, 12'hc9e, 12'hc9f: csr_rdata_int = mhpmcounter_q[(csr_addr_i[4:0] * 64) + 63-:32];
					12'h320: csr_rdata_int = mcountinhibit_q;
					12'h323, 12'h324, 12'h325, 12'h326, 12'h327, 12'h328, 12'h329, 12'h32a, 12'h32b, 12'h32c, 12'h32d, 12'h32e, 12'h32f, 12'h330, 12'h331, 12'h332, 12'h333, 12'h334, 12'h335, 12'h336, 12'h337, 12'h338, 12'h339, 12'h33a, 12'h33b, 12'h33c, 12'h33d, 12'h33e, 12'h33f: csr_rdata_int = mhpmevent_q[csr_addr_i[4:0] * 32+:32];
					12'h800: csr_rdata_int = (!PULP_XPULP ? 'b0 : hwlp_start_i[0+:32]);
					12'h801: csr_rdata_int = (!PULP_XPULP ? 'b0 : hwlp_end_i[0+:32]);
					12'h802: csr_rdata_int = (!PULP_XPULP ? 'b0 : hwlp_cnt_i[0+:32]);
					12'h804: csr_rdata_int = (!PULP_XPULP ? 'b0 : hwlp_start_i[32+:32]);
					12'h805: csr_rdata_int = (!PULP_XPULP ? 'b0 : hwlp_end_i[32+:32]);
					12'h806: csr_rdata_int = (!PULP_XPULP ? 'b0 : hwlp_cnt_i[32+:32]);
					12'h3a0: csr_rdata_int = (USE_PMP ? pmp_reg_q[128+:32] : {32 {1'sb0}});
					12'h3a1: csr_rdata_int = (USE_PMP ? pmp_reg_q[160+:32] : {32 {1'sb0}});
					12'h3a2: csr_rdata_int = (USE_PMP ? pmp_reg_q[192+:32] : {32 {1'sb0}});
					12'h3a3: csr_rdata_int = (USE_PMP ? pmp_reg_q[224+:32] : {32 {1'sb0}});
					12'h3b0, 12'h3b1, 12'h3b2, 12'h3b3, 12'h3b4, 12'h3b5, 12'h3b6, 12'h3b7, 12'h3b8, 12'h3b9, 12'h3ba, 12'h3bb, 12'h3bc, 12'h3bd, 12'h3be, 12'h3bf: csr_rdata_int = (USE_PMP ? pmp_reg_q[256 + (csr_addr_i[3:0] * 32)+:32] : {32 {1'sb0}});
					12'h000: csr_rdata_int = {27'b000000000000000000000000000, mstatus_q[4], 3'h0, mstatus_q[6]};
					12'h005: csr_rdata_int = {utvec_q, 6'h00, utvec_mode_q};
					12'hcc0: csr_rdata_int = (!PULP_XPULP ? 'b0 : hart_id_i);
					12'h041: csr_rdata_int = uepc_q;
					12'h042: csr_rdata_int = {ucause_q[5], 26'h0000000, ucause_q[4:0]};
					12'hcc1: csr_rdata_int = (!PULP_XPULP ? 'b0 : {30'h00000000, priv_lvl_q});
					default: csr_rdata_int = 1'sb0;
				endcase
			end
		end
		else begin : genblk1
			always @(*) begin
				if (_sv2v_0)
					;
				case (csr_addr_i)
					12'h001: csr_rdata_int = (FPU == 1 ? {27'b000000000000000000000000000, fflags_q} : {32 {1'sb0}});
					12'h002: csr_rdata_int = (FPU == 1 ? {29'b00000000000000000000000000000, frm_q} : {32 {1'sb0}});
					12'h003: csr_rdata_int = (FPU == 1 ? {24'b000000000000000000000000, frm_q, fflags_q} : {32 {1'sb0}});
					12'h300: csr_rdata_int = {14'b00000000000000, mstatus_q[0], 4'b0000, mstatus_q[2-:2], 3'b000, mstatus_q[3], 2'h0, mstatus_q[4], mstatus_q[5], 2'h0, mstatus_q[6]};
					12'h301: csr_rdata_int = MISA_VALUE;
					12'h304: csr_rdata_int = mie_q;
					12'h305: csr_rdata_int = {mtvec_q, 6'h00, mtvec_mode_q};
					12'h340: csr_rdata_int = mscratch_q;
					12'h341: csr_rdata_int = mepc_q;
					12'h342: csr_rdata_int = {mcause_q[5], 26'b00000000000000000000000000, mcause_q[4:0]};
					12'h344: csr_rdata_int = mip;
					12'hf14: csr_rdata_int = hart_id_i;
					12'hf11: csr_rdata_int = {cv32e40p_pkg_MVENDORID_BANK, cv32e40p_pkg_MVENDORID_OFFSET};
					12'hf12: csr_rdata_int = cv32e40p_pkg_MARCHID;
					12'hf13, 12'h343: csr_rdata_int = 'b0;
					12'h7a0, 12'h7a3, 12'h7a8, 12'h7aa: csr_rdata_int = 'b0;
					12'h7a1: csr_rdata_int = tmatch_control_rdata;
					12'h7a2: csr_rdata_int = tmatch_value_rdata;
					12'h7a4: csr_rdata_int = tinfo_types;
					12'h7b0: csr_rdata_int = dcsr_q;
					12'h7b1: csr_rdata_int = depc_q;
					12'h7b2: csr_rdata_int = dscratch0_q;
					12'h7b3: csr_rdata_int = dscratch1_q;
					12'hb00, 12'hb02, 12'hb03, 12'hb04, 12'hb05, 12'hb06, 12'hb07, 12'hb08, 12'hb09, 12'hb0a, 12'hb0b, 12'hb0c, 12'hb0d, 12'hb0e, 12'hb0f, 12'hb10, 12'hb11, 12'hb12, 12'hb13, 12'hb14, 12'hb15, 12'hb16, 12'hb17, 12'hb18, 12'hb19, 12'hb1a, 12'hb1b, 12'hb1c, 12'hb1d, 12'hb1e, 12'hb1f, 12'hc00, 12'hc02, 12'hc03, 12'hc04, 12'hc05, 12'hc06, 12'hc07, 12'hc08, 12'hc09, 12'hc0a, 12'hc0b, 12'hc0c, 12'hc0d, 12'hc0e, 12'hc0f, 12'hc10, 12'hc11, 12'hc12, 12'hc13, 12'hc14, 12'hc15, 12'hc16, 12'hc17, 12'hc18, 12'hc19, 12'hc1a, 12'hc1b, 12'hc1c, 12'hc1d, 12'hc1e, 12'hc1f: csr_rdata_int = mhpmcounter_q[(csr_addr_i[4:0] * 64) + 31-:32];
					12'hb80, 12'hb82, 12'hb83, 12'hb84, 12'hb85, 12'hb86, 12'hb87, 12'hb88, 12'hb89, 12'hb8a, 12'hb8b, 12'hb8c, 12'hb8d, 12'hb8e, 12'hb8f, 12'hb90, 12'hb91, 12'hb92, 12'hb93, 12'hb94, 12'hb95, 12'hb96, 12'hb97, 12'hb98, 12'hb99, 12'hb9a, 12'hb9b, 12'hb9c, 12'hb9d, 12'hb9e, 12'hb9f, 12'hc80, 12'hc82, 12'hc83, 12'hc84, 12'hc85, 12'hc86, 12'hc87, 12'hc88, 12'hc89, 12'hc8a, 12'hc8b, 12'hc8c, 12'hc8d, 12'hc8e, 12'hc8f, 12'hc90, 12'hc91, 12'hc92, 12'hc93, 12'hc94, 12'hc95, 12'hc96, 12'hc97, 12'hc98, 12'hc99, 12'hc9a, 12'hc9b, 12'hc9c, 12'hc9d, 12'hc9e, 12'hc9f: csr_rdata_int = mhpmcounter_q[(csr_addr_i[4:0] * 64) + 63-:32];
					12'h320: csr_rdata_int = mcountinhibit_q;
					12'h323, 12'h324, 12'h325, 12'h326, 12'h327, 12'h328, 12'h329, 12'h32a, 12'h32b, 12'h32c, 12'h32d, 12'h32e, 12'h32f, 12'h330, 12'h331, 12'h332, 12'h333, 12'h334, 12'h335, 12'h336, 12'h337, 12'h338, 12'h339, 12'h33a, 12'h33b, 12'h33c, 12'h33d, 12'h33e, 12'h33f: csr_rdata_int = mhpmevent_q[csr_addr_i[4:0] * 32+:32];
					12'h800: csr_rdata_int = (!PULP_XPULP ? 'b0 : hwlp_start_i[0+:32]);
					12'h801: csr_rdata_int = (!PULP_XPULP ? 'b0 : hwlp_end_i[0+:32]);
					12'h802: csr_rdata_int = (!PULP_XPULP ? 'b0 : hwlp_cnt_i[0+:32]);
					12'h804: csr_rdata_int = (!PULP_XPULP ? 'b0 : hwlp_start_i[32+:32]);
					12'h805: csr_rdata_int = (!PULP_XPULP ? 'b0 : hwlp_end_i[32+:32]);
					12'h806: csr_rdata_int = (!PULP_XPULP ? 'b0 : hwlp_cnt_i[32+:32]);
					12'hcc0: csr_rdata_int = (!PULP_XPULP ? 'b0 : hart_id_i);
					12'hcc1: csr_rdata_int = (!PULP_XPULP ? 'b0 : {30'h00000000, priv_lvl_q});
					default: csr_rdata_int = 1'sb0;
				endcase
			end
		end
	endgenerate
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	generate
		if (PULP_SECURE == 1) begin : genblk2
			always @(*) begin
				if (_sv2v_0)
					;
				fflags_n = fflags_q;
				frm_n = frm_q;
				mscratch_n = mscratch_q;
				mepc_n = mepc_q;
				uepc_n = uepc_q;
				depc_n = depc_q;
				dcsr_n = dcsr_q;
				dscratch0_n = dscratch0_q;
				dscratch1_n = dscratch1_q;
				mstatus_n = mstatus_q;
				mcause_n = mcause_q;
				ucause_n = ucause_q;
				hwlp_we_o = 1'sb0;
				hwlp_regid_o = 1'sb0;
				exception_pc = pc_id_i;
				priv_lvl_n = priv_lvl_q;
				mtvec_n = (csr_mtvec_init_i ? mtvec_addr_i[31:8] : mtvec_q);
				utvec_n = utvec_q;
				mtvec_mode_n = mtvec_mode_q;
				utvec_mode_n = utvec_mode_q;
				pmp_reg_n[767-:512] = pmp_reg_q[767-:512];
				pmp_reg_n[255-:128] = pmp_reg_q[255-:128];
				pmpaddr_we = 1'sb0;
				pmpcfg_we = 1'sb0;
				mie_n = mie_q;
				if (FPU == 1) begin
					if (fflags_we_i)
						fflags_n = fflags_i | fflags_q;
				end
				case (csr_addr_i)
					12'h001:
						if (csr_we_int)
							fflags_n = (FPU == 1 ? csr_wdata_int[4:0] : {5 {1'sb0}});
					12'h002:
						if (csr_we_int)
							frm_n = (FPU == 1 ? csr_wdata_int[2:0] : {3 {1'sb0}});
					12'h003:
						if (csr_we_int) begin
							fflags_n = (FPU == 1 ? csr_wdata_int[4:0] : {5 {1'sb0}});
							frm_n = (FPU == 1 ? csr_wdata_int[7:cv32e40p_pkg_C_FFLAG] : {3 {1'sb0}});
						end
					12'h300:
						if (csr_we_int)
							mstatus_n = {csr_wdata_int[MSTATUS_UIE_BIT], csr_wdata_int[MSTATUS_MIE_BIT], csr_wdata_int[MSTATUS_UPIE_BIT], csr_wdata_int[MSTATUS_MPIE_BIT], sv2v_cast_2(csr_wdata_int[MSTATUS_MPP_BIT_HIGH:MSTATUS_MPP_BIT_LOW]), csr_wdata_int[MSTATUS_MPRV_BIT]};
					12'h304:
						if (csr_we_int)
							mie_n = csr_wdata_int & cv32e40p_pkg_IRQ_MASK;
					12'h305:
						if (csr_we_int) begin
							mtvec_n = csr_wdata_int[31:8];
							mtvec_mode_n = {1'b0, csr_wdata_int[0]};
						end
					12'h340:
						if (csr_we_int)
							mscratch_n = csr_wdata_int;
					12'h341:
						if (csr_we_int)
							mepc_n = csr_wdata_int & ~32'b00000000000000000000000000000001;
					12'h342:
						if (csr_we_int)
							mcause_n = {csr_wdata_int[31], csr_wdata_int[4:0]};
					12'h7b0:
						if (csr_we_int) begin
							dcsr_n[15] = csr_wdata_int[15];
							dcsr_n[13] = 1'b0;
							dcsr_n[12] = csr_wdata_int[12];
							dcsr_n[11] = csr_wdata_int[11];
							dcsr_n[10] = 1'b0;
							dcsr_n[9] = 1'b0;
							dcsr_n[4] = 1'b0;
							dcsr_n[2] = csr_wdata_int[2];
							dcsr_n[1-:2] = (csr_wdata_int[1:0] == 2'b11 ? 2'b11 : 2'b00);
						end
					12'h7b1:
						if (csr_we_int)
							depc_n = csr_wdata_int & ~32'b00000000000000000000000000000001;
					12'h7b2:
						if (csr_we_int)
							dscratch0_n = csr_wdata_int;
					12'h7b3:
						if (csr_we_int)
							dscratch1_n = csr_wdata_int;
					12'h800:
						if (PULP_XPULP && csr_we_int) begin
							hwlp_we_o = 3'b001;
							hwlp_regid_o = 1'b0;
						end
					12'h801:
						if (PULP_XPULP && csr_we_int) begin
							hwlp_we_o = 3'b010;
							hwlp_regid_o = 1'b0;
						end
					12'h802:
						if (PULP_XPULP && csr_we_int) begin
							hwlp_we_o = 3'b100;
							hwlp_regid_o = 1'b0;
						end
					12'h804:
						if (PULP_XPULP && csr_we_int) begin
							hwlp_we_o = 3'b001;
							hwlp_regid_o = 1'b1;
						end
					12'h805:
						if (PULP_XPULP && csr_we_int) begin
							hwlp_we_o = 3'b010;
							hwlp_regid_o = 1'b1;
						end
					12'h806:
						if (PULP_XPULP && csr_we_int) begin
							hwlp_we_o = 3'b100;
							hwlp_regid_o = 1'b1;
						end
					12'h3a0:
						if (csr_we_int) begin
							pmp_reg_n[128+:32] = csr_wdata_int;
							pmpcfg_we[3:0] = 4'b1111;
						end
					12'h3a1:
						if (csr_we_int) begin
							pmp_reg_n[160+:32] = csr_wdata_int;
							pmpcfg_we[7:4] = 4'b1111;
						end
					12'h3a2:
						if (csr_we_int) begin
							pmp_reg_n[192+:32] = csr_wdata_int;
							pmpcfg_we[11:8] = 4'b1111;
						end
					12'h3a3:
						if (csr_we_int) begin
							pmp_reg_n[224+:32] = csr_wdata_int;
							pmpcfg_we[15:12] = 4'b1111;
						end
					12'h3b0, 12'h3b1, 12'h3b2, 12'h3b3, 12'h3b4, 12'h3b5, 12'h3b6, 12'h3b7, 12'h3b8, 12'h3b9, 12'h3ba, 12'h3bb, 12'h3bc, 12'h3bd, 12'h3be, 12'h3bf:
						if (csr_we_int) begin
							pmp_reg_n[256 + (csr_addr_i[3:0] * 32)+:32] = csr_wdata_int;
							pmpaddr_we[csr_addr_i[3:0]] = 1'b1;
						end
					12'h000:
						if (csr_we_int)
							mstatus_n = {csr_wdata_int[MSTATUS_UIE_BIT], mstatus_q[5], csr_wdata_int[MSTATUS_UPIE_BIT], mstatus_q[3], sv2v_cast_2(mstatus_q[2-:2]), mstatus_q[0]};
					12'h005:
						if (csr_we_int) begin
							utvec_n = csr_wdata_int[31:8];
							utvec_mode_n = {1'b0, csr_wdata_int[0]};
						end
					12'h041:
						if (csr_we_int)
							uepc_n = csr_wdata_int;
					12'h042:
						if (csr_we_int)
							ucause_n = {csr_wdata_int[31], csr_wdata_int[4:0]};
				endcase
				(* full_case, parallel_case *)
				case (1'b1)
					csr_save_cause_i: begin
						(* full_case, parallel_case *)
						case (1'b1)
							csr_save_if_i: exception_pc = pc_if_i;
							csr_save_id_i: exception_pc = pc_id_i;
							csr_save_ex_i: exception_pc = pc_ex_i;
							default:
								;
						endcase
						(* full_case, parallel_case *)
						case (priv_lvl_q)
							2'b00:
								if (~is_irq) begin
									priv_lvl_n = 2'b11;
									mstatus_n[3] = mstatus_q[6];
									mstatus_n[5] = 1'b0;
									mstatus_n[2-:2] = 2'b00;
									if (debug_csr_save_i)
										depc_n = exception_pc;
									else
										mepc_n = exception_pc;
									mcause_n = csr_cause_i;
								end
								else if (~csr_irq_sec_i) begin
									priv_lvl_n = 2'b00;
									mstatus_n[4] = mstatus_q[6];
									mstatus_n[6] = 1'b0;
									if (debug_csr_save_i)
										depc_n = exception_pc;
									else
										uepc_n = exception_pc;
									ucause_n = csr_cause_i;
								end
								else begin
									priv_lvl_n = 2'b11;
									mstatus_n[3] = mstatus_q[6];
									mstatus_n[5] = 1'b0;
									mstatus_n[2-:2] = 2'b00;
									if (debug_csr_save_i)
										depc_n = exception_pc;
									else
										mepc_n = exception_pc;
									mcause_n = csr_cause_i;
								end
							2'b11:
								if (debug_csr_save_i) begin
									dcsr_n[1-:2] = 2'b11;
									dcsr_n[8-:3] = debug_cause_i;
									depc_n = exception_pc;
								end
								else begin
									priv_lvl_n = 2'b11;
									mstatus_n[3] = mstatus_q[5];
									mstatus_n[5] = 1'b0;
									mstatus_n[2-:2] = 2'b11;
									mepc_n = exception_pc;
									mcause_n = csr_cause_i;
								end
							default:
								;
						endcase
					end
					csr_restore_uret_i: begin
						mstatus_n[6] = mstatus_q[4];
						priv_lvl_n = 2'b00;
						mstatus_n[4] = 1'b1;
					end
					csr_restore_mret_i:
						(* full_case, parallel_case *)
						case (mstatus_q[2-:2])
							2'b00: begin
								mstatus_n[6] = mstatus_q[3];
								priv_lvl_n = 2'b00;
								mstatus_n[3] = 1'b1;
								mstatus_n[2-:2] = 2'b00;
							end
							2'b11: begin
								mstatus_n[5] = mstatus_q[3];
								priv_lvl_n = 2'b11;
								mstatus_n[3] = 1'b1;
								mstatus_n[2-:2] = 2'b00;
							end
							default:
								;
						endcase
					csr_restore_dret_i: priv_lvl_n = dcsr_q[1-:2];
					default:
						;
				endcase
			end
		end
		else begin : genblk2
			always @(*) begin
				if (_sv2v_0)
					;
				fflags_n = fflags_q;
				frm_n = frm_q;
				mscratch_n = mscratch_q;
				mepc_n = mepc_q;
				uepc_n = 'b0;
				depc_n = depc_q;
				dcsr_n = dcsr_q;
				dscratch0_n = dscratch0_q;
				dscratch1_n = dscratch1_q;
				mstatus_n = mstatus_q;
				mcause_n = mcause_q;
				ucause_n = 1'sb0;
				hwlp_we_o = 1'sb0;
				hwlp_regid_o = 1'sb0;
				exception_pc = pc_id_i;
				priv_lvl_n = priv_lvl_q;
				mtvec_n = (csr_mtvec_init_i ? mtvec_addr_i[31:8] : mtvec_q);
				utvec_n = 1'sb0;
				pmp_reg_n[767-:512] = 1'sb0;
				pmp_reg_n[255-:128] = 1'sb0;
				pmp_reg_n[127-:128] = 1'sb0;
				pmpaddr_we = 1'sb0;
				pmpcfg_we = 1'sb0;
				mie_n = mie_q;
				mtvec_mode_n = mtvec_mode_q;
				utvec_mode_n = 1'sb0;
				if (FPU == 1) begin
					if (fflags_we_i)
						fflags_n = fflags_i | fflags_q;
				end
				case (csr_addr_i)
					12'h001:
						if (csr_we_int)
							fflags_n = (FPU == 1 ? csr_wdata_int[4:0] : {5 {1'sb0}});
					12'h002:
						if (csr_we_int)
							frm_n = (FPU == 1 ? csr_wdata_int[2:0] : {3 {1'sb0}});
					12'h003:
						if (csr_we_int) begin
							fflags_n = (FPU == 1 ? csr_wdata_int[4:0] : {5 {1'sb0}});
							frm_n = (FPU == 1 ? csr_wdata_int[7:cv32e40p_pkg_C_FFLAG] : {3 {1'sb0}});
						end
					12'h300:
						if (csr_we_int)
							mstatus_n = {csr_wdata_int[MSTATUS_UIE_BIT], csr_wdata_int[MSTATUS_MIE_BIT], csr_wdata_int[MSTATUS_UPIE_BIT], csr_wdata_int[MSTATUS_MPIE_BIT], sv2v_cast_2(csr_wdata_int[MSTATUS_MPP_BIT_HIGH:MSTATUS_MPP_BIT_LOW]), csr_wdata_int[MSTATUS_MPRV_BIT]};
					12'h304:
						if (csr_we_int)
							mie_n = csr_wdata_int & cv32e40p_pkg_IRQ_MASK;
					12'h305:
						if (csr_we_int) begin
							mtvec_n = csr_wdata_int[31:8];
							mtvec_mode_n = {1'b0, csr_wdata_int[0]};
						end
					12'h340:
						if (csr_we_int)
							mscratch_n = csr_wdata_int;
					12'h341:
						if (csr_we_int)
							mepc_n = csr_wdata_int & ~32'b00000000000000000000000000000001;
					12'h342:
						if (csr_we_int)
							mcause_n = {csr_wdata_int[31], csr_wdata_int[4:0]};
					12'h7b0:
						if (csr_we_int) begin
							dcsr_n[15] = csr_wdata_int[15];
							dcsr_n[13] = 1'b0;
							dcsr_n[12] = 1'b0;
							dcsr_n[11] = csr_wdata_int[11];
							dcsr_n[10] = 1'b0;
							dcsr_n[9] = 1'b0;
							dcsr_n[4] = 1'b0;
							dcsr_n[2] = csr_wdata_int[2];
							dcsr_n[1-:2] = 2'b11;
						end
					12'h7b1:
						if (csr_we_int)
							depc_n = csr_wdata_int & ~32'b00000000000000000000000000000001;
					12'h7b2:
						if (csr_we_int)
							dscratch0_n = csr_wdata_int;
					12'h7b3:
						if (csr_we_int)
							dscratch1_n = csr_wdata_int;
					12'h800:
						if (PULP_XPULP && csr_we_int) begin
							hwlp_we_o = 3'b001;
							hwlp_regid_o = 1'b0;
						end
					12'h801:
						if (PULP_XPULP && csr_we_int) begin
							hwlp_we_o = 3'b010;
							hwlp_regid_o = 1'b0;
						end
					12'h802:
						if (PULP_XPULP && csr_we_int) begin
							hwlp_we_o = 3'b100;
							hwlp_regid_o = 1'b0;
						end
					12'h804:
						if (PULP_XPULP && csr_we_int) begin
							hwlp_we_o = 3'b001;
							hwlp_regid_o = 1'b1;
						end
					12'h805:
						if (PULP_XPULP && csr_we_int) begin
							hwlp_we_o = 3'b010;
							hwlp_regid_o = 1'b1;
						end
					12'h806:
						if (PULP_XPULP && csr_we_int) begin
							hwlp_we_o = 3'b100;
							hwlp_regid_o = 1'b1;
						end
				endcase
				(* full_case, parallel_case *)
				case (1'b1)
					csr_save_cause_i: begin
						(* full_case, parallel_case *)
						case (1'b1)
							csr_save_if_i: exception_pc = pc_if_i;
							csr_save_id_i: exception_pc = pc_id_i;
							csr_save_ex_i: exception_pc = pc_ex_i;
							default:
								;
						endcase
						if (debug_csr_save_i) begin
							dcsr_n[1-:2] = 2'b11;
							dcsr_n[8-:3] = debug_cause_i;
							depc_n = exception_pc;
						end
						else begin
							priv_lvl_n = 2'b11;
							mstatus_n[3] = mstatus_q[5];
							mstatus_n[5] = 1'b0;
							mstatus_n[2-:2] = 2'b11;
							mepc_n = exception_pc;
							mcause_n = csr_cause_i;
						end
					end
					csr_restore_mret_i: begin
						mstatus_n[5] = mstatus_q[3];
						priv_lvl_n = 2'b11;
						mstatus_n[3] = 1'b1;
						mstatus_n[2-:2] = 2'b11;
					end
					csr_restore_dret_i: priv_lvl_n = dcsr_q[1-:2];
					default:
						;
				endcase
			end
		end
	endgenerate
	assign hwlp_data_o = (PULP_XPULP ? csr_wdata_int : {32 {1'sb0}});
	always @(*) begin
		if (_sv2v_0)
			;
		csr_wdata_int = csr_wdata_i;
		csr_we_int = 1'b1;
		case (csr_op_i)
			cv32e40p_pkg_CSR_OP_WRITE: csr_wdata_int = csr_wdata_i;
			cv32e40p_pkg_CSR_OP_SET: csr_wdata_int = csr_wdata_i | csr_rdata_o;
			cv32e40p_pkg_CSR_OP_CLEAR: csr_wdata_int = ~csr_wdata_i & csr_rdata_o;
			cv32e40p_pkg_CSR_OP_READ: begin
				csr_wdata_int = csr_wdata_i;
				csr_we_int = 1'b0;
			end
		endcase
	end
	assign csr_rdata_o = csr_rdata_int;
	assign m_irq_enable_o = mstatus_q[5] && !(dcsr_q[2] && !dcsr_q[11]);
	assign u_irq_enable_o = mstatus_q[6] && !(dcsr_q[2] && !dcsr_q[11]);
	assign priv_lvl_o = priv_lvl_q;
	assign sec_lvl_o = priv_lvl_q[0];
	assign frm_o = (FPU == 1 ? frm_q : {3 {1'sb0}});
	assign mtvec_o = mtvec_q;
	assign utvec_o = utvec_q;
	assign mtvec_mode_o = mtvec_mode_q;
	assign utvec_mode_o = utvec_mode_q;
	assign mepc_o = mepc_q;
	assign uepc_o = uepc_q;
	assign mcounteren_o = (PULP_SECURE ? mcounteren_q : {32 {1'sb0}});
	assign depc_o = depc_q;
	assign pmp_addr_o = pmp_reg_q[767-:512];
	assign pmp_cfg_o = pmp_reg_q[127-:128];
	assign debug_single_step_o = dcsr_q[2];
	assign debug_ebreakm_o = dcsr_q[15];
	assign debug_ebreaku_o = dcsr_q[12];
	generate
		if (PULP_SECURE == 1) begin : genblk3
			for (_gv_j_2 = 0; _gv_j_2 < N_PMP_ENTRIES; _gv_j_2 = _gv_j_2 + 1) begin : CS_PMP_CFG
				localparam j = _gv_j_2;
				wire [8:1] sv2v_tmp_D8C4A;
				assign sv2v_tmp_D8C4A = pmp_reg_n[128 + (((j / 4) * 32) + (((8 * ((j % 4) + 1)) - 1) >= (8 * (j % 4)) ? (8 * ((j % 4) + 1)) - 1 : (((8 * ((j % 4) + 1)) - 1) + (((8 * ((j % 4) + 1)) - 1) >= (8 * (j % 4)) ? (((8 * ((j % 4) + 1)) - 1) - (8 * (j % 4))) + 1 : ((8 * (j % 4)) - ((8 * ((j % 4) + 1)) - 1)) + 1)) - 1))-:(((8 * ((j % 4) + 1)) - 1) >= (8 * (j % 4)) ? (((8 * ((j % 4) + 1)) - 1) - (8 * (j % 4))) + 1 : ((8 * (j % 4)) - ((8 * ((j % 4) + 1)) - 1)) + 1)];
				always @(*) pmp_reg_n[0 + (j * 8)+:8] = sv2v_tmp_D8C4A;
				wire [(((8 * ((j % 4) + 1)) - 1) >= (8 * (j % 4)) ? (((8 * ((j % 4) + 1)) - 1) - (8 * (j % 4))) + 1 : ((8 * (j % 4)) - ((8 * ((j % 4) + 1)) - 1)) + 1) * 1:1] sv2v_tmp_55D11;
				assign sv2v_tmp_55D11 = pmp_reg_q[0 + (j * 8)+:8];
				always @(*) pmp_reg_q[128 + (((j / 4) * 32) + (((8 * ((j % 4) + 1)) - 1) >= (8 * (j % 4)) ? (8 * ((j % 4) + 1)) - 1 : (((8 * ((j % 4) + 1)) - 1) + (((8 * ((j % 4) + 1)) - 1) >= (8 * (j % 4)) ? (((8 * ((j % 4) + 1)) - 1) - (8 * (j % 4))) + 1 : ((8 * (j % 4)) - ((8 * ((j % 4) + 1)) - 1)) + 1)) - 1))-:(((8 * ((j % 4) + 1)) - 1) >= (8 * (j % 4)) ? (((8 * ((j % 4) + 1)) - 1) - (8 * (j % 4))) + 1 : ((8 * (j % 4)) - ((8 * ((j % 4) + 1)) - 1)) + 1)] = sv2v_tmp_55D11;
			end
			for (_gv_j_2 = 0; _gv_j_2 < N_PMP_ENTRIES; _gv_j_2 = _gv_j_2 + 1) begin : CS_PMP_REGS_FF
				localparam j = _gv_j_2;
				always @(posedge clk or negedge rst_n)
					if (rst_n == 1'b0) begin
						pmp_reg_q[0 + (j * 8)+:8] <= 1'sb0;
						pmp_reg_q[256 + (j * 32)+:32] <= 1'sb0;
					end
					else begin
						if (pmpcfg_we[j])
							pmp_reg_q[0 + (j * 8)+:8] <= (USE_PMP ? pmp_reg_n[0 + (j * 8)+:8] : {8 {1'sb0}});
						if (pmpaddr_we[j])
							pmp_reg_q[256 + (j * 32)+:32] <= (USE_PMP ? pmp_reg_n[256 + (j * 32)+:32] : {32 {1'sb0}});
					end
			end
			always @(posedge clk or negedge rst_n)
				if (rst_n == 1'b0) begin
					uepc_q <= 1'sb0;
					ucause_q <= 1'sb0;
					utvec_q <= 1'sb0;
					utvec_mode_q <= MTVEC_MODE;
					priv_lvl_q <= 2'b11;
				end
				else begin
					uepc_q <= uepc_n;
					ucause_q <= ucause_n;
					utvec_q <= utvec_n;
					utvec_mode_q <= utvec_mode_n;
					priv_lvl_q <= priv_lvl_n;
				end
		end
		else begin : genblk3
			wire [768:1] sv2v_tmp_465C4;
			assign sv2v_tmp_465C4 = 1'sb0;
			always @(*) pmp_reg_q = sv2v_tmp_465C4;
			wire [32:1] sv2v_tmp_3902D;
			assign sv2v_tmp_3902D = 1'sb0;
			always @(*) uepc_q = sv2v_tmp_3902D;
			wire [6:1] sv2v_tmp_B705E;
			assign sv2v_tmp_B705E = 1'sb0;
			always @(*) ucause_q = sv2v_tmp_B705E;
			wire [24:1] sv2v_tmp_887BD;
			assign sv2v_tmp_887BD = 1'sb0;
			always @(*) utvec_q = sv2v_tmp_887BD;
			wire [2:1] sv2v_tmp_75169;
			assign sv2v_tmp_75169 = 1'sb0;
			always @(*) utvec_mode_q = sv2v_tmp_75169;
			wire [2:1] sv2v_tmp_49C73;
			assign sv2v_tmp_49C73 = 2'b11;
			always @(*) priv_lvl_q = sv2v_tmp_49C73;
		end
	endgenerate
	localparam cv32e40p_pkg_DBG_CAUSE_NONE = 3'h0;
	always @(posedge clk or negedge rst_n)
		if (rst_n == 1'b0) begin
			frm_q <= 1'sb0;
			fflags_q <= 1'sb0;
			mstatus_q <= 7'b0000110;
			mepc_q <= 1'sb0;
			mcause_q <= 1'sb0;
			depc_q <= 1'sb0;
			dcsr_q <= {23'h200000, cv32e40p_pkg_DBG_CAUSE_NONE, 6'b000011};
			dscratch0_q <= 1'sb0;
			dscratch1_q <= 1'sb0;
			mscratch_q <= 1'sb0;
			mie_q <= 1'sb0;
			mtvec_q <= 1'sb0;
			mtvec_mode_q <= MTVEC_MODE;
		end
		else begin
			if (FPU == 1) begin
				frm_q <= frm_n;
				fflags_q <= fflags_n;
			end
			else begin
				frm_q <= 'b0;
				fflags_q <= 'b0;
			end
			if (PULP_SECURE == 1)
				mstatus_q <= mstatus_n;
			else
				mstatus_q <= {1'b0, mstatus_n[5], 1'b0, mstatus_n[3], 3'b110};
			mepc_q <= mepc_n;
			mcause_q <= mcause_n;
			depc_q <= depc_n;
			dcsr_q <= dcsr_n;
			dscratch0_q <= dscratch0_n;
			dscratch1_q <= dscratch1_n;
			mscratch_q <= mscratch_n;
			mie_q <= mie_n;
			mtvec_q <= mtvec_n;
			mtvec_mode_q <= mtvec_mode_n;
		end
	generate
		if (DEBUG_TRIGGER_EN) begin : gen_trigger_regs
			reg tmatch_control_exec_q;
			reg [31:0] tmatch_value_q;
			wire tmatch_control_we;
			wire tmatch_value_we;
			assign tmatch_control_we = (csr_we_int & debug_mode_i) & (csr_addr_i == 12'h7a1);
			assign tmatch_value_we = (csr_we_int & debug_mode_i) & (csr_addr_i == 12'h7a2);
			always @(posedge clk or negedge rst_n)
				if (!rst_n) begin
					tmatch_control_exec_q <= 'b0;
					tmatch_value_q <= 'b0;
				end
				else begin
					if (tmatch_control_we)
						tmatch_control_exec_q <= csr_wdata_int[2];
					if (tmatch_value_we)
						tmatch_value_q <= csr_wdata_int[31:0];
				end
			assign tinfo_types = 4;
			assign tmatch_control_rdata = {28'h2800104, PULP_SECURE == 1, tmatch_control_exec_q, 2'b00};
			assign tmatch_value_rdata = tmatch_value_q;
			assign trigger_match_o = tmatch_control_exec_q & (pc_id_i[31:0] == tmatch_value_q[31:0]);
		end
		else begin : gen_no_trigger_regs
			assign tinfo_types = 'b0;
			assign tmatch_control_rdata = 'b0;
			assign tmatch_value_rdata = 'b0;
			assign trigger_match_o = 'b0;
		end
	endgenerate
	assign hpm_events[0] = 1'b1;
	assign hpm_events[1] = mhpmevent_minstret_i;
	assign hpm_events[2] = mhpmevent_ld_stall_i;
	assign hpm_events[3] = mhpmevent_jr_stall_i;
	assign hpm_events[4] = mhpmevent_imiss_i;
	assign hpm_events[5] = mhpmevent_load_i;
	assign hpm_events[6] = mhpmevent_store_i;
	assign hpm_events[7] = mhpmevent_jump_i;
	assign hpm_events[8] = mhpmevent_branch_i;
	assign hpm_events[9] = mhpmevent_branch_taken_i;
	assign hpm_events[10] = mhpmevent_compressed_i;
	assign hpm_events[11] = (PULP_CLUSTER ? mhpmevent_pipe_stall_i : 1'b0);
	assign hpm_events[12] = (!APU ? 1'b0 : apu_typeconflict_i && !apu_dep_i);
	assign hpm_events[13] = (!APU ? 1'b0 : apu_contention_i);
	assign hpm_events[14] = (!APU ? 1'b0 : apu_dep_i && !apu_contention_i);
	assign hpm_events[15] = (!APU ? 1'b0 : apu_wb_i);
	wire mcounteren_we;
	wire mcountinhibit_we;
	wire mhpmevent_we;
	assign mcounteren_we = csr_we_int & (csr_addr_i == 12'h306);
	assign mcountinhibit_we = csr_we_int & (csr_addr_i == 12'h320);
	assign mhpmevent_we = csr_we_int & (((((((((((((((((((((((((((((csr_addr_i == 12'h323) || (csr_addr_i == 12'h324)) || (csr_addr_i == 12'h325)) || (csr_addr_i == 12'h326)) || (csr_addr_i == 12'h327)) || (csr_addr_i == 12'h328)) || (csr_addr_i == 12'h329)) || (csr_addr_i == 12'h32a)) || (csr_addr_i == 12'h32b)) || (csr_addr_i == 12'h32c)) || (csr_addr_i == 12'h32d)) || (csr_addr_i == 12'h32e)) || (csr_addr_i == 12'h32f)) || (csr_addr_i == 12'h330)) || (csr_addr_i == 12'h331)) || (csr_addr_i == 12'h332)) || (csr_addr_i == 12'h333)) || (csr_addr_i == 12'h334)) || (csr_addr_i == 12'h335)) || (csr_addr_i == 12'h336)) || (csr_addr_i == 12'h337)) || (csr_addr_i == 12'h338)) || (csr_addr_i == 12'h339)) || (csr_addr_i == 12'h33a)) || (csr_addr_i == 12'h33b)) || (csr_addr_i == 12'h33c)) || (csr_addr_i == 12'h33d)) || (csr_addr_i == 12'h33e)) || (csr_addr_i == 12'h33f));
	always @(*) begin
		if (_sv2v_0)
			;
		begin : sv2v_autoblock_1
			reg signed [31:0] cnt_idx;
			for (cnt_idx = 0; cnt_idx < 32; cnt_idx = cnt_idx + 1)
				mhpmcounter_increment[cnt_idx * 64+:64] = mhpmcounter_q[cnt_idx * 64+:64] + 1;
		end
	end
	always @(*) begin
		if (_sv2v_0)
			;
		mcounteren_n = mcounteren_q;
		mcountinhibit_n = mcountinhibit_q;
		mhpmevent_n = mhpmevent_q;
		mhpmcounter_write_lower = 32'b00000000000000000000000000000000;
		mhpmcounter_write_upper = 32'b00000000000000000000000000000000;
		mhpmcounter_write_increment = 32'b00000000000000000000000000000000;
		if (PULP_SECURE && mcounteren_we)
			mcounteren_n = csr_wdata_int;
		if (mcountinhibit_we)
			mcountinhibit_n = csr_wdata_int;
		if (mhpmevent_we)
			mhpmevent_n[csr_addr_i[4:0] * 32+:32] = csr_wdata_int;
		begin : sv2v_autoblock_2
			reg signed [31:0] cnt_idx;
			for (cnt_idx = 0; cnt_idx < 32; cnt_idx = cnt_idx + 1)
				if (csr_we_int && (csr_addr_i == (12'hb00 + cnt_idx)))
					mhpmcounter_write_lower[cnt_idx] = 1'b1;
				else if ((csr_we_int && (csr_addr_i == (12'hb80 + cnt_idx))) && 1'd1)
					mhpmcounter_write_upper[cnt_idx] = 1'b1;
				else if (!mcountinhibit_q[cnt_idx]) begin
					if (!PULP_PERF_COUNTERS) begin
						if (cnt_idx == 0)
							mhpmcounter_write_increment[cnt_idx] = 1'b1;
						else if (cnt_idx == 2)
							mhpmcounter_write_increment[cnt_idx] = hpm_events[1];
						else if ((cnt_idx > 2) && (cnt_idx < (NUM_MHPMCOUNTERS + 3)))
							mhpmcounter_write_increment[cnt_idx] = |(hpm_events & mhpmevent_q[(cnt_idx * 32) + 15-:16]);
					end
					else
						mhpmcounter_write_increment[cnt_idx] = |(hpm_events & mhpmevent_q[(cnt_idx * 32) + 15-:16]);
				end
		end
	end
	genvar _gv_cnt_gidx_1;
	generate
		for (_gv_cnt_gidx_1 = 0; _gv_cnt_gidx_1 < 32; _gv_cnt_gidx_1 = _gv_cnt_gidx_1 + 1) begin : g_mhpmcounter
			localparam cnt_gidx = _gv_cnt_gidx_1;
			if ((cnt_gidx == 1) || (cnt_gidx >= (NUM_MHPMCOUNTERS + 3))) begin : g_non_implemented
				wire [64:1] sv2v_tmp_54AEF;
				assign sv2v_tmp_54AEF = 'b0;
				always @(*) mhpmcounter_q[cnt_gidx * 64+:64] = sv2v_tmp_54AEF;
			end
			else begin : g_implemented
				always @(posedge clk or negedge rst_n)
					if (!rst_n)
						mhpmcounter_q[cnt_gidx * 64+:64] <= 'b0;
					else if (mhpmcounter_write_lower[cnt_gidx])
						mhpmcounter_q[(cnt_gidx * 64) + 31-:32] <= csr_wdata_int;
					else if (mhpmcounter_write_upper[cnt_gidx])
						mhpmcounter_q[(cnt_gidx * 64) + 63-:32] <= csr_wdata_int;
					else if (mhpmcounter_write_increment[cnt_gidx])
						mhpmcounter_q[cnt_gidx * 64+:64] <= mhpmcounter_increment[cnt_gidx * 64+:64];
			end
		end
	endgenerate
	genvar _gv_evt_gidx_1;
	generate
		for (_gv_evt_gidx_1 = 0; _gv_evt_gidx_1 < 32; _gv_evt_gidx_1 = _gv_evt_gidx_1 + 1) begin : g_mhpmevent
			localparam evt_gidx = _gv_evt_gidx_1;
			if ((evt_gidx < 3) || (evt_gidx >= (NUM_MHPMCOUNTERS + 3))) begin : g_non_implemented
				wire [32:1] sv2v_tmp_A2164;
				assign sv2v_tmp_A2164 = 'b0;
				always @(*) mhpmevent_q[evt_gidx * 32+:32] = sv2v_tmp_A2164;
			end
			else begin : g_implemented
				if (1) begin : genblk1
					wire [16:1] sv2v_tmp_89151;
					assign sv2v_tmp_89151 = 'b0;
					always @(*) mhpmevent_q[(evt_gidx * 32) + 31-:16] = sv2v_tmp_89151;
				end
				always @(posedge clk or negedge rst_n)
					if (!rst_n)
						mhpmevent_q[(evt_gidx * 32) + 15-:16] <= 'b0;
					else
						mhpmevent_q[(evt_gidx * 32) + 15-:16] <= mhpmevent_n[(evt_gidx * 32) + 15-:16];
			end
		end
	endgenerate
	genvar _gv_en_gidx_1;
	generate
		for (_gv_en_gidx_1 = 0; _gv_en_gidx_1 < 32; _gv_en_gidx_1 = _gv_en_gidx_1 + 1) begin : g_mcounteren
			localparam en_gidx = _gv_en_gidx_1;
			if (((PULP_SECURE == 0) || (en_gidx == 1)) || (en_gidx >= (NUM_MHPMCOUNTERS + 3))) begin : g_non_implemented
				wire [1:1] sv2v_tmp_F00BA;
				assign sv2v_tmp_F00BA = 'b0;
				always @(*) mcounteren_q[en_gidx] = sv2v_tmp_F00BA;
			end
			else begin : g_implemented
				always @(posedge clk or negedge rst_n)
					if (!rst_n)
						mcounteren_q[en_gidx] <= 'b0;
					else
						mcounteren_q[en_gidx] <= mcounteren_n[en_gidx];
			end
		end
	endgenerate
	genvar _gv_inh_gidx_1;
	generate
		for (_gv_inh_gidx_1 = 0; _gv_inh_gidx_1 < 32; _gv_inh_gidx_1 = _gv_inh_gidx_1 + 1) begin : g_mcountinhibit
			localparam inh_gidx = _gv_inh_gidx_1;
			if ((inh_gidx == 1) || (inh_gidx >= (NUM_MHPMCOUNTERS + 3))) begin : g_non_implemented
				wire [1:1] sv2v_tmp_488B4;
				assign sv2v_tmp_488B4 = 'b0;
				always @(*) mcountinhibit_q[inh_gidx] = sv2v_tmp_488B4;
			end
			else begin : g_implemented
				always @(posedge clk or negedge rst_n)
					if (!rst_n)
						mcountinhibit_q[inh_gidx] <= 'b1;
					else
						mcountinhibit_q[inh_gidx] <= mcountinhibit_n[inh_gidx];
			end
		end
	endgenerate
	initial _sv2v_0 = 0;
endmodule
