module otbn_mac_bignum (
	clk_i,
	rst_ni,
	operation_i,
	mac_en_i,
	mac_commit_i,
	operation_result_o,
	operation_flags_o,
	operation_flags_en_o,
	operation_intg_violation_err_o,
	mac_predec_bignum_i,
	predec_error_o,
	urnd_data_i,
	sec_wipe_acc_urnd_i,
	ispr_acc_intg_o,
	ispr_acc_wr_data_intg_i,
	ispr_acc_wr_en_i
);
	reg _sv2v_0;
	input wire clk_i;
	input wire rst_ni;
	localparam signed [31:0] otbn_pkg_WLEN = 256;
	input wire [(otbn_pkg_WLEN + otbn_pkg_WLEN) + 8:0] operation_i;
	input wire mac_en_i;
	input wire mac_commit_i;
	output wire [255:0] operation_result_o;
	output wire [3:0] operation_flags_o;
	output wire [3:0] operation_flags_en_o;
	output wire operation_intg_violation_err_o;
	input wire [1:0] mac_predec_bignum_i;
	output wire predec_error_o;
	input wire [255:0] urnd_data_i;
	input wire sec_wipe_acc_urnd_i;
	localparam signed [31:0] otbn_pkg_ExtWLEN = 312;
	output wire [311:0] ispr_acc_intg_o;
	input wire [311:0] ispr_acc_wr_data_intg_i;
	input wire ispr_acc_wr_en_i;
	localparam [31:0] QWLEN = 64;
	wire [255:0] adder_op_a;
	wire [255:0] adder_op_b;
	wire [255:0] adder_result;
	wire [1:0] adder_result_hw_is_zero;
	reg [63:0] mul_op_a;
	reg [63:0] mul_op_b;
	wire [127:0] mul_res;
	reg [255:0] mul_res_shifted;
	reg [311:0] acc_intg_d;
	reg [311:0] acc_intg_q;
	wire [255:0] acc_blanked;
	wire acc_en;
	wire [255:0] operand_a_blanked;
	wire [255:0] operand_b_blanked;
	wire expected_acc_rd_en;
	wire expected_op_en;
	prim_blanker #(.Width(otbn_pkg_WLEN)) u_operand_a_blanker(
		.in_i(operation_i[520-:256]),
		.en_i(mac_predec_bignum_i[1]),
		.out_o(operand_a_blanked)
	);
	prim_blanker #(.Width(otbn_pkg_WLEN)) u_operand_b_blanker(
		.in_i(operation_i[264-:256]),
		.en_i(mac_predec_bignum_i[1]),
		.out_o(operand_b_blanked)
	);
	always @(*) begin
		if (_sv2v_0)
			;
		mul_op_a = 1'sb0;
		mul_op_b = 1'sb0;
		(* full_case, parallel_case *)
		case (operation_i[8-:2])
			2'd0: mul_op_a = operand_a_blanked[0+:QWLEN];
			2'd1: mul_op_a = operand_a_blanked[64+:QWLEN];
			2'd2: mul_op_a = operand_a_blanked[128+:QWLEN];
			2'd3: mul_op_a = operand_a_blanked[192+:QWLEN];
			default: mul_op_a = 1'sb0;
		endcase
		(* full_case, parallel_case *)
		case (operation_i[6-:2])
			2'd0: mul_op_b = operand_b_blanked[0+:QWLEN];
			2'd1: mul_op_b = operand_b_blanked[64+:QWLEN];
			2'd2: mul_op_b = operand_b_blanked[128+:QWLEN];
			2'd3: mul_op_b = operand_b_blanked[192+:QWLEN];
			default: mul_op_b = 1'sb0;
		endcase
	end
	assign mul_res = mul_op_a * mul_op_b;
	always @(*) begin
		if (_sv2v_0)
			;
		mul_res_shifted = 1'sb0;
		(* full_case, parallel_case *)
		case (operation_i[3-:2])
			2'd0: mul_res_shifted = {{128 {1'b0}}, mul_res};
			2'd1: mul_res_shifted = {{QWLEN {1'b0}}, mul_res, {QWLEN {1'b0}}};
			2'd2: mul_res_shifted = {mul_res, {128 {1'b0}}};
			2'd3: mul_res_shifted = {mul_res[63:0], {192 {1'b0}}};
			default: mul_res_shifted = 1'sb0;
		endcase
	end
	reg [255:0] acc_no_intg_d;
	wire [255:0] acc_no_intg_q;
	wire [311:0] acc_intg_calc;
	localparam signed [31:0] otbn_pkg_BaseWordsPerWLEN = 8;
	wire [15:0] acc_intg_err;
	genvar _gv_i_word_1;
	generate
		for (_gv_i_word_1 = 0; _gv_i_word_1 < otbn_pkg_BaseWordsPerWLEN; _gv_i_word_1 = _gv_i_word_1 + 1) begin : g_acc_words
			localparam i_word = _gv_i_word_1;
			prim_secded_inv_39_32_enc i_secded_enc(
				.data_i(acc_no_intg_d[i_word * 32+:32]),
				.data_o(acc_intg_calc[i_word * 39+:39])
			);
			prim_secded_inv_39_32_dec i_secded_dec(
				.data_i(acc_intg_q[i_word * 39+:39]),
				.data_o(),
				.syndrome_o(),
				.err_o(acc_intg_err[i_word * 2+:2])
			);
			assign acc_no_intg_q[i_word * 32+:32] = acc_intg_q[i_word * 39+:32];
		end
	endgenerate
	wire acc_used;
	assign acc_used = mac_en_i & ~operation_i[1];
	assign operation_intg_violation_err_o = acc_used & |acc_intg_err;
	prim_blanker #(.Width(otbn_pkg_WLEN)) u_acc_blanker(
		.in_i(acc_no_intg_q),
		.en_i(mac_predec_bignum_i[0]),
		.out_o(acc_blanked)
	);
	assign adder_op_a = mul_res_shifted;
	assign adder_op_b = acc_blanked;
	assign adder_result = adder_op_a + adder_op_b;
	assign adder_result_hw_is_zero[0] = adder_result[127:0] == 'h0;
	assign adder_result_hw_is_zero[1] = adder_result[128+:128] == 'h0;
	assign operation_flags_o[2] = adder_result[0];
	assign operation_flags_en_o[2] = (operation_i[0] ? ~operation_i[4] : 1'b1);
	assign operation_flags_o[1] = (operation_i[0] ? adder_result[127] : adder_result[255]);
	assign operation_flags_en_o[1] = (operation_i[0] ? operation_i[4] : 1'b1);
	assign operation_flags_o[3] = (operation_i[0] ? adder_result_hw_is_zero[0] : &adder_result_hw_is_zero);
	assign operation_flags_en_o[3] = (operation_i[0] & operation_i[4] ? ~adder_result_hw_is_zero[0] : 1'b1);
	assign operation_flags_o[0] = 1'b0;
	assign operation_flags_en_o[0] = 1'b0;
	always @(*) begin
		if (_sv2v_0)
			;
		acc_no_intg_d = 1'sb0;
		(* full_case, parallel_case *)
		case (1'b1)
			sec_wipe_acc_urnd_i: begin
				acc_no_intg_d = urnd_data_i;
				acc_intg_d = acc_intg_calc;
			end
			default:
				if (ispr_acc_wr_en_i)
					acc_intg_d = ispr_acc_wr_data_intg_i;
				else begin
					acc_no_intg_d = (operation_i[0] ? {{128 {1'b0}}, adder_result[128+:128]} : adder_result);
					acc_intg_d = acc_intg_calc;
				end
		endcase
	end
	assign acc_en = ((mac_en_i & mac_commit_i) | ispr_acc_wr_en_i) | sec_wipe_acc_urnd_i;
	localparam signed [31:0] otbn_pkg_BaseIntgWidth = 39;
	localparam [38:0] prim_secded_pkg_SecdedInv3932ZeroWord = 39'h2a00000000;
	localparam [38:0] otbn_pkg_EccZeroWord = prim_secded_pkg_SecdedInv3932ZeroWord;
	localparam [311:0] otbn_pkg_EccWideZeroWord = {otbn_pkg_BaseWordsPerWLEN {otbn_pkg_EccZeroWord}};
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni)
			acc_intg_q <= otbn_pkg_EccWideZeroWord;
		else if (acc_en)
			acc_intg_q <= acc_intg_d;
	assign ispr_acc_intg_o = acc_intg_q;
	assign operation_result_o = adder_result;
	assign expected_op_en = mac_en_i;
	assign expected_acc_rd_en = ~operation_i[1] & mac_en_i;
	assign predec_error_o = |{expected_op_en != mac_predec_bignum_i[1], expected_acc_rd_en != mac_predec_bignum_i[0]};
	initial _sv2v_0 = 0;
endmodule
