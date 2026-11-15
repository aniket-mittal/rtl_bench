// Hidden tests: 5000 cycles of seeded random inputs (seed 51594612); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 11;
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
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_00255 dut (
    .cmp_gclk(clk),
    .io_pwron_rst_l(i_0),
    .ctu_ddr0_dram_cken_dl(i_1),
    .ctu_ddr1_dram_cken_dl(i_2),
    .ctu_ddr2_dram_cken_dl(i_3),
    .ctu_ddr3_dram_cken_dl(i_4),
    .ctu_dram02_dram_cken_dl(i_5),
    .ctu_dram13_dram_cken_dl(i_6),
    .start_clk_dl(i_7),
    .a_grst_dl(i_8),
    .a_dbginit_dl(i_9),
    .de_grst_dsync_edge_dl(i_10),
    .de_dbginit_dsync_edge_dl(i_11),
    .start_clk_dg(out_dut[10:10]),
    .ctu_ddr0_dram_cken_dg(out_dut[9:9]),
    .ctu_ddr1_dram_cken_dg(out_dut[8:8]),
    .ctu_ddr2_dram_cken_dg(out_dut[7:7]),
    .ctu_ddr3_dram_cken_dg(out_dut[6:6]),
    .ctu_dram02_dram_cken_dg(out_dut[5:5]),
    .ctu_dram13_dram_cken_dg(out_dut[4:4]),
    .a_grst_dg(out_dut[3:3]),
    .a_dbginit_dg(out_dut[2:2]),
    .de_grst_dsync_edge_dg(out_dut[1:1]),
    .de_dbginit_dsync_edge_dg(out_dut[0:0])
  );
  rtlpp_00255__ref ref_i (
    .cmp_gclk(clk),
    .io_pwron_rst_l(i_0),
    .ctu_ddr0_dram_cken_dl(i_1),
    .ctu_ddr1_dram_cken_dl(i_2),
    .ctu_ddr2_dram_cken_dl(i_3),
    .ctu_ddr3_dram_cken_dl(i_4),
    .ctu_dram02_dram_cken_dl(i_5),
    .ctu_dram13_dram_cken_dl(i_6),
    .start_clk_dl(i_7),
    .a_grst_dl(i_8),
    .a_dbginit_dl(i_9),
    .de_grst_dsync_edge_dl(i_10),
    .de_dbginit_dsync_edge_dl(i_11),
    .start_clk_dg(out_ref[10:10]),
    .ctu_ddr0_dram_cken_dg(out_ref[9:9]),
    .ctu_ddr1_dram_cken_dg(out_ref[8:8]),
    .ctu_ddr2_dram_cken_dg(out_ref[7:7]),
    .ctu_ddr3_dram_cken_dg(out_ref[6:6]),
    .ctu_dram02_dram_cken_dg(out_ref[5:5]),
    .ctu_dram13_dram_cken_dg(out_ref[4:4]),
    .a_grst_dg(out_ref[3:3]),
    .a_dbginit_dg(out_ref[2:2]),
    .de_grst_dsync_edge_dg(out_ref[1:1]),
    .de_dbginit_dsync_edge_dg(out_ref[0:0])
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
    seed = 51594612;
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
      i_8 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
