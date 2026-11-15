// Hidden tests: 5000 cycles of seeded random inputs (seed 3812063613); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 30;
  reg clk;
  reg [0:0] i_0;
  reg [7:0] i_1;
  reg [7:0] i_2;
  reg [7:0] i_3;
  reg [5:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_02577 dut (
    .clk(clk),
    .rst_n(i_0),
    .hours(i_1),
    .minutes(i_2),
    .seconds(i_3),
    .sel_in(i_4),
    .hour(out_dut[29:22]),
    .minute(out_dut[21:14]),
    .second(out_dut[13:6]),
    .sel_out(out_dut[5:0])
  );
  rtlpp_02577__ref ref_i (
    .clk(clk),
    .rst_n(i_0),
    .hours(i_1),
    .minutes(i_2),
    .seconds(i_3),
    .sel_in(i_4),
    .hour(out_ref[29:22]),
    .minute(out_ref[21:14]),
    .second(out_ref[13:6]),
    .sel_out(out_ref[5:0])
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
    seed = 3812063613;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
