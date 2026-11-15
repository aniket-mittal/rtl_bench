// Hidden tests: 5000 cycles of seeded random inputs (seed 3084879282); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 72;
  reg clk;
  reg [28:0] i_0;
  reg [28:0] i_1;
  reg [28:0] i_2;
  reg [28:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_020748 dut (
    .mem_w0(i_0),
    .mem_w1(i_1),
    .mem_w2(i_2),
    .mem_w3(i_3),
    .out0(out_dut[71:54]),
    .out1(out_dut[53:36]),
    .out2(out_dut[35:18]),
    .out3(out_dut[17:0])
  );
  origen_020748__ref ref_i (
    .mem_w0(i_0),
    .mem_w1(i_1),
    .mem_w2(i_2),
    .mem_w3(i_3),
    .out0(out_ref[71:54]),
    .out1(out_ref[53:36]),
    .out2(out_ref[35:18]),
    .out3(out_ref[17:0])
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
    seed = 3084879282;
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
