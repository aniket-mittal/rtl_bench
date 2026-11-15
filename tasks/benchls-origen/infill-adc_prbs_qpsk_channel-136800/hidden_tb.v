// Hidden tests: 5000 cycles of seeded random inputs (seed 628666497); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 50;
  reg clk;
  reg [31:0] i_0;
  reg [0:0] i_1;
  reg [15:0] i_2;
  reg [0:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_136800 dut (
    .clk(clk),
    .control(i_0),
    .src_adc_valid(i_1),
    .src_adc_data(i_2),
    .src_adc_enable(i_3),
    .status(out_dut[49:18]),
    .dst_adc_valid(out_dut[17:17]),
    .dst_adc_data(out_dut[16:1]),
    .dst_adc_enable(out_dut[0:0])
  );
  origen_136800__ref ref_i (
    .clk(clk),
    .control(i_0),
    .src_adc_valid(i_1),
    .src_adc_data(i_2),
    .src_adc_enable(i_3),
    .status(out_ref[49:18]),
    .dst_adc_valid(out_ref[17:17]),
    .dst_adc_data(out_ref[16:1]),
    .dst_adc_enable(out_ref[0:0])
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
    seed = 628666497;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
