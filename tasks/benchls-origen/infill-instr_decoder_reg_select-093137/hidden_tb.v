// Hidden tests: 5000 cycles of seeded random inputs (seed 580560467); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 50;
  reg clk;
  reg [15:0] i_0;
  reg [2:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_093137 dut (
    .iRegToiDec(i_0),
    .nsel(i_1),
    .opcode(out_dut[49:47]),
    .op(out_dut[46:45]),
    .ALUop(out_dut[44:43]),
    .sximm5(out_dut[42:27]),
    .sximm8(out_dut[26:11]),
    .shift(out_dut[10:9]),
    .readnum(out_dut[8:6]),
    .writenum(out_dut[5:3]),
    .b_cond(out_dut[2:0])
  );
  origen_093137__ref ref_i (
    .iRegToiDec(i_0),
    .nsel(i_1),
    .opcode(out_ref[49:47]),
    .op(out_ref[46:45]),
    .ALUop(out_ref[44:43]),
    .sximm5(out_ref[42:27]),
    .sximm8(out_ref[26:11]),
    .shift(out_ref[10:9]),
    .readnum(out_ref[8:6]),
    .writenum(out_ref[5:3]),
    .b_cond(out_ref[2:0])
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
    seed = 580560467;
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
