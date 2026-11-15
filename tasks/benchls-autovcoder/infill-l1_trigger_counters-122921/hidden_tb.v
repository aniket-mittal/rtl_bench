// Hidden tests: 5000 cycles of seeded random inputs (seed 973235203); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 263;
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
  reg [0:0] i_9;
  reg [0:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_122921 dut (
    .gclk_40m(clk),
    .l0(i_0),
    .l1(i_1),
    .l2a(i_2),
    .l2r(i_3),
    .l1out_c(i_4),
    .rdocmd_c(i_5),
    .abortcmd_c(i_6),
    .evcntres(i_7),
    .bcntres(i_8),
    .trigcnt_clr(i_9),
    .reset(i_10),
    .l1out(out_dut[262:262]),
    .rdocmd(out_dut[261:261]),
    .abortcmd(out_dut[260:260]),
    .l0_cnt(out_dut[259:228]),
    .l1_cnt(out_dut[227:196]),
    .l2a_cnt(out_dut[195:164]),
    .l2r_cnt(out_dut[163:132]),
    .l1out_cnt(out_dut[131:100]),
    .rdocmd_cnt(out_dut[99:68]),
    .abortcmd_cnt(out_dut[67:36]),
    .bunch_cnt(out_dut[35:24]),
    .event_cnt(out_dut[23:0])
  );
  autovcoder_122921__ref ref_i (
    .gclk_40m(clk),
    .l0(i_0),
    .l1(i_1),
    .l2a(i_2),
    .l2r(i_3),
    .l1out_c(i_4),
    .rdocmd_c(i_5),
    .abortcmd_c(i_6),
    .evcntres(i_7),
    .bcntres(i_8),
    .trigcnt_clr(i_9),
    .reset(i_10),
    .l1out(out_ref[262:262]),
    .rdocmd(out_ref[261:261]),
    .abortcmd(out_ref[260:260]),
    .l0_cnt(out_ref[259:228]),
    .l1_cnt(out_ref[227:196]),
    .l2a_cnt(out_ref[195:164]),
    .l2r_cnt(out_ref[163:132]),
    .l1out_cnt(out_ref[131:100]),
    .rdocmd_cnt(out_ref[99:68]),
    .abortcmd_cnt(out_ref[67:36]),
    .bunch_cnt(out_ref[35:24]),
    .event_cnt(out_ref[23:0])
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
    seed = 973235203;
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
      i_10 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
