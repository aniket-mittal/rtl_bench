// Hidden tests: 5000 cycles of seeded random inputs (seed 1110474018); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 20;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [1:0] i_2;
  reg [7:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_05232 dut (
    .clk(clk),
    .sdaIn(i_0),
    .enable(i_1),
    .instruction(i_2),
    .dataIn(i_3),
    .sdaOut(out_dut[19:19]),
    .scl(out_dut[18:18]),
    .isSending(out_dut[17:17]),
    .byteToSend(out_dut[16:9]),
    .byteReceived(out_dut[8:1]),
    .complete(out_dut[0:0])
  );
  rtlpp_05232__ref ref_i (
    .clk(clk),
    .sdaIn(i_0),
    .enable(i_1),
    .instruction(i_2),
    .dataIn(i_3),
    .sdaOut(out_ref[19:19]),
    .scl(out_ref[18:18]),
    .isSending(out_ref[17:17]),
    .byteToSend(out_ref[16:9]),
    .byteReceived(out_ref[8:1]),
    .complete(out_ref[0:0])
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
    seed = 1110474018;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
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
