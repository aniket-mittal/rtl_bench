// Hidden tests: 5000 cycles of seeded random inputs (seed 1814384547); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 9;
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
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_11484 dut (
    .clk(clk),
    .pReset(i_0),
    .prog_clk(i_1),
    .set(i_2),
    .reset(i_3),
    .top_width_0_height_0_subtile_0__pin_I_0_(i_4),
    .top_width_0_height_0_subtile_0__pin_I_4_(i_5),
    .top_width_0_height_0_subtile_0__pin_I_8_(i_6),
    .top_width_0_height_0_subtile_0__pin_clk_0_(i_7),
    .right_width_0_height_0_subtile_0__pin_I_1_(i_8),
    .right_width_0_height_0_subtile_0__pin_I_5_(i_9),
    .right_width_0_height_0_subtile_0__pin_I_9_(i_10),
    .bottom_width_0_height_0_subtile_0__pin_I_2_(i_11),
    .bottom_width_0_height_0_subtile_0__pin_I_6_(i_12),
    .bottom_width_0_height_0_subtile_0__pin_I_10_(i_13),
    .left_width_0_height_0_subtile_0__pin_I_3_(i_14),
    .left_width_0_height_0_subtile_0__pin_I_7_(i_15),
    .left_width_0_height_0_subtile_0__pin_I_11_(i_16),
    .ccff_head(i_17),
    .top_width_0_height_0_subtile_0__pin_O_0_(out_dut[8:8]),
    .top_width_0_height_0_subtile_0__pin_O_4_(out_dut[7:7]),
    .right_width_0_height_0_subtile_0__pin_O_1_(out_dut[6:6]),
    .right_width_0_height_0_subtile_0__pin_O_5_(out_dut[5:5]),
    .bottom_width_0_height_0_subtile_0__pin_O_2_(out_dut[4:4]),
    .bottom_width_0_height_0_subtile_0__pin_O_6_(out_dut[3:3]),
    .left_width_0_height_0_subtile_0__pin_O_3_(out_dut[2:2]),
    .left_width_0_height_0_subtile_0__pin_O_7_(out_dut[1:1]),
    .ccff_tail(out_dut[0:0])
  );
  rtlpp_11484__ref ref_i (
    .clk(clk),
    .pReset(i_0),
    .prog_clk(i_1),
    .set(i_2),
    .reset(i_3),
    .top_width_0_height_0_subtile_0__pin_I_0_(i_4),
    .top_width_0_height_0_subtile_0__pin_I_4_(i_5),
    .top_width_0_height_0_subtile_0__pin_I_8_(i_6),
    .top_width_0_height_0_subtile_0__pin_clk_0_(i_7),
    .right_width_0_height_0_subtile_0__pin_I_1_(i_8),
    .right_width_0_height_0_subtile_0__pin_I_5_(i_9),
    .right_width_0_height_0_subtile_0__pin_I_9_(i_10),
    .bottom_width_0_height_0_subtile_0__pin_I_2_(i_11),
    .bottom_width_0_height_0_subtile_0__pin_I_6_(i_12),
    .bottom_width_0_height_0_subtile_0__pin_I_10_(i_13),
    .left_width_0_height_0_subtile_0__pin_I_3_(i_14),
    .left_width_0_height_0_subtile_0__pin_I_7_(i_15),
    .left_width_0_height_0_subtile_0__pin_I_11_(i_16),
    .ccff_head(i_17),
    .top_width_0_height_0_subtile_0__pin_O_0_(out_ref[8:8]),
    .top_width_0_height_0_subtile_0__pin_O_4_(out_ref[7:7]),
    .right_width_0_height_0_subtile_0__pin_O_1_(out_ref[6:6]),
    .right_width_0_height_0_subtile_0__pin_O_5_(out_ref[5:5]),
    .bottom_width_0_height_0_subtile_0__pin_O_2_(out_ref[4:4]),
    .bottom_width_0_height_0_subtile_0__pin_O_6_(out_ref[3:3]),
    .left_width_0_height_0_subtile_0__pin_O_3_(out_ref[2:2]),
    .left_width_0_height_0_subtile_0__pin_O_7_(out_ref[1:1]),
    .ccff_tail(out_ref[0:0])
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
    seed = 1814384547;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
