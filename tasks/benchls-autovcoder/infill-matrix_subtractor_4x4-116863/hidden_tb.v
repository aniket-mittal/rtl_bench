// Hidden tests: 5000 cycles of seeded random inputs (seed 3881463895); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 416;
  reg clk;
  reg [0:0] i_0;
  reg [25:0] i_1;
  reg [25:0] i_2;
  reg [25:0] i_3;
  reg [25:0] i_4;
  reg [25:0] i_5;
  reg [25:0] i_6;
  reg [25:0] i_7;
  reg [25:0] i_8;
  reg [25:0] i_9;
  reg [25:0] i_10;
  reg [25:0] i_11;
  reg [25:0] i_12;
  reg [25:0] i_13;
  reg [25:0] i_14;
  reg [25:0] i_15;
  reg [25:0] i_16;
  reg [25:0] i_17;
  reg [25:0] i_18;
  reg [25:0] i_19;
  reg [25:0] i_20;
  reg [25:0] i_21;
  reg [25:0] i_22;
  reg [25:0] i_23;
  reg [25:0] i_24;
  reg [25:0] i_25;
  reg [25:0] i_26;
  reg [25:0] i_27;
  reg [25:0] i_28;
  reg [25:0] i_29;
  reg [25:0] i_30;
  reg [25:0] i_31;
  reg [25:0] i_32;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_116863 dut (
    .clk_sub(clk),
    .en_sub(i_0),
    .i1_11(i_1),
    .i1_12(i_2),
    .i1_13(i_3),
    .i1_14(i_4),
    .i1_21(i_5),
    .i1_22(i_6),
    .i1_23(i_7),
    .i1_24(i_8),
    .i1_31(i_9),
    .i1_32(i_10),
    .i1_33(i_11),
    .i1_34(i_12),
    .i1_41(i_13),
    .i1_42(i_14),
    .i1_43(i_15),
    .i1_44(i_16),
    .i2_11(i_17),
    .i2_12(i_18),
    .i2_13(i_19),
    .i2_14(i_20),
    .i2_21(i_21),
    .i2_22(i_22),
    .i2_23(i_23),
    .i2_24(i_24),
    .i2_31(i_25),
    .i2_32(i_26),
    .i2_33(i_27),
    .i2_34(i_28),
    .i2_41(i_29),
    .i2_42(i_30),
    .i2_43(i_31),
    .i2_44(i_32),
    .o11(out_dut[415:390]),
    .o12(out_dut[389:364]),
    .o13(out_dut[363:338]),
    .o14(out_dut[337:312]),
    .o21(out_dut[311:286]),
    .o22(out_dut[285:260]),
    .o23(out_dut[259:234]),
    .o24(out_dut[233:208]),
    .o31(out_dut[207:182]),
    .o32(out_dut[181:156]),
    .o33(out_dut[155:130]),
    .o34(out_dut[129:104]),
    .o41(out_dut[103:78]),
    .o42(out_dut[77:52]),
    .o43(out_dut[51:26]),
    .o44(out_dut[25:0])
  );
  autovcoder_116863__ref ref_i (
    .clk_sub(clk),
    .en_sub(i_0),
    .i1_11(i_1),
    .i1_12(i_2),
    .i1_13(i_3),
    .i1_14(i_4),
    .i1_21(i_5),
    .i1_22(i_6),
    .i1_23(i_7),
    .i1_24(i_8),
    .i1_31(i_9),
    .i1_32(i_10),
    .i1_33(i_11),
    .i1_34(i_12),
    .i1_41(i_13),
    .i1_42(i_14),
    .i1_43(i_15),
    .i1_44(i_16),
    .i2_11(i_17),
    .i2_12(i_18),
    .i2_13(i_19),
    .i2_14(i_20),
    .i2_21(i_21),
    .i2_22(i_22),
    .i2_23(i_23),
    .i2_24(i_24),
    .i2_31(i_25),
    .i2_32(i_26),
    .i2_33(i_27),
    .i2_34(i_28),
    .i2_41(i_29),
    .i2_42(i_30),
    .i2_43(i_31),
    .i2_44(i_32),
    .o11(out_ref[415:390]),
    .o12(out_ref[389:364]),
    .o13(out_ref[363:338]),
    .o14(out_ref[337:312]),
    .o21(out_ref[311:286]),
    .o22(out_ref[285:260]),
    .o23(out_ref[259:234]),
    .o24(out_ref[233:208]),
    .o31(out_ref[207:182]),
    .o32(out_ref[181:156]),
    .o33(out_ref[155:130]),
    .o34(out_ref[129:104]),
    .o41(out_ref[103:78]),
    .o42(out_ref[77:52]),
    .o43(out_ref[51:26]),
    .o44(out_ref[25:0])
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
    seed = 3881463895;
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
      i_32 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
