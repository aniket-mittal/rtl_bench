// Hidden tests: 5000 cycles of seeded random inputs (seed 2545189227); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 32;
  reg clk;
  reg [31:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [31:0] i_7;
  reg [31:0] i_8;
  reg [31:0] i_9;
  reg [31:0] i_10;
  reg [31:0] i_11;
  reg [31:0] i_12;
  reg [31:0] i_13;
  reg [31:0] i_14;
  reg [31:0] i_15;
  reg [31:0] i_16;
  reg [31:0] i_17;
  reg [31:0] i_18;
  reg [31:0] i_19;
  reg [31:0] i_20;
  reg [31:0] i_21;
  reg [31:0] i_22;
  reg [31:0] i_23;
  reg [31:0] i_24;
  reg [31:0] i_25;
  reg [31:0] i_26;
  reg [31:0] i_27;
  reg [31:0] i_28;
  reg [31:0] i_29;
  reg [31:0] i_30;
  reg [31:0] i_31;
  reg [4:0] i_32;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_024399 dut (
    .R0(i_0),
    .R1(i_1),
    .R2(i_2),
    .R3(i_3),
    .R4(i_4),
    .R5(i_5),
    .R6(i_6),
    .R7(i_7),
    .R8(i_8),
    .R9(i_9),
    .R10(i_10),
    .R11(i_11),
    .R12(i_12),
    .R13(i_13),
    .R14(i_14),
    .R15(i_15),
    .R16(i_16),
    .R17(i_17),
    .R18(i_18),
    .R19(i_19),
    .R20(i_20),
    .R21(i_21),
    .R22(i_22),
    .R23(i_23),
    .R24(i_24),
    .R25(i_25),
    .R26(i_26),
    .R27(i_27),
    .R28(i_28),
    .R29(i_29),
    .R30(i_30),
    .R31(i_31),
    .s(i_32),
    .out(out_dut[31:0])
  );
  origen_024399__ref ref_i (
    .R0(i_0),
    .R1(i_1),
    .R2(i_2),
    .R3(i_3),
    .R4(i_4),
    .R5(i_5),
    .R6(i_6),
    .R7(i_7),
    .R8(i_8),
    .R9(i_9),
    .R10(i_10),
    .R11(i_11),
    .R12(i_12),
    .R13(i_13),
    .R14(i_14),
    .R15(i_15),
    .R16(i_16),
    .R17(i_17),
    .R18(i_18),
    .R19(i_19),
    .R20(i_20),
    .R21(i_21),
    .R22(i_22),
    .R23(i_23),
    .R24(i_24),
    .R25(i_25),
    .R26(i_26),
    .R27(i_27),
    .R28(i_28),
    .R29(i_29),
    .R30(i_30),
    .R31(i_31),
    .s(i_32),
    .out(out_ref[31:0])
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
    seed = 2545189227;
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
      i_32 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
