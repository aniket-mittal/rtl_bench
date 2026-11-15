// Hidden tests: 5000 cycles of seeded random inputs (seed 500431746); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 4;
  reg clk;
  reg [25:0] i_0;
  reg [25:0] i_1;
  reg [25:0] i_2;
  reg [25:0] i_3;
  reg [25:0] i_4;
  reg [25:0] i_5;
  reg [25:0] i_6;
  reg [25:0] i_7;
  reg [25:0] i_8;
  reg [25:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_189240 dut (
    .out1(i_0),
    .out2(i_1),
    .out3(i_2),
    .out4(i_3),
    .out5(i_4),
    .out6(i_5),
    .out7(i_6),
    .out8(i_7),
    .out9(i_8),
    .out10(i_9),
    .max(out_dut[3:0])
  );
  origen_189240__ref ref_i (
    .out1(i_0),
    .out2(i_1),
    .out3(i_2),
    .out4(i_3),
    .out5(i_4),
    .out6(i_5),
    .out7(i_6),
    .out8(i_7),
    .out9(i_8),
    .out10(i_9),
    .max(out_ref[3:0])
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
    seed = 500431746;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
