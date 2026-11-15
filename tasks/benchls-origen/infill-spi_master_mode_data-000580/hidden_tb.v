// Hidden tests: 5000 cycles of seeded random inputs (seed 1063549759); the submission must match reference.v
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
  reg [7:0] i_3;
  reg [7:0] i_4;
  reg [0:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_000580 dut (
    .spi_clk(clk),
    .spi_cs(i_0),
    .reset(i_1),
    .spi_miso(i_2),
    .spi_data(i_3),
    .spi_mode(i_4),
    .sig_R0W1(i_5),
    .spi_mosi(out_dut[8:8]),
    .read_data(out_dut[7:0])
  );
  origen_000580__ref ref_i (
    .spi_clk(clk),
    .spi_cs(i_0),
    .reset(i_1),
    .spi_miso(i_2),
    .spi_data(i_3),
    .spi_mode(i_4),
    .sig_R0W1(i_5),
    .spi_mosi(out_ref[8:8]),
    .read_data(out_ref[7:0])
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
    seed = 1063549759;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
