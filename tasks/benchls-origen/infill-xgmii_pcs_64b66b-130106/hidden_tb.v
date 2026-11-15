// Hidden tests: 5000 cycles of seeded random inputs (seed 3413502022); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 153;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [63:0] i_3;
  reg [7:0] i_4;
  reg [63:0] i_5;
  reg [1:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_130106 dut (
    .rx_clk(clk),
    .rx_rst(i_0),
    .tx_clk(i_1),
    .tx_rst(i_2),
    .xgmii_txd(i_3),
    .xgmii_txc(i_4),
    .serdes_rx_data(i_5),
    .serdes_rx_hdr(i_6),
    .tx_prbs31_enable(i_7),
    .rx_prbs31_enable(i_8),
    .xgmii_rxd(out_dut[152:89]),
    .xgmii_rxc(out_dut[88:81]),
    .serdes_tx_data(out_dut[80:17]),
    .serdes_tx_hdr(out_dut[16:15]),
    .serdes_rx_bitslip(out_dut[14:14]),
    .serdes_rx_reset_req(out_dut[13:13]),
    .tx_bad_block(out_dut[12:12]),
    .rx_error_count(out_dut[11:4]),
    .rx_bad_block(out_dut[3:3]),
    .rx_sequence_error(out_dut[2:2]),
    .rx_block_lock(out_dut[1:1]),
    .rx_high_ber(out_dut[0:0])
  );
  origen_130106__ref ref_i (
    .rx_clk(clk),
    .rx_rst(i_0),
    .tx_clk(i_1),
    .tx_rst(i_2),
    .xgmii_txd(i_3),
    .xgmii_txc(i_4),
    .serdes_rx_data(i_5),
    .serdes_rx_hdr(i_6),
    .tx_prbs31_enable(i_7),
    .rx_prbs31_enable(i_8),
    .xgmii_rxd(out_ref[152:89]),
    .xgmii_rxc(out_ref[88:81]),
    .serdes_tx_data(out_ref[80:17]),
    .serdes_tx_hdr(out_ref[16:15]),
    .serdes_rx_bitslip(out_ref[14:14]),
    .serdes_rx_reset_req(out_ref[13:13]),
    .tx_bad_block(out_ref[12:12]),
    .rx_error_count(out_ref[11:4]),
    .rx_bad_block(out_ref[3:3]),
    .rx_sequence_error(out_ref[2:2]),
    .rx_block_lock(out_ref[1:1]),
    .rx_high_ber(out_ref[0:0])
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
    seed = 3413502022;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed), $random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed), $random(seed)};
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
