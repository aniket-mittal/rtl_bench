// Hidden tests: 5000 cycles of seeded random inputs (seed 1393173809); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 40;
  reg clk;
  reg [0:0] i_0;
  reg [1:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [1:0] i_10;
  reg [1:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_156837 dut (
    .clk(clk),
    .rst(i_0),
    .currEndP(i_1),
    .NAKSent(i_2),
    .stallSent(i_3),
    .CRCError(i_4),
    .bitStuffError(i_5),
    .RxOverflow(i_6),
    .RxTimeOut(i_7),
    .dataSequence(i_8),
    .ACKRxed(i_9),
    .transType(i_10),
    .transTypeNAK(i_11),
    .endPMuxErrorsWEn(i_12),
    .clrEPRdy(i_13),
    .endPControlReg(out_dut[39:36]),
    .endP0StatusReg(out_dut[35:32]),
    .endP1StatusReg(out_dut[31:28]),
    .endP2StatusReg(out_dut[27:24]),
    .endP3StatusReg(out_dut[23:20]),
    .endP0TransTypeReg(out_dut[19:18]),
    .endP1TransTypeReg(out_dut[17:16]),
    .endP2TransTypeReg(out_dut[15:14]),
    .endP3TransTypeReg(out_dut[13:12]),
    .endP0NAKTransTypeReg(out_dut[11:10]),
    .endP1NAKTransTypeReg(out_dut[9:8]),
    .endP2NAKTransTypeReg(out_dut[7:6]),
    .endP3NAKTransTypeReg(out_dut[5:4]),
    .clrEP0Rdy(out_dut[3:3]),
    .clrEP1Rdy(out_dut[2:2]),
    .clrEP2Rdy(out_dut[1:1]),
    .clrEP3Rdy(out_dut[0:0])
  );
  origen_156837__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .currEndP(i_1),
    .NAKSent(i_2),
    .stallSent(i_3),
    .CRCError(i_4),
    .bitStuffError(i_5),
    .RxOverflow(i_6),
    .RxTimeOut(i_7),
    .dataSequence(i_8),
    .ACKRxed(i_9),
    .transType(i_10),
    .transTypeNAK(i_11),
    .endPMuxErrorsWEn(i_12),
    .clrEPRdy(i_13),
    .endPControlReg(out_ref[39:36]),
    .endP0StatusReg(out_ref[35:32]),
    .endP1StatusReg(out_ref[31:28]),
    .endP2StatusReg(out_ref[27:24]),
    .endP3StatusReg(out_ref[23:20]),
    .endP0TransTypeReg(out_ref[19:18]),
    .endP1TransTypeReg(out_ref[17:16]),
    .endP2TransTypeReg(out_ref[15:14]),
    .endP3TransTypeReg(out_ref[13:12]),
    .endP0NAKTransTypeReg(out_ref[11:10]),
    .endP1NAKTransTypeReg(out_ref[9:8]),
    .endP2NAKTransTypeReg(out_ref[7:6]),
    .endP3NAKTransTypeReg(out_ref[5:4]),
    .clrEP0Rdy(out_ref[3:3]),
    .clrEP1Rdy(out_ref[2:2]),
    .clrEP2Rdy(out_ref[1:1]),
    .clrEP3Rdy(out_ref[0:0])
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
    seed = 1393173809;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
