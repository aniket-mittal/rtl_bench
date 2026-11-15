// Hidden tests: 5000 cycles of seeded random inputs (seed 4118823848); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 32;
  reg clk;
  reg [31:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [31:0] i_7;
  reg [31:0] i_8;
  reg [31:0] i_9;
  reg [31:0] i_10;
  reg [31:0] i_11;
  reg [31:0] i_12;
  reg [31:0] i_13;
  reg [31:0] i_14;
  reg [31:0] i_15;
  reg [31:0] i_16;
  reg [31:0] i_17;
  reg [31:0] i_18;
  reg [31:0] i_19;
  reg [4:0] i_20;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_026774 dut (
    .din1(i_0),
    .din2(i_1),
    .din3(i_2),
    .din4(i_3),
    .din5(i_4),
    .din6(i_5),
    .din7(i_6),
    .din8(i_7),
    .din9(i_8),
    .din10(i_9),
    .din11(i_10),
    .din12(i_11),
    .din13(i_12),
    .din14(i_13),
    .din15(i_14),
    .din16(i_15),
    .din17(i_16),
    .din18(i_17),
    .din19(i_18),
    .din20(i_19),
    .din21(i_20),
    .dout(out_dut[31:0])
  );
  autovcoder_026774__ref ref_i (
    .din1(i_0),
    .din2(i_1),
    .din3(i_2),
    .din4(i_3),
    .din5(i_4),
    .din6(i_5),
    .din7(i_6),
    .din8(i_7),
    .din9(i_8),
    .din10(i_9),
    .din11(i_10),
    .din12(i_11),
    .din13(i_12),
    .din14(i_13),
    .din15(i_14),
    .din16(i_15),
    .din17(i_16),
    .din18(i_17),
    .din19(i_18),
    .din20(i_19),
    .din21(i_20),
    .dout(out_ref[31:0])
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
    seed = 4118823848;
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
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
