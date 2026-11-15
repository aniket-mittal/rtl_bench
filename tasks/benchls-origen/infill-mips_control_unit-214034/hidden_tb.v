// Hidden tests: 5000 cycles of seeded random inputs (seed 3898436385); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 10;
  reg clk;
  reg [5:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_214034 dut (
    .i_instrCode(i_0),
    .o_regDst(out_dut[9:9]),
    .o_jump(out_dut[8:8]),
    .o_branch(out_dut[7:7]),
    .o_memToReg(out_dut[6:6]),
    .o_aluOp(out_dut[5:4]),
    .o_memWrite(out_dut[3:3]),
    .o_aluSrc(out_dut[2:2]),
    .o_regWrite(out_dut[1:1]),
    .o_aluConI(out_dut[0:0])
  );
  origen_214034__ref ref_i (
    .i_instrCode(i_0),
    .o_regDst(out_ref[9:9]),
    .o_jump(out_ref[8:8]),
    .o_branch(out_ref[7:7]),
    .o_memToReg(out_ref[6:6]),
    .o_aluOp(out_ref[5:4]),
    .o_memWrite(out_ref[3:3]),
    .o_aluSrc(out_ref[2:2]),
    .o_regWrite(out_ref[1:1]),
    .o_aluConI(out_ref[0:0])
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
    seed = 3898436385;
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
