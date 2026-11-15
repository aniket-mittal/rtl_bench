// Hidden tests: 5000 cycles of seeded random inputs (seed 1557971233); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 24;
  reg clk;
  reg [19:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_015206 dut (
    .score(i_0),
    .hundred_thousands(out_dut[23:20]),
    .ten_thousands(out_dut[19:16]),
    .thousands(out_dut[15:12]),
    .hundreds(out_dut[11:8]),
    .tens(out_dut[7:4]),
    .ones(out_dut[3:0])
  );
  origen_015206__ref ref_i (
    .score(i_0),
    .hundred_thousands(out_ref[23:20]),
    .ten_thousands(out_ref[19:16]),
    .thousands(out_ref[15:12]),
    .hundreds(out_ref[11:8]),
    .tens(out_ref[7:4]),
    .ones(out_ref[3:0])
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
    seed = 1557971233;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
