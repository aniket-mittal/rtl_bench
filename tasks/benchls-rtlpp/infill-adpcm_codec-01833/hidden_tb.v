// Hidden tests: 5000 cycles of seeded random inputs (seed 667134793); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 64;
  reg clk;
  reg [0:0] i_0;
  reg [15:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_01833 dut (
    .clk(clk),
    .reset(i_0),
    .x_in(i_1),
    .y_out(out_dut[63:60]),
    .p_out(out_dut[59:44]),
    .p_underflow(out_dut[43:43]),
    .p_overflow(out_dut[42:42]),
    .i_out(out_dut[41:34]),
    .i_underflow(out_dut[33:33]),
    .i_overflow(out_dut[32:32]),
    .err(out_dut[31:16]),
    .sz_out(out_dut[15:1]),
    .s_out(out_dut[0:0])
  );
  rtlpp_01833__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .x_in(i_1),
    .y_out(out_ref[63:60]),
    .p_out(out_ref[59:44]),
    .p_underflow(out_ref[43:43]),
    .p_overflow(out_ref[42:42]),
    .i_out(out_ref[41:34]),
    .i_underflow(out_ref[33:33]),
    .i_overflow(out_ref[32:32]),
    .err(out_ref[31:16]),
    .sz_out(out_ref[15:1]),
    .s_out(out_ref[0:0])
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
    seed = 667134793;
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
