// Hidden tests: 5000 cycles of seeded random inputs (seed 4004175626); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 13;
  reg clk;
  reg [6:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_101606 dut (
    .Opcode(i_0),
    .ALUSrc(out_dut[12:12]),
    .MemtoReg(out_dut[11:11]),
    .RegWrite(out_dut[10:10]),
    .MemRead(out_dut[9:9]),
    .MemWrite(out_dut[8:8]),
    .Branch(out_dut[7:7]),
    .ALUOp(out_dut[6:5]),
    .JALR(out_dut[4:4]),
    .Jump(out_dut[3:3]),
    .PCtoReg(out_dut[2:2]),
    .PCregsrc(out_dut[1:0])
  );
  origen_101606__ref ref_i (
    .Opcode(i_0),
    .ALUSrc(out_ref[12:12]),
    .MemtoReg(out_ref[11:11]),
    .RegWrite(out_ref[10:10]),
    .MemRead(out_ref[9:9]),
    .MemWrite(out_ref[8:8]),
    .Branch(out_ref[7:7]),
    .ALUOp(out_ref[6:5]),
    .JALR(out_ref[4:4]),
    .Jump(out_ref[3:3]),
    .PCtoReg(out_ref[2:2]),
    .PCregsrc(out_ref[1:0])
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
    seed = 4004175626;
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
