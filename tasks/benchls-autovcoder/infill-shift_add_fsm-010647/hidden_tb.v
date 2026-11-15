// Hidden tests: 5000 cycles of seeded random inputs (seed 4010464972); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 11;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_010647 dut (
    .Start(i_0),
    .Done(i_1),
    .state0(i_2),
    .state1(i_3),
    .nstate0(out_dut[10:10]),
    .nstate1(out_dut[9:9]),
    .SubCount(out_dut[8:8]),
    .CountRst(out_dut[7:7]),
    .accRst(out_dut[6:6]),
    .accLd(out_dut[5:5]),
    .Bld(out_dut[4:4]),
    .Ald(out_dut[3:3]),
    .biRst(out_dut[2:2]),
    .Ready(out_dut[1:1]),
    .Shift(out_dut[0:0])
  );
  autovcoder_010647__ref ref_i (
    .Start(i_0),
    .Done(i_1),
    .state0(i_2),
    .state1(i_3),
    .nstate0(out_ref[10:10]),
    .nstate1(out_ref[9:9]),
    .SubCount(out_ref[8:8]),
    .CountRst(out_ref[7:7]),
    .accRst(out_ref[6:6]),
    .accLd(out_ref[5:5]),
    .Bld(out_ref[4:4]),
    .Ald(out_ref[3:3]),
    .biRst(out_ref[2:2]),
    .Ready(out_ref[1:1]),
    .Shift(out_ref[0:0])
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
    seed = 4010464972;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
