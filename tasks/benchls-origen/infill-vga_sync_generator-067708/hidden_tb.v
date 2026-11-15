// Hidden tests: 5000 cycles of seeded random inputs (seed 3520245406); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 3;
  reg clk;
  reg [0:0] i_0;
  reg [11:0] i_1;
  reg [11:0] i_2;
  reg [11:0] i_3;
  reg [11:0] i_4;
  reg [11:0] i_5;
  reg [11:0] i_6;
  reg [11:0] i_7;
  reg [11:0] i_8;
  reg [11:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_067708 dut (
    .clock(clk),
    .resetn(i_0),
    .rd_fifo_cnt(i_1),
    .H_PIXELS(i_2),
    .H_SYNCSTART(i_3),
    .H_SYNCEND(i_4),
    .H_PERIOD(i_5),
    .V_LINES(i_6),
    .V_SYNCSTART(i_7),
    .V_SYNCEND(i_8),
    .V_PERIOD(i_9),
    .hsync(out_dut[2:2]),
    .vsync(out_dut[1:1]),
    .enable(out_dut[0:0])
  );
  origen_067708__ref ref_i (
    .clock(clk),
    .resetn(i_0),
    .rd_fifo_cnt(i_1),
    .H_PIXELS(i_2),
    .H_SYNCSTART(i_3),
    .H_SYNCEND(i_4),
    .H_PERIOD(i_5),
    .V_LINES(i_6),
    .V_SYNCSTART(i_7),
    .V_SYNCEND(i_8),
    .V_PERIOD(i_9),
    .hsync(out_ref[2:2]),
    .vsync(out_ref[1:1]),
    .enable(out_ref[0:0])
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
    seed = 3520245406;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
