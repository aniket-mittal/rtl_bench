// Hidden tests: 5000 cycles of seeded random inputs (seed 1079243143); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 10;
  reg clk;
  reg [31:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_022761 dut (
    .INST(i_0),
    .ALUControl(out_dut[9:7]),
    .RegDst(out_dut[6:6]),
    .RegWrite(out_dut[5:5]),
    .ALUSrc(out_dut[4:4]),
    .MemWrite(out_dut[3:3]),
    .MemRead(out_dut[2:2]),
    .MemtoReg(out_dut[1:1]),
    .Branch(out_dut[0:0])
  );
  origen_022761__ref ref_i (
    .INST(i_0),
    .ALUControl(out_ref[9:7]),
    .RegDst(out_ref[6:6]),
    .RegWrite(out_ref[5:5]),
    .ALUSrc(out_ref[4:4]),
    .MemWrite(out_ref[3:3]),
    .MemRead(out_ref[2:2]),
    .MemtoReg(out_ref[1:1]),
    .Branch(out_ref[0:0])
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
    seed = 1079243143;
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
