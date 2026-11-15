// Hidden tests: 5000 cycles of seeded random inputs (seed 2268886516); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 97;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [11:0] i_4;
  reg [8:0] i_5;
  reg [4:0] i_6;
  reg [4:0] i_7;
  reg [4:0] i_8;
  reg [1:0] i_9;
  reg [4:0] i_10;
  reg [4:0] i_11;
  reg [4:0] i_12;
  reg [4:0] i_13;
  reg [4:0] i_14;
  reg [4:0] i_15;
  reg [15:0] i_16;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_057103 dut (
    .clk(clk),
    .resetn(i_0),
    .data_valid(i_1),
    .start_frame(i_2),
    .end_frame(i_3),
    .x(i_4),
    .y(i_5),
    .r(i_6),
    .g(i_7),
    .b(i_8),
    .color(i_9),
    .r_min(i_10),
    .r_max(i_11),
    .g_min(i_12),
    .g_max(i_13),
    .b_min(i_14),
    .b_max(i_15),
    .min_total(i_16),
    .x_led_acc(out_dut[96:65]),
    .y_led_acc(out_dut[64:33]),
    .total_acc(out_dut[32:1]),
    .divby0(out_dut[0:0])
  );
  origen_057103__ref ref_i (
    .clk(clk),
    .resetn(i_0),
    .data_valid(i_1),
    .start_frame(i_2),
    .end_frame(i_3),
    .x(i_4),
    .y(i_5),
    .r(i_6),
    .g(i_7),
    .b(i_8),
    .color(i_9),
    .r_min(i_10),
    .r_max(i_11),
    .g_min(i_12),
    .g_max(i_13),
    .b_min(i_14),
    .b_max(i_15),
    .min_total(i_16),
    .x_led_acc(out_ref[96:65]),
    .y_led_acc(out_ref[64:33]),
    .total_acc(out_ref[32:1]),
    .divby0(out_ref[0:0])
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
    seed = 2268886516;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
