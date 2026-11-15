// Hidden tests: 5000 cycles of seeded random inputs (seed 2156591135); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 251;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  reg [15:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [31:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [31:0] i_15;
  reg [0:0] i_16;
  reg [4:0] i_17;
  reg [0:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  reg [0:0] i_21;
  reg [0:0] i_22;
  reg [0:0] i_23;
  reg [31:0] i_24;
  reg [31:0] i_25;
  reg [31:0] i_26;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  ibex_id_stage dut (
    .clk_i(clk),
    .rst_ni(i_0),
    .test_en_i(i_1),
    .fetch_enable_i(i_2),
    .instr_valid_i(i_3),
    .instr_new_i(i_4),
    .instr_rdata_i(i_5),
    .instr_rdata_c_i(i_6),
    .instr_is_compressed_i(i_7),
    .branch_decision_i(i_8),
    .illegal_c_insn_i(i_9),
    .pc_id_i(i_10),
    .ex_valid_i(i_11),
    .lsu_valid_i(i_12),
    .illegal_csr_insn_i(i_13),
    .lsu_addr_incr_req_i(i_14),
    .lsu_addr_last_i(i_15),
    .irq_i(i_16),
    .irq_id_i(i_17),
    .m_irq_enable_i(i_18),
    .lsu_load_err_i(i_19),
    .lsu_store_err_i(i_20),
    .debug_req_i(i_21),
    .debug_single_step_i(i_22),
    .debug_ebreakm_i(i_23),
    .regfile_wdata_lsu_i(i_24),
    .regfile_wdata_ex_i(i_25),
    .csr_rdata_i(i_26),
    .ctrl_busy_o(out_dut[250:250]),
    .core_ctrl_firstfetch_o(out_dut[249:249]),
    .illegal_insn_o(out_dut[248:248]),
    .instr_req_o(out_dut[247:247]),
    .instr_valid_clear_o(out_dut[246:246]),
    .id_in_ready_o(out_dut[245:245]),
    .pc_set_o(out_dut[244:244]),
    .pc_mux_o(out_dut[243:241]),
    .exc_pc_mux_o(out_dut[240:239]),
    .alu_operator_ex_o(out_dut[238:234]),
    .alu_operand_a_ex_o(out_dut[233:202]),
    .alu_operand_b_ex_o(out_dut[201:170]),
    .mult_en_ex_o(out_dut[169:169]),
    .div_en_ex_o(out_dut[168:168]),
    .multdiv_operator_ex_o(out_dut[167:166]),
    .multdiv_signed_mode_ex_o(out_dut[165:164]),
    .multdiv_operand_a_ex_o(out_dut[163:132]),
    .multdiv_operand_b_ex_o(out_dut[131:100]),
    .csr_access_o(out_dut[99:99]),
    .csr_op_o(out_dut[98:97]),
    .csr_save_if_o(out_dut[96:96]),
    .csr_save_id_o(out_dut[95:95]),
    .csr_restore_mret_id_o(out_dut[94:94]),
    .csr_restore_dret_id_o(out_dut[93:93]),
    .csr_save_cause_o(out_dut[92:92]),
    .csr_mtval_o(out_dut[91:60]),
    .data_req_ex_o(out_dut[59:59]),
    .data_we_ex_o(out_dut[58:58]),
    .data_type_ex_o(out_dut[57:56]),
    .data_sign_ext_ex_o(out_dut[55:55]),
    .data_reg_offset_ex_o(out_dut[54:53]),
    .data_wdata_ex_o(out_dut[52:21]),
    .irq_ack_o(out_dut[20:20]),
    .irq_id_o(out_dut[19:15]),
    .exc_cause_o(out_dut[14:9]),
    .debug_cause_o(out_dut[8:6]),
    .debug_csr_save_o(out_dut[5:5]),
    .perf_jump_o(out_dut[4:4]),
    .perf_branch_o(out_dut[3:3]),
    .perf_tbranch_o(out_dut[2:2]),
    .instr_ret_o(out_dut[1:1]),
    .instr_ret_compressed_o(out_dut[0:0])
  );
  ibex_id_stage__ref ref_i (
    .clk_i(clk),
    .rst_ni(i_0),
    .test_en_i(i_1),
    .fetch_enable_i(i_2),
    .instr_valid_i(i_3),
    .instr_new_i(i_4),
    .instr_rdata_i(i_5),
    .instr_rdata_c_i(i_6),
    .instr_is_compressed_i(i_7),
    .branch_decision_i(i_8),
    .illegal_c_insn_i(i_9),
    .pc_id_i(i_10),
    .ex_valid_i(i_11),
    .lsu_valid_i(i_12),
    .illegal_csr_insn_i(i_13),
    .lsu_addr_incr_req_i(i_14),
    .lsu_addr_last_i(i_15),
    .irq_i(i_16),
    .irq_id_i(i_17),
    .m_irq_enable_i(i_18),
    .lsu_load_err_i(i_19),
    .lsu_store_err_i(i_20),
    .debug_req_i(i_21),
    .debug_single_step_i(i_22),
    .debug_ebreakm_i(i_23),
    .regfile_wdata_lsu_i(i_24),
    .regfile_wdata_ex_i(i_25),
    .csr_rdata_i(i_26),
    .ctrl_busy_o(out_ref[250:250]),
    .core_ctrl_firstfetch_o(out_ref[249:249]),
    .illegal_insn_o(out_ref[248:248]),
    .instr_req_o(out_ref[247:247]),
    .instr_valid_clear_o(out_ref[246:246]),
    .id_in_ready_o(out_ref[245:245]),
    .pc_set_o(out_ref[244:244]),
    .pc_mux_o(out_ref[243:241]),
    .exc_pc_mux_o(out_ref[240:239]),
    .alu_operator_ex_o(out_ref[238:234]),
    .alu_operand_a_ex_o(out_ref[233:202]),
    .alu_operand_b_ex_o(out_ref[201:170]),
    .mult_en_ex_o(out_ref[169:169]),
    .div_en_ex_o(out_ref[168:168]),
    .multdiv_operator_ex_o(out_ref[167:166]),
    .multdiv_signed_mode_ex_o(out_ref[165:164]),
    .multdiv_operand_a_ex_o(out_ref[163:132]),
    .multdiv_operand_b_ex_o(out_ref[131:100]),
    .csr_access_o(out_ref[99:99]),
    .csr_op_o(out_ref[98:97]),
    .csr_save_if_o(out_ref[96:96]),
    .csr_save_id_o(out_ref[95:95]),
    .csr_restore_mret_id_o(out_ref[94:94]),
    .csr_restore_dret_id_o(out_ref[93:93]),
    .csr_save_cause_o(out_ref[92:92]),
    .csr_mtval_o(out_ref[91:60]),
    .data_req_ex_o(out_ref[59:59]),
    .data_we_ex_o(out_ref[58:58]),
    .data_type_ex_o(out_ref[57:56]),
    .data_sign_ext_ex_o(out_ref[55:55]),
    .data_reg_offset_ex_o(out_ref[54:53]),
    .data_wdata_ex_o(out_ref[52:21]),
    .irq_ack_o(out_ref[20:20]),
    .irq_id_o(out_ref[19:15]),
    .exc_cause_o(out_ref[14:9]),
    .debug_cause_o(out_ref[8:6]),
    .debug_csr_save_o(out_ref[5:5]),
    .perf_jump_o(out_ref[4:4]),
    .perf_branch_o(out_ref[3:3]),
    .perf_tbranch_o(out_ref[2:2]),
    .instr_ret_o(out_ref[1:1]),
    .instr_ret_compressed_o(out_ref[0:0])
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
    seed = 2156591135;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      i_21 = {$random(seed)};
      i_22 = {$random(seed)};
      i_23 = {$random(seed)};
      i_24 = {$random(seed)};
      i_25 = {$random(seed)};
      i_26 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
