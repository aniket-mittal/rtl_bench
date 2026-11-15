// Hidden tests: 5000 cycles of seeded random inputs (seed 2474437784); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 163;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [31:0] i_7;
  reg [0:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_149643 dut (
    .clk(clk),
    .reset(i_0),
    .MemEn_EX_MEM(i_1),
    .MemWrite_EX_MEM(i_2),
    .MemToReg_EX_MEM(i_3),
    .RegWaddr_EX_MEM(i_4),
    .ALUResult_EX_MEM(i_5),
    .MemWdata_EX_MEM(i_6),
    .PC_EX_MEM(i_7),
    .MFHL_EX_MEM(i_8),
    .MemEn_MEM(out_dut[162:162]),
    .MemWrite_MEM(out_dut[161:161]),
    .data_sram_addr(out_dut[160:129]),
    .MemWdata_MEM(out_dut[128:97]),
    .RegWaddr_MEM_WB(out_dut[96:65]),
    .ALUResult_MEM_WB(out_dut[64:33]),
    .PC_MEM_WB(out_dut[32:1]),
    .MFHL_MEM_WB(out_dut[0:0])
  );
  origen_149643__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .MemEn_EX_MEM(i_1),
    .MemWrite_EX_MEM(i_2),
    .MemToReg_EX_MEM(i_3),
    .RegWaddr_EX_MEM(i_4),
    .ALUResult_EX_MEM(i_5),
    .MemWdata_EX_MEM(i_6),
    .PC_EX_MEM(i_7),
    .MFHL_EX_MEM(i_8),
    .MemEn_MEM(out_ref[162:162]),
    .MemWrite_MEM(out_ref[161:161]),
    .data_sram_addr(out_ref[160:129]),
    .MemWdata_MEM(out_ref[128:97]),
    .RegWaddr_MEM_WB(out_ref[96:65]),
    .ALUResult_MEM_WB(out_ref[64:33]),
    .PC_MEM_WB(out_ref[32:1]),
    .MFHL_MEM_WB(out_ref[0:0])
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
    seed = 2474437784;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
