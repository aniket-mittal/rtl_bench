// Hidden tests: 5000 cycles of seeded random inputs (seed 740715696); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 44;
  reg clk;
  reg [23:0] i_0;
  reg [31:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_092966 dut (
    .data(i_0),
    .bytenum(i_1),
    .tokenpos(out_dut[43:28]),
    .tokenleng(out_dut[27:19]),
    .lit_leng(out_dut[18:2]),
    .lit_minus(out_dut[1:0])
  );
  autovcoder_092966__ref ref_i (
    .data(i_0),
    .bytenum(i_1),
    .tokenpos(out_ref[43:28]),
    .tokenleng(out_ref[27:19]),
    .lit_leng(out_ref[18:2]),
    .lit_minus(out_ref[1:0])
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
    seed = 740715696;
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
