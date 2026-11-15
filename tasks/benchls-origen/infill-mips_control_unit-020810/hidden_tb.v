// Hidden tests: 5000 cycles of seeded random inputs (seed 2225852487); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 11;
  reg clk;
  reg [5:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_020810 dut (
    .opcode(i_0),
    .ALUOp(out_dut[10:9]),
    .jump(out_dut[8:8]),
    .branchBeq(out_dut[7:7]),
    .branchBne(out_dut[6:6]),
    .memRd(out_dut[5:5]),
    .memWr(out_dut[4:4]),
    .mem2Reg(out_dut[3:3]),
    .regDst(out_dut[2:2]),
    .regWr(out_dut[1:1]),
    .ALUSrc(out_dut[0:0])
  );
  origen_020810__ref ref_i (
    .opcode(i_0),
    .ALUOp(out_ref[10:9]),
    .jump(out_ref[8:8]),
    .branchBeq(out_ref[7:7]),
    .branchBne(out_ref[6:6]),
    .memRd(out_ref[5:5]),
    .memWr(out_ref[4:4]),
    .mem2Reg(out_ref[3:3]),
    .regDst(out_ref[2:2]),
    .regWr(out_ref[1:1]),
    .ALUSrc(out_ref[0:0])
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
    seed = 2225852487;
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
