// Hidden tests: 5000 cycles of seeded random inputs (seed 3062374924); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 10;
  reg clk;
  reg [0:0] i_0;
  reg [7:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_05423 dut (
    .ck_1356meg(i_0),
    .adc_d(i_1),
    .pwr_lo(out_dut[9:9]),
    .pwr_hi(out_dut[8:8]),
    .pwr_oe1(out_dut[7:7]),
    .pwr_oe2(out_dut[6:6]),
    .pwr_oe3(out_dut[5:5]),
    .pwr_oe4(out_dut[4:4]),
    .adc_clk(out_dut[3:3]),
    .ssp_frame(out_dut[2:2]),
    .ssp_din(out_dut[1:1]),
    .ssp_clk(out_dut[0:0])
  );
  mg_05423__ref ref_i (
    .ck_1356meg(i_0),
    .adc_d(i_1),
    .pwr_lo(out_ref[9:9]),
    .pwr_hi(out_ref[8:8]),
    .pwr_oe1(out_ref[7:7]),
    .pwr_oe2(out_ref[6:6]),
    .pwr_oe3(out_ref[5:5]),
    .pwr_oe4(out_ref[4:4]),
    .adc_clk(out_ref[3:3]),
    .ssp_frame(out_ref[2:2]),
    .ssp_din(out_ref[1:1]),
    .ssp_clk(out_ref[0:0])
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
    seed = 3062374924;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
