// Hidden tests: 5000 cycles of seeded random inputs (seed 354743196); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 52;
  reg clk;
  reg [1:0] i_0;
  reg [1:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_216277 dut (
    .clk(clk),
    .state(i_0),
    .game_status(i_1),
    .a(out_dut[51:45]),
    .b(out_dut[44:38]),
    .c(out_dut[37:31]),
    .d(out_dut[30:24]),
    .e(out_dut[23:17]),
    .f(out_dut[16:10]),
    .g(out_dut[9:3]),
    .e1(out_dut[2:2]),
    .e2(out_dut[1:1]),
    .e3(out_dut[0:0])
  );
  origen_216277__ref ref_i (
    .clk(clk),
    .state(i_0),
    .game_status(i_1),
    .a(out_ref[51:45]),
    .b(out_ref[44:38]),
    .c(out_ref[37:31]),
    .d(out_ref[30:24]),
    .e(out_ref[23:17]),
    .f(out_ref[16:10]),
    .g(out_ref[9:3]),
    .e1(out_ref[2:2]),
    .e2(out_ref[1:1]),
    .e3(out_ref[0:0])
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
    seed = 354743196;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
