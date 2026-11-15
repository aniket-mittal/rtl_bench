// Hidden tests: 5000 cycles of seeded random inputs (seed 3774033042); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 35;
  reg clk;
  reg [3:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_184926 dut (
    .aluctr(i_0),
    .aluoprand_a(i_1),
    .aluoprand_b(i_2),
    .aluoutput_c(out_dut[34:3]),
    .ifzero(out_dut[2:2]),
    .ifgtz(out_dut[1:1]),
    .ifeqz(out_dut[0:0])
  );
  origen_184926__ref ref_i (
    .aluctr(i_0),
    .aluoprand_a(i_1),
    .aluoprand_b(i_2),
    .aluoutput_c(out_ref[34:3]),
    .ifzero(out_ref[2:2]),
    .ifgtz(out_ref[1:1]),
    .ifeqz(out_ref[0:0])
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
    seed = 3774033042;
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
