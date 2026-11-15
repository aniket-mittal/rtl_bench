// Hidden tests: 5000 cycles of seeded random inputs (seed 2045399334); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 167;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [9:0] i_4;
  reg [0:0] i_5;
  reg [31:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [9:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [31:0] i_12;
  reg [1:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_03972 dut (
    .s_axi_lite_aclk(i_0),
    .m_axi_mm2s_aclk(i_1),
    .axi_resetn(i_2),
    .s_axi_lite_awvalid(i_3),
    .s_axi_lite_awaddr(i_4),
    .s_axi_lite_wvalid(i_5),
    .s_axi_lite_wdata(i_6),
    .s_axi_lite_bready(i_7),
    .s_axi_lite_arvalid(i_8),
    .s_axi_lite_araddr(i_9),
    .s_axi_lite_rready(i_10),
    .m_axi_mm2s_arready(i_11),
    .m_axi_mm2s_rdata(i_12),
    .m_axi_mm2s_rresp(i_13),
    .m_axi_mm2s_rlast(i_14),
    .m_axi_mm2s_rvalid(i_15),
    .m_axis_mm2s_tready(i_16),
    .s_axi_lite_awready(out_dut[166:166]),
    .s_axi_lite_wready(out_dut[165:165]),
    .s_axi_lite_bresp(out_dut[164:163]),
    .s_axi_lite_bvalid(out_dut[162:162]),
    .s_axi_lite_arready(out_dut[161:161]),
    .s_axi_lite_rvalid(out_dut[160:160]),
    .s_axi_lite_rdata(out_dut[159:128]),
    .s_axi_lite_rresp(out_dut[127:126]),
    .m_axi_mm2s_araddr(out_dut[125:94]),
    .m_axi_mm2s_arlen(out_dut[93:86]),
    .m_axi_mm2s_arsize(out_dut[85:83]),
    .m_axi_mm2s_arburst(out_dut[82:81]),
    .m_axi_mm2s_arprot(out_dut[80:78]),
    .m_axi_mm2s_arcache(out_dut[77:74]),
    .m_axi_mm2s_arvalid(out_dut[73:73]),
    .m_axi_mm2s_rready(out_dut[72:72]),
    .mm2s_prmry_reset_out_n(out_dut[71:71]),
    .m_axis_mm2s_tdata(out_dut[70:39]),
    .m_axis_mm2s_tkeep(out_dut[38:35]),
    .m_axis_mm2s_tvalid(out_dut[34:34]),
    .m_axis_mm2s_tlast(out_dut[33:33]),
    .mm2s_introut(out_dut[32:32]),
    .axi_dma_tstvec(out_dut[31:0])
  );
  rtlpp_03972__ref ref_i (
    .s_axi_lite_aclk(i_0),
    .m_axi_mm2s_aclk(i_1),
    .axi_resetn(i_2),
    .s_axi_lite_awvalid(i_3),
    .s_axi_lite_awaddr(i_4),
    .s_axi_lite_wvalid(i_5),
    .s_axi_lite_wdata(i_6),
    .s_axi_lite_bready(i_7),
    .s_axi_lite_arvalid(i_8),
    .s_axi_lite_araddr(i_9),
    .s_axi_lite_rready(i_10),
    .m_axi_mm2s_arready(i_11),
    .m_axi_mm2s_rdata(i_12),
    .m_axi_mm2s_rresp(i_13),
    .m_axi_mm2s_rlast(i_14),
    .m_axi_mm2s_rvalid(i_15),
    .m_axis_mm2s_tready(i_16),
    .s_axi_lite_awready(out_ref[166:166]),
    .s_axi_lite_wready(out_ref[165:165]),
    .s_axi_lite_bresp(out_ref[164:163]),
    .s_axi_lite_bvalid(out_ref[162:162]),
    .s_axi_lite_arready(out_ref[161:161]),
    .s_axi_lite_rvalid(out_ref[160:160]),
    .s_axi_lite_rdata(out_ref[159:128]),
    .s_axi_lite_rresp(out_ref[127:126]),
    .m_axi_mm2s_araddr(out_ref[125:94]),
    .m_axi_mm2s_arlen(out_ref[93:86]),
    .m_axi_mm2s_arsize(out_ref[85:83]),
    .m_axi_mm2s_arburst(out_ref[82:81]),
    .m_axi_mm2s_arprot(out_ref[80:78]),
    .m_axi_mm2s_arcache(out_ref[77:74]),
    .m_axi_mm2s_arvalid(out_ref[73:73]),
    .m_axi_mm2s_rready(out_ref[72:72]),
    .mm2s_prmry_reset_out_n(out_ref[71:71]),
    .m_axis_mm2s_tdata(out_ref[70:39]),
    .m_axis_mm2s_tkeep(out_ref[38:35]),
    .m_axis_mm2s_tvalid(out_ref[34:34]),
    .m_axis_mm2s_tlast(out_ref[33:33]),
    .mm2s_introut(out_ref[32:32]),
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
    seed = 2045399334;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
