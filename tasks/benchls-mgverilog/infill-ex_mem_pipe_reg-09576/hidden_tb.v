// Hidden tests: 5000 cycles of seeded random inputs (seed 3940979355); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 78;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [4:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [3:0] i_8;
  reg [1:0] i_9;
  reg [0:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_09576 dut (
    .clock(clk),
    .reset(i_0),
    .debugEnable(i_1),
    .debugReset(i_2),
    .writeRegister(i_3),
    .writeData(i_4),
    .aluOut(i_5),
    .regWrite(i_6),
    .memToReg(i_7),
    .memWrite(i_8),
    .memReadWidth(i_9),
    .eop(i_10),
    .writeRegisterOut(out_dut[77:73]),
    .writeDataOut(out_dut[72:41]),
    .aluOutOut(out_dut[40:9]),
    .regWriteOut(out_dut[8:8]),
    .memToRegOut(out_dut[7:7]),
    .memWriteOut(out_dut[6:3]),
    .memReadWidthOut(out_dut[2:1]),
    .eopOut(out_dut[0:0])
  );
  mg_09576__ref ref_i (
    .clock(clk),
    .reset(i_0),
    .debugEnable(i_1),
    .debugReset(i_2),
    .writeRegister(i_3),
    .writeData(i_4),
    .aluOut(i_5),
    .regWrite(i_6),
    .memToReg(i_7),
    .memWrite(i_8),
    .memReadWidth(i_9),
    .eop(i_10),
    .writeRegisterOut(out_ref[77:73]),
    .writeDataOut(out_ref[72:41]),
    .aluOutOut(out_ref[40:9]),
    .regWriteOut(out_ref[8:8]),
    .memToRegOut(out_ref[7:7]),
    .memWriteOut(out_ref[6:3]),
    .memReadWidthOut(out_ref[2:1]),
    .eopOut(out_ref[0:0])
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
    seed = 3940979355;
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
