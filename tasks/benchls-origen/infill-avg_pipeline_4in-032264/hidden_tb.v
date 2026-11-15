// Hidden tests: 5000 cycles of seeded random inputs (seed 584705726); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 33;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
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
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_032264 dut (
    .Clk(clk),
    .Rst(i_0),
    .Start(i_1),
    .a(i_2),
    .b(i_3),
    .c(i_4),
    .d(i_5),
    .e(i_6),
    .f(i_7),
    .g(i_8),
    .h(i_9),
    .sa(i_10),
    .one(i_11),
    .two(i_12),
    .four(i_13),
    .Done(out_dut[32:32]),
    .avg(out_dut[31:0])
  );
  origen_032264__ref ref_i (
    .Clk(clk),
    .Rst(i_0),
    .Start(i_1),
    .a(i_2),
    .b(i_3),
    .c(i_4),
    .d(i_5),
    .e(i_6),
    .f(i_7),
    .g(i_8),
    .h(i_9),
    .sa(i_10),
    .one(i_11),
    .two(i_12),
    .four(i_13),
    .Done(out_ref[32:32]),
    .avg(out_ref[31:0])
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
    seed = 584705726;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
