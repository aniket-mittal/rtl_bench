// Hidden tests: 5000 cycles of seeded random inputs (seed 2492073009); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 11;
  reg clk;
  reg [1:0] i_0;
  reg [3:0] i_1;
  reg [3:0] i_2;
  reg [3:0] i_3;
  reg [3:0] i_4;
  reg [2:0] i_5;
  reg [2:0] i_6;
  reg [1:0] i_7;
  reg [0:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_063356 dut (
    .AN_count(i_0),
    .CNT0_1s(i_1),
    .CNT1s(i_2),
    .CNT1m(i_3),
    .CNT1h(i_4),
    .CNT10s(i_5),
    .CNT10m(i_6),
    .CNT10h(i_7),
    .sw(i_8),
    .AN(out_dut[10:7]),
    .LED(out_dut[6:0])
  );
  origen_063356__ref ref_i (
    .AN_count(i_0),
    .CNT0_1s(i_1),
    .CNT1s(i_2),
    .CNT1m(i_3),
    .CNT1h(i_4),
    .CNT10s(i_5),
    .CNT10m(i_6),
    .CNT10h(i_7),
    .sw(i_8),
    .AN(out_ref[10:7]),
    .LED(out_ref[6:0])
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
    seed = 2492073009;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
