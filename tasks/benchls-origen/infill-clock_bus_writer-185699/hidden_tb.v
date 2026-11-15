// Hidden tests: 5000 cycles of seeded random inputs (seed 3107679648); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 13;
  reg clk;
  reg [5:0] i_0;
  reg [7:0] i_1;
  reg [7:0] i_2;
  reg [7:0] i_3;
  reg [7:0] i_4;
  reg [7:0] i_5;
  reg [7:0] i_6;
  reg [0:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_185699 dut (
    .en(clk),
    .addr(i_0),
    .s(i_1),
    .m(i_2),
    .h(i_3),
    .d(i_4),
    .me(i_5),
    .a(i_6),
    .rst(i_7),
    .AD(out_dut[12:12]),
    .CS(out_dut[11:11]),
    .RD(out_dut[10:10]),
    .WR(out_dut[9:9]),
    .Listo_inicio(out_dut[8:8]),
    .Dato(out_dut[7:0])
  );
  origen_185699__ref ref_i (
    .en(clk),
    .addr(i_0),
    .s(i_1),
    .m(i_2),
    .h(i_3),
    .d(i_4),
    .me(i_5),
    .a(i_6),
    .rst(i_7),
    .AD(out_ref[12:12]),
    .CS(out_ref[11:11]),
    .RD(out_ref[10:10]),
    .WR(out_ref[9:9]),
    .Listo_inicio(out_ref[8:8]),
    .Dato(out_ref[7:0])
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
    seed = 3107679648;
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
      i_7 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
