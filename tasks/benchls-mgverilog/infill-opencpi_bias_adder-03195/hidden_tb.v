// Hidden tests: 5000 cycles of seeded random inputs (seed 2114743927); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 101;
  reg clk;
  reg [0:0] i_0;
  reg [2:0] i_1;
  reg [0:0] i_2;
  reg [3:0] i_3;
  reg [19:0] i_4;
  reg [31:0] i_5;
  reg [1:0] i_6;
  reg [2:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [11:0] i_10;
  reg [31:0] i_11;
  reg [3:0] i_12;
  reg [7:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_03195 dut (
    .clk(clk),
    .rst_n(i_0),
    .wci_MCmd(i_1),
    .wci_MAddrSpace(i_2),
    .wci_MByteEn(i_3),
    .wci_MAddr(i_4),
    .wci_MData(i_5),
    .wci_MFlag(i_6),
    .wsi0_MCmd(i_7),
    .wsi0_MReqLast(i_8),
    .wsi0_MBurstPrecise(i_9),
    .wsi0_MBurstLength(i_10),
    .wsi0_MData(i_11),
    .wsi0_MByteEn(i_12),
    .wsi0_MReqInfo(i_13),
    .wsi1_SThreadBusy(i_14),
    .wsi_m_SReset_n(i_15),
    .wsi_s_MReset_n(i_16),
    .wci_SResp(out_dut[100:99]),
    .wci_SData(out_dut[98:67]),
    .wci_SFlag(out_dut[66:65]),
    .wci_SThreadBusy(out_dut[64:64]),
    .wsi0_SThreadBusy(out_dut[63:63]),
    .wsi1_MCmd(out_dut[62:60]),
    .wsi1_MReqLast(out_dut[59:59]),
    .wsi1_MBurstPrecise(out_dut[58:58]),
    .wsi1_MBurstLength(out_dut[57:46]),
    .wsi1_MData(out_dut[45:14]),
    .wsi1_MByteEn(out_dut[13:10]),
    .wsi1_MReqInfo(out_dut[9:2]),
    .wsi_m_MReset_n(out_dut[1:1]),
    .wsi_s_SReset_n(out_dut[0:0])
  );
  mg_03195__ref ref_i (
    .clk(clk),
    .rst_n(i_0),
    .wci_MCmd(i_1),
    .wci_MAddrSpace(i_2),
    .wci_MByteEn(i_3),
    .wci_MAddr(i_4),
    .wci_MData(i_5),
    .wci_MFlag(i_6),
    .wsi0_MCmd(i_7),
    .wsi0_MReqLast(i_8),
    .wsi0_MBurstPrecise(i_9),
    .wsi0_MBurstLength(i_10),
    .wsi0_MData(i_11),
    .wsi0_MByteEn(i_12),
    .wsi0_MReqInfo(i_13),
    .wsi1_SThreadBusy(i_14),
    .wsi_m_SReset_n(i_15),
    .wsi_s_MReset_n(i_16),
    .wci_SResp(out_ref[100:99]),
    .wci_SData(out_ref[98:67]),
    .wci_SFlag(out_ref[66:65]),
    .wci_SThreadBusy(out_ref[64:64]),
    .wsi0_SThreadBusy(out_ref[63:63]),
    .wsi1_MCmd(out_ref[62:60]),
    .wsi1_MReqLast(out_ref[59:59]),
    .wsi1_MBurstPrecise(out_ref[58:58]),
    .wsi1_MBurstLength(out_ref[57:46]),
    .wsi1_MData(out_ref[45:14]),
    .wsi1_MByteEn(out_ref[13:10]),
    .wsi1_MReqInfo(out_ref[9:2]),
    .wsi_m_MReset_n(out_ref[1:1]),
    .wsi_s_SReset_n(out_ref[0:0])
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
    seed = 2114743927;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
