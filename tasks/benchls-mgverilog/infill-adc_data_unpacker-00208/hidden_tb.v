// Hidden tests: 5000 cycles of seeded random inputs (seed 3744162848); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 116;
  reg clk;
  reg [127:0] i_0;
  reg [0:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_00208 dut (
    .rx_clk(clk),
    .rx_data(i_0),
    .adc_rst(i_1),
    .adc_clk(out_dut[115:115]),
    .adc_data_a(out_dut[114:59]),
    .adc_data_b(out_dut[58:3]),
    .adc_or_a(out_dut[2:2]),
    .adc_or_b(out_dut[1:1]),
    .adc_status(out_dut[0:0])
  );
  mg_00208__ref ref_i (
    .rx_clk(clk),
    .rx_data(i_0),
    .adc_rst(i_1),
    .adc_clk(out_ref[115:115]),
    .adc_data_a(out_ref[114:59]),
    .adc_data_b(out_ref[58:3]),
    .adc_or_a(out_ref[2:2]),
    .adc_or_b(out_ref[1:1]),
    .adc_status(out_ref[0:0])
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
    seed = 3744162848;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed), $random(seed), $random(seed), $random(seed)};
      i_1 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
