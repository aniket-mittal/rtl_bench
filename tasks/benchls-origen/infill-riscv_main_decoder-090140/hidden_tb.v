// Hidden tests: 5000 cycles of seeded random inputs (seed 3291706068); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 8;
  reg clk;
  reg [6:0] i_0;
  reg [0:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_090140 dut (
    .opcode(i_0),
    .control_sel(i_1),
    .MemRead(out_dut[7:7]),
    .MemtoReg(out_dut[6:6]),
    .MemWrite(out_dut[5:5]),
    .RegWrite(out_dut[4:4]),
    .Branch(out_dut[3:3]),
    .ALUSrc(out_dut[2:2]),
    .ALUop(out_dut[1:0])
  );
  origen_090140__ref ref_i (
    .opcode(i_0),
    .control_sel(i_1),
    .MemRead(out_ref[7:7]),
    .MemtoReg(out_ref[6:6]),
    .MemWrite(out_ref[5:5]),
    .RegWrite(out_ref[4:4]),
    .Branch(out_ref[3:3]),
    .ALUSrc(out_ref[2:2]),
    .ALUop(out_ref[1:0])
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
    seed = 3291706068;
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
