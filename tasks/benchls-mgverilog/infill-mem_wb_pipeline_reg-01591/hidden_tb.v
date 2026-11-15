// Hidden tests: 5000 cycles of seeded random inputs (seed 647318926); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 103;
  reg clk;
  reg [31:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [4:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_01591 dut (
    .clock(clk),
    .MEM_instruction(i_0),
    .MemReadData(i_1),
    .MEM_ALUResult(i_2),
    .MEM_RegWriteAddress(i_3),
    .MEM_RegWrite(i_4),
    .MEM_MemToReg(i_5),
    .WB_instruction(out_dut[102:71]),
    .WB_MemReadData(out_dut[70:39]),
    .WB_ALUResult(out_dut[38:7]),
    .WB_RegWriteAddress(out_dut[6:2]),
    .WB_RegWrite(out_dut[1:1]),
    .WB_MemToReg(out_dut[0:0])
  );
  mg_01591__ref ref_i (
    .clock(clk),
    .MEM_instruction(i_0),
    .MemReadData(i_1),
    .MEM_ALUResult(i_2),
    .MEM_RegWriteAddress(i_3),
    .MEM_RegWrite(i_4),
    .MEM_MemToReg(i_5),
    .WB_instruction(out_ref[102:71]),
    .WB_MemReadData(out_ref[70:39]),
    .WB_ALUResult(out_ref[38:7]),
    .WB_RegWriteAddress(out_ref[6:2]),
    .WB_RegWrite(out_ref[1:1]),
    .WB_MemToReg(out_ref[0:0])
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
    seed = 647318926;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
