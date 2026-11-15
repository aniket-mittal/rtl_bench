// Hidden tests: 5000 cycles of seeded random inputs (seed 1532386629); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 84;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [7:0] i_5;
  reg [0:0] i_6;
  reg [7:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [31:0] i_11;
  reg [3:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [3:0] i_17;
  reg [3:0] i_18;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_03298 dut (
    .lite_aclk(i_0),
    .lite_aresetn(i_1),
    .dphy_clk_200M(i_2),
    .video_aclk(i_3),
    .video_aresetn(i_4),
    .csirxss_s_axi_araddr(i_5),
    .csirxss_s_axi_arvalid(i_6),
    .csirxss_s_axi_awaddr(i_7),
    .csirxss_s_axi_awvalid(i_8),
    .csirxss_s_axi_bready(i_9),
    .csirxss_s_axi_rready(i_10),
    .csirxss_s_axi_wdata(i_11),
    .csirxss_s_axi_wstrb(i_12),
    .csirxss_s_axi_wvalid(i_13),
    .video_out_tready(i_14),
    .mipi_phy_if_clk_n(i_15),
    .mipi_phy_if_clk_p(i_16),
    .mipi_phy_if_data_n(i_17),
    .mipi_phy_if_data_p(i_18),
    .rxbyteclkhs(out_dut[83:83]),
    .clkoutphy_out(out_dut[82:82]),
    .system_rst_out(out_dut[81:81]),
    .pll_lock_out(out_dut[80:80]),
    .csirxss_csi_irq(out_dut[79:79]),
    .frame_rcvd_pulse_out(out_dut[78:78]),
    .csirxss_s_axi_arready(out_dut[77:77]),
    .csirxss_s_axi_awready(out_dut[76:76]),
    .csirxss_s_axi_bresp(out_dut[75:74]),
    .csirxss_s_axi_bvalid(out_dut[73:73]),
    .csirxss_s_axi_rdata(out_dut[72:41]),
    .csirxss_s_axi_rresp(out_dut[40:39]),
    .csirxss_s_axi_rvalid(out_dut[38:38]),
    .csirxss_s_axi_wready(out_dut[37:37]),
    .video_out_tdata(out_dut[36:13]),
    .video_out_tdest(out_dut[12:3]),
    .video_out_tlast(out_dut[2:2]),
    .video_out_tuser(out_dut[1:1]),
    .video_out_tvalid(out_dut[0:0])
  );
  rtlpp_03298__ref ref_i (
    .lite_aclk(i_0),
    .lite_aresetn(i_1),
    .dphy_clk_200M(i_2),
    .video_aclk(i_3),
    .video_aresetn(i_4),
    .csirxss_s_axi_araddr(i_5),
    .csirxss_s_axi_arvalid(i_6),
    .csirxss_s_axi_awaddr(i_7),
    .csirxss_s_axi_awvalid(i_8),
    .csirxss_s_axi_bready(i_9),
    .csirxss_s_axi_rready(i_10),
    .csirxss_s_axi_wdata(i_11),
    .csirxss_s_axi_wstrb(i_12),
    .csirxss_s_axi_wvalid(i_13),
    .video_out_tready(i_14),
    .mipi_phy_if_clk_n(i_15),
    .mipi_phy_if_clk_p(i_16),
    .mipi_phy_if_data_n(i_17),
    .mipi_phy_if_data_p(i_18),
    .rxbyteclkhs(out_ref[83:83]),
    .clkoutphy_out(out_ref[82:82]),
    .system_rst_out(out_ref[81:81]),
    .pll_lock_out(out_ref[80:80]),
    .csirxss_csi_irq(out_ref[79:79]),
    .frame_rcvd_pulse_out(out_ref[78:78]),
    .csirxss_s_axi_arready(out_ref[77:77]),
    .csirxss_s_axi_awready(out_ref[76:76]),
    .csirxss_s_axi_bresp(out_ref[75:74]),
    .csirxss_s_axi_bvalid(out_ref[73:73]),
    .csirxss_s_axi_rdata(out_ref[72:41]),
    .csirxss_s_axi_rresp(out_ref[40:39]),
    .csirxss_s_axi_rvalid(out_ref[38:38]),
    .csirxss_s_axi_wready(out_ref[37:37]),
    .video_out_tdata(out_ref[36:13]),
    .video_out_tdest(out_ref[12:3]),
    .video_out_tlast(out_ref[2:2]),
    .video_out_tuser(out_ref[1:1]),
    .video_out_tvalid(out_ref[0:0])
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
    seed = 1532386629;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
