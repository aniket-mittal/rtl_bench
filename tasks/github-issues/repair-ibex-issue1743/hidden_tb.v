// Hidden tests: 5000 cycles of seeded random inputs (seed 2820578474); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 68;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [31:0] i_9;
  reg [15:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [31:0] i_15;
  reg [31:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  reg [0:0] i_21;
  reg [0:0] i_22;
  reg [0:0] i_23;
  reg [0:0] i_24;
  reg [17:0] i_25;
  reg [0:0] i_26;
  reg [0:0] i_27;
  reg [0:0] i_28;
  reg [0:0] i_29;
  reg [0:0] i_30;
  reg [0:0] i_31;
  reg [1:0] i_32;
  reg [0:0] i_33;
  reg [0:0] i_34;
  reg [0:0] i_35;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  ibex_controller dut (
    .clk_i(clk),
    .rst_ni(i_0),
    .illegal_insn_i(i_1),
    .ecall_insn_i(i_2),
    .mret_insn_i(i_3),
    .dret_insn_i(i_4),
    .wfi_insn_i(i_5),
    .ebrk_insn_i(i_6),
    .csr_pipe_flush_i(i_7),
    .instr_valid_i(i_8),
    .instr_i(i_9),
    .instr_compressed_i(i_10),
    .instr_is_compressed_i(i_11),
    .instr_bp_taken_i(i_12),
    .instr_fetch_err_i(i_13),
    .instr_fetch_err_plus2_i(i_14),
    .pc_id_i(i_15),
    .lsu_addr_last_i(i_16),
    .load_err_i(i_17),
    .load_intg_err_i(i_18),
    .store_err_i(i_19),
    .branch_set_i(i_20),
    .branch_not_set_i(i_21),
    .jump_set_i(i_22),
    .csr_mstatus_mie_i(i_23),
    .irq_pending_i(i_24),
    .irqs_i(i_25),
    .irq_nm_ext_i(i_26),
    .debug_req_i(i_27),
    .debug_single_step_i(i_28),
    .debug_ebreakm_i(i_29),
    .debug_ebreaku_i(i_30),
    .trigger_match_i(i_31),
    .priv_mode_i(i_32),
    .stall_id_i(i_33),
    .stall_wb_i(i_34),
    .ready_wb_i(i_35),
    .ctrl_busy_o(out_dut[67:67]),
    .instr_valid_clear_o(out_dut[66:66]),
    .id_in_ready_o(out_dut[65:65]),
    .controller_run_o(out_dut[64:64]),
    .instr_req_o(out_dut[63:63]),
    .pc_set_o(out_dut[62:62]),
    .pc_mux_o(out_dut[61:59]),
    .nt_branch_mispredict_o(out_dut[58:58]),
    .exc_pc_mux_o(out_dut[57:56]),
    .exc_cause_o(out_dut[55:49]),
    .wb_exception_o(out_dut[48:48]),
    .id_exception_o(out_dut[47:47]),
    .nmi_mode_o(out_dut[46:46]),
    .debug_cause_o(out_dut[45:43]),
    .debug_csr_save_o(out_dut[42:42]),
    .debug_mode_o(out_dut[41:41]),
    .csr_save_if_o(out_dut[40:40]),
    .csr_save_id_o(out_dut[39:39]),
    .csr_save_wb_o(out_dut[38:38]),
    .csr_restore_mret_id_o(out_dut[37:37]),
    .csr_restore_dret_id_o(out_dut[36:36]),
    .csr_save_cause_o(out_dut[35:35]),
    .csr_mtval_o(out_dut[34:3]),
    .flush_id_o(out_dut[2:2]),
    .perf_jump_o(out_dut[1:1]),
    .perf_tbranch_o(out_dut[0:0])
  );
  ibex_controller__ref ref_i (
    .clk_i(clk),
    .rst_ni(i_0),
    .illegal_insn_i(i_1),
    .ecall_insn_i(i_2),
    .mret_insn_i(i_3),
    .dret_insn_i(i_4),
    .wfi_insn_i(i_5),
    .ebrk_insn_i(i_6),
    .csr_pipe_flush_i(i_7),
    .instr_valid_i(i_8),
    .instr_i(i_9),
    .instr_compressed_i(i_10),
    .instr_is_compressed_i(i_11),
    .instr_bp_taken_i(i_12),
    .instr_fetch_err_i(i_13),
    .instr_fetch_err_plus2_i(i_14),
    .pc_id_i(i_15),
    .lsu_addr_last_i(i_16),
    .load_err_i(i_17),
    .load_intg_err_i(i_18),
    .store_err_i(i_19),
    .branch_set_i(i_20),
    .branch_not_set_i(i_21),
    .jump_set_i(i_22),
    .csr_mstatus_mie_i(i_23),
    .irq_pending_i(i_24),
    .irqs_i(i_25),
    .irq_nm_ext_i(i_26),
    .debug_req_i(i_27),
    .debug_single_step_i(i_28),
    .debug_ebreakm_i(i_29),
    .debug_ebreaku_i(i_30),
    .trigger_match_i(i_31),
    .priv_mode_i(i_32),
    .stall_id_i(i_33),
    .stall_wb_i(i_34),
    .ready_wb_i(i_35),
    .ctrl_busy_o(out_ref[67:67]),
    .instr_valid_clear_o(out_ref[66:66]),
    .id_in_ready_o(out_ref[65:65]),
    .controller_run_o(out_ref[64:64]),
    .instr_req_o(out_ref[63:63]),
    .pc_set_o(out_ref[62:62]),
    .pc_mux_o(out_ref[61:59]),
    .nt_branch_mispredict_o(out_ref[58:58]),
    .exc_pc_mux_o(out_ref[57:56]),
    .exc_cause_o(out_ref[55:49]),
    .wb_exception_o(out_ref[48:48]),
    .id_exception_o(out_ref[47:47]),
    .nmi_mode_o(out_ref[46:46]),
    .debug_cause_o(out_ref[45:43]),
    .debug_csr_save_o(out_ref[42:42]),
    .debug_mode_o(out_ref[41:41]),
    .csr_save_if_o(out_ref[40:40]),
    .csr_save_id_o(out_ref[39:39]),
    .csr_save_wb_o(out_ref[38:38]),
    .csr_restore_mret_id_o(out_ref[37:37]),
    .csr_restore_dret_id_o(out_ref[36:36]),
    .csr_save_cause_o(out_ref[35:35]),
    .csr_mtval_o(out_ref[34:3]),
    .flush_id_o(out_ref[2:2]),
    .perf_jump_o(out_ref[1:1]),
    .perf_tbranch_o(out_ref[0:0])
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
    seed = 2820578474;
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
      i_27 = {$random(seed)};
      i_28 = {$random(seed)};
      i_29 = {$random(seed)};
      i_30 = {$random(seed)};
      i_31 = {$random(seed)};
      i_32 = {$random(seed)};
      i_33 = {$random(seed)};
      i_34 = {$random(seed)};
      i_35 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
