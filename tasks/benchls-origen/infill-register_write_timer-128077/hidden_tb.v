// Hidden tests: 5000 cycles of seeded random inputs (seed 3176497659); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 27;
  reg clk;
  reg [1:0] i_0;
  reg [0:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_128077 dut (
    .CLOCK_50(clk),
    .KEY(i_0),
    .req(i_1),
    .value_0(out_dut[26:19]),
    .value_1(out_dut[18:11]),
    .value_2(out_dut[10:3]),
    .value_0_valid(out_dut[2:2]),
    .value_1_valid(out_dut[1:1]),
    .value_2_valid(out_dut[0:0])
  );
  origen_128077__ref ref_i (
    .CLOCK_50(clk),
    .KEY(i_0),
    .req(i_1),
    .value_0(out_ref[26:19]),
    .value_1(out_ref[18:11]),
    .value_2(out_ref[10:3]),
    .value_0_valid(out_ref[2:2]),
    .value_1_valid(out_ref[1:1]),
    .value_2_valid(out_ref[0:0])
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
    seed = 3176497659;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
