// Hidden tests: 5000 cycles of seeded random inputs (seed 2177155457); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 35;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [1:0] i_5;
  reg [3:0] i_6;
  reg [4:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_071065 dut (
    .clk(clk),
    .rst(i_0),
    .bus_cs(i_1),
    .bus_busy(i_2),
    .bus_legit(i_3),
    .ASn(i_4),
    .DSn(i_5),
    .num(i_6),
    .den(i_7),
    .wait2(i_8),
    .wait3(i_9),
    .frst(i_10),
    .cpu_cen(out_dut[34:34]),
    .cpu_cenb(out_dut[33:33]),
    .DTACKn(out_dut[32:32]),
    .fave(out_dut[31:16]),
    .fworst(out_dut[15:0])
  );
  autovcoder_071065__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .bus_cs(i_1),
    .bus_busy(i_2),
    .bus_legit(i_3),
    .ASn(i_4),
    .DSn(i_5),
    .num(i_6),
    .den(i_7),
    .wait2(i_8),
    .wait3(i_9),
    .frst(i_10),
    .cpu_cen(out_ref[34:34]),
    .cpu_cenb(out_ref[33:33]),
    .DTACKn(out_ref[32:32]),
    .fave(out_ref[31:16]),
    .fworst(out_ref[15:0])
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
    seed = 2177155457;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
