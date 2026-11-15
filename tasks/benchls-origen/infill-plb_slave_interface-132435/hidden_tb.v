// Hidden tests: 5000 cycles of seeded random inputs (seed 3998786865); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 55;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [2:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [3:0] i_11;
  reg [1:0] i_12;
  reg [3:0] i_13;
  reg [2:0] i_14;
  reg [0:0] i_15;
  reg [31:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  reg [1:0] i_21;
  reg [1:0] i_22;
  reg [1:0] i_23;
  reg [15:0] i_24;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_132435 dut (
    .SPLB_Clk(clk),
    .SPLB_Rst(i_0),
    .PLB_ABus(i_1),
    .PLB_UABus(i_2),
    .PLB_PAValid(i_3),
    .PLB_SAValid(i_4),
    .PLB_rdPrim(i_5),
    .PLB_wrPrim(i_6),
    .PLB_masterID(i_7),
    .PLB_abort(i_8),
    .PLB_busLock(i_9),
    .PLB_RNW(i_10),
    .PLB_BE(i_11),
    .PLB_MSize(i_12),
    .PLB_size(i_13),
    .PLB_type(i_14),
    .PLB_lockErr(i_15),
    .PLB_wrDBus(i_16),
    .PLB_wrBurst(i_17),
    .PLB_rdBurst(i_18),
    .PLB_wrPendReq(i_19),
    .PLB_rdPendReq(i_20),
    .PLB_wrPendPri(i_21),
    .PLB_rdPendPri(i_22),
    .PLB_reqPri(i_23),
    .PLB_TAttribute(i_24),
    .Sl_addrAck(out_dut[54:54]),
    .Sl_SSize(out_dut[53:52]),
    .Sl_wait(out_dut[51:51]),
    .Sl_rearbitrate(out_dut[50:50]),
    .Sl_wrDAck(out_dut[49:49]),
    .Sl_wrComp(out_dut[48:48]),
    .Sl_wrBTerm(out_dut[47:47]),
    .Sl_rdDBus(out_dut[46:15]),
    .Sl_rdWdAddr(out_dut[14:11]),
    .Sl_rdDAck(out_dut[10:10]),
    .Sl_rdComp(out_dut[9:9]),
    .Sl_rdBTerm(out_dut[8:8]),
    .Sl_MBusy(out_dut[7:6]),
    .Sl_MWrErr(out_dut[5:4]),
    .Sl_MRdErr(out_dut[3:2]),
    .Sl_MIRQ(out_dut[1:1]),
    .IP2INTC_Irpt(out_dut[0:0])
  );
  origen_132435__ref ref_i (
    .SPLB_Clk(clk),
    .SPLB_Rst(i_0),
    .PLB_ABus(i_1),
    .PLB_UABus(i_2),
    .PLB_PAValid(i_3),
    .PLB_SAValid(i_4),
    .PLB_rdPrim(i_5),
    .PLB_wrPrim(i_6),
    .PLB_masterID(i_7),
    .PLB_abort(i_8),
    .PLB_busLock(i_9),
    .PLB_RNW(i_10),
    .PLB_BE(i_11),
    .PLB_MSize(i_12),
    .PLB_size(i_13),
    .PLB_type(i_14),
    .PLB_lockErr(i_15),
    .PLB_wrDBus(i_16),
    .PLB_wrBurst(i_17),
    .PLB_rdBurst(i_18),
    .PLB_wrPendReq(i_19),
    .PLB_rdPendReq(i_20),
    .PLB_wrPendPri(i_21),
    .PLB_rdPendPri(i_22),
    .PLB_reqPri(i_23),
    .PLB_TAttribute(i_24),
    .Sl_addrAck(out_ref[54:54]),
    .Sl_SSize(out_ref[53:52]),
    .Sl_wait(out_ref[51:51]),
    .Sl_rearbitrate(out_ref[50:50]),
    .Sl_wrDAck(out_ref[49:49]),
    .Sl_wrComp(out_ref[48:48]),
    .Sl_wrBTerm(out_ref[47:47]),
    .Sl_rdDBus(out_ref[46:15]),
    .Sl_rdWdAddr(out_ref[14:11]),
    .Sl_rdDAck(out_ref[10:10]),
    .Sl_rdComp(out_ref[9:9]),
    .Sl_rdBTerm(out_ref[8:8]),
    .Sl_MBusy(out_ref[7:6]),
    .Sl_MWrErr(out_ref[5:4]),
    .Sl_MRdErr(out_ref[3:2]),
    .Sl_MIRQ(out_ref[1:1]),
    .IP2INTC_Irpt(out_ref[0:0])
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
    seed = 3998786865;
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
      i_21 = {$random(seed)};
      i_22 = {$random(seed)};
      i_23 = {$random(seed)};
      i_24 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
