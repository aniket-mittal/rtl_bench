// Hidden tests: 5000 cycles of seeded random inputs (seed 1238662857); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 2;
  reg clk;
  reg [4:0] i_0;
  reg [1:0] i_1;
  reg [1:0] i_2;
  reg [1:0] i_3;
  reg [1:0] i_4;
  reg [1:0] i_5;
  reg [1:0] i_6;
  reg [1:0] i_7;
  reg [1:0] i_8;
  reg [1:0] i_9;
  reg [1:0] i_10;
  reg [1:0] i_11;
  reg [1:0] i_12;
  reg [1:0] i_13;
  reg [1:0] i_14;
  reg [1:0] i_15;
  reg [1:0] i_16;
  reg [1:0] i_17;
  reg [1:0] i_18;
  reg [1:0] i_19;
  reg [1:0] i_20;
  reg [1:0] i_21;
  reg [1:0] i_22;
  reg [1:0] i_23;
  reg [1:0] i_24;
  reg [1:0] i_25;
  reg [1:0] i_26;
  reg [1:0] i_27;
  reg [1:0] i_28;
  reg [1:0] i_29;
  reg [1:0] i_30;
  reg [1:0] i_31;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_085012 dut (
    .sel(i_0),
    .inp0(i_1),
    .inp1(i_2),
    .inp2(i_3),
    .inp3(i_4),
    .inp4(i_5),
    .inp5(i_6),
    .inp6(i_7),
    .inp7(i_8),
    .inp8(i_9),
    .inp9(i_10),
    .inp10(i_11),
    .inp11(i_12),
    .inp12(i_13),
    .inp13(i_14),
    .inp14(i_15),
    .inp15(i_16),
    .inp16(i_17),
    .inp17(i_18),
    .inp18(i_19),
    .inp19(i_20),
    .inp20(i_21),
    .inp21(i_22),
    .inp22(i_23),
    .inp23(i_24),
    .inp24(i_25),
    .inp25(i_26),
    .inp26(i_27),
    .inp27(i_28),
    .inp28(i_29),
    .inp29(i_30),
    .inp30(i_31),
    .out(out_dut[1:0])
  );
  autovcoder_085012__ref ref_i (
    .sel(i_0),
    .inp0(i_1),
    .inp1(i_2),
    .inp2(i_3),
    .inp3(i_4),
    .inp4(i_5),
    .inp5(i_6),
    .inp6(i_7),
    .inp7(i_8),
    .inp8(i_9),
    .inp9(i_10),
    .inp10(i_11),
    .inp11(i_12),
    .inp12(i_13),
    .inp13(i_14),
    .inp14(i_15),
    .inp15(i_16),
    .inp16(i_17),
    .inp17(i_18),
    .inp18(i_19),
    .inp19(i_20),
    .inp20(i_21),
    .inp21(i_22),
    .inp22(i_23),
    .inp23(i_24),
    .inp24(i_25),
    .inp25(i_26),
    .inp26(i_27),
    .inp27(i_28),
    .inp28(i_29),
    .inp29(i_30),
    .inp30(i_31),
    .out(out_ref[1:0])
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
    seed = 1238662857;
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
      i_21 = {$random(seed)};
      i_22 = {$random(seed)};
      i_23 = {$random(seed)};
      i_24 = {$random(seed)};
      i_25 = {$random(seed)};
      i_26 = {$random(seed)};
      i_27 = {$random(seed)};
      i_28 = {$random(seed)};
      i_29 = {$random(seed)};
      i_30 = {$random(seed)};
      i_31 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
