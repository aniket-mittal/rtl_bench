// Hidden tests: 5000 cycles of seeded random inputs (seed 2157972633); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 44;
  reg clk;
  reg [0:0] i_0;
  reg [3:0] i_1;
  reg [31:0] i_2;
  reg [7:0] i_3;
  reg [2:0] i_4;
  reg [1:0] i_5;
  reg [0:0] i_6;
  reg [3:0] i_7;
  reg [2:0] i_8;
  reg [3:0] i_9;
  reg [0:0] i_10;
  reg [31:0] i_11;
  reg [3:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [3:0] i_15;
  reg [1:0] i_16;
  reg [0:0] i_17;
  reg [3:0] i_18;
  reg [31:0] i_19;
  reg [7:0] i_20;
  reg [2:0] i_21;
  reg [1:0] i_22;
  reg [0:0] i_23;
  reg [3:0] i_24;
  reg [2:0] i_25;
  reg [3:0] i_26;
  reg [0:0] i_27;
  reg [0:0] i_28;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_124249 dut (
    .aclk(clk),
    .aresetn(i_0),
    .m_axi_awid(i_1),
    .m_axi_awaddr(i_2),
    .m_axi_awlen(i_3),
    .m_axi_awsize(i_4),
    .m_axi_awburst(i_5),
    .m_axi_awlock(i_6),
    .m_axi_awcache(i_7),
    .m_axi_awprot(i_8),
    .m_axi_awqos(i_9),
    .m_axi_awvalid(i_10),
    .m_axi_wdata(i_11),
    .m_axi_wstrb(i_12),
    .m_axi_wlast(i_13),
    .m_axi_wvalid(i_14),
    .m_axi_bid(i_15),
    .m_axi_bresp(i_16),
    .m_axi_bvalid(i_17),
    .m_axi_arid(i_18),
    .m_axi_araddr(i_19),
    .m_axi_arlen(i_20),
    .m_axi_arsize(i_21),
    .m_axi_arburst(i_22),
    .m_axi_arlock(i_23),
    .m_axi_arcache(i_24),
    .m_axi_arprot(i_25),
    .m_axi_arqos(i_26),
    .m_axi_arvalid(i_27),
    .m_axi_rready(i_28),
    .m_axi_awready(out_dut[43:43]),
    .m_axi_wready(out_dut[42:42]),
    .m_axi_bready(out_dut[41:41]),
    .m_axi_arready(out_dut[40:40]),
    .m_axi_rid(out_dut[39:36]),
    .m_axi_rdata(out_dut[35:4]),
    .m_axi_rresp(out_dut[3:2]),
    .m_axi_rlast(out_dut[1:1]),
    .m_axi_rvalid(out_dut[0:0])
  );
  origen_124249__ref ref_i (
    .aclk(clk),
    .aresetn(i_0),
    .m_axi_awid(i_1),
    .m_axi_awaddr(i_2),
    .m_axi_awlen(i_3),
    .m_axi_awsize(i_4),
    .m_axi_awburst(i_5),
    .m_axi_awlock(i_6),
    .m_axi_awcache(i_7),
    .m_axi_awprot(i_8),
    .m_axi_awqos(i_9),
    .m_axi_awvalid(i_10),
    .m_axi_wdata(i_11),
    .m_axi_wstrb(i_12),
    .m_axi_wlast(i_13),
    .m_axi_wvalid(i_14),
    .m_axi_bid(i_15),
    .m_axi_bresp(i_16),
    .m_axi_bvalid(i_17),
    .m_axi_arid(i_18),
    .m_axi_araddr(i_19),
    .m_axi_arlen(i_20),
    .m_axi_arsize(i_21),
    .m_axi_arburst(i_22),
    .m_axi_arlock(i_23),
    .m_axi_arcache(i_24),
    .m_axi_arprot(i_25),
    .m_axi_arqos(i_26),
    .m_axi_arvalid(i_27),
    .m_axi_rready(i_28),
    .m_axi_awready(out_ref[43:43]),
    .m_axi_wready(out_ref[42:42]),
    .m_axi_bready(out_ref[41:41]),
    .m_axi_arready(out_ref[40:40]),
    .m_axi_rid(out_ref[39:36]),
    .m_axi_rdata(out_ref[35:4]),
    .m_axi_rresp(out_ref[3:2]),
    .m_axi_rlast(out_ref[1:1]),
    .m_axi_rvalid(out_ref[0:0])
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
    seed = 2157972633;
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
      i_22 = {$random(seed)};
      i_23 = {$random(seed)};
      i_24 = {$random(seed)};
      i_25 = {$random(seed)};
      i_26 = {$random(seed)};
      i_27 = {$random(seed)};
      i_28 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
