// Hidden tests: 5000 cycles of seeded random inputs (seed 3681902045); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 175;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [28:0] i_6;
  reg [27:0] i_7;
  reg [9:0] i_8;
  reg [0:0] i_9;
  reg [10:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [10:0] i_13;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_09757 dut (
    .clk(clk),
    .rstn(i_0),
    .accum_sample_enable(i_1),
    .if_sign(i_2),
    .if_mag(i_3),
    .pre_tic_enable(i_4),
    .tic_enable(i_5),
    .carr_nco_fc(i_6),
    .code_nco_fc(i_7),
    .prn_key(i_8),
    .prn_key_enable(i_9),
    .code_slew(i_10),
    .slew_enable(i_11),
    .epoch_enable(i_12),
    .epoch_load(i_13),
    .dump(out_dut[174:174]),
    .i_early(out_dut[173:158]),
    .q_early(out_dut[157:142]),
    .i_prompt(out_dut[141:126]),
    .q_prompt(out_dut[125:110]),
    .i_late(out_dut[109:94]),
    .q_late(out_dut[93:78]),
    .carrier_val(out_dut[77:46]),
    .code_val(out_dut[45:25]),
    .epoch(out_dut[24:14]),
    .epoch_check(out_dut[13:3]),
    .test_point_01(out_dut[2:2]),
    .test_point_02(out_dut[1:1]),
    .test_point_03(out_dut[0:0])
  );
  rtlpp_09757__ref ref_i (
    .clk(clk),
    .rstn(i_0),
    .accum_sample_enable(i_1),
    .if_sign(i_2),
    .if_mag(i_3),
    .pre_tic_enable(i_4),
    .tic_enable(i_5),
    .carr_nco_fc(i_6),
    .code_nco_fc(i_7),
    .prn_key(i_8),
    .prn_key_enable(i_9),
    .code_slew(i_10),
    .slew_enable(i_11),
    .epoch_enable(i_12),
    .epoch_load(i_13),
    .dump(out_ref[174:174]),
    .i_early(out_ref[173:158]),
    .q_early(out_ref[157:142]),
    .i_prompt(out_ref[141:126]),
    .q_prompt(out_ref[125:110]),
    .i_late(out_ref[109:94]),
    .q_late(out_ref[93:78]),
    .carrier_val(out_ref[77:46]),
    .code_val(out_ref[45:25]),
    .epoch(out_ref[24:14]),
    .epoch_check(out_ref[13:3]),
    .test_point_01(out_ref[2:2]),
    .test_point_02(out_ref[1:1]),
    .test_point_03(out_ref[0:0])
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
    seed = 3681902045;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
