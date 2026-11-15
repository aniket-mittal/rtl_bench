// Hidden tests: 5000 cycles of seeded random inputs (seed 467394655); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 20;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [7:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [7:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_03317 dut (
    .gmii_rxclk(clk),
    .gmii_txclk(i_0),
    .rst_n(i_1),
    .port_type(i_2),
    .gmii_rx_dv(i_3),
    .gmii_rx_er(i_4),
    .gmii_rxd(i_5),
    .gmii_tx_en_tsnchip2adp(i_6),
    .gmii_tx_er_tsnchip2adp(i_7),
    .gmii_txd_tsnchip2adp(i_8),
    .gmii_rx_dv_adp2tsnchip(out_dut[19:19]),
    .gmii_rx_er_adp2tsnchip(out_dut[18:18]),
    .gmii_rxd_adp2tsnchip(out_dut[17:10]),
    .gmii_tx_en(out_dut[9:9]),
    .gmii_tx_er(out_dut[8:8]),
    .gmii_txd(out_dut[7:0])
  );
  rtlpp_03317__ref ref_i (
    .gmii_rxclk(clk),
    .gmii_txclk(i_0),
    .rst_n(i_1),
    .port_type(i_2),
    .gmii_rx_dv(i_3),
    .gmii_rx_er(i_4),
    .gmii_rxd(i_5),
    .gmii_tx_en_tsnchip2adp(i_6),
    .gmii_tx_er_tsnchip2adp(i_7),
    .gmii_txd_tsnchip2adp(i_8),
    .gmii_rx_dv_adp2tsnchip(out_ref[19:19]),
    .gmii_rx_er_adp2tsnchip(out_ref[18:18]),
    .gmii_rxd_adp2tsnchip(out_ref[17:10]),
    .gmii_tx_en(out_ref[9:9]),
    .gmii_tx_er(out_ref[8:8]),
    .gmii_txd(out_ref[7:0])
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
    seed = 467394655;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
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
