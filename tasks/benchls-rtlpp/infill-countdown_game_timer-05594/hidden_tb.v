// Hidden tests: 5000 cycles of seeded random inputs (seed 3715172738); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 38;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_05594 dut (
    .clock(clk),
    .reset(i_0),
    .miss(i_1),
    .a(out_dut[37:37]),
    .b(out_dut[36:36]),
    .c(out_dut[35:35]),
    .d(out_dut[34:34]),
    .e(out_dut[33:33]),
    .f(out_dut[32:32]),
    .g(out_dut[31:31]),
    .dp(out_dut[30:30]),
    .an(out_dut[29:22]),
    .timer_out(out_dut[21:1]),
    .game_over(out_dut[0:0])
  );
  rtlpp_05594__ref ref_i (
    .clock(clk),
    .reset(i_0),
    .miss(i_1),
    .a(out_ref[37:37]),
    .b(out_ref[36:36]),
    .c(out_ref[35:35]),
    .d(out_ref[34:34]),
    .e(out_ref[33:33]),
    .f(out_ref[32:32]),
    .g(out_ref[31:31]),
    .dp(out_ref[30:30]),
    .an(out_ref[29:22]),
    .timer_out(out_ref[21:1]),
    .game_over(out_ref[0:0])
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
    seed = 3715172738;
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
