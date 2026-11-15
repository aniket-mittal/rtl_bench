// Hidden tests: 5000 cycles of seeded random inputs (seed 2249323685); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 133;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [17:0] i_9;
  reg [0:0] i_10;
  reg [17:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [31:0] i_15;
  reg [3:0] i_16;
  reg [0:0] i_17;
  reg [31:0] i_18;
  reg [3:0] i_19;
  reg [0:0] i_20;
  reg [0:0] i_21;
  reg [31:0] i_22;
  reg [3:0] i_23;
  reg [0:0] i_24;
  reg [0:0] i_25;
  reg [0:0] i_26;
  reg [0:0] i_27;
  reg [3:0] i_28;
  reg [0:0] i_29;
  reg [0:0] i_30;
  reg [0:0] i_31;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_01472 dut (
    .s_axi_lite_resetn(i_0),
    .s_axi_lite_clk(i_1),
    .axis_clk(i_2),
    .axi_txd_arstn(i_3),
    .axi_txc_arstn(i_4),
    .axi_rxd_arstn(i_5),
    .axi_rxs_arstn(i_6),
    .gtx_clk(i_7),
    .ref_clk(i_8),
    .s_axi_araddr(i_9),
    .s_axi_arvalid(i_10),
    .s_axi_awaddr(i_11),
    .s_axi_awvalid(i_12),
    .s_axi_bready(i_13),
    .s_axi_rready(i_14),
    .s_axi_wdata(i_15),
    .s_axi_wstrb(i_16),
    .s_axi_wvalid(i_17),
    .s_axis_txc_tdata(i_18),
    .s_axis_txc_tkeep(i_19),
    .s_axis_txc_tlast(i_20),
    .s_axis_txc_tvalid(i_21),
    .s_axis_txd_tdata(i_22),
    .s_axis_txd_tkeep(i_23),
    .s_axis_txd_tlast(i_24),
    .s_axis_txd_tvalid(i_25),
    .m_axis_rxd_tready(i_26),
    .m_axis_rxs_tready(i_27),
    .rgmii_rd(i_28),
    .rgmii_rx_ctl(i_29),
    .rgmii_rxc(i_30),
    .mdio_mdio_i(i_31),
    .mac_irq(out_dut[132:132]),
    .interrupt(out_dut[131:131]),
    .phy_rst_n(out_dut[130:130]),
    .gtx_clk90_out(out_dut[129:129]),
    .gtx_clk_out(out_dut[128:128]),
    .s_axi_arready(out_dut[127:127]),
    .s_axi_awready(out_dut[126:126]),
    .s_axi_bresp(out_dut[125:124]),
    .s_axi_bvalid(out_dut[123:123]),
    .s_axi_rdata(out_dut[122:91]),
    .s_axi_rresp(out_dut[90:89]),
    .s_axi_rvalid(out_dut[88:88]),
    .s_axi_wready(out_dut[87:87]),
    .s_axis_txc_tready(out_dut[86:86]),
    .s_axis_txd_tready(out_dut[85:85]),
    .m_axis_rxd_tdata(out_dut[84:53]),
    .m_axis_rxd_tkeep(out_dut[52:49]),
    .m_axis_rxd_tlast(out_dut[48:48]),
    .m_axis_rxd_tvalid(out_dut[47:47]),
    .m_axis_rxs_tdata(out_dut[46:15]),
    .m_axis_rxs_tkeep(out_dut[14:11]),
    .m_axis_rxs_tlast(out_dut[10:10]),
    .m_axis_rxs_tvalid(out_dut[9:9]),
    .rgmii_td(out_dut[8:5]),
    .rgmii_tx_ctl(out_dut[4:4]),
    .rgmii_txc(out_dut[3:3]),
    .mdio_mdc(out_dut[2:2]),
    .mdio_mdio_o(out_dut[1:1]),
    .mdio_mdio_t(out_dut[0:0])
  );
  rtlpp_01472__ref ref_i (
    .s_axi_lite_resetn(i_0),
    .s_axi_lite_clk(i_1),
    .axis_clk(i_2),
    .axi_txd_arstn(i_3),
    .axi_txc_arstn(i_4),
    .axi_rxd_arstn(i_5),
    .axi_rxs_arstn(i_6),
    .gtx_clk(i_7),
    .ref_clk(i_8),
    .s_axi_araddr(i_9),
    .s_axi_arvalid(i_10),
    .s_axi_awaddr(i_11),
    .s_axi_awvalid(i_12),
    .s_axi_bready(i_13),
    .s_axi_rready(i_14),
    .s_axi_wdata(i_15),
    .s_axi_wstrb(i_16),
    .s_axi_wvalid(i_17),
    .s_axis_txc_tdata(i_18),
    .s_axis_txc_tkeep(i_19),
    .s_axis_txc_tlast(i_20),
    .s_axis_txc_tvalid(i_21),
    .s_axis_txd_tdata(i_22),
    .s_axis_txd_tkeep(i_23),
    .s_axis_txd_tlast(i_24),
    .s_axis_txd_tvalid(i_25),
    .m_axis_rxd_tready(i_26),
    .m_axis_rxs_tready(i_27),
    .rgmii_rd(i_28),
    .rgmii_rx_ctl(i_29),
    .rgmii_rxc(i_30),
    .mdio_mdio_i(i_31),
    .mac_irq(out_ref[132:132]),
    .interrupt(out_ref[131:131]),
    .phy_rst_n(out_ref[130:130]),
    .gtx_clk90_out(out_ref[129:129]),
    .gtx_clk_out(out_ref[128:128]),
    .s_axi_arready(out_ref[127:127]),
    .s_axi_awready(out_ref[126:126]),
    .s_axi_bresp(out_ref[125:124]),
    .s_axi_bvalid(out_ref[123:123]),
    .s_axi_rdata(out_ref[122:91]),
    .s_axi_rresp(out_ref[90:89]),
    .s_axi_rvalid(out_ref[88:88]),
    .s_axi_wready(out_ref[87:87]),
    .s_axis_txc_tready(out_ref[86:86]),
    .s_axis_txd_tready(out_ref[85:85]),
    .m_axis_rxd_tdata(out_ref[84:53]),
    .m_axis_rxd_tkeep(out_ref[52:49]),
    .m_axis_rxd_tlast(out_ref[48:48]),
    .m_axis_rxd_tvalid(out_ref[47:47]),
    .m_axis_rxs_tdata(out_ref[46:15]),
    .m_axis_rxs_tkeep(out_ref[14:11]),
    .m_axis_rxs_tlast(out_ref[10:10]),
    .m_axis_rxs_tvalid(out_ref[9:9]),
    .rgmii_td(out_ref[8:5]),
    .rgmii_tx_ctl(out_ref[4:4]),
    .rgmii_txc(out_ref[3:3]),
    .mdio_mdc(out_ref[2:2]),
    .mdio_mdio_o(out_ref[1:1]),
    .mdio_mdio_t(out_ref[0:0])
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
    seed = 2249323685;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
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
      i_28 = {$random(seed)};
      i_29 = {$random(seed)};
      i_30 = {$random(seed)};
      i_31 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
