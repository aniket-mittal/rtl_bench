// Hidden tests: 5000 cycles of seeded random inputs (seed 2908776944); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 7;
  reg clk;
  reg [4:0] i_0;
  reg [4:0] i_1;
  reg [4:0] i_2;
  reg [4:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [4:0] i_9;
  reg [4:0] i_10;
  reg [4:0] i_11;
  reg [0:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_157291 dut (
    .rsD(i_0),
    .rtD(i_1),
    .rsE(i_2),
    .rtE(i_3),
    .memtoregE(i_4),
    .memtoregM(i_5),
    .regwriteE(i_6),
    .regwriteM(i_7),
    .regwriteW(i_8),
    .writeregE(i_9),
    .writeregM(i_10),
    .writeregW(i_11),
    .branchD(i_12),
    .stallF(out_dut[6:6]),
    .stallD(out_dut[5:5]),
    .forwardAD(out_dut[4:4]),
    .forwardBD(out_dut[3:3]),
    .forwardAE(out_dut[2:2]),
    .forwardBE(out_dut[1:1]),
    .flushE(out_dut[0:0])
  );
  origen_157291__ref ref_i (
    .rsD(i_0),
    .rtD(i_1),
    .rsE(i_2),
    .rtE(i_3),
    .memtoregE(i_4),
    .memtoregM(i_5),
    .regwriteE(i_6),
    .regwriteM(i_7),
    .regwriteW(i_8),
    .writeregE(i_9),
    .writeregM(i_10),
    .writeregW(i_11),
    .branchD(i_12),
    .stallF(out_ref[6:6]),
    .stallD(out_ref[5:5]),
    .forwardAD(out_ref[4:4]),
    .forwardBD(out_ref[3:3]),
    .forwardAE(out_ref[2:2]),
    .forwardBE(out_ref[1:1]),
    .flushE(out_ref[0:0])
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
    seed = 2908776944;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
