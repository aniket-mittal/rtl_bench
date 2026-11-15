// Hidden tests: 5000 cycles of seeded random inputs (seed 3404181375); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 7;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_004837 dut (
    .clk(clk),
    .reset(i_0),
    .loadInst(i_1),
    .memoryReadValid(i_2),
    .fetch_RequestState(out_dut[6:6]),
    .fetch_ReceiveState(out_dut[5:5]),
    .decodeState(out_dut[4:4]),
    .setupState(out_dut[3:3]),
    .executeState(out_dut[2:2]),
    .memReadState(out_dut[1:1]),
    .writebackState(out_dut[0:0])
  );
  origen_004837__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .loadInst(i_1),
    .memoryReadValid(i_2),
    .fetch_RequestState(out_ref[6:6]),
    .fetch_ReceiveState(out_ref[5:5]),
    .decodeState(out_ref[4:4]),
    .setupState(out_ref[3:3]),
    .executeState(out_ref[2:2]),
    .memReadState(out_ref[1:1]),
    .writebackState(out_ref[0:0])
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
    seed = 3404181375;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
