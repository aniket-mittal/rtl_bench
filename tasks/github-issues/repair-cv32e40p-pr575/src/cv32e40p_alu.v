module cv32e40p_alu (
	clk,
	rst_n,
	enable_i,
	operator_i,
	operand_a_i,
	operand_b_i,
	operand_c_i,
	vector_mode_i,
	bmask_a_i,
	bmask_b_i,
	imm_vec_ext_i,
	is_clpx_i,
	is_subrot_i,
	clpx_shift_i,
	result_o,
	comparison_result_o,
	ready_o,
	ex_ready_i
);
	reg _sv2v_0;
	input wire clk;
	input wire rst_n;
	input wire enable_i;
	localparam cv32e40p_pkg_ALU_OP_WIDTH = 7;
	input wire [6:0] operator_i;
	input wire [31:0] operand_a_i;
	input wire [31:0] operand_b_i;
	input wire [31:0] operand_c_i;
	input wire [1:0] vector_mode_i;
	input wire [4:0] bmask_a_i;
	input wire [4:0] bmask_b_i;
	input wire [1:0] imm_vec_ext_i;
	input wire is_clpx_i;
	input wire is_subrot_i;
	input wire [1:0] clpx_shift_i;
	output reg [31:0] result_o;
	output wire comparison_result_o;
	output wire ready_o;
	input wire ex_ready_i;
	wire [31:0] operand_a_rev;
	wire [31:0] operand_a_neg;
	wire [31:0] operand_a_neg_rev;
	assign operand_a_neg = ~operand_a_i;
	genvar _gv_k_1;
	generate
		for (_gv_k_1 = 0; _gv_k_1 < 32; _gv_k_1 = _gv_k_1 + 1) begin : genblk1
			localparam k = _gv_k_1;
			assign operand_a_rev[k] = operand_a_i[31 - k];
		end
	endgenerate
	genvar _gv_m_1;
	generate
		for (_gv_m_1 = 0; _gv_m_1 < 32; _gv_m_1 = _gv_m_1 + 1) begin : genblk2
			localparam m = _gv_m_1;
			assign operand_a_neg_rev[m] = operand_a_neg[31 - m];
		end
	endgenerate
	wire [31:0] operand_b_neg;
	assign operand_b_neg = ~operand_b_i;
	wire [5:0] div_shift;
	wire div_valid;
	wire [31:0] bmask;
	wire adder_op_b_negate;
	wire [31:0] adder_op_a;
	wire [31:0] adder_op_b;
	reg [35:0] adder_in_a;
	reg [35:0] adder_in_b;
	wire [31:0] adder_result;
	wire [36:0] adder_result_expanded;
	localparam cv32e40p_pkg_ALU_SUB = 7'b0011001;
	localparam cv32e40p_pkg_ALU_SUBR = 7'b0011101;
	localparam cv32e40p_pkg_ALU_SUBU = 7'b0011011;
	localparam cv32e40p_pkg_ALU_SUBUR = 7'b0011111;
	assign adder_op_b_negate = ((((operator_i == cv32e40p_pkg_ALU_SUB) || (operator_i == cv32e40p_pkg_ALU_SUBR)) || (operator_i == cv32e40p_pkg_ALU_SUBU)) || (operator_i == cv32e40p_pkg_ALU_SUBUR)) || is_subrot_i;
	localparam cv32e40p_pkg_ALU_ABS = 7'b0010100;
	assign adder_op_a = (operator_i == cv32e40p_pkg_ALU_ABS ? operand_a_neg : (is_subrot_i ? {operand_b_i[15:0], operand_a_i[31:16]} : operand_a_i));
	assign adder_op_b = (adder_op_b_negate ? (is_subrot_i ? ~{operand_a_i[15:0], operand_b_i[31:16]} : operand_b_neg) : operand_b_i);
	localparam cv32e40p_pkg_ALU_CLIP = 7'b0010110;
	localparam cv32e40p_pkg_VEC_MODE16 = 2'b10;
	localparam cv32e40p_pkg_VEC_MODE8 = 2'b11;
	always @(*) begin
		if (_sv2v_0)
			;
		adder_in_a[0] = 1'b1;
		adder_in_a[8:1] = adder_op_a[7:0];
		adder_in_a[9] = 1'b1;
		adder_in_a[17:10] = adder_op_a[15:8];
		adder_in_a[18] = 1'b1;
		adder_in_a[26:19] = adder_op_a[23:16];
		adder_in_a[27] = 1'b1;
		adder_in_a[35:28] = adder_op_a[31:24];
		adder_in_b[0] = 1'b0;
		adder_in_b[8:1] = adder_op_b[7:0];
		adder_in_b[9] = 1'b0;
		adder_in_b[17:10] = adder_op_b[15:8];
		adder_in_b[18] = 1'b0;
		adder_in_b[26:19] = adder_op_b[23:16];
		adder_in_b[27] = 1'b0;
		adder_in_b[35:28] = adder_op_b[31:24];
		if (adder_op_b_negate || ((operator_i == cv32e40p_pkg_ALU_ABS) || (operator_i == cv32e40p_pkg_ALU_CLIP))) begin
			adder_in_b[0] = 1'b1;
			case (vector_mode_i)
				cv32e40p_pkg_VEC_MODE16: adder_in_b[18] = 1'b1;
				cv32e40p_pkg_VEC_MODE8: begin
					adder_in_b[9] = 1'b1;
					adder_in_b[18] = 1'b1;
					adder_in_b[27] = 1'b1;
				end
			endcase
		end
		else
			case (vector_mode_i)
				cv32e40p_pkg_VEC_MODE16: adder_in_a[18] = 1'b0;
				cv32e40p_pkg_VEC_MODE8: begin
					adder_in_a[9] = 1'b0;
					adder_in_a[18] = 1'b0;
					adder_in_a[27] = 1'b0;
				end
			endcase
	end
	assign adder_result_expanded = $signed(adder_in_a) + $signed(adder_in_b);
	assign adder_result = {adder_result_expanded[35:28], adder_result_expanded[26:19], adder_result_expanded[17:10], adder_result_expanded[8:1]};
	wire [31:0] adder_round_value;
	wire [31:0] adder_round_result;
	localparam cv32e40p_pkg_ALU_ADDR = 7'b0011100;
	localparam cv32e40p_pkg_ALU_ADDUR = 7'b0011110;
	assign adder_round_value = ((((operator_i == cv32e40p_pkg_ALU_ADDR) || (operator_i == cv32e40p_pkg_ALU_SUBR)) || (operator_i == cv32e40p_pkg_ALU_ADDUR)) || (operator_i == cv32e40p_pkg_ALU_SUBUR) ? {1'b0, bmask[31:1]} : {32 {1'sb0}});
	assign adder_round_result = adder_result + adder_round_value;
	wire shift_left;
	wire shift_use_round;
	wire shift_arithmetic;
	reg [31:0] shift_amt_left;
	wire [31:0] shift_amt;
	wire [31:0] shift_amt_int;
	wire [31:0] shift_amt_norm;
	wire [31:0] shift_op_a;
	wire [31:0] shift_result;
	reg [31:0] shift_right_result;
	wire [31:0] shift_left_result;
	wire [15:0] clpx_shift_ex;
	assign shift_amt = (div_valid ? div_shift : operand_b_i);
	always @(*) begin
		if (_sv2v_0)
			;
		case (vector_mode_i)
			cv32e40p_pkg_VEC_MODE16: begin
				shift_amt_left[15:0] = shift_amt[31:16];
				shift_amt_left[31:16] = shift_amt[15:0];
			end
			cv32e40p_pkg_VEC_MODE8: begin
				shift_amt_left[7:0] = shift_amt[31:24];
				shift_amt_left[15:8] = shift_amt[23:16];
				shift_amt_left[23:16] = shift_amt[15:8];
				shift_amt_left[31:24] = shift_amt[7:0];
			end
			default: shift_amt_left[31:0] = shift_amt[31:0];
		endcase
	end
	localparam cv32e40p_pkg_ALU_BINS = 7'b0101010;
	localparam cv32e40p_pkg_ALU_BREV = 7'b1001001;
	localparam cv32e40p_pkg_ALU_CLB = 7'b0110101;
	localparam cv32e40p_pkg_ALU_DIV = 7'b0110001;
	localparam cv32e40p_pkg_ALU_DIVU = 7'b0110000;
	localparam cv32e40p_pkg_ALU_FL1 = 7'b0110111;
	localparam cv32e40p_pkg_ALU_REM = 7'b0110011;
	localparam cv32e40p_pkg_ALU_REMU = 7'b0110010;
	localparam cv32e40p_pkg_ALU_SLL = 7'b0100111;
	assign shift_left = ((((((((operator_i == cv32e40p_pkg_ALU_SLL) || (operator_i == cv32e40p_pkg_ALU_BINS)) || (operator_i == cv32e40p_pkg_ALU_FL1)) || (operator_i == cv32e40p_pkg_ALU_CLB)) || (operator_i == cv32e40p_pkg_ALU_DIV)) || (operator_i == cv32e40p_pkg_ALU_DIVU)) || (operator_i == cv32e40p_pkg_ALU_REM)) || (operator_i == cv32e40p_pkg_ALU_REMU)) || (operator_i == cv32e40p_pkg_ALU_BREV);
	localparam cv32e40p_pkg_ALU_ADD = 7'b0011000;
	localparam cv32e40p_pkg_ALU_ADDU = 7'b0011010;
	assign shift_use_round = (((((((operator_i == cv32e40p_pkg_ALU_ADD) || (operator_i == cv32e40p_pkg_ALU_SUB)) || (operator_i == cv32e40p_pkg_ALU_ADDR)) || (operator_i == cv32e40p_pkg_ALU_SUBR)) || (operator_i == cv32e40p_pkg_ALU_ADDU)) || (operator_i == cv32e40p_pkg_ALU_SUBU)) || (operator_i == cv32e40p_pkg_ALU_ADDUR)) || (operator_i == cv32e40p_pkg_ALU_SUBUR);
	localparam cv32e40p_pkg_ALU_BEXT = 7'b0101000;
	localparam cv32e40p_pkg_ALU_SRA = 7'b0100100;
	assign shift_arithmetic = (((((operator_i == cv32e40p_pkg_ALU_SRA) || (operator_i == cv32e40p_pkg_ALU_BEXT)) || (operator_i == cv32e40p_pkg_ALU_ADD)) || (operator_i == cv32e40p_pkg_ALU_SUB)) || (operator_i == cv32e40p_pkg_ALU_ADDR)) || (operator_i == cv32e40p_pkg_ALU_SUBR);
	assign shift_op_a = (shift_left ? operand_a_rev : (shift_use_round ? adder_round_result : operand_a_i));
	assign shift_amt_int = (shift_use_round ? shift_amt_norm : (shift_left ? shift_amt_left : shift_amt));
	assign shift_amt_norm = (is_clpx_i ? {clpx_shift_ex, clpx_shift_ex} : {4 {3'b000, bmask_b_i}});
	assign clpx_shift_ex = $unsigned(clpx_shift_i);
	wire [63:0] shift_op_a_32;
	localparam cv32e40p_pkg_ALU_ROR = 7'b0100110;
	assign shift_op_a_32 = (operator_i == cv32e40p_pkg_ALU_ROR ? {shift_op_a, shift_op_a} : $signed({{32 {shift_arithmetic & shift_op_a[31]}}, shift_op_a}));
	always @(*) begin
		if (_sv2v_0)
			;
		case (vector_mode_i)
			cv32e40p_pkg_VEC_MODE16: begin
				shift_right_result[31:16] = $signed({shift_arithmetic & shift_op_a[31], shift_op_a[31:16]}) >>> shift_amt_int[19:16];
				shift_right_result[15:0] = $signed({shift_arithmetic & shift_op_a[15], shift_op_a[15:0]}) >>> shift_amt_int[3:0];
			end
			cv32e40p_pkg_VEC_MODE8: begin
				shift_right_result[31:24] = $signed({shift_arithmetic & shift_op_a[31], shift_op_a[31:24]}) >>> shift_amt_int[26:24];
				shift_right_result[23:16] = $signed({shift_arithmetic & shift_op_a[23], shift_op_a[23:16]}) >>> shift_amt_int[18:16];
				shift_right_result[15:8] = $signed({shift_arithmetic & shift_op_a[15], shift_op_a[15:8]}) >>> shift_amt_int[10:8];
				shift_right_result[7:0] = $signed({shift_arithmetic & shift_op_a[7], shift_op_a[7:0]}) >>> shift_amt_int[2:0];
			end
			default: shift_right_result = shift_op_a_32 >> shift_amt_int[4:0];
		endcase
	end
	genvar _gv_j_1;
	generate
		for (_gv_j_1 = 0; _gv_j_1 < 32; _gv_j_1 = _gv_j_1 + 1) begin : genblk3
			localparam j = _gv_j_1;
			assign shift_left_result[j] = shift_right_result[31 - j];
		end
	endgenerate
	assign shift_result = (shift_left ? shift_left_result : shift_right_result);
	reg [3:0] is_equal;
	reg [3:0] is_greater;
	reg [3:0] cmp_signed;
	wire [3:0] is_equal_vec;
	wire [3:0] is_greater_vec;
	reg [31:0] operand_b_eq;
	wire is_equal_clip;
	localparam cv32e40p_pkg_ALU_CLIPU = 7'b0010111;
	always @(*) begin
		if (_sv2v_0)
			;
		operand_b_eq = operand_b_neg;
		if (operator_i == cv32e40p_pkg_ALU_CLIPU)
			operand_b_eq = 1'sb0;
		else
			operand_b_eq = operand_b_neg;
	end
	assign is_equal_clip = operand_a_i == operand_b_eq;
	localparam cv32e40p_pkg_ALU_GES = 7'b0001010;
	localparam cv32e40p_pkg_ALU_GTS = 7'b0001000;
	localparam cv32e40p_pkg_ALU_LES = 7'b0000100;
	localparam cv32e40p_pkg_ALU_LTS = 7'b0000000;
	localparam cv32e40p_pkg_ALU_MAX = 7'b0010010;
	localparam cv32e40p_pkg_ALU_MIN = 7'b0010000;
	localparam cv32e40p_pkg_ALU_SLETS = 7'b0000110;
	localparam cv32e40p_pkg_ALU_SLTS = 7'b0000010;
	always @(*) begin
		if (_sv2v_0)
			;
		cmp_signed = 4'b0000;
		(* full_case, parallel_case *)
		case (operator_i)
			cv32e40p_pkg_ALU_GTS, cv32e40p_pkg_ALU_GES, cv32e40p_pkg_ALU_LTS, cv32e40p_pkg_ALU_LES, cv32e40p_pkg_ALU_SLTS, cv32e40p_pkg_ALU_SLETS, cv32e40p_pkg_ALU_MIN, cv32e40p_pkg_ALU_MAX, cv32e40p_pkg_ALU_ABS, cv32e40p_pkg_ALU_CLIP, cv32e40p_pkg_ALU_CLIPU:
				case (vector_mode_i)
					cv32e40p_pkg_VEC_MODE8: cmp_signed[3:0] = 4'b1111;
					cv32e40p_pkg_VEC_MODE16: cmp_signed[3:0] = 4'b1010;
					default: cmp_signed[3:0] = 4'b1000;
				endcase
			default:
				;
		endcase
	end
	genvar _gv_i_1;
	generate
		for (_gv_i_1 = 0; _gv_i_1 < 4; _gv_i_1 = _gv_i_1 + 1) begin : genblk4
			localparam i = _gv_i_1;
			assign is_equal_vec[i] = operand_a_i[(8 * i) + 7:8 * i] == operand_b_i[(8 * i) + 7:i * 8];
			assign is_greater_vec[i] = $signed({operand_a_i[(8 * i) + 7] & cmp_signed[i], operand_a_i[(8 * i) + 7:8 * i]}) > $signed({operand_b_i[(8 * i) + 7] & cmp_signed[i], operand_b_i[(8 * i) + 7:i * 8]});
		end
	endgenerate
	always @(*) begin
		if (_sv2v_0)
			;
		is_equal[3:0] = {4 {((is_equal_vec[3] & is_equal_vec[2]) & is_equal_vec[1]) & is_equal_vec[0]}};
		is_greater[3:0] = {4 {is_greater_vec[3] | (is_equal_vec[3] & (is_greater_vec[2] | (is_equal_vec[2] & (is_greater_vec[1] | (is_equal_vec[1] & is_greater_vec[0])))))}};
		case (vector_mode_i)
			cv32e40p_pkg_VEC_MODE16: begin
				is_equal[1:0] = {2 {is_equal_vec[0] & is_equal_vec[1]}};
				is_equal[3:2] = {2 {is_equal_vec[2] & is_equal_vec[3]}};
				is_greater[1:0] = {2 {is_greater_vec[1] | (is_equal_vec[1] & is_greater_vec[0])}};
				is_greater[3:2] = {2 {is_greater_vec[3] | (is_equal_vec[3] & is_greater_vec[2])}};
			end
			cv32e40p_pkg_VEC_MODE8: begin
				is_equal[3:0] = is_equal_vec[3:0];
				is_greater[3:0] = is_greater_vec[3:0];
			end
			default:
				;
		endcase
	end
	reg [3:0] cmp_result;
	localparam cv32e40p_pkg_ALU_EQ = 7'b0001100;
	localparam cv32e40p_pkg_ALU_GEU = 7'b0001011;
	localparam cv32e40p_pkg_ALU_GTU = 7'b0001001;
	localparam cv32e40p_pkg_ALU_LEU = 7'b0000101;
	localparam cv32e40p_pkg_ALU_LTU = 7'b0000001;
	localparam cv32e40p_pkg_ALU_NE = 7'b0001101;
	localparam cv32e40p_pkg_ALU_SLETU = 7'b0000111;
	localparam cv32e40p_pkg_ALU_SLTU = 7'b0000011;
	always @(*) begin
		if (_sv2v_0)
			;
		cmp_result = is_equal;
		(* full_case, parallel_case *)
		case (operator_i)
			cv32e40p_pkg_ALU_EQ: cmp_result = is_equal;
			cv32e40p_pkg_ALU_NE: cmp_result = ~is_equal;
			cv32e40p_pkg_ALU_GTS, cv32e40p_pkg_ALU_GTU: cmp_result = is_greater;
			cv32e40p_pkg_ALU_GES, cv32e40p_pkg_ALU_GEU: cmp_result = is_greater | is_equal;
			cv32e40p_pkg_ALU_LTS, cv32e40p_pkg_ALU_SLTS, cv32e40p_pkg_ALU_LTU, cv32e40p_pkg_ALU_SLTU: cmp_result = ~(is_greater | is_equal);
			cv32e40p_pkg_ALU_SLETS, cv32e40p_pkg_ALU_SLETU, cv32e40p_pkg_ALU_LES, cv32e40p_pkg_ALU_LEU: cmp_result = ~is_greater;
			default:
				;
		endcase
	end
	assign comparison_result_o = cmp_result[3];
	wire [31:0] result_minmax;
	wire [3:0] sel_minmax;
	wire do_min;
	wire [31:0] minmax_b;
	assign minmax_b = (operator_i == cv32e40p_pkg_ALU_ABS ? adder_result : operand_b_i);
	localparam cv32e40p_pkg_ALU_MINU = 7'b0010001;
	assign do_min = (((operator_i == cv32e40p_pkg_ALU_MIN) || (operator_i == cv32e40p_pkg_ALU_MINU)) || (operator_i == cv32e40p_pkg_ALU_CLIP)) || (operator_i == cv32e40p_pkg_ALU_CLIPU);
	assign sel_minmax[3:0] = is_greater ^ {4 {do_min}};
	assign result_minmax[31:24] = (sel_minmax[3] == 1'b1 ? operand_a_i[31:24] : minmax_b[31:24]);
	assign result_minmax[23:16] = (sel_minmax[2] == 1'b1 ? operand_a_i[23:16] : minmax_b[23:16]);
	assign result_minmax[15:8] = (sel_minmax[1] == 1'b1 ? operand_a_i[15:8] : minmax_b[15:8]);
	assign result_minmax[7:0] = (sel_minmax[0] == 1'b1 ? operand_a_i[7:0] : minmax_b[7:0]);
	reg [31:0] clip_result;
	always @(*) begin
		if (_sv2v_0)
			;
		clip_result = result_minmax;
		if (operator_i == cv32e40p_pkg_ALU_CLIPU) begin
			if (operand_a_i[31] || is_equal_clip)
				clip_result = 1'sb0;
			else
				clip_result = result_minmax;
		end
		else if (adder_result_expanded[36] || is_equal_clip)
			clip_result = operand_b_neg;
		else
			clip_result = result_minmax;
	end
	reg [7:0] shuffle_byte_sel;
	reg [3:0] shuffle_reg_sel;
	reg [1:0] shuffle_reg1_sel;
	reg [1:0] shuffle_reg0_sel;
	reg [3:0] shuffle_through;
	wire [31:0] shuffle_r1;
	wire [31:0] shuffle_r0;
	wire [31:0] shuffle_r1_in;
	wire [31:0] shuffle_r0_in;
	wire [31:0] shuffle_result;
	wire [31:0] pack_result;
	localparam cv32e40p_pkg_ALU_EXT = 7'b0111111;
	localparam cv32e40p_pkg_ALU_EXTS = 7'b0111110;
	localparam cv32e40p_pkg_ALU_INS = 7'b0101101;
	localparam cv32e40p_pkg_ALU_PCKHI = 7'b0111001;
	localparam cv32e40p_pkg_ALU_PCKLO = 7'b0111000;
	localparam cv32e40p_pkg_ALU_SHUF2 = 7'b0111011;
	always @(*) begin
		if (_sv2v_0)
			;
		shuffle_reg_sel = 1'sb0;
		shuffle_reg1_sel = 2'b01;
		shuffle_reg0_sel = 2'b10;
		shuffle_through = 1'sb1;
		(* full_case, parallel_case *)
		case (operator_i)
			cv32e40p_pkg_ALU_EXT, cv32e40p_pkg_ALU_EXTS: begin
				if (operator_i == cv32e40p_pkg_ALU_EXTS)
					shuffle_reg1_sel = 2'b11;
				if (vector_mode_i == cv32e40p_pkg_VEC_MODE8) begin
					shuffle_reg_sel[3:1] = 3'b111;
					shuffle_reg_sel[0] = 1'b0;
				end
				else begin
					shuffle_reg_sel[3:2] = 2'b11;
					shuffle_reg_sel[1:0] = 2'b00;
				end
			end
			cv32e40p_pkg_ALU_PCKLO: begin
				shuffle_reg1_sel = 2'b00;
				if (vector_mode_i == cv32e40p_pkg_VEC_MODE8) begin
					shuffle_through = 4'b0011;
					shuffle_reg_sel = 4'b0001;
				end
				else
					shuffle_reg_sel = 4'b0011;
			end
			cv32e40p_pkg_ALU_PCKHI: begin
				shuffle_reg1_sel = 2'b00;
				if (vector_mode_i == cv32e40p_pkg_VEC_MODE8) begin
					shuffle_through = 4'b1100;
					shuffle_reg_sel = 4'b0100;
				end
				else
					shuffle_reg_sel = 4'b0011;
			end
			cv32e40p_pkg_ALU_SHUF2:
				(* full_case, parallel_case *)
				case (vector_mode_i)
					cv32e40p_pkg_VEC_MODE8: begin
						shuffle_reg_sel[3] = ~operand_b_i[26];
						shuffle_reg_sel[2] = ~operand_b_i[18];
						shuffle_reg_sel[1] = ~operand_b_i[10];
						shuffle_reg_sel[0] = ~operand_b_i[2];
					end
					cv32e40p_pkg_VEC_MODE16: begin
						shuffle_reg_sel[3] = ~operand_b_i[17];
						shuffle_reg_sel[2] = ~operand_b_i[17];
						shuffle_reg_sel[1] = ~operand_b_i[1];
						shuffle_reg_sel[0] = ~operand_b_i[1];
					end
					default:
						;
				endcase
			cv32e40p_pkg_ALU_INS:
				(* full_case, parallel_case *)
				case (vector_mode_i)
					cv32e40p_pkg_VEC_MODE8: begin
						shuffle_reg0_sel = 2'b00;
						(* full_case, parallel_case *)
						case (imm_vec_ext_i)
							2'b00: shuffle_reg_sel[3:0] = 4'b1110;
							2'b01: shuffle_reg_sel[3:0] = 4'b1101;
							2'b10: shuffle_reg_sel[3:0] = 4'b1011;
							2'b11: shuffle_reg_sel[3:0] = 4'b0111;
						endcase
					end
					cv32e40p_pkg_VEC_MODE16: begin
						shuffle_reg0_sel = 2'b01;
						shuffle_reg_sel[3] = ~imm_vec_ext_i[0];
						shuffle_reg_sel[2] = ~imm_vec_ext_i[0];
						shuffle_reg_sel[1] = imm_vec_ext_i[0];
						shuffle_reg_sel[0] = imm_vec_ext_i[0];
					end
					default:
						;
				endcase
			default:
				;
		endcase
	end
	localparam cv32e40p_pkg_ALU_SHUF = 7'b0111010;
	always @(*) begin
		if (_sv2v_0)
			;
		shuffle_byte_sel = 1'sb0;
		(* full_case, parallel_case *)
		case (operator_i)
			cv32e40p_pkg_ALU_EXTS, cv32e40p_pkg_ALU_EXT:
				(* full_case, parallel_case *)
				case (vector_mode_i)
					cv32e40p_pkg_VEC_MODE8: begin
						shuffle_byte_sel[6+:2] = imm_vec_ext_i[1:0];
						shuffle_byte_sel[4+:2] = imm_vec_ext_i[1:0];
						shuffle_byte_sel[2+:2] = imm_vec_ext_i[1:0];
						shuffle_byte_sel[0+:2] = imm_vec_ext_i[1:0];
					end
					cv32e40p_pkg_VEC_MODE16: begin
						shuffle_byte_sel[6+:2] = {imm_vec_ext_i[0], 1'b1};
						shuffle_byte_sel[4+:2] = {imm_vec_ext_i[0], 1'b1};
						shuffle_byte_sel[2+:2] = {imm_vec_ext_i[0], 1'b1};
						shuffle_byte_sel[0+:2] = {imm_vec_ext_i[0], 1'b0};
					end
					default:
						;
				endcase
			cv32e40p_pkg_ALU_PCKLO:
				(* full_case, parallel_case *)
				case (vector_mode_i)
					cv32e40p_pkg_VEC_MODE8: begin
						shuffle_byte_sel[6+:2] = 2'b00;
						shuffle_byte_sel[4+:2] = 2'b00;
						shuffle_byte_sel[2+:2] = 2'b00;
						shuffle_byte_sel[0+:2] = 2'b00;
					end
					cv32e40p_pkg_VEC_MODE16: begin
						shuffle_byte_sel[6+:2] = 2'b01;
						shuffle_byte_sel[4+:2] = 2'b00;
						shuffle_byte_sel[2+:2] = 2'b01;
						shuffle_byte_sel[0+:2] = 2'b00;
					end
					default:
						;
				endcase
			cv32e40p_pkg_ALU_PCKHI:
				(* full_case, parallel_case *)
				case (vector_mode_i)
					cv32e40p_pkg_VEC_MODE8: begin
						shuffle_byte_sel[6+:2] = 2'b00;
						shuffle_byte_sel[4+:2] = 2'b00;
						shuffle_byte_sel[2+:2] = 2'b00;
						shuffle_byte_sel[0+:2] = 2'b00;
					end
					cv32e40p_pkg_VEC_MODE16: begin
						shuffle_byte_sel[6+:2] = 2'b11;
						shuffle_byte_sel[4+:2] = 2'b10;
						shuffle_byte_sel[2+:2] = 2'b11;
						shuffle_byte_sel[0+:2] = 2'b10;
					end
					default:
						;
				endcase
			cv32e40p_pkg_ALU_SHUF2, cv32e40p_pkg_ALU_SHUF:
				(* full_case, parallel_case *)
				case (vector_mode_i)
					cv32e40p_pkg_VEC_MODE8: begin
						shuffle_byte_sel[6+:2] = operand_b_i[25:24];
						shuffle_byte_sel[4+:2] = operand_b_i[17:16];
						shuffle_byte_sel[2+:2] = operand_b_i[9:8];
						shuffle_byte_sel[0+:2] = operand_b_i[1:0];
					end
					cv32e40p_pkg_VEC_MODE16: begin
						shuffle_byte_sel[6+:2] = {operand_b_i[16], 1'b1};
						shuffle_byte_sel[4+:2] = {operand_b_i[16], 1'b0};
						shuffle_byte_sel[2+:2] = {operand_b_i[0], 1'b1};
						shuffle_byte_sel[0+:2] = {operand_b_i[0], 1'b0};
					end
					default:
						;
				endcase
			cv32e40p_pkg_ALU_INS: begin
				shuffle_byte_sel[6+:2] = 2'b11;
				shuffle_byte_sel[4+:2] = 2'b10;
				shuffle_byte_sel[2+:2] = 2'b01;
				shuffle_byte_sel[0+:2] = 2'b00;
			end
			default:
				;
		endcase
	end
	assign shuffle_r0_in = (shuffle_reg0_sel[1] ? operand_a_i : (shuffle_reg0_sel[0] ? {2 {operand_a_i[15:0]}} : {4 {operand_a_i[7:0]}}));
	assign shuffle_r1_in = (shuffle_reg1_sel[1] ? {{8 {operand_a_i[31]}}, {8 {operand_a_i[23]}}, {8 {operand_a_i[15]}}, {8 {operand_a_i[7]}}} : (shuffle_reg1_sel[0] ? operand_c_i : operand_b_i));
	assign shuffle_r0[31:24] = (shuffle_byte_sel[7] ? (shuffle_byte_sel[6] ? shuffle_r0_in[31:24] : shuffle_r0_in[23:16]) : (shuffle_byte_sel[6] ? shuffle_r0_in[15:8] : shuffle_r0_in[7:0]));
	assign shuffle_r0[23:16] = (shuffle_byte_sel[5] ? (shuffle_byte_sel[4] ? shuffle_r0_in[31:24] : shuffle_r0_in[23:16]) : (shuffle_byte_sel[4] ? shuffle_r0_in[15:8] : shuffle_r0_in[7:0]));
	assign shuffle_r0[15:8] = (shuffle_byte_sel[3] ? (shuffle_byte_sel[2] ? shuffle_r0_in[31:24] : shuffle_r0_in[23:16]) : (shuffle_byte_sel[2] ? shuffle_r0_in[15:8] : shuffle_r0_in[7:0]));
	assign shuffle_r0[7:0] = (shuffle_byte_sel[1] ? (shuffle_byte_sel[0] ? shuffle_r0_in[31:24] : shuffle_r0_in[23:16]) : (shuffle_byte_sel[0] ? shuffle_r0_in[15:8] : shuffle_r0_in[7:0]));
	assign shuffle_r1[31:24] = (shuffle_byte_sel[7] ? (shuffle_byte_sel[6] ? shuffle_r1_in[31:24] : shuffle_r1_in[23:16]) : (shuffle_byte_sel[6] ? shuffle_r1_in[15:8] : shuffle_r1_in[7:0]));
	assign shuffle_r1[23:16] = (shuffle_byte_sel[5] ? (shuffle_byte_sel[4] ? shuffle_r1_in[31:24] : shuffle_r1_in[23:16]) : (shuffle_byte_sel[4] ? shuffle_r1_in[15:8] : shuffle_r1_in[7:0]));
	assign shuffle_r1[15:8] = (shuffle_byte_sel[3] ? (shuffle_byte_sel[2] ? shuffle_r1_in[31:24] : shuffle_r1_in[23:16]) : (shuffle_byte_sel[2] ? shuffle_r1_in[15:8] : shuffle_r1_in[7:0]));
	assign shuffle_r1[7:0] = (shuffle_byte_sel[1] ? (shuffle_byte_sel[0] ? shuffle_r1_in[31:24] : shuffle_r1_in[23:16]) : (shuffle_byte_sel[0] ? shuffle_r1_in[15:8] : shuffle_r1_in[7:0]));
	assign shuffle_result[31:24] = (shuffle_reg_sel[3] ? shuffle_r1[31:24] : shuffle_r0[31:24]);
	assign shuffle_result[23:16] = (shuffle_reg_sel[2] ? shuffle_r1[23:16] : shuffle_r0[23:16]);
	assign shuffle_result[15:8] = (shuffle_reg_sel[1] ? shuffle_r1[15:8] : shuffle_r0[15:8]);
	assign shuffle_result[7:0] = (shuffle_reg_sel[0] ? shuffle_r1[7:0] : shuffle_r0[7:0]);
	assign pack_result[31:24] = (shuffle_through[3] ? shuffle_result[31:24] : operand_c_i[31:24]);
	assign pack_result[23:16] = (shuffle_through[2] ? shuffle_result[23:16] : operand_c_i[23:16]);
	assign pack_result[15:8] = (shuffle_through[1] ? shuffle_result[15:8] : operand_c_i[15:8]);
	assign pack_result[7:0] = (shuffle_through[0] ? shuffle_result[7:0] : operand_c_i[7:0]);
	reg [31:0] ff_input;
	wire [5:0] cnt_result;
	wire [5:0] clb_result;
	wire [4:0] ff1_result;
	wire ff_no_one;
	wire [4:0] fl1_result;
	reg [5:0] bitop_result;
	cv32e40p_popcnt popcnt_i(
		.in_i(operand_a_i),
		.result_o(cnt_result)
	);
	localparam cv32e40p_pkg_ALU_FF1 = 7'b0110110;
	always @(*) begin
		if (_sv2v_0)
			;
		ff_input = 1'sb0;
		case (operator_i)
			cv32e40p_pkg_ALU_FF1: ff_input = operand_a_i;
			cv32e40p_pkg_ALU_DIVU, cv32e40p_pkg_ALU_REMU, cv32e40p_pkg_ALU_FL1: ff_input = operand_a_rev;
			cv32e40p_pkg_ALU_DIV, cv32e40p_pkg_ALU_REM, cv32e40p_pkg_ALU_CLB:
				if (operand_a_i[31])
					ff_input = operand_a_neg_rev;
				else
					ff_input = operand_a_rev;
		endcase
	end
	cv32e40p_ff_one ff_one_i(
		.in_i(ff_input),
		.first_one_o(ff1_result),
		.no_ones_o(ff_no_one)
	);
	assign fl1_result = 5'd31 - ff1_result;
	assign clb_result = ff1_result - 5'd1;
	localparam cv32e40p_pkg_ALU_CNT = 7'b0110100;
	always @(*) begin
		if (_sv2v_0)
			;
		bitop_result = 1'sb0;
		case (operator_i)
			cv32e40p_pkg_ALU_FF1: bitop_result = (ff_no_one ? 6'd32 : {1'b0, ff1_result});
			cv32e40p_pkg_ALU_FL1: bitop_result = (ff_no_one ? 6'd32 : {1'b0, fl1_result});
			cv32e40p_pkg_ALU_CNT: bitop_result = cnt_result;
			cv32e40p_pkg_ALU_CLB:
				if (ff_no_one) begin
					if (operand_a_i[31])
						bitop_result = 6'd31;
					else
						bitop_result = 1'sb0;
				end
				else
					bitop_result = clb_result;
			default:
				;
		endcase
	end
	wire extract_is_signed;
	wire extract_sign;
	wire [31:0] bmask_first;
	wire [31:0] bmask_inv;
	wire [31:0] bextins_and;
	wire [31:0] bextins_result;
	wire [31:0] bclr_result;
	wire [31:0] bset_result;
	assign bmask_first = 32'hfffffffe << bmask_a_i;
	assign bmask = ~bmask_first << bmask_b_i;
	assign bmask_inv = ~bmask;
	assign bextins_and = (operator_i == cv32e40p_pkg_ALU_BINS ? operand_c_i : {32 {extract_sign}});
	assign extract_is_signed = operator_i == cv32e40p_pkg_ALU_BEXT;
	assign extract_sign = extract_is_signed & shift_result[bmask_a_i];
	assign bextins_result = (bmask & shift_result) | (bextins_and & bmask_inv);
	assign bclr_result = operand_a_i & bmask_inv;
	assign bset_result = operand_a_i | bmask;
	wire [31:0] radix_2_rev;
	wire [31:0] radix_4_rev;
	wire [31:0] radix_8_rev;
	reg [31:0] reverse_result;
	wire [1:0] radix_mux_sel;
	assign radix_mux_sel = bmask_a_i[1:0];
	generate
		for (_gv_j_1 = 0; _gv_j_1 < 32; _gv_j_1 = _gv_j_1 + 1) begin : genblk5
			localparam j = _gv_j_1;
			assign radix_2_rev[j] = shift_result[31 - j];
		end
		for (_gv_j_1 = 0; _gv_j_1 < 16; _gv_j_1 = _gv_j_1 + 1) begin : genblk6
			localparam j = _gv_j_1;
			assign radix_4_rev[(2 * j) + 1:2 * j] = shift_result[31 - (j * 2):(31 - (j * 2)) - 1];
		end
		for (_gv_j_1 = 0; _gv_j_1 < 10; _gv_j_1 = _gv_j_1 + 1) begin : genblk7
			localparam j = _gv_j_1;
			assign radix_8_rev[(3 * j) + 2:3 * j] = shift_result[31 - (j * 3):(31 - (j * 3)) - 2];
		end
	endgenerate
	assign radix_8_rev[31:30] = 2'b00;
	always @(*) begin
		if (_sv2v_0)
			;
		reverse_result = 1'sb0;
		(* full_case, parallel_case *)
		case (radix_mux_sel)
			2'b00: reverse_result = radix_2_rev;
			2'b01: reverse_result = radix_4_rev;
			2'b10: reverse_result = radix_8_rev;
			default: reverse_result = radix_2_rev;
		endcase
	end
	wire [31:0] result_div;
	wire div_ready;
	wire div_signed;
	wire div_op_a_signed;
	wire [5:0] div_shift_int;
	assign div_signed = operator_i[0];
	assign div_op_a_signed = operand_a_i[31] & div_signed;
	assign div_shift_int = (ff_no_one ? 6'd31 : clb_result);
	assign div_shift = div_shift_int + (div_op_a_signed ? 6'd0 : 6'd1);
	assign div_valid = enable_i & ((((operator_i == cv32e40p_pkg_ALU_DIV) || (operator_i == cv32e40p_pkg_ALU_DIVU)) || (operator_i == cv32e40p_pkg_ALU_REM)) || (operator_i == cv32e40p_pkg_ALU_REMU));
	cv32e40p_alu_div alu_div_i(
		.Clk_CI(clk),
		.Rst_RBI(rst_n),
		.OpA_DI(operand_b_i),
		.OpB_DI(shift_left_result),
		.OpBShift_DI(div_shift),
		.OpBIsZero_SI(cnt_result == 0),
		.OpBSign_SI(div_op_a_signed),
		.OpCode_SI(operator_i[1:0]),
		.Res_DO(result_div),
		.InVld_SI(div_valid),
		.OutRdy_SI(ex_ready_i),
		.OutVld_SO(div_ready)
	);
	localparam cv32e40p_pkg_ALU_AND = 7'b0010101;
	localparam cv32e40p_pkg_ALU_BCLR = 7'b0101011;
	localparam cv32e40p_pkg_ALU_BEXTU = 7'b0101001;
	localparam cv32e40p_pkg_ALU_BSET = 7'b0101100;
	localparam cv32e40p_pkg_ALU_MAXU = 7'b0010011;
	localparam cv32e40p_pkg_ALU_OR = 7'b0101110;
	localparam cv32e40p_pkg_ALU_SRL = 7'b0100101;
	localparam cv32e40p_pkg_ALU_XOR = 7'b0101111;
	always @(*) begin
		if (_sv2v_0)
			;
		result_o = 1'sb0;
		(* full_case, parallel_case *)
		case (operator_i)
			cv32e40p_pkg_ALU_AND: result_o = operand_a_i & operand_b_i;
			cv32e40p_pkg_ALU_OR: result_o = operand_a_i | operand_b_i;
			cv32e40p_pkg_ALU_XOR: result_o = operand_a_i ^ operand_b_i;
			cv32e40p_pkg_ALU_ADD, cv32e40p_pkg_ALU_ADDR, cv32e40p_pkg_ALU_ADDU, cv32e40p_pkg_ALU_ADDUR, cv32e40p_pkg_ALU_SUB, cv32e40p_pkg_ALU_SUBR, cv32e40p_pkg_ALU_SUBU, cv32e40p_pkg_ALU_SUBUR, cv32e40p_pkg_ALU_SLL, cv32e40p_pkg_ALU_SRL, cv32e40p_pkg_ALU_SRA, cv32e40p_pkg_ALU_ROR: result_o = shift_result;
			cv32e40p_pkg_ALU_BINS, cv32e40p_pkg_ALU_BEXT, cv32e40p_pkg_ALU_BEXTU: result_o = bextins_result;
			cv32e40p_pkg_ALU_BCLR: result_o = bclr_result;
			cv32e40p_pkg_ALU_BSET: result_o = bset_result;
			cv32e40p_pkg_ALU_BREV: result_o = reverse_result;
			cv32e40p_pkg_ALU_SHUF, cv32e40p_pkg_ALU_SHUF2, cv32e40p_pkg_ALU_PCKLO, cv32e40p_pkg_ALU_PCKHI, cv32e40p_pkg_ALU_EXT, cv32e40p_pkg_ALU_EXTS, cv32e40p_pkg_ALU_INS: result_o = pack_result;
			cv32e40p_pkg_ALU_MIN, cv32e40p_pkg_ALU_MINU, cv32e40p_pkg_ALU_MAX, cv32e40p_pkg_ALU_MAXU: result_o = result_minmax;
			cv32e40p_pkg_ALU_ABS: result_o = (is_clpx_i ? {adder_result[31:16], operand_a_i[15:0]} : result_minmax);
			cv32e40p_pkg_ALU_CLIP, cv32e40p_pkg_ALU_CLIPU: result_o = clip_result;
			cv32e40p_pkg_ALU_EQ, cv32e40p_pkg_ALU_NE, cv32e40p_pkg_ALU_GTU, cv32e40p_pkg_ALU_GEU, cv32e40p_pkg_ALU_LTU, cv32e40p_pkg_ALU_LEU, cv32e40p_pkg_ALU_GTS, cv32e40p_pkg_ALU_GES, cv32e40p_pkg_ALU_LTS, cv32e40p_pkg_ALU_LES: begin
				result_o[31:24] = {8 {cmp_result[3]}};
				result_o[23:16] = {8 {cmp_result[2]}};
				result_o[15:8] = {8 {cmp_result[1]}};
				result_o[7:0] = {8 {cmp_result[0]}};
			end
			cv32e40p_pkg_ALU_SLTS, cv32e40p_pkg_ALU_SLTU, cv32e40p_pkg_ALU_SLETS, cv32e40p_pkg_ALU_SLETU: result_o = {31'b0000000000000000000000000000000, comparison_result_o};
			cv32e40p_pkg_ALU_FF1, cv32e40p_pkg_ALU_FL1, cv32e40p_pkg_ALU_CLB, cv32e40p_pkg_ALU_CNT: result_o = {26'h0000000, bitop_result[5:0]};
			cv32e40p_pkg_ALU_DIV, cv32e40p_pkg_ALU_DIVU, cv32e40p_pkg_ALU_REM, cv32e40p_pkg_ALU_REMU: result_o = result_div;
			default:
				;
		endcase
	end
	assign ready_o = div_ready;
	initial _sv2v_0 = 0;
endmodule
