// Hidden tests: 5000 cycles of seeded random inputs (seed 4209794791); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 77;
  reg clk;
  reg [15:0] i_0;
  reg [15:0] i_1;
  reg [15:0] i_2;
  reg [15:0] i_3;
  reg [15:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_01259 dut (
    .OS1(i_0),
    .OS2(i_1),
    .OS3(i_2),
    .OS4(i_3),
    .OS5(i_4),
    .op1(out_dut[76:70]),
    .op2(out_dut[69:63]),
    .op3(out_dut[62:56]),
    .op4(out_dut[55:49]),
    .op5(out_dut[48:42]),
    .aSel2(out_dut[41:39]),
    .aSel3(out_dut[38:36]),
    .aSel4(out_dut[35:33]),
    .bSel2(out_dut[32:30]),
    .bSel3(out_dut[29:27]),
    .bSel4(out_dut[26:24]),
    .cSel2(out_dut[23:21]),
    .cSel3(out_dut[20:18]),
    .cSel4(out_dut[17:15]),
    .literalV(out_dut[14:0])
  );
  mg_01259__ref ref_i (
    .OS1(i_0),
    .OS2(i_1),
    .OS3(i_2),
    .OS4(i_3),
    .OS5(i_4),
    .op1(out_ref[76:70]),
    .op2(out_ref[69:63]),
    .op3(out_ref[62:56]),
    .op4(out_ref[55:49]),
    .op5(out_ref[48:42]),
    .aSel2(out_ref[41:39]),
    .aSel3(out_ref[38:36]),
    .aSel4(out_ref[35:33]),
    .bSel2(out_ref[32:30]),
    .bSel3(out_ref[29:27]),
    .bSel4(out_ref[26:24]),
    .cSel2(out_ref[23:21]),
    .cSel3(out_ref[20:18]),
    .cSel4(out_ref[17:15]),
    .literalV(out_ref[14:0])
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
    seed = 4209794791;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
