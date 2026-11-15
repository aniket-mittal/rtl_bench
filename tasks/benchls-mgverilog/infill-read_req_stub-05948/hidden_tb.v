// Hidden tests: 5000 cycles of seeded random inputs (seed 3317394732); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 92;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [31:0] i_7;
  reg [511:0] i_8;
  reg [255:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_05948 dut (
    .iCLOCK(clk),
    .inRESET(i_0),
    .iRESET_SYNC(i_1),
    .iREMOVE(i_2),
    .iRD_REQ(i_3),
    .iRD_ADDR(i_4),
    .iRD_BUSY(i_5),
    .iWR_REQ(i_6),
    .iWR_ADDR(i_7),
    .iWR_DATA(i_8),
    .iWR_MMU_FLAGS(i_9),
    .oRD_BUSY(out_dut[91:91]),
    .oRD_VALID(out_dut[90:90]),
    .oRD_HIT(out_dut[89:89]),
    .oRD_DATA(out_dut[88:25]),
    .oRD_MMU_FLAGS(out_dut[24:1]),
    .oWR_BUSY(out_dut[0:0])
  );
  mg_05948__ref ref_i (
    .iCLOCK(clk),
    .inRESET(i_0),
    .iRESET_SYNC(i_1),
    .iREMOVE(i_2),
    .iRD_REQ(i_3),
    .iRD_ADDR(i_4),
    .iRD_BUSY(i_5),
    .iWR_REQ(i_6),
    .iWR_ADDR(i_7),
    .iWR_DATA(i_8),
    .iWR_MMU_FLAGS(i_9),
    .oRD_BUSY(out_ref[91:91]),
    .oRD_VALID(out_ref[90:90]),
    .oRD_HIT(out_ref[89:89]),
    .oRD_DATA(out_ref[88:25]),
    .oRD_MMU_FLAGS(out_ref[24:1]),
    .oWR_BUSY(out_ref[0:0])
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
    seed = 3317394732;
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
      i_8 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_9 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
