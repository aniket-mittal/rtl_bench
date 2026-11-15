// Hidden tests: 5000 cycles of seeded random inputs (seed 2382048053); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 47;
  reg clk;
  reg [0:0] i_0;
  reg [11:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_091746 dut (
    .pclk(clk),
    .reset(i_0),
    .vga_data(i_1),
    .h_addr(out_dut[46:37]),
    .v_addr(out_dut[36:27]),
    .hsync(out_dut[26:26]),
    .vsync(out_dut[25:25]),
    .valid(out_dut[24:24]),
    .vga_r(out_dut[23:16]),
    .vga_g(out_dut[15:8]),
    .vga_b(out_dut[7:0])
  );
  origen_091746__ref ref_i (
    .pclk(clk),
    .reset(i_0),
    .vga_data(i_1),
    .h_addr(out_ref[46:37]),
    .v_addr(out_ref[36:27]),
    .hsync(out_ref[26:26]),
    .vsync(out_ref[25:25]),
    .valid(out_ref[24:24]),
    .vga_r(out_ref[23:16]),
    .vga_g(out_ref[15:8]),
    .vga_b(out_ref[7:0])
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
    seed = 2382048053;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
