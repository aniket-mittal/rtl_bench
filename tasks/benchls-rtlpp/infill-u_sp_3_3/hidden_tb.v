// Hidden tests: 5000 cycles of seeded random inputs (seed 3563078620); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 9;
  reg clk;
  reg [2:0] i_0;
  reg [2:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  U_SP_3_3 dut (
    .IN1(i_0),
    .IN2(i_1),
    .P0(out_dut[8:8]),
    .P1(out_dut[7:6]),
    .P2(out_dut[5:3]),
    .P3(out_dut[2:1]),
    .P4(out_dut[0:0])
  );
  U_SP_3_3__ref ref_i (
    .IN1(i_0),
    .IN2(i_1),
    .P0(out_ref[8:8]),
    .P1(out_ref[7:6]),
    .P2(out_ref[5:3]),
    .P3(out_ref[2:1]),
    .P4(out_ref[0:0])
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
    seed = 3563078620;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
