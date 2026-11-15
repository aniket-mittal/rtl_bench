// Hidden tests: 5000 cycles of seeded random inputs (seed 823620277); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 1693;
  reg clk;
  reg [0:0] i_0;
  reg [11:0] i_1;
  reg [255:0] i_2;
  reg [31:0] i_3;
  reg [11:0] i_4;
  reg [7:0] i_5;
  reg [3:0] i_6;
  reg [15:0] i_7;
  reg [11:0] i_8;
  reg [15:0] i_9;
  reg [3:0] i_10;
  reg [3:0] i_11;
  reg [255:0] i_12;
  reg [31:0] i_13;
  reg [3:0] i_14;
  reg [3:0] i_15;
  reg [3:0] i_16;
  reg [3:0] i_17;
  reg [11:0] i_18;
  reg [255:0] i_19;
  reg [31:0] i_20;
  reg [11:0] i_21;
  reg [7:0] i_22;
  reg [3:0] i_23;
  reg [15:0] i_24;
  reg [11:0] i_25;
  reg [15:0] i_26;
  reg [3:0] i_27;
  reg [3:0] i_28;
  reg [3:0] i_29;
  reg [4:0] i_30;
  reg [4:0] i_31;
  reg [14:0] i_32;
  reg [9:0] i_33;
  reg [4:0] i_34;
  reg [4:0] i_35;
  reg [4:0] i_36;
  reg [14:0] i_37;
  reg [319:0] i_38;
  reg [9:0] i_39;
  reg [4:0] i_40;
  reg [4:0] i_41;
  reg [4:0] i_42;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_02796 dut (
    .aclk(clk),
    .aresetn(i_0),
    .s_axi_awid(i_1),
    .s_axi_awaddr(i_2),
    .s_axi_awlen(i_3),
    .s_axi_awsize(i_4),
    .s_axi_awburst(i_5),
    .s_axi_awlock(i_6),
    .s_axi_awcache(i_7),
    .s_axi_awprot(i_8),
    .s_axi_awqos(i_9),
    .s_axi_awuser(i_10),
    .s_axi_awvalid(i_11),
    .s_axi_wdata(i_12),
    .s_axi_wstrb(i_13),
    .s_axi_wlast(i_14),
    .s_axi_wuser(i_15),
    .s_axi_wvalid(i_16),
    .s_axi_bready(i_17),
    .s_axi_arid(i_18),
    .s_axi_araddr(i_19),
    .s_axi_arlen(i_20),
    .s_axi_arsize(i_21),
    .s_axi_arburst(i_22),
    .s_axi_arlock(i_23),
    .s_axi_arcache(i_24),
    .s_axi_arprot(i_25),
    .s_axi_arqos(i_26),
    .s_axi_aruser(i_27),
    .s_axi_arvalid(i_28),
    .s_axi_rready(i_29),
    .m_axi_awready(i_30),
    .m_axi_wready(i_31),
    .m_axi_bid(i_32),
    .m_axi_bresp(i_33),
    .m_axi_buser(i_34),
    .m_axi_bvalid(i_35),
    .m_axi_arready(i_36),
    .m_axi_rid(i_37),
    .m_axi_rdata(i_38),
    .m_axi_rresp(i_39),
    .m_axi_rlast(i_40),
    .m_axi_ruser(i_41),
    .m_axi_rvalid(i_42),
    .s_axi_awready(out_dut[1692:1689]),
    .s_axi_wready(out_dut[1688:1685]),
    .s_axi_bid(out_dut[1684:1673]),
    .s_axi_bresp(out_dut[1672:1665]),
    .s_axi_buser(out_dut[1664:1661]),
    .s_axi_bvalid(out_dut[1660:1657]),
    .s_axi_arready(out_dut[1656:1653]),
    .s_axi_rid(out_dut[1652:1641]),
    .s_axi_rdata(out_dut[1640:1385]),
    .s_axi_rresp(out_dut[1384:1377]),
    .s_axi_rlast(out_dut[1376:1373]),
    .s_axi_ruser(out_dut[1372:1369]),
    .s_axi_rvalid(out_dut[1368:1365]),
    .m_axi_awid(out_dut[1364:1350]),
    .m_axi_awaddr(out_dut[1349:1030]),
    .m_axi_awlen(out_dut[1029:990]),
    .m_axi_awsize(out_dut[989:975]),
    .m_axi_awburst(out_dut[974:965]),
    .m_axi_awlock(out_dut[964:960]),
    .m_axi_awcache(out_dut[959:940]),
    .m_axi_awprot(out_dut[939:925]),
    .m_axi_awregion(out_dut[924:905]),
    .m_axi_awqos(out_dut[904:885]),
    .m_axi_awuser(out_dut[884:880]),
    .m_axi_awvalid(out_dut[879:875]),
    .m_axi_wdata(out_dut[874:555]),
    .m_axi_wstrb(out_dut[554:515]),
    .m_axi_wlast(out_dut[514:510]),
    .m_axi_wuser(out_dut[509:505]),
    .m_axi_wvalid(out_dut[504:500]),
    .m_axi_bready(out_dut[499:495]),
    .m_axi_arid(out_dut[494:480]),
    .m_axi_araddr(out_dut[479:160]),
    .m_axi_arlen(out_dut[159:120]),
    .m_axi_arsize(out_dut[119:105]),
    .m_axi_arburst(out_dut[104:95]),
    .m_axi_arlock(out_dut[94:90]),
    .m_axi_arcache(out_dut[89:70]),
    .m_axi_arprot(out_dut[69:55]),
    .m_axi_arregion(out_dut[54:35]),
    .m_axi_arqos(out_dut[34:15]),
    .m_axi_aruser(out_dut[14:10]),
    .m_axi_arvalid(out_dut[9:5]),
    .m_axi_rready(out_dut[4:0])
  );
  rtlpp_02796__ref ref_i (
    .aclk(clk),
    .aresetn(i_0),
    .s_axi_awid(i_1),
    .s_axi_awaddr(i_2),
    .s_axi_awlen(i_3),
    .s_axi_awsize(i_4),
    .s_axi_awburst(i_5),
    .s_axi_awlock(i_6),
    .s_axi_awcache(i_7),
    .s_axi_awprot(i_8),
    .s_axi_awqos(i_9),
    .s_axi_awuser(i_10),
    .s_axi_awvalid(i_11),
    .s_axi_wdata(i_12),
    .s_axi_wstrb(i_13),
    .s_axi_wlast(i_14),
    .s_axi_wuser(i_15),
    .s_axi_wvalid(i_16),
    .s_axi_bready(i_17),
    .s_axi_arid(i_18),
    .s_axi_araddr(i_19),
    .s_axi_arlen(i_20),
    .s_axi_arsize(i_21),
    .s_axi_arburst(i_22),
    .s_axi_arlock(i_23),
    .s_axi_arcache(i_24),
    .s_axi_arprot(i_25),
    .s_axi_arqos(i_26),
    .s_axi_aruser(i_27),
    .s_axi_arvalid(i_28),
    .s_axi_rready(i_29),
    .m_axi_awready(i_30),
    .m_axi_wready(i_31),
    .m_axi_bid(i_32),
    .m_axi_bresp(i_33),
    .m_axi_buser(i_34),
    .m_axi_bvalid(i_35),
    .m_axi_arready(i_36),
    .m_axi_rid(i_37),
    .m_axi_rdata(i_38),
    .m_axi_rresp(i_39),
    .m_axi_rlast(i_40),
    .m_axi_ruser(i_41),
    .m_axi_rvalid(i_42),
    .s_axi_awready(out_ref[1692:1689]),
    .s_axi_wready(out_ref[1688:1685]),
    .s_axi_bid(out_ref[1684:1673]),
    .s_axi_bresp(out_ref[1672:1665]),
    .s_axi_buser(out_ref[1664:1661]),
    .s_axi_bvalid(out_ref[1660:1657]),
    .s_axi_arready(out_ref[1656:1653]),
    .s_axi_rid(out_ref[1652:1641]),
    .s_axi_rdata(out_ref[1640:1385]),
    .s_axi_rresp(out_ref[1384:1377]),
    .s_axi_rlast(out_ref[1376:1373]),
    .s_axi_ruser(out_ref[1372:1369]),
    .s_axi_rvalid(out_ref[1368:1365]),
    .m_axi_awid(out_ref[1364:1350]),
    .m_axi_awaddr(out_ref[1349:1030]),
    .m_axi_awlen(out_ref[1029:990]),
    .m_axi_awsize(out_ref[989:975]),
    .m_axi_awburst(out_ref[974:965]),
    .m_axi_awlock(out_ref[964:960]),
    .m_axi_awcache(out_ref[959:940]),
    .m_axi_awprot(out_ref[939:925]),
    .m_axi_awregion(out_ref[924:905]),
    .m_axi_awqos(out_ref[904:885]),
    .m_axi_awuser(out_ref[884:880]),
    .m_axi_awvalid(out_ref[879:875]),
    .m_axi_wdata(out_ref[874:555]),
    .m_axi_wstrb(out_ref[554:515]),
    .m_axi_wlast(out_ref[514:510]),
    .m_axi_wuser(out_ref[509:505]),
    .m_axi_wvalid(out_ref[504:500]),
    .m_axi_bready(out_ref[499:495]),
    .m_axi_arid(out_ref[494:480]),
    .m_axi_araddr(out_ref[479:160]),
    .m_axi_arlen(out_ref[159:120]),
    .m_axi_arsize(out_ref[119:105]),
    .m_axi_arburst(out_ref[104:95]),
    .m_axi_arlock(out_ref[94:90]),
    .m_axi_arcache(out_ref[89:70]),
    .m_axi_arprot(out_ref[69:55]),
    .m_axi_arregion(out_ref[54:35]),
    .m_axi_arqos(out_ref[34:15]),
    .m_axi_aruser(out_ref[14:10]),
    .m_axi_arvalid(out_ref[9:5]),
    .m_axi_rready(out_ref[4:0])
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
    seed = 823620277;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
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
      i_32 = {$random(seed)};
      i_33 = {$random(seed)};
      i_34 = {$random(seed)};
      i_35 = {$random(seed)};
      i_36 = {$random(seed)};
      i_37 = {$random(seed)};
      i_38 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_39 = {$random(seed)};
      i_40 = {$random(seed)};
      i_41 = {$random(seed)};
      i_42 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
