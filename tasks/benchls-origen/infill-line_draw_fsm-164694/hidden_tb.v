// Hidden tests: 5000 cycles of seeded random inputs (seed 3701816148); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 21;
  reg clk;
  reg [0:0] i_0;
  reg [10:0] i_1;
  reg [10:0] i_2;
  reg [10:0] i_3;
  reg [10:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_164694 dut (
    .pclk(clk),
    .go(i_0),
    .stax(i_1),
    .stay(i_2),
    .endx(i_3),
    .endy(i_4),
    .busy(out_dut[20:20]),
    .wr(out_dut[19:19]),
    .addr(out_dut[18:0])
  );
  origen_164694__ref ref_i (
    .pclk(clk),
    .go(i_0),
    .stax(i_1),
    .stay(i_2),
    .endx(i_3),
    .endy(i_4),
    .busy(out_ref[20:20]),
    .wr(out_ref[19:19]),
    .addr(out_ref[18:0])
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
    seed = 3701816148;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
