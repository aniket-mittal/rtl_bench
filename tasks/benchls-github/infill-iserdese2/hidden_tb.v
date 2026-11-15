// Hidden tests: 5000 cycles of seeded random inputs (seed 166746403); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 11;
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
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  ISERDESE2 dut (
    .CLK(clk),
    .BITSLIP(i_0),
    .CE1(i_1),
    .CE2(i_2),
    .CLKB(i_3),
    .CLKDIV(i_4),
    .CLKDIVP(i_5),
    .D(i_6),
    .DDLY(i_7),
    .DYNCLKDIVSEL(i_8),
    .DYNCLKSEL(i_9),
    .OCLK(i_10),
    .OCLKB(i_11),
    .OFB(i_12),
    .RST(i_13),
    .SHIFTIN1(i_14),
    .SHIFTIN2(i_15),
    .O(out_dut[10:10]),
    .Q1(out_dut[9:9]),
    .Q2(out_dut[8:8]),
    .Q3(out_dut[7:7]),
    .Q4(out_dut[6:6]),
    .Q5(out_dut[5:5]),
    .Q6(out_dut[4:4]),
    .Q7(out_dut[3:3]),
    .Q8(out_dut[2:2]),
    .SHIFTOUT1(out_dut[1:1]),
    .SHIFTOUT2(out_dut[0:0])
  );
  ISERDESE2__ref ref_i (
    .CLK(clk),
    .BITSLIP(i_0),
    .CE1(i_1),
    .CE2(i_2),
    .CLKB(i_3),
    .CLKDIV(i_4),
    .CLKDIVP(i_5),
    .D(i_6),
    .DDLY(i_7),
    .DYNCLKDIVSEL(i_8),
    .DYNCLKSEL(i_9),
    .OCLK(i_10),
    .OCLKB(i_11),
    .OFB(i_12),
    .RST(i_13),
    .SHIFTIN1(i_14),
    .SHIFTIN2(i_15),
    .O(out_ref[10:10]),
    .Q1(out_ref[9:9]),
    .Q2(out_ref[8:8]),
    .Q3(out_ref[7:7]),
    .Q4(out_ref[6:6]),
    .Q5(out_ref[5:5]),
    .Q6(out_ref[4:4]),
    .Q7(out_ref[3:3]),
    .Q8(out_ref[2:2]),
    .SHIFTOUT1(out_ref[1:1]),
    .SHIFTOUT2(out_ref[0:0])
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
    seed = 166746403;
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
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
