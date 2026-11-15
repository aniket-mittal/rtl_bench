// Hidden tests: 5000 cycles of seeded random inputs (seed 3368262875); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 68;
  reg clk;
  reg [0:0] i_0;
  reg [1:0] i_1;
  reg [12:0] i_2;
  reg [12:0] i_3;
  reg [12:0] i_4;
  reg [12:0] i_5;
  reg [12:0] i_6;
  reg [12:0] i_7;
  reg [0:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_01498 dut (
    .clk(clk),
    .bunch_strb(i_0),
    .sel(i_1),
    .ai_in(i_2),
    .aq_in(i_3),
    .bi_in(i_4),
    .bq_in(i_5),
    .ci_in(i_6),
    .cq_in(i_7),
    .dac_cond(i_8),
    .bpm1_q_reg_int_a(out_dut[67:51]),
    .bpm1_i_reg_int_a(out_dut[50:34]),
    .bpm2_q_reg_int_a(out_dut[33:17]),
    .bpm2_i_reg_int_a(out_dut[16:0])
  );
  mg_01498__ref ref_i (
    .clk(clk),
    .bunch_strb(i_0),
    .sel(i_1),
    .ai_in(i_2),
    .aq_in(i_3),
    .bi_in(i_4),
    .bq_in(i_5),
    .ci_in(i_6),
    .cq_in(i_7),
    .dac_cond(i_8),
    .bpm1_q_reg_int_a(out_ref[67:51]),
    .bpm1_i_reg_int_a(out_ref[50:34]),
    .bpm2_q_reg_int_a(out_ref[33:17]),
    .bpm2_i_reg_int_a(out_ref[16:0])
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
    seed = 3368262875;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
