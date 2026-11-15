// Hidden tests: 5000 cycles of seeded random inputs (seed 1038728092); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 2;
  reg clk;
  reg [3:0] i_0;
  reg [1:0] i_1;
  reg [1:0] i_2;
  reg [1:0] i_3;
  reg [1:0] i_4;
  reg [1:0] i_5;
  reg [1:0] i_6;
  reg [1:0] i_7;
  reg [1:0] i_8;
  reg [1:0] i_9;
  reg [1:0] i_10;
  reg [1:0] i_11;
  reg [1:0] i_12;
  reg [1:0] i_13;
  reg [1:0] i_14;
  reg [1:0] i_15;
  reg [1:0] i_16;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_018001 dut (
    .sel(i_0),
    .in_0(i_1),
    .in_1(i_2),
    .in_2(i_3),
    .in_3(i_4),
    .in_4(i_5),
    .in_5(i_6),
    .in_6(i_7),
    .in_7(i_8),
    .in_8(i_9),
    .in_9(i_10),
    .in_10(i_11),
    .in_11(i_12),
    .in_12(i_13),
    .in_13(i_14),
    .in_14(i_15),
    .in_15(i_16),
    .out(out_dut[1:0])
  );
  autovcoder_018001__ref ref_i (
    .sel(i_0),
    .in_0(i_1),
    .in_1(i_2),
    .in_2(i_3),
    .in_3(i_4),
    .in_4(i_5),
    .in_5(i_6),
    .in_6(i_7),
    .in_7(i_8),
    .in_8(i_9),
    .in_9(i_10),
    .in_10(i_11),
    .in_11(i_12),
    .in_12(i_13),
    .in_13(i_14),
    .in_14(i_15),
    .in_15(i_16),
    .out(out_ref[1:0])
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
    seed = 1038728092;
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
