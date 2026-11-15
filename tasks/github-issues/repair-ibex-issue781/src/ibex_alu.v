module ibex_alu (
	operator_i,
	operand_a_i,
	operand_b_i,
	instr_first_cycle_i,
	multdiv_operand_a_i,
	multdiv_operand_b_i,
	multdiv_sel_i,
	imd_val_q_i,
	imd_val_d_o,
	imd_val_we_o,
	adder_result_o,
	adder_result_ext_o,
	result_o,
	comparison_result_o,
	is_equal_result_o
);
	reg _sv2v_0;
	parameter [0:0] RV32B = 1'b0;
	input wire [5:0] operator_i;
	input wire [31:0] operand_a_i;
	input wire [31:0] operand_b_i;
	input wire instr_first_cycle_i;
	input wire [32:0] multdiv_operand_a_i;
	input wire [32:0] multdiv_operand_b_i;
	input wire multdiv_sel_i;
	input wire [31:0] imd_val_q_i;
	output reg [31:0] imd_val_d_o;
	output reg imd_val_we_o;
	output wire [31:0] adder_result_o;
	output wire [33:0] adder_result_ext_o;
	output reg [31:0] result_o;
	output wire comparison_result_o;
	output wire is_equal_result_o;
	wire [31:0] operand_a_rev;
	wire [32:0] operand_b_neg;
	genvar _gv_k_1;
	generate
		for (_gv_k_1 = 0; _gv_k_1 < 32; _gv_k_1 = _gv_k_1 + 1) begin : gen_rev_operand_a
			localparam k = _gv_k_1;
			assign operand_a_rev[k] = operand_a_i[31 - k];
		end
	endgenerate
	reg adder_op_b_negate;
	wire [32:0] adder_in_a;
	reg [32:0] adder_in_b;
	wire [31:0] adder_result;
	always @(*) begin
		if (_sv2v_0)
			;
		adder_op_b_negate = 1'b0;
		(* full_case, parallel_case *)
		case (operator_i)
			6'd1, 6'd23, 6'd24, 6'd21, 6'd22, 6'd19, 6'd20, 6'd35, 6'd36, 6'd25, 6'd26, 6'd27, 6'd28: adder_op_b_negate = 1'b1;
			default:
				;
		endcase
	end
	assign adder_in_a = (multdiv_sel_i ? multdiv_operand_a_i : {operand_a_i, 1'b1});
	assign operand_b_neg = {operand_b_i, 1'b0} ^ {33 {1'b1}};
	always @(*) begin
		if (_sv2v_0)
			;
		(* full_case, parallel_case *)
		case (1'b1)
			multdiv_sel_i: adder_in_b = multdiv_operand_b_i;
			adder_op_b_negate: adder_in_b = operand_b_neg;
			default: adder_in_b = {operand_b_i, 1'b0};
		endcase
	end
	assign adder_result_ext_o = $unsigned(adder_in_a) + $unsigned(adder_in_b);
	assign adder_result = adder_result_ext_o[32:1];
	assign adder_result_o = adder_result;
	reg shift_left;
	wire shift_ones;
	wire shift_arith;
	wire shift_funnel;
	wire shift_sbmode;
	wire [5:0] shift_amt;
	wire [5:0] shift_amt_compl;
	assign shift_amt[5] = operand_b_i[5] && shift_funnel;
	assign shift_amt_compl = 32 - operand_b_i[4:0];
	assign shift_amt[4:0] = (instr_first_cycle_i ? (operand_b_i[5] && shift_funnel ? shift_amt_compl[4:0] : operand_b_i[4:0]) : (operand_b_i[5] && shift_funnel ? operand_b_i[4:0] : shift_amt_compl[4:0]));
	assign shift_sbmode = (RV32B ? ((operator_i == 6'd41) || (operator_i == 6'd42)) || (operator_i == 6'd43) : 1'b0);
	always @(*) begin
		if (_sv2v_0)
			;
		(* full_case, parallel_case *)
		case (operator_i)
			6'd10: shift_left = 1'b1;
			6'd12: shift_left = (RV32B ? 1'b1 : 1'b0);
			6'd14: shift_left = (RV32B ? instr_first_cycle_i : 0);
			6'd13: shift_left = (RV32B ? !instr_first_cycle_i : 0);
			6'd39: shift_left = (RV32B ? (shift_amt[5] ? !instr_first_cycle_i : instr_first_cycle_i) : 1'b0);
			6'd40: shift_left = (RV32B ? (shift_amt[5] ? instr_first_cycle_i : !instr_first_cycle_i) : 1'b0);
			default: shift_left = 1'b0;
		endcase
		if (shift_sbmode)
			shift_left = 1'b1;
	end
	assign shift_arith = operator_i == 6'd8;
	assign shift_ones = (RV32B ? (operator_i == 6'd12) || (operator_i == 6'd11) : 1'b0);
	assign shift_funnel = (RV32B ? (operator_i == 6'd39) || (operator_i == 6'd40) : 1'b0);
	reg [31:0] shift_result;
	reg [32:0] shift_result_ext;
	wire grev_op;
	assign grev_op = (RV32B ? operator_i == 6'd15 : 1'b0);
	wire gorc_op;
	assign gorc_op = (RV32B ? operator_i == 6'd16 : 1'b0);
	always @(*) begin
		if (_sv2v_0)
			;
		shift_result = operand_a_i;
		if (shift_left)
			shift_result = operand_a_rev;
		if (shift_sbmode)
			shift_result = 32'h80000000;
		shift_result_ext = $signed({shift_ones || (shift_arith && shift_result[31]), shift_result}) >>> shift_amt[4:0];
		shift_result = shift_result_ext[31:0];
		if (grev_op || gorc_op)
			shift_result = operand_a_i;
		if (shift_left || ((grev_op || gorc_op) & shift_amt[0]))
			shift_result = ((gorc_op ? shift_result : 32'h00000000) | ((shift_result & 32'h55555555) << 1)) | ((shift_result & 32'haaaaaaaa) >> 1);
		if (shift_left || ((grev_op || gorc_op) & shift_amt[1]))
			shift_result = ((gorc_op ? shift_result : 32'h00000000) | ((shift_result & 32'h33333333) << 2)) | ((shift_result & 32'hcccccccc) >> 2);
		if (shift_left || ((grev_op || gorc_op) & shift_amt[2]))
			shift_result = ((gorc_op ? shift_result : 32'h00000000) | ((shift_result & 32'h0f0f0f0f) << 4)) | ((shift_result & 32'hf0f0f0f0) >> 4);
		if (shift_left || ((grev_op || gorc_op) & shift_amt[3]))
			shift_result = ((gorc_op ? shift_result : 32'h00000000) | ((shift_result & 32'h00ff00ff) << 8)) | ((shift_result & 32'hff00ff00) >> 8);
		if (shift_left || ((grev_op || gorc_op) & shift_amt[4]))
			shift_result = ((gorc_op ? shift_result : 32'h00000000) | ((shift_result & 32'h0000ffff) << 16)) | ((shift_result & 32'hffff0000) >> 16);
	end
	wire is_equal;
	reg is_greater_equal;
	reg cmp_signed;
	always @(*) begin
		if (_sv2v_0)
			;
		(* full_case, parallel_case *)
		case (operator_i)
			6'd21, 6'd19, 6'd35, 6'd25, 6'd27: cmp_signed = 1'b1;
			default: cmp_signed = 1'b0;
		endcase
	end
	assign is_equal = adder_result == 32'b00000000000000000000000000000000;
	assign is_equal_result_o = is_equal;
	always @(*) begin
		if (_sv2v_0)
			;
		if ((operand_a_i[31] ^ operand_b_i[31]) == 1'b0)
			is_greater_equal = adder_result[31] == 1'b0;
		else
			is_greater_equal = operand_a_i[31] ^ cmp_signed;
	end
	reg cmp_result;
	always @(*) begin
		if (_sv2v_0)
			;
		(* full_case, parallel_case *)
		case (operator_i)
			6'd23: cmp_result = is_equal;
			6'd24: cmp_result = ~is_equal;
			6'd21, 6'd22, 6'd27, 6'd28: cmp_result = is_greater_equal;
			6'd19, 6'd20, 6'd25, 6'd26, 6'd35, 6'd36: cmp_result = ~is_greater_equal;
			default: cmp_result = is_equal;
		endcase
	end
	assign comparison_result_o = cmp_result;
	wire [31:0] minmax_result;
	reg [5:0] bitcnt_result;
	reg [31:0] bwlogic_result;
	reg [31:0] pack_result;
	reg [31:0] multicycle_result;
	reg [31:0] singlebit_result;
	wire bwlogic_or;
	wire bwlogic_and;
	wire [31:0] bwlogic_operand_b;
	wire [31:0] bwlogic_or_result;
	wire [31:0] bwlogic_and_result;
	wire [31:0] bwlogic_xor_result;
	reg bwlogic_op_b_negate;
	always @(*) begin
		if (_sv2v_0)
			;
		(* full_case, parallel_case *)
		case (operator_i)
			6'd5, 6'd6, 6'd7: bwlogic_op_b_negate = (RV32B ? 1'b1 : 1'b0);
			6'd38: bwlogic_op_b_negate = (RV32B ? !instr_first_cycle_i : 1'b0);
			default: bwlogic_op_b_negate = 1'b0;
		endcase
	end
	assign bwlogic_operand_b = (bwlogic_op_b_negate ? operand_b_neg[32:1] : operand_b_i);
	assign bwlogic_or_result = operand_a_i | bwlogic_operand_b;
	assign bwlogic_and_result = operand_a_i & bwlogic_operand_b;
	assign bwlogic_xor_result = operand_a_i ^ bwlogic_operand_b;
	assign bwlogic_or = (operator_i == 6'd3) || (operator_i == 6'd6);
	assign bwlogic_and = (operator_i == 6'd4) || (operator_i == 6'd7);
	always @(*) begin
		if (_sv2v_0)
			;
		(* full_case, parallel_case *)
		case (1'b1)
			bwlogic_or: bwlogic_result = bwlogic_or_result;
			bwlogic_and: bwlogic_result = bwlogic_and_result;
			default: bwlogic_result = bwlogic_xor_result;
		endcase
	end
	reg [31:0] shuffle_result;
	generate
		if (RV32B) begin : g_alu_rvb
			localparam [127:0] SHUFFLE_MASK_L = 128'h00ff00000f000f003030303044444444;
			localparam [127:0] SHUFFLE_MASK_R = 128'h0000ff0000f000f00c0c0c0c22222222;
			localparam [127:0] FLIP_MASK_L = 128'h22001100004400004411000011000000;
			localparam [127:0] FLIP_MASK_R = 128'h00880044000022000000882200000088;
			wire [31:0] SHUFFLE_MASK_NOT [0:3];
			genvar _gv_i_1;
			for (_gv_i_1 = 0; _gv_i_1 < 4; _gv_i_1 = _gv_i_1 + 1) begin : gen_shuffle_mask_not
				localparam i = _gv_i_1;
				assign SHUFFLE_MASK_NOT[i] = ~(SHUFFLE_MASK_L[(3 - i) * 32+:32] | SHUFFLE_MASK_R[(3 - i) * 32+:32]);
			end
			wire shuffle_flip;
			assign shuffle_flip = operator_i == 6'd18;
			reg [3:0] shuffle_mode;
			always @(*) begin
				if (_sv2v_0)
					;
				shuffle_result = operand_a_i;
				if (shuffle_flip) begin
					shuffle_mode[3] = shift_amt[0];
					shuffle_mode[2] = shift_amt[1];
					shuffle_mode[1] = shift_amt[2];
					shuffle_mode[0] = shift_amt[3];
				end
				else
					shuffle_mode = shift_amt[3:0];
				if (shuffle_flip)
					shuffle_result = ((((((((shuffle_result & 32'h88224411) | ((shuffle_result << 6) & FLIP_MASK_L[96+:32])) | ((shuffle_result >> 6) & FLIP_MASK_R[96+:32])) | ((shuffle_result << 9) & FLIP_MASK_L[64+:32])) | ((shuffle_result >> 9) & FLIP_MASK_R[64+:32])) | ((shuffle_result << 15) & FLIP_MASK_L[32+:32])) | ((shuffle_result >> 15) & FLIP_MASK_R[32+:32])) | ((shuffle_result << 21) & FLIP_MASK_L[0+:32])) | ((shuffle_result >> 21) & FLIP_MASK_R[0+:32]);
				if (shuffle_mode[3])
					shuffle_result = (shuffle_result & SHUFFLE_MASK_NOT[0]) | (((shuffle_result << 8) & SHUFFLE_MASK_L[96+:32]) | ((shuffle_result >> 8) & SHUFFLE_MASK_R[96+:32]));
				if (shuffle_mode[2])
					shuffle_result = (shuffle_result & SHUFFLE_MASK_NOT[1]) | (((shuffle_result << 4) & SHUFFLE_MASK_L[64+:32]) | ((shuffle_result >> 4) & SHUFFLE_MASK_R[64+:32]));
				if (shuffle_mode[1])
					shuffle_result = (shuffle_result & SHUFFLE_MASK_NOT[2]) | (((shuffle_result << 2) & SHUFFLE_MASK_L[32+:32]) | ((shuffle_result >> 2) & SHUFFLE_MASK_R[32+:32]));
				if (shuffle_mode[0])
					shuffle_result = (shuffle_result & SHUFFLE_MASK_NOT[3]) | (((shuffle_result << 1) & SHUFFLE_MASK_L[0+:32]) | ((shuffle_result >> 1) & SHUFFLE_MASK_R[0+:32]));
				if (shuffle_flip)
					shuffle_result = ((((((((shuffle_result & 32'h88224411) | ((shuffle_result << 6) & FLIP_MASK_L[96+:32])) | ((shuffle_result >> 6) & FLIP_MASK_R[96+:32])) | ((shuffle_result << 9) & FLIP_MASK_L[64+:32])) | ((shuffle_result >> 9) & FLIP_MASK_R[64+:32])) | ((shuffle_result << 15) & FLIP_MASK_L[32+:32])) | ((shuffle_result >> 15) & FLIP_MASK_R[32+:32])) | ((shuffle_result << 21) & FLIP_MASK_L[0+:32])) | ((shuffle_result >> 21) & FLIP_MASK_R[0+:32]);
			end
			always @(*) begin
				if (_sv2v_0)
					;
				(* full_case, parallel_case *)
				case (operator_i)
					6'd37: begin
						imd_val_d_o = operand_a_i;
						multicycle_result = (operand_b_i == 32'h00000000 ? operand_a_i : imd_val_q_i);
						if (instr_first_cycle_i)
							imd_val_we_o = 1'b1;
						else
							imd_val_we_o = 1'b0;
					end
					6'd38: begin
						multicycle_result = imd_val_q_i | bwlogic_and_result;
						imd_val_d_o = bwlogic_and_result;
						if (instr_first_cycle_i)
							imd_val_we_o = 1'b1;
						else
							imd_val_we_o = 1'b0;
					end
					6'd40, 6'd39, 6'd14, 6'd13: begin
						if (shift_amt[4:0] == 5'h00)
							multicycle_result = (shift_amt[5] ? operand_a_i : imd_val_q_i);
						else
							multicycle_result = imd_val_q_i | shift_result;
						imd_val_d_o = shift_result;
						if (instr_first_cycle_i)
							imd_val_we_o = 1'b1;
						else
							imd_val_we_o = 1'b0;
					end
					default: begin
						imd_val_d_o = operand_a_i;
						imd_val_we_o = 1'b0;
						multicycle_result = operand_a_i;
					end
				endcase
			end
			always @(*) begin
				if (_sv2v_0)
					;
				(* full_case, parallel_case *)
				case (operator_i)
					6'd41: singlebit_result = operand_a_i | shift_result;
					6'd42: singlebit_result = operand_a_i & ~shift_result;
					6'd43: singlebit_result = operand_a_i ^ shift_result;
					default: singlebit_result = {31'h00000000, shift_result[0]};
				endcase
			end
			assign minmax_result = (cmp_result ? operand_a_i : operand_b_i);
			wire bitcnt_ctz;
			wire bitcnt_pcnt;
			wire [31:0] bitcnt_bits;
			reg [32:0] bitcnt_bit_enable;
			assign bitcnt_ctz = operator_i == 6'd33;
			assign bitcnt_pcnt = operator_i == 6'd34;
			assign bitcnt_bits = (bitcnt_pcnt ? operand_a_i : (bitcnt_ctz ? ~operand_a_i : ~operand_a_rev));
			always @(*) begin
				if (_sv2v_0)
					;
				bitcnt_result = 1'sb0;
				bitcnt_bit_enable = 33'b000000000000000000000000000000001;
				begin : sv2v_autoblock_1
					reg [31:0] i;
					for (i = 0; i < 32; i = i + 1)
						begin : gen_bitcnt_adder
							bitcnt_bit_enable[i + 1] = bitcnt_pcnt || (bitcnt_bit_enable[i] && bitcnt_bits[i]);
							if (bitcnt_bit_enable[i])
								bitcnt_result[5:0] = bitcnt_result[5:0] + {5'h00, bitcnt_bits[i]};
						end
				end
			end
			wire packu;
			wire packh;
			assign packu = operator_i == 6'd30;
			assign packh = operator_i == 6'd31;
			always @(*) begin
				if (_sv2v_0)
					;
				(* full_case, parallel_case *)
				case (1'b1)
					packu: pack_result = {operand_b_i[31:16], operand_a_i[31:16]};
					packh: pack_result = {16'h0000, operand_b_i[7:0], operand_a_i[7:0]};
					default: pack_result = {operand_b_i[15:0], operand_a_i[15:0]};
				endcase
			end
		end
		else begin : g_no_alu_rvb
			assign minmax_result = 1'sb0;
			wire [6:1] sv2v_tmp_76ED8;
			assign sv2v_tmp_76ED8 = 1'sb0;
			always @(*) bitcnt_result = sv2v_tmp_76ED8;
			wire [32:1] sv2v_tmp_A9313;
			assign sv2v_tmp_A9313 = 1'sb0;
			always @(*) pack_result = sv2v_tmp_A9313;
			wire [32:1] sv2v_tmp_34C61;
			assign sv2v_tmp_34C61 = 1'sb0;
			always @(*) multicycle_result = sv2v_tmp_34C61;
			wire [32:1] sv2v_tmp_E7021;
			assign sv2v_tmp_E7021 = 1'sb0;
			always @(*) singlebit_result = sv2v_tmp_E7021;
			wire [32:1] sv2v_tmp_74548;
			assign sv2v_tmp_74548 = 1'sb0;
			always @(*) shuffle_result = sv2v_tmp_74548;
			wire [32:1] sv2v_tmp_03CE8;
			assign sv2v_tmp_03CE8 = 1'sb0;
			always @(*) imd_val_d_o = sv2v_tmp_03CE8;
			wire [1:1] sv2v_tmp_B5668;
			assign sv2v_tmp_B5668 = 1'sb0;
			always @(*) imd_val_we_o = sv2v_tmp_B5668;
		end
	endgenerate
	always @(*) begin
		if (_sv2v_0)
			;
		result_o = 1'sb0;
		(* full_case, parallel_case *)
		case (operator_i)
			6'd2, 6'd5, 6'd3, 6'd6, 6'd4, 6'd7: result_o = bwlogic_result;
			6'd0, 6'd1: result_o = adder_result;
			6'd10, 6'd9, 6'd8, 6'd12, 6'd11, 6'd15, 6'd16: result_o = shift_result;
			6'd17, 6'd18: result_o = shuffle_result;
			6'd23, 6'd24, 6'd21, 6'd22, 6'd19, 6'd20, 6'd35, 6'd36: result_o = {31'h00000000, cmp_result};
			6'd25, 6'd27, 6'd26, 6'd28: result_o = minmax_result;
			6'd32, 6'd33, 6'd34: result_o = {26'h0000000, bitcnt_result};
			6'd29, 6'd31, 6'd30: result_o = pack_result;
			6'd38, 6'd37, 6'd39, 6'd40, 6'd14, 6'd13: result_o = multicycle_result;
			6'd41, 6'd42, 6'd43, 6'd44: result_o = singlebit_result;
			default:
				;
		endcase
	end
	initial _sv2v_0 = 0;
endmodule
