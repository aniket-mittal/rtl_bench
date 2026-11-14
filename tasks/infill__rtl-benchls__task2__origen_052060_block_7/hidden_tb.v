// Hidden tests: 5000 cycles of seeded random inputs (seed 975536429); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 6;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [4:0] i_3;
  reg [4:0] i_4;
  reg [4:0] i_5;
  reg [4:0] i_6;
  reg [1:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [31:0] i_11;
  reg [31:0] i_12;
  reg [31:0] i_13;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_052060 dut (
    .RegWrite_EX_MEM(i_0),
    .RegWrite_MEM_WB(i_1),
    .RegWrite_ID_EX(i_2),
    .RS_ID_EX(i_3),
    .RT_ID_EX(i_4),
    .RS_IF_ID(i_5),
    .RegRd_MEM_WB(i_6),
    .PCSrc(i_7),
    .ID_EX_RegDst(i_8),
    .MEM_WB_RegDst(i_9),
    .EX_MEM_RegDst(i_10),
    .instruction_ID_EX(i_11),
    .instruction_EX_MEM(i_12),
    .instruction_MEM_WB(i_13),
    .ForwardA(out_dut[5:4]),
    .ForwardB(out_dut[3:2]),
    .ForwardJR(out_dut[1:0])
  );
  origen_052060__ref ref_i (
    .RegWrite_EX_MEM(i_0),
    .RegWrite_MEM_WB(i_1),
    .RegWrite_ID_EX(i_2),
    .RS_ID_EX(i_3),
    .RT_ID_EX(i_4),
    .RS_IF_ID(i_5),
    .RegRd_MEM_WB(i_6),
    .PCSrc(i_7),
    .ID_EX_RegDst(i_8),
    .MEM_WB_RegDst(i_9),
    .EX_MEM_RegDst(i_10),
    .instruction_ID_EX(i_11),
    .instruction_EX_MEM(i_12),
    .instruction_MEM_WB(i_13),
    .ForwardA(out_ref[5:4]),
    .ForwardB(out_ref[3:2]),
    .ForwardJR(out_ref[1:0])
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
    seed = 975536429;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
