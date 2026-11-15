// Hidden tests: 5000 cycles of seeded random inputs (seed 1583977267); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 64;
  reg clk;
  reg [25:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [31:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_011121 dut (
    .i_Imm26(i_0),
    .i_PC(i_1),
    .i_PC_4_dec(i_2),
    .i_Rs(i_3),
    .i_Zero_dec(i_4),
    .i_J(i_5),
    .i_Jr(i_6),
    .i_Beq(i_7),
    .i_Bne(i_8),
    .i_exeption(i_9),
    .i_eret(i_10),
    .i_s_rst_dec(i_11),
    .i_epc_to_pc(i_12),
    .o_NextPC(out_dut[63:32]),
    .o_PC_4(out_dut[31:0])
  );
  origen_011121__ref ref_i (
    .i_Imm26(i_0),
    .i_PC(i_1),
    .i_PC_4_dec(i_2),
    .i_Rs(i_3),
    .i_Zero_dec(i_4),
    .i_J(i_5),
    .i_Jr(i_6),
    .i_Beq(i_7),
    .i_Bne(i_8),
    .i_exeption(i_9),
    .i_eret(i_10),
    .i_s_rst_dec(i_11),
    .i_epc_to_pc(i_12),
    .o_NextPC(out_ref[63:32]),
    .o_PC_4(out_ref[31:0])
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
    seed = 1583977267;
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
      i_11 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_12 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
