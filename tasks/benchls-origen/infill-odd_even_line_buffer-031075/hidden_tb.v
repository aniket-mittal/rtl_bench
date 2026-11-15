// Hidden tests: 5000 cycles of seeded random inputs (seed 161001022); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 65;
  reg clk;
  reg [0:0] i_0;
  reg [15:0] i_1;
  reg [15:0] i_2;
  reg [7:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_031075 dut (
    .clk(clk),
    .rst_n(i_0),
    .data_in_odd(i_1),
    .data_in_even(i_2),
    .line_address(i_3),
    .data_valid(i_4),
    .data_loading(i_5),
    .data_out_odd(out_dut[64:49]),
    .data_out_even(out_dut[48:33]),
    .output_valid(out_dut[32:32]),
    .odd_address(out_dut[31:16]),
    .even_address(out_dut[15:0])
  );
  origen_031075__ref ref_i (
    .clk(clk),
    .rst_n(i_0),
    .data_in_odd(i_1),
    .data_in_even(i_2),
    .line_address(i_3),
    .data_valid(i_4),
    .data_loading(i_5),
    .data_out_odd(out_ref[64:49]),
    .data_out_even(out_ref[48:33]),
    .output_valid(out_ref[32:32]),
    .odd_address(out_ref[31:16]),
    .even_address(out_ref[15:0])
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
    seed = 161001022;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
