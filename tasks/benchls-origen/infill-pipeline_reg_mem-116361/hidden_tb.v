// Hidden tests: 5000 cycles of seeded random inputs (seed 1232859979); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 106;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [0:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [4:0] i_9;
  reg [0:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_116361 dut (
    .clk(clk),
    .rst(i_0),
    .ALUInPipeIn(i_1),
    .PCSrcInPipeIn(i_2),
    .WriteData2InPipeIn(i_3),
    .PCDataInPipeIn(i_4),
    .RegWrite(i_5),
    .MemRead(i_6),
    .MemWrite(i_7),
    .MemToReg(i_8),
    .WriteRegInPipeIn(i_9),
    .ControlHazard(i_10),
    .ALUInPipeOut(out_dut[105:74]),
    .PCSrcInPipeOut(out_dut[73:73]),
    .WriteData2InPipeOut(out_dut[72:41]),
    .PCDataInPipeOut(out_dut[40:9]),
    .RegWriteOut(out_dut[8:8]),
    .MemReadOut(out_dut[7:7]),
    .MemWriteOut(out_dut[6:6]),
    .MemToRegOut(out_dut[5:5]),
    .WriteRegInPipeOut(out_dut[4:0])
  );
  origen_116361__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .ALUInPipeIn(i_1),
    .PCSrcInPipeIn(i_2),
    .WriteData2InPipeIn(i_3),
    .PCDataInPipeIn(i_4),
    .RegWrite(i_5),
    .MemRead(i_6),
    .MemWrite(i_7),
    .MemToReg(i_8),
    .WriteRegInPipeIn(i_9),
    .ControlHazard(i_10),
    .ALUInPipeOut(out_ref[105:74]),
    .PCSrcInPipeOut(out_ref[73:73]),
    .WriteData2InPipeOut(out_ref[72:41]),
    .PCDataInPipeOut(out_ref[40:9]),
    .RegWriteOut(out_ref[8:8]),
    .MemReadOut(out_ref[7:7]),
    .MemWriteOut(out_ref[6:6]),
    .MemToRegOut(out_ref[5:5]),
    .WriteRegInPipeOut(out_ref[4:0])
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
    seed = 1232859979;
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
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
