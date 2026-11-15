// Hidden tests: 5000 cycles of seeded random inputs (seed 958130534); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 110;
  reg clk;
  reg [0:0] i_0;
  reg [63:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_204157 dut (
    .clk(clk),
    .rst_n(i_0),
    .ififo_wdata(i_1),
    .ififo_wen(i_2),
    .tfifo_rready(i_3),
    .ififo_rdy(out_dut[109:109]),
    .tfifo_rdata(out_dut[108:45]),
    .tfifo_rstrb(out_dut[44:37]),
    .tfifo_rkeep(out_dut[36:29]),
    .tfifo_rid(out_dut[28:21]),
    .tfifo_rdest(out_dut[20:13]),
    .tfifo_ruser(out_dut[12:5]),
    .tfifo_rlast(out_dut[4:4]),
    .tfifo_rvalid(out_dut[3:3]),
    .fifo_empty(out_dut[2:2]),
    .fifo_full(out_dut[1:1]),
    .fifo_almost_full(out_dut[0:0])
  );
  origen_204157__ref ref_i (
    .clk(clk),
    .rst_n(i_0),
    .ififo_wdata(i_1),
    .ififo_wen(i_2),
    .tfifo_rready(i_3),
    .ififo_rdy(out_ref[109:109]),
    .tfifo_rdata(out_ref[108:45]),
    .tfifo_rstrb(out_ref[44:37]),
    .tfifo_rkeep(out_ref[36:29]),
    .tfifo_rid(out_ref[28:21]),
    .tfifo_rdest(out_ref[20:13]),
    .tfifo_ruser(out_ref[12:5]),
    .tfifo_rlast(out_ref[4:4]),
    .tfifo_rvalid(out_ref[3:3]),
    .fifo_empty(out_ref[2:2]),
    .fifo_full(out_ref[1:1]),
    .fifo_almost_full(out_ref[0:0])
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
    seed = 958130534;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed), $random(seed)};
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
