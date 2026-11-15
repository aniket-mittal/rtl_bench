// Hidden tests: 5000 cycles of seeded random inputs (seed 573566159); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 109;
  reg clk;
  reg [35:0] i_0;
  reg [35:0] i_1;
  reg [35:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_087176 dut (
    .InA(i_0),
    .InB(i_1),
    .InC(i_2),
    .OutA(out_dut[108:73]),
    .OutB(out_dut[72:37]),
    .OutC(out_dut[36:1]),
    .swap(out_dut[0:0])
  );
  origen_087176__ref ref_i (
    .InA(i_0),
    .InB(i_1),
    .InC(i_2),
    .OutA(out_ref[108:73]),
    .OutB(out_ref[72:37]),
    .OutC(out_ref[36:1]),
    .swap(out_ref[0:0])
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
    seed = 573566159;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed), $random(seed)};
      i_1 = {$random(seed), $random(seed)};
      i_2 = {$random(seed), $random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
