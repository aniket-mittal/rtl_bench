// Hidden tests: 5000 cycles of seeded random inputs (seed 1276873958); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 16;
  reg clk;
  reg [3:0] i_0;
  reg [15:0] i_1;
  reg [15:0] i_2;
  reg [15:0] i_3;
  reg [15:0] i_4;
  reg [15:0] i_5;
  reg [15:0] i_6;
  reg [15:0] i_7;
  reg [15:0] i_8;
  reg [15:0] i_9;
  reg [15:0] i_10;
  reg [15:0] i_11;
  reg [15:0] i_12;
  reg [15:0] i_13;
  reg [15:0] i_14;
  reg [15:0] i_15;
  reg [15:0] i_16;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_089915 dut (
    .sel(i_0),
    .in0(i_1),
    .in1(i_2),
    .in2(i_3),
    .in3(i_4),
    .in4(i_5),
    .in5(i_6),
    .in6(i_7),
    .in7(i_8),
    .in8(i_9),
    .in9(i_10),
    .in10(i_11),
    .in11(i_12),
    .in12(i_13),
    .in13(i_14),
    .in14(i_15),
    .in15(i_16),
    .out(out_dut[15:0])
  );
  autovcoder_089915__ref ref_i (
    .sel(i_0),
    .in0(i_1),
    .in1(i_2),
    .in2(i_3),
    .in3(i_4),
    .in4(i_5),
    .in5(i_6),
    .in6(i_7),
    .in7(i_8),
    .in8(i_9),
    .in9(i_10),
    .in10(i_11),
    .in11(i_12),
    .in12(i_13),
    .in13(i_14),
    .in14(i_15),
    .in15(i_16),
    .out(out_ref[15:0])
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
    seed = 1276873958;
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
