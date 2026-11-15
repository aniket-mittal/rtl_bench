module ibex_alu (
	operator_i,
	operand_a_i,
	operand_b_i,
	multdiv_operand_a_i,
	multdiv_operand_b_i,
	multdiv_sel_i,
	adder_result_o,
	adder_result_ext_o,
	result_o,
	comparison_result_o,
	is_equal_result_o
);
	reg _sv2v_0;
	input wire [4:0] operator_i;
	input wire [31:0] operand_a_i;
	input wire [31:0] operand_b_i;
	input wire [32:0] multdiv_operand_a_i;
	input wire [32:0] multdiv_operand_b_i;
	input wire multdiv_sel_i;
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
	wire [32:0] adder_in_b;
	wire [31:0] adder_result;
	always @(*) begin
		if (_sv2v_0)
			;
		adder_op_b_negate = 1'b0;
		(* full_case, parallel_case *)
		case (operator_i)
			5'd1, 5'd12, 5'd13, 5'd10, 5'd11, 5'd8, 5'd9, 5'd14, 5'd15: adder_op_b_negate = 1'b1;
			default:
				;
		endcase
	end
	assign adder_in_a = (multdiv_sel_i ? multdiv_operand_a_i : {operand_a_i, 1'b1});
	assign operand_b_neg = {operand_b_i, 1'b0} ^ {33 {adder_op_b_negate}};
	assign adder_in_b = (multdiv_sel_i ? multdiv_operand_b_i : operand_b_neg);
	assign adder_result_ext_o = $unsigned(adder_in_a) + $unsigned(adder_in_b);
	assign adder_result = adder_result_ext_o[32:1];
	assign adder_result_o = adder_result;
	wire shift_left;
	wire shift_arithmetic;
	wire [4:0] shift_amt;
	wire [31:0] shift_op_a;
	wire [31:0] shift_result;
	wire [31:0] shift_right_result;
	wire [31:0] shift_left_result;
	assign shift_amt = operand_b_i[4:0];
	assign shift_left = operator_i == 5'd7;
	assign shift_arithmetic = operator_i == 5'd5;
	assign shift_op_a = (shift_left ? operand_a_rev : operand_a_i);
	wire [32:0] shift_op_a_32;
	assign shift_op_a_32 = {shift_arithmetic & shift_op_a[31], shift_op_a};
	wire signed [32:0] shift_right_result_signed;
	wire [32:0] shift_right_result_ext;
	assign shift_right_result_signed = $signed(shift_op_a_32) >>> shift_amt[4:0];
	assign shift_right_result_ext = $unsigned(shift_right_result_signed);
	assign shift_right_result = shift_right_result_ext[31:0];
	genvar _gv_j_1;
	generate
		for (_gv_j_1 = 0; _gv_j_1 < 32; _gv_j_1 = _gv_j_1 + 1) begin : gen_rev_shift_right_result
			localparam j = _gv_j_1;
			assign shift_left_result[j] = shift_right_result[31 - j];
		end
	endgenerate
	assign shift_result = (shift_left ? shift_left_result : shift_right_result);
	wire is_equal;
	reg is_greater_equal;
	reg cmp_signed;
	always @(*) begin
		if (_sv2v_0)
			;
		cmp_signed = 1'b0;
		(* full_case, parallel_case *)
		case (operator_i)
			5'd10, 5'd8, 5'd14: cmp_signed = 1'b1;
			default:
				;
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
		cmp_result = is_equal;
		(* full_case, parallel_case *)
		case (operator_i)
			5'd12: cmp_result = is_equal;
			5'd13: cmp_result = ~is_equal;
			5'd10, 5'd11: cmp_result = is_greater_equal;
			5'd8, 5'd9, 5'd14, 5'd15: cmp_result = ~is_greater_equal;
			default:
				;
		endcase
	end
	assign comparison_result_o = cmp_result;
	always @(*) begin
		if (_sv2v_0)
			;
		result_o = 1'sb0;
		(* full_case, parallel_case *)
		case (operator_i)
			5'd4: result_o = operand_a_i & operand_b_i;
			5'd3: result_o = operand_a_i | operand_b_i;
			5'd2: result_o = operand_a_i ^ operand_b_i;
			5'd0, 5'd1: result_o = adder_result;
			5'd7, 5'd6, 5'd5: result_o = shift_result;
			5'd12, 5'd13, 5'd10, 5'd11, 5'd8, 5'd9, 5'd14, 5'd15: result_o = {31'h00000000, cmp_result};
			default:
				;
		endcase
	end
	initial _sv2v_0 = 0;
endmodule
