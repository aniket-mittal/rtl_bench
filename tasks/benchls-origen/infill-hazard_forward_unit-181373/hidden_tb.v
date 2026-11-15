// Hidden tests: 5000 cycles of seeded random inputs (seed 3325818190); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 3;
  reg clk;
  reg [4:0] i_0;
  reg [4:0] i_1;
  reg [4:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [4:0] i_8;
  reg [4:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_181373 dut (
    .iID_NumRs(i_0),
    .iID_NumRt(i_1),
    .iEX_NumRt(i_2),
    .iEX_MemRead(i_3),
    .iEX_RegWrite(i_4),
    .iMEM_MemRead(i_5),
    .iMEM_RegWrite(i_6),
    .iCJr(i_7),
    .iEX_RegDst(i_8),
    .iMEM_RegDst(i_9),
    .iBranch(i_10),
    .iEX_MovN(i_11),
    .iEX_MovZ(i_12),
    .iMEM_MovN(i_13),
    .iMEM_MovZ(i_14),
    .oHazard(out_dut[2:2]),
    .oForwardJr(out_dut[1:1]),
    .oForwardPC4(out_dut[0:0])
  );
  origen_181373__ref ref_i (
    .iID_NumRs(i_0),
    .iID_NumRt(i_1),
    .iEX_NumRt(i_2),
    .iEX_MemRead(i_3),
    .iEX_RegWrite(i_4),
    .iMEM_MemRead(i_5),
    .iMEM_RegWrite(i_6),
    .iCJr(i_7),
    .iEX_RegDst(i_8),
    .iMEM_RegDst(i_9),
    .iBranch(i_10),
    .iEX_MovN(i_11),
    .iEX_MovZ(i_12),
    .iMEM_MovN(i_13),
    .iMEM_MovZ(i_14),
    .oHazard(out_ref[2:2]),
    .oForwardJr(out_ref[1:1]),
    .oForwardPC4(out_ref[0:0])
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
    seed = 3325818190;
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
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
