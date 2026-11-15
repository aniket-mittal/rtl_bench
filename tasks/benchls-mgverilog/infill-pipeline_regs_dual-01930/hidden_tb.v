// Hidden tests: 5000 cycles of seeded random inputs (seed 22137457); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 381;
  reg clk;
  reg [63:0] i_0;
  reg [63:0] i_1;
  reg [31:0] i_2;
  reg [63:0] i_3;
  reg [2:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [1:0] i_7;
  reg [1:0] i_8;
  reg [2:0] i_9;
  reg [0:0] i_10;
  reg [1:0] i_11;
  reg [5:0] i_12;
  reg [63:0] i_13;
  reg [63:0] i_14;
  reg [0:0] i_15;
  reg [5:0] i_16;
  reg [0:0] i_17;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_01930 dut (
    .clk(clk),
    .abusWire1(i_0),
    .bbusWire1(i_1),
    .DselectWire1(i_2),
    .ALUImmWire1(i_3),
    .SWire1(i_4),
    .CinWire1(i_5),
    .immBit1(i_6),
    .lwSwFlag1(i_7),
    .setControlBits(i_8),
    .branchControlBit(i_9),
    .NZVCSetBit(i_10),
    .shiftBit1(i_11),
    .shamt(i_12),
    .DTAddrWire1(i_13),
    .MOVImmWire1(i_14),
    .movBit1(i_15),
    .moveImmShftAmt(i_16),
    .NOP(i_17),
    .abusWire2(out_dut[380:317]),
    .bbusWire2(out_dut[316:253]),
    .ALUImmWire2(out_dut[252:189]),
    .SWire2(out_dut[188:186]),
    .CinWire2(out_dut[185:185]),
    .DselectWire2(out_dut[184:153]),
    .immBit2(out_dut[152:152]),
    .lwSwFlag2(out_dut[151:150]),
    .setControlBitsWire1(out_dut[149:148]),
    .branchControlBitWire1(out_dut[147:145]),
    .NZVCSetBitWire1(out_dut[144:144]),
    .shiftBit2(out_dut[143:142]),
    .shamtWire1(out_dut[141:136]),
    .DTAddrWire2(out_dut[135:72]),
    .MOVImmWire2(out_dut[71:8]),
    .movBit2(out_dut[7:7]),
    .moveImmShftAmtWire1(out_dut[6:1]),
    .NOPWire1(out_dut[0:0])
  );
  mg_01930__ref ref_i (
    .clk(clk),
    .abusWire1(i_0),
    .bbusWire1(i_1),
    .DselectWire1(i_2),
    .ALUImmWire1(i_3),
    .SWire1(i_4),
    .CinWire1(i_5),
    .immBit1(i_6),
    .lwSwFlag1(i_7),
    .setControlBits(i_8),
    .branchControlBit(i_9),
    .NZVCSetBit(i_10),
    .shiftBit1(i_11),
    .shamt(i_12),
    .DTAddrWire1(i_13),
    .MOVImmWire1(i_14),
    .movBit1(i_15),
    .moveImmShftAmt(i_16),
    .NOP(i_17),
    .abusWire2(out_ref[380:317]),
    .bbusWire2(out_ref[316:253]),
    .ALUImmWire2(out_ref[252:189]),
    .SWire2(out_ref[188:186]),
    .CinWire2(out_ref[185:185]),
    .DselectWire2(out_ref[184:153]),
    .immBit2(out_ref[152:152]),
    .lwSwFlag2(out_ref[151:150]),
    .setControlBitsWire1(out_ref[149:148]),
    .branchControlBitWire1(out_ref[147:145]),
    .NZVCSetBitWire1(out_ref[144:144]),
    .shiftBit2(out_ref[143:142]),
    .shamtWire1(out_ref[141:136]),
    .DTAddrWire2(out_ref[135:72]),
    .MOVImmWire2(out_ref[71:8]),
    .movBit2(out_ref[7:7]),
    .moveImmShftAmtWire1(out_ref[6:1]),
    .NOPWire1(out_ref[0:0])
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
    seed = 22137457;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed), $random(seed)};
      i_1 = {$random(seed), $random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed), $random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed), $random(seed)};
      i_14 = {$random(seed), $random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
