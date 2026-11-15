// Hidden tests: 5000 cycles of seeded random inputs (seed 1751264063); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 26;
  reg clk;
  reg [31:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  instr_splitter_r dut (
    .instruction(i_0),
    .rs(out_dut[25:21]),
    .rt(out_dut[20:16]),
    .rd(out_dut[15:11]),
    .shamt(out_dut[10:6]),
    .funct(out_dut[5:0])
  );
  instr_splitter_r__ref ref_i (
    .instruction(i_0),
    .rs(out_ref[25:21]),
    .rt(out_ref[20:16]),
    .rd(out_ref[15:11]),
    .shamt(out_ref[10:6]),
    .funct(out_ref[5:0])
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
    seed = 1751264063;
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
