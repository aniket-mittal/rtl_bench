// Hidden tests: 5000 cycles of seeded random inputs (seed 239197670); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 40;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [4:0] i_2;
  reg [0:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_085351 dut (
    .iClk(clk),
    .iReset_n(i_0),
    .iRun_MV(i_1),
    .iFF_full(i_2),
    .iSum_finish(i_3),
    .oRun_sum(out_dut[39:39]),
    .oRst_reg(out_dut[38:38]),
    .oRdreq_FF(out_dut[37:33]),
    .oWrreq_FF(out_dut[32:28]),
    .oRd_OM(out_dut[27:27]),
    .oAddr_OM(out_dut[26:14]),
    .oPosition(out_dut[13:1]),
    .oOutput_ready(out_dut[0:0])
  );
  autovcoder_085351__ref ref_i (
    .iClk(clk),
    .iReset_n(i_0),
    .iRun_MV(i_1),
    .iFF_full(i_2),
    .iSum_finish(i_3),
    .oRun_sum(out_ref[39:39]),
    .oRst_reg(out_ref[38:38]),
    .oRdreq_FF(out_ref[37:33]),
    .oWrreq_FF(out_ref[32:28]),
    .oRd_OM(out_ref[27:27]),
    .oAddr_OM(out_ref[26:14]),
    .oPosition(out_ref[13:1]),
    .oOutput_ready(out_ref[0:0])
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
    seed = 239197670;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
