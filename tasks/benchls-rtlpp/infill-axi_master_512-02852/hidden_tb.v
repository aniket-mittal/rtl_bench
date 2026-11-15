// Hidden tests: 5000 cycles of seeded random inputs (seed 3154352787); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 776;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [3:0] i_3;
  reg [1:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [3:0] i_7;
  reg [511:0] i_8;
  reg [1:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_02852 dut (
    .aclk(clk),
    .aresetn(i_0),
    .m_axi_awready(i_1),
    .m_axi_wready(i_2),
    .m_axi_bid(i_3),
    .m_axi_bresp(i_4),
    .m_axi_bvalid(i_5),
    .m_axi_arready(i_6),
    .m_axi_rid(i_7),
    .m_axi_rdata(i_8),
    .m_axi_rresp(i_9),
    .m_axi_rlast(i_10),
    .m_axi_rvalid(i_11),
    .m_axi_awid(out_dut[775:772]),
    .m_axi_awaddr(out_dut[771:708]),
    .m_axi_awlen(out_dut[707:700]),
    .m_axi_awsize(out_dut[699:697]),
    .m_axi_awburst(out_dut[696:695]),
    .m_axi_awlock(out_dut[694:694]),
    .m_axi_awcache(out_dut[693:690]),
    .m_axi_awprot(out_dut[689:687]),
    .m_axi_awregion(out_dut[686:683]),
    .m_axi_awqos(out_dut[682:679]),
    .m_axi_awvalid(out_dut[678:678]),
    .m_axi_wdata(out_dut[677:166]),
    .m_axi_wstrb(out_dut[165:102]),
    .m_axi_wlast(out_dut[101:101]),
    .m_axi_wvalid(out_dut[100:100]),
    .m_axi_bready(out_dut[99:99]),
    .m_axi_arid(out_dut[98:95]),
    .m_axi_araddr(out_dut[94:31]),
    .m_axi_arlen(out_dut[30:23]),
    .m_axi_arsize(out_dut[22:20]),
    .m_axi_arburst(out_dut[19:18]),
    .m_axi_arlock(out_dut[17:17]),
    .m_axi_arcache(out_dut[16:13]),
    .m_axi_arprot(out_dut[12:10]),
    .m_axi_arregion(out_dut[9:6]),
    .m_axi_arqos(out_dut[5:2]),
    .m_axi_arvalid(out_dut[1:1]),
    .m_axi_rready(out_dut[0:0])
  );
  rtlpp_02852__ref ref_i (
    .aclk(clk),
    .aresetn(i_0),
    .m_axi_awready(i_1),
    .m_axi_wready(i_2),
    .m_axi_bid(i_3),
    .m_axi_bresp(i_4),
    .m_axi_bvalid(i_5),
    .m_axi_arready(i_6),
    .m_axi_rid(i_7),
    .m_axi_rdata(i_8),
    .m_axi_rresp(i_9),
    .m_axi_rlast(i_10),
    .m_axi_rvalid(i_11),
    .m_axi_awid(out_ref[775:772]),
    .m_axi_awaddr(out_ref[771:708]),
    .m_axi_awlen(out_ref[707:700]),
    .m_axi_awsize(out_ref[699:697]),
    .m_axi_awburst(out_ref[696:695]),
    .m_axi_awlock(out_ref[694:694]),
    .m_axi_awcache(out_ref[693:690]),
    .m_axi_awprot(out_ref[689:687]),
    .m_axi_awregion(out_ref[686:683]),
    .m_axi_awqos(out_ref[682:679]),
    .m_axi_awvalid(out_ref[678:678]),
    .m_axi_wdata(out_ref[677:166]),
    .m_axi_wstrb(out_ref[165:102]),
    .m_axi_wlast(out_ref[101:101]),
    .m_axi_wvalid(out_ref[100:100]),
    .m_axi_bready(out_ref[99:99]),
    .m_axi_arid(out_ref[98:95]),
    .m_axi_araddr(out_ref[94:31]),
    .m_axi_arlen(out_ref[30:23]),
    .m_axi_arsize(out_ref[22:20]),
    .m_axi_arburst(out_ref[19:18]),
    .m_axi_arlock(out_ref[17:17]),
    .m_axi_arcache(out_ref[16:13]),
    .m_axi_arprot(out_ref[12:10]),
    .m_axi_arregion(out_ref[9:6]),
    .m_axi_arqos(out_ref[5:2]),
    .m_axi_arvalid(out_ref[1:1]),
    .m_axi_rready(out_ref[0:0])
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
    seed = 3154352787;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
