// Hidden tests: 5000 cycles of seeded random inputs (seed 3368298768); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 21;
  reg clk;
  reg [3:0] i_0;
  reg [3:0] i_1;
  reg [3:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_085400 dut (
    .sec_ones(i_0),
    .sec_tens(i_1),
    .min(i_2),
    .sec_ones_segs(out_dut[20:14]),
    .sec_tens_segs(out_dut[13:7]),
    .min_segs(out_dut[6:0])
  );
  origen_085400__ref ref_i (
    .sec_ones(i_0),
    .sec_tens(i_1),
    .min(i_2),
    .sec_ones_segs(out_ref[20:14]),
    .sec_tens_segs(out_ref[13:7]),
    .min_segs(out_ref[6:0])
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
    seed = 3368298768;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
