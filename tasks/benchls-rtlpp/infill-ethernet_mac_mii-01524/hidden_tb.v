// Hidden tests: 5000 cycles of seeded random inputs (seed 1376230818); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 143;
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
  reg [7:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  reg [0:0] i_19;
  reg [11:0] i_20;
  reg [0:0] i_21;
  reg [31:0] i_22;
  reg [0:0] i_23;
  reg [0:0] i_24;
  reg [11:0] i_25;
  reg [0:0] i_26;
  reg [0:0] i_27;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_01524 dut (
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
    .gmii_rxd(i_12),
    .gmii_rx_dv(i_13),
    .gmii_rx_er(i_14),
    .gmii_rx_clk(i_15),
    .mii_tx_clk(i_16),
    .mdio_i(i_17),
    .s_axi_aclk(i_18),
    .s_axi_resetn(i_19),
    .s_axi_awaddr(i_20),
    .s_axi_awvalid(i_21),
    .s_axi_wdata(i_22),
    .s_axi_wvalid(i_23),
    .s_axi_bready(i_24),
    .s_axi_araddr(i_25),
    .s_axi_arvalid(i_26),
    .s_axi_rready(i_27),
    .rx_enable(out_dut[142:142]),
    .rx_statistics_vector(out_dut[141:114]),
    .rx_statistics_valid(out_dut[113:113]),
    .rx_mac_aclk(out_dut[112:112]),
    .rx_reset(out_dut[111:111]),
    .rx_axis_mac_tdata(out_dut[110:103]),
    .rx_axis_mac_tvalid(out_dut[102:102]),
    .rx_axis_mac_tlast(out_dut[101:101]),
    .rx_axis_mac_tuser(out_dut[100:100]),
    .rx_axis_filter_tuser(out_dut[99:95]),
    .tx_enable(out_dut[94:94]),
    .tx_statistics_vector(out_dut[93:62]),
    .tx_statistics_valid(out_dut[61:61]),
    .tx_mac_aclk(out_dut[60:60]),
    .tx_reset(out_dut[59:59]),
    .tx_axis_mac_tready(out_dut[58:58]),
    .speedis100(out_dut[57:57]),
    .speedis10100(out_dut[56:56]),
    .gmii_txd(out_dut[55:48]),
    .gmii_tx_en(out_dut[47:47]),
    .gmii_tx_er(out_dut[46:46]),
    .gmii_tx_clk(out_dut[45:45]),
    .mdio_o(out_dut[44:44]),
    .mdio_t(out_dut[43:43]),
    .mdc(out_dut[42:42]),
    .s_axi_awready(out_dut[41:41]),
    .s_axi_wready(out_dut[40:40]),
    .s_axi_bresp(out_dut[39:38]),
    .s_axi_bvalid(out_dut[37:37]),
    .s_axi_arready(out_dut[36:36]),
    .s_axi_rdata(out_dut[35:4]),
    .s_axi_rresp(out_dut[3:2]),
    .s_axi_rvalid(out_dut[1:1]),
    .mac_irq(out_dut[0:0])
  );
  rtlpp_01524__ref ref_i (
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
    .gmii_rxd(i_12),
    .gmii_rx_dv(i_13),
    .gmii_rx_er(i_14),
    .gmii_rx_clk(i_15),
    .mii_tx_clk(i_16),
    .mdio_i(i_17),
    .s_axi_aclk(i_18),
    .s_axi_resetn(i_19),
    .s_axi_awaddr(i_20),
    .s_axi_awvalid(i_21),
    .s_axi_wdata(i_22),
    .s_axi_wvalid(i_23),
    .s_axi_bready(i_24),
    .s_axi_araddr(i_25),
    .s_axi_arvalid(i_26),
    .s_axi_rready(i_27),
    .rx_enable(out_ref[142:142]),
    .rx_statistics_vector(out_ref[141:114]),
    .rx_statistics_valid(out_ref[113:113]),
    .rx_mac_aclk(out_ref[112:112]),
    .rx_reset(out_ref[111:111]),
    .rx_axis_mac_tdata(out_ref[110:103]),
    .rx_axis_mac_tvalid(out_ref[102:102]),
    .rx_axis_mac_tlast(out_ref[101:101]),
    .rx_axis_mac_tuser(out_ref[100:100]),
    .rx_axis_filter_tuser(out_ref[99:95]),
    .tx_enable(out_ref[94:94]),
    .tx_statistics_vector(out_ref[93:62]),
    .tx_statistics_valid(out_ref[61:61]),
    .tx_mac_aclk(out_ref[60:60]),
    .tx_reset(out_ref[59:59]),
    .tx_axis_mac_tready(out_ref[58:58]),
    .speedis100(out_ref[57:57]),
    .speedis10100(out_ref[56:56]),
    .gmii_txd(out_ref[55:48]),
    .gmii_tx_en(out_ref[47:47]),
    .gmii_tx_er(out_ref[46:46]),
    .gmii_tx_clk(out_ref[45:45]),
    .mdio_o(out_ref[44:44]),
    .mdio_t(out_ref[43:43]),
    .mdc(out_ref[42:42]),
    .s_axi_awready(out_ref[41:41]),
    .s_axi_wready(out_ref[40:40]),
    .s_axi_bresp(out_ref[39:38]),
    .s_axi_bvalid(out_ref[37:37]),
    .s_axi_arready(out_ref[36:36]),
    .s_axi_rdata(out_ref[35:4]),
    .s_axi_rresp(out_ref[3:2]),
    .s_axi_rvalid(out_ref[1:1]),
    .mac_irq(out_ref[0:0])
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
    seed = 1376230818;
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
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      i_21 = {$random(seed)};
      i_22 = {$random(seed)};
      i_23 = {$random(seed)};
      i_24 = {$random(seed)};
      i_25 = {$random(seed)};
      i_26 = {$random(seed)};
      i_27 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
