// Hidden tests: 5000 cycles of seeded random inputs (seed 3060326472); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 16;
  reg clk;
  reg [15:0] i_0;
  reg [15:0] i_1;
  reg [15:0] i_2;
  reg [15:0] i_3;
  reg [15:0] i_4;
  reg [15:0] i_5;
  reg [15:0] i_6;
  reg [15:0] i_7;
  reg [15:0] i_8;
  reg [15:0] i_9;
  reg [15:0] i_10;
  reg [15:0] i_11;
  reg [15:0] i_12;
  reg [15:0] i_13;
  reg [15:0] i_14;
  reg [15:0] i_15;
  reg [15:0] i_16;
  reg [15:0] i_17;
  reg [15:0] i_18;
  reg [15:0] i_19;
  reg [15:0] i_20;
  reg [15:0] i_21;
  reg [15:0] i_22;
  reg [15:0] i_23;
  reg [15:0] i_24;
  reg [15:0] i_25;
  reg [15:0] i_26;
  reg [15:0] i_27;
  reg [15:0] i_28;
  reg [15:0] i_29;
  reg [15:0] i_30;
  reg [15:0] i_31;
  reg [15:0] i_32;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_115066 dut (
    .pcs_ctrl_in1(i_0),
    .pcs_ctrl_in2(i_1),
    .pcs_ctrl_in3(i_2),
    .pcs_ctrl_in4(i_3),
    .pcs_ctrl_in5(i_4),
    .pcs_ctrl_in6(i_5),
    .pcs_ctrl_in7(i_6),
    .pcs_ctrl_in8(i_7),
    .pcs_ctrl_in9(i_8),
    .pcs_ctrl_in10(i_9),
    .pcs_ctrl_in11(i_10),
    .pcs_ctrl_in12(i_11),
    .pcs_ctrl_in13(i_12),
    .pcs_ctrl_in14(i_13),
    .pcs_ctrl_in15(i_14),
    .pcs_ctrl_in16(i_15),
    .hw_address_ctrl_in1(i_16),
    .hw_address_ctrl_in2(i_17),
    .hw_address_ctrl_in3(i_18),
    .hw_address_ctrl_in4(i_19),
    .hw_address_ctrl_in5(i_20),
    .hw_address_ctrl_in6(i_21),
    .hw_address_ctrl_in7(i_22),
    .hw_address_ctrl_in8(i_23),
    .hw_address_ctrl_in9(i_24),
    .hw_address_ctrl_in10(i_25),
    .hw_address_ctrl_in11(i_26),
    .hw_address_ctrl_in12(i_27),
    .hw_address_ctrl_in13(i_28),
    .hw_address_ctrl_in14(i_29),
    .hw_address_ctrl_in15(i_30),
    .hw_address_ctrl_in16(i_31),
    .reg_addr(i_32),
    .pcs_ctrl_out(out_dut[15:0])
  );
  autovcoder_115066__ref ref_i (
    .pcs_ctrl_in1(i_0),
    .pcs_ctrl_in2(i_1),
    .pcs_ctrl_in3(i_2),
    .pcs_ctrl_in4(i_3),
    .pcs_ctrl_in5(i_4),
    .pcs_ctrl_in6(i_5),
    .pcs_ctrl_in7(i_6),
    .pcs_ctrl_in8(i_7),
    .pcs_ctrl_in9(i_8),
    .pcs_ctrl_in10(i_9),
    .pcs_ctrl_in11(i_10),
    .pcs_ctrl_in12(i_11),
    .pcs_ctrl_in13(i_12),
    .pcs_ctrl_in14(i_13),
    .pcs_ctrl_in15(i_14),
    .pcs_ctrl_in16(i_15),
    .hw_address_ctrl_in1(i_16),
    .hw_address_ctrl_in2(i_17),
    .hw_address_ctrl_in3(i_18),
    .hw_address_ctrl_in4(i_19),
    .hw_address_ctrl_in5(i_20),
    .hw_address_ctrl_in6(i_21),
    .hw_address_ctrl_in7(i_22),
    .hw_address_ctrl_in8(i_23),
    .hw_address_ctrl_in9(i_24),
    .hw_address_ctrl_in10(i_25),
    .hw_address_ctrl_in11(i_26),
    .hw_address_ctrl_in12(i_27),
    .hw_address_ctrl_in13(i_28),
    .hw_address_ctrl_in14(i_29),
    .hw_address_ctrl_in15(i_30),
    .hw_address_ctrl_in16(i_31),
    .reg_addr(i_32),
    .pcs_ctrl_out(out_ref[15:0])
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
    seed = 3060326472;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
