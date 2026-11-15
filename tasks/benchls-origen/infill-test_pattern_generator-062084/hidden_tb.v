// Hidden tests: 5000 cycles of seeded random inputs (seed 2896405046); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 25;
  reg clk;
  reg [23:0] i_0;
  reg [23:0] i_1;
  reg [23:0] i_2;
  reg [1:0] i_3;
  reg [2:0] i_4;
  reg [3:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_062084 dut (
    .clk_sys(clk),
    .cfg_tp_base(i_0),
    .cfg_tp_step(i_1),
    .cfg_ad_fix(i_2),
    .cfg_ad_tp(i_3),
    .cfg_sample(i_4),
    .mod_id(i_5),
    .syn_vld(i_6),
    .rst_n(i_7),
    .tp_data(out_dut[24:1]),
    .tp_vld(out_dut[0:0])
  );
  origen_062084__ref ref_i (
    .clk_sys(clk),
    .cfg_tp_base(i_0),
    .cfg_tp_step(i_1),
    .cfg_ad_fix(i_2),
    .cfg_ad_tp(i_3),
    .cfg_sample(i_4),
    .mod_id(i_5),
    .syn_vld(i_6),
    .rst_n(i_7),
    .tp_data(out_ref[24:1]),
    .tp_vld(out_ref[0:0])
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
    seed = 2896405046;
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
      i_7 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
