// Hidden tests: 5000 cycles of seeded random inputs (seed 1164505433); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 17;
  reg clk;
  reg [0:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_065264 dut (
    .ck(clk),
    .start(i_0),
    .round0(out_dut[16:16]),
    .round1(out_dut[15:15]),
    .round(out_dut[14:10]),
    .ready(out_dut[9:9]),
    .sels(out_dut[8:5]),
    .selk(out_dut[4:0])
  );
  origen_065264__ref ref_i (
    .ck(clk),
    .start(i_0),
    .round0(out_ref[16:16]),
    .round1(out_ref[15:15]),
    .round(out_ref[14:10]),
    .ready(out_ref[9:9]),
    .sels(out_ref[8:5]),
    .selk(out_ref[4:0])
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
    seed = 1164505433;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
