// Hidden tests: 5000 cycles of seeded random inputs (seed 2749215719); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 248;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [0:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  ibex_decoder dut (
    .instr_new_i(i_0),
    .instr_rdata_i(i_1),
    .illegal_c_insn_i(i_2),
    .illegal_insn_o(out_dut[247:247]),
    .ebrk_insn_o(out_dut[246:246]),
    .mret_insn_o(out_dut[245:245]),
    .dret_insn_o(out_dut[244:244]),
    .ecall_insn_o(out_dut[243:243]),
    .wfi_insn_o(out_dut[242:242]),
    .jump_set_o(out_dut[241:241]),
    .imm_a_mux_sel_o(out_dut[240:240]),
    .imm_b_mux_sel_o(out_dut[239:237]),
    .imm_i_type_o(out_dut[236:205]),
    .imm_s_type_o(out_dut[204:173]),
    .imm_b_type_o(out_dut[172:141]),
    .imm_u_type_o(out_dut[140:109]),
    .imm_j_type_o(out_dut[108:77]),
    .zimm_rs1_type_o(out_dut[76:45]),
    .regfile_wdata_sel_o(out_dut[44:43]),
    .regfile_we_o(out_dut[42:42]),
    .regfile_raddr_a_o(out_dut[41:37]),
    .regfile_raddr_b_o(out_dut[36:32]),
    .regfile_waddr_o(out_dut[31:27]),
    .alu_operator_o(out_dut[26:22]),
    .alu_op_a_mux_sel_o(out_dut[21:20]),
    .alu_op_b_mux_sel_o(out_dut[19:19]),
    .mult_en_o(out_dut[18:18]),
    .div_en_o(out_dut[17:17]),
    .multdiv_operator_o(out_dut[16:15]),
    .multdiv_signed_mode_o(out_dut[14:13]),
    .csr_access_o(out_dut[12:12]),
    .csr_op_o(out_dut[11:10]),
    .csr_status_o(out_dut[9:9]),
    .data_req_o(out_dut[8:8]),
    .data_we_o(out_dut[7:7]),
    .data_type_o(out_dut[6:5]),
    .data_sign_extension_o(out_dut[4:4]),
    .data_reg_offset_o(out_dut[3:2]),
    .jump_in_dec_o(out_dut[1:1]),
    .branch_in_dec_o(out_dut[0:0])
  );
  ibex_decoder__ref ref_i (
    .instr_new_i(i_0),
    .instr_rdata_i(i_1),
    .illegal_c_insn_i(i_2),
    .illegal_insn_o(out_ref[247:247]),
    .ebrk_insn_o(out_ref[246:246]),
    .mret_insn_o(out_ref[245:245]),
    .dret_insn_o(out_ref[244:244]),
    .ecall_insn_o(out_ref[243:243]),
    .wfi_insn_o(out_ref[242:242]),
    .jump_set_o(out_ref[241:241]),
    .imm_a_mux_sel_o(out_ref[240:240]),
    .imm_b_mux_sel_o(out_ref[239:237]),
    .imm_i_type_o(out_ref[236:205]),
    .imm_s_type_o(out_ref[204:173]),
    .imm_b_type_o(out_ref[172:141]),
    .imm_u_type_o(out_ref[140:109]),
    .imm_j_type_o(out_ref[108:77]),
    .zimm_rs1_type_o(out_ref[76:45]),
    .regfile_wdata_sel_o(out_ref[44:43]),
    .regfile_we_o(out_ref[42:42]),
    .regfile_raddr_a_o(out_ref[41:37]),
    .regfile_raddr_b_o(out_ref[36:32]),
    .regfile_waddr_o(out_ref[31:27]),
    .alu_operator_o(out_ref[26:22]),
    .alu_op_a_mux_sel_o(out_ref[21:20]),
    .alu_op_b_mux_sel_o(out_ref[19:19]),
    .mult_en_o(out_ref[18:18]),
    .div_en_o(out_ref[17:17]),
    .multdiv_operator_o(out_ref[16:15]),
    .multdiv_signed_mode_o(out_ref[14:13]),
    .csr_access_o(out_ref[12:12]),
    .csr_op_o(out_ref[11:10]),
    .csr_status_o(out_ref[9:9]),
    .data_req_o(out_ref[8:8]),
    .data_we_o(out_ref[7:7]),
    .data_type_o(out_ref[6:5]),
    .data_sign_extension_o(out_ref[4:4]),
    .data_reg_offset_o(out_ref[3:2]),
    .jump_in_dec_o(out_ref[1:1]),
    .branch_in_dec_o(out_ref[0:0])
  );

  task check;
    begin
      bad = 0;
      for (b = 0; b < OW; b = b + 1)
        if (out_ref[b] !== 1'bx && out_dut[b] !== out_ref[b]) bad = 1;
      if (bad) begin
        mismatches = mismatches + 1;
        if (shown < 10) begin
          $display("MISMATCH cycle %0d: expected=%h got=%h", c, out_ref, out_dut);
          shown = shown + 1;
        end
      end
    end
  endtask

  initial begin
    seed = 2749215719;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
