// Hidden tests: 5000 cycles of seeded random inputs (seed 3792632544); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 6;
  reg clk;
  reg [7:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [7:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_01952 dut (
    .clk(clk),
    .dip(i_0),
    .reset_b(i_1),
    .adr15(i_2),
    .adr14(i_3),
    .adr13(i_4),
    .ioreq_b(i_5),
    .mreq_b(i_6),
    .romen_b(i_7),
    .wr_b(i_8),
    .rd_b(i_9),
    .data(i_10),
    .busrq_b(i_11),
    .busack_b(i_12),
    .romdis(out_dut[5:5]),
    .rom01cs_b(out_dut[4:4]),
    .rom23cs_b(out_dut[3:3]),
    .rom45cs_b(out_dut[2:2]),
    .romoe_b(out_dut[1:1]),
    .roma14(out_dut[0:0])
  );
  rtlpp_01952__ref ref_i (
    .clk(clk),
    .dip(i_0),
    .reset_b(i_1),
    .adr15(i_2),
    .adr14(i_3),
    .adr13(i_4),
    .ioreq_b(i_5),
    .mreq_b(i_6),
    .romen_b(i_7),
    .wr_b(i_8),
    .rd_b(i_9),
    .data(i_10),
    .busrq_b(i_11),
    .busack_b(i_12),
    .romdis(out_ref[5:5]),
    .rom01cs_b(out_ref[4:4]),
    .rom23cs_b(out_ref[3:3]),
    .rom45cs_b(out_ref[2:2]),
    .romoe_b(out_ref[1:1]),
    .roma14(out_ref[0:0])
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
    seed = 3792632544;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
