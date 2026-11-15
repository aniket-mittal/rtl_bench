// Hidden tests: 5000 cycles of seeded random inputs (seed 3064097198); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 100;
  reg clk;
  reg [0:0] i_0;
  reg [3:0] i_1;
  reg [5:0] i_2;
  reg [31:0] i_3;
  reg [0:0] i_4;
  reg [11:0] i_5;
  reg [31:0] i_6;
  reg [1:0] i_7;
  reg [2:0] i_8;
  reg [0:0] i_9;
  reg [31:0] i_10;
  reg [31:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [5:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  reg [0:0] i_21;
  reg [0:0] i_22;
  reg [0:0] i_23;
  reg [0:0] i_24;
  reg [0:0] i_25;
  reg [0:0] i_26;
  reg [0:0] i_27;
  reg [0:0] i_28;
  reg [0:0] i_29;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  ibex_cs_registers dut (
    .clk_i(clk),
    .rst_ni(i_0),
    .core_id_i(i_1),
    .cluster_id_i(i_2),
    .boot_addr_i(i_3),
    .csr_access_i(i_4),
    .csr_addr_i(i_5),
    .csr_wdata_i(i_6),
    .csr_op_i(i_7),
    .debug_cause_i(i_8),
    .debug_csr_save_i(i_9),
    .pc_if_i(i_10),
    .pc_id_i(i_11),
    .csr_save_if_i(i_12),
    .csr_save_id_i(i_13),
    .csr_restore_mret_i(i_14),
    .csr_restore_dret_i(i_15),
    .csr_cause_i(i_16),
    .csr_save_cause_i(i_17),
    .insn_ret_i(i_18),
    .id_valid_i(i_19),
    .is_compressed_i(i_20),
    .is_decoding_i(i_21),
    .imiss_i(i_22),
    .pc_set_i(i_23),
    .jump_i(i_24),
    .branch_i(i_25),
    .branch_taken_i(i_26),
    .mem_load_i(i_27),
    .mem_store_i(i_28),
    .lsu_busy_i(i_29),
    .csr_rdata_o(out_dut[99:68]),
    .m_irq_enable_o(out_dut[67:67]),
    .mepc_o(out_dut[66:35]),
    .depc_o(out_dut[34:3]),
    .debug_single_step_o(out_dut[2:2]),
    .debug_ebreakm_o(out_dut[1:1]),
    .illegal_csr_insn_o(out_dut[0:0])
  );
  ibex_cs_registers__ref ref_i (
    .clk_i(clk),
    .rst_ni(i_0),
    .core_id_i(i_1),
    .cluster_id_i(i_2),
    .boot_addr_i(i_3),
    .csr_access_i(i_4),
    .csr_addr_i(i_5),
    .csr_wdata_i(i_6),
    .csr_op_i(i_7),
    .debug_cause_i(i_8),
    .debug_csr_save_i(i_9),
    .pc_if_i(i_10),
    .pc_id_i(i_11),
    .csr_save_if_i(i_12),
    .csr_save_id_i(i_13),
    .csr_restore_mret_i(i_14),
    .csr_restore_dret_i(i_15),
    .csr_cause_i(i_16),
    .csr_save_cause_i(i_17),
    .insn_ret_i(i_18),
    .id_valid_i(i_19),
    .is_compressed_i(i_20),
    .is_decoding_i(i_21),
    .imiss_i(i_22),
    .pc_set_i(i_23),
    .jump_i(i_24),
    .branch_i(i_25),
    .branch_taken_i(i_26),
    .mem_load_i(i_27),
    .mem_store_i(i_28),
    .lsu_busy_i(i_29),
    .csr_rdata_o(out_ref[99:68]),
    .m_irq_enable_o(out_ref[67:67]),
    .mepc_o(out_ref[66:35]),
    .depc_o(out_ref[34:3]),
    .debug_single_step_o(out_ref[2:2]),
    .debug_ebreakm_o(out_ref[1:1]),
    .illegal_csr_insn_o(out_ref[0:0])
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
    seed = 3064097198;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
