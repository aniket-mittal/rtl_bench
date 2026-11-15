// Hidden tests: 5000 cycles of seeded random inputs (seed 2703643037); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 9;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [4:0] i_3;
  reg [4:0] i_4;
  reg [4:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [4:0] i_8;
  reg [4:0] i_9;
  reg [4:0] i_10;
  reg [4:0] i_11;
  reg [0:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_122334 dut (
    .clk(clk),
    .RegWriteW(i_0),
    .RegWriteM(i_1),
    .RegWriteE(i_2),
    .WriteRegW(i_3),
    .WriteRegM(i_4),
    .WriteRegE(i_5),
    .MemToRegM(i_6),
    .MemToRegE(i_7),
    .rsE(i_8),
    .rtE(i_9),
    .rsD(i_10),
    .rtD(i_11),
    .BranchD(i_12),
    .ForwardAE(out_dut[8:7]),
    .ForwardBE(out_dut[6:5]),
    .ForwardAD(out_dut[4:4]),
    .ForwardBD(out_dut[3:3]),
    .FlushE(out_dut[2:2]),
    .StallD(out_dut[1:1]),
    .StallF(out_dut[0:0])
  );
  origen_122334__ref ref_i (
    .clk(clk),
    .RegWriteW(i_0),
    .RegWriteM(i_1),
    .RegWriteE(i_2),
    .WriteRegW(i_3),
    .WriteRegM(i_4),
    .WriteRegE(i_5),
    .MemToRegM(i_6),
    .MemToRegE(i_7),
    .rsE(i_8),
    .rtE(i_9),
    .rsD(i_10),
    .rtD(i_11),
    .BranchD(i_12),
    .ForwardAE(out_ref[8:7]),
    .ForwardBE(out_ref[6:5]),
    .ForwardAD(out_ref[4:4]),
    .ForwardBD(out_ref[3:3]),
    .FlushE(out_ref[2:2]),
    .StallD(out_ref[1:1]),
    .StallF(out_ref[0:0])
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
    seed = 2703643037;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
