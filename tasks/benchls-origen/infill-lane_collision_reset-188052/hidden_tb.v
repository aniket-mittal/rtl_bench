// Hidden tests: 5000 cycles of seeded random inputs (seed 2731362569); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 1;
  reg clk;
  reg [0:0] i_0;
  reg [7:0] i_1;
  reg [7:0] i_2;
  reg [7:0] i_3;
  reg [7:0] i_4;
  reg [7:0] i_5;
  reg [6:0] i_6;
  reg [6:0] i_7;
  reg [6:0] i_8;
  reg [6:0] i_9;
  reg [6:0] i_10;
  reg [7:0] i_11;
  reg [6:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_188052 dut (
    .CLK(clk),
    .go(i_0),
    .x_lane0(i_1),
    .x_lane1(i_2),
    .x_lane2(i_3),
    .x_lane3(i_4),
    .x_lane4(i_5),
    .y_lane0(i_6),
    .y_lane1(i_7),
    .y_lane2(i_8),
    .y_lane3(i_9),
    .y_lane4(i_10),
    .x_dot(i_11),
    .y_dot(i_12),
    .resetn(out_dut[0:0])
  );
  origen_188052__ref ref_i (
    .CLK(clk),
    .go(i_0),
    .x_lane0(i_1),
    .x_lane1(i_2),
    .x_lane2(i_3),
    .x_lane3(i_4),
    .x_lane4(i_5),
    .y_lane0(i_6),
    .y_lane1(i_7),
    .y_lane2(i_8),
    .y_lane3(i_9),
    .y_lane4(i_10),
    .x_dot(i_11),
    .y_dot(i_12),
    .resetn(out_ref[0:0])
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
    seed = 2731362569;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
