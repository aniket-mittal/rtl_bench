// Hidden tests: 5000 cycles of seeded random inputs (seed 441602523); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 53;
  reg clk;
  reg [12:0] i_0;
  reg [12:0] i_1;
  reg [9:0] i_2;
  reg [9:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_030222 dut (
    .iCLK(clk),
    .iXstart(i_0),
    .iYstart(i_1),
    .reading_sram(i_2),
    .reading_search(i_3),
    .oX_sram(out_dut[52:40]),
    .oY_sram(out_dut[39:27]),
    .oX_search(out_dut[26:14]),
    .oY_search(out_dut[13:1]),
    .finished(out_dut[0:0])
  );
  origen_030222__ref ref_i (
    .iCLK(clk),
    .iXstart(i_0),
    .iYstart(i_1),
    .reading_sram(i_2),
    .reading_search(i_3),
    .oX_sram(out_ref[52:40]),
    .oY_sram(out_ref[39:27]),
    .oX_search(out_ref[26:14]),
    .oY_search(out_ref[13:1]),
    .finished(out_ref[0:0])
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
    seed = 441602523;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
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
