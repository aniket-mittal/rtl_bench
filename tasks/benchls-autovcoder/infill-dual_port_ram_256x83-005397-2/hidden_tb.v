// Hidden tests: 5000 cycles of seeded random inputs (seed 3295264220); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 166;
  reg clk;
  reg [7:0] i_0;
  reg [0:0] i_1;
  reg [82:0] i_2;
  reg [7:0] i_3;
  reg [0:0] i_4;
  reg [82:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_005397 dut (
    .pclk(clk),
    .mem_addr_add(i_0),
    .mem_write_add(i_1),
    .mem_write_data_add(i_2),
    .mem_addr_age(i_3),
    .mem_write_age(i_4),
    .mem_write_data_age(i_5),
    .mem_read_data_add(out_dut[165:83]),
    .mem_read_data_age(out_dut[82:0])
  );
  autovcoder_005397__ref ref_i (
    .pclk(clk),
    .mem_addr_add(i_0),
    .mem_write_add(i_1),
    .mem_write_data_add(i_2),
    .mem_addr_age(i_3),
    .mem_write_age(i_4),
    .mem_write_data_age(i_5),
    .mem_read_data_add(out_ref[165:83]),
    .mem_read_data_age(out_ref[82:0])
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
    seed = 3295264220;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed), $random(seed), $random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed), $random(seed), $random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
