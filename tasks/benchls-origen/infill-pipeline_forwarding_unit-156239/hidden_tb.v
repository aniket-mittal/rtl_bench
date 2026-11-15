// Hidden tests: 5000 cycles of seeded random inputs (seed 1175796285); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 160;
  reg clk;
  reg [4:0] i_0;
  reg [4:0] i_1;
  reg [4:0] i_2;
  reg [4:0] i_3;
  reg [4:0] i_4;
  reg [4:0] i_5;
  reg [4:0] i_6;
  reg [4:0] i_7;
  reg [4:0] i_8;
  reg [4:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [31:0] i_15;
  reg [31:0] i_16;
  reg [31:0] i_17;
  reg [31:0] i_18;
  reg [31:0] i_19;
  reg [31:0] i_20;
  reg [31:0] i_21;
  reg [31:0] i_22;
  reg [31:0] i_23;
  reg [31:0] i_24;
  reg [1:0] i_25;
  reg [1:0] i_26;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_156239 dut (
    .D1_Ad(i_0),
    .D2_Ad(i_1),
    .E1_Ad(i_2),
    .E2_Ad(i_3),
    .M2_Ad(i_4),
    .E_Ad2(i_5),
    .M_Ad2(i_6),
    .W_Ad2(i_7),
    .F_Ad2(i_8),
    .G_Ad2(i_9),
    .E_we(i_10),
    .M_we(i_11),
    .W_we(i_12),
    .F_we(i_13),
    .G_we(i_14),
    .D1_default(i_15),
    .D2_default(i_16),
    .E1_default(i_17),
    .E2_default(i_18),
    .M2_default(i_19),
    .E_Wd1(i_20),
    .M_Wd1(i_21),
    .W_Wd1(i_22),
    .F_Wd1(i_23),
    .G_Wd1(i_24),
    .E_delay(i_25),
    .M_delay(i_26),
    .D1(out_dut[159:128]),
    .D2(out_dut[127:96]),
    .E1(out_dut[95:64]),
    .E2(out_dut[63:32]),
    .M2(out_dut[31:0])
  );
  origen_156239__ref ref_i (
    .D1_Ad(i_0),
    .D2_Ad(i_1),
    .E1_Ad(i_2),
    .E2_Ad(i_3),
    .M2_Ad(i_4),
    .E_Ad2(i_5),
    .M_Ad2(i_6),
    .W_Ad2(i_7),
    .F_Ad2(i_8),
    .G_Ad2(i_9),
    .E_we(i_10),
    .M_we(i_11),
    .W_we(i_12),
    .F_we(i_13),
    .G_we(i_14),
    .D1_default(i_15),
    .D2_default(i_16),
    .E1_default(i_17),
    .E2_default(i_18),
    .M2_default(i_19),
    .E_Wd1(i_20),
    .M_Wd1(i_21),
    .W_Wd1(i_22),
    .F_Wd1(i_23),
    .G_Wd1(i_24),
    .E_delay(i_25),
    .M_delay(i_26),
    .D1(out_ref[159:128]),
    .D2(out_ref[127:96]),
    .E1(out_ref[95:64]),
    .E2(out_ref[63:32]),
    .M2(out_ref[31:0])
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
    seed = 1175796285;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
