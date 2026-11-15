// Hidden tests: 5000 cycles of seeded random inputs (seed 1681196476); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 52;
  reg clk;
  reg [0:0] i_0;
  reg [47:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_006937 dut (
    .clk(clk),
    .rst(i_0),
    .din(i_1),
    .empty(i_2),
    .almost_empty(i_3),
    .full(i_4),
    .total(i_5),
    .ready(i_6),
    .finish_ack(i_7),
    .rd_en(out_dut[51:51]),
    .wr_en(out_dut[50:50]),
    .dout(out_dut[49:2]),
    .ack(out_dut[1:1]),
    .finish(out_dut[0:0])
  );
  origen_006937__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .din(i_1),
    .empty(i_2),
    .almost_empty(i_3),
    .full(i_4),
    .total(i_5),
    .ready(i_6),
    .finish_ack(i_7),
    .rd_en(out_ref[51:51]),
    .wr_en(out_ref[50:50]),
    .dout(out_ref[49:2]),
    .ack(out_ref[1:1]),
    .finish(out_ref[0:0])
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
    seed = 1681196476;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed), $random(seed)};
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
