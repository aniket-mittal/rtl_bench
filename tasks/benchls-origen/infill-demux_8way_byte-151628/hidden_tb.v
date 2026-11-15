// Hidden tests: 5000 cycles of seeded random inputs (seed 2573295370); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 64;
  reg clk;
  reg [7:0] i_0;
  reg [2:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_151628 dut (
    .in(i_0),
    .Cin(i_1),
    .out1(out_dut[63:56]),
    .out2(out_dut[55:48]),
    .out3(out_dut[47:40]),
    .out4(out_dut[39:32]),
    .out5(out_dut[31:24]),
    .out6(out_dut[23:16]),
    .out7(out_dut[15:8]),
    .out8(out_dut[7:0])
  );
  origen_151628__ref ref_i (
    .in(i_0),
    .Cin(i_1),
    .out1(out_ref[63:56]),
    .out2(out_ref[55:48]),
    .out3(out_ref[47:40]),
    .out4(out_ref[39:32]),
    .out5(out_ref[31:24]),
    .out6(out_ref[23:16]),
    .out7(out_ref[15:8]),
    .out8(out_ref[7:0])
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
    seed = 2573295370;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
