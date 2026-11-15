module cv32e40p_decoder (
	deassert_we_i,
	illegal_insn_o,
	ebrk_insn_o,
	mret_insn_o,
	uret_insn_o,
	dret_insn_o,
	mret_dec_o,
	uret_dec_o,
	dret_dec_o,
	ecall_insn_o,
	wfi_o,
	fencei_insn_o,
	rega_used_o,
	regb_used_o,
	regc_used_o,
	reg_fp_a_o,
	reg_fp_b_o,
	reg_fp_c_o,
	reg_fp_d_o,
	bmask_a_mux_o,
	bmask_b_mux_o,
	alu_bmask_a_mux_sel_o,
	alu_bmask_b_mux_sel_o,
	instr_rdata_i,
	illegal_c_insn_i,
	alu_en_o,
	alu_operator_o,
	alu_op_a_mux_sel_o,
	alu_op_b_mux_sel_o,
	alu_op_c_mux_sel_o,
	alu_vec_mode_o,
	scalar_replication_o,
	scalar_replication_c_o,
	imm_a_mux_sel_o,
	imm_b_mux_sel_o,
	regc_mux_o,
	is_clpx_o,
	is_subrot_o,
	mult_operator_o,
	mult_int_en_o,
	mult_dot_en_o,
	mult_imm_mux_o,
	mult_sel_subword_o,
	mult_signed_mode_o,
	mult_dot_signed_o,
	frm_i,
	fpu_dst_fmt_o,
	fpu_src_fmt_o,
	fpu_int_fmt_o,
	apu_en_o,
	apu_op_o,
	apu_lat_o,
	fp_rnd_mode_o,
	regfile_mem_we_o,
	regfile_alu_we_o,
	regfile_alu_we_dec_o,
	regfile_alu_waddr_sel_o,
	csr_access_o,
	csr_status_o,
	csr_op_o,
	current_priv_lvl_i,
	data_req_o,
	data_we_o,
	prepost_useincr_o,
	data_type_o,
	data_sign_extension_o,
	data_reg_offset_o,
	data_load_event_o,
	atop_o,
	hwlp_we_o,
	hwlp_target_mux_sel_o,
	hwlp_start_mux_sel_o,
	hwlp_cnt_mux_sel_o,
	debug_mode_i,
	debug_wfi_no_sleep_i,
	ctrl_transfer_insn_in_dec_o,
	ctrl_transfer_insn_in_id_o,
	ctrl_transfer_target_mux_sel_o,
	mcounteren_i
);
	reg _sv2v_0;
	parameter PULP_XPULP = 1;
	parameter PULP_CLUSTER = 0;
	parameter A_EXTENSION = 0;
	parameter FPU = 0;
	parameter PULP_SECURE = 0;
	parameter USE_PMP = 0;
	parameter APU_WOP_CPU = 6;
	parameter DEBUG_TRIGGER_EN = 1;
	input wire deassert_we_i;
	output reg illegal_insn_o;
	output reg ebrk_insn_o;
	output reg mret_insn_o;
	output reg uret_insn_o;
	output reg dret_insn_o;
	output reg mret_dec_o;
	output reg uret_dec_o;
	output reg dret_dec_o;
	output reg ecall_insn_o;
	output reg wfi_o;
	output reg fencei_insn_o;
	output reg rega_used_o;
	output reg regb_used_o;
	output reg regc_used_o;
	output reg reg_fp_a_o;
	output reg reg_fp_b_o;
	output reg reg_fp_c_o;
	output reg reg_fp_d_o;
	output reg [0:0] bmask_a_mux_o;
	output reg [1:0] bmask_b_mux_o;
	output reg alu_bmask_a_mux_sel_o;
	output reg alu_bmask_b_mux_sel_o;
	input wire [31:0] instr_rdata_i;
	input wire illegal_c_insn_i;
	output wire alu_en_o;
	localparam cv32e40p_pkg_ALU_OP_WIDTH = 7;
	output reg [6:0] alu_operator_o;
	output reg [2:0] alu_op_a_mux_sel_o;
	output reg [2:0] alu_op_b_mux_sel_o;
	output reg [1:0] alu_op_c_mux_sel_o;
	output reg [1:0] alu_vec_mode_o;
	output reg scalar_replication_o;
	output reg scalar_replication_c_o;
	output reg [0:0] imm_a_mux_sel_o;
	output reg [3:0] imm_b_mux_sel_o;
	output reg [1:0] regc_mux_o;
	output reg is_clpx_o;
	output reg is_subrot_o;
	output reg [2:0] mult_operator_o;
	output wire mult_int_en_o;
	output wire mult_dot_en_o;
	output reg [0:0] mult_imm_mux_o;
	output reg mult_sel_subword_o;
	output reg [1:0] mult_signed_mode_o;
	output reg [1:0] mult_dot_signed_o;
	localparam cv32e40p_pkg_C_RM = 3;
	input wire [2:0] frm_i;
	localparam [31:0] cv32e40p_fpu_pkg_NUM_FP_FORMATS = 5;
	localparam [31:0] cv32e40p_fpu_pkg_FP_FORMAT_BITS = 3;
	output reg [2:0] fpu_dst_fmt_o;
	output reg [2:0] fpu_src_fmt_o;
	localparam [31:0] cv32e40p_fpu_pkg_NUM_INT_FORMATS = 4;
	localparam [31:0] cv32e40p_fpu_pkg_INT_FORMAT_BITS = 2;
	output reg [1:0] fpu_int_fmt_o;
	output wire apu_en_o;
	output reg [APU_WOP_CPU - 1:0] apu_op_o;
	output reg [1:0] apu_lat_o;
	output reg [2:0] fp_rnd_mode_o;
	output wire regfile_mem_we_o;
	output wire regfile_alu_we_o;
	output wire regfile_alu_we_dec_o;
	output reg regfile_alu_waddr_sel_o;
	output reg csr_access_o;
	output reg csr_status_o;
	output wire [1:0] csr_op_o;
	input wire [1:0] current_priv_lvl_i;
	output wire data_req_o;
	output reg data_we_o;
	output reg prepost_useincr_o;
	output reg [1:0] data_type_o;
	output reg [1:0] data_sign_extension_o;
	output reg [1:0] data_reg_offset_o;
	output reg data_load_event_o;
	output reg [5:0] atop_o;
	output wire [2:0] hwlp_we_o;
	output reg hwlp_target_mux_sel_o;
	output reg hwlp_start_mux_sel_o;
	output reg hwlp_cnt_mux_sel_o;
	input wire debug_mode_i;
	input wire debug_wfi_no_sleep_i;
	output wire [1:0] ctrl_transfer_insn_in_dec_o;
	output wire [1:0] ctrl_transfer_insn_in_id_o;
	output reg [1:0] ctrl_transfer_target_mux_sel_o;
	input wire [31:0] mcounteren_i;
	reg regfile_mem_we;
	reg regfile_alu_we;
	reg data_req;
	reg [2:0] hwlp_we;
	reg csr_illegal;
	reg [1:0] ctrl_transfer_insn;
	reg [1:0] csr_op;
	reg alu_en;
	reg mult_int_en;
	reg mult_dot_en;
	reg apu_en;
	reg check_fprm;
	localparam [31:0] cv32e40p_fpu_pkg_OP_BITS = 4;
	reg [3:0] fpu_op;
	reg fpu_op_mod;
	reg fpu_vec_op;
	reg [1:0] fp_op_group;
	localparam cv32e40p_apu_core_pkg_PIPE_REG_ADDSUB = 1;
	localparam cv32e40p_apu_core_pkg_PIPE_REG_CAST = 1;
	localparam cv32e40p_apu_core_pkg_PIPE_REG_MAC = 2;
	localparam cv32e40p_apu_core_pkg_PIPE_REG_MULT = 1;
	localparam cv32e40p_pkg_ALU_ABS = 7'b0010100;
	localparam cv32e40p_pkg_ALU_ADD = 7'b0011000;
	localparam cv32e40p_pkg_ALU_ADDR = 7'b0011100;
	localparam cv32e40p_pkg_ALU_ADDU = 7'b0011010;
	localparam cv32e40p_pkg_ALU_ADDUR = 7'b0011110;
	localparam cv32e40p_pkg_ALU_AND = 7'b0010101;
	localparam cv32e40p_pkg_ALU_BCLR = 7'b0101011;
	localparam cv32e40p_pkg_ALU_BEXT = 7'b0101000;
	localparam cv32e40p_pkg_ALU_BEXTU = 7'b0101001;
	localparam cv32e40p_pkg_ALU_BINS = 7'b0101010;
	localparam cv32e40p_pkg_ALU_BREV = 7'b1001001;
	localparam cv32e40p_pkg_ALU_BSET = 7'b0101100;
	localparam cv32e40p_pkg_ALU_CLB = 7'b0110101;
	localparam cv32e40p_pkg_ALU_CLIP = 7'b0010110;
	localparam cv32e40p_pkg_ALU_CLIPU = 7'b0010111;
	localparam cv32e40p_pkg_ALU_CNT = 7'b0110100;
	localparam cv32e40p_pkg_ALU_DIV = 7'b0110001;
	localparam cv32e40p_pkg_ALU_DIVU = 7'b0110000;
	localparam cv32e40p_pkg_ALU_EQ = 7'b0001100;
	localparam cv32e40p_pkg_ALU_EXT = 7'b0111111;
	localparam cv32e40p_pkg_ALU_EXTS = 7'b0111110;
	localparam cv32e40p_pkg_ALU_FF1 = 7'b0110110;
	localparam cv32e40p_pkg_ALU_FL1 = 7'b0110111;
	localparam cv32e40p_pkg_ALU_GES = 7'b0001010;
	localparam cv32e40p_pkg_ALU_GEU = 7'b0001011;
	localparam cv32e40p_pkg_ALU_GTS = 7'b0001000;
	localparam cv32e40p_pkg_ALU_GTU = 7'b0001001;
	localparam cv32e40p_pkg_ALU_INS = 7'b0101101;
	localparam cv32e40p_pkg_ALU_LES = 7'b0000100;
	localparam cv32e40p_pkg_ALU_LEU = 7'b0000101;
	localparam cv32e40p_pkg_ALU_LTS = 7'b0000000;
	localparam cv32e40p_pkg_ALU_LTU = 7'b0000001;
	localparam cv32e40p_pkg_ALU_MAX = 7'b0010010;
	localparam cv32e40p_pkg_ALU_MAXU = 7'b0010011;
	localparam cv32e40p_pkg_ALU_MIN = 7'b0010000;
	localparam cv32e40p_pkg_ALU_MINU = 7'b0010001;
	localparam cv32e40p_pkg_ALU_NE = 7'b0001101;
	localparam cv32e40p_pkg_ALU_OR = 7'b0101110;
	localparam cv32e40p_pkg_ALU_PCKHI = 7'b0111001;
	localparam cv32e40p_pkg_ALU_PCKLO = 7'b0111000;
	localparam cv32e40p_pkg_ALU_REM = 7'b0110011;
	localparam cv32e40p_pkg_ALU_REMU = 7'b0110010;
	localparam cv32e40p_pkg_ALU_ROR = 7'b0100110;
	localparam cv32e40p_pkg_ALU_SHUF = 7'b0111010;
	localparam cv32e40p_pkg_ALU_SHUF2 = 7'b0111011;
	localparam cv32e40p_pkg_ALU_SLETS = 7'b0000110;
	localparam cv32e40p_pkg_ALU_SLETU = 7'b0000111;
	localparam cv32e40p_pkg_ALU_SLL = 7'b0100111;
	localparam cv32e40p_pkg_ALU_SLTS = 7'b0000010;
	localparam cv32e40p_pkg_ALU_SLTU = 7'b0000011;
	localparam cv32e40p_pkg_ALU_SRA = 7'b0100100;
	localparam cv32e40p_pkg_ALU_SRL = 7'b0100101;
	localparam cv32e40p_pkg_ALU_SUB = 7'b0011001;
	localparam cv32e40p_pkg_ALU_SUBR = 7'b0011101;
	localparam cv32e40p_pkg_ALU_SUBU = 7'b0011011;
	localparam cv32e40p_pkg_ALU_SUBUR = 7'b0011111;
	localparam cv32e40p_pkg_ALU_XOR = 7'b0101111;
	localparam cv32e40p_pkg_AMO_ADD = 5'b00000;
	localparam cv32e40p_pkg_AMO_AND = 5'b01100;
	localparam cv32e40p_pkg_AMO_LR = 5'b00010;
	localparam cv32e40p_pkg_AMO_MAX = 5'b10100;
	localparam cv32e40p_pkg_AMO_MAXU = 5'b11100;
	localparam cv32e40p_pkg_AMO_MIN = 5'b10000;
	localparam cv32e40p_pkg_AMO_MINU = 5'b11000;
	localparam cv32e40p_pkg_AMO_OR = 5'b01000;
	localparam cv32e40p_pkg_AMO_SC = 5'b00011;
	localparam cv32e40p_pkg_AMO_SWAP = 5'b00001;
	localparam cv32e40p_pkg_AMO_XOR = 5'b00100;
	localparam cv32e40p_pkg_BMASK_A_IMM = 1'b1;
	localparam cv32e40p_pkg_BMASK_A_REG = 1'b0;
	localparam cv32e40p_pkg_BMASK_A_S3 = 1'b1;
	localparam cv32e40p_pkg_BMASK_A_ZERO = 1'b0;
	localparam cv32e40p_pkg_BMASK_B_IMM = 1'b1;
	localparam cv32e40p_pkg_BMASK_B_ONE = 2'b11;
	localparam cv32e40p_pkg_BMASK_B_REG = 1'b0;
	localparam cv32e40p_pkg_BMASK_B_S2 = 2'b00;
	localparam cv32e40p_pkg_BMASK_B_S3 = 2'b01;
	localparam cv32e40p_pkg_BMASK_B_ZERO = 2'b10;
	localparam cv32e40p_pkg_BRANCH_COND = 2'b11;
	localparam cv32e40p_pkg_BRANCH_JAL = 2'b01;
	localparam cv32e40p_pkg_BRANCH_JALR = 2'b10;
	localparam cv32e40p_pkg_BRANCH_NONE = 2'b00;
	localparam cv32e40p_pkg_CSR_OP_CLEAR = 2'b11;
	localparam cv32e40p_pkg_CSR_OP_READ = 2'b00;
	localparam cv32e40p_pkg_CSR_OP_SET = 2'b10;
	localparam cv32e40p_pkg_CSR_OP_WRITE = 2'b01;
	localparam [31:0] cv32e40p_pkg_C_LAT_CONV = 'd0;
	localparam [31:0] cv32e40p_pkg_C_LAT_FP16 = 'd0;
	localparam [31:0] cv32e40p_pkg_C_LAT_FP16ALT = 'd0;
	localparam [31:0] cv32e40p_pkg_C_LAT_FP32 = 'd0;
	localparam [31:0] cv32e40p_pkg_C_LAT_FP64 = 'd0;
	localparam [31:0] cv32e40p_pkg_C_LAT_FP8 = 'd0;
	localparam [31:0] cv32e40p_pkg_C_LAT_NONCOMP = 'd0;
	localparam [0:0] cv32e40p_pkg_C_RVD = 1'b0;
	localparam [0:0] cv32e40p_pkg_C_RVF = 1'b1;
	localparam [0:0] cv32e40p_pkg_C_XF16 = 1'b0;
	localparam [0:0] cv32e40p_pkg_C_XF16ALT = 1'b0;
	localparam [0:0] cv32e40p_pkg_C_XF8 = 1'b0;
	localparam [0:0] cv32e40p_pkg_C_XFVEC = 1'b0;
	localparam cv32e40p_pkg_IMMA_Z = 1'b0;
	localparam cv32e40p_pkg_IMMA_ZERO = 1'b1;
	localparam cv32e40p_pkg_IMMB_BI = 4'b1011;
	localparam cv32e40p_pkg_IMMB_CLIP = 4'b1001;
	localparam cv32e40p_pkg_IMMB_I = 4'b0000;
	localparam cv32e40p_pkg_IMMB_PCINCR = 4'b0011;
	localparam cv32e40p_pkg_IMMB_S = 4'b0001;
	localparam cv32e40p_pkg_IMMB_S2 = 4'b0100;
	localparam cv32e40p_pkg_IMMB_SHUF = 4'b1000;
	localparam cv32e40p_pkg_IMMB_U = 4'b0010;
	localparam cv32e40p_pkg_IMMB_VS = 4'b0110;
	localparam cv32e40p_pkg_IMMB_VU = 4'b0111;
	localparam cv32e40p_pkg_JT_COND = 2'b11;
	localparam cv32e40p_pkg_JT_JAL = 2'b01;
	localparam cv32e40p_pkg_JT_JALR = 2'b10;
	localparam cv32e40p_pkg_MIMM_S3 = 1'b1;
	localparam cv32e40p_pkg_MIMM_ZERO = 1'b0;
	localparam cv32e40p_pkg_MUL_DOT16 = 3'b101;
	localparam cv32e40p_pkg_MUL_DOT8 = 3'b100;
	localparam cv32e40p_pkg_MUL_H = 3'b110;
	localparam cv32e40p_pkg_MUL_I = 3'b010;
	localparam cv32e40p_pkg_MUL_IR = 3'b011;
	localparam cv32e40p_pkg_MUL_MAC32 = 3'b000;
	localparam cv32e40p_pkg_MUL_MSU32 = 3'b001;
	localparam cv32e40p_pkg_OPCODE_AMO = 7'h2f;
	localparam cv32e40p_pkg_OPCODE_AUIPC = 7'h17;
	localparam cv32e40p_pkg_OPCODE_BRANCH = 7'h63;
	localparam cv32e40p_pkg_OPCODE_FENCE = 7'h0f;
	localparam cv32e40p_pkg_OPCODE_HWLOOP = 7'h7b;
	localparam cv32e40p_pkg_OPCODE_JAL = 7'h6f;
	localparam cv32e40p_pkg_OPCODE_JALR = 7'h67;
	localparam cv32e40p_pkg_OPCODE_LOAD = 7'h03;
	localparam cv32e40p_pkg_OPCODE_LOAD_FP = 7'h07;
	localparam cv32e40p_pkg_OPCODE_LOAD_POST = 7'h0b;
	localparam cv32e40p_pkg_OPCODE_LUI = 7'h37;
	localparam cv32e40p_pkg_OPCODE_OP = 7'h33;
	localparam cv32e40p_pkg_OPCODE_OPIMM = 7'h13;
	localparam cv32e40p_pkg_OPCODE_OP_FMADD = 7'h43;
	localparam cv32e40p_pkg_OPCODE_OP_FMSUB = 7'h47;
	localparam cv32e40p_pkg_OPCODE_OP_FNMADD = 7'h4f;
	localparam cv32e40p_pkg_OPCODE_OP_FNMSUB = 7'h4b;
	localparam cv32e40p_pkg_OPCODE_OP_FP = 7'h53;
	localparam cv32e40p_pkg_OPCODE_PULP_OP = 7'h5b;
	localparam cv32e40p_pkg_OPCODE_STORE = 7'h23;
	localparam cv32e40p_pkg_OPCODE_STORE_FP = 7'h27;
	localparam cv32e40p_pkg_OPCODE_STORE_POST = 7'h2b;
	localparam cv32e40p_pkg_OPCODE_SYSTEM = 7'h73;
	localparam cv32e40p_pkg_OPCODE_VECOP = 7'h57;
	localparam cv32e40p_pkg_OP_A_CURRPC = 3'b001;
	localparam cv32e40p_pkg_OP_A_IMM = 3'b010;
	localparam cv32e40p_pkg_OP_A_REGA_OR_FWD = 3'b000;
	localparam cv32e40p_pkg_OP_A_REGB_OR_FWD = 3'b011;
	localparam cv32e40p_pkg_OP_A_REGC_OR_FWD = 3'b100;
	localparam cv32e40p_pkg_OP_B_BMASK = 3'b100;
	localparam cv32e40p_pkg_OP_B_IMM = 3'b010;
	localparam cv32e40p_pkg_OP_B_REGA_OR_FWD = 3'b011;
	localparam cv32e40p_pkg_OP_B_REGB_OR_FWD = 3'b000;
	localparam cv32e40p_pkg_OP_B_REGC_OR_FWD = 3'b001;
	localparam cv32e40p_pkg_OP_C_JT = 2'b10;
	localparam cv32e40p_pkg_OP_C_REGB_OR_FWD = 2'b01;
	localparam cv32e40p_pkg_OP_C_REGC_OR_FWD = 2'b00;
	localparam cv32e40p_pkg_REGC_RD = 2'b01;
	localparam cv32e40p_pkg_REGC_S1 = 2'b10;
	localparam cv32e40p_pkg_REGC_S4 = 2'b00;
	localparam cv32e40p_pkg_REGC_ZERO = 2'b11;
	localparam cv32e40p_pkg_VEC_MODE16 = 2'b10;
	localparam cv32e40p_pkg_VEC_MODE32 = 2'b00;
	localparam cv32e40p_pkg_VEC_MODE8 = 2'b11;
	function automatic [3:0] sv2v_cast_FEEA0;
		input reg [3:0] inp;
		sv2v_cast_FEEA0 = inp;
	endfunction
	function automatic [2:0] sv2v_cast_8141C;
		input reg [2:0] inp;
		sv2v_cast_8141C = inp;
	endfunction
	function automatic [1:0] sv2v_cast_4EB16;
		input reg [1:0] inp;
		sv2v_cast_4EB16 = inp;
	endfunction
	always @(*) begin
		if (_sv2v_0)
			;
		ctrl_transfer_insn = cv32e40p_pkg_BRANCH_NONE;
		ctrl_transfer_target_mux_sel_o = cv32e40p_pkg_JT_JAL;
		alu_en = 1'b1;
		alu_operator_o = cv32e40p_pkg_ALU_SLTU;
		alu_op_a_mux_sel_o = cv32e40p_pkg_OP_A_REGA_OR_FWD;
		alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_REGB_OR_FWD;
		alu_op_c_mux_sel_o = cv32e40p_pkg_OP_C_REGC_OR_FWD;
		alu_vec_mode_o = cv32e40p_pkg_VEC_MODE32;
		scalar_replication_o = 1'b0;
		scalar_replication_c_o = 1'b0;
		regc_mux_o = cv32e40p_pkg_REGC_ZERO;
		imm_a_mux_sel_o = cv32e40p_pkg_IMMA_ZERO;
		imm_b_mux_sel_o = cv32e40p_pkg_IMMB_I;
		mult_operator_o = cv32e40p_pkg_MUL_I;
		mult_int_en = 1'b0;
		mult_dot_en = 1'b0;
		mult_imm_mux_o = cv32e40p_pkg_MIMM_ZERO;
		mult_signed_mode_o = 2'b00;
		mult_sel_subword_o = 1'b0;
		mult_dot_signed_o = 2'b00;
		apu_en = 1'b0;
		apu_op_o = 1'sb0;
		apu_lat_o = 1'sb0;
		fp_rnd_mode_o = 1'sb0;
		fpu_op = sv2v_cast_FEEA0(6);
		fpu_op_mod = 1'b0;
		fpu_vec_op = 1'b0;
		fpu_dst_fmt_o = sv2v_cast_8141C('d0);
		fpu_src_fmt_o = sv2v_cast_8141C('d0);
		fpu_int_fmt_o = sv2v_cast_4EB16(2);
		check_fprm = 1'b0;
		fp_op_group = 2'd0;
		regfile_mem_we = 1'b0;
		regfile_alu_we = 1'b0;
		regfile_alu_waddr_sel_o = 1'b1;
		prepost_useincr_o = 1'b1;
		hwlp_we = 3'b000;
		hwlp_target_mux_sel_o = 1'b0;
		hwlp_start_mux_sel_o = 1'b0;
		hwlp_cnt_mux_sel_o = 1'b0;
		csr_access_o = 1'b0;
		csr_status_o = 1'b0;
		csr_illegal = 1'b0;
		csr_op = cv32e40p_pkg_CSR_OP_READ;
		mret_insn_o = 1'b0;
		uret_insn_o = 1'b0;
		dret_insn_o = 1'b0;
		data_we_o = 1'b0;
		data_type_o = 2'b00;
		data_sign_extension_o = 2'b00;
		data_reg_offset_o = 2'b00;
		data_req = 1'b0;
		data_load_event_o = 1'b0;
		atop_o = 6'b000000;
		illegal_insn_o = 1'b0;
		ebrk_insn_o = 1'b0;
		ecall_insn_o = 1'b0;
		wfi_o = 1'b0;
		fencei_insn_o = 1'b0;
		rega_used_o = 1'b0;
		regb_used_o = 1'b0;
		regc_used_o = 1'b0;
		reg_fp_a_o = 1'b0;
		reg_fp_b_o = 1'b0;
		reg_fp_c_o = 1'b0;
		reg_fp_d_o = 1'b0;
		bmask_a_mux_o = cv32e40p_pkg_BMASK_A_ZERO;
		bmask_b_mux_o = cv32e40p_pkg_BMASK_B_ZERO;
		alu_bmask_a_mux_sel_o = cv32e40p_pkg_BMASK_A_IMM;
		alu_bmask_b_mux_sel_o = cv32e40p_pkg_BMASK_B_IMM;
		is_clpx_o = 1'b0;
		is_subrot_o = 1'b0;
		mret_dec_o = 1'b0;
		uret_dec_o = 1'b0;
		dret_dec_o = 1'b0;
		(* full_case, parallel_case *)
		case (instr_rdata_i[6:0])
			cv32e40p_pkg_OPCODE_JAL: begin
				ctrl_transfer_target_mux_sel_o = cv32e40p_pkg_JT_JAL;
				ctrl_transfer_insn = cv32e40p_pkg_BRANCH_JAL;
				alu_op_a_mux_sel_o = cv32e40p_pkg_OP_A_CURRPC;
				alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_IMM;
				imm_b_mux_sel_o = cv32e40p_pkg_IMMB_PCINCR;
				alu_operator_o = cv32e40p_pkg_ALU_ADD;
				regfile_alu_we = 1'b1;
			end
			cv32e40p_pkg_OPCODE_JALR: begin
				ctrl_transfer_target_mux_sel_o = cv32e40p_pkg_JT_JALR;
				ctrl_transfer_insn = cv32e40p_pkg_BRANCH_JALR;
				alu_op_a_mux_sel_o = cv32e40p_pkg_OP_A_CURRPC;
				alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_IMM;
				imm_b_mux_sel_o = cv32e40p_pkg_IMMB_PCINCR;
				alu_operator_o = cv32e40p_pkg_ALU_ADD;
				regfile_alu_we = 1'b1;
				rega_used_o = 1'b1;
				if (instr_rdata_i[14:12] != 3'b000) begin
					ctrl_transfer_insn = cv32e40p_pkg_BRANCH_NONE;
					regfile_alu_we = 1'b0;
					illegal_insn_o = 1'b1;
				end
			end
			cv32e40p_pkg_OPCODE_BRANCH: begin
				ctrl_transfer_target_mux_sel_o = cv32e40p_pkg_JT_COND;
				ctrl_transfer_insn = cv32e40p_pkg_BRANCH_COND;
				alu_op_c_mux_sel_o = cv32e40p_pkg_OP_C_JT;
				rega_used_o = 1'b1;
				regb_used_o = 1'b1;
				(* full_case, parallel_case *)
				case (instr_rdata_i[14:12])
					3'b000: alu_operator_o = cv32e40p_pkg_ALU_EQ;
					3'b001: alu_operator_o = cv32e40p_pkg_ALU_NE;
					3'b100: alu_operator_o = cv32e40p_pkg_ALU_LTS;
					3'b101: alu_operator_o = cv32e40p_pkg_ALU_GES;
					3'b110: alu_operator_o = cv32e40p_pkg_ALU_LTU;
					3'b111: alu_operator_o = cv32e40p_pkg_ALU_GEU;
					3'b010:
						if (PULP_XPULP) begin
							alu_operator_o = cv32e40p_pkg_ALU_EQ;
							regb_used_o = 1'b0;
							alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_IMM;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_BI;
						end
						else
							illegal_insn_o = 1'b1;
					3'b011:
						if (PULP_XPULP) begin
							alu_operator_o = cv32e40p_pkg_ALU_NE;
							regb_used_o = 1'b0;
							alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_IMM;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_BI;
						end
						else
							illegal_insn_o = 1'b1;
				endcase
			end
			cv32e40p_pkg_OPCODE_STORE, cv32e40p_pkg_OPCODE_STORE_POST:
				if (PULP_XPULP || (instr_rdata_i[6:0] == cv32e40p_pkg_OPCODE_STORE)) begin
					data_req = 1'b1;
					data_we_o = 1'b1;
					rega_used_o = 1'b1;
					regb_used_o = 1'b1;
					alu_operator_o = cv32e40p_pkg_ALU_ADD;
					alu_op_c_mux_sel_o = cv32e40p_pkg_OP_C_REGB_OR_FWD;
					if (instr_rdata_i[6:0] == cv32e40p_pkg_OPCODE_STORE_POST) begin
						prepost_useincr_o = 1'b0;
						regfile_alu_waddr_sel_o = 1'b0;
						regfile_alu_we = 1'b1;
					end
					if (instr_rdata_i[14] == 1'b0) begin
						imm_b_mux_sel_o = cv32e40p_pkg_IMMB_S;
						alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_IMM;
					end
					else if (PULP_XPULP) begin
						regc_used_o = 1'b1;
						alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_REGC_OR_FWD;
						regc_mux_o = cv32e40p_pkg_REGC_RD;
					end
					else
						illegal_insn_o = 1'b1;
					(* full_case, parallel_case *)
					case (instr_rdata_i[13:12])
						2'b00: data_type_o = 2'b10;
						2'b01: data_type_o = 2'b01;
						2'b10: data_type_o = 2'b00;
						default: begin
							data_req = 1'b0;
							data_we_o = 1'b0;
							illegal_insn_o = 1'b1;
						end
					endcase
				end
				else
					illegal_insn_o = 1'b1;
			cv32e40p_pkg_OPCODE_LOAD, cv32e40p_pkg_OPCODE_LOAD_POST:
				if (PULP_XPULP || (instr_rdata_i[6:0] == cv32e40p_pkg_OPCODE_LOAD)) begin
					data_req = 1'b1;
					regfile_mem_we = 1'b1;
					rega_used_o = 1'b1;
					data_type_o = 2'b00;
					alu_operator_o = cv32e40p_pkg_ALU_ADD;
					alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_IMM;
					imm_b_mux_sel_o = cv32e40p_pkg_IMMB_I;
					if (instr_rdata_i[6:0] == cv32e40p_pkg_OPCODE_LOAD_POST) begin
						prepost_useincr_o = 1'b0;
						regfile_alu_waddr_sel_o = 1'b0;
						regfile_alu_we = 1'b1;
					end
					data_sign_extension_o = {1'b0, ~instr_rdata_i[14]};
					(* full_case, parallel_case *)
					case (instr_rdata_i[13:12])
						2'b00: data_type_o = 2'b10;
						2'b01: data_type_o = 2'b01;
						2'b10: data_type_o = 2'b00;
						default: data_type_o = 2'b00;
					endcase
					if (instr_rdata_i[14:12] == 3'b111) begin
						if (PULP_XPULP) begin
							regb_used_o = 1'b1;
							alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_REGB_OR_FWD;
							data_sign_extension_o = {1'b0, ~instr_rdata_i[30]};
							(* full_case, parallel_case *)
							case (instr_rdata_i[31:25])
								7'b0000000, 7'b0100000: data_type_o = 2'b10;
								7'b0001000, 7'b0101000: data_type_o = 2'b01;
								7'b0010000: data_type_o = 2'b00;
								default: illegal_insn_o = 1'b1;
							endcase
						end
						else
							illegal_insn_o = 1'b1;
					end
					if (instr_rdata_i[14:12] == 3'b110) begin
						if (PULP_CLUSTER && (instr_rdata_i[6:0] == cv32e40p_pkg_OPCODE_LOAD))
							data_load_event_o = 1'b1;
						else
							illegal_insn_o = 1'b1;
					end
					if (instr_rdata_i[14:12] == 3'b011)
						illegal_insn_o = 1'b1;
				end
				else
					illegal_insn_o = 1'b1;
			cv32e40p_pkg_OPCODE_AMO:
				if (A_EXTENSION) begin : decode_amo
					if (instr_rdata_i[14:12] == 3'b010) begin
						data_req = 1'b1;
						data_type_o = 2'b00;
						rega_used_o = 1'b1;
						regb_used_o = 1'b1;
						regfile_mem_we = 1'b1;
						prepost_useincr_o = 1'b0;
						alu_op_a_mux_sel_o = cv32e40p_pkg_OP_A_REGA_OR_FWD;
						data_sign_extension_o = 1'b1;
						atop_o = {1'b1, instr_rdata_i[31:27]};
						(* full_case, parallel_case *)
						case (instr_rdata_i[31:27])
							cv32e40p_pkg_AMO_LR: data_we_o = 1'b0;
							cv32e40p_pkg_AMO_SC, cv32e40p_pkg_AMO_SWAP, cv32e40p_pkg_AMO_ADD, cv32e40p_pkg_AMO_XOR, cv32e40p_pkg_AMO_AND, cv32e40p_pkg_AMO_OR, cv32e40p_pkg_AMO_MIN, cv32e40p_pkg_AMO_MAX, cv32e40p_pkg_AMO_MINU, cv32e40p_pkg_AMO_MAXU: begin
								data_we_o = 1'b1;
								alu_op_c_mux_sel_o = cv32e40p_pkg_OP_C_REGB_OR_FWD;
							end
							default: illegal_insn_o = 1'b1;
						endcase
					end
					else
						illegal_insn_o = 1'b1;
				end
				else begin : no_decode_amo
					illegal_insn_o = 1'b1;
				end
			cv32e40p_pkg_OPCODE_LUI: begin
				alu_op_a_mux_sel_o = cv32e40p_pkg_OP_A_IMM;
				alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_IMM;
				imm_a_mux_sel_o = cv32e40p_pkg_IMMA_ZERO;
				imm_b_mux_sel_o = cv32e40p_pkg_IMMB_U;
				alu_operator_o = cv32e40p_pkg_ALU_ADD;
				regfile_alu_we = 1'b1;
			end
			cv32e40p_pkg_OPCODE_AUIPC: begin
				alu_op_a_mux_sel_o = cv32e40p_pkg_OP_A_CURRPC;
				alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_IMM;
				imm_b_mux_sel_o = cv32e40p_pkg_IMMB_U;
				alu_operator_o = cv32e40p_pkg_ALU_ADD;
				regfile_alu_we = 1'b1;
			end
			cv32e40p_pkg_OPCODE_OPIMM: begin
				alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_IMM;
				imm_b_mux_sel_o = cv32e40p_pkg_IMMB_I;
				regfile_alu_we = 1'b1;
				rega_used_o = 1'b1;
				(* full_case, parallel_case *)
				case (instr_rdata_i[14:12])
					3'b000: alu_operator_o = cv32e40p_pkg_ALU_ADD;
					3'b010: alu_operator_o = cv32e40p_pkg_ALU_SLTS;
					3'b011: alu_operator_o = cv32e40p_pkg_ALU_SLTU;
					3'b100: alu_operator_o = cv32e40p_pkg_ALU_XOR;
					3'b110: alu_operator_o = cv32e40p_pkg_ALU_OR;
					3'b111: alu_operator_o = cv32e40p_pkg_ALU_AND;
					3'b001: begin
						alu_operator_o = cv32e40p_pkg_ALU_SLL;
						if (instr_rdata_i[31:25] != 7'b0000000)
							illegal_insn_o = 1'b1;
					end
					3'b101:
						if (instr_rdata_i[31:25] == 7'b0000000)
							alu_operator_o = cv32e40p_pkg_ALU_SRL;
						else if (instr_rdata_i[31:25] == 7'b0100000)
							alu_operator_o = cv32e40p_pkg_ALU_SRA;
						else
							illegal_insn_o = 1'b1;
				endcase
			end
			cv32e40p_pkg_OPCODE_OP:
				if (instr_rdata_i[31:30] == 2'b11) begin
					if (PULP_XPULP) begin
						regfile_alu_we = 1'b1;
						rega_used_o = 1'b1;
						bmask_a_mux_o = cv32e40p_pkg_BMASK_A_S3;
						bmask_b_mux_o = cv32e40p_pkg_BMASK_B_S2;
						alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_IMM;
						(* full_case, parallel_case *)
						case (instr_rdata_i[14:12])
							3'b000: begin
								alu_operator_o = cv32e40p_pkg_ALU_BEXT;
								imm_b_mux_sel_o = cv32e40p_pkg_IMMB_S2;
								bmask_b_mux_o = cv32e40p_pkg_BMASK_B_ZERO;
							end
							3'b001: begin
								alu_operator_o = cv32e40p_pkg_ALU_BEXTU;
								imm_b_mux_sel_o = cv32e40p_pkg_IMMB_S2;
								bmask_b_mux_o = cv32e40p_pkg_BMASK_B_ZERO;
							end
							3'b010: begin
								alu_operator_o = cv32e40p_pkg_ALU_BINS;
								imm_b_mux_sel_o = cv32e40p_pkg_IMMB_S2;
								regc_used_o = 1'b1;
								regc_mux_o = cv32e40p_pkg_REGC_RD;
							end
							3'b011: alu_operator_o = cv32e40p_pkg_ALU_BCLR;
							3'b100: alu_operator_o = cv32e40p_pkg_ALU_BSET;
							3'b101: begin
								alu_operator_o = cv32e40p_pkg_ALU_BREV;
								regc_used_o = 1'b1;
								regc_mux_o = cv32e40p_pkg_REGC_RD;
								imm_b_mux_sel_o = cv32e40p_pkg_IMMB_S2;
								alu_bmask_a_mux_sel_o = cv32e40p_pkg_BMASK_A_IMM;
							end
							default: illegal_insn_o = 1'b1;
						endcase
					end
					else
						illegal_insn_o = 1'b1;
				end
				else if (instr_rdata_i[31:30] == 2'b10) begin
					if (instr_rdata_i[29:25] == 5'b00000) begin
						if (PULP_XPULP) begin
							regfile_alu_we = 1'b1;
							rega_used_o = 1'b1;
							bmask_a_mux_o = cv32e40p_pkg_BMASK_A_S3;
							bmask_b_mux_o = cv32e40p_pkg_BMASK_B_S2;
							alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_IMM;
							(* full_case, parallel_case *)
							case (instr_rdata_i[14:12])
								3'b000: begin
									alu_operator_o = cv32e40p_pkg_ALU_BEXT;
									imm_b_mux_sel_o = cv32e40p_pkg_IMMB_S2;
									bmask_b_mux_o = cv32e40p_pkg_BMASK_B_ZERO;
									alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_BMASK;
									alu_bmask_a_mux_sel_o = cv32e40p_pkg_BMASK_A_REG;
									regb_used_o = 1'b1;
								end
								3'b001: begin
									alu_operator_o = cv32e40p_pkg_ALU_BEXTU;
									imm_b_mux_sel_o = cv32e40p_pkg_IMMB_S2;
									bmask_b_mux_o = cv32e40p_pkg_BMASK_B_ZERO;
									alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_BMASK;
									alu_bmask_a_mux_sel_o = cv32e40p_pkg_BMASK_A_REG;
									regb_used_o = 1'b1;
								end
								3'b010: begin
									alu_operator_o = cv32e40p_pkg_ALU_BINS;
									imm_b_mux_sel_o = cv32e40p_pkg_IMMB_S2;
									regc_used_o = 1'b1;
									regc_mux_o = cv32e40p_pkg_REGC_RD;
									alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_BMASK;
									alu_bmask_a_mux_sel_o = cv32e40p_pkg_BMASK_A_REG;
									alu_bmask_b_mux_sel_o = cv32e40p_pkg_BMASK_B_REG;
									regb_used_o = 1'b1;
								end
								3'b011: begin
									alu_operator_o = cv32e40p_pkg_ALU_BCLR;
									regb_used_o = 1'b1;
									alu_bmask_a_mux_sel_o = cv32e40p_pkg_BMASK_A_REG;
									alu_bmask_b_mux_sel_o = cv32e40p_pkg_BMASK_B_REG;
								end
								3'b100: begin
									alu_operator_o = cv32e40p_pkg_ALU_BSET;
									regb_used_o = 1'b1;
									alu_bmask_a_mux_sel_o = cv32e40p_pkg_BMASK_A_REG;
									alu_bmask_b_mux_sel_o = cv32e40p_pkg_BMASK_B_REG;
								end
								default: illegal_insn_o = 1'b1;
							endcase
						end
						else
							illegal_insn_o = 1'b1;
					end
					else if ((FPU == 1) && cv32e40p_pkg_C_XFVEC) begin
						apu_en = 1'b1;
						alu_en = 1'b0;
						rega_used_o = 1'b1;
						regb_used_o = 1'b1;
						reg_fp_a_o = 1'b1;
						reg_fp_b_o = 1'b1;
						reg_fp_d_o = 1'b1;
						fpu_vec_op = 1'b1;
						scalar_replication_o = instr_rdata_i[14];
						check_fprm = 1'b1;
						fp_rnd_mode_o = frm_i;
						(* full_case, parallel_case *)
						case (instr_rdata_i[13:12])
							2'b00: begin
								fpu_dst_fmt_o = sv2v_cast_8141C('d0);
								alu_vec_mode_o = cv32e40p_pkg_VEC_MODE32;
							end
							2'b01: begin
								fpu_dst_fmt_o = sv2v_cast_8141C('d4);
								alu_vec_mode_o = cv32e40p_pkg_VEC_MODE16;
							end
							2'b10: begin
								fpu_dst_fmt_o = sv2v_cast_8141C('d2);
								alu_vec_mode_o = cv32e40p_pkg_VEC_MODE16;
							end
							2'b11: begin
								fpu_dst_fmt_o = sv2v_cast_8141C('d3);
								alu_vec_mode_o = cv32e40p_pkg_VEC_MODE8;
							end
						endcase
						fpu_src_fmt_o = fpu_dst_fmt_o;
						(* full_case, parallel_case *)
						if (instr_rdata_i[29:25] == 5'b00001) begin
							fpu_op = sv2v_cast_FEEA0(2);
							fp_op_group = 2'd0;
							alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_REGA_OR_FWD;
							alu_op_c_mux_sel_o = cv32e40p_pkg_OP_C_REGB_OR_FWD;
							scalar_replication_o = 1'b0;
							scalar_replication_c_o = instr_rdata_i[14];
						end
						else if (instr_rdata_i[29:25] == 5'b00010) begin
							fpu_op = sv2v_cast_FEEA0(2);
							fpu_op_mod = 1'b1;
							fp_op_group = 2'd0;
							alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_REGA_OR_FWD;
							alu_op_c_mux_sel_o = cv32e40p_pkg_OP_C_REGB_OR_FWD;
							scalar_replication_o = 1'b0;
							scalar_replication_c_o = instr_rdata_i[14];
						end
						else if (instr_rdata_i[29:25] == 5'b00011) begin
							fpu_op = sv2v_cast_FEEA0(3);
							fp_op_group = 2'd0;
						end
						else if (instr_rdata_i[29:25] == 5'b00100) begin
							fpu_op = sv2v_cast_FEEA0(4);
							fp_op_group = 2'd1;
						end
						else if (instr_rdata_i[29:25] == 5'b00101) begin
							fpu_op = sv2v_cast_FEEA0(7);
							fp_rnd_mode_o = 3'b000;
							fp_op_group = 2'd2;
							check_fprm = 1'b0;
						end
						else if (instr_rdata_i[29:25] == 5'b00110) begin
							fpu_op = sv2v_cast_FEEA0(7);
							fp_rnd_mode_o = 3'b001;
							fp_op_group = 2'd2;
							check_fprm = 1'b0;
						end
						else if (instr_rdata_i[29:25] == 5'b00111) begin
							regb_used_o = 1'b0;
							fpu_op = sv2v_cast_FEEA0(5);
							fp_op_group = 2'd1;
							if ((instr_rdata_i[24:20] != 5'b00000) || instr_rdata_i[14])
								illegal_insn_o = 1'b1;
						end
						else if (instr_rdata_i[29:25] == 5'b01000) begin
							regc_used_o = 1'b1;
							regc_mux_o = cv32e40p_pkg_REGC_RD;
							reg_fp_c_o = 1'b1;
							fpu_op = sv2v_cast_FEEA0(0);
							fp_op_group = 2'd0;
						end
						else if (instr_rdata_i[29:25] == 5'b01001) begin
							regc_used_o = 1'b1;
							regc_mux_o = cv32e40p_pkg_REGC_RD;
							reg_fp_c_o = 1'b1;
							fpu_op = sv2v_cast_FEEA0(0);
							fpu_op_mod = 1'b1;
							fp_op_group = 2'd0;
						end
						else if (instr_rdata_i[29:25] == 5'b01100) begin
							regb_used_o = 1'b0;
							scalar_replication_o = 1'b0;
							(* full_case, parallel_case *)
							if (instr_rdata_i[24:20] == 5'b00000) begin
								alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_REGA_OR_FWD;
								fpu_op = sv2v_cast_FEEA0(6);
								fp_rnd_mode_o = 3'b011;
								fp_op_group = 2'd2;
								check_fprm = 1'b0;
								if (instr_rdata_i[14]) begin
									reg_fp_a_o = 1'b0;
									fpu_op_mod = 1'b0;
								end
								else begin
									reg_fp_d_o = 1'b0;
									fpu_op_mod = 1'b1;
								end
							end
							else if (instr_rdata_i[24:20] == 5'b00001) begin
								reg_fp_d_o = 1'b0;
								fpu_op = sv2v_cast_FEEA0(9);
								fp_rnd_mode_o = 3'b000;
								fp_op_group = 2'd2;
								check_fprm = 1'b0;
								if (instr_rdata_i[14])
									illegal_insn_o = 1'b1;
							end
							else if ((instr_rdata_i[24:20] | 5'b00001) == 5'b00011) begin
								fp_op_group = 2'd3;
								fpu_op_mod = instr_rdata_i[14];
								(* full_case, parallel_case *)
								case (instr_rdata_i[13:12])
									2'b00: fpu_int_fmt_o = sv2v_cast_4EB16(2);
									2'b01, 2'b10: fpu_int_fmt_o = sv2v_cast_4EB16(1);
									2'b11: fpu_int_fmt_o = sv2v_cast_4EB16(0);
								endcase
								if (instr_rdata_i[20]) begin
									reg_fp_a_o = 1'b0;
									fpu_op = sv2v_cast_FEEA0(12);
								end
								else begin
									reg_fp_d_o = 1'b0;
									fpu_op = sv2v_cast_FEEA0(11);
								end
							end
							else if ((instr_rdata_i[24:20] | 5'b00011) == 5'b00111) begin
								fpu_op = sv2v_cast_FEEA0(10);
								fp_op_group = 2'd3;
								(* full_case, parallel_case *)
								case (instr_rdata_i[21:20])
									2'b00: begin
										fpu_src_fmt_o = sv2v_cast_8141C('d0);
										if (~cv32e40p_pkg_C_RVF)
											illegal_insn_o = 1'b1;
									end
									2'b01: begin
										fpu_src_fmt_o = sv2v_cast_8141C('d4);
										if (~cv32e40p_pkg_C_XF16ALT)
											illegal_insn_o = 1'b1;
									end
									2'b10: begin
										fpu_src_fmt_o = sv2v_cast_8141C('d2);
										if (~cv32e40p_pkg_C_XF16)
											illegal_insn_o = 1'b1;
									end
									2'b11: begin
										fpu_src_fmt_o = sv2v_cast_8141C('d3);
										if (~cv32e40p_pkg_C_XF8)
											illegal_insn_o = 1'b1;
									end
								endcase
								if (instr_rdata_i[14])
									illegal_insn_o = 1'b1;
							end
							else
								illegal_insn_o = 1'b1;
						end
						else if (instr_rdata_i[29:25] == 5'b01101) begin
							fpu_op = sv2v_cast_FEEA0(6);
							fp_rnd_mode_o = 3'b000;
							fp_op_group = 2'd2;
							check_fprm = 1'b0;
						end
						else if (instr_rdata_i[29:25] == 5'b01110) begin
							fpu_op = sv2v_cast_FEEA0(6);
							fp_rnd_mode_o = 3'b001;
							fp_op_group = 2'd2;
							check_fprm = 1'b0;
						end
						else if (instr_rdata_i[29:25] == 5'b01111) begin
							fpu_op = sv2v_cast_FEEA0(6);
							fp_rnd_mode_o = 3'b010;
							fp_op_group = 2'd2;
							check_fprm = 1'b0;
						end
						else if (instr_rdata_i[29:25] == 5'b10000) begin
							reg_fp_d_o = 1'b0;
							fpu_op = sv2v_cast_FEEA0(8);
							fp_rnd_mode_o = 3'b010;
							fp_op_group = 2'd2;
							check_fprm = 1'b0;
						end
						else if (instr_rdata_i[29:25] == 5'b10001) begin
							reg_fp_d_o = 1'b0;
							fpu_op = sv2v_cast_FEEA0(8);
							fpu_op_mod = 1'b1;
							fp_rnd_mode_o = 3'b010;
							fp_op_group = 2'd2;
							check_fprm = 1'b0;
						end
						else if (instr_rdata_i[29:25] == 5'b10010) begin
							reg_fp_d_o = 1'b0;
							fpu_op = sv2v_cast_FEEA0(8);
							fp_rnd_mode_o = 3'b001;
							fp_op_group = 2'd2;
							check_fprm = 1'b0;
						end
						else if (instr_rdata_i[29:25] == 5'b10011) begin
							reg_fp_d_o = 1'b0;
							fpu_op = sv2v_cast_FEEA0(8);
							fpu_op_mod = 1'b1;
							fp_rnd_mode_o = 3'b001;
							fp_op_group = 2'd2;
							check_fprm = 1'b0;
						end
						else if (instr_rdata_i[29:25] == 5'b10100) begin
							reg_fp_d_o = 1'b0;
							fpu_op = sv2v_cast_FEEA0(8);
							fp_rnd_mode_o = 3'b000;
							fp_op_group = 2'd2;
							check_fprm = 1'b0;
						end
						else if (instr_rdata_i[29:25] == 5'b10101) begin
							reg_fp_d_o = 1'b0;
							fpu_op = sv2v_cast_FEEA0(8);
							fpu_op_mod = 1'b1;
							fp_rnd_mode_o = 3'b000;
							fp_op_group = 2'd2;
							check_fprm = 1'b0;
						end
						else if ((instr_rdata_i[29:25] | 5'b00011) == 5'b11011) begin
							fpu_op_mod = instr_rdata_i[14];
							fp_op_group = 2'd3;
							scalar_replication_o = 1'b0;
							if (instr_rdata_i[25])
								fpu_op = sv2v_cast_FEEA0(14);
							else
								fpu_op = sv2v_cast_FEEA0(13);
							if (instr_rdata_i[26]) begin
								fpu_src_fmt_o = sv2v_cast_8141C('d1);
								if (~cv32e40p_pkg_C_RVD)
									illegal_insn_o = 1'b1;
							end
							else begin
								fpu_src_fmt_o = sv2v_cast_8141C('d0);
								if (~cv32e40p_pkg_C_RVF)
									illegal_insn_o = 1'b1;
							end
							if (fpu_op == sv2v_cast_FEEA0(14)) begin
								if (~cv32e40p_pkg_C_XF8 || ~cv32e40p_pkg_C_RVD)
									illegal_insn_o = 1'b1;
							end
							else if (instr_rdata_i[14]) begin
								if (fpu_dst_fmt_o == sv2v_cast_8141C('d0))
									illegal_insn_o = 1'b1;
								if (~cv32e40p_pkg_C_RVD && (fpu_dst_fmt_o != sv2v_cast_8141C('d3)))
									illegal_insn_o = 1'b1;
							end
						end
						else
							illegal_insn_o = 1'b1;
						if ((~cv32e40p_pkg_C_RVF || ~cv32e40p_pkg_C_RVD) && (fpu_dst_fmt_o == sv2v_cast_8141C('d0)))
							illegal_insn_o = 1'b1;
						if ((~cv32e40p_pkg_C_XF16 || ~cv32e40p_pkg_C_RVF) && (fpu_dst_fmt_o == sv2v_cast_8141C('d2)))
							illegal_insn_o = 1'b1;
						if ((~cv32e40p_pkg_C_XF16ALT || ~cv32e40p_pkg_C_RVF) && (fpu_dst_fmt_o == sv2v_cast_8141C('d4)))
							illegal_insn_o = 1'b1;
						if ((~cv32e40p_pkg_C_XF8 || (~cv32e40p_pkg_C_XF16 && ~cv32e40p_pkg_C_XF16ALT)) && (fpu_dst_fmt_o == sv2v_cast_8141C('d3)))
							illegal_insn_o = 1'b1;
						if (check_fprm) begin
							(* full_case, parallel_case *)
							if ((3'b000 <= frm_i) && (3'b100 >= frm_i))
								;
							else
								illegal_insn_o = 1'b1;
						end
						case (fp_op_group)
							2'd0:
								(* full_case, parallel_case *)
								case (fpu_dst_fmt_o)
									sv2v_cast_8141C('d0): apu_lat_o = 1;
									sv2v_cast_8141C('d2): apu_lat_o = 1;
									sv2v_cast_8141C('d4): apu_lat_o = 1;
									sv2v_cast_8141C('d3): apu_lat_o = 1;
									default:
										;
								endcase
							2'd1: apu_lat_o = 2'h3;
							2'd2: apu_lat_o = 1;
							2'd3: apu_lat_o = 1;
						endcase
						apu_op_o = {fpu_vec_op, fpu_op_mod, fpu_op};
					end
					else
						illegal_insn_o = 1'b1;
				end
				else begin
					regfile_alu_we = 1'b1;
					rega_used_o = 1'b1;
					if (~instr_rdata_i[28])
						regb_used_o = 1'b1;
					(* full_case, parallel_case *)
					case ({instr_rdata_i[30:25], instr_rdata_i[14:12]})
						9'b000000000: alu_operator_o = cv32e40p_pkg_ALU_ADD;
						9'b100000000: alu_operator_o = cv32e40p_pkg_ALU_SUB;
						9'b000000010: alu_operator_o = cv32e40p_pkg_ALU_SLTS;
						9'b000000011: alu_operator_o = cv32e40p_pkg_ALU_SLTU;
						9'b000000100: alu_operator_o = cv32e40p_pkg_ALU_XOR;
						9'b000000110: alu_operator_o = cv32e40p_pkg_ALU_OR;
						9'b000000111: alu_operator_o = cv32e40p_pkg_ALU_AND;
						9'b000000001: alu_operator_o = cv32e40p_pkg_ALU_SLL;
						9'b000000101: alu_operator_o = cv32e40p_pkg_ALU_SRL;
						9'b100000101: alu_operator_o = cv32e40p_pkg_ALU_SRA;
						9'b000001000: begin
							alu_en = 1'b0;
							mult_int_en = 1'b1;
							mult_operator_o = cv32e40p_pkg_MUL_MAC32;
							regc_mux_o = cv32e40p_pkg_REGC_ZERO;
						end
						9'b000001001: begin
							alu_en = 1'b0;
							regc_used_o = 1'b1;
							regc_mux_o = cv32e40p_pkg_REGC_ZERO;
							mult_signed_mode_o = 2'b11;
							mult_int_en = 1'b1;
							mult_operator_o = cv32e40p_pkg_MUL_H;
						end
						9'b000001010: begin
							alu_en = 1'b0;
							regc_used_o = 1'b1;
							regc_mux_o = cv32e40p_pkg_REGC_ZERO;
							mult_signed_mode_o = 2'b01;
							mult_int_en = 1'b1;
							mult_operator_o = cv32e40p_pkg_MUL_H;
						end
						9'b000001011: begin
							alu_en = 1'b0;
							regc_used_o = 1'b1;
							regc_mux_o = cv32e40p_pkg_REGC_ZERO;
							mult_signed_mode_o = 2'b00;
							mult_int_en = 1'b1;
							mult_operator_o = cv32e40p_pkg_MUL_H;
						end
						9'b000001100: begin
							alu_op_a_mux_sel_o = cv32e40p_pkg_OP_A_REGB_OR_FWD;
							alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_REGC_OR_FWD;
							regc_mux_o = cv32e40p_pkg_REGC_S1;
							regc_used_o = 1'b1;
							regb_used_o = 1'b1;
							rega_used_o = 1'b0;
							alu_operator_o = cv32e40p_pkg_ALU_DIV;
						end
						9'b000001101: begin
							alu_op_a_mux_sel_o = cv32e40p_pkg_OP_A_REGB_OR_FWD;
							alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_REGC_OR_FWD;
							regc_mux_o = cv32e40p_pkg_REGC_S1;
							regc_used_o = 1'b1;
							regb_used_o = 1'b1;
							rega_used_o = 1'b0;
							alu_operator_o = cv32e40p_pkg_ALU_DIVU;
						end
						9'b000001110: begin
							alu_op_a_mux_sel_o = cv32e40p_pkg_OP_A_REGB_OR_FWD;
							alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_REGC_OR_FWD;
							regc_mux_o = cv32e40p_pkg_REGC_S1;
							regc_used_o = 1'b1;
							regb_used_o = 1'b1;
							rega_used_o = 1'b0;
							alu_operator_o = cv32e40p_pkg_ALU_REM;
						end
						9'b000001111: begin
							alu_op_a_mux_sel_o = cv32e40p_pkg_OP_A_REGB_OR_FWD;
							alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_REGC_OR_FWD;
							regc_mux_o = cv32e40p_pkg_REGC_S1;
							regc_used_o = 1'b1;
							regb_used_o = 1'b1;
							rega_used_o = 1'b0;
							alu_operator_o = cv32e40p_pkg_ALU_REMU;
						end
						9'b100001000:
							if (PULP_XPULP) begin
								alu_en = 1'b0;
								regc_used_o = 1'b1;
								regc_mux_o = cv32e40p_pkg_REGC_RD;
								mult_int_en = 1'b1;
								mult_operator_o = cv32e40p_pkg_MUL_MAC32;
							end
							else
								illegal_insn_o = 1'b1;
						9'b100001001:
							if (PULP_XPULP) begin
								alu_en = 1'b0;
								regc_used_o = 1'b1;
								regc_mux_o = cv32e40p_pkg_REGC_RD;
								mult_int_en = 1'b1;
								mult_operator_o = cv32e40p_pkg_MUL_MSU32;
							end
							else
								illegal_insn_o = 1'b1;
						9'b000010010:
							if (PULP_XPULP)
								alu_operator_o = cv32e40p_pkg_ALU_SLETS;
							else
								illegal_insn_o = 1'b1;
						9'b000010011:
							if (PULP_XPULP)
								alu_operator_o = cv32e40p_pkg_ALU_SLETU;
							else
								illegal_insn_o = 1'b1;
						9'b000010100:
							if (PULP_XPULP)
								alu_operator_o = cv32e40p_pkg_ALU_MIN;
							else
								illegal_insn_o = 1'b1;
						9'b000010101:
							if (PULP_XPULP)
								alu_operator_o = cv32e40p_pkg_ALU_MINU;
							else
								illegal_insn_o = 1'b1;
						9'b000010110:
							if (PULP_XPULP)
								alu_operator_o = cv32e40p_pkg_ALU_MAX;
							else
								illegal_insn_o = 1'b1;
						9'b000010111:
							if (PULP_XPULP)
								alu_operator_o = cv32e40p_pkg_ALU_MAXU;
							else
								illegal_insn_o = 1'b1;
						9'b000100101:
							if (PULP_XPULP)
								alu_operator_o = cv32e40p_pkg_ALU_ROR;
							else
								illegal_insn_o = 1'b1;
						9'b001000000:
							if (PULP_XPULP)
								alu_operator_o = cv32e40p_pkg_ALU_FF1;
							else
								illegal_insn_o = 1'b1;
						9'b001000001:
							if (PULP_XPULP)
								alu_operator_o = cv32e40p_pkg_ALU_FL1;
							else
								illegal_insn_o = 1'b1;
						9'b001000010:
							if (PULP_XPULP)
								alu_operator_o = cv32e40p_pkg_ALU_CLB;
							else
								illegal_insn_o = 1'b1;
						9'b001000011:
							if (PULP_XPULP)
								alu_operator_o = cv32e40p_pkg_ALU_CNT;
							else
								illegal_insn_o = 1'b1;
						9'b001000100:
							if (PULP_XPULP) begin
								alu_operator_o = cv32e40p_pkg_ALU_EXTS;
								alu_vec_mode_o = cv32e40p_pkg_VEC_MODE16;
							end
							else
								illegal_insn_o = 1'b1;
						9'b001000101:
							if (PULP_XPULP) begin
								alu_operator_o = cv32e40p_pkg_ALU_EXT;
								alu_vec_mode_o = cv32e40p_pkg_VEC_MODE16;
							end
							else
								illegal_insn_o = 1'b1;
						9'b001000110:
							if (PULP_XPULP) begin
								alu_operator_o = cv32e40p_pkg_ALU_EXTS;
								alu_vec_mode_o = cv32e40p_pkg_VEC_MODE8;
							end
							else
								illegal_insn_o = 1'b1;
						9'b001000111:
							if (PULP_XPULP) begin
								alu_operator_o = cv32e40p_pkg_ALU_EXT;
								alu_vec_mode_o = cv32e40p_pkg_VEC_MODE8;
							end
							else
								illegal_insn_o = 1'b1;
						9'b000010000:
							if (PULP_XPULP)
								alu_operator_o = cv32e40p_pkg_ALU_ABS;
							else
								illegal_insn_o = 1'b1;
						9'b001010001:
							if (PULP_XPULP) begin
								alu_operator_o = cv32e40p_pkg_ALU_CLIP;
								alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_IMM;
								imm_b_mux_sel_o = cv32e40p_pkg_IMMB_CLIP;
							end
							else
								illegal_insn_o = 1'b1;
						9'b001010010:
							if (PULP_XPULP) begin
								alu_operator_o = cv32e40p_pkg_ALU_CLIPU;
								alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_IMM;
								imm_b_mux_sel_o = cv32e40p_pkg_IMMB_CLIP;
							end
							else
								illegal_insn_o = 1'b1;
						9'b001010101:
							if (PULP_XPULP) begin
								alu_operator_o = cv32e40p_pkg_ALU_CLIP;
								regb_used_o = 1'b1;
							end
							else
								illegal_insn_o = 1'b1;
						9'b001010110:
							if (PULP_XPULP) begin
								alu_operator_o = cv32e40p_pkg_ALU_CLIPU;
								regb_used_o = 1'b1;
							end
							else
								illegal_insn_o = 1'b1;
						default: illegal_insn_o = 1'b1;
					endcase
				end
			cv32e40p_pkg_OPCODE_OP_FP:
				if (FPU == 1) begin
					apu_en = 1'b1;
					alu_en = 1'b0;
					rega_used_o = 1'b1;
					regb_used_o = 1'b1;
					reg_fp_a_o = 1'b1;
					reg_fp_b_o = 1'b1;
					reg_fp_d_o = 1'b1;
					check_fprm = 1'b1;
					fp_rnd_mode_o = instr_rdata_i[14:12];
					(* full_case, parallel_case *)
					case (instr_rdata_i[26:25])
						2'b00: fpu_dst_fmt_o = sv2v_cast_8141C('d0);
						2'b01: fpu_dst_fmt_o = sv2v_cast_8141C('d1);
						2'b10:
							if (instr_rdata_i[14:12] == 3'b101)
								fpu_dst_fmt_o = sv2v_cast_8141C('d4);
							else
								fpu_dst_fmt_o = sv2v_cast_8141C('d2);
						2'b11: fpu_dst_fmt_o = sv2v_cast_8141C('d3);
					endcase
					fpu_src_fmt_o = fpu_dst_fmt_o;
					(* full_case, parallel_case *)
					case (instr_rdata_i[31:27])
						5'b00000: begin
							fpu_op = sv2v_cast_FEEA0(2);
							fp_op_group = 2'd0;
							apu_op_o = 2'b00;
							apu_lat_o = 2'h2;
							alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_REGA_OR_FWD;
							alu_op_c_mux_sel_o = cv32e40p_pkg_OP_C_REGB_OR_FWD;
						end
						5'b00001: begin
							fpu_op = sv2v_cast_FEEA0(2);
							fpu_op_mod = 1'b1;
							fp_op_group = 2'd0;
							apu_op_o = 2'b01;
							apu_lat_o = 2'h2;
							alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_REGA_OR_FWD;
							alu_op_c_mux_sel_o = cv32e40p_pkg_OP_C_REGB_OR_FWD;
						end
						5'b00010: begin
							fpu_op = sv2v_cast_FEEA0(3);
							fp_op_group = 2'd0;
							apu_lat_o = 2'h2;
						end
						5'b00011: begin
							fpu_op = sv2v_cast_FEEA0(4);
							fp_op_group = 2'd1;
							apu_lat_o = 2'h3;
						end
						5'b01011: begin
							regb_used_o = 1'b0;
							fpu_op = sv2v_cast_FEEA0(5);
							fp_op_group = 2'd1;
							apu_op_o = 1'b1;
							apu_lat_o = 2'h3;
							if (instr_rdata_i[24:20] != 5'b00000)
								illegal_insn_o = 1'b1;
						end
						5'b00100: begin
							fpu_op = sv2v_cast_FEEA0(6);
							fp_op_group = 2'd2;
							check_fprm = 1'b0;
							if (cv32e40p_pkg_C_XF16ALT) begin
								if (!(|{(3'b000 <= instr_rdata_i[14:12]) && (3'b010 >= instr_rdata_i[14:12]), (3'b100 <= instr_rdata_i[14:12]) && (3'b110 >= instr_rdata_i[14:12])}))
									illegal_insn_o = 1'b1;
								if (instr_rdata_i[14]) begin
									fpu_dst_fmt_o = sv2v_cast_8141C('d4);
									fpu_src_fmt_o = sv2v_cast_8141C('d4);
								end
								else
									fp_rnd_mode_o = {1'b0, instr_rdata_i[13:12]};
							end
							else if (!((3'b000 <= instr_rdata_i[14:12]) && (3'b010 >= instr_rdata_i[14:12])))
								illegal_insn_o = 1'b1;
						end
						5'b00101: begin
							fpu_op = sv2v_cast_FEEA0(7);
							fp_op_group = 2'd2;
							check_fprm = 1'b0;
							if (cv32e40p_pkg_C_XF16ALT) begin
								if (!(|{(3'b000 <= instr_rdata_i[14:12]) && (3'b001 >= instr_rdata_i[14:12]), (3'b100 <= instr_rdata_i[14:12]) && (3'b101 >= instr_rdata_i[14:12])}))
									illegal_insn_o = 1'b1;
								if (instr_rdata_i[14]) begin
									fpu_dst_fmt_o = sv2v_cast_8141C('d4);
									fpu_src_fmt_o = sv2v_cast_8141C('d4);
								end
								else
									fp_rnd_mode_o = {1'b0, instr_rdata_i[13:12]};
							end
							else if (!((3'b000 <= instr_rdata_i[14:12]) && (3'b001 >= instr_rdata_i[14:12])))
								illegal_insn_o = 1'b1;
						end
						5'b01000: begin
							regb_used_o = 1'b0;
							fpu_op = sv2v_cast_FEEA0(10);
							fp_op_group = 2'd3;
							if (instr_rdata_i[24:23])
								illegal_insn_o = 1'b1;
							(* full_case, parallel_case *)
							case (instr_rdata_i[22:20])
								3'b000: begin
									if (~cv32e40p_pkg_C_RVF)
										illegal_insn_o = 1'b1;
									fpu_src_fmt_o = sv2v_cast_8141C('d0);
								end
								3'b001: begin
									if (~cv32e40p_pkg_C_RVD)
										illegal_insn_o = 1'b1;
									fpu_src_fmt_o = sv2v_cast_8141C('d1);
								end
								3'b010: begin
									if (~cv32e40p_pkg_C_XF16)
										illegal_insn_o = 1'b1;
									fpu_src_fmt_o = sv2v_cast_8141C('d2);
								end
								3'b110: begin
									if (~cv32e40p_pkg_C_XF16ALT)
										illegal_insn_o = 1'b1;
									fpu_src_fmt_o = sv2v_cast_8141C('d4);
								end
								3'b011: begin
									if (~cv32e40p_pkg_C_XF8)
										illegal_insn_o = 1'b1;
									fpu_src_fmt_o = sv2v_cast_8141C('d3);
								end
								default: illegal_insn_o = 1'b1;
							endcase
						end
						5'b01001: begin
							fpu_op = sv2v_cast_FEEA0(3);
							fp_op_group = 2'd0;
							apu_lat_o = 2'h2;
							fpu_dst_fmt_o = sv2v_cast_8141C('d0);
						end
						5'b01010: begin
							regc_used_o = 1'b1;
							regc_mux_o = cv32e40p_pkg_REGC_RD;
							reg_fp_c_o = 1'b1;
							fpu_op = sv2v_cast_FEEA0(0);
							fp_op_group = 2'd0;
							apu_lat_o = 2'h2;
							fpu_dst_fmt_o = sv2v_cast_8141C('d0);
						end
						5'b10100: begin
							fpu_op = sv2v_cast_FEEA0(8);
							fp_op_group = 2'd2;
							reg_fp_d_o = 1'b0;
							check_fprm = 1'b0;
							if (cv32e40p_pkg_C_XF16ALT) begin
								if (!(|{(3'b000 <= instr_rdata_i[14:12]) && (3'b010 >= instr_rdata_i[14:12]), (3'b100 <= instr_rdata_i[14:12]) && (3'b110 >= instr_rdata_i[14:12])}))
									illegal_insn_o = 1'b1;
								if (instr_rdata_i[14]) begin
									fpu_dst_fmt_o = sv2v_cast_8141C('d4);
									fpu_src_fmt_o = sv2v_cast_8141C('d4);
								end
								else
									fp_rnd_mode_o = {1'b0, instr_rdata_i[13:12]};
							end
							else if (!((3'b000 <= instr_rdata_i[14:12]) && (3'b010 >= instr_rdata_i[14:12])))
								illegal_insn_o = 1'b1;
						end
						5'b11000: begin
							regb_used_o = 1'b0;
							reg_fp_d_o = 1'b0;
							fpu_op = sv2v_cast_FEEA0(11);
							fp_op_group = 2'd3;
							fpu_op_mod = instr_rdata_i[20];
							apu_op_o = 2'b01;
							apu_lat_o = 2'h2;
							(* full_case, parallel_case *)
							case (instr_rdata_i[26:25])
								2'b00:
									if (~cv32e40p_pkg_C_RVF)
										illegal_insn_o = 1;
									else
										fpu_src_fmt_o = sv2v_cast_8141C('d0);
								2'b01:
									if (~cv32e40p_pkg_C_RVD)
										illegal_insn_o = 1;
									else
										fpu_src_fmt_o = sv2v_cast_8141C('d1);
								2'b10:
									if (instr_rdata_i[14:12] == 3'b101) begin
										if (~cv32e40p_pkg_C_XF16ALT)
											illegal_insn_o = 1;
										else
											fpu_src_fmt_o = sv2v_cast_8141C('d4);
									end
									else if (~cv32e40p_pkg_C_XF16)
										illegal_insn_o = 1;
									else
										fpu_src_fmt_o = sv2v_cast_8141C('d2);
								2'b11:
									if (~cv32e40p_pkg_C_XF8)
										illegal_insn_o = 1;
									else
										fpu_src_fmt_o = sv2v_cast_8141C('d3);
							endcase
							if (instr_rdata_i[24:21])
								illegal_insn_o = 1'b1;
						end
						5'b11010: begin
							regb_used_o = 1'b0;
							reg_fp_a_o = 1'b0;
							fpu_op = sv2v_cast_FEEA0(12);
							fp_op_group = 2'd3;
							fpu_op_mod = instr_rdata_i[20];
							apu_op_o = 2'b00;
							apu_lat_o = 2'h2;
							if (instr_rdata_i[24:21])
								illegal_insn_o = 1'b1;
						end
						5'b11100: begin
							regb_used_o = 1'b0;
							reg_fp_d_o = 1'b0;
							fp_op_group = 2'd2;
							check_fprm = 1'b0;
							if ((instr_rdata_i[14:12] == 3'b000) || 1'd0) begin
								alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_REGA_OR_FWD;
								fpu_op = sv2v_cast_FEEA0(6);
								fpu_op_mod = 1'b1;
								fp_rnd_mode_o = 3'b011;
								if (instr_rdata_i[14]) begin
									fpu_dst_fmt_o = sv2v_cast_8141C('d4);
									fpu_src_fmt_o = sv2v_cast_8141C('d4);
								end
							end
							else if ((instr_rdata_i[14:12] == 3'b001) || 1'd0) begin
								fpu_op = sv2v_cast_FEEA0(9);
								fp_rnd_mode_o = 3'b000;
								if (instr_rdata_i[14]) begin
									fpu_dst_fmt_o = sv2v_cast_8141C('d4);
									fpu_src_fmt_o = sv2v_cast_8141C('d4);
								end
							end
							else
								illegal_insn_o = 1'b1;
							if (instr_rdata_i[24:20])
								illegal_insn_o = 1'b1;
						end
						5'b11110: begin
							regb_used_o = 1'b0;
							reg_fp_a_o = 1'b0;
							alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_REGA_OR_FWD;
							fpu_op = sv2v_cast_FEEA0(6);
							fpu_op_mod = 1'b0;
							fp_op_group = 2'd2;
							fp_rnd_mode_o = 3'b011;
							check_fprm = 1'b0;
							if ((instr_rdata_i[14:12] == 3'b000) || 1'd0) begin
								if (instr_rdata_i[14]) begin
									fpu_dst_fmt_o = sv2v_cast_8141C('d4);
									fpu_src_fmt_o = sv2v_cast_8141C('d4);
								end
							end
							else
								illegal_insn_o = 1'b1;
							if (instr_rdata_i[24:20] != 5'b00000)
								illegal_insn_o = 1'b1;
						end
						default: illegal_insn_o = 1'b1;
					endcase
					if (~cv32e40p_pkg_C_RVF && (fpu_dst_fmt_o == sv2v_cast_8141C('d0)))
						illegal_insn_o = 1'b1;
					if (~cv32e40p_pkg_C_RVD && (fpu_dst_fmt_o == sv2v_cast_8141C('d1)))
						illegal_insn_o = 1'b1;
					if (~cv32e40p_pkg_C_XF16 && (fpu_dst_fmt_o == sv2v_cast_8141C('d2)))
						illegal_insn_o = 1'b1;
					if (~cv32e40p_pkg_C_XF16ALT && (fpu_dst_fmt_o == sv2v_cast_8141C('d4)))
						illegal_insn_o = 1'b1;
					if (~cv32e40p_pkg_C_XF8 && (fpu_dst_fmt_o == sv2v_cast_8141C('d3)))
						illegal_insn_o = 1'b1;
					if (check_fprm) begin
						(* full_case, parallel_case *)
						if ((3'b000 <= instr_rdata_i[14:12]) && (3'b100 >= instr_rdata_i[14:12]))
							;
						else if (instr_rdata_i[14:12] == 3'b101) begin
							if (~cv32e40p_pkg_C_XF16ALT || (fpu_dst_fmt_o != sv2v_cast_8141C('d4)))
								illegal_insn_o = 1'b1;
							(* full_case, parallel_case *)
							if ((3'b000 <= frm_i) && (3'b100 >= frm_i))
								fp_rnd_mode_o = frm_i;
							else
								illegal_insn_o = 1'b1;
						end
						else if (instr_rdata_i[14:12] == 3'b111) begin
							(* full_case, parallel_case *)
							if ((3'b000 <= frm_i) && (3'b100 >= frm_i))
								fp_rnd_mode_o = frm_i;
							else
								illegal_insn_o = 1'b1;
						end
						else
							illegal_insn_o = 1'b1;
					end
					case (fp_op_group)
						2'd0:
							(* full_case, parallel_case *)
							case (fpu_dst_fmt_o)
								sv2v_cast_8141C('d0): apu_lat_o = 1;
								sv2v_cast_8141C('d1): apu_lat_o = 1;
								sv2v_cast_8141C('d2): apu_lat_o = 1;
								sv2v_cast_8141C('d4): apu_lat_o = 1;
								sv2v_cast_8141C('d3): apu_lat_o = 1;
								default:
									;
							endcase
						2'd1: apu_lat_o = 2'h3;
						2'd2: apu_lat_o = 1;
						2'd3: apu_lat_o = 1;
					endcase
					apu_op_o = {fpu_vec_op, fpu_op_mod, fpu_op};
				end
				else
					illegal_insn_o = 1'b1;
			cv32e40p_pkg_OPCODE_OP_FMADD, cv32e40p_pkg_OPCODE_OP_FMSUB, cv32e40p_pkg_OPCODE_OP_FNMSUB, cv32e40p_pkg_OPCODE_OP_FNMADD:
				if (FPU == 1) begin
					apu_en = 1'b1;
					alu_en = 1'b0;
					apu_lat_o = 2'h3;
					rega_used_o = 1'b1;
					regb_used_o = 1'b1;
					regc_used_o = 1'b1;
					regc_mux_o = cv32e40p_pkg_REGC_S4;
					reg_fp_a_o = 1'b1;
					reg_fp_b_o = 1'b1;
					reg_fp_c_o = 1'b1;
					reg_fp_d_o = 1'b1;
					fp_rnd_mode_o = instr_rdata_i[14:12];
					(* full_case, parallel_case *)
					case (instr_rdata_i[26:25])
						2'b00: fpu_dst_fmt_o = sv2v_cast_8141C('d0);
						2'b01: fpu_dst_fmt_o = sv2v_cast_8141C('d1);
						2'b10:
							if (instr_rdata_i[14:12] == 3'b101)
								fpu_dst_fmt_o = sv2v_cast_8141C('d4);
							else
								fpu_dst_fmt_o = sv2v_cast_8141C('d2);
						2'b11: fpu_dst_fmt_o = sv2v_cast_8141C('d3);
					endcase
					fpu_src_fmt_o = fpu_dst_fmt_o;
					(* full_case, parallel_case *)
					case (instr_rdata_i[6:0])
						cv32e40p_pkg_OPCODE_OP_FMADD: begin
							fpu_op = sv2v_cast_FEEA0(0);
							apu_op_o = 2'b00;
						end
						cv32e40p_pkg_OPCODE_OP_FMSUB: begin
							fpu_op = sv2v_cast_FEEA0(0);
							fpu_op_mod = 1'b1;
							apu_op_o = 2'b01;
						end
						cv32e40p_pkg_OPCODE_OP_FNMSUB: begin
							fpu_op = sv2v_cast_FEEA0(1);
							apu_op_o = 2'b10;
						end
						cv32e40p_pkg_OPCODE_OP_FNMADD: begin
							fpu_op = sv2v_cast_FEEA0(1);
							fpu_op_mod = 1'b1;
							apu_op_o = 2'b11;
						end
					endcase
					if (~cv32e40p_pkg_C_RVF && (fpu_dst_fmt_o == sv2v_cast_8141C('d0)))
						illegal_insn_o = 1'b1;
					if (~cv32e40p_pkg_C_RVD && (fpu_dst_fmt_o == sv2v_cast_8141C('d1)))
						illegal_insn_o = 1'b1;
					if (~cv32e40p_pkg_C_XF16 && (fpu_dst_fmt_o == sv2v_cast_8141C('d2)))
						illegal_insn_o = 1'b1;
					if (~cv32e40p_pkg_C_XF16ALT && (fpu_dst_fmt_o == sv2v_cast_8141C('d4)))
						illegal_insn_o = 1'b1;
					if (~cv32e40p_pkg_C_XF8 && (fpu_dst_fmt_o == sv2v_cast_8141C('d3)))
						illegal_insn_o = 1'b1;
					(* full_case, parallel_case *)
					if ((3'b000 <= instr_rdata_i[14:12]) && (3'b100 >= instr_rdata_i[14:12]))
						;
					else if (instr_rdata_i[14:12] == 3'b101) begin
						if (~cv32e40p_pkg_C_XF16ALT || (fpu_dst_fmt_o != sv2v_cast_8141C('d4)))
							illegal_insn_o = 1'b1;
						(* full_case, parallel_case *)
						if ((3'b000 <= frm_i) && (3'b100 >= frm_i))
							fp_rnd_mode_o = frm_i;
						else
							illegal_insn_o = 1'b1;
					end
					else if (instr_rdata_i[14:12] == 3'b111) begin
						(* full_case, parallel_case *)
						if ((3'b000 <= frm_i) && (3'b100 >= frm_i))
							fp_rnd_mode_o = frm_i;
						else
							illegal_insn_o = 1'b1;
					end
					else
						illegal_insn_o = 1'b1;
					(* full_case, parallel_case *)
					case (fpu_dst_fmt_o)
						sv2v_cast_8141C('d0): apu_lat_o = 1;
						sv2v_cast_8141C('d1): apu_lat_o = 1;
						sv2v_cast_8141C('d2): apu_lat_o = 1;
						sv2v_cast_8141C('d4): apu_lat_o = 1;
						sv2v_cast_8141C('d3): apu_lat_o = 1;
						default:
							;
					endcase
					apu_op_o = {fpu_vec_op, fpu_op_mod, fpu_op};
				end
				else
					illegal_insn_o = 1'b1;
			cv32e40p_pkg_OPCODE_STORE_FP:
				if (FPU == 1) begin
					data_req = 1'b1;
					data_we_o = 1'b1;
					rega_used_o = 1'b1;
					regb_used_o = 1'b1;
					alu_operator_o = cv32e40p_pkg_ALU_ADD;
					reg_fp_b_o = 1'b1;
					imm_b_mux_sel_o = cv32e40p_pkg_IMMB_S;
					alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_IMM;
					alu_op_c_mux_sel_o = cv32e40p_pkg_OP_C_REGB_OR_FWD;
					(* full_case, parallel_case *)
					case (instr_rdata_i[14:12])
						3'b000:
							if (cv32e40p_pkg_C_XF8)
								data_type_o = 2'b10;
							else
								illegal_insn_o = 1'b1;
						3'b001:
							if (cv32e40p_pkg_C_XF16 | cv32e40p_pkg_C_XF16ALT)
								data_type_o = 2'b01;
							else
								illegal_insn_o = 1'b1;
						3'b010:
							if (cv32e40p_pkg_C_RVF)
								data_type_o = 2'b00;
							else
								illegal_insn_o = 1'b1;
						3'b011:
							if (cv32e40p_pkg_C_RVD)
								data_type_o = 2'b00;
							else
								illegal_insn_o = 1'b1;
						default: illegal_insn_o = 1'b1;
					endcase
					if (illegal_insn_o) begin
						data_req = 1'b0;
						data_we_o = 1'b0;
					end
				end
				else
					illegal_insn_o = 1'b1;
			cv32e40p_pkg_OPCODE_LOAD_FP:
				if (FPU == 1) begin
					data_req = 1'b1;
					regfile_mem_we = 1'b1;
					reg_fp_d_o = 1'b1;
					rega_used_o = 1'b1;
					alu_operator_o = cv32e40p_pkg_ALU_ADD;
					imm_b_mux_sel_o = cv32e40p_pkg_IMMB_I;
					alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_IMM;
					data_sign_extension_o = 2'b10;
					(* full_case, parallel_case *)
					case (instr_rdata_i[14:12])
						3'b000:
							if (cv32e40p_pkg_C_XF8)
								data_type_o = 2'b10;
							else
								illegal_insn_o = 1'b1;
						3'b001:
							if (cv32e40p_pkg_C_XF16 | cv32e40p_pkg_C_XF16ALT)
								data_type_o = 2'b01;
							else
								illegal_insn_o = 1'b1;
						3'b010:
							if (cv32e40p_pkg_C_RVF)
								data_type_o = 2'b00;
							else
								illegal_insn_o = 1'b1;
						3'b011:
							if (cv32e40p_pkg_C_RVD)
								data_type_o = 2'b00;
							else
								illegal_insn_o = 1'b1;
						default: illegal_insn_o = 1'b1;
					endcase
				end
				else
					illegal_insn_o = 1'b1;
			cv32e40p_pkg_OPCODE_PULP_OP:
				if (PULP_XPULP) begin
					regfile_alu_we = 1'b1;
					rega_used_o = 1'b1;
					regb_used_o = 1'b1;
					case (instr_rdata_i[13:12])
						2'b00: begin
							alu_en = 1'b0;
							mult_sel_subword_o = instr_rdata_i[30];
							mult_signed_mode_o = {2 {instr_rdata_i[31]}};
							mult_imm_mux_o = cv32e40p_pkg_MIMM_S3;
							regc_mux_o = cv32e40p_pkg_REGC_ZERO;
							mult_int_en = 1'b1;
							if (instr_rdata_i[14])
								mult_operator_o = cv32e40p_pkg_MUL_IR;
							else
								mult_operator_o = cv32e40p_pkg_MUL_I;
						end
						2'b01: begin
							alu_en = 1'b0;
							mult_sel_subword_o = instr_rdata_i[30];
							mult_signed_mode_o = {2 {instr_rdata_i[31]}};
							regc_used_o = 1'b1;
							regc_mux_o = cv32e40p_pkg_REGC_RD;
							mult_imm_mux_o = cv32e40p_pkg_MIMM_S3;
							mult_int_en = 1'b1;
							if (instr_rdata_i[14])
								mult_operator_o = cv32e40p_pkg_MUL_IR;
							else
								mult_operator_o = cv32e40p_pkg_MUL_I;
						end
						2'b10: begin
							case ({instr_rdata_i[31], instr_rdata_i[14]})
								2'b00: alu_operator_o = cv32e40p_pkg_ALU_ADD;
								2'b01: alu_operator_o = cv32e40p_pkg_ALU_ADDR;
								2'b10: alu_operator_o = cv32e40p_pkg_ALU_ADDU;
								2'b11: alu_operator_o = cv32e40p_pkg_ALU_ADDUR;
							endcase
							bmask_a_mux_o = cv32e40p_pkg_BMASK_A_ZERO;
							bmask_b_mux_o = cv32e40p_pkg_BMASK_B_S3;
							if (instr_rdata_i[30]) begin
								regc_used_o = 1'b1;
								regc_mux_o = cv32e40p_pkg_REGC_RD;
								alu_bmask_b_mux_sel_o = cv32e40p_pkg_BMASK_B_REG;
								alu_op_a_mux_sel_o = cv32e40p_pkg_OP_A_REGC_OR_FWD;
								alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_REGA_OR_FWD;
							end
						end
						2'b11: begin
							case ({instr_rdata_i[31], instr_rdata_i[14]})
								2'b00: alu_operator_o = cv32e40p_pkg_ALU_SUB;
								2'b01: alu_operator_o = cv32e40p_pkg_ALU_SUBR;
								2'b10: alu_operator_o = cv32e40p_pkg_ALU_SUBU;
								2'b11: alu_operator_o = cv32e40p_pkg_ALU_SUBUR;
							endcase
							bmask_a_mux_o = cv32e40p_pkg_BMASK_A_ZERO;
							bmask_b_mux_o = cv32e40p_pkg_BMASK_B_S3;
							if (instr_rdata_i[30]) begin
								regc_used_o = 1'b1;
								regc_mux_o = cv32e40p_pkg_REGC_RD;
								alu_bmask_b_mux_sel_o = cv32e40p_pkg_BMASK_B_REG;
								alu_op_a_mux_sel_o = cv32e40p_pkg_OP_A_REGC_OR_FWD;
								alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_REGA_OR_FWD;
							end
						end
					endcase
				end
				else
					illegal_insn_o = 1'b1;
			cv32e40p_pkg_OPCODE_VECOP:
				if (PULP_XPULP) begin
					regfile_alu_we = 1'b1;
					rega_used_o = 1'b1;
					imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VS;
					if (instr_rdata_i[12]) begin
						alu_vec_mode_o = cv32e40p_pkg_VEC_MODE8;
						mult_operator_o = cv32e40p_pkg_MUL_DOT8;
					end
					else begin
						alu_vec_mode_o = cv32e40p_pkg_VEC_MODE16;
						mult_operator_o = cv32e40p_pkg_MUL_DOT16;
					end
					if (instr_rdata_i[14]) begin
						scalar_replication_o = 1'b1;
						if (instr_rdata_i[13])
							alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_IMM;
						else
							regb_used_o = 1'b1;
					end
					else
						regb_used_o = 1'b1;
					(* full_case, parallel_case *)
					case (instr_rdata_i[31:26])
						6'b000000: begin
							alu_operator_o = cv32e40p_pkg_ALU_ADD;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VS;
						end
						6'b000010: begin
							alu_operator_o = cv32e40p_pkg_ALU_SUB;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VS;
						end
						6'b000100: begin
							alu_operator_o = cv32e40p_pkg_ALU_ADD;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VS;
							bmask_b_mux_o = cv32e40p_pkg_BMASK_B_ONE;
						end
						6'b000110: begin
							alu_operator_o = cv32e40p_pkg_ALU_ADDU;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VU;
							bmask_b_mux_o = cv32e40p_pkg_BMASK_B_ONE;
						end
						6'b001000: begin
							alu_operator_o = cv32e40p_pkg_ALU_MIN;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VS;
						end
						6'b001010: begin
							alu_operator_o = cv32e40p_pkg_ALU_MINU;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VU;
						end
						6'b001100: begin
							alu_operator_o = cv32e40p_pkg_ALU_MAX;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VS;
						end
						6'b001110: begin
							alu_operator_o = cv32e40p_pkg_ALU_MAXU;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VU;
						end
						6'b010000: begin
							alu_operator_o = cv32e40p_pkg_ALU_SRL;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VS;
						end
						6'b010010: begin
							alu_operator_o = cv32e40p_pkg_ALU_SRA;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VS;
						end
						6'b010100: begin
							alu_operator_o = cv32e40p_pkg_ALU_SLL;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VS;
						end
						6'b010110: begin
							alu_operator_o = cv32e40p_pkg_ALU_OR;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VS;
						end
						6'b011000: begin
							alu_operator_o = cv32e40p_pkg_ALU_XOR;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VS;
						end
						6'b011010: begin
							alu_operator_o = cv32e40p_pkg_ALU_AND;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VS;
						end
						6'b011100: begin
							alu_operator_o = cv32e40p_pkg_ALU_ABS;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VS;
						end
						6'b111010, 6'b111100, 6'b111110, 6'b110000: begin
							alu_operator_o = cv32e40p_pkg_ALU_SHUF;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_SHUF;
							regb_used_o = 1'b1;
							scalar_replication_o = 1'b0;
						end
						6'b110010: begin
							alu_operator_o = cv32e40p_pkg_ALU_SHUF2;
							regb_used_o = 1'b1;
							regc_used_o = 1'b1;
							regc_mux_o = cv32e40p_pkg_REGC_RD;
							scalar_replication_o = 1'b0;
						end
						6'b110100: begin
							alu_operator_o = (instr_rdata_i[25] ? cv32e40p_pkg_ALU_PCKHI : cv32e40p_pkg_ALU_PCKLO);
							regb_used_o = 1'b1;
						end
						6'b110110: begin
							alu_operator_o = cv32e40p_pkg_ALU_PCKHI;
							regb_used_o = 1'b1;
							regc_used_o = 1'b1;
							regc_mux_o = cv32e40p_pkg_REGC_RD;
						end
						6'b111000: begin
							alu_operator_o = cv32e40p_pkg_ALU_PCKLO;
							regb_used_o = 1'b1;
							regc_used_o = 1'b1;
							regc_mux_o = cv32e40p_pkg_REGC_RD;
						end
						6'b011110: alu_operator_o = cv32e40p_pkg_ALU_EXTS;
						6'b100100: alu_operator_o = cv32e40p_pkg_ALU_EXT;
						6'b101100: begin
							alu_operator_o = cv32e40p_pkg_ALU_INS;
							regc_used_o = 1'b1;
							regc_mux_o = cv32e40p_pkg_REGC_RD;
							alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_REGC_OR_FWD;
						end
						6'b100000: begin
							alu_en = 1'b0;
							mult_dot_en = 1'b1;
							mult_dot_signed_o = 2'b00;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VU;
						end
						6'b100010: begin
							alu_en = 1'b0;
							mult_dot_en = 1'b1;
							mult_dot_signed_o = 2'b01;
						end
						6'b100110: begin
							alu_en = 1'b0;
							mult_dot_en = 1'b1;
							mult_dot_signed_o = 2'b11;
						end
						6'b101000: begin
							alu_en = 1'b0;
							mult_dot_en = 1'b1;
							mult_dot_signed_o = 2'b00;
							regc_used_o = 1'b1;
							regc_mux_o = cv32e40p_pkg_REGC_RD;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VU;
						end
						6'b101010: begin
							alu_en = 1'b0;
							mult_dot_en = 1'b1;
							mult_dot_signed_o = 2'b01;
							regc_used_o = 1'b1;
							regc_mux_o = cv32e40p_pkg_REGC_RD;
						end
						6'b101110: begin
							alu_en = 1'b0;
							mult_dot_en = 1'b1;
							mult_dot_signed_o = 2'b11;
							regc_used_o = 1'b1;
							regc_mux_o = cv32e40p_pkg_REGC_RD;
						end
						6'b010101: begin
							alu_en = 1'b0;
							mult_dot_en = 1'b1;
							mult_dot_signed_o = 2'b11;
							is_clpx_o = 1'b1;
							regc_used_o = 1'b1;
							regc_mux_o = cv32e40p_pkg_REGC_RD;
							scalar_replication_o = 1'b0;
							alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_REGB_OR_FWD;
							regb_used_o = 1'b1;
							illegal_insn_o = instr_rdata_i[12];
						end
						6'b011011: begin
							alu_operator_o = cv32e40p_pkg_ALU_SUB;
							is_clpx_o = 1'b1;
							scalar_replication_o = 1'b0;
							alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_REGB_OR_FWD;
							regb_used_o = 1'b1;
							is_subrot_o = 1'b1;
							illegal_insn_o = instr_rdata_i[12];
						end
						6'b010111: begin
							alu_operator_o = cv32e40p_pkg_ALU_ABS;
							is_clpx_o = 1'b1;
							scalar_replication_o = 1'b0;
							regb_used_o = 1'b0;
							illegal_insn_o = instr_rdata_i[12] || (instr_rdata_i[24:20] != {5 {1'sb0}});
						end
						6'b011101: begin
							alu_operator_o = cv32e40p_pkg_ALU_ADD;
							is_clpx_o = 1'b1;
							scalar_replication_o = 1'b0;
							alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_REGB_OR_FWD;
							regb_used_o = 1'b1;
							illegal_insn_o = instr_rdata_i[12];
						end
						6'b011001: begin
							alu_operator_o = cv32e40p_pkg_ALU_SUB;
							is_clpx_o = 1'b1;
							scalar_replication_o = 1'b0;
							alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_REGB_OR_FWD;
							regb_used_o = 1'b1;
							illegal_insn_o = instr_rdata_i[12];
						end
						6'b000001: begin
							alu_operator_o = cv32e40p_pkg_ALU_EQ;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VS;
						end
						6'b000011: begin
							alu_operator_o = cv32e40p_pkg_ALU_NE;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VS;
						end
						6'b000101: begin
							alu_operator_o = cv32e40p_pkg_ALU_GTS;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VS;
						end
						6'b000111: begin
							alu_operator_o = cv32e40p_pkg_ALU_GES;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VS;
						end
						6'b001001: begin
							alu_operator_o = cv32e40p_pkg_ALU_LTS;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VS;
						end
						6'b001011: begin
							alu_operator_o = cv32e40p_pkg_ALU_LES;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VS;
						end
						6'b001101: begin
							alu_operator_o = cv32e40p_pkg_ALU_GTU;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VU;
						end
						6'b001111: begin
							alu_operator_o = cv32e40p_pkg_ALU_GEU;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VU;
						end
						6'b010001: begin
							alu_operator_o = cv32e40p_pkg_ALU_LTU;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VU;
						end
						6'b010011: begin
							alu_operator_o = cv32e40p_pkg_ALU_LEU;
							imm_b_mux_sel_o = cv32e40p_pkg_IMMB_VU;
						end
						default: illegal_insn_o = 1'b1;
					endcase
				end
				else
					illegal_insn_o = 1'b1;
			cv32e40p_pkg_OPCODE_FENCE:
				(* full_case, parallel_case *)
				case (instr_rdata_i[14:12])
					3'b000: fencei_insn_o = 1'b1;
					3'b001: fencei_insn_o = 1'b1;
					default: illegal_insn_o = 1'b1;
				endcase
			cv32e40p_pkg_OPCODE_SYSTEM:
				if (instr_rdata_i[14:12] == 3'b000) begin
					if ({instr_rdata_i[19:15], instr_rdata_i[11:7]} == {10 {1'sb0}})
						(* full_case, parallel_case *)
						case (instr_rdata_i[31:20])
							12'h000: ecall_insn_o = 1'b1;
							12'h001: ebrk_insn_o = 1'b1;
							12'h302: begin
								illegal_insn_o = (PULP_SECURE ? current_priv_lvl_i != 2'b11 : 1'b0);
								mret_insn_o = ~illegal_insn_o;
								mret_dec_o = 1'b1;
							end
							12'h002: begin
								illegal_insn_o = (PULP_SECURE ? 1'b0 : 1'b1);
								uret_insn_o = ~illegal_insn_o;
								uret_dec_o = 1'b1;
							end
							12'h7b2: begin
								illegal_insn_o = !debug_mode_i;
								dret_insn_o = debug_mode_i;
								dret_dec_o = 1'b1;
							end
							12'h105: begin
								wfi_o = 1'b1;
								if (debug_wfi_no_sleep_i) begin
									alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_IMM;
									imm_b_mux_sel_o = cv32e40p_pkg_IMMB_I;
									alu_operator_o = cv32e40p_pkg_ALU_ADD;
								end
							end
							default: illegal_insn_o = 1'b1;
						endcase
					else
						illegal_insn_o = 1'b1;
				end
				else begin
					csr_access_o = 1'b1;
					regfile_alu_we = 1'b1;
					alu_op_b_mux_sel_o = cv32e40p_pkg_OP_B_IMM;
					imm_a_mux_sel_o = cv32e40p_pkg_IMMA_Z;
					imm_b_mux_sel_o = cv32e40p_pkg_IMMB_I;
					if (instr_rdata_i[14] == 1'b1)
						alu_op_a_mux_sel_o = cv32e40p_pkg_OP_A_IMM;
					else begin
						rega_used_o = 1'b1;
						alu_op_a_mux_sel_o = cv32e40p_pkg_OP_A_REGA_OR_FWD;
					end
					(* full_case, parallel_case *)
					case (instr_rdata_i[13:12])
						2'b01: csr_op = cv32e40p_pkg_CSR_OP_WRITE;
						2'b10: csr_op = (instr_rdata_i[19:15] == 5'b00000 ? cv32e40p_pkg_CSR_OP_READ : cv32e40p_pkg_CSR_OP_SET);
						2'b11: csr_op = (instr_rdata_i[19:15] == 5'b00000 ? cv32e40p_pkg_CSR_OP_READ : cv32e40p_pkg_CSR_OP_CLEAR);
						default: csr_illegal = 1'b1;
					endcase
					if (instr_rdata_i[29:28] > current_priv_lvl_i)
						csr_illegal = 1'b1;
					case (instr_rdata_i[31:20])
						12'h001, 12'h002, 12'h003:
							if (!FPU)
								csr_illegal = 1'b1;
						12'h807:
							if (!(FPU && PULP_XPULP))
								csr_illegal = 1'b1;
						12'hf11, 12'hf12, 12'hf13, 12'hf14:
							if (csr_op != cv32e40p_pkg_CSR_OP_READ)
								csr_illegal = 1'b1;
						12'h300, 12'h341, 12'h305, 12'h342: csr_status_o = 1'b1;
						12'h301, 12'h304, 12'h340, 12'h343, 12'h344:
							;
						12'hb00, 12'hb02, 12'hb03, 12'hb04, 12'hb05, 12'hb06, 12'hb07, 12'hb08, 12'hb09, 12'hb0a, 12'hb0b, 12'hb0c, 12'hb0d, 12'hb0e, 12'hb0f, 12'hb10, 12'hb11, 12'hb12, 12'hb13, 12'hb14, 12'hb15, 12'hb16, 12'hb17, 12'hb18, 12'hb19, 12'hb1a, 12'hb1b, 12'hb1c, 12'hb1d, 12'hb1e, 12'hb1f, 12'hb80, 12'hb82, 12'hb83, 12'hb84, 12'hb85, 12'hb86, 12'hb87, 12'hb88, 12'hb89, 12'hb8a, 12'hb8b, 12'hb8c, 12'hb8d, 12'hb8e, 12'hb8f, 12'hb90, 12'hb91, 12'hb92, 12'hb93, 12'hb94, 12'hb95, 12'hb96, 12'hb97, 12'hb98, 12'hb99, 12'hb9a, 12'hb9b, 12'hb9c, 12'hb9d, 12'hb9e, 12'hb9f, 12'h320, 12'h323, 12'h324, 12'h325, 12'h326, 12'h327, 12'h328, 12'h329, 12'h32a, 12'h32b, 12'h32c, 12'h32d, 12'h32e, 12'h32f, 12'h330, 12'h331, 12'h332, 12'h333, 12'h334, 12'h335, 12'h336, 12'h337, 12'h338, 12'h339, 12'h33a, 12'h33b, 12'h33c, 12'h33d, 12'h33e, 12'h33f: csr_status_o = 1'b1;
						12'hc00, 12'hc02, 12'hc03, 12'hc04, 12'hc05, 12'hc06, 12'hc07, 12'hc08, 12'hc09, 12'hc0a, 12'hc0b, 12'hc0c, 12'hc0d, 12'hc0e, 12'hc0f, 12'hc10, 12'hc11, 12'hc12, 12'hc13, 12'hc14, 12'hc15, 12'hc16, 12'hc17, 12'hc18, 12'hc19, 12'hc1a, 12'hc1b, 12'hc1c, 12'hc1d, 12'hc1e, 12'hc1f, 12'hc80, 12'hc82, 12'hc83, 12'hc84, 12'hc85, 12'hc86, 12'hc87, 12'hc88, 12'hc89, 12'hc8a, 12'hc8b, 12'hc8c, 12'hc8d, 12'hc8e, 12'hc8f, 12'hc90, 12'hc91, 12'hc92, 12'hc93, 12'hc94, 12'hc95, 12'hc96, 12'hc97, 12'hc98, 12'hc99, 12'hc9a, 12'hc9b, 12'hc9c, 12'hc9d, 12'hc9e, 12'hc9f:
							if ((csr_op != cv32e40p_pkg_CSR_OP_READ) || ((PULP_SECURE && (current_priv_lvl_i != 2'b11)) && !mcounteren_i[instr_rdata_i[24:20]]))
								csr_illegal = 1'b1;
							else
								csr_status_o = 1'b1;
						12'h306:
							if (!PULP_SECURE)
								csr_illegal = 1'b1;
							else
								csr_status_o = 1'b1;
						12'h7b0, 12'h7b1, 12'h7b2, 12'h7b3:
							if (!debug_mode_i)
								csr_illegal = 1'b1;
							else
								csr_status_o = 1'b1;
						12'h7a0, 12'h7a1, 12'h7a2, 12'h7a3, 12'h7a4, 12'h7a8, 12'h7aa:
							if (DEBUG_TRIGGER_EN != 1)
								csr_illegal = 1'b1;
						12'h800, 12'h801, 12'h802, 12'h804, 12'h805, 12'h806, 12'hcc0:
							if (!PULP_XPULP)
								csr_illegal = 1'b1;
						12'hcc1:
							if (!PULP_XPULP)
								csr_illegal = 1'b1;
							else
								csr_status_o = 1'b1;
						12'h3a0, 12'h3a1, 12'h3a2, 12'h3a3, 12'h3b0, 12'h3b1, 12'h3b2, 12'h3b3, 12'h3b4, 12'h3b5, 12'h3b6, 12'h3b7, 12'h3b8, 12'h3b9, 12'h3ba, 12'h3bb, 12'h3bc, 12'h3bd, 12'h3be, 12'h3bf:
							if (!USE_PMP)
								csr_illegal = 1'b1;
						12'h000, 12'h041, 12'h005, 12'h042:
							if (!PULP_SECURE)
								csr_illegal = 1'b1;
							else
								csr_status_o = 1'b1;
						default: csr_illegal = 1'b1;
					endcase
					illegal_insn_o = csr_illegal;
				end
			cv32e40p_pkg_OPCODE_HWLOOP:
				if (PULP_XPULP) begin : HWLOOP_FEATURE_ENABLED
					hwlp_target_mux_sel_o = 1'b0;
					(* full_case, parallel_case *)
					case (instr_rdata_i[14:12])
						3'b000: begin
							hwlp_we[0] = 1'b1;
							hwlp_start_mux_sel_o = 1'b0;
						end
						3'b001: hwlp_we[1] = 1'b1;
						3'b010: begin
							hwlp_we[2] = 1'b1;
							hwlp_cnt_mux_sel_o = 1'b1;
							rega_used_o = 1'b1;
						end
						3'b011: begin
							hwlp_we[2] = 1'b1;
							hwlp_cnt_mux_sel_o = 1'b0;
						end
						3'b100: begin
							hwlp_we = 3'b111;
							hwlp_start_mux_sel_o = 1'b1;
							hwlp_cnt_mux_sel_o = 1'b1;
							rega_used_o = 1'b1;
						end
						3'b101: begin
							hwlp_we = 3'b111;
							hwlp_target_mux_sel_o = 1'b1;
							hwlp_start_mux_sel_o = 1'b1;
							hwlp_cnt_mux_sel_o = 1'b0;
						end
						default: illegal_insn_o = 1'b1;
					endcase
				end
				else
					illegal_insn_o = 1'b1;
			default: illegal_insn_o = 1'b1;
		endcase
		if (illegal_c_insn_i)
			illegal_insn_o = 1'b1;
	end
	assign alu_en_o = (deassert_we_i ? 1'b0 : alu_en);
	assign apu_en_o = (deassert_we_i ? 1'b0 : apu_en);
	assign mult_int_en_o = (deassert_we_i ? 1'b0 : mult_int_en);
	assign mult_dot_en_o = (deassert_we_i ? 1'b0 : mult_dot_en);
	assign regfile_mem_we_o = (deassert_we_i ? 1'b0 : regfile_mem_we);
	assign regfile_alu_we_o = (deassert_we_i ? 1'b0 : regfile_alu_we);
	assign data_req_o = (deassert_we_i ? 1'b0 : data_req);
	assign hwlp_we_o = (deassert_we_i ? 3'b000 : hwlp_we);
	assign csr_op_o = (deassert_we_i ? cv32e40p_pkg_CSR_OP_READ : csr_op);
	assign ctrl_transfer_insn_in_id_o = (deassert_we_i ? cv32e40p_pkg_BRANCH_NONE : ctrl_transfer_insn);
	assign ctrl_transfer_insn_in_dec_o = ctrl_transfer_insn;
	assign regfile_alu_we_dec_o = regfile_alu_we;
	initial _sv2v_0 = 0;
endmodule
