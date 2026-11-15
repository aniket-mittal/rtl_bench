// Hidden tests: 5000 cycles of seeded random inputs (seed 1533327918); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 7;
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
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_029777 dut (
    .x0(i_0),
    .x1(i_1),
    .x2(i_2),
    .x3(i_3),
    .x4(i_4),
    .x5(i_5),
    .x6(i_6),
    .x7(i_7),
    .x8(i_8),
    .x9(i_9),
    .z0(out_dut[6:6]),
    .z1(out_dut[5:5]),
    .z2(out_dut[4:4]),
    .z3(out_dut[3:3]),
    .z4(out_dut[2:2]),
    .z5(out_dut[1:1]),
    .z6(out_dut[0:0])
  );
  origen_029777__ref ref_i (
    .x0(i_0),
    .x1(i_1),
    .x2(i_2),
    .x3(i_3),
    .x4(i_4),
    .x5(i_5),
    .x6(i_6),
    .x7(i_7),
    .x8(i_8),
    .x9(i_9),
    .z0(out_ref[6:6]),
    .z1(out_ref[5:5]),
    .z2(out_ref[4:4]),
    .z3(out_ref[3:3]),
    .z4(out_ref[2:2]),
    .z5(out_ref[1:1]),
    .z6(out_ref[0:0])
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
    seed = 1533327918;
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
