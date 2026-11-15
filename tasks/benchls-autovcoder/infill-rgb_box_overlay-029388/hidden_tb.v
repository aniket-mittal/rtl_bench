// Hidden tests: 5000 cycles of seeded random inputs (seed 3288979075); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 27;
  reg clk;
  reg [0:0] i_0;
  reg [23:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [11:0] i_5;
  reg [11:0] i_6;
  reg [11:0] i_7;
  reg [11:0] i_8;
  reg [11:0] i_9;
  reg [11:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_029388 dut (
    .pixelclk(clk),
    .reset_n(i_0),
    .i_rgb(i_1),
    .i_hsync(i_2),
    .i_vsync(i_3),
    .i_de(i_4),
    .hcount(i_5),
    .vcount(i_6),
    .hcount_l(i_7),
    .hcount_r(i_8),
    .vcount_l(i_9),
    .vcount_r(i_10),
    .o_rgb(out_dut[26:3]),
    .o_hsync(out_dut[2:2]),
    .o_vsync(out_dut[1:1]),
    .o_de(out_dut[0:0])
  );
  autovcoder_029388__ref ref_i (
    .pixelclk(clk),
    .reset_n(i_0),
    .i_rgb(i_1),
    .i_hsync(i_2),
    .i_vsync(i_3),
    .i_de(i_4),
    .hcount(i_5),
    .vcount(i_6),
    .hcount_l(i_7),
    .hcount_r(i_8),
    .vcount_l(i_9),
    .vcount_r(i_10),
    .o_rgb(out_ref[26:3]),
    .o_hsync(out_ref[2:2]),
    .o_vsync(out_ref[1:1]),
    .o_de(out_ref[0:0])
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
    seed = 3288979075;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
