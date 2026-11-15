// Hidden tests: 5000 cycles of seeded random inputs (seed 449674226); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 32;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [23:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [1:0] i_6;
  reg [0:0] i_7;
  reg [23:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [1:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_04115 dut (
    .clk(clk),
    .reset(i_0),
    .sync_data(i_1),
    .sync_valid(i_2),
    .stream_in_data_0(i_3),
    .stream_in_startofpacket_0(i_4),
    .stream_in_endofpacket_0(i_5),
    .stream_in_empty_0(i_6),
    .stream_in_valid_0(i_7),
    .stream_in_data_1(i_8),
    .stream_in_startofpacket_1(i_9),
    .stream_in_endofpacket_1(i_10),
    .stream_in_empty_1(i_11),
    .stream_in_valid_1(i_12),
    .stream_out_ready(i_13),
    .sync_ready(out_dut[31:31]),
    .stream_in_ready_0(out_dut[30:30]),
    .stream_in_ready_1(out_dut[29:29]),
    .stream_out_data(out_dut[28:5]),
    .stream_out_startofpacket(out_dut[4:4]),
    .stream_out_endofpacket(out_dut[3:3]),
    .stream_out_empty(out_dut[2:1]),
    .stream_out_valid(out_dut[0:0])
  );
  mg_04115__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .sync_data(i_1),
    .sync_valid(i_2),
    .stream_in_data_0(i_3),
    .stream_in_startofpacket_0(i_4),
    .stream_in_endofpacket_0(i_5),
    .stream_in_empty_0(i_6),
    .stream_in_valid_0(i_7),
    .stream_in_data_1(i_8),
    .stream_in_startofpacket_1(i_9),
    .stream_in_endofpacket_1(i_10),
    .stream_in_empty_1(i_11),
    .stream_in_valid_1(i_12),
    .stream_out_ready(i_13),
    .sync_ready(out_ref[31:31]),
    .stream_in_ready_0(out_ref[30:30]),
    .stream_in_ready_1(out_ref[29:29]),
    .stream_out_data(out_ref[28:5]),
    .stream_out_startofpacket(out_ref[4:4]),
    .stream_out_endofpacket(out_ref[3:3]),
    .stream_out_empty(out_ref[2:1]),
    .stream_out_valid(out_ref[0:0])
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
    seed = 449674226;
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
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
