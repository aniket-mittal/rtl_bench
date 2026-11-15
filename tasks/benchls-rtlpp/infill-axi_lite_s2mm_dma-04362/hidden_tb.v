// Hidden tests: 5000 cycles of seeded random inputs (seed 1377510692); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 168;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [9:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [9:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [1:0] i_12;
  reg [0:0] i_13;
  reg [31:0] i_14;
  reg [3:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_04362 dut (
    .s_axi_lite_aclk(clk),
    .m_axi_s2mm_aclk(i_0),
    .axi_resetn(i_1),
    .s_axi_lite_awvalid(i_2),
    .s_axi_lite_awaddr(i_3),
    .s_axi_lite_wvalid(i_4),
    .s_axi_lite_wdata(i_5),
    .s_axi_lite_bready(i_6),
    .s_axi_lite_arvalid(i_7),
    .s_axi_lite_araddr(i_8),
    .s_axi_lite_rready(i_9),
    .m_axi_s2mm_awready(i_10),
    .m_axi_s2mm_wready(i_11),
    .m_axi_s2mm_bresp(i_12),
    .m_axi_s2mm_bvalid(i_13),
    .s_axis_s2mm_tdata(i_14),
    .s_axis_s2mm_tkeep(i_15),
    .s_axis_s2mm_tvalid(i_16),
    .s_axis_s2mm_tlast(i_17),
    .s_axi_lite_awready(out_dut[167:167]),
    .s_axi_lite_wready(out_dut[166:166]),
    .s_axi_lite_bresp(out_dut[165:164]),
    .s_axi_lite_bvalid(out_dut[163:163]),
    .s_axi_lite_arready(out_dut[162:162]),
    .s_axi_lite_rvalid(out_dut[161:161]),
    .s_axi_lite_rdata(out_dut[160:129]),
    .s_axi_lite_rresp(out_dut[128:127]),
    .m_axi_s2mm_awaddr(out_dut[126:95]),
    .m_axi_s2mm_awlen(out_dut[94:87]),
    .m_axi_s2mm_awsize(out_dut[86:84]),
    .m_axi_s2mm_awburst(out_dut[83:82]),
    .m_axi_s2mm_awprot(out_dut[81:79]),
    .m_axi_s2mm_awcache(out_dut[78:75]),
    .m_axi_s2mm_awvalid(out_dut[74:74]),
    .m_axi_s2mm_wdata(out_dut[73:42]),
    .m_axi_s2mm_wstrb(out_dut[41:38]),
    .m_axi_s2mm_wlast(out_dut[37:37]),
    .m_axi_s2mm_wvalid(out_dut[36:36]),
    .m_axi_s2mm_bready(out_dut[35:35]),
    .s2mm_prmry_reset_out_n(out_dut[34:34]),
    .s_axis_s2mm_tready(out_dut[33:33]),
    .s2mm_introut(out_dut[32:32]),
    .axi_dma_tstvec(out_dut[31:0])
  );
  rtlpp_04362__ref ref_i (
    .s_axi_lite_aclk(clk),
    .m_axi_s2mm_aclk(i_0),
    .axi_resetn(i_1),
    .s_axi_lite_awvalid(i_2),
    .s_axi_lite_awaddr(i_3),
    .s_axi_lite_wvalid(i_4),
    .s_axi_lite_wdata(i_5),
    .s_axi_lite_bready(i_6),
    .s_axi_lite_arvalid(i_7),
    .s_axi_lite_araddr(i_8),
    .s_axi_lite_rready(i_9),
    .m_axi_s2mm_awready(i_10),
    .m_axi_s2mm_wready(i_11),
    .m_axi_s2mm_bresp(i_12),
    .m_axi_s2mm_bvalid(i_13),
    .s_axis_s2mm_tdata(i_14),
    .s_axis_s2mm_tkeep(i_15),
    .s_axis_s2mm_tvalid(i_16),
    .s_axis_s2mm_tlast(i_17),
    .s_axi_lite_awready(out_ref[167:167]),
    .s_axi_lite_wready(out_ref[166:166]),
    .s_axi_lite_bresp(out_ref[165:164]),
    .s_axi_lite_bvalid(out_ref[163:163]),
    .s_axi_lite_arready(out_ref[162:162]),
    .s_axi_lite_rvalid(out_ref[161:161]),
    .s_axi_lite_rdata(out_ref[160:129]),
    .s_axi_lite_rresp(out_ref[128:127]),
    .m_axi_s2mm_awaddr(out_ref[126:95]),
    .m_axi_s2mm_awlen(out_ref[94:87]),
    .m_axi_s2mm_awsize(out_ref[86:84]),
    .m_axi_s2mm_awburst(out_ref[83:82]),
    .m_axi_s2mm_awprot(out_ref[81:79]),
    .m_axi_s2mm_awcache(out_ref[78:75]),
    .m_axi_s2mm_awvalid(out_ref[74:74]),
    .m_axi_s2mm_wdata(out_ref[73:42]),
    .m_axi_s2mm_wstrb(out_ref[41:38]),
    .m_axi_s2mm_wlast(out_ref[37:37]),
    .m_axi_s2mm_wvalid(out_ref[36:36]),
    .m_axi_s2mm_bready(out_ref[35:35]),
    .s2mm_prmry_reset_out_n(out_ref[34:34]),
    .s_axis_s2mm_tready(out_ref[33:33]),
    .s2mm_introut(out_ref[32:32]),
    .axi_dma_tstvec(out_ref[31:0])
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
    seed = 1377510692;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
