// Hidden tests: 5000 cycles of seeded random inputs (seed 1084543661); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 60;
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
  reg [0:0] i_9;
  reg [31:0] i_10;
  reg [15:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [31:0] i_14;
  reg [31:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  reg [0:0] i_21;
  reg [0:0] i_22;
  reg [0:0] i_23;
  reg [14:0] i_24;
  reg [0:0] i_25;
  reg [0:0] i_26;
  reg [0:0] i_27;
  reg [0:0] i_28;
  reg [0:0] i_29;
  reg [0:0] i_30;
  reg [0:0] i_31;
  reg [0:0] i_32;
  reg [0:0] i_33;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  ibex_controller dut (
    .clk_i(clk),
    .rst_ni(i_0),
    .fetch_enable_i(i_1),
    .illegal_insn_i(i_2),
    .ecall_insn_i(i_3),
    .mret_insn_i(i_4),
    .dret_insn_i(i_5),
    .wfi_insn_i(i_6),
    .ebrk_insn_i(i_7),
    .csr_pipe_flush_i(i_8),
    .instr_valid_i(i_9),
    .instr_i(i_10),
    .instr_compressed_i(i_11),
    .instr_is_compressed_i(i_12),
    .instr_fetch_err_i(i_13),
    .pc_id_i(i_14),
    .lsu_addr_last_i(i_15),
    .load_err_i(i_16),
    .store_err_i(i_17),
    .branch_set_i(i_18),
    .jump_set_i(i_19),
    .csr_mstatus_mie_i(i_20),
    .csr_msip_i(i_21),
    .csr_mtip_i(i_22),
    .csr_meip_i(i_23),
    .csr_mfip_i(i_24),
    .irq_pending_i(i_25),
    .irq_nm_i(i_26),
    .debug_req_i(i_27),
    .debug_single_step_i(i_28),
    .debug_ebreakm_i(i_29),
    .stall_lsu_i(i_30),
    .stall_multdiv_i(i_31),
    .stall_jump_i(i_32),
    .stall_branch_i(i_33),
    .ctrl_busy_o(out_dut[59:59]),
    .first_fetch_o(out_dut[58:58]),
    .instr_valid_clear_o(out_dut[57:57]),
    .id_in_ready_o(out_dut[56:56]),
    .instr_req_o(out_dut[55:55]),
    .pc_set_o(out_dut[54:54]),
    .pc_mux_o(out_dut[53:51]),
    .exc_pc_mux_o(out_dut[50:49]),
    .exc_cause_o(out_dut[48:43]),
    .debug_cause_o(out_dut[42:40]),
    .debug_csr_save_o(out_dut[39:39]),
    .debug_mode_o(out_dut[38:38]),
    .csr_save_if_o(out_dut[37:37]),
    .csr_save_id_o(out_dut[36:36]),
    .csr_restore_mret_id_o(out_dut[35:35]),
    .csr_save_cause_o(out_dut[34:34]),
    .csr_mtval_o(out_dut[33:2]),
    .perf_jump_o(out_dut[1:1]),
    .perf_tbranch_o(out_dut[0:0])
  );
  ibex_controller__ref ref_i (
    .clk_i(clk),
    .rst_ni(i_0),
    .fetch_enable_i(i_1),
    .illegal_insn_i(i_2),
    .ecall_insn_i(i_3),
    .mret_insn_i(i_4),
    .dret_insn_i(i_5),
    .wfi_insn_i(i_6),
    .ebrk_insn_i(i_7),
    .csr_pipe_flush_i(i_8),
    .instr_valid_i(i_9),
    .instr_i(i_10),
    .instr_compressed_i(i_11),
    .instr_is_compressed_i(i_12),
    .instr_fetch_err_i(i_13),
    .pc_id_i(i_14),
    .lsu_addr_last_i(i_15),
    .load_err_i(i_16),
    .store_err_i(i_17),
    .branch_set_i(i_18),
    .jump_set_i(i_19),
    .csr_mstatus_mie_i(i_20),
    .csr_msip_i(i_21),
    .csr_mtip_i(i_22),
    .csr_meip_i(i_23),
    .csr_mfip_i(i_24),
    .irq_pending_i(i_25),
    .irq_nm_i(i_26),
    .debug_req_i(i_27),
    .debug_single_step_i(i_28),
    .debug_ebreakm_i(i_29),
    .stall_lsu_i(i_30),
    .stall_multdiv_i(i_31),
    .stall_jump_i(i_32),
    .stall_branch_i(i_33),
    .ctrl_busy_o(out_ref[59:59]),
    .first_fetch_o(out_ref[58:58]),
    .instr_valid_clear_o(out_ref[57:57]),
    .id_in_ready_o(out_ref[56:56]),
    .instr_req_o(out_ref[55:55]),
    .pc_set_o(out_ref[54:54]),
    .pc_mux_o(out_ref[53:51]),
    .exc_pc_mux_o(out_ref[50:49]),
    .exc_cause_o(out_ref[48:43]),
    .debug_cause_o(out_ref[42:40]),
    .debug_csr_save_o(out_ref[39:39]),
    .debug_mode_o(out_ref[38:38]),
    .csr_save_if_o(out_ref[37:37]),
    .csr_save_id_o(out_ref[36:36]),
    .csr_restore_mret_id_o(out_ref[35:35]),
    .csr_save_cause_o(out_ref[34:34]),
    .csr_mtval_o(out_ref[33:2]),
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
    seed = 1084543661;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
