// Hidden tests: 5000 cycles of seeded random inputs (seed 3799688494); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 160;
  reg clk;
  reg [1:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_172618 dut (
    .clk(clk),
    .theme(i_0),
    .borderColor(out_dut[159:128]),
    .bgColor(out_dut[127:96]),
    .lowColor(out_dut[95:64]),
    .midColor(out_dut[63:32]),
    .highColor(out_dut[31:0])
  );
  origen_172618__ref ref_i (
    .clk(clk),
    .theme(i_0),
    .borderColor(out_ref[159:128]),
    .bgColor(out_ref[127:96]),
    .lowColor(out_ref[95:64]),
    .midColor(out_ref[63:32]),
    .highColor(out_ref[31:0])
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
    seed = 3799688494;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
