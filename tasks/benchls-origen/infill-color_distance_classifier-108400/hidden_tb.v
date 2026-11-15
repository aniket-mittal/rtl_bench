// Hidden tests: 5000 cycles of seeded random inputs (seed 1083583551); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 28;
  reg clk;
  reg [0:0] i_0;
  reg [7:0] i_1;
  reg [7:0] i_2;
  reg [7:0] i_3;
  reg [10:0] i_4;
  reg [10:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_108400 dut (
    .clk(clk),
    .reset_n(i_0),
    .r(i_1),
    .g(i_2),
    .b(i_3),
    .x_in(i_4),
    .y_in(i_5),
    .is_red(out_dut[27:27]),
    .is_yellow(out_dut[26:26]),
    .is_green(out_dut[25:25]),
    .is_blue(out_dut[24:24]),
    .is_pink(out_dut[23:23]),
    .is_unknown(out_dut[22:22]),
    .x_out(out_dut[21:11]),
    .y_out(out_dut[10:0])
  );
  origen_108400__ref ref_i (
    .clk(clk),
    .reset_n(i_0),
    .r(i_1),
    .g(i_2),
    .b(i_3),
    .x_in(i_4),
    .y_in(i_5),
    .is_red(out_ref[27:27]),
    .is_yellow(out_ref[26:26]),
    .is_green(out_ref[25:25]),
    .is_blue(out_ref[24:24]),
    .is_pink(out_ref[23:23]),
    .is_unknown(out_ref[22:22]),
    .x_out(out_ref[21:11]),
    .y_out(out_ref[10:0])
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
    seed = 1083583551;
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
