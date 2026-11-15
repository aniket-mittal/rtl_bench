// Hidden tests: 5000 cycles of seeded random inputs (seed 3285996798); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 8;
  reg clk;
  reg [7:0] i_0;
  reg [7:0] i_1;
  reg [7:0] i_2;
  reg [7:0] i_3;
  reg [7:0] i_4;
  reg [7:0] i_5;
  reg [7:0] i_6;
  reg [7:0] i_7;
  reg [7:0] i_8;
  reg [7:0] i_9;
  reg [7:0] i_10;
  reg [7:0] i_11;
  reg [7:0] i_12;
  reg [7:0] i_13;
  reg [7:0] i_14;
  reg [7:0] i_15;
  reg [7:0] i_16;
  reg [7:0] i_17;
  reg [7:0] i_18;
  reg [7:0] i_19;
  reg [7:0] i_20;
  reg [7:0] i_21;
  reg [7:0] i_22;
  reg [7:0] i_23;
  reg [7:0] i_24;
  reg [7:0] i_25;
  reg [7:0] i_26;
  reg [7:0] i_27;
  reg [7:0] i_28;
  reg [7:0] i_29;
  reg [7:0] i_30;
  reg [7:0] i_31;
  reg [4:0] i_32;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_081792 dut (
    .in0(i_0),
    .in1(i_1),
    .in2(i_2),
    .in3(i_3),
    .in4(i_4),
    .in5(i_5),
    .in6(i_6),
    .in7(i_7),
    .in8(i_8),
    .in9(i_9),
    .in10(i_10),
    .in11(i_11),
    .in12(i_12),
    .in13(i_13),
    .in14(i_14),
    .in15(i_15),
    .in16(i_16),
    .in17(i_17),
    .in18(i_18),
    .in19(i_19),
    .in20(i_20),
    .in21(i_21),
    .in22(i_22),
    .in23(i_23),
    .in24(i_24),
    .in25(i_25),
    .in26(i_26),
    .in27(i_27),
    .in28(i_28),
    .in29(i_29),
    .in30(i_30),
    .in31(i_31),
    .cnt(i_32),
    .out(out_dut[7:0])
  );
  origen_081792__ref ref_i (
    .in0(i_0),
    .in1(i_1),
    .in2(i_2),
    .in3(i_3),
    .in4(i_4),
    .in5(i_5),
    .in6(i_6),
    .in7(i_7),
    .in8(i_8),
    .in9(i_9),
    .in10(i_10),
    .in11(i_11),
    .in12(i_12),
    .in13(i_13),
    .in14(i_14),
    .in15(i_15),
    .in16(i_16),
    .in17(i_17),
    .in18(i_18),
    .in19(i_19),
    .in20(i_20),
    .in21(i_21),
    .in22(i_22),
    .in23(i_23),
    .in24(i_24),
    .in25(i_25),
    .in26(i_26),
    .in27(i_27),
    .in28(i_28),
    .in29(i_29),
    .in30(i_30),
    .in31(i_31),
    .cnt(i_32),
    .out(out_ref[7:0])
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
    seed = 3285996798;
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
