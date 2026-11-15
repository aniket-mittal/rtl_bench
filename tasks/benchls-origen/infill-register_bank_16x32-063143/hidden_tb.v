// Hidden tests: 5000 cycles of seeded random inputs (seed 987867588); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 512;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [31:0] i_17;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_063143 dut (
    .clk(clk),
    .clr(i_0),
    .R0_in(i_1),
    .R1_in(i_2),
    .R2_in(i_3),
    .R3_in(i_4),
    .R4_in(i_5),
    .R5_in(i_6),
    .R6_in(i_7),
    .R7_in(i_8),
    .R8_in(i_9),
    .R9_in(i_10),
    .R10_in(i_11),
    .R11_in(i_12),
    .R12_in(i_13),
    .R13_in(i_14),
    .R14_in(i_15),
    .R15_in(i_16),
    .BusMuxOut(i_17),
    .BusMuxIn_R0(out_dut[511:480]),
    .BusMuxIn_R1(out_dut[479:448]),
    .BusMuxIn_R2(out_dut[447:416]),
    .BusMuxIn_R3(out_dut[415:384]),
    .BusMuxIn_R4(out_dut[383:352]),
    .BusMuxIn_R5(out_dut[351:320]),
    .BusMuxIn_R6(out_dut[319:288]),
    .BusMuxIn_R7(out_dut[287:256]),
    .BusMuxIn_R8(out_dut[255:224]),
    .BusMuxIn_R9(out_dut[223:192]),
    .BusMuxIn_R10(out_dut[191:160]),
    .BusMuxIn_R11(out_dut[159:128]),
    .BusMuxIn_R12(out_dut[127:96]),
    .BusMuxIn_R13(out_dut[95:64]),
    .BusMuxIn_R14(out_dut[63:32]),
    .BusMuxIn_R15(out_dut[31:0])
  );
  origen_063143__ref ref_i (
    .clk(clk),
    .clr(i_0),
    .R0_in(i_1),
    .R1_in(i_2),
    .R2_in(i_3),
    .R3_in(i_4),
    .R4_in(i_5),
    .R5_in(i_6),
    .R6_in(i_7),
    .R7_in(i_8),
    .R8_in(i_9),
    .R9_in(i_10),
    .R10_in(i_11),
    .R11_in(i_12),
    .R12_in(i_13),
    .R13_in(i_14),
    .R14_in(i_15),
    .R15_in(i_16),
    .BusMuxOut(i_17),
    .BusMuxIn_R0(out_ref[511:480]),
    .BusMuxIn_R1(out_ref[479:448]),
    .BusMuxIn_R2(out_ref[447:416]),
    .BusMuxIn_R3(out_ref[415:384]),
    .BusMuxIn_R4(out_ref[383:352]),
    .BusMuxIn_R5(out_ref[351:320]),
    .BusMuxIn_R6(out_ref[319:288]),
    .BusMuxIn_R7(out_ref[287:256]),
    .BusMuxIn_R8(out_ref[255:224]),
    .BusMuxIn_R9(out_ref[223:192]),
    .BusMuxIn_R10(out_ref[191:160]),
    .BusMuxIn_R11(out_ref[159:128]),
    .BusMuxIn_R12(out_ref[127:96]),
    .BusMuxIn_R13(out_ref[95:64]),
    .BusMuxIn_R14(out_ref[63:32]),
    .BusMuxIn_R15(out_ref[31:0])
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
    seed = 987867588;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
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
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
