// Hidden tests: 5000 cycles of seeded random inputs (seed 711595443); the submission must match reference.v
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
  reg [1:0] i_4;
  reg [1:0] i_5;
  reg [1:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_095291 dut (
    .BoardSignals_Clock(clk),
    .BoardSignals_Reset(i_0),
    .BoardSignals_Running(i_1),
    .BoardSignals_Starting(i_2),
    .BoardSignals_Started(i_3),
    .CurrentState(i_4),
    .Waiting_NextState(i_5),
    .Dispatching_NextState(i_6),
    .NextState(out_dut[4:3]),
    .Waiting_IsIn(out_dut[2:2]),
    .Dispatching_IsIn(out_dut[1:1]),
    .Dispatching_To_Waiting(out_dut[0:0])
  );
  autovcoder_095291__ref ref_i (
    .BoardSignals_Clock(clk),
    .BoardSignals_Reset(i_0),
    .BoardSignals_Running(i_1),
    .BoardSignals_Starting(i_2),
    .BoardSignals_Started(i_3),
    .CurrentState(i_4),
    .Waiting_NextState(i_5),
    .Dispatching_NextState(i_6),
    .NextState(out_ref[4:3]),
    .Waiting_IsIn(out_ref[2:2]),
    .Dispatching_IsIn(out_ref[1:1]),
    .Dispatching_To_Waiting(out_ref[0:0])
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
    seed = 711595443;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
