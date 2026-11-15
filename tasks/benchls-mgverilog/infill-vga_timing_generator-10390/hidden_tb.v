// Hidden tests: 5000 cycles of seeded random inputs (seed 3031370306); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 44;
  reg clk;
  reg [14:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_10390 dut (
    .clk(clk),
    .pixel(i_0),
    .sync(i_1),
    .border(i_2),
    .vga_h(out_dut[43:43]),
    .vga_v(out_dut[42:42]),
    .vga_r(out_dut[41:38]),
    .vga_g(out_dut[37:34]),
    .vga_b(out_dut[33:30]),
    .vga_hcounter(out_dut[29:20]),
    .vga_vcounter(out_dut[19:10]),
    .next_pixel_x(out_dut[9:0])
  );
  mg_10390__ref ref_i (
    .clk(clk),
    .pixel(i_0),
    .sync(i_1),
    .border(i_2),
    .vga_h(out_ref[43:43]),
    .vga_v(out_ref[42:42]),
    .vga_r(out_ref[41:38]),
    .vga_g(out_ref[37:34]),
    .vga_b(out_ref[33:30]),
    .vga_hcounter(out_ref[29:20]),
    .vga_vcounter(out_ref[19:10]),
    .next_pixel_x(out_ref[9:0])
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
    seed = 3031370306;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
