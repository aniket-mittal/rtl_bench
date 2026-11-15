// Hidden tests: 5000 cycles of seeded random inputs (seed 2489276527); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 5;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [4:0] i_4;
  reg [4:0] i_5;
  reg [0:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_190366 dut (
    .clk(clk),
    .wr(i_0),
    .rd(i_1),
    .fifo_we(i_2),
    .fifo_rd(i_3),
    .wptr(i_4),
    .rptr(i_5),
    .rst_n(i_6),
    .fifo_full(out_dut[4:4]),
    .fifo_empty(out_dut[3:3]),
    .fifo_threshold(out_dut[2:2]),
    .fifo_overflow(out_dut[1:1]),
    .fifo_underflow(out_dut[0:0])
  );
  origen_190366__ref ref_i (
    .clk(clk),
    .wr(i_0),
    .rd(i_1),
    .fifo_we(i_2),
    .fifo_rd(i_3),
    .wptr(i_4),
    .rptr(i_5),
    .rst_n(i_6),
    .fifo_full(out_ref[4:4]),
    .fifo_empty(out_ref[3:3]),
    .fifo_threshold(out_ref[2:2]),
    .fifo_overflow(out_ref[1:1]),
    .fifo_underflow(out_ref[0:0])
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
    seed = 2489276527;
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
      i_6 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
