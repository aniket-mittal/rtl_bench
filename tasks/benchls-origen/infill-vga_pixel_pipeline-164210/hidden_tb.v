// Hidden tests: 5000 cycles of seeded random inputs (seed 4206417783); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 69;
  reg clk;
  reg [10:0] i_0;
  reg [10:0] i_1;
  reg [10:0] i_2;
  reg [10:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [23:0] i_8;
  reg [23:0] i_9;
  reg [0:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_164210 dut (
    .clk(clk),
    .xpos(i_0),
    .ypos(i_1),
    .hcount_in(i_2),
    .vcount_in(i_3),
    .hsync_in(i_4),
    .vsync_in(i_5),
    .hblnk_in(i_6),
    .vblnk_in(i_7),
    .rgb_in(i_8),
    .rgb_pixel(i_9),
    .rst(i_10),
    .hcount_out(out_dut[68:58]),
    .vcount_out(out_dut[57:47]),
    .hsync_out(out_dut[46:46]),
    .vsync_out(out_dut[45:45]),
    .hblnk_out(out_dut[44:44]),
    .vblnk_out(out_dut[43:43]),
    .rgb_out(out_dut[42:19]),
    .pixel_addr(out_dut[18:0])
  );
  origen_164210__ref ref_i (
    .clk(clk),
    .xpos(i_0),
    .ypos(i_1),
    .hcount_in(i_2),
    .vcount_in(i_3),
    .hsync_in(i_4),
    .vsync_in(i_5),
    .hblnk_in(i_6),
    .vblnk_in(i_7),
    .rgb_in(i_8),
    .rgb_pixel(i_9),
    .rst(i_10),
    .hcount_out(out_ref[68:58]),
    .vcount_out(out_ref[57:47]),
    .hsync_out(out_ref[46:46]),
    .vsync_out(out_ref[45:45]),
    .hblnk_out(out_ref[44:44]),
    .vblnk_out(out_ref[43:43]),
    .rgb_out(out_ref[42:19]),
    .pixel_addr(out_ref[18:0])
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
    seed = 4206417783;
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
      i_10 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
