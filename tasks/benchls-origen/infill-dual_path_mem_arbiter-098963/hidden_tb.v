// Hidden tests: 5000 cycles of seeded random inputs (seed 535293942); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 274;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [4:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [31:0] i_9;
  reg [31:0] i_10;
  reg [4:0] i_11;
  reg [31:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_098963 dut (
    .RegWriteA(i_0),
    .MemtoRegA(i_1),
    .MemWriteA(i_2),
    .ALUOutA(i_3),
    .WriteDataA(i_4),
    .WriteRegA(i_5),
    .RegWriteB(i_6),
    .MemtoRegB(i_7),
    .MemWriteB(i_8),
    .ALUOutB(i_9),
    .WriteDataB(i_10),
    .WriteRegB(i_11),
    .ReadData(i_12),
    .Wen(out_dut[273:273]),
    .Ren(out_dut[272:272]),
    .Addr(out_dut[271:240]),
    .WriteData(out_dut[239:208]),
    .RegWriteAOut(out_dut[207:207]),
    .MemtoRegAOut(out_dut[206:206]),
    .MemWriteAOut(out_dut[205:205]),
    .ALUOutAOut(out_dut[204:173]),
    .WriteDataAOut(out_dut[172:141]),
    .ReadDataMOutA(out_dut[140:109]),
    .WriteRegAOut(out_dut[108:104]),
    .RegWriteBOut(out_dut[103:103]),
    .MemtoRegBOut(out_dut[102:102]),
    .MemWriteBOut(out_dut[101:101]),
    .ALUOutBOut(out_dut[100:69]),
    .WriteDataBOut(out_dut[68:37]),
    .ReadDataMOutB(out_dut[36:5]),
    .WriteRegBOut(out_dut[4:0])
  );
  origen_098963__ref ref_i (
    .RegWriteA(i_0),
    .MemtoRegA(i_1),
    .MemWriteA(i_2),
    .ALUOutA(i_3),
    .WriteDataA(i_4),
    .WriteRegA(i_5),
    .RegWriteB(i_6),
    .MemtoRegB(i_7),
    .MemWriteB(i_8),
    .ALUOutB(i_9),
    .WriteDataB(i_10),
    .WriteRegB(i_11),
    .ReadData(i_12),
    .Wen(out_ref[273:273]),
    .Ren(out_ref[272:272]),
    .Addr(out_ref[271:240]),
    .WriteData(out_ref[239:208]),
    .RegWriteAOut(out_ref[207:207]),
    .MemtoRegAOut(out_ref[206:206]),
    .MemWriteAOut(out_ref[205:205]),
    .ALUOutAOut(out_ref[204:173]),
    .WriteDataAOut(out_ref[172:141]),
    .ReadDataMOutA(out_ref[140:109]),
    .WriteRegAOut(out_ref[108:104]),
    .RegWriteBOut(out_ref[103:103]),
    .MemtoRegBOut(out_ref[102:102]),
    .MemWriteBOut(out_ref[101:101]),
    .ALUOutBOut(out_ref[100:69]),
    .WriteDataBOut(out_ref[68:37]),
    .ReadDataMOutB(out_ref[36:5]),
    .WriteRegBOut(out_ref[4:0])
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
    seed = 535293942;
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
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
