// Hidden tests: 5000 cycles of seeded random inputs (seed 3591532229); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 34;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [2:0] i_2;
  reg [2:0] i_3;
  reg [2:0] i_4;
  reg [3:0] i_5;
  reg [3:0] i_6;
  reg [31:0] i_7;
  reg [63:0] i_8;
  reg [0:0] i_9;
  reg [7:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_018975 dut (
    .clock(clk),
    .reset(i_0),
    .io_in_valid(i_1),
    .io_in_bits_chanId(i_2),
    .io_in_bits_opcode(i_3),
    .io_in_bits_param(i_4),
    .io_in_bits_size(i_5),
    .io_in_bits_source(i_6),
    .io_in_bits_address(i_7),
    .io_in_bits_data(i_8),
    .io_in_bits_corrupt(i_9),
    .io_in_bits_union(i_10),
    .io_in_bits_last(i_11),
    .io_out_ready(i_12),
    .io_in_ready(out_dut[33:33]),
    .io_out_valid(out_dut[32:32]),
    .io_out_bits(out_dut[31:0])
  );
  autovcoder_018975__ref ref_i (
    .clock(clk),
    .reset(i_0),
    .io_in_valid(i_1),
    .io_in_bits_chanId(i_2),
    .io_in_bits_opcode(i_3),
    .io_in_bits_param(i_4),
    .io_in_bits_size(i_5),
    .io_in_bits_source(i_6),
    .io_in_bits_address(i_7),
    .io_in_bits_data(i_8),
    .io_in_bits_corrupt(i_9),
    .io_in_bits_union(i_10),
    .io_in_bits_last(i_11),
    .io_out_ready(i_12),
    .io_in_ready(out_ref[33:33]),
    .io_out_valid(out_ref[32:32]),
    .io_out_bits(out_ref[31:0])
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
    seed = 3591532229;
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
      i_8 = {$random(seed), $random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
