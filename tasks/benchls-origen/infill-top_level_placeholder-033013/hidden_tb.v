// Hidden tests: 5000 cycles of seeded random inputs (seed 472634430); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 16;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_033013 dut (
    .clk(clk),
    .RST_n(i_0),
    .Flt_n(i_1),
    .next_n(i_2),
    .prev_n(i_3),
    .ADC_MISO(i_4),
    .I2S_data(i_5),
    .I2S_ws(i_6),
    .I2S_sclk(i_7),
    .RX(i_8),
    .LED(out_dut[15:8]),
    .ADC_SS_n(out_dut[7:7]),
    .ADC_MOSI(out_dut[6:6]),
    .ADC_SCLK(out_dut[5:5]),
    .lft_PDM(out_dut[4:4]),
    .rght_PDM(out_dut[3:3]),
    .cmd_n(out_dut[2:2]),
    .sht_dwn(out_dut[1:1]),
    .TX(out_dut[0:0])
  );
  origen_033013__ref ref_i (
    .clk(clk),
    .RST_n(i_0),
    .Flt_n(i_1),
    .next_n(i_2),
    .prev_n(i_3),
    .ADC_MISO(i_4),
    .I2S_data(i_5),
    .I2S_ws(i_6),
    .I2S_sclk(i_7),
    .RX(i_8),
    .LED(out_ref[15:8]),
    .ADC_SS_n(out_ref[7:7]),
    .ADC_MOSI(out_ref[6:6]),
    .ADC_SCLK(out_ref[5:5]),
    .lft_PDM(out_ref[4:4]),
    .rght_PDM(out_ref[3:3]),
    .cmd_n(out_ref[2:2]),
    .sht_dwn(out_ref[1:1]),
    .TX(out_ref[0:0])
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
    seed = 472634430;
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
