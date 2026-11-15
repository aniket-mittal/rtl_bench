// Hidden tests: 5000 cycles of seeded random inputs (seed 2434127028); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 25;
  reg clk;
  reg [6:0] i_0;
  reg [0:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_085820 dut (
    .CLK(clk),
    .DI(i_0),
    .nDSYNC(i_1),
    .R_o(out_dut[24:18]),
    .G_o(out_dut[17:11]),
    .B_o(out_dut[10:4]),
    .nCSYNC(out_dut[3:3]),
    .nHSYNC(out_dut[2:2]),
    .nVSYNC(out_dut[1:1]),
    .nCLAMP(out_dut[0:0])
  );
  autovcoder_085820__ref ref_i (
    .CLK(clk),
    .DI(i_0),
    .nDSYNC(i_1),
    .R_o(out_ref[24:18]),
    .G_o(out_ref[17:11]),
    .B_o(out_ref[10:4]),
    .nCSYNC(out_ref[3:3]),
    .nHSYNC(out_ref[2:2]),
    .nVSYNC(out_ref[1:1]),
    .nCLAMP(out_ref[0:0])
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
    seed = 2434127028;
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
