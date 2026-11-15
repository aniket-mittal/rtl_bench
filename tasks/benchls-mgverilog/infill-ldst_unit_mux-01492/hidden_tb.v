// Hidden tests: 5000 cycles of seeded random inputs (seed 3698842085); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 203;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [11:0] i_2;
  reg [31:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [1:0] i_6;
  reg [3:0] i_7;
  reg [0:0] i_8;
  reg [13:0] i_9;
  reg [1:0] i_10;
  reg [2:0] i_11;
  reg [31:0] i_12;
  reg [31:0] i_13;
  reg [31:0] i_14;
  reg [0:0] i_15;
  reg [1:0] i_16;
  reg [0:0] i_17;
  reg [13:0] i_18;
  reg [1:0] i_19;
  reg [2:0] i_20;
  reg [31:0] i_21;
  reg [31:0] i_22;
  reg [31:0] i_23;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_01492 dut (
    .iLDST_BUSY(i_0),
    .iLDST_VALID(i_1),
    .iLDST_MMU_FLAGS(i_2),
    .iLDST_DATA(i_3),
    .iUSE_SEL(i_4),
    .iEXE_REQ(i_5),
    .iEXE_ORDER(i_6),
    .iEXE_MASK(i_7),
    .iEXE_RW(i_8),
    .iEXE_ASID(i_9),
    .iEXE_MMUMOD(i_10),
    .iEXE_MMUPS(i_11),
    .iEXE_PDT(i_12),
    .iEXE_ADDR(i_13),
    .iEXE_DATA(i_14),
    .iEXCEPT_REQ(i_15),
    .iEXCEPT_ORDER(i_16),
    .iEXCEPT_RW(i_17),
    .iEXCEPT_ASID(i_18),
    .iEXCEPT_MMUMOD(i_19),
    .iEXCEPT_MMUPS(i_20),
    .iEXCEPT_PDT(i_21),
    .iEXCEPT_ADDR(i_22),
    .iEXCEPT_DATA(i_23),
    .oLDST_REQ(out_dut[202:202]),
    .oLDST_ORDER(out_dut[201:200]),
    .oLDST_MASK(out_dut[199:196]),
    .oLDST_RW(out_dut[195:195]),
    .oLDST_ASID(out_dut[194:181]),
    .oLDST_MMUMOD(out_dut[180:179]),
    .oLDST_MMUPS(out_dut[178:176]),
    .oLDST_PDT(out_dut[175:144]),
    .oLDST_ADDR(out_dut[143:112]),
    .oLDST_DATA(out_dut[111:80]),
    .oEXE_BUSY(out_dut[79:79]),
    .oEXE_REQ(out_dut[78:78]),
    .oEXE_MMU_FLAGS(out_dut[77:66]),
    .oEXE_DATA(out_dut[65:34]),
    .oEXCEPT_BUSY(out_dut[33:33]),
    .oEXCEPT_REQ(out_dut[32:32]),
    .oEXCEPT_DATA(out_dut[31:0])
  );
  mg_01492__ref ref_i (
    .iLDST_BUSY(i_0),
    .iLDST_VALID(i_1),
    .iLDST_MMU_FLAGS(i_2),
    .iLDST_DATA(i_3),
    .iUSE_SEL(i_4),
    .iEXE_REQ(i_5),
    .iEXE_ORDER(i_6),
    .iEXE_MASK(i_7),
    .iEXE_RW(i_8),
    .iEXE_ASID(i_9),
    .iEXE_MMUMOD(i_10),
    .iEXE_MMUPS(i_11),
    .iEXE_PDT(i_12),
    .iEXE_ADDR(i_13),
    .iEXE_DATA(i_14),
    .iEXCEPT_REQ(i_15),
    .iEXCEPT_ORDER(i_16),
    .iEXCEPT_RW(i_17),
    .iEXCEPT_ASID(i_18),
    .iEXCEPT_MMUMOD(i_19),
    .iEXCEPT_MMUPS(i_20),
    .iEXCEPT_PDT(i_21),
    .iEXCEPT_ADDR(i_22),
    .iEXCEPT_DATA(i_23),
    .oLDST_REQ(out_ref[202:202]),
    .oLDST_ORDER(out_ref[201:200]),
    .oLDST_MASK(out_ref[199:196]),
    .oLDST_RW(out_ref[195:195]),
    .oLDST_ASID(out_ref[194:181]),
    .oLDST_MMUMOD(out_ref[180:179]),
    .oLDST_MMUPS(out_ref[178:176]),
    .oLDST_PDT(out_ref[175:144]),
    .oLDST_ADDR(out_ref[143:112]),
    .oLDST_DATA(out_ref[111:80]),
    .oEXE_BUSY(out_ref[79:79]),
    .oEXE_REQ(out_ref[78:78]),
    .oEXE_MMU_FLAGS(out_ref[77:66]),
    .oEXE_DATA(out_ref[65:34]),
    .oEXCEPT_BUSY(out_ref[33:33]),
    .oEXCEPT_REQ(out_ref[32:32]),
    .oEXCEPT_DATA(out_ref[31:0])
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
    seed = 3698842085;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
