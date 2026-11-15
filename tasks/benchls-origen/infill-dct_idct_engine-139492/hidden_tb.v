// Hidden tests: 5000 cycles of seeded random inputs (seed 2149196573); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 129;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [15:0] i_2;
  reg [15:0] i_3;
  reg [15:0] i_4;
  reg [15:0] i_5;
  reg [15:0] i_6;
  reg [15:0] i_7;
  reg [15:0] i_8;
  reg [15:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_139492 dut (
    .clk(clk),
    .rst(i_0),
    .start(i_1),
    .in1(i_2),
    .in2(i_3),
    .in3(i_4),
    .in4(i_5),
    .in5(i_6),
    .in6(i_7),
    .in7(i_8),
    .in8(i_9),
    .out1(out_dut[128:113]),
    .out2(out_dut[112:97]),
    .out3(out_dut[96:81]),
    .out4(out_dut[80:65]),
    .out5(out_dut[64:49]),
    .out6(out_dut[48:33]),
    .out7(out_dut[32:17]),
    .out8(out_dut[16:1]),
    .done(out_dut[0:0])
  );
  origen_139492__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .start(i_1),
    .in1(i_2),
    .in2(i_3),
    .in3(i_4),
    .in4(i_5),
    .in5(i_6),
    .in6(i_7),
    .in7(i_8),
    .in8(i_9),
    .out1(out_ref[128:113]),
    .out2(out_ref[112:97]),
    .out3(out_ref[96:81]),
    .out4(out_ref[80:65]),
    .out5(out_ref[64:49]),
    .out6(out_ref[48:33]),
    .out7(out_ref[32:17]),
    .out8(out_ref[16:1]),
    .done(out_ref[0:0])
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
    seed = 2149196573;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
