// Hidden tests: 5000 cycles of seeded random inputs (seed 2941963441); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 15;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_120381 dut (
    .i_CLK(clk),
    .i_RST(i_0),
    .i_SET(i_1),
    .i_HR_INCR(i_2),
    .i_MN_INCR(i_3),
    .o_HR_U(out_dut[14:11]),
    .o_HR_T(out_dut[10:9]),
    .o_MN_U(out_dut[8:5]),
    .o_MN_T(out_dut[4:2]),
    .o_SEC(out_dut[1:1]),
    .o_VALID(out_dut[0:0])
  );
  origen_120381__ref ref_i (
    .i_CLK(clk),
    .i_RST(i_0),
    .i_SET(i_1),
    .i_HR_INCR(i_2),
    .i_MN_INCR(i_3),
    .o_HR_U(out_ref[14:11]),
    .o_HR_T(out_ref[10:9]),
    .o_MN_U(out_ref[8:5]),
    .o_MN_T(out_ref[4:2]),
    .o_SEC(out_ref[1:1]),
    .o_VALID(out_ref[0:0])
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
    seed = 2941963441;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
