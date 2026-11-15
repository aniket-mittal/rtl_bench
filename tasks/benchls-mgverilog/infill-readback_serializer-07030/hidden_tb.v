// Hidden tests: 5000 cycles of seeded random inputs (seed 3667142024); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 9;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [6:0] i_3;
  reg [6:0] i_4;
  reg [6:0] i_5;
  reg [6:0] i_6;
  reg [6:0] i_7;
  reg [6:0] i_8;
  reg [6:0] i_9;
  reg [6:0] i_10;
  reg [6:0] i_11;
  reg [6:0] i_12;
  reg [6:0] i_13;
  reg [6:0] i_14;
  reg [6:0] i_15;
  reg [6:0] i_16;
  reg [6:0] i_17;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_07030 dut (
    .clk(clk),
    .rst(i_0),
    .tx_en(i_1),
    .tx_data_loaded(i_2),
    .rb0(i_3),
    .rb1(i_4),
    .rb2(i_5),
    .rb3(i_6),
    .rb4(i_7),
    .rb5(i_8),
    .rb6(i_9),
    .rb7(i_10),
    .rb8(i_11),
    .rb9(i_12),
    .rb10(i_13),
    .rb11(i_14),
    .rb12(i_15),
    .rb13(i_16),
    .rb14(i_17),
    .tx_data_ready(out_dut[8:8]),
    .tx_data(out_dut[7:1]),
    .tx_complete(out_dut[0:0])
  );
  mg_07030__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .tx_en(i_1),
    .tx_data_loaded(i_2),
    .rb0(i_3),
    .rb1(i_4),
    .rb2(i_5),
    .rb3(i_6),
    .rb4(i_7),
    .rb5(i_8),
    .rb6(i_9),
    .rb7(i_10),
    .rb8(i_11),
    .rb9(i_12),
    .rb10(i_13),
    .rb11(i_14),
    .rb12(i_15),
    .rb13(i_16),
    .rb14(i_17),
    .tx_data_ready(out_ref[8:8]),
    .tx_data(out_ref[7:1]),
    .tx_complete(out_ref[0:0])
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
    seed = 3667142024;
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
      i_17 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
