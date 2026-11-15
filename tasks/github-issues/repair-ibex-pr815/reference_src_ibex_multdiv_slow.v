module ibex_multdiv_slow (
	clk_i,
	rst_ni,
	mult_en_i,
	div_en_i,
	mult_sel_i,
	div_sel_i,
	operator_i,
	signed_mode_i,
	op_a_i,
	op_b_i,
	alu_adder_ext_i,
	alu_adder_i,
	equal_to_zero,
	alu_operand_a_o,
	alu_operand_b_o,
	imd_val_q_i,
	imd_val_d_o,
	imd_val_we_o,
	multdiv_ready_id_i,
	multdiv_result_o,
	valid_o
);
	reg _sv2v_0;
	input wire clk_i;
	input wire rst_ni;
	input wire mult_en_i;
	input wire div_en_i;
	input wire mult_sel_i;
	input wire div_sel_i;
	input wire [1:0] operator_i;
	input wire [1:0] signed_mode_i;
	input wire [31:0] op_a_i;
	input wire [31:0] op_b_i;
	input wire [33:0] alu_adder_ext_i;
	input wire [31:0] alu_adder_i;
	input wire equal_to_zero;
	output reg [32:0] alu_operand_a_o;
	output reg [32:0] alu_operand_b_o;
	input wire [33:0] imd_val_q_i;
	output wire [33:0] imd_val_d_o;
	output wire imd_val_we_o;
	input wire multdiv_ready_id_i;
	output reg [31:0] multdiv_result_o;
	output wire valid_o;
	reg [4:0] multdiv_state_q;
	reg [4:0] multdiv_state_d;
	wire [4:0] multdiv_state_m1;
	reg [2:0] md_state_q;
	reg [2:0] md_state_d;
	wire [32:0] accum_window_q;
	reg [32:0] accum_window_d;
	wire [32:0] res_adder_l;
	wire [32:0] res_adder_h;
	reg [32:0] op_b_shift_q;
	reg [32:0] op_b_shift_d;
	reg [32:0] op_a_shift_q;
	reg [32:0] op_a_shift_d;
	wire [32:0] op_a_ext;
	wire [32:0] op_b_ext;
	wire [32:0] one_shift;
	wire [32:0] op_a_bw_pp;
	wire [32:0] op_a_bw_last_pp;
	wire [31:0] b_0;
	wire sign_a;
	wire sign_b;
	wire [32:0] next_reminder;
	wire [32:0] next_quotient;
	wire [32:0] op_remainder;
	reg [31:0] op_numerator_q;
	reg [31:0] op_numerator_d;
	wire is_greater_equal;
	wire div_change_sign;
	wire rem_change_sign;
	reg multdiv_hold;
	assign res_adder_l = alu_adder_ext_i[32:0];
	assign res_adder_h = alu_adder_ext_i[33:1];
	assign imd_val_d_o = accum_window_d;
	assign imd_val_we_o = ~multdiv_hold;
	assign accum_window_q = imd_val_q_i;
	always @(*) begin
		if (_sv2v_0)
			;
		alu_operand_a_o = accum_window_q;
		multdiv_result_o = (div_sel_i ? accum_window_q[31:0] : res_adder_l);
		(* full_case, parallel_case *)
		case (operator_i)
			2'd0: alu_operand_b_o = op_a_bw_pp;
			2'd1: alu_operand_b_o = (md_state_q == 3'd4 ? op_a_bw_last_pp : op_a_bw_pp);
			default:
				(* full_case, parallel_case *)
				case (md_state_q)
					3'd0: begin
						alu_operand_a_o = 33'h000000001;
						alu_operand_b_o = {~op_b_i, 1'b1};
					end
					3'd1: begin
						alu_operand_a_o = 33'h000000001;
						alu_operand_b_o = {~op_a_i, 1'b1};
					end
					3'd2: begin
						alu_operand_a_o = 33'h000000001;
						alu_operand_b_o = {~op_b_i, 1'b1};
					end
					3'd5: begin
						alu_operand_a_o = 33'h000000001;
						alu_operand_b_o = {~accum_window_q[31:0], 1'b1};
					end
					default: begin
						alu_operand_a_o = {accum_window_q[31:0], 1'b1};
						alu_operand_b_o = {~op_b_shift_q[31:0], 1'b1};
					end
				endcase
		endcase
	end
	assign is_greater_equal = ((accum_window_q[31] ^ op_b_shift_q[31]) == 1'b0 ? res_adder_h[31] == 1'b0 : accum_window_q[31]);
	assign one_shift = 33'b000000000000000000000000000000001 << multdiv_state_q;
	assign next_reminder = (is_greater_equal ? res_adder_h : op_remainder);
	assign next_quotient = (is_greater_equal ? op_a_shift_q | one_shift : op_a_shift_q);
	assign b_0 = {32 {op_b_shift_q[0]}};
	assign op_a_bw_pp = {~(op_a_shift_q[32] & op_b_shift_q[0]), op_a_shift_q[31:0] & b_0};
	assign op_a_bw_last_pp = {op_a_shift_q[32] & op_b_shift_q[0], ~(op_a_shift_q[31:0] & b_0)};
	assign sign_a = op_a_i[31] & signed_mode_i[0];
	assign sign_b = op_b_i[31] & signed_mode_i[1];
	assign op_a_ext = {sign_a, op_a_i};
	assign op_b_ext = {sign_b, op_b_i};
	assign op_remainder = accum_window_q[32:0];
	assign multdiv_state_m1 = multdiv_state_q - 5'h01;
	assign div_change_sign = sign_a ^ sign_b;
	assign rem_change_sign = sign_a;
	always @(posedge clk_i or negedge rst_ni) begin : proc_multdiv_state_q
		if (!rst_ni) begin
			multdiv_state_q <= 5'h00;
			op_b_shift_q <= 33'h000000000;
			op_a_shift_q <= 33'h000000000;
			op_numerator_q <= 32'h00000000;
			md_state_q <= 3'd0;
		end
		else if ((mult_en_i || div_en_i) && !multdiv_hold) begin
			multdiv_state_q <= multdiv_state_d;
			op_b_shift_q <= op_b_shift_d;
			op_a_shift_q <= op_a_shift_d;
			op_numerator_q <= op_numerator_d;
			md_state_q <= md_state_d;
		end
	end
	always @(*) begin
		if (_sv2v_0)
			;
		multdiv_state_d = multdiv_state_q;
		accum_window_d = accum_window_q;
		op_b_shift_d = op_b_shift_q;
		op_a_shift_d = op_a_shift_q;
		op_numerator_d = op_numerator_q;
		md_state_d = md_state_q;
		multdiv_hold = 1'b0;
		if (mult_sel_i || div_sel_i)
			(* full_case, parallel_case *)
			case (md_state_q)
				3'd0: begin
					(* full_case, parallel_case *)
					case (operator_i)
						2'd0: begin
							op_a_shift_d = op_a_ext << 1;
							accum_window_d = {~(op_a_ext[32] & op_b_i[0]), op_a_ext[31:0] & {32 {op_b_i[0]}}};
							op_b_shift_d = op_b_ext >> 1;
							md_state_d = (!(op_b_ext >> 1) ? 3'd4 : 3'd3);
						end
						2'd1: begin
							op_a_shift_d = op_a_ext;
							accum_window_d = {1'b1, ~(op_a_ext[32] & op_b_i[0]), op_a_ext[31:1] & {31 {op_b_i[0]}}};
							op_b_shift_d = op_b_ext >> 1;
							md_state_d = 3'd3;
						end
						2'd2: begin
							accum_window_d = {33 {1'b1}};
							md_state_d = (equal_to_zero ? 3'd6 : 3'd1);
						end
						default: begin
							accum_window_d = op_a_ext;
							md_state_d = (equal_to_zero ? 3'd6 : 3'd1);
						end
					endcase
					multdiv_state_d = 5'd31;
				end
				3'd1: begin
					op_a_shift_d = 1'sb0;
					op_numerator_d = (sign_a ? alu_adder_i : op_a_i);
					md_state_d = 3'd2;
				end
				3'd2: begin
					accum_window_d = {32'h00000000, op_numerator_q[31]};
					op_b_shift_d = (sign_b ? alu_adder_i : op_b_i);
					md_state_d = 3'd3;
				end
				3'd3: begin
					multdiv_state_d = multdiv_state_m1;
					(* full_case, parallel_case *)
					case (operator_i)
						2'd0: begin
							accum_window_d = res_adder_l;
							op_a_shift_d = op_a_shift_q << 1;
							op_b_shift_d = op_b_shift_q >> 1;
							md_state_d = (!(op_b_shift_q >> 1) ? 3'd4 : 3'd3);
						end
						2'd1: begin
							accum_window_d = res_adder_h;
							op_a_shift_d = op_a_shift_q;
							op_b_shift_d = op_b_shift_q >> 1;
							md_state_d = (multdiv_state_q == 5'd1 ? 3'd4 : 3'd3);
						end
						default: begin
							accum_window_d = {next_reminder[31:0], op_numerator_q[multdiv_state_m1]};
							op_a_shift_d = next_quotient;
							md_state_d = (multdiv_state_q == 5'd1 ? 3'd4 : 3'd3);
						end
					endcase
				end
				3'd4:
					(* full_case, parallel_case *)
					case (operator_i)
						2'd0: begin
							accum_window_d = res_adder_l;
							md_state_d = 3'd0;
							multdiv_hold = ~multdiv_ready_id_i;
						end
						2'd1: begin
							accum_window_d = res_adder_l;
							md_state_d = 3'd0;
							md_state_d = 3'd0;
							multdiv_hold = ~multdiv_ready_id_i;
						end
						2'd2: begin
							accum_window_d = next_quotient;
							md_state_d = 3'd5;
						end
						default: begin
							accum_window_d = {1'b0, next_reminder[31:0]};
							md_state_d = 3'd5;
						end
					endcase
				3'd5: begin
					md_state_d = 3'd6;
					(* full_case, parallel_case *)
					case (operator_i)
						2'd2: accum_window_d = (div_change_sign ? alu_adder_i : accum_window_q);
						default: accum_window_d = (rem_change_sign ? alu_adder_i : accum_window_q);
					endcase
				end
				3'd6: begin
					md_state_d = 3'd0;
					multdiv_hold = ~multdiv_ready_id_i;
				end
				default: md_state_d = 3'd0;
			endcase
	end
	assign valid_o = (md_state_q == 3'd6) | ((md_state_q == 3'd4) & ((operator_i == 2'd0) | (operator_i == 2'd1)));
	initial _sv2v_0 = 0;
endmodule
