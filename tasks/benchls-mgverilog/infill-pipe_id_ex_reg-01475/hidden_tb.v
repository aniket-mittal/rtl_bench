// Hidden tests: 5000 cycles of seeded random inputs (seed 1911883362); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 124;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [3:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [31:0] i_7;
  reg [4:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [7:0] i_11;
  reg [4:0] i_12;
  reg [0:0] i_13;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_01475 dut (
    .clk(clk),
    .i_wreg(i_0),
    .i_m2reg(i_1),
    .i_wmem(i_2),
    .i_aluc(i_3),
    .i_aluimm(i_4),
    .i_a(i_5),
    .i_b(i_6),
    .i_imm(i_7),
    .i_rn(i_8),
    .i_shift(i_9),
    .i_jal(i_10),
    .i_pc4(i_11),
    .i_sa(i_12),
    .rst(i_13),
    .o_wreg(out_dut[123:123]),
    .o_m2reg(out_dut[122:122]),
    .o_wmem(out_dut[121:121]),
    .o_aluc(out_dut[120:117]),
    .o_aluimm(out_dut[116:116]),
    .o_a(out_dut[115:84]),
    .o_b(out_dut[83:52]),
    .o_imm(out_dut[51:20]),
    .o_rn(out_dut[19:15]),
    .o_shift(out_dut[14:14]),
    .o_jal(out_dut[13:13]),
    .o_pc4(out_dut[12:5]),
    .o_sa(out_dut[4:0])
  );
  mg_01475__ref ref_i (
    .clk(clk),
    .i_wreg(i_0),
    .i_m2reg(i_1),
    .i_wmem(i_2),
    .i_aluc(i_3),
    .i_aluimm(i_4),
    .i_a(i_5),
    .i_b(i_6),
    .i_imm(i_7),
    .i_rn(i_8),
    .i_shift(i_9),
    .i_jal(i_10),
    .i_pc4(i_11),
    .i_sa(i_12),
    .rst(i_13),
    .o_wreg(out_ref[123:123]),
    .o_m2reg(out_ref[122:122]),
    .o_wmem(out_ref[121:121]),
    .o_aluc(out_ref[120:117]),
    .o_aluimm(out_ref[116:116]),
    .o_a(out_ref[115:84]),
    .o_b(out_ref[83:52]),
    .o_imm(out_ref[51:20]),
    .o_rn(out_ref[19:15]),
    .o_shift(out_ref[14:14]),
    .o_jal(out_ref[13:13]),
    .o_pc4(out_ref[12:5]),
    .o_sa(out_ref[4:0])
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
    seed = 1911883362;
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
      i_13 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
