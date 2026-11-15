module ibex_ex_block (
	clk_i,
	rst_ni,
	alu_operator_i,
	alu_operand_a_i,
	alu_operand_b_i,
	jt_mux_sel_i,
	bt_operand_imm_i,
	pc_id_i,
	multdiv_operator_i,
	mult_en_i,
	div_en_i,
	multdiv_sel_i,
	multdiv_signed_mode_i,
	multdiv_operand_a_i,
	multdiv_operand_b_i,
	multdiv_ready_id_i,
	alu_adder_result_ex_o,
	result_ex_o,
	jump_target_o,
	branch_decision_o,
	ex_valid_o
);
	parameter [0:0] RV32M = 1;
	parameter [0:0] BranchTargetALU = 0;
	parameter MultiplierImplementation = "fast";
	input wire clk_i;
	input wire rst_ni;
	input wire [4:0] alu_operator_i;
	input wire [31:0] alu_operand_a_i;
	input wire [31:0] alu_operand_b_i;
	input wire jt_mux_sel_i;
	input wire [11:0] bt_operand_imm_i;
	input wire [31:0] pc_id_i;
	input wire [1:0] multdiv_operator_i;
	input wire mult_en_i;
	input wire div_en_i;
	input wire multdiv_sel_i;
	input wire [1:0] multdiv_signed_mode_i;
	input wire [31:0] multdiv_operand_a_i;
	input wire [31:0] multdiv_operand_b_i;
	input wire multdiv_ready_id_i;
	output wire [31:0] alu_adder_result_ex_o;
	output wire [31:0] result_ex_o;
	output wire [31:0] jump_target_o;
	output wire branch_decision_o;
	output wire ex_valid_o;
	wire [31:0] alu_result;
	wire [31:0] multdiv_result;
	wire [32:0] multdiv_alu_operand_b;
	wire [32:0] multdiv_alu_operand_a;
	wire [33:0] alu_adder_result_ext;
	wire alu_cmp_result;
	wire alu_is_equal_result;
	wire multdiv_valid;
	wire multdiv_en;
	generate
		if (RV32M) begin : gen_multdiv_m
			assign multdiv_en = mult_en_i | div_en_i;
		end
		else begin : gen_multdiv_no_m
			assign multdiv_en = 1'b0;
		end
	endgenerate
	assign result_ex_o = (multdiv_en ? multdiv_result : alu_result);
	assign branch_decision_o = alu_cmp_result;
	generate
		if (BranchTargetALU) begin : g_branch_target_alu
			wire [32:0] bt_alu_result;
			assign bt_alu_result = {{19 {bt_operand_imm_i[11]}}, bt_operand_imm_i, 1'b0} + pc_id_i;
			assign jump_target_o = (jt_mux_sel_i == 1'd0 ? alu_adder_result_ex_o : bt_alu_result[31:0]);
		end
		else begin : g_no_branch_target_alu
			wire unused_jt_mux_sel;
			wire [11:0] unused_bt_operand_imm;
			wire [31:0] unused_pc_id;
			assign unused_jt_mux_sel = jt_mux_sel_i;
			assign unused_bt_operand_imm = bt_operand_imm_i;
			assign unused_pc_id = pc_id_i;
			assign jump_target_o = alu_adder_result_ex_o;
		end
	endgenerate
	ibex_alu alu_i(
		.operator_i(alu_operator_i),
		.operand_a_i(alu_operand_a_i),
		.operand_b_i(alu_operand_b_i),
		.multdiv_operand_a_i(multdiv_alu_operand_a),
		.multdiv_operand_b_i(multdiv_alu_operand_b),
		.multdiv_sel_i(multdiv_sel_i),
		.adder_result_o(alu_adder_result_ex_o),
		.adder_result_ext_o(alu_adder_result_ext),
		.result_o(alu_result),
		.comparison_result_o(alu_cmp_result),
		.is_equal_result_o(alu_is_equal_result)
	);
	generate
		if (MultiplierImplementation == "slow") begin : gen_multdiv_slow
			ibex_multdiv_slow multdiv_i(
				.clk_i(clk_i),
				.rst_ni(rst_ni),
				.mult_en_i(mult_en_i),
				.div_en_i(div_en_i),
				.operator_i(multdiv_operator_i),
				.signed_mode_i(multdiv_signed_mode_i),
				.op_a_i(multdiv_operand_a_i),
				.op_b_i(multdiv_operand_b_i),
				.alu_adder_ext_i(alu_adder_result_ext),
				.alu_adder_i(alu_adder_result_ex_o),
				.equal_to_zero(alu_is_equal_result),
				.valid_o(multdiv_valid),
				.alu_operand_a_o(multdiv_alu_operand_a),
				.alu_operand_b_o(multdiv_alu_operand_b),
				.multdiv_ready_id_i(multdiv_ready_id_i),
				.multdiv_result_o(multdiv_result)
			);
		end
		else if (MultiplierImplementation == "fast") begin : gen_multdiv_fast
			ibex_multdiv_fast #(.SingleCycleMultiply(0)) multdiv_i(
				.clk_i(clk_i),
				.rst_ni(rst_ni),
				.mult_en_i(mult_en_i),
				.div_en_i(div_en_i),
				.operator_i(multdiv_operator_i),
				.signed_mode_i(multdiv_signed_mode_i),
				.op_a_i(multdiv_operand_a_i),
				.op_b_i(multdiv_operand_b_i),
				.alu_operand_a_o(multdiv_alu_operand_a),
				.alu_operand_b_o(multdiv_alu_operand_b),
				.alu_adder_ext_i(alu_adder_result_ext),
				.alu_adder_i(alu_adder_result_ex_o),
				.equal_to_zero(alu_is_equal_result),
				.multdiv_ready_id_i(multdiv_ready_id_i),
				.valid_o(multdiv_valid),
				.multdiv_result_o(multdiv_result)
			);
		end
		else if (MultiplierImplementation == "single-cycle") begin : gen_multdiv_single_cycle
			ibex_multdiv_fast #(.SingleCycleMultiply(1)) multdiv_i(
				.clk_i(clk_i),
				.rst_ni(rst_ni),
				.mult_en_i(mult_en_i),
				.div_en_i(div_en_i),
				.operator_i(multdiv_operator_i),
				.signed_mode_i(multdiv_signed_mode_i),
				.op_a_i(multdiv_operand_a_i),
				.op_b_i(multdiv_operand_b_i),
				.alu_operand_a_o(multdiv_alu_operand_a),
				.alu_operand_b_o(multdiv_alu_operand_b),
				.alu_adder_ext_i(alu_adder_result_ext),
				.alu_adder_i(alu_adder_result_ex_o),
				.equal_to_zero(alu_is_equal_result),
				.multdiv_ready_id_i(multdiv_ready_id_i),
				.valid_o(multdiv_valid),
				.multdiv_result_o(multdiv_result)
			);
		end
	endgenerate
	assign ex_valid_o = (multdiv_en ? multdiv_valid : 1'b1);
endmodule
