// Hidden tests: 5000 cycles of seeded random inputs (seed 2801044851); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 172;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [10:0] i_2;
  reg [2:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  reg [3:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [10:0] i_9;
  reg [2:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [1:0] i_17;
  reg [0:0] i_18;
  reg [0:0] i_19;
  reg [31:0] i_20;
  reg [0:0] i_21;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_02861 dut (
    .s_axi_aclk(clk),
    .s_axi_aresetn(i_0),
    .s_axi_awvalid(i_1),
    .s_axi_awaddr(i_2),
    .s_axi_awprot(i_3),
    .s_axi_wvalid(i_4),
    .s_axi_wdata(i_5),
    .s_axi_wstrb(i_6),
    .s_axi_bready(i_7),
    .s_axi_arvalid(i_8),
    .s_axi_araddr(i_9),
    .s_axi_arprot(i_10),
    .s_axi_rready(i_11),
    .m_dest_axi_aclk(i_12),
    .m_dest_axi_aresetn(i_13),
    .m_dest_axi_awready(i_14),
    .m_dest_axi_wready(i_15),
    .m_dest_axi_bvalid(i_16),
    .m_dest_axi_bresp(i_17),
    .fifo_wr_clk(i_18),
    .fifo_wr_en(i_19),
    .fifo_wr_din(i_20),
    .fifo_wr_sync(i_21),
    .s_axi_awready(out_dut[171:171]),
    .s_axi_wready(out_dut[170:170]),
    .s_axi_bvalid(out_dut[169:169]),
    .s_axi_bresp(out_dut[168:167]),
    .s_axi_arready(out_dut[166:166]),
    .s_axi_rvalid(out_dut[165:165]),
    .s_axi_rresp(out_dut[164:163]),
    .s_axi_rdata(out_dut[162:131]),
    .irq(out_dut[130:130]),
    .m_dest_axi_awaddr(out_dut[129:98]),
    .m_dest_axi_awlen(out_dut[97:90]),
    .m_dest_axi_awsize(out_dut[89:87]),
    .m_dest_axi_awburst(out_dut[86:85]),
    .m_dest_axi_awprot(out_dut[84:82]),
    .m_dest_axi_awcache(out_dut[81:78]),
    .m_dest_axi_awvalid(out_dut[77:77]),
    .m_dest_axi_wdata(out_dut[76:13]),
    .m_dest_axi_wstrb(out_dut[12:5]),
    .m_dest_axi_wvalid(out_dut[4:4]),
    .m_dest_axi_wlast(out_dut[3:3]),
    .m_dest_axi_bready(out_dut[2:2]),
    .fifo_wr_overflow(out_dut[1:1]),
    .fifo_wr_xfer_req(out_dut[0:0])
  );
  rtlpp_02861__ref ref_i (
    .s_axi_aclk(clk),
    .s_axi_aresetn(i_0),
    .s_axi_awvalid(i_1),
    .s_axi_awaddr(i_2),
    .s_axi_awprot(i_3),
    .s_axi_wvalid(i_4),
    .s_axi_wdata(i_5),
    .s_axi_wstrb(i_6),
    .s_axi_bready(i_7),
    .s_axi_arvalid(i_8),
    .s_axi_araddr(i_9),
    .s_axi_arprot(i_10),
    .s_axi_rready(i_11),
    .m_dest_axi_aclk(i_12),
    .m_dest_axi_aresetn(i_13),
    .m_dest_axi_awready(i_14),
    .m_dest_axi_wready(i_15),
    .m_dest_axi_bvalid(i_16),
    .m_dest_axi_bresp(i_17),
    .fifo_wr_clk(i_18),
    .fifo_wr_en(i_19),
    .fifo_wr_din(i_20),
    .fifo_wr_sync(i_21),
    .s_axi_awready(out_ref[171:171]),
    .s_axi_wready(out_ref[170:170]),
    .s_axi_bvalid(out_ref[169:169]),
    .s_axi_bresp(out_ref[168:167]),
    .s_axi_arready(out_ref[166:166]),
    .s_axi_rvalid(out_ref[165:165]),
    .s_axi_rresp(out_ref[164:163]),
    .s_axi_rdata(out_ref[162:131]),
    .irq(out_ref[130:130]),
    .m_dest_axi_awaddr(out_ref[129:98]),
    .m_dest_axi_awlen(out_ref[97:90]),
    .m_dest_axi_awsize(out_ref[89:87]),
    .m_dest_axi_awburst(out_ref[86:85]),
    .m_dest_axi_awprot(out_ref[84:82]),
    .m_dest_axi_awcache(out_ref[81:78]),
    .m_dest_axi_awvalid(out_ref[77:77]),
    .m_dest_axi_wdata(out_ref[76:13]),
    .m_dest_axi_wstrb(out_ref[12:5]),
    .m_dest_axi_wvalid(out_ref[4:4]),
    .m_dest_axi_wlast(out_ref[3:3]),
    .m_dest_axi_bready(out_ref[2:2]),
    .fifo_wr_overflow(out_ref[1:1]),
    .fifo_wr_xfer_req(out_ref[0:0])
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
    seed = 2801044851;
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
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      i_21 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
