module ibex_decoder (
	illegal_insn_o,
	ebrk_insn_o,
	mret_insn_o,
	dret_insn_o,
	ecall_insn_o,
	wfi_insn_o,
	jump_set_o,
	instr_new_i,
	instr_rdata_i,
	illegal_c_insn_i,
	imm_a_mux_sel_o,
	imm_b_mux_sel_o,
	imm_i_type_o,
	imm_s_type_o,
	imm_b_type_o,
	imm_u_type_o,
	imm_j_type_o,
	zimm_rs1_type_o,
	regfile_wdata_sel_o,
	regfile_we_o,
	regfile_raddr_a_o,
	regfile_raddr_b_o,
	regfile_waddr_o,
	alu_operator_o,
	alu_op_a_mux_sel_o,
	alu_op_b_mux_sel_o,
	mult_en_o,
	div_en_o,
	multdiv_operator_o,
	multdiv_signed_mode_o,
	csr_access_o,
	csr_op_o,
	csr_pipe_flush_o,
	data_req_o,
	data_we_o,
	data_type_o,
	data_sign_extension_o,
	data_reg_offset_o,
	jump_in_dec_o,
	branch_in_dec_o
);
	reg _sv2v_0;
	parameter [0:0] RV32E = 0;
	parameter [0:0] RV32M = 1;
	output wire illegal_insn_o;
	output reg ebrk_insn_o;
	output reg mret_insn_o;
	output reg dret_insn_o;
	output reg ecall_insn_o;
	output reg wfi_insn_o;
	output reg jump_set_o;
	input wire instr_new_i;
	input wire [31:0] instr_rdata_i;
	input wire illegal_c_insn_i;
	output reg imm_a_mux_sel_o;
	output reg [2:0] imm_b_mux_sel_o;
	output wire [31:0] imm_i_type_o;
	output wire [31:0] imm_s_type_o;
	output wire [31:0] imm_b_type_o;
	output wire [31:0] imm_u_type_o;
	output wire [31:0] imm_j_type_o;
	output wire [31:0] zimm_rs1_type_o;
	output reg [1:0] regfile_wdata_sel_o;
	output wire regfile_we_o;
	output wire [4:0] regfile_raddr_a_o;
	output wire [4:0] regfile_raddr_b_o;
	output wire [4:0] regfile_waddr_o;
	output reg [4:0] alu_operator_o;
	output reg [1:0] alu_op_a_mux_sel_o;
	output reg alu_op_b_mux_sel_o;
	output reg mult_en_o;
	output reg div_en_o;
	output reg [1:0] multdiv_operator_o;
	output reg [1:0] multdiv_signed_mode_o;
	output reg csr_access_o;
	output reg [1:0] csr_op_o;
	output reg csr_pipe_flush_o;
	output reg data_req_o;
	output reg data_we_o;
	output reg [1:0] data_type_o;
	output reg data_sign_extension_o;
	output reg [1:0] data_reg_offset_o;
	output reg jump_in_dec_o;
	output reg branch_in_dec_o;
	reg illegal_insn;
	wire illegal_reg_rv32e;
	reg csr_illegal;
	reg regfile_we;
	wire [31:0] instr;
	reg [1:0] csr_op;
	reg [6:0] opcode;
	assign instr = instr_rdata_i;
	assign imm_i_type_o = {{20 {instr[31]}}, instr[31:20]};
	assign imm_s_type_o = {{20 {instr[31]}}, instr[31:25], instr[11:7]};
	assign imm_b_type_o = {{19 {instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
	assign imm_u_type_o = {instr[31:12], 12'b000000000000};
	assign imm_j_type_o = {{12 {instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0};
	assign zimm_rs1_type_o = {27'b000000000000000000000000000, instr[19:15]};
	assign regfile_raddr_a_o = instr[19:15];
	assign regfile_raddr_b_o = instr[24:20];
	assign regfile_waddr_o = instr[11:7];
	generate
		if (RV32E) begin : gen_rv32e_reg_check_active
			assign illegal_reg_rv32e = ((regfile_raddr_a_o[4] & (alu_op_a_mux_sel_o == 2'd0)) | (regfile_raddr_b_o[4] & (alu_op_b_mux_sel_o == 1'd0))) | (regfile_waddr_o[4] & regfile_we);
		end
		else begin : gen_rv32e_reg_check_inactive
			assign illegal_reg_rv32e = 1'b0;
		end
	endgenerate
	always @(*) begin : csr_operand_check
		if (_sv2v_0)
			;
		csr_op_o = csr_op;
		if (((csr_op == 2'd2) || (csr_op == 2'd3)) && (instr[19:15] == {5 {1'sb0}}))
			csr_op_o = 2'd0;
	end
	always @(*) begin : csr_pipeline_flushes
		if (_sv2v_0)
			;
		csr_pipe_flush_o = 1'b0;
		if ((csr_access_o == 1'b1) && ((csr_op_o == 2'd1) || (csr_op_o == 2'd2))) begin
			if ((instr[31:20] == 12'h300) || (instr[31:20] == 12'h304))
				csr_pipe_flush_o = 1'b1;
		end
		else if ((csr_access_o == 1'b1) && (csr_op_o != 2'd0)) begin
			if ((((instr[31:20] == 12'h7b0) || (instr[31:20] == 12'h7b1)) || (instr[31:20] == 12'h7b2)) || (instr[31:20] == 12'h7b3))
				csr_pipe_flush_o = 1'b1;
		end
	end
	always @(*) begin
		if (_sv2v_0)
			;
		jump_in_dec_o = 1'b0;
		jump_set_o = 1'b0;
		branch_in_dec_o = 1'b0;
		alu_operator_o = 5'd19;
		alu_op_a_mux_sel_o = 2'd3;
		alu_op_b_mux_sel_o = 1'd1;
		imm_a_mux_sel_o = 1'd1;
		imm_b_mux_sel_o = 3'd0;
		mult_en_o = 1'b0;
		div_en_o = 1'b0;
		multdiv_operator_o = 2'd0;
		multdiv_signed_mode_o = 2'b00;
		regfile_wdata_sel_o = 2'd1;
		regfile_we = 1'b0;
		csr_access_o = 1'b0;
		csr_illegal = 1'b0;
		csr_op = 2'd0;
		data_we_o = 1'b0;
		data_type_o = 2'b00;
		data_sign_extension_o = 1'b0;
		data_reg_offset_o = 2'b00;
		data_req_o = 1'b0;
		illegal_insn = 1'b0;
		ebrk_insn_o = 1'b0;
		mret_insn_o = 1'b0;
		dret_insn_o = 1'b0;
		ecall_insn_o = 1'b0;
		wfi_insn_o = 1'b0;
		opcode = instr[6:0];
		(* full_case, parallel_case *)
		case (opcode)
			7'h6f: begin
				jump_in_dec_o = 1'b1;
				if (instr_new_i) begin
					alu_op_a_mux_sel_o = 2'd2;
					alu_op_b_mux_sel_o = 1'd1;
					imm_b_mux_sel_o = 3'd4;
					alu_operator_o = 5'd0;
					regfile_we = 1'b0;
					jump_set_o = 1'b1;
				end
				else begin
					alu_op_a_mux_sel_o = 2'd2;
					alu_op_b_mux_sel_o = 1'd1;
					imm_b_mux_sel_o = 3'd5;
					alu_operator_o = 5'd0;
					regfile_we = 1'b1;
				end
			end
			7'h67: begin
				jump_in_dec_o = 1'b1;
				if (instr_new_i) begin
					alu_op_a_mux_sel_o = 2'd0;
					alu_op_b_mux_sel_o = 1'd1;
					imm_b_mux_sel_o = 3'd0;
					alu_operator_o = 5'd0;
					regfile_we = 1'b0;
					jump_set_o = 1'b1;
				end
				else begin
					alu_op_a_mux_sel_o = 2'd2;
					alu_op_b_mux_sel_o = 1'd1;
					imm_b_mux_sel_o = 3'd5;
					alu_operator_o = 5'd0;
					regfile_we = 1'b1;
				end
				if (instr[14:12] != 3'b000)
					illegal_insn = 1'b1;
			end
			7'h63: begin
				branch_in_dec_o = 1'b1;
				(* full_case, parallel_case *)
				case (instr[14:12])
					3'b000: alu_operator_o = 5'd16;
					3'b001: alu_operator_o = 5'd17;
					3'b100: alu_operator_o = 5'd8;
					3'b101: alu_operator_o = 5'd14;
					3'b110: alu_operator_o = 5'd9;
					3'b111: alu_operator_o = 5'd15;
					default: illegal_insn = 1'b1;
				endcase
				if (instr_new_i) begin
					alu_op_a_mux_sel_o = 2'd0;
					alu_op_b_mux_sel_o = 1'd0;
				end
				else begin
					alu_op_a_mux_sel_o = 2'd2;
					alu_op_b_mux_sel_o = 1'd1;
					imm_b_mux_sel_o = 3'd2;
					alu_operator_o = 5'd0;
					regfile_we = 1'b0;
				end
			end
			7'h23: begin
				alu_op_a_mux_sel_o = 2'd0;
				alu_op_b_mux_sel_o = 1'd0;
				data_req_o = 1'b1;
				data_we_o = 1'b1;
				alu_operator_o = 5'd0;
				if (!instr[14]) begin
					imm_b_mux_sel_o = 3'd1;
					alu_op_b_mux_sel_o = 1'd1;
				end
				else
					illegal_insn = 1'b1;
				(* full_case, parallel_case *)
				case (instr[13:12])
					2'b00: data_type_o = 2'b10;
					2'b01: data_type_o = 2'b01;
					2'b10: data_type_o = 2'b00;
					default: illegal_insn = 1'b1;
				endcase
			end
			7'h03: begin
				alu_op_a_mux_sel_o = 2'd0;
				data_req_o = 1'b1;
				regfile_wdata_sel_o = 2'd0;
				regfile_we = 1'b1;
				data_type_o = 2'b00;
				alu_operator_o = 5'd0;
				alu_op_b_mux_sel_o = 1'd1;
				imm_b_mux_sel_o = 3'd0;
				data_sign_extension_o = ~instr[14];
				(* full_case, parallel_case *)
				case (instr[13:12])
					2'b00: data_type_o = 2'b10;
					2'b01: data_type_o = 2'b01;
					2'b10: begin
						data_type_o = 2'b00;
						if (instr[14])
							illegal_insn = 1'b1;
					end
					default: illegal_insn = 1'b1;
				endcase
			end
			7'h37: begin
				alu_op_a_mux_sel_o = 2'd3;
				alu_op_b_mux_sel_o = 1'd1;
				imm_a_mux_sel_o = 1'd1;
				imm_b_mux_sel_o = 3'd3;
				alu_operator_o = 5'd0;
				regfile_we = 1'b1;
			end
			7'h17: begin
				alu_op_a_mux_sel_o = 2'd2;
				alu_op_b_mux_sel_o = 1'd1;
				imm_b_mux_sel_o = 3'd3;
				alu_operator_o = 5'd0;
				regfile_we = 1'b1;
			end
			7'h13: begin
				alu_op_a_mux_sel_o = 2'd0;
				alu_op_b_mux_sel_o = 1'd1;
				imm_b_mux_sel_o = 3'd0;
				regfile_we = 1'b1;
				(* full_case, parallel_case *)
				case (instr[14:12])
					3'b000: alu_operator_o = 5'd0;
					3'b010: alu_operator_o = 5'd18;
					3'b011: alu_operator_o = 5'd19;
					3'b100: alu_operator_o = 5'd2;
					3'b110: alu_operator_o = 5'd3;
					3'b111: alu_operator_o = 5'd4;
					3'b001: begin
						alu_operator_o = 5'd7;
						if (instr[31:25] != 7'b0000000)
							illegal_insn = 1'b1;
					end
					3'b101:
						if (instr[31:25] == 7'b0000000)
							alu_operator_o = 5'd6;
						else if (instr[31:25] == 7'b0100000)
							alu_operator_o = 5'd5;
						else
							illegal_insn = 1'b1;
					default: alu_operator_o = {5 {1'bx}};
				endcase
			end
			7'h33: begin
				alu_op_a_mux_sel_o = 2'd0;
				alu_op_b_mux_sel_o = 1'd0;
				regfile_we = 1'b1;
				if (instr[31])
					illegal_insn = 1'b1;
				else
					(* full_case, parallel_case *)
					case ({instr[30:25], instr[14:12]})
						9'b000000000: alu_operator_o = 5'd0;
						9'b100000000: alu_operator_o = 5'd1;
						9'b000000010: alu_operator_o = 5'd18;
						9'b000000011: alu_operator_o = 5'd19;
						9'b000000100: alu_operator_o = 5'd2;
						9'b000000110: alu_operator_o = 5'd3;
						9'b000000111: alu_operator_o = 5'd4;
						9'b000000001: alu_operator_o = 5'd7;
						9'b000000101: alu_operator_o = 5'd6;
						9'b100000101: alu_operator_o = 5'd5;
						9'b000001000: begin
							alu_operator_o = 5'd0;
							multdiv_operator_o = 2'd0;
							mult_en_o = (RV32M ? 1'b1 : 1'b0);
							multdiv_signed_mode_o = 2'b00;
							illegal_insn = (RV32M ? 1'b0 : 1'b1);
						end
						9'b000001001: begin
							alu_operator_o = 5'd0;
							multdiv_operator_o = 2'd1;
							mult_en_o = (RV32M ? 1'b1 : 1'b0);
							multdiv_signed_mode_o = 2'b11;
							illegal_insn = (RV32M ? 1'b0 : 1'b1);
						end
						9'b000001010: begin
							alu_operator_o = 5'd0;
							multdiv_operator_o = 2'd1;
							mult_en_o = (RV32M ? 1'b1 : 1'b0);
							multdiv_signed_mode_o = 2'b01;
							illegal_insn = (RV32M ? 1'b0 : 1'b1);
						end
						9'b000001011: begin
							alu_operator_o = 5'd0;
							multdiv_operator_o = 2'd1;
							mult_en_o = (RV32M ? 1'b1 : 1'b0);
							multdiv_signed_mode_o = 2'b00;
							illegal_insn = (RV32M ? 1'b0 : 1'b1);
						end
						9'b000001100: begin
							alu_operator_o = 5'd0;
							multdiv_operator_o = 2'd2;
							div_en_o = (RV32M ? 1'b1 : 1'b0);
							multdiv_signed_mode_o = 2'b11;
							illegal_insn = (RV32M ? 1'b0 : 1'b1);
						end
						9'b000001101: begin
							alu_operator_o = 5'd0;
							multdiv_operator_o = 2'd2;
							div_en_o = (RV32M ? 1'b1 : 1'b0);
							multdiv_signed_mode_o = 2'b00;
							illegal_insn = (RV32M ? 1'b0 : 1'b1);
						end
						9'b000001110: begin
							alu_operator_o = 5'd0;
							multdiv_operator_o = 2'd3;
							div_en_o = (RV32M ? 1'b1 : 1'b0);
							multdiv_signed_mode_o = 2'b11;
							illegal_insn = (RV32M ? 1'b0 : 1'b1);
						end
						9'b000001111: begin
							alu_operator_o = 5'd0;
							multdiv_operator_o = 2'd3;
							div_en_o = (RV32M ? 1'b1 : 1'b0);
							multdiv_signed_mode_o = 2'b00;
							illegal_insn = (RV32M ? 1'b0 : 1'b1);
						end
						default: illegal_insn = 1'b1;
					endcase
			end
			7'h0f:
				if (instr[14:12] == 3'b000) begin
					alu_operator_o = 5'd0;
					alu_op_a_mux_sel_o = 2'd0;
					alu_op_b_mux_sel_o = 1'd1;
					regfile_we = 1'b0;
				end
				else
					illegal_insn = 1'b1;
			7'h73:
				if (instr[14:12] == 3'b000) begin
					alu_op_a_mux_sel_o = 2'd0;
					alu_op_b_mux_sel_o = 1'd1;
					(* full_case, parallel_case *)
					case (instr[31:20])
						12'h000: ecall_insn_o = 1'b1;
						12'h001: ebrk_insn_o = 1'b1;
						12'h302: mret_insn_o = 1'b1;
						12'h7b2: dret_insn_o = 1'b1;
						12'h105: wfi_insn_o = 1'b1;
						default: illegal_insn = 1'b1;
					endcase
					if ((instr[19:15] != 5'b00000) || (instr[11:7] != 5'b00000))
						illegal_insn = 1'b1;
				end
				else begin
					csr_access_o = 1'b1;
					regfile_wdata_sel_o = 2'd2;
					regfile_we = 1'b1;
					alu_op_b_mux_sel_o = 1'd1;
					imm_a_mux_sel_o = 1'd0;
					imm_b_mux_sel_o = 3'd0;
					if (instr[14])
						alu_op_a_mux_sel_o = 2'd3;
					else
						alu_op_a_mux_sel_o = 2'd0;
					(* full_case, parallel_case *)
					case (instr[13:12])
						2'b01: csr_op = 2'd1;
						2'b10: csr_op = 2'd2;
						2'b11: csr_op = 2'd3;
						default: csr_illegal = 1'b1;
					endcase
					illegal_insn = csr_illegal;
				end
			default: illegal_insn = 1'b1;
		endcase
		if (illegal_c_insn_i)
			illegal_insn = 1'b1;
		if (illegal_insn) begin
			regfile_we = 1'b0;
			data_req_o = 1'b0;
			data_we_o = 1'b0;
			mult_en_o = 1'b0;
			div_en_o = 1'b0;
			jump_in_dec_o = 1'b0;
			jump_set_o = 1'b0;
			branch_in_dec_o = 1'b0;
			csr_access_o = 1'b0;
		end
	end
	assign illegal_insn_o = illegal_insn | illegal_reg_rv32e;
	assign regfile_we_o = regfile_we & ~illegal_reg_rv32e;
	initial _sv2v_0 = 0;
endmodule
