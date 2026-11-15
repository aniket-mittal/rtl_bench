// Hidden tests: 5000 cycles of seeded random inputs (seed 9504216); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 106;
  reg clk;
  reg [31:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [3:0] i_5;
  reg [3:0] i_6;
  reg [3:0] i_7;
  reg [3:0] i_8;
  reg [1:0] i_9;
  reg [8:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_09812 dut (
    .clk(clk),
    .d(i_0),
    .wr(i_1),
    .wrfl(i_2),
    .wrhi(i_3),
    .rst(i_4),
    .addr_a(i_5),
    .addr_b(i_6),
    .addr_c(i_7),
    .addr_d(i_8),
    .addr_s(i_9),
    .iflags(i_10),
    .word_op(i_11),
    .a_byte(i_12),
    .b_byte(i_13),
    .c_byte(i_14),
    .wr_ip0(i_15),
    .a(out_dut[105:90]),
    .b(out_dut[89:74]),
    .c(out_dut[73:58]),
    .cs(out_dut[57:42]),
    .ip(out_dut[41:26]),
    .s(out_dut[25:10]),
    .flags(out_dut[9:1]),
    .cx_zero(out_dut[0:0])
  );
  mg_09812__ref ref_i (
    .clk(clk),
    .d(i_0),
    .wr(i_1),
    .wrfl(i_2),
    .wrhi(i_3),
    .rst(i_4),
    .addr_a(i_5),
    .addr_b(i_6),
    .addr_c(i_7),
    .addr_d(i_8),
    .addr_s(i_9),
    .iflags(i_10),
    .word_op(i_11),
    .a_byte(i_12),
    .b_byte(i_13),
    .c_byte(i_14),
    .wr_ip0(i_15),
    .a(out_ref[105:90]),
    .b(out_ref[89:74]),
    .c(out_ref[73:58]),
    .cs(out_ref[57:42]),
    .ip(out_ref[41:26]),
    .s(out_ref[25:10]),
    .flags(out_ref[9:1]),
    .cx_zero(out_ref[0:0])
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
    seed = 9504216;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
