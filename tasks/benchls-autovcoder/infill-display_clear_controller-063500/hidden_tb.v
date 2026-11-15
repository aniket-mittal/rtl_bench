// Hidden tests: 5000 cycles of seeded random inputs (seed 4150659222); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 50;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [31:0] i_3;
  reg [0:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_063500 dut (
    .iCLOCK(clk),
    .inRESET(i_0),
    .iRESET_SYNC(i_1),
    .iIF_VALID(i_2),
    .iIF_DATA(i_3),
    .iIF_BUSY(i_4),
    .oIF_BUSY(out_dut[49:49]),
    .oIF_FINISH(out_dut[48:48]),
    .oIF_VALID(out_dut[47:47]),
    .oIF_ADDR(out_dut[46:24]),
    .oIF_DATA(out_dut[23:0])
  );
  autovcoder_063500__ref ref_i (
    .iCLOCK(clk),
    .inRESET(i_0),
    .iRESET_SYNC(i_1),
    .iIF_VALID(i_2),
    .iIF_DATA(i_3),
    .iIF_BUSY(i_4),
    .oIF_BUSY(out_ref[49:49]),
    .oIF_FINISH(out_ref[48:48]),
    .oIF_VALID(out_ref[47:47]),
    .oIF_ADDR(out_ref[46:24]),
    .oIF_DATA(out_ref[23:0])
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
    seed = 4150659222;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
