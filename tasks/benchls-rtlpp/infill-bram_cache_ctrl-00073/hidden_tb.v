// Hidden tests: 5000 cycles of seeded random inputs (seed 1498940589); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 81;
  reg clk;
  reg [63:0] i_0;
  reg [17:0] i_1;
  reg [63:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_00073 dut (
    .clk_memory(clk),
    .bram_dout(i_0),
    .addr(i_1),
    .cache(i_2),
    .cready(i_3),
    .aresetn(i_4),
    .bram_addr(out_dut[80:68]),
    .bram_clk(out_dut[67:67]),
    .bram_rst(out_dut[66:66]),
    .bram_din(out_dut[65:2]),
    .bram_en(out_dut[1:1]),
    .bram_we(out_dut[0:0])
  );
  rtlpp_00073__ref ref_i (
    .clk_memory(clk),
    .bram_dout(i_0),
    .addr(i_1),
    .cache(i_2),
    .cready(i_3),
    .aresetn(i_4),
    .bram_addr(out_ref[80:68]),
    .bram_clk(out_ref[67:67]),
    .bram_rst(out_ref[66:66]),
    .bram_din(out_ref[65:2]),
    .bram_en(out_ref[1:1]),
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
    seed = 1498940589;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed), $random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed), $random(seed)};
      i_3 = {$random(seed)};
      i_4 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
