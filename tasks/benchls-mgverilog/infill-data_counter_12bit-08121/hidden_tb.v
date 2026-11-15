// Hidden tests: 5000 cycles of seeded random inputs (seed 4116972806); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 96;
  reg clk;
  reg [0:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_08121 dut (
    .clk(clk),
    .reset_n(i_0),
    .Data_A(out_dut[95:84]),
    .Data_B(out_dut[83:72]),
    .Data_C(out_dut[71:60]),
    .Data_D(out_dut[59:48]),
    .Data_E(out_dut[47:36]),
    .Data_F(out_dut[35:24]),
    .Data_G(out_dut[23:12]),
    .Data_H(out_dut[11:0])
  );
  mg_08121__ref ref_i (
    .clk(clk),
    .reset_n(i_0),
    .Data_A(out_ref[95:84]),
    .Data_B(out_ref[83:72]),
    .Data_C(out_ref[71:60]),
    .Data_D(out_ref[59:48]),
    .Data_E(out_ref[47:36]),
    .Data_F(out_ref[35:24]),
    .Data_G(out_ref[23:12]),
    .Data_H(out_ref[11:0])
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
    seed = 4116972806;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
