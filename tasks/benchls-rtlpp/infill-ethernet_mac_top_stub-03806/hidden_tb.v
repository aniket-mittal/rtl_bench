// Hidden tests: 5000 cycles of seeded random inputs (seed 1787990323); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 197;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [63:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [7:0] i_5;
  reg [0:0] i_6;
  reg [15:0] i_7;
  reg [3:0] i_8;
  reg [0:0] i_9;
  reg [31:0] i_10;
  reg [31:0] i_11;
  reg [0:0] i_12;
  reg [31:0] i_13;
  reg [47:0] i_14;
  reg [0:0] i_15;
  reg [1:0] i_16;
  reg [0:0] i_17;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_03806 dut (
    .clk(clk),
    .reset_(i_0),
    .tx_mac_wr(i_1),
    .tx_mac_data(i_2),
    .rx_mac_rd(i_3),
    .cs_fifo_rd_en(i_4),
    .gmii_rxd(i_5),
    .gmii_rx_er(i_6),
    .host_addr_reg(i_7),
    .SYS_ADDR(i_8),
    .fail_over(i_9),
    .fmac_ctrl(i_10),
    .fmac_ctrl1(i_11),
    .fmac_rxd_en(i_12),
    .mac_pause_value(i_13),
    .mac_addr0(i_14),
    .reg_rd_start(i_15),
    .fmac_speed(i_16),
    .gmii_rx_dv(i_17),
    .tx_mac_full(out_dut[196:196]),
    .tx_mac_usedw(out_dut[195:183]),
    .rx_mac_data(out_dut[182:119]),
    .rx_mac_ctrl(out_dut[118:111]),
    .rx_mac_empty(out_dut[110:110]),
    .cs_fifo_empty(out_dut[109:109]),
    .ipcs_fifo_dout(out_dut[108:45]),
    .gmii_txd(out_dut[44:37]),
    .xauiA_linkup(out_dut[36:36]),
    .reg_rd_done_out(out_dut[35:35]),
    .gmii_tx_er(out_dut[34:34]),
    .FMAC_REGDOUT(out_dut[33:2]),
    .FIFO_OV_IPEND(out_dut[1:1]),
    .gmii_tx_en(out_dut[0:0])
  );
  rtlpp_03806__ref ref_i (
    .clk(clk),
    .reset_(i_0),
    .tx_mac_wr(i_1),
    .tx_mac_data(i_2),
    .rx_mac_rd(i_3),
    .cs_fifo_rd_en(i_4),
    .gmii_rxd(i_5),
    .gmii_rx_er(i_6),
    .host_addr_reg(i_7),
    .SYS_ADDR(i_8),
    .fail_over(i_9),
    .fmac_ctrl(i_10),
    .fmac_ctrl1(i_11),
    .fmac_rxd_en(i_12),
    .mac_pause_value(i_13),
    .mac_addr0(i_14),
    .reg_rd_start(i_15),
    .fmac_speed(i_16),
    .gmii_rx_dv(i_17),
    .tx_mac_full(out_ref[196:196]),
    .tx_mac_usedw(out_ref[195:183]),
    .rx_mac_data(out_ref[182:119]),
    .rx_mac_ctrl(out_ref[118:111]),
    .rx_mac_empty(out_ref[110:110]),
    .cs_fifo_empty(out_ref[109:109]),
    .ipcs_fifo_dout(out_ref[108:45]),
    .gmii_txd(out_ref[44:37]),
    .xauiA_linkup(out_ref[36:36]),
    .reg_rd_done_out(out_ref[35:35]),
    .gmii_tx_er(out_ref[34:34]),
    .FMAC_REGDOUT(out_ref[33:2]),
    .FIFO_OV_IPEND(out_ref[1:1]),
    .gmii_tx_en(out_ref[0:0])
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
    seed = 1787990323;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed), $random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed), $random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
