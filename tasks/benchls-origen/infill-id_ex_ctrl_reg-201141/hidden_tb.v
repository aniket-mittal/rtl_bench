// Hidden tests: 5000 cycles of seeded random inputs (seed 1895571878); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 14;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [1:0] i_4;
  reg [1:0] i_5;
  reg [2:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_201141 dut (
    .RegWrite_IN(i_0),
    .MemRead_IN(i_1),
    .MemWrite_IN(i_2),
    .JLFlag_IN(i_3),
    .AluBSRC_IN(i_4),
    .WriteDataSRC_IN(i_5),
    .AluCtl_IN(i_6),
    .IsBranch_IN(i_7),
    .targetSRC_IN(i_8),
    .stall(i_9),
    .bImm_IN(i_10),
    .RegWrite_OUT(out_dut[13:13]),
    .MemRead_OUT(out_dut[12:12]),
    .MemWrite_OUT(out_dut[11:11]),
    .JLFlag_OUT(out_dut[10:10]),
    .AluBSRC_OUT(out_dut[9:8]),
    .WriteDataSRC_OUT(out_dut[7:6]),
    .AluCtl_OUT(out_dut[5:3]),
    .IsBranch_OUT(out_dut[2:2]),
    .targetSRC_OUT(out_dut[1:1]),
    .bImm_OUT(out_dut[0:0])
  );
  origen_201141__ref ref_i (
    .RegWrite_IN(i_0),
    .MemRead_IN(i_1),
    .MemWrite_IN(i_2),
    .JLFlag_IN(i_3),
    .AluBSRC_IN(i_4),
    .WriteDataSRC_IN(i_5),
    .AluCtl_IN(i_6),
    .IsBranch_IN(i_7),
    .targetSRC_IN(i_8),
    .stall(i_9),
    .bImm_IN(i_10),
    .RegWrite_OUT(out_ref[13:13]),
    .MemRead_OUT(out_ref[12:12]),
    .MemWrite_OUT(out_ref[11:11]),
    .JLFlag_OUT(out_ref[10:10]),
    .AluBSRC_OUT(out_ref[9:8]),
    .WriteDataSRC_OUT(out_ref[7:6]),
    .AluCtl_OUT(out_ref[5:3]),
    .IsBranch_OUT(out_ref[2:2]),
    .targetSRC_OUT(out_ref[1:1]),
    .bImm_OUT(out_ref[0:0])
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
    seed = 1895571878;
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
