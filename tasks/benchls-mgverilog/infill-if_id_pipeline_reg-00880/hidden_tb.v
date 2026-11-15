// Hidden tests: 5000 cycles of seeded random inputs (seed 1722392538); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 98;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [0:0] i_7;
  reg [31:0] i_8;
  reg [31:0] i_9;
  reg [31:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_00880 dut (
    .clock(clk),
    .reset(i_0),
    .IF_Flush(i_1),
    .IF_Stall(i_2),
    .ID_Stall(i_3),
    .IF_Instruction(i_4),
    .IF_PCAdd4(i_5),
    .IF_PC(i_6),
    .IF_IsBDS(i_7),
    .ID_Instruction(i_8),
    .ID_PCAdd4(i_9),
    .ID_RestartPC(i_10),
    .ID_IsBDS(i_11),
    .ID_IsFlushed(i_12),
    .vote_ID_Instruction(out_dut[97:66]),
    .vote_ID_PCAdd4(out_dut[65:34]),
    .vote_ID_RestartPC(out_dut[33:2]),
    .vote_ID_IsBDS(out_dut[1:1]),
    .vote_ID_IsFlushed(out_dut[0:0])
  );
  mg_00880__ref ref_i (
    .clock(clk),
    .reset(i_0),
    .IF_Flush(i_1),
    .IF_Stall(i_2),
    .ID_Stall(i_3),
    .IF_Instruction(i_4),
    .IF_PCAdd4(i_5),
    .IF_PC(i_6),
    .IF_IsBDS(i_7),
    .ID_Instruction(i_8),
    .ID_PCAdd4(i_9),
    .ID_RestartPC(i_10),
    .ID_IsBDS(i_11),
    .ID_IsFlushed(i_12),
    .vote_ID_Instruction(out_ref[97:66]),
    .vote_ID_PCAdd4(out_ref[65:34]),
    .vote_ID_RestartPC(out_ref[33:2]),
    .vote_ID_IsBDS(out_ref[1:1]),
    .vote_ID_IsFlushed(out_ref[0:0])
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
    seed = 1722392538;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
