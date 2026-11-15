// Hidden tests: 5000 cycles of seeded random inputs (seed 1409169780); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 8;
  reg clk;
  reg [0:0] i_0;
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
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_06563 dut (
    .CLK(clk),
    .RST_N(i_0),
    .write_0(i_1),
    .EN_write_0(i_2),
    .write_1(i_3),
    .EN_write_1(i_4),
    .write_2(i_5),
    .EN_write_2(i_6),
    .write_3(i_7),
    .EN_write_3(i_8),
    .write_4(i_9),
    .EN_write_4(i_10),
    .write_5(i_11),
    .EN_write_5(i_12),
    .write_6(i_13),
    .EN_write_6(i_14),
    .write_7(i_15),
    .EN_write_7(i_16),
    .read_0(out_dut[7:7]),
    .read_1(out_dut[6:6]),
    .read_2(out_dut[5:5]),
    .read_3(out_dut[4:4]),
    .read_4(out_dut[3:3]),
    .read_5(out_dut[2:2]),
    .read_6(out_dut[1:1]),
    .read_7(out_dut[0:0])
  );
  rtlpp_06563__ref ref_i (
    .CLK(clk),
    .RST_N(i_0),
    .write_0(i_1),
    .EN_write_0(i_2),
    .write_1(i_3),
    .EN_write_1(i_4),
    .write_2(i_5),
    .EN_write_2(i_6),
    .write_3(i_7),
    .EN_write_3(i_8),
    .write_4(i_9),
    .EN_write_4(i_10),
    .write_5(i_11),
    .EN_write_5(i_12),
    .write_6(i_13),
    .EN_write_6(i_14),
    .write_7(i_15),
    .EN_write_7(i_16),
    .read_0(out_ref[7:7]),
    .read_1(out_ref[6:6]),
    .read_2(out_ref[5:5]),
    .read_3(out_ref[4:4]),
    .read_4(out_ref[3:3]),
    .read_5(out_ref[2:2]),
    .read_6(out_ref[1:1]),
    .read_7(out_ref[0:0])
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
    seed = 1409169780;
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
