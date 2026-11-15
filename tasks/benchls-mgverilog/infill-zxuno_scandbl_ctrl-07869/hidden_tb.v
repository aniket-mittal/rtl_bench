// Hidden tests: 5000 cycles of seeded random inputs (seed 4270467709); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 17;
  reg clk;
  reg [15:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [7:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [7:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_07869 dut (
    .clk(clk),
    .a(i_0),
    .kbd_change_video_output(i_1),
    .iorq_n(i_2),
    .wr_n(i_3),
    .zxuno_addr(i_4),
    .zxuno_regrd(i_5),
    .zxuno_regwr(i_6),
    .din(i_7),
    .dout(out_dut[16:9]),
    .oe_n(out_dut[8:8]),
    .vga_enable(out_dut[7:7]),
    .scanlines_enable(out_dut[6:6]),
    .freq_option(out_dut[5:3]),
    .turbo_enable(out_dut[2:1]),
    .csync_option(out_dut[0:0])
  );
  mg_07869__ref ref_i (
    .clk(clk),
    .a(i_0),
    .kbd_change_video_output(i_1),
    .iorq_n(i_2),
    .wr_n(i_3),
    .zxuno_addr(i_4),
    .zxuno_regrd(i_5),
    .zxuno_regwr(i_6),
    .din(i_7),
    .dout(out_ref[16:9]),
    .oe_n(out_ref[8:8]),
    .vga_enable(out_ref[7:7]),
    .scanlines_enable(out_ref[6:6]),
    .freq_option(out_ref[5:3]),
    .turbo_enable(out_ref[2:1]),
    .csync_option(out_ref[0:0])
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
    seed = 4270467709;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
