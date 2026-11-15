// Hidden tests: 5000 cycles of seeded random inputs (seed 3817669829); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 42;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [6:0] i_3;
  reg [15:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [4:0] i_10;
  reg [15:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_02433 dut (
    .clk(clk),
    .rst(i_0),
    .rd(i_1),
    .wr(i_2),
    .addr(i_3),
    .data_in(i_4),
    .jtaglocked(i_5),
    .busy(i_6),
    .drdy(i_7),
    .eoc(i_8),
    .eos(i_9),
    .channel(i_10),
    .dout(i_11),
    .data_out(out_dut[41:26]),
    .valid(out_dut[25:25]),
    .dwe(out_dut[24:24]),
    .den(out_dut[23:23]),
    .daddr(out_dut[22:16]),
    .din(out_dut[15:0])
  );
  mg_02433__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .rd(i_1),
    .wr(i_2),
    .addr(i_3),
    .data_in(i_4),
    .jtaglocked(i_5),
    .busy(i_6),
    .drdy(i_7),
    .eoc(i_8),
    .eos(i_9),
    .channel(i_10),
    .dout(i_11),
    .data_out(out_ref[41:26]),
    .valid(out_ref[25:25]),
    .dwe(out_ref[24:24]),
    .den(out_ref[23:23]),
    .daddr(out_ref[22:16]),
    .din(out_ref[15:0])
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
    seed = 3817669829;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
