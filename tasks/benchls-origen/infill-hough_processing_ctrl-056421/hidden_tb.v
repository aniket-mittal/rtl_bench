// Hidden tests: 5000 cycles of seeded random inputs (seed 1486363679); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 145;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [9:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [31:0] i_7;
  reg [31:0] i_8;
  reg [31:0] i_9;
  reg [10:0] i_10;
  reg [10:0] i_11;
  reg [10:0] i_12;
  reg [10:0] i_13;
  reg [10:0] i_14;
  reg [10:0] i_15;
  reg [10:0] i_16;
  reg [10:0] i_17;
  reg [0:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  reg [0:0] i_21;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_056421 dut (
    .clk160M(clk),
    .rst0(i_0),
    .hsync(i_1),
    .vsync(i_2),
    .cnt_r(i_3),
    .p_sum0(i_4),
    .p_sum1(i_5),
    .x_sum0(i_6),
    .x_sum1(i_7),
    .y_sum0(i_8),
    .y_sum1(i_9),
    .xmin0(i_10),
    .xmin1(i_11),
    .ymin0(i_12),
    .ymin1(i_13),
    .xmax0(i_14),
    .xmax1(i_15),
    .ymax0(i_16),
    .ymax1(i_17),
    .en0(i_18),
    .en1(i_19),
    .done0(i_20),
    .done1(i_21),
    .ap_start0(out_dut[144:144]),
    .ap_start1(out_dut[143:143]),
    .ap_rst_n0(out_dut[142:142]),
    .ap_rst_n1(out_dut[141:141]),
    .p_sum(out_dut[140:109]),
    .x_sum(out_dut[108:77]),
    .y_sum(out_dut[76:45]),
    .xmin(out_dut[44:34]),
    .ymin(out_dut[33:23]),
    .xmax(out_dut[22:12]),
    .ymax(out_dut[11:1]),
    .en(out_dut[0:0])
  );
  origen_056421__ref ref_i (
    .clk160M(clk),
    .rst0(i_0),
    .hsync(i_1),
    .vsync(i_2),
    .cnt_r(i_3),
    .p_sum0(i_4),
    .p_sum1(i_5),
    .x_sum0(i_6),
    .x_sum1(i_7),
    .y_sum0(i_8),
    .y_sum1(i_9),
    .xmin0(i_10),
    .xmin1(i_11),
    .ymin0(i_12),
    .ymin1(i_13),
    .xmax0(i_14),
    .xmax1(i_15),
    .ymax0(i_16),
    .ymax1(i_17),
    .en0(i_18),
    .en1(i_19),
    .done0(i_20),
    .done1(i_21),
    .ap_start0(out_ref[144:144]),
    .ap_start1(out_ref[143:143]),
    .ap_rst_n0(out_ref[142:142]),
    .ap_rst_n1(out_ref[141:141]),
    .p_sum(out_ref[140:109]),
    .x_sum(out_ref[108:77]),
    .y_sum(out_ref[76:45]),
    .xmin(out_ref[44:34]),
    .ymin(out_ref[33:23]),
    .xmax(out_ref[22:12]),
    .ymax(out_ref[11:1]),
    .en(out_ref[0:0])
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
    seed = 1486363679;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
