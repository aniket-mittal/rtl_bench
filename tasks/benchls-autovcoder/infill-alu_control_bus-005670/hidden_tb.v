// Hidden tests: 5000 cycles of seeded random inputs (seed 1379232840); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 17;
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
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_005670 dut (
    .ctl_alu_oe(i_0),
    .ctl_alu_shift_oe(i_1),
    .ctl_alu_op2_oe(i_2),
    .ctl_alu_res_oe(i_3),
    .ctl_alu_op1_oe(i_4),
    .ctl_alu_bs_oe(i_5),
    .ctl_alu_op1_sel_bus(i_6),
    .ctl_alu_op1_sel_low(i_7),
    .ctl_alu_op1_sel_zero(i_8),
    .ctl_alu_op2_sel_zero(i_9),
    .ctl_alu_op2_sel_bus(i_10),
    .ctl_alu_op2_sel_lq(i_11),
    .ctl_alu_sel_op2_neg(i_12),
    .ctl_alu_sel_op2_high(i_13),
    .ctl_alu_core_R(i_14),
    .ctl_alu_core_V(i_15),
    .ctl_alu_core_S(i_16),
    .alu_oe(out_dut[16:16]),
    .alu_shift_oe(out_dut[15:15]),
    .alu_op2_oe(out_dut[14:14]),
    .alu_res_oe(out_dut[13:13]),
    .alu_op1_oe(out_dut[12:12]),
    .alu_bs_oe(out_dut[11:11]),
    .alu_op1_sel_bus(out_dut[10:10]),
    .alu_op1_sel_low(out_dut[9:9]),
    .alu_op1_sel_zero(out_dut[8:8]),
    .alu_op2_sel_zero(out_dut[7:7]),
    .alu_op2_sel_bus(out_dut[6:6]),
    .alu_op2_sel_lq(out_dut[5:5]),
    .alu_sel_op2_neg(out_dut[4:4]),
    .alu_sel_op2_high(out_dut[3:3]),
    .alu_core_R(out_dut[2:2]),
    .alu_core_V(out_dut[1:1]),
    .alu_core_S(out_dut[0:0])
  );
  autovcoder_005670__ref ref_i (
    .ctl_alu_oe(i_0),
    .ctl_alu_shift_oe(i_1),
    .ctl_alu_op2_oe(i_2),
    .ctl_alu_res_oe(i_3),
    .ctl_alu_op1_oe(i_4),
    .ctl_alu_bs_oe(i_5),
    .ctl_alu_op1_sel_bus(i_6),
    .ctl_alu_op1_sel_low(i_7),
    .ctl_alu_op1_sel_zero(i_8),
    .ctl_alu_op2_sel_zero(i_9),
    .ctl_alu_op2_sel_bus(i_10),
    .ctl_alu_op2_sel_lq(i_11),
    .ctl_alu_sel_op2_neg(i_12),
    .ctl_alu_sel_op2_high(i_13),
    .ctl_alu_core_R(i_14),
    .ctl_alu_core_V(i_15),
    .ctl_alu_core_S(i_16),
    .alu_oe(out_ref[16:16]),
    .alu_shift_oe(out_ref[15:15]),
    .alu_op2_oe(out_ref[14:14]),
    .alu_res_oe(out_ref[13:13]),
    .alu_op1_oe(out_ref[12:12]),
    .alu_bs_oe(out_ref[11:11]),
    .alu_op1_sel_bus(out_ref[10:10]),
    .alu_op1_sel_low(out_ref[9:9]),
    .alu_op1_sel_zero(out_ref[8:8]),
    .alu_op2_sel_zero(out_ref[7:7]),
    .alu_op2_sel_bus(out_ref[6:6]),
    .alu_op2_sel_lq(out_ref[5:5]),
    .alu_sel_op2_neg(out_ref[4:4]),
    .alu_sel_op2_high(out_ref[3:3]),
    .alu_core_R(out_ref[2:2]),
    .alu_core_V(out_ref[1:1]),
    .alu_core_S(out_ref[0:0])
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
    seed = 1379232840;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
