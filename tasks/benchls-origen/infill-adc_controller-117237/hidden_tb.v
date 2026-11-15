// Hidden tests: 5000 cycles of seeded random inputs (seed 4037927996); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 16;
  reg clk;
  reg [1:0] i_0;
  reg [7:0] i_1;
  reg [2:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [3:0] i_7;
  reg [3:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_117237 dut (
    .adcclk(clk),
    .clkdiv(i_0),
    .adc_anain(i_1),
    .adc_anamux_sel(i_2),
    .adc_en(i_3),
    .reset(i_4),
    .adc_start(i_5),
    .adc_dfx_en(i_6),
    .adc_anaviewsel(i_7),
    .i_adc_spare(i_8),
    .adcout(out_dut[15:6]),
    .adcdone(out_dut[5:5]),
    .adc_anaviewout(out_dut[4:4]),
    .o_adc_spare(out_dut[3:0])
  );
  origen_117237__ref ref_i (
    .adcclk(clk),
    .clkdiv(i_0),
    .adc_anain(i_1),
    .adc_anamux_sel(i_2),
    .adc_en(i_3),
    .reset(i_4),
    .adc_start(i_5),
    .adc_dfx_en(i_6),
    .adc_anaviewsel(i_7),
    .i_adc_spare(i_8),
    .adcout(out_ref[15:6]),
    .adcdone(out_ref[5:5]),
    .adc_anaviewout(out_ref[4:4]),
    .o_adc_spare(out_ref[3:0])
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
    seed = 4037927996;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
