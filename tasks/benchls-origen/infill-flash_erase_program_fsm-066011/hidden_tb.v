// Hidden tests: 5000 cycles of seeded random inputs (seed 1475499200); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 31;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_066011 dut (
    .iOSC_28(clk),
    .iERASE(i_0),
    .iPROGRAM(i_1),
    .iVERIFY(i_2),
    .iOK(i_3),
    .iFAIL(i_4),
    .iRESET_N(i_5),
    .p_ready(i_6),
    .WE_CLK(i_7),
    .iFLASH_RY_N(i_8),
    .oFLASH_ADDR(out_dut[30:7]),
    .oFLASH_CMD(out_dut[6:3]),
    .oFLASH_TR(out_dut[2:2]),
    .oREAD_PRO_END(out_dut[1:1]),
    .oVERIFY_TIME(out_dut[0:0])
  );
  origen_066011__ref ref_i (
    .iOSC_28(clk),
    .iERASE(i_0),
    .iPROGRAM(i_1),
    .iVERIFY(i_2),
    .iOK(i_3),
    .iFAIL(i_4),
    .iRESET_N(i_5),
    .p_ready(i_6),
    .WE_CLK(i_7),
    .iFLASH_RY_N(i_8),
    .oFLASH_ADDR(out_ref[30:7]),
    .oFLASH_CMD(out_ref[6:3]),
    .oFLASH_TR(out_ref[2:2]),
    .oREAD_PRO_END(out_ref[1:1]),
    .oVERIFY_TIME(out_ref[0:0])
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
    seed = 1475499200;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
