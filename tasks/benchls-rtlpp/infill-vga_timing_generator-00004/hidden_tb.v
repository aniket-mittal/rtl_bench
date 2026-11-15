// Hidden tests: 5000 cycles of seeded random inputs (seed 1499633613); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 32;
  reg clk;
  reg [0:0] i_0;
  reg [7:0] i_1;
  reg [7:0] i_2;
  reg [7:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_00004 dut (
    .clk_pixel(clk),
    .test_picture(i_0),
    .red_byte(i_1),
    .green_byte(i_2),
    .blue_byte(i_3),
    .fetch_next(out_dut[31:31]),
    .line_repeat(out_dut[30:30]),
    .vga_r(out_dut[29:22]),
    .vga_g(out_dut[21:14]),
    .vga_b(out_dut[13:6]),
    .next_line(out_dut[5:5]),
    .next_field(out_dut[4:4]),
    .vga_hsync(out_dut[3:3]),
    .vga_vsync(out_dut[2:2]),
    .vga_vblank(out_dut[1:1]),
    .vga_blank(out_dut[0:0])
  );
  rtlpp_00004__ref ref_i (
    .clk_pixel(clk),
    .test_picture(i_0),
    .red_byte(i_1),
    .green_byte(i_2),
    .blue_byte(i_3),
    .fetch_next(out_ref[31:31]),
    .line_repeat(out_ref[30:30]),
    .vga_r(out_ref[29:22]),
    .vga_g(out_ref[21:14]),
    .vga_b(out_ref[13:6]),
    .next_line(out_ref[5:5]),
    .next_field(out_ref[4:4]),
    .vga_hsync(out_ref[3:3]),
    .vga_vsync(out_ref[2:2]),
    .vga_vblank(out_ref[1:1]),
    .vga_blank(out_ref[0:0])
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
    seed = 1499633613;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
