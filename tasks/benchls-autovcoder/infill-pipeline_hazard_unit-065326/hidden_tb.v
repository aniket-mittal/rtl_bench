// Hidden tests: 5000 cycles of seeded random inputs (seed 280239705); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 8;
  reg clk;
  reg [4:0] i_0;
  reg [4:0] i_1;
  reg [4:0] i_2;
  reg [4:0] i_3;
  reg [4:0] i_4;
  reg [4:0] i_5;
  reg [4:0] i_6;
  reg [1:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_065326 dut (
    .Rs1E(i_0),
    .Rs2E(i_1),
    .RdM(i_2),
    .RdW(i_3),
    .Rs1D(i_4),
    .Rs2D(i_5),
    .RdE(i_6),
    .ResultSrcE(i_7),
    .RegWriteM(i_8),
    .RegWriteW(i_9),
    .PCSrcE(i_10),
    .StallF(out_dut[7:7]),
    .StallD(out_dut[6:6]),
    .FlushE(out_dut[5:5]),
    .FlushD(out_dut[4:4]),
    .ForwardAE(out_dut[3:2]),
    .ForwardBE(out_dut[1:0])
  );
  autovcoder_065326__ref ref_i (
    .Rs1E(i_0),
    .Rs2E(i_1),
    .RdM(i_2),
    .RdW(i_3),
    .Rs1D(i_4),
    .Rs2D(i_5),
    .RdE(i_6),
    .ResultSrcE(i_7),
    .RegWriteM(i_8),
    .RegWriteW(i_9),
    .PCSrcE(i_10),
    .StallF(out_ref[7:7]),
    .StallD(out_ref[6:6]),
    .FlushE(out_ref[5:5]),
    .FlushD(out_ref[4:4]),
    .ForwardAE(out_ref[3:2]),
    .ForwardBE(out_ref[1:0])
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
    seed = 280239705;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
