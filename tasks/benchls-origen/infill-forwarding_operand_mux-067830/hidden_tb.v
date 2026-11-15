// Hidden tests: 5000 cycles of seeded random inputs (seed 2796106548); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 96;
  reg clk;
  reg [31:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [1:0] i_7;
  reg [1:0] i_8;
  reg [1:0] i_9;
  reg [0:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_067830 dut (
    .i_Data_From_MEM(i_0),
    .i_Data_From_WB(i_1),
    .i_Data_From_vWB(i_2),
    .i_Rs1(i_3),
    .i_Rs2(i_4),
    .i_Immediate(i_5),
    .i_PC(i_6),
    .i_Fwrd_Ctrl1(i_7),
    .i_Fwrd_Ctrl2(i_8),
    .i_ALU_src1_Ctrl(i_9),
    .i_ALU_src2_Ctrl(i_10),
    .o_Op1(out_dut[95:64]),
    .o_Op2(out_dut[63:32]),
    .o_Store_Data(out_dut[31:0])
  );
  origen_067830__ref ref_i (
    .i_Data_From_MEM(i_0),
    .i_Data_From_WB(i_1),
    .i_Data_From_vWB(i_2),
    .i_Rs1(i_3),
    .i_Rs2(i_4),
    .i_Immediate(i_5),
    .i_PC(i_6),
    .i_Fwrd_Ctrl1(i_7),
    .i_Fwrd_Ctrl2(i_8),
    .i_ALU_src1_Ctrl(i_9),
    .i_ALU_src2_Ctrl(i_10),
    .o_Op1(out_ref[95:64]),
    .o_Op2(out_ref[63:32]),
    .o_Store_Data(out_ref[31:0])
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
    seed = 2796106548;
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
