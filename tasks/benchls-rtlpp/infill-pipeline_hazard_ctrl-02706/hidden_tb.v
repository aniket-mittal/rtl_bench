// Hidden tests: 5000 cycles of seeded random inputs (seed 154817478); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 119;
  reg clk;
  reg [0:0] i_0;
  reg [1:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [4:0] i_4;
  reg [0:0] i_5;
  reg [4:0] i_6;
  reg [6:0] i_7;
  reg [4:0] i_8;
  reg [4:0] i_9;
  reg [4:0] i_10;
  reg [4:0] i_11;
  reg [0:0] i_12;
  reg [4:0] i_13;
  reg [0:0] i_14;
  reg [4:0] i_15;
  reg [31:0] i_16;
  reg [0:0] i_17;
  reg [3:0] i_18;
  reg [31:0] i_19;
  reg [0:0] i_20;
  reg [0:0] i_21;
  reg [1:0] i_22;
  reg [1:0] i_23;
  reg [1:0] i_24;
  reg [1:0] i_25;
  reg [0:0] i_26;
  reg [0:0] i_27;
  reg [0:0] i_28;
  reg [0:0] i_29;
  reg [31:0] i_30;
  reg [31:0] i_31;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_02706 dut (
    .br_taken(i_0),
    .src_reg_used(i_1),
    .is_eret(i_2),
    .id_en(i_3),
    .id_rd_addr(i_4),
    .id_gpr_we_(i_5),
    .id_mem_op(i_6),
    .op(i_7),
    .rs1_addr(i_8),
    .rs2_addr(i_9),
    .id_rs1_addr(i_10),
    .id_rs2_addr(i_11),
    .ex_en(i_12),
    .ex_rd_addr(i_13),
    .ex_gpr_we_(i_14),
    .ex_mem_op(i_15),
    .mem_pc(i_16),
    .mem_en(i_17),
    .mem_exp_code(i_18),
    .mepc_i(i_19),
    .ic_busy(i_20),
    .dc_busy(i_21),
    .issue_id(i_22),
    .if_hart_id(i_23),
    .id_hart_id(i_24),
    .ex_hart_id(i_25),
    .hart_ic_stall(i_26),
    .hart_dc_stall(i_27),
    .hart_ic_flush(i_28),
    .hart_dc_flush(i_29),
    .if_pc(i_30),
    .ex_pc(i_31),
    .mepc_o(out_dut[118:87]),
    .exp_code(out_dut[86:83]),
    .save_exp(out_dut[82:82]),
    .restore_exp(out_dut[81:81]),
    .if_stall(out_dut[80:80]),
    .id_stall(out_dut[79:79]),
    .ex_stall(out_dut[78:78]),
    .mem_stall(out_dut[77:77]),
    .if_flush(out_dut[76:76]),
    .id_flush(out_dut[75:75]),
    .ex_flush(out_dut[74:74]),
    .mem_flush(out_dut[73:73]),
    .new_pc(out_dut[72:41]),
    .rs1_fwd_ctrl(out_dut[40:39]),
    .rs2_fwd_ctrl(out_dut[38:37]),
    .ex_rs1_fwd_en(out_dut[36:36]),
    .ex_rs2_fwd_en(out_dut[35:35]),
    .cache_miss(out_dut[34:34]),
    .cm_hart_id(out_dut[33:32]),
    .cm_addr(out_dut[31:0])
  );
  rtlpp_02706__ref ref_i (
    .br_taken(i_0),
    .src_reg_used(i_1),
    .is_eret(i_2),
    .id_en(i_3),
    .id_rd_addr(i_4),
    .id_gpr_we_(i_5),
    .id_mem_op(i_6),
    .op(i_7),
    .rs1_addr(i_8),
    .rs2_addr(i_9),
    .id_rs1_addr(i_10),
    .id_rs2_addr(i_11),
    .ex_en(i_12),
    .ex_rd_addr(i_13),
    .ex_gpr_we_(i_14),
    .ex_mem_op(i_15),
    .mem_pc(i_16),
    .mem_en(i_17),
    .mem_exp_code(i_18),
    .mepc_i(i_19),
    .ic_busy(i_20),
    .dc_busy(i_21),
    .issue_id(i_22),
    .if_hart_id(i_23),
    .id_hart_id(i_24),
    .ex_hart_id(i_25),
    .hart_ic_stall(i_26),
    .hart_dc_stall(i_27),
    .hart_ic_flush(i_28),
    .hart_dc_flush(i_29),
    .if_pc(i_30),
    .ex_pc(i_31),
    .mepc_o(out_ref[118:87]),
    .exp_code(out_ref[86:83]),
    .save_exp(out_ref[82:82]),
    .restore_exp(out_ref[81:81]),
    .if_stall(out_ref[80:80]),
    .id_stall(out_ref[79:79]),
    .ex_stall(out_ref[78:78]),
    .mem_stall(out_ref[77:77]),
    .if_flush(out_ref[76:76]),
    .id_flush(out_ref[75:75]),
    .ex_flush(out_ref[74:74]),
    .mem_flush(out_ref[73:73]),
    .new_pc(out_ref[72:41]),
    .rs1_fwd_ctrl(out_ref[40:39]),
    .rs2_fwd_ctrl(out_ref[38:37]),
    .ex_rs1_fwd_en(out_ref[36:36]),
    .ex_rs2_fwd_en(out_ref[35:35]),
    .cache_miss(out_ref[34:34]),
    .cm_hart_id(out_ref[33:32]),
    .cm_addr(out_ref[31:0])
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
    seed = 154817478;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
