// Hidden tests: 5000 cycles of seeded random inputs (seed 3816909762); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 15;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_002967 dut (
    .clk(clk),
    .rstn(i_0),
    .ad7276_sdata(i_1),
    .ad7276_csn(out_dut[14:14]),
    .ad7276_sclk(out_dut[13:13]),
    .adc_data_en(out_dut[12:12]),
    .adc_data(out_dut[11:0])
  );
  autovcoder_002967__ref ref_i (
    .clk(clk),
    .rstn(i_0),
    .ad7276_sdata(i_1),
    .ad7276_csn(out_ref[14:14]),
    .ad7276_sclk(out_ref[13:13]),
    .adc_data_en(out_ref[12:12]),
    .adc_data(out_ref[11:0])
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
    seed = 3816909762;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
