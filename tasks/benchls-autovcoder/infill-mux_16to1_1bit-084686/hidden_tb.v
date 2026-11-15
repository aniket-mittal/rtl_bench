// Hidden tests: 5000 cycles of seeded random inputs (seed 1897089543); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 1;
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
  reg [0:0] i_17;
  reg [0:0] i_18;
  reg [0:0] i_19;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_084686 dut (
    .i0(i_0),
    .i1(i_1),
    .i2(i_2),
    .i3(i_3),
    .i4(i_4),
    .i5(i_5),
    .i6(i_6),
    .i7(i_7),
    .i8(i_8),
    .i9(i_9),
    .i10(i_10),
    .i11(i_11),
    .i12(i_12),
    .i13(i_13),
    .i14(i_14),
    .i15(i_15),
    .s0(i_16),
    .s1(i_17),
    .s2(i_18),
    .s3(i_19),
    .out(out_dut[0:0])
  );
  autovcoder_084686__ref ref_i (
    .i0(i_0),
    .i1(i_1),
    .i2(i_2),
    .i3(i_3),
    .i4(i_4),
    .i5(i_5),
    .i6(i_6),
    .i7(i_7),
    .i8(i_8),
    .i9(i_9),
    .i10(i_10),
    .i11(i_11),
    .i12(i_12),
    .i13(i_13),
    .i14(i_14),
    .i15(i_15),
    .s0(i_16),
    .s1(i_17),
    .s2(i_18),
    .s3(i_19),
    .out(out_ref[0:0])
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
    seed = 1897089543;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
