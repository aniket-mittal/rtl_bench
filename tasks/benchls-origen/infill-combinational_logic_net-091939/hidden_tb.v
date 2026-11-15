// Hidden tests: 5000 cycles of seeded random inputs (seed 3434003911); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 16;
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
  reg [0:0] i_20;
  reg [0:0] i_21;
  reg [0:0] i_22;
  reg [0:0] i_23;
  reg [0:0] i_24;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_091939 dut (
    .x00(i_0),
    .x01(i_1),
    .x02(i_2),
    .x03(i_3),
    .x04(i_4),
    .x05(i_5),
    .x06(i_6),
    .x07(i_7),
    .x08(i_8),
    .x09(i_9),
    .x10(i_10),
    .x11(i_11),
    .x12(i_12),
    .x13(i_13),
    .x14(i_14),
    .x15(i_15),
    .x16(i_16),
    .x17(i_17),
    .x18(i_18),
    .x19(i_19),
    .x20(i_20),
    .x21(i_21),
    .x22(i_22),
    .x23(i_23),
    .x24(i_24),
    .z00(out_dut[15:15]),
    .z01(out_dut[14:14]),
    .z02(out_dut[13:13]),
    .z03(out_dut[12:12]),
    .z04(out_dut[11:11]),
    .z05(out_dut[10:10]),
    .z06(out_dut[9:9]),
    .z07(out_dut[8:8]),
    .z08(out_dut[7:7]),
    .z09(out_dut[6:6]),
    .z10(out_dut[5:5]),
    .z11(out_dut[4:4]),
    .z12(out_dut[3:3]),
    .z13(out_dut[2:2]),
    .z14(out_dut[1:1]),
    .z15(out_dut[0:0])
  );
  origen_091939__ref ref_i (
    .x00(i_0),
    .x01(i_1),
    .x02(i_2),
    .x03(i_3),
    .x04(i_4),
    .x05(i_5),
    .x06(i_6),
    .x07(i_7),
    .x08(i_8),
    .x09(i_9),
    .x10(i_10),
    .x11(i_11),
    .x12(i_12),
    .x13(i_13),
    .x14(i_14),
    .x15(i_15),
    .x16(i_16),
    .x17(i_17),
    .x18(i_18),
    .x19(i_19),
    .x20(i_20),
    .x21(i_21),
    .x22(i_22),
    .x23(i_23),
    .x24(i_24),
    .z00(out_ref[15:15]),
    .z01(out_ref[14:14]),
    .z02(out_ref[13:13]),
    .z03(out_ref[12:12]),
    .z04(out_ref[11:11]),
    .z05(out_ref[10:10]),
    .z06(out_ref[9:9]),
    .z07(out_ref[8:8]),
    .z08(out_ref[7:7]),
    .z09(out_ref[6:6]),
    .z10(out_ref[5:5]),
    .z11(out_ref[4:4]),
    .z12(out_ref[3:3]),
    .z13(out_ref[2:2]),
    .z14(out_ref[1:1]),
    .z15(out_ref[0:0])
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
    seed = 3434003911;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
