module cv32e40p_if_stage (
	clk,
	rst_n,
	m_trap_base_addr_i,
	u_trap_base_addr_i,
	trap_addr_mux_i,
	boot_addr_i,
	dm_exception_addr_i,
	dm_halt_addr_i,
	req_i,
	instr_req_o,
	instr_addr_o,
	instr_gnt_i,
	instr_rvalid_i,
	instr_rdata_i,
	instr_err_i,
	instr_err_pmp_i,
	instr_valid_id_o,
	instr_rdata_id_o,
	is_compressed_id_o,
	illegal_c_insn_id_o,
	pc_if_o,
	pc_id_o,
	is_fetch_failed_o,
	clear_instr_valid_i,
	pc_set_i,
	mepc_i,
	uepc_i,
	depc_i,
	pc_mux_i,
	exc_pc_mux_i,
	m_exc_vec_pc_mux_i,
	u_exc_vec_pc_mux_i,
	csr_mtvec_init_o,
	jump_target_id_i,
	jump_target_ex_i,
	hwlp_jump_i,
	hwlp_target_i,
	halt_if_i,
	id_ready_i,
	if_busy_o,
	perf_imiss_o
);
	reg _sv2v_0;
	parameter PULP_XPULP = 0;
	parameter PULP_OBI = 0;
	parameter PULP_SECURE = 0;
	parameter FPU = 0;
	input wire clk;
	input wire rst_n;
	input wire [23:0] m_trap_base_addr_i;
	input wire [23:0] u_trap_base_addr_i;
	input wire [1:0] trap_addr_mux_i;
	input wire [31:0] boot_addr_i;
	input wire [31:0] dm_exception_addr_i;
	input wire [31:0] dm_halt_addr_i;
	input wire req_i;
	output wire instr_req_o;
	output wire [31:0] instr_addr_o;
	input wire instr_gnt_i;
	input wire instr_rvalid_i;
	input wire [31:0] instr_rdata_i;
	input wire instr_err_i;
	input wire instr_err_pmp_i;
	output reg instr_valid_id_o;
	output reg [31:0] instr_rdata_id_o;
	output reg is_compressed_id_o;
	output reg illegal_c_insn_id_o;
	output wire [31:0] pc_if_o;
	output reg [31:0] pc_id_o;
	output reg is_fetch_failed_o;
	input wire clear_instr_valid_i;
	input wire pc_set_i;
	input wire [31:0] mepc_i;
	input wire [31:0] uepc_i;
	input wire [31:0] depc_i;
	input wire [3:0] pc_mux_i;
	input wire [2:0] exc_pc_mux_i;
	input wire [4:0] m_exc_vec_pc_mux_i;
	input wire [4:0] u_exc_vec_pc_mux_i;
	output wire csr_mtvec_init_o;
	input wire [31:0] jump_target_id_i;
	input wire [31:0] jump_target_ex_i;
	input wire hwlp_jump_i;
	input wire [31:0] hwlp_target_i;
	input wire halt_if_i;
	input wire id_ready_i;
	output wire if_busy_o;
	output wire perf_imiss_o;
	wire if_valid;
	wire if_ready;
	wire prefetch_busy;
	reg branch_req;
	reg [31:0] branch_addr_n;
	wire fetch_valid;
	reg fetch_ready;
	wire [31:0] fetch_rdata;
	reg [31:0] exc_pc;
	reg [23:0] trap_base_addr;
	reg [4:0] exc_vec_pc_mux;
	wire fetch_failed;
	wire aligner_ready;
	wire instr_valid;
	wire illegal_c_insn;
	wire [31:0] instr_aligned;
	wire [31:0] instr_decompressed;
	wire instr_compressed_int;
	localparam cv32e40p_pkg_EXC_PC_DBD = 3'b010;
	localparam cv32e40p_pkg_EXC_PC_DBE = 3'b011;
	localparam cv32e40p_pkg_EXC_PC_EXCEPTION = 3'b000;
	localparam cv32e40p_pkg_EXC_PC_IRQ = 3'b001;
	localparam cv32e40p_pkg_TRAP_MACHINE = 2'b00;
	localparam cv32e40p_pkg_TRAP_USER = 2'b01;
	always @(*) begin : EXC_PC_MUX
		if (_sv2v_0)
			;
		(* full_case, parallel_case *)
		case (trap_addr_mux_i)
			cv32e40p_pkg_TRAP_MACHINE: trap_base_addr = m_trap_base_addr_i;
			cv32e40p_pkg_TRAP_USER: trap_base_addr = u_trap_base_addr_i;
			default: trap_base_addr = m_trap_base_addr_i;
		endcase
		(* full_case, parallel_case *)
		case (trap_addr_mux_i)
			cv32e40p_pkg_TRAP_MACHINE: exc_vec_pc_mux = m_exc_vec_pc_mux_i;
			cv32e40p_pkg_TRAP_USER: exc_vec_pc_mux = u_exc_vec_pc_mux_i;
			default: exc_vec_pc_mux = m_exc_vec_pc_mux_i;
		endcase
		(* full_case, parallel_case *)
		case (exc_pc_mux_i)
			cv32e40p_pkg_EXC_PC_EXCEPTION: exc_pc = {trap_base_addr, 8'h00};
			cv32e40p_pkg_EXC_PC_IRQ: exc_pc = {trap_base_addr, 1'b0, exc_vec_pc_mux, 2'b00};
			cv32e40p_pkg_EXC_PC_DBD: exc_pc = {dm_halt_addr_i[31:2], 2'b00};
			cv32e40p_pkg_EXC_PC_DBE: exc_pc = {dm_exception_addr_i[31:2], 2'b00};
			default: exc_pc = {trap_base_addr, 8'h00};
		endcase
	end
	localparam cv32e40p_pkg_PC_BOOT = 4'b0000;
	localparam cv32e40p_pkg_PC_BRANCH = 4'b0011;
	localparam cv32e40p_pkg_PC_DRET = 4'b0111;
	localparam cv32e40p_pkg_PC_EXCEPTION = 4'b0100;
	localparam cv32e40p_pkg_PC_FENCEI = 4'b0001;
	localparam cv32e40p_pkg_PC_HWLOOP = 4'b1000;
	localparam cv32e40p_pkg_PC_JUMP = 4'b0010;
	localparam cv32e40p_pkg_PC_MRET = 4'b0101;
	localparam cv32e40p_pkg_PC_URET = 4'b0110;
	always @(*) begin
		if (_sv2v_0)
			;
		branch_addr_n = {boot_addr_i[31:2], 2'b00};
		(* full_case, parallel_case *)
		case (pc_mux_i)
			cv32e40p_pkg_PC_BOOT: branch_addr_n = {boot_addr_i[31:2], 2'b00};
			cv32e40p_pkg_PC_JUMP: branch_addr_n = jump_target_id_i;
			cv32e40p_pkg_PC_BRANCH: branch_addr_n = jump_target_ex_i;
			cv32e40p_pkg_PC_EXCEPTION: branch_addr_n = exc_pc;
			cv32e40p_pkg_PC_MRET: branch_addr_n = mepc_i;
			cv32e40p_pkg_PC_URET: branch_addr_n = uepc_i;
			cv32e40p_pkg_PC_DRET: branch_addr_n = depc_i;
			cv32e40p_pkg_PC_FENCEI: branch_addr_n = pc_id_o + 4;
			cv32e40p_pkg_PC_HWLOOP: branch_addr_n = hwlp_target_i;
			default:
				;
		endcase
	end
	assign csr_mtvec_init_o = (pc_mux_i == cv32e40p_pkg_PC_BOOT) & pc_set_i;
	assign fetch_failed = 1'b0;
	cv32e40p_prefetch_buffer #(
		.PULP_OBI(PULP_OBI),
		.PULP_XPULP(PULP_XPULP)
	) prefetch_buffer_i(
		.clk(clk),
		.rst_n(rst_n),
		.req_i(req_i),
		.branch_i(branch_req),
		.branch_addr_i({branch_addr_n[31:1], 1'b0}),
		.hwlp_jump_i(hwlp_jump_i),
		.hwlp_target_i(hwlp_target_i),
		.fetch_ready_i(fetch_ready),
		.fetch_valid_o(fetch_valid),
		.fetch_rdata_o(fetch_rdata),
		.instr_req_o(instr_req_o),
		.instr_addr_o(instr_addr_o),
		.instr_gnt_i(instr_gnt_i),
		.instr_rvalid_i(instr_rvalid_i),
		.instr_err_i(instr_err_i),
		.instr_err_pmp_i(instr_err_pmp_i),
		.instr_rdata_i(instr_rdata_i),
		.busy_o(prefetch_busy)
	);
	always @(*) begin
		if (_sv2v_0)
			;
		fetch_ready = 1'b0;
		branch_req = 1'b0;
		if (pc_set_i)
			branch_req = 1'b1;
		else if (fetch_valid) begin
			if (req_i && if_valid)
				fetch_ready = aligner_ready;
		end
	end
	assign if_busy_o = prefetch_busy;
	assign perf_imiss_o = !fetch_valid && !branch_req;
	always @(posedge clk or negedge rst_n) begin : IF_ID_PIPE_REGISTERS
		if (rst_n == 1'b0) begin
			instr_valid_id_o <= 1'b0;
			instr_rdata_id_o <= 1'sb0;
			is_fetch_failed_o <= 1'b0;
			pc_id_o <= 1'sb0;
			is_compressed_id_o <= 1'b0;
			illegal_c_insn_id_o <= 1'b0;
		end
		else if (if_valid && instr_valid) begin
			instr_valid_id_o <= 1'b1;
			instr_rdata_id_o <= instr_decompressed;
			is_compressed_id_o <= instr_compressed_int;
			illegal_c_insn_id_o <= illegal_c_insn;
			is_fetch_failed_o <= 1'b0;
			pc_id_o <= pc_if_o;
		end
		else if (clear_instr_valid_i) begin
			instr_valid_id_o <= 1'b0;
			is_fetch_failed_o <= fetch_failed;
		end
	end
	assign if_ready = fetch_valid & id_ready_i;
	assign if_valid = ~halt_if_i & if_ready;
	cv32e40p_aligner aligner_i(
		.clk(clk),
		.rst_n(rst_n),
		.fetch_valid_i(fetch_valid),
		.aligner_ready_o(aligner_ready),
		.if_valid_i(if_valid),
		.fetch_rdata_i(fetch_rdata),
		.instr_aligned_o(instr_aligned),
		.instr_valid_o(instr_valid),
		.branch_addr_i({branch_addr_n[31:1], 1'b0}),
		.branch_i(branch_req),
		.hwlp_addr_i(hwlp_target_i),
		.hwlp_update_pc_i(hwlp_jump_i),
		.pc_o(pc_if_o)
	);
	cv32e40p_compressed_decoder #(.FPU(FPU)) compressed_decoder_i(
		.instr_i(instr_aligned),
		.instr_o(instr_decompressed),
		.is_compressed_o(instr_compressed_int),
		.illegal_instr_o(illegal_c_insn)
	);
	initial _sv2v_0 = 0;
endmodule
