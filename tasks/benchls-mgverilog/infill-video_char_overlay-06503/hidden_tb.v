// Hidden tests: 5000 cycles of seeded random inputs (seed 1269503672); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 59;
  reg clk;
  reg [0:0] i_0;
  reg [9:0] i_1;
  reg [0:0] i_2;
  reg [9:0] i_3;
  reg [0:0] i_4;
  reg [23:0] i_5;
  reg [0:0] i_6;
  reg [7:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_06503 dut (
    .clk(clk),
    .rst(i_0),
    .hcount_in(i_1),
    .hsync_in(i_2),
    .vcount_in(i_3),
    .vsync_in(i_4),
    .rgb_in(i_5),
    .blnk_in(i_6),
    .char_pixels(i_7),
    .hcount_out(out_dut[58:49]),
    .hsync_out(out_dut[48:48]),
    .vcount_out(out_dut[47:38]),
    .vsync_out(out_dut[37:37]),
    .rgb_out(out_dut[36:13]),
    .blnk_out(out_dut[12:12]),
    .char_xy(out_dut[11:4]),
    .char_line(out_dut[3:0])
  );
  mg_06503__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .hcount_in(i_1),
    .hsync_in(i_2),
    .vcount_in(i_3),
    .vsync_in(i_4),
    .rgb_in(i_5),
    .blnk_in(i_6),
    .char_pixels(i_7),
    .hcount_out(out_ref[58:49]),
    .hsync_out(out_ref[48:48]),
    .vcount_out(out_ref[47:38]),
    .vsync_out(out_ref[37:37]),
    .rgb_out(out_ref[36:13]),
    .blnk_out(out_ref[12:12]),
    .char_xy(out_ref[11:4]),
    .char_line(out_ref[3:0])
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
    seed = 1269503672;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
