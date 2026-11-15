// Hidden tests: 5000 cycles of seeded random inputs (seed 3536678199); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 12;
  reg clk;
  reg [8:0] i_0;
  reg [8:0] i_1;
  reg [8:0] i_2;
  reg [8:0] i_3;
  reg [8:0] i_4;
  reg [8:0] i_5;
  reg [8:0] i_6;
  reg [8:0] i_7;
  reg [1:0] i_8;
  reg [1:0] i_9;
  reg [1:0] i_10;
  reg [1:0] i_11;
  reg [1:0] i_12;
  reg [1:0] i_13;
  reg [1:0] i_14;
  reg [1:0] i_15;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_048861 dut (
    .clk(clk),
    .A1(i_0),
    .A2(i_1),
    .A3(i_2),
    .A4(i_3),
    .A5(i_4),
    .A6(i_5),
    .A7(i_6),
    .A8(i_7),
    .W1(i_8),
    .W2(i_9),
    .W3(i_10),
    .W4(i_11),
    .W5(i_12),
    .W6(i_13),
    .W7(i_14),
    .W8(i_15),
    .out_neuron(out_dut[11:0])
  );
  origen_048861__ref ref_i (
    .clk(clk),
    .A1(i_0),
    .A2(i_1),
    .A3(i_2),
    .A4(i_3),
    .A5(i_4),
    .A6(i_5),
    .A7(i_6),
    .A8(i_7),
    .W1(i_8),
    .W2(i_9),
    .W3(i_10),
    .W4(i_11),
    .W5(i_12),
    .W6(i_13),
    .W7(i_14),
    .W8(i_15),
    .out_neuron(out_ref[11:0])
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
    seed = 3536678199;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
