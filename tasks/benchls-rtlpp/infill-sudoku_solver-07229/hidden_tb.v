// Hidden tests: 5000 cycles of seeded random inputs (seed 1096633233); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 38;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [4:0] i_8;
  reg [4:0] i_9;
  reg [4:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_07229 dut (
    .Clk(clk),
    .R(i_0),
    .L(i_1),
    .U(i_2),
    .D(i_3),
    .C(i_4),
    .Reset(i_5),
    .Ack(i_6),
    .CheckSolu(i_7),
    .userIn(i_8),
    .disp_i(i_9),
    .disp_j(i_10),
    .q_I(out_dut[37:37]),
    .q_Solve(out_dut[36:36]),
    .q_Check(out_dut[35:35]),
    .q_Correct(out_dut[34:34]),
    .q_Incorrect(out_dut[33:33]),
    .i(out_dut[32:28]),
    .j(out_dut[27:23]),
    .row(out_dut[22:19]),
    .col(out_dut[18:15]),
    .puzzle_ij(out_dut[14:10]),
    .solu_ij(out_dut[9:5]),
    .disp_value(out_dut[4:0])
  );
  rtlpp_07229__ref ref_i (
    .Clk(clk),
    .R(i_0),
    .L(i_1),
    .U(i_2),
    .D(i_3),
    .C(i_4),
    .Reset(i_5),
    .Ack(i_6),
    .CheckSolu(i_7),
    .userIn(i_8),
    .disp_i(i_9),
    .disp_j(i_10),
    .q_I(out_ref[37:37]),
    .q_Solve(out_ref[36:36]),
    .q_Check(out_ref[35:35]),
    .q_Correct(out_ref[34:34]),
    .q_Incorrect(out_ref[33:33]),
    .i(out_ref[32:28]),
    .j(out_ref[27:23]),
    .row(out_ref[22:19]),
    .col(out_ref[18:15]),
    .puzzle_ij(out_ref[14:10]),
    .solu_ij(out_ref[9:5]),
    .disp_value(out_ref[4:0])
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
    seed = 1096633233;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
