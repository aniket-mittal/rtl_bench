// Hidden tests: 5000 cycles of seeded random inputs (seed 248938484); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 32;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [17:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  jtag_shifter dut (
    .shift_clk(clk),
    .shift_din(i_0),
    .shift(i_1),
    .din_load(i_2),
    .din(i_3),
    .shift_dout(out_dut[31:31]),
    .control_reg_ce(out_dut[30:30]),
    .bram_ce(out_dut[29:29]),
    .bram_a(out_dut[28:19]),
    .bram_d(out_dut[18:1]),
    .bram_we(out_dut[0:0])
  );
  jtag_shifter__ref ref_i (
    .shift_clk(clk),
    .shift_din(i_0),
    .shift(i_1),
    .din_load(i_2),
    .din(i_3),
    .shift_dout(out_ref[31:31]),
    .control_reg_ce(out_ref[30:30]),
    .bram_ce(out_ref[29:29]),
    .bram_a(out_ref[28:19]),
    .bram_d(out_ref[18:1]),
    .bram_we(out_ref[0:0])
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
    seed = 248938484;
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
