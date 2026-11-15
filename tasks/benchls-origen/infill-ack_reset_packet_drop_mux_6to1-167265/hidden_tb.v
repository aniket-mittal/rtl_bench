// Hidden tests: 5000 cycles of seeded random inputs (seed 3583033195); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 2;
  reg clk;
  reg [2:0] i_0;
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
  reg [0:0] i_11;
  reg [0:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_167265 dut (
    .sel(i_0),
    .out_ack_reset_0(i_1),
    .out_ack_reset_1(i_2),
    .out_ack_reset_2(i_3),
    .out_ack_reset_3(i_4),
    .out_ack_reset_4(i_5),
    .out_ack_reset_5(i_6),
    .packet_drop_signal_0(i_7),
    .packet_drop_signal_1(i_8),
    .packet_drop_signal_2(i_9),
    .packet_drop_signal_3(i_10),
    .packet_drop_signal_4(i_11),
    .packet_drop_signal_5(i_12),
    .out_ack_reset_out(out_dut[1:1]),
    .packet_drop_signal_out(out_dut[0:0])
  );
  origen_167265__ref ref_i (
    .sel(i_0),
    .out_ack_reset_0(i_1),
    .out_ack_reset_1(i_2),
    .out_ack_reset_2(i_3),
    .out_ack_reset_3(i_4),
    .out_ack_reset_4(i_5),
    .out_ack_reset_5(i_6),
    .packet_drop_signal_0(i_7),
    .packet_drop_signal_1(i_8),
    .packet_drop_signal_2(i_9),
    .packet_drop_signal_3(i_10),
    .packet_drop_signal_4(i_11),
    .packet_drop_signal_5(i_12),
    .out_ack_reset_out(out_ref[1:1]),
    .packet_drop_signal_out(out_ref[0:0])
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
    seed = 3583033195;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
