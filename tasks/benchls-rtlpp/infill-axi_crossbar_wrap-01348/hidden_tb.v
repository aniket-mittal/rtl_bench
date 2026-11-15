// Hidden tests: 5000 cycles of seeded random inputs (seed 794226508); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 1430;
  reg clk;
  reg [0:0] i_0;
  reg [14:0] i_1;
  reg [159:0] i_2;
  reg [39:0] i_3;
  reg [14:0] i_4;
  reg [9:0] i_5;
  reg [4:0] i_6;
  reg [19:0] i_7;
  reg [14:0] i_8;
  reg [19:0] i_9;
  reg [4:0] i_10;
  reg [159:0] i_11;
  reg [19:0] i_12;
  reg [4:0] i_13;
  reg [4:0] i_14;
  reg [4:0] i_15;
  reg [14:0] i_16;
  reg [159:0] i_17;
  reg [39:0] i_18;
  reg [14:0] i_19;
  reg [9:0] i_20;
  reg [4:0] i_21;
  reg [19:0] i_22;
  reg [14:0] i_23;
  reg [19:0] i_24;
  reg [4:0] i_25;
  reg [4:0] i_26;
  reg [6:0] i_27;
  reg [6:0] i_28;
  reg [20:0] i_29;
  reg [13:0] i_30;
  reg [6:0] i_31;
  reg [6:0] i_32;
  reg [20:0] i_33;
  reg [223:0] i_34;
  reg [13:0] i_35;
  reg [6:0] i_36;
  reg [6:0] i_37;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_01348 dut (
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
    .s_axi_awvalid(i_10),
    .s_axi_wdata(i_11),
    .s_axi_wstrb(i_12),
    .s_axi_wlast(i_13),
    .s_axi_wvalid(i_14),
    .s_axi_bready(i_15),
    .s_axi_arid(i_16),
    .s_axi_araddr(i_17),
    .s_axi_arlen(i_18),
    .s_axi_arsize(i_19),
    .s_axi_arburst(i_20),
    .s_axi_arlock(i_21),
    .s_axi_arcache(i_22),
    .s_axi_arprot(i_23),
    .s_axi_arqos(i_24),
    .s_axi_arvalid(i_25),
    .s_axi_rready(i_26),
    .m_axi_awready(i_27),
    .m_axi_wready(i_28),
    .m_axi_bid(i_29),
    .m_axi_bresp(i_30),
    .m_axi_bvalid(i_31),
    .m_axi_arready(i_32),
    .m_axi_rid(i_33),
    .m_axi_rdata(i_34),
    .m_axi_rresp(i_35),
    .m_axi_rlast(i_36),
    .m_axi_rvalid(i_37),
    .s_axi_awready(out_dut[1429:1425]),
    .s_axi_wready(out_dut[1424:1420]),
    .s_axi_bid(out_dut[1419:1405]),
    .s_axi_bresp(out_dut[1404:1395]),
    .s_axi_bvalid(out_dut[1394:1390]),
    .s_axi_arready(out_dut[1389:1385]),
    .s_axi_rid(out_dut[1384:1370]),
    .s_axi_rdata(out_dut[1369:1210]),
    .s_axi_rresp(out_dut[1209:1200]),
    .s_axi_rlast(out_dut[1199:1195]),
    .s_axi_rvalid(out_dut[1194:1190]),
    .m_axi_awid(out_dut[1189:1169]),
    .m_axi_awaddr(out_dut[1168:945]),
    .m_axi_awlen(out_dut[944:889]),
    .m_axi_awsize(out_dut[888:868]),
    .m_axi_awburst(out_dut[867:854]),
    .m_axi_awlock(out_dut[853:847]),
    .m_axi_awcache(out_dut[846:819]),
    .m_axi_awprot(out_dut[818:798]),
    .m_axi_awregion(out_dut[797:770]),
    .m_axi_awqos(out_dut[769:742]),
    .m_axi_awvalid(out_dut[741:735]),
    .m_axi_wdata(out_dut[734:511]),
    .m_axi_wstrb(out_dut[510:483]),
    .m_axi_wlast(out_dut[482:476]),
    .m_axi_wvalid(out_dut[475:469]),
    .m_axi_bready(out_dut[468:462]),
    .m_axi_arid(out_dut[461:441]),
    .m_axi_araddr(out_dut[440:217]),
    .m_axi_arlen(out_dut[216:161]),
    .m_axi_arsize(out_dut[160:140]),
    .m_axi_arburst(out_dut[139:126]),
    .m_axi_arlock(out_dut[125:119]),
    .m_axi_arcache(out_dut[118:91]),
    .m_axi_arprot(out_dut[90:70]),
    .m_axi_arregion(out_dut[69:42]),
    .m_axi_arqos(out_dut[41:14]),
    .m_axi_arvalid(out_dut[13:7]),
    .m_axi_rready(out_dut[6:0])
  );
  rtlpp_01348__ref ref_i (
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
    .s_axi_awvalid(i_10),
    .s_axi_wdata(i_11),
    .s_axi_wstrb(i_12),
    .s_axi_wlast(i_13),
    .s_axi_wvalid(i_14),
    .s_axi_bready(i_15),
    .s_axi_arid(i_16),
    .s_axi_araddr(i_17),
    .s_axi_arlen(i_18),
    .s_axi_arsize(i_19),
    .s_axi_arburst(i_20),
    .s_axi_arlock(i_21),
    .s_axi_arcache(i_22),
    .s_axi_arprot(i_23),
    .s_axi_arqos(i_24),
    .s_axi_arvalid(i_25),
    .s_axi_rready(i_26),
    .m_axi_awready(i_27),
    .m_axi_wready(i_28),
    .m_axi_bid(i_29),
    .m_axi_bresp(i_30),
    .m_axi_bvalid(i_31),
    .m_axi_arready(i_32),
    .m_axi_rid(i_33),
    .m_axi_rdata(i_34),
    .m_axi_rresp(i_35),
    .m_axi_rlast(i_36),
    .m_axi_rvalid(i_37),
    .s_axi_awready(out_ref[1429:1425]),
    .s_axi_wready(out_ref[1424:1420]),
    .s_axi_bid(out_ref[1419:1405]),
    .s_axi_bresp(out_ref[1404:1395]),
    .s_axi_bvalid(out_ref[1394:1390]),
    .s_axi_arready(out_ref[1389:1385]),
    .s_axi_rid(out_ref[1384:1370]),
    .s_axi_rdata(out_ref[1369:1210]),
    .s_axi_rresp(out_ref[1209:1200]),
    .s_axi_rlast(out_ref[1199:1195]),
    .s_axi_rvalid(out_ref[1194:1190]),
    .m_axi_awid(out_ref[1189:1169]),
    .m_axi_awaddr(out_ref[1168:945]),
    .m_axi_awlen(out_ref[944:889]),
    .m_axi_awsize(out_ref[888:868]),
    .m_axi_awburst(out_ref[867:854]),
    .m_axi_awlock(out_ref[853:847]),
    .m_axi_awcache(out_ref[846:819]),
    .m_axi_awprot(out_ref[818:798]),
    .m_axi_awregion(out_ref[797:770]),
    .m_axi_awqos(out_ref[769:742]),
    .m_axi_awvalid(out_ref[741:735]),
    .m_axi_wdata(out_ref[734:511]),
    .m_axi_wstrb(out_ref[510:483]),
    .m_axi_wlast(out_ref[482:476]),
    .m_axi_wvalid(out_ref[475:469]),
    .m_axi_bready(out_ref[468:462]),
    .m_axi_arid(out_ref[461:441]),
    .m_axi_araddr(out_ref[440:217]),
    .m_axi_arlen(out_ref[216:161]),
    .m_axi_arsize(out_ref[160:140]),
    .m_axi_arburst(out_ref[139:126]),
    .m_axi_arlock(out_ref[125:119]),
    .m_axi_arcache(out_ref[118:91]),
    .m_axi_arprot(out_ref[90:70]),
    .m_axi_arregion(out_ref[69:42]),
    .m_axi_arqos(out_ref[41:14]),
    .m_axi_arvalid(out_ref[13:7]),
    .m_axi_rready(out_ref[6:0])
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
    seed = 794226508;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_3 = {$random(seed), $random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_18 = {$random(seed), $random(seed)};
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
      i_32 = {$random(seed)};
      i_33 = {$random(seed)};
      i_34 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_35 = {$random(seed)};
      i_36 = {$random(seed)};
      i_37 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
