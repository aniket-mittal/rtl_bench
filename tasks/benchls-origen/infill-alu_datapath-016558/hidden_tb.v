// Hidden tests: 5000 cycles of seeded random inputs (seed 3097582731); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 160;
  reg clk;
  reg [0:0] i_0;
  reg [15:0] i_1;
  reg [15:0] i_2;
  reg [15:0] i_3;
  reg [15:0] i_4;
  reg [15:0] i_5;
  reg [11:0] i_6;
  reg [11:0] i_7;
  reg [3:0] i_8;
  reg [0:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_016558 dut (
    .clk(clk),
    .reset(i_0),
    .shift_in(i_1),
    .comp_a(i_2),
    .comp_b(i_3),
    .x(i_4),
    .y(i_5),
    .val(i_6),
    .val2(i_7),
    .to_negate(i_8),
    .invert(i_9),
    .signed_shift_out(out_dut[159:144]),
    .unsigned_shift_out(out_dut[143:128]),
    .signed_comp_out(out_dut[127:127]),
    .unsigned_comp_out(out_dut[126:126]),
    .logical_left_shift(out_dut[125:110]),
    .arithmetic_left_shift(out_dut[109:94]),
    .logical_right_shift(out_dut[93:78]),
    .arithmetic_right_shift(out_dut[77:62]),
    .sum_signed(out_dut[61:45]),
    .sum_unsigned(out_dut[44:28]),
    .abs_val(out_dut[27:16]),
    .abs_val2(out_dut[15:4]),
    .negated_out(out_dut[3:0])
  );
  origen_016558__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .shift_in(i_1),
    .comp_a(i_2),
    .comp_b(i_3),
    .x(i_4),
    .y(i_5),
    .val(i_6),
    .val2(i_7),
    .to_negate(i_8),
    .invert(i_9),
    .signed_shift_out(out_ref[159:144]),
    .unsigned_shift_out(out_ref[143:128]),
    .signed_comp_out(out_ref[127:127]),
    .unsigned_comp_out(out_ref[126:126]),
    .logical_left_shift(out_ref[125:110]),
    .arithmetic_left_shift(out_ref[109:94]),
    .logical_right_shift(out_ref[93:78]),
    .arithmetic_right_shift(out_ref[77:62]),
    .sum_signed(out_ref[61:45]),
    .sum_unsigned(out_ref[44:28]),
    .abs_val(out_ref[27:16]),
    .abs_val2(out_ref[15:4]),
    .negated_out(out_ref[3:0])
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
    seed = 3097582731;
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
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
