// Hidden tests: 5000 cycles of seeded random inputs (seed 3460842294); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 25;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_205890 dut (
    .i_clk(clk),
    .i_pix_stb(i_0),
    .i_rst(i_1),
    .o_hs(out_dut[24:24]),
    .o_vs(out_dut[23:23]),
    .o_active(out_dut[22:22]),
    .o_screenend(out_dut[21:21]),
    .o_animate(out_dut[20:20]),
    .o_x(out_dut[19:10]),
    .o_y(out_dut[9:0])
  );
  origen_205890__ref ref_i (
    .i_clk(clk),
    .i_pix_stb(i_0),
    .i_rst(i_1),
    .o_hs(out_ref[24:24]),
    .o_vs(out_ref[23:23]),
    .o_active(out_ref[22:22]),
    .o_screenend(out_ref[21:21]),
    .o_animate(out_ref[20:20]),
    .o_x(out_ref[19:10]),
    .o_y(out_ref[9:0])
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
    seed = 3460842294;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
