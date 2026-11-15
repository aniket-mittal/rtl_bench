// Hidden tests: 5000 cycles of seeded random inputs (seed 1848761881); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 39;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [31:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [31:0] i_9;
  reg [0:0] i_10;
  reg [2:0] i_11;
  reg [5:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_06275 dut (
    .clk(clk),
    .reset(i_0),
    .sw_reset(i_1),
    .sw_stop(i_2),
    .length(i_3),
    .eop_enabled(i_4),
    .eop(i_5),
    .ready(i_6),
    .valid(i_7),
    .early_termination(i_8),
    .address_in(i_9),
    .write_in(i_10),
    .max_burst_count(i_11),
    .write_fifo_used(i_12),
    .waitrequest(i_13),
    .short_first_access_enable(i_14),
    .short_last_access_enable(i_15),
    .short_first_and_last_access_enable(i_16),
    .address_out(out_dut[38:7]),
    .write_out(out_dut[6:6]),
    .burst_count(out_dut[5:3]),
    .stall(out_dut[2:2]),
    .reset_taken(out_dut[1:1]),
    .stopped(out_dut[0:0])
  );
  rtlpp_06275__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .sw_reset(i_1),
    .sw_stop(i_2),
    .length(i_3),
    .eop_enabled(i_4),
    .eop(i_5),
    .ready(i_6),
    .valid(i_7),
    .early_termination(i_8),
    .address_in(i_9),
    .write_in(i_10),
    .max_burst_count(i_11),
    .write_fifo_used(i_12),
    .waitrequest(i_13),
    .short_first_access_enable(i_14),
    .short_last_access_enable(i_15),
    .short_first_and_last_access_enable(i_16),
    .address_out(out_ref[38:7]),
    .write_out(out_ref[6:6]),
    .burst_count(out_ref[5:3]),
    .stall(out_ref[2:2]),
    .reset_taken(out_ref[1:1]),
    .stopped(out_ref[0:0])
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
    seed = 1848761881;
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
