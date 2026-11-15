// Hidden tests: 5000 cycles of seeded random inputs (seed 3902907363); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 313;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [0:0] i_2;
  reg [31:0] i_3;
  reg [0:0] i_4;
  reg [11:0] i_5;
  reg [31:0] i_6;
  reg [1:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [14:0] i_11;
  reg [0:0] i_12;
  reg [2:0] i_13;
  reg [0:0] i_14;
  reg [31:0] i_15;
  reg [31:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  reg [5:0] i_21;
  reg [31:0] i_22;
  reg [0:0] i_23;
  reg [0:0] i_24;
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

  ibex_cs_registers dut (
    .clk_i(clk),
    .rst_ni(i_0),
    .hart_id_i(i_1),
    .csr_mtvec_init_i(i_2),
    .boot_addr_i(i_3),
    .csr_access_i(i_4),
    .csr_addr_i(i_5),
    .csr_wdata_i(i_6),
    .csr_op_i(i_7),
    .irq_software_i(i_8),
    .irq_timer_i(i_9),
    .irq_external_i(i_10),
    .irq_fast_i(i_11),
    .debug_mode_i(i_12),
    .debug_cause_i(i_13),
    .debug_csr_save_i(i_14),
    .pc_if_i(i_15),
    .pc_id_i(i_16),
    .csr_save_if_i(i_17),
    .csr_save_id_i(i_18),
    .csr_restore_mret_i(i_19),
    .csr_save_cause_i(i_20),
    .csr_mcause_i(i_21),
    .csr_mtval_i(i_22),
    .instr_new_id_i(i_23),
    .instr_ret_i(i_24),
    .instr_ret_compressed_i(i_25),
    .imiss_i(i_26),
    .pc_set_i(i_27),
    .jump_i(i_28),
    .branch_i(i_29),
    .branch_taken_i(i_30),
    .mem_load_i(i_31),
    .mem_store_i(i_32),
    .lsu_busy_i(i_33),
    .priv_mode_o(out_dut[312:311]),
    .csr_mtvec_o(out_dut[310:279]),
    .csr_rdata_o(out_dut[278:247]),
    .irq_pending_o(out_dut[246:246]),
    .csr_msip_o(out_dut[245:245]),
    .csr_mtip_o(out_dut[244:244]),
    .csr_meip_o(out_dut[243:243]),
    .csr_mfip_o(out_dut[242:228]),
    .csr_mstatus_mie_o(out_dut[227:227]),
    .csr_mepc_o(out_dut[226:195]),
    .csr_pmp_cfg_o(out_dut[194:171]),
    .csr_pmp_addr_o(out_dut[170:35]),
    .csr_depc_o(out_dut[34:3]),
    .debug_single_step_o(out_dut[2:2]),
    .debug_ebreakm_o(out_dut[1:1]),
    .illegal_csr_insn_o(out_dut[0:0])
  );
  ibex_cs_registers__ref ref_i (
    .clk_i(clk),
    .rst_ni(i_0),
    .hart_id_i(i_1),
    .csr_mtvec_init_i(i_2),
    .boot_addr_i(i_3),
    .csr_access_i(i_4),
    .csr_addr_i(i_5),
    .csr_wdata_i(i_6),
    .csr_op_i(i_7),
    .irq_software_i(i_8),
    .irq_timer_i(i_9),
    .irq_external_i(i_10),
    .irq_fast_i(i_11),
    .debug_mode_i(i_12),
    .debug_cause_i(i_13),
    .debug_csr_save_i(i_14),
    .pc_if_i(i_15),
    .pc_id_i(i_16),
    .csr_save_if_i(i_17),
    .csr_save_id_i(i_18),
    .csr_restore_mret_i(i_19),
    .csr_save_cause_i(i_20),
    .csr_mcause_i(i_21),
    .csr_mtval_i(i_22),
    .instr_new_id_i(i_23),
    .instr_ret_i(i_24),
    .instr_ret_compressed_i(i_25),
    .imiss_i(i_26),
    .pc_set_i(i_27),
    .jump_i(i_28),
    .branch_i(i_29),
    .branch_taken_i(i_30),
    .mem_load_i(i_31),
    .mem_store_i(i_32),
    .lsu_busy_i(i_33),
    .priv_mode_o(out_ref[312:311]),
    .csr_mtvec_o(out_ref[310:279]),
    .csr_rdata_o(out_ref[278:247]),
    .irq_pending_o(out_ref[246:246]),
    .csr_msip_o(out_ref[245:245]),
    .csr_mtip_o(out_ref[244:244]),
    .csr_meip_o(out_ref[243:243]),
    .csr_mfip_o(out_ref[242:228]),
    .csr_mstatus_mie_o(out_ref[227:227]),
    .csr_mepc_o(out_ref[226:195]),
    .csr_pmp_cfg_o(out_ref[194:171]),
    .csr_pmp_addr_o(out_ref[170:35]),
    .csr_depc_o(out_ref[34:3]),
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
    seed = 3902907363;
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
