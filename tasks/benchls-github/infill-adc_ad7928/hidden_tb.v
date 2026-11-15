// Hidden tests: 5000 cycles of seeded random inputs (seed 2720760309); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 100;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  adc_ad7928 dut (
    .clk(clk),
    .rstn(i_0),
    .spi_miso(i_1),
    .i_sn_adc(i_2),
    .spi_ss(out_dut[99:99]),
    .spi_sck(out_dut[98:98]),
    .spi_mosi(out_dut[97:97]),
    .o_en_adc(out_dut[96:96]),
    .o_adc_value0(out_dut[95:84]),
    .o_adc_value1(out_dut[83:72]),
    .o_adc_value2(out_dut[71:60]),
    .o_adc_value3(out_dut[59:48]),
    .o_adc_value4(out_dut[47:36]),
    .o_adc_value5(out_dut[35:24]),
    .o_adc_value6(out_dut[23:12]),
    .o_adc_value7(out_dut[11:0])
  );
  adc_ad7928__ref ref_i (
    .clk(clk),
    .rstn(i_0),
    .spi_miso(i_1),
    .i_sn_adc(i_2),
    .spi_ss(out_ref[99:99]),
    .spi_sck(out_ref[98:98]),
    .spi_mosi(out_ref[97:97]),
    .o_en_adc(out_ref[96:96]),
    .o_adc_value0(out_ref[95:84]),
    .o_adc_value1(out_ref[83:72]),
    .o_adc_value2(out_ref[71:60]),
    .o_adc_value3(out_ref[59:48]),
    .o_adc_value4(out_ref[47:36]),
    .o_adc_value5(out_ref[35:24]),
    .o_adc_value6(out_ref[23:12]),
    .o_adc_value7(out_ref[11:0])
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
    seed = 2720760309;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
