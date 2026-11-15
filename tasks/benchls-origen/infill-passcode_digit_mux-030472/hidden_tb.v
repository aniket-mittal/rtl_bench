// Hidden tests: 5000 cycles of seeded random inputs (seed 2526103924); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 35;
  reg clk;
  reg [2:0] i_0;
  reg [0:0] i_1;
  reg [3:0] i_2;
  reg [3:0] i_3;
  reg [3:0] i_4;
  reg [3:0] i_5;
  reg [3:0] i_6;
  reg [3:0] i_7;
  reg [3:0] i_8;
  reg [3:0] i_9;
  reg [2:0] i_10;
  reg [3:0] i_11;
  reg [3:0] i_12;
  reg [3:0] i_13;
  reg [3:0] i_14;
  reg [3:0] i_15;
  reg [3:0] i_16;
  reg [3:0] i_17;
  reg [3:0] i_18;
  reg [2:0] i_19;
  reg [3:0] i_20;
  reg [3:0] i_21;
  reg [3:0] i_22;
  reg [3:0] i_23;
  reg [3:0] i_24;
  reg [3:0] i_25;
  reg [3:0] i_26;
  reg [3:0] i_27;
  reg [2:0] i_28;
  reg [3:0] i_29;
  reg [3:0] i_30;
  reg [3:0] i_31;
  reg [3:0] i_32;
  reg [3:0] i_33;
  reg [3:0] i_34;
  reg [3:0] i_35;
  reg [3:0] i_36;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_030472 dut (
    .state(i_0),
    .button_increase(i_1),
    .insertdata_digit1(i_2),
    .insertdata_digit2(i_3),
    .insertdata_digit3(i_4),
    .insertdata_digit4(i_5),
    .insertdata_digit5(i_6),
    .insertdata_digit6(i_7),
    .insertdata_digit7(i_8),
    .insertdata_digit8(i_9),
    .insertdata_position_pointer(i_10),
    .insertnewpass_digit1(i_11),
    .insertnewpass_digit2(i_12),
    .insertnewpass_digit3(i_13),
    .insertnewpass_digit4(i_14),
    .insertnewpass_digit5(i_15),
    .insertnewpass_digit6(i_16),
    .insertnewpass_digit7(i_17),
    .insertnewpass_digit8(i_18),
    .insertnewpass_position_pointer(i_19),
    .insertpass_digit1(i_20),
    .insertpass_digit2(i_21),
    .insertpass_digit3(i_22),
    .insertpass_digit4(i_23),
    .insertpass_digit5(i_24),
    .insertpass_digit6(i_25),
    .insertpass_digit7(i_26),
    .insertpass_digit8(i_27),
    .insertpass_position_pointer(i_28),
    .data_digit1(i_29),
    .data_digit2(i_30),
    .data_digit3(i_31),
    .data_digit4(i_32),
    .data_digit5(i_33),
    .data_digit6(i_34),
    .data_digit7(i_35),
    .data_digit8(i_36),
    .position_pointer(out_dut[34:32]),
    .digit1(out_dut[31:28]),
    .digit2(out_dut[27:24]),
    .digit3(out_dut[23:20]),
    .digit4(out_dut[19:16]),
    .digit5(out_dut[15:12]),
    .digit6(out_dut[11:8]),
    .digit7(out_dut[7:4]),
    .digit8(out_dut[3:0])
  );
  origen_030472__ref ref_i (
    .state(i_0),
    .button_increase(i_1),
    .insertdata_digit1(i_2),
    .insertdata_digit2(i_3),
    .insertdata_digit3(i_4),
    .insertdata_digit4(i_5),
    .insertdata_digit5(i_6),
    .insertdata_digit6(i_7),
    .insertdata_digit7(i_8),
    .insertdata_digit8(i_9),
    .insertdata_position_pointer(i_10),
    .insertnewpass_digit1(i_11),
    .insertnewpass_digit2(i_12),
    .insertnewpass_digit3(i_13),
    .insertnewpass_digit4(i_14),
    .insertnewpass_digit5(i_15),
    .insertnewpass_digit6(i_16),
    .insertnewpass_digit7(i_17),
    .insertnewpass_digit8(i_18),
    .insertnewpass_position_pointer(i_19),
    .insertpass_digit1(i_20),
    .insertpass_digit2(i_21),
    .insertpass_digit3(i_22),
    .insertpass_digit4(i_23),
    .insertpass_digit5(i_24),
    .insertpass_digit6(i_25),
    .insertpass_digit7(i_26),
    .insertpass_digit8(i_27),
    .insertpass_position_pointer(i_28),
    .data_digit1(i_29),
    .data_digit2(i_30),
    .data_digit3(i_31),
    .data_digit4(i_32),
    .data_digit5(i_33),
    .data_digit6(i_34),
    .data_digit7(i_35),
    .data_digit8(i_36),
    .position_pointer(out_ref[34:32]),
    .digit1(out_ref[31:28]),
    .digit2(out_ref[27:24]),
    .digit3(out_ref[23:20]),
    .digit4(out_ref[19:16]),
    .digit5(out_ref[15:12]),
    .digit6(out_ref[11:8]),
    .digit7(out_ref[7:4]),
    .digit8(out_ref[3:0])
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
    seed = 2526103924;
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
      i_33 = {$random(seed)};
      i_34 = {$random(seed)};
      i_35 = {$random(seed)};
      i_36 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
