// Hidden tests: 5000 cycles of seeded random inputs (seed 1149896955); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 94;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [7:0] i_5;
  reg [7:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [15:0] i_11;
  reg [3:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [79:0] i_15;
  reg [79:0] i_16;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_00188 dut (
    .gtx_clk(i_0),
    .refclk(i_1),
    .glbl_rstn(i_2),
    .rx_axi_rstn(i_3),
    .tx_axi_rstn(i_4),
    .tx_ifg_delay(i_5),
    .tx_axis_mac_tdata(i_6),
    .tx_axis_mac_tvalid(i_7),
    .tx_axis_mac_tlast(i_8),
    .tx_axis_mac_tuser(i_9),
    .pause_req(i_10),
    .pause_val(i_11),
    .rgmii_rxd(i_12),
    .rgmii_rx_ctl(i_13),
    .rgmii_rxc(i_14),
    .rx_configuration_vector(i_15),
    .tx_configuration_vector(i_16),
    .gtx_clk_out(out_dut[93:93]),
    .gtx_clk90_out(out_dut[92:92]),
    .rx_enable(out_dut[91:91]),
    .rx_statistics_vector(out_dut[90:63]),
    .rx_statistics_valid(out_dut[62:62]),
    .rx_mac_aclk(out_dut[61:61]),
    .rx_reset(out_dut[60:60]),
    .rx_axis_mac_tdata(out_dut[59:52]),
    .rx_axis_mac_tvalid(out_dut[51:51]),
    .rx_axis_mac_tlast(out_dut[50:50]),
    .rx_axis_mac_tuser(out_dut[49:49]),
    .tx_enable(out_dut[48:48]),
    .tx_statistics_vector(out_dut[47:16]),
    .tx_statistics_valid(out_dut[15:15]),
    .tx_mac_aclk(out_dut[14:14]),
    .tx_reset(out_dut[13:13]),
    .tx_axis_mac_tready(out_dut[12:12]),
    .speedis100(out_dut[11:11]),
    .speedis10100(out_dut[10:10]),
    .rgmii_txd(out_dut[9:6]),
    .rgmii_tx_ctl(out_dut[5:5]),
    .rgmii_txc(out_dut[4:4]),
    .inband_link_status(out_dut[3:3]),
    .inband_clock_speed(out_dut[2:1]),
    .inband_duplex_status(out_dut[0:0])
  );
  rtlpp_00188__ref ref_i (
    .gtx_clk(i_0),
    .refclk(i_1),
    .glbl_rstn(i_2),
    .rx_axi_rstn(i_3),
    .tx_axi_rstn(i_4),
    .tx_ifg_delay(i_5),
    .tx_axis_mac_tdata(i_6),
    .tx_axis_mac_tvalid(i_7),
    .tx_axis_mac_tlast(i_8),
    .tx_axis_mac_tuser(i_9),
    .pause_req(i_10),
    .pause_val(i_11),
    .rgmii_rxd(i_12),
    .rgmii_rx_ctl(i_13),
    .rgmii_rxc(i_14),
    .rx_configuration_vector(i_15),
    .tx_configuration_vector(i_16),
    .gtx_clk_out(out_ref[93:93]),
    .gtx_clk90_out(out_ref[92:92]),
    .rx_enable(out_ref[91:91]),
    .rx_statistics_vector(out_ref[90:63]),
    .rx_statistics_valid(out_ref[62:62]),
    .rx_mac_aclk(out_ref[61:61]),
    .rx_reset(out_ref[60:60]),
    .rx_axis_mac_tdata(out_ref[59:52]),
    .rx_axis_mac_tvalid(out_ref[51:51]),
    .rx_axis_mac_tlast(out_ref[50:50]),
    .rx_axis_mac_tuser(out_ref[49:49]),
    .tx_enable(out_ref[48:48]),
    .tx_statistics_vector(out_ref[47:16]),
    .tx_statistics_valid(out_ref[15:15]),
    .tx_mac_aclk(out_ref[14:14]),
    .tx_reset(out_ref[13:13]),
    .tx_axis_mac_tready(out_ref[12:12]),
    .speedis100(out_ref[11:11]),
    .speedis10100(out_ref[10:10]),
    .rgmii_txd(out_ref[9:6]),
    .rgmii_tx_ctl(out_ref[5:5]),
    .rgmii_txc(out_ref[4:4]),
    .inband_link_status(out_ref[3:3]),
    .inband_clock_speed(out_ref[2:1]),
    .inband_duplex_status(out_ref[0:0])
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
    seed = 1149896955;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
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
      i_14 = {$random(seed)};
      i_15 = {$random(seed), $random(seed), $random(seed)};
      i_16 = {$random(seed), $random(seed), $random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
