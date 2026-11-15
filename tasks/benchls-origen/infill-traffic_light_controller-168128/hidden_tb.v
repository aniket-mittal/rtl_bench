// Hidden tests: 5000 cycles of seeded random inputs (seed 4255393589); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 8;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_168128 dut (
    .clk(clk),
    .rst(i_0),
    .fast_clk(i_1),
    .Ra(out_dut[7:7]),
    .Ya(out_dut[6:6]),
    .Ga(out_dut[5:5]),
    .Rb(out_dut[4:4]),
    .Yb(out_dut[3:3]),
    .Gb(out_dut[2:2]),
    .Rw(out_dut[1:1]),
    .Gw(out_dut[0:0])
  );
  origen_168128__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .fast_clk(i_1),
    .Ra(out_ref[7:7]),
    .Ya(out_ref[6:6]),
    .Ga(out_ref[5:5]),
    .Rb(out_ref[4:4]),
    .Yb(out_ref[3:3]),
    .Gb(out_ref[2:2]),
    .Rw(out_ref[1:1]),
    .Gw(out_ref[0:0])
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
    seed = 4255393589;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
