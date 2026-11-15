// Hidden tests: 5000 cycles of seeded random inputs (seed 3629024950); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 133;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [4:0] i_4;
  reg [4:0] i_5;
  reg [4:0] i_6;
  reg [4:0] i_7;
  reg [3:0] i_8;
  reg [31:0] i_9;
  reg [31:0] i_10;
  reg [31:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [3:0] i_16;
  reg [0:0] i_17;
  reg [1:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_07515 dut (
    .clock(clk),
    .reset(i_0),
    .debugEnable(i_1),
    .debugReset(i_2),
    .syncClr(i_3),
    .rs(i_4),
    .rt(i_5),
    .rd(i_6),
    .sa(i_7),
    .aluOperation(i_8),
    .sigExt(i_9),
    .readData1(i_10),
    .readData2(i_11),
    .aluSrc(i_12),
    .aluShiftImm(i_13),
    .regDst(i_14),
    .loadImm(i_15),
    .memWrite(i_16),
    .memToReg(i_17),
    .memReadWidth(i_18),
    .regWrite(i_19),
    .eop(i_20),
    .aluOperationOut(out_dut[132:129]),
    .sigExtOut(out_dut[128:97]),
    .readData1Out(out_dut[96:65]),
    .readData2Out(out_dut[64:33]),
    .aluSrcOut(out_dut[32:32]),
    .aluShiftImmOut(out_dut[31:31]),
    .memWriteOut(out_dut[30:27]),
    .memToRegOut(out_dut[26:26]),
    .memReadWidthOut(out_dut[25:24]),
    .rsOut(out_dut[23:19]),
    .rtOut(out_dut[18:14]),
    .rdOut(out_dut[13:9]),
    .saOut(out_dut[8:4]),
    .regDstOut(out_dut[3:3]),
    .loadImmOut(out_dut[2:2]),
    .regWriteOut(out_dut[1:1]),
    .eopOut(out_dut[0:0])
  );
  mg_07515__ref ref_i (
    .clock(clk),
    .reset(i_0),
    .debugEnable(i_1),
    .debugReset(i_2),
    .syncClr(i_3),
    .rs(i_4),
    .rt(i_5),
    .rd(i_6),
    .sa(i_7),
    .aluOperation(i_8),
    .sigExt(i_9),
    .readData1(i_10),
    .readData2(i_11),
    .aluSrc(i_12),
    .aluShiftImm(i_13),
    .regDst(i_14),
    .loadImm(i_15),
    .memWrite(i_16),
    .memToReg(i_17),
    .memReadWidth(i_18),
    .regWrite(i_19),
    .eop(i_20),
    .aluOperationOut(out_ref[132:129]),
    .sigExtOut(out_ref[128:97]),
    .readData1Out(out_ref[96:65]),
    .readData2Out(out_ref[64:33]),
    .aluSrcOut(out_ref[32:32]),
    .aluShiftImmOut(out_ref[31:31]),
    .memWriteOut(out_ref[30:27]),
    .memToRegOut(out_ref[26:26]),
    .memReadWidthOut(out_ref[25:24]),
    .rsOut(out_ref[23:19]),
    .rtOut(out_ref[18:14]),
    .rdOut(out_ref[13:9]),
    .saOut(out_ref[8:4]),
    .regDstOut(out_ref[3:3]),
    .loadImmOut(out_ref[2:2]),
    .regWriteOut(out_ref[1:1]),
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
    seed = 3629024950;
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
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
