// Hidden tests: 5000 cycles of seeded random inputs (seed 1293000413); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 39;
  reg clk;
  reg [0:0] i_0;
  reg [63:0] i_1;
  reg [0:0] i_2;
  reg [7:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_060168 dut (
    .gmii_rx_clk(clk),
    .sys_rst(i_0),
    .global_counter(i_1),
    .gmii_rx_dv(i_2),
    .gmii_rxd(i_3),
    .data_full(i_4),
    .len_full(i_5),
    .data_din(out_dut[38:21]),
    .data_wr_en(out_dut[20:20]),
    .len_din(out_dut[19:2]),
    .len_wr_en(out_dut[1:1]),
    .wr_clk(out_dut[0:0])
  );
  origen_060168__ref ref_i (
    .gmii_rx_clk(clk),
    .sys_rst(i_0),
    .global_counter(i_1),
    .gmii_rx_dv(i_2),
    .gmii_rxd(i_3),
    .data_full(i_4),
    .len_full(i_5),
    .data_din(out_ref[38:21]),
    .data_wr_en(out_ref[20:20]),
    .len_din(out_ref[19:2]),
    .len_wr_en(out_ref[1:1]),
    .wr_clk(out_ref[0:0])
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
    seed = 1293000413;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed), $random(seed)};
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
