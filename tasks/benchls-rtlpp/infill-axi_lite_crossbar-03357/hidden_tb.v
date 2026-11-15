// Hidden tests: 5000 cycles of seeded random inputs (seed 718017533); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 818;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [2:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [3:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [31:0] i_8;
  reg [2:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [6:0] i_12;
  reg [6:0] i_13;
  reg [13:0] i_14;
  reg [6:0] i_15;
  reg [6:0] i_16;
  reg [223:0] i_17;
  reg [13:0] i_18;
  reg [6:0] i_19;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_03357 dut (
    .aclk(clk),
    .aresetn(i_0),
    .s_axi_awaddr(i_1),
    .s_axi_awprot(i_2),
    .s_axi_awvalid(i_3),
    .s_axi_wdata(i_4),
    .s_axi_wstrb(i_5),
    .s_axi_wvalid(i_6),
    .s_axi_bready(i_7),
    .s_axi_araddr(i_8),
    .s_axi_arprot(i_9),
    .s_axi_arvalid(i_10),
    .s_axi_rready(i_11),
    .m_axi_awready(i_12),
    .m_axi_wready(i_13),
    .m_axi_bresp(i_14),
    .m_axi_bvalid(i_15),
    .m_axi_arready(i_16),
    .m_axi_rdata(i_17),
    .m_axi_rresp(i_18),
    .m_axi_rvalid(i_19),
    .s_axi_awready(out_dut[817:817]),
    .s_axi_wready(out_dut[816:816]),
    .s_axi_bresp(out_dut[815:814]),
    .s_axi_bvalid(out_dut[813:813]),
    .s_axi_arready(out_dut[812:812]),
    .s_axi_rdata(out_dut[811:780]),
    .s_axi_rresp(out_dut[779:778]),
    .s_axi_rvalid(out_dut[777:777]),
    .m_axi_awaddr(out_dut[776:553]),
    .m_axi_awprot(out_dut[552:532]),
    .m_axi_awvalid(out_dut[531:525]),
    .m_axi_wdata(out_dut[524:301]),
    .m_axi_wstrb(out_dut[300:273]),
    .m_axi_wvalid(out_dut[272:266]),
    .m_axi_bready(out_dut[265:259]),
    .m_axi_araddr(out_dut[258:35]),
    .m_axi_arprot(out_dut[34:14]),
    .m_axi_arvalid(out_dut[13:7]),
    .m_axi_rready(out_dut[6:0])
  );
  rtlpp_03357__ref ref_i (
    .aclk(clk),
    .aresetn(i_0),
    .s_axi_awaddr(i_1),
    .s_axi_awprot(i_2),
    .s_axi_awvalid(i_3),
    .s_axi_wdata(i_4),
    .s_axi_wstrb(i_5),
    .s_axi_wvalid(i_6),
    .s_axi_bready(i_7),
    .s_axi_araddr(i_8),
    .s_axi_arprot(i_9),
    .s_axi_arvalid(i_10),
    .s_axi_rready(i_11),
    .m_axi_awready(i_12),
    .m_axi_wready(i_13),
    .m_axi_bresp(i_14),
    .m_axi_bvalid(i_15),
    .m_axi_arready(i_16),
    .m_axi_rdata(i_17),
    .m_axi_rresp(i_18),
    .m_axi_rvalid(i_19),
    .s_axi_awready(out_ref[817:817]),
    .s_axi_wready(out_ref[816:816]),
    .s_axi_bresp(out_ref[815:814]),
    .s_axi_bvalid(out_ref[813:813]),
    .s_axi_arready(out_ref[812:812]),
    .s_axi_rdata(out_ref[811:780]),
    .s_axi_rresp(out_ref[779:778]),
    .s_axi_rvalid(out_ref[777:777]),
    .m_axi_awaddr(out_ref[776:553]),
    .m_axi_awprot(out_ref[552:532]),
    .m_axi_awvalid(out_ref[531:525]),
    .m_axi_wdata(out_ref[524:301]),
    .m_axi_wstrb(out_ref[300:273]),
    .m_axi_wvalid(out_ref[272:266]),
    .m_axi_bready(out_ref[265:259]),
    .m_axi_araddr(out_ref[258:35]),
    .m_axi_arprot(out_ref[34:14]),
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
    seed = 718017533;
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
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
