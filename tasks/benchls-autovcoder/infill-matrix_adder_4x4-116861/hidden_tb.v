// Hidden tests: 5000 cycles of seeded random inputs (seed 42345598); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 832;
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
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_116861 dut (
    .clk_mul4(clk),
    .en_mul4(i_0),
    .i11(i_1),
    .i12(i_2),
    .i13(i_3),
    .i14(i_4),
    .i21(i_5),
    .i22(i_6),
    .i23(i_7),
    .i24(i_8),
    .i31(i_9),
    .i32(i_10),
    .i33(i_11),
    .i34(i_12),
    .i41(i_13),
    .i42(i_14),
    .i43(i_15),
    .i44(i_16),
    .o11(out_dut[831:806]),
    .o12(out_dut[805:780]),
    .o13(out_dut[779:754]),
    .o14(out_dut[753:728]),
    .o21(out_dut[727:702]),
    .o22(out_dut[701:676]),
    .o23(out_dut[675:650]),
    .o24(out_dut[649:624]),
    .o31(out_dut[623:598]),
    .o32(out_dut[597:572]),
    .o33(out_dut[571:546]),
    .o34(out_dut[545:520]),
    .o41(out_dut[519:494]),
    .o42(out_dut[493:468]),
    .o43(out_dut[467:442]),
    .o44(out_dut[441:416]),
    .o11_2(out_dut[415:390]),
    .o12_2(out_dut[389:364]),
    .o13_2(out_dut[363:338]),
    .o14_2(out_dut[337:312]),
    .o21_2(out_dut[311:286]),
    .o22_2(out_dut[285:260]),
    .o23_2(out_dut[259:234]),
    .o24_2(out_dut[233:208]),
    .o31_2(out_dut[207:182]),
    .o32_2(out_dut[181:156]),
    .o33_2(out_dut[155:130]),
    .o34_2(out_dut[129:104]),
    .o41_2(out_dut[103:78]),
    .o42_2(out_dut[77:52]),
    .o43_2(out_dut[51:26]),
    .o44_2(out_dut[25:0])
  );
  autovcoder_116861__ref ref_i (
    .clk_mul4(clk),
    .en_mul4(i_0),
    .i11(i_1),
    .i12(i_2),
    .i13(i_3),
    .i14(i_4),
    .i21(i_5),
    .i22(i_6),
    .i23(i_7),
    .i24(i_8),
    .i31(i_9),
    .i32(i_10),
    .i33(i_11),
    .i34(i_12),
    .i41(i_13),
    .i42(i_14),
    .i43(i_15),
    .i44(i_16),
    .o11(out_ref[831:806]),
    .o12(out_ref[805:780]),
    .o13(out_ref[779:754]),
    .o14(out_ref[753:728]),
    .o21(out_ref[727:702]),
    .o22(out_ref[701:676]),
    .o23(out_ref[675:650]),
    .o24(out_ref[649:624]),
    .o31(out_ref[623:598]),
    .o32(out_ref[597:572]),
    .o33(out_ref[571:546]),
    .o34(out_ref[545:520]),
    .o41(out_ref[519:494]),
    .o42(out_ref[493:468]),
    .o43(out_ref[467:442]),
    .o44(out_ref[441:416]),
    .o11_2(out_ref[415:390]),
    .o12_2(out_ref[389:364]),
    .o13_2(out_ref[363:338]),
    .o14_2(out_ref[337:312]),
    .o21_2(out_ref[311:286]),
    .o22_2(out_ref[285:260]),
    .o23_2(out_ref[259:234]),
    .o24_2(out_ref[233:208]),
    .o31_2(out_ref[207:182]),
    .o32_2(out_ref[181:156]),
    .o33_2(out_ref[155:130]),
    .o34_2(out_ref[129:104]),
    .o41_2(out_ref[103:78]),
    .o42_2(out_ref[77:52]),
    .o43_2(out_ref[51:26]),
    .o44_2(out_ref[25:0])
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
    seed = 42345598;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
