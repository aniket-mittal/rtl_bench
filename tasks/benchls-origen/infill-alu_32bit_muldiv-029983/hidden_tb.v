// Hidden tests: 5000 cycles of seeded random inputs (seed 3338516993); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 40;
  reg clk;
  reg [3:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [4:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_029983 dut (
    .ALU_ctrl(i_0),
    .ALU_operand_1(i_1),
    .ALU_operand_2(i_2),
    .shamnt(i_3),
    .ALU_result(out_dut[39:8]),
    .ALU_status(out_dut[7:0])
  );
  origen_029983__ref ref_i (
    .ALU_ctrl(i_0),
    .ALU_operand_1(i_1),
    .ALU_operand_2(i_2),
    .shamnt(i_3),
    .ALU_result(out_ref[39:8]),
    .ALU_status(out_ref[7:0])
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
    seed = 3338516993;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
