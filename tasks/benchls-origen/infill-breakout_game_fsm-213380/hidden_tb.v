// Hidden tests: 5000 cycles of seeded random inputs (seed 2211869847); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 15;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [5:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_213380 dut (
    .pb1(i_0),
    .pb2(i_1),
    .foursec(i_2),
    .nolives(i_3),
    .collision(i_4),
    .paddlegone(i_5),
    .PS(i_6),
    .NS(out_dut[14:9]),
    .movecarpet(out_dut[8:8]),
    .moveball(out_dut[7:7]),
    .movepaddle(out_dut[6:6]),
    .resettimer(out_dut[5:5]),
    .decrementlives(out_dut[4:4]),
    .loadlives(out_dut[3:3]),
    .paddlehide(out_dut[2:2]),
    .timecount(out_dut[1:1]),
    .resetpositions(out_dut[0:0])
  );
  origen_213380__ref ref_i (
    .pb1(i_0),
    .pb2(i_1),
    .foursec(i_2),
    .nolives(i_3),
    .collision(i_4),
    .paddlegone(i_5),
    .PS(i_6),
    .NS(out_ref[14:9]),
    .movecarpet(out_ref[8:8]),
    .moveball(out_ref[7:7]),
    .movepaddle(out_ref[6:6]),
    .resettimer(out_ref[5:5]),
    .decrementlives(out_ref[4:4]),
    .loadlives(out_ref[3:3]),
    .paddlehide(out_ref[2:2]),
    .timecount(out_ref[1:1]),
    .resetpositions(out_ref[0:0])
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
    seed = 2211869847;
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
      i_6 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
