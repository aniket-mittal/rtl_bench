// Hidden tests: 5000 cycles of seeded random inputs (seed 1669575951); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 71;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [31:0] i_6;
  reg [31:0] i_7;
  reg [4:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [31:0] i_11;
  reg [31:0] i_12;
  reg [4:0] i_13;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_03179 dut (
    .clock(clk),
    .reset(i_0),
    .M_Flush(i_1),
    .M_Stall(i_2),
    .WB_Stall(i_3),
    .M_RegWrite(i_4),
    .M_MemtoReg(i_5),
    .M_ReadData(i_6),
    .M_ALU_Result(i_7),
    .M_RtRd(i_8),
    .WB_RegWrite(i_9),
    .WB_MemtoReg(i_10),
    .WB_ReadData(i_11),
    .WB_ALU_Result(i_12),
    .WB_RtRd(i_13),
    .vote_WB_RegWrite(out_dut[70:70]),
    .vote_WB_MemtoReg(out_dut[69:69]),
    .vote_WB_ReadData(out_dut[68:37]),
    .vote_WB_ALU_Result(out_dut[36:5]),
    .vote_WB_RtRd(out_dut[4:0])
  );
  mg_03179__ref ref_i (
    .clock(clk),
    .reset(i_0),
    .M_Flush(i_1),
    .M_Stall(i_2),
    .WB_Stall(i_3),
    .M_RegWrite(i_4),
    .M_MemtoReg(i_5),
    .M_ReadData(i_6),
    .M_ALU_Result(i_7),
    .M_RtRd(i_8),
    .WB_RegWrite(i_9),
    .WB_MemtoReg(i_10),
    .WB_ReadData(i_11),
    .WB_ALU_Result(i_12),
    .WB_RtRd(i_13),
    .vote_WB_RegWrite(out_ref[70:70]),
    .vote_WB_MemtoReg(out_ref[69:69]),
    .vote_WB_ReadData(out_ref[68:37]),
    .vote_WB_ALU_Result(out_ref[36:5]),
    .vote_WB_RtRd(out_ref[4:0])
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
    seed = 1669575951;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
