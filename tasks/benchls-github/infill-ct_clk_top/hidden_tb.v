// Hidden tests: 5000 cycles of seeded random inputs (seed 4122912963); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 2;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  ct_clk_top dut (
    .biu_xx_dbg_wakeup(i_0),
    .biu_xx_int_wakeup(i_1),
    .biu_xx_normal_work(i_2),
    .biu_xx_pmp_sel(i_3),
    .biu_xx_snoop_vld(i_4),
    .cp0_xx_core_icg_en(i_5),
    .had_xx_clk_en(i_6),
    .pll_core_clk(i_7),
    .coreclk(out_dut[1:1]),
    .forever_coreclk(out_dut[0:0])
  );
  ct_clk_top__ref ref_i (
    .biu_xx_dbg_wakeup(i_0),
    .biu_xx_int_wakeup(i_1),
    .biu_xx_normal_work(i_2),
    .biu_xx_pmp_sel(i_3),
    .biu_xx_snoop_vld(i_4),
    .cp0_xx_core_icg_en(i_5),
    .had_xx_clk_en(i_6),
    .pll_core_clk(i_7),
    .coreclk(out_ref[1:1]),
    .forever_coreclk(out_ref[0:0])
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
    seed = 4122912963;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
