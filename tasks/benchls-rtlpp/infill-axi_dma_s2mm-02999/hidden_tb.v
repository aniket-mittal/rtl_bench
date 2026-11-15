// Hidden tests: 5000 cycles of seeded random inputs (seed 4293223864); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 177;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [8:0] i_4;
  reg [0:0] i_5;
  reg [31:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [8:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [1:0] i_13;
  reg [0:0] i_14;
  reg [23:0] i_15;
  reg [2:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  reg [0:0] i_19;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_02999 dut (
    .s_axi_lite_aclk(clk),
    .m_axi_s2mm_aclk(i_0),
    .s_axis_s2mm_aclk(i_1),
    .axi_resetn(i_2),
    .s_axi_lite_awvalid(i_3),
    .s_axi_lite_awaddr(i_4),
    .s_axi_lite_wvalid(i_5),
    .s_axi_lite_wdata(i_6),
    .s_axi_lite_bready(i_7),
    .s_axi_lite_arvalid(i_8),
    .s_axi_lite_araddr(i_9),
    .s_axi_lite_rready(i_10),
    .m_axi_s2mm_awready(i_11),
    .m_axi_s2mm_wready(i_12),
    .m_axi_s2mm_bresp(i_13),
    .m_axi_s2mm_bvalid(i_14),
    .s_axis_s2mm_tdata(i_15),
    .s_axis_s2mm_tkeep(i_16),
    .s_axis_s2mm_tuser(i_17),
    .s_axis_s2mm_tvalid(i_18),
    .s_axis_s2mm_tlast(i_19),
    .s_axi_lite_awready(out_dut[176:176]),
    .s_axi_lite_wready(out_dut[175:175]),
    .s_axi_lite_bresp(out_dut[174:173]),
    .s_axi_lite_bvalid(out_dut[172:172]),
    .s_axi_lite_arready(out_dut[171:171]),
    .s_axi_lite_rvalid(out_dut[170:170]),
    .s_axi_lite_rdata(out_dut[169:138]),
    .s_axi_lite_rresp(out_dut[137:136]),
    .s2mm_frame_ptr_out(out_dut[135:130]),
    .m_axi_s2mm_awaddr(out_dut[129:98]),
    .m_axi_s2mm_awlen(out_dut[97:90]),
    .m_axi_s2mm_awsize(out_dut[89:87]),
    .m_axi_s2mm_awburst(out_dut[86:85]),
    .m_axi_s2mm_awprot(out_dut[84:82]),
    .m_axi_s2mm_awcache(out_dut[81:78]),
    .m_axi_s2mm_awvalid(out_dut[77:77]),
    .m_axi_s2mm_wdata(out_dut[76:13]),
    .m_axi_s2mm_wstrb(out_dut[12:5]),
    .m_axi_s2mm_wlast(out_dut[4:4]),
    .m_axi_s2mm_wvalid(out_dut[3:3]),
    .m_axi_s2mm_bready(out_dut[2:2]),
    .s_axis_s2mm_tready(out_dut[1:1]),
    .s2mm_introut(out_dut[0:0])
  );
  rtlpp_02999__ref ref_i (
    .s_axi_lite_aclk(clk),
    .m_axi_s2mm_aclk(i_0),
    .s_axis_s2mm_aclk(i_1),
    .axi_resetn(i_2),
    .s_axi_lite_awvalid(i_3),
    .s_axi_lite_awaddr(i_4),
    .s_axi_lite_wvalid(i_5),
    .s_axi_lite_wdata(i_6),
    .s_axi_lite_bready(i_7),
    .s_axi_lite_arvalid(i_8),
    .s_axi_lite_araddr(i_9),
    .s_axi_lite_rready(i_10),
    .m_axi_s2mm_awready(i_11),
    .m_axi_s2mm_wready(i_12),
    .m_axi_s2mm_bresp(i_13),
    .m_axi_s2mm_bvalid(i_14),
    .s_axis_s2mm_tdata(i_15),
    .s_axis_s2mm_tkeep(i_16),
    .s_axis_s2mm_tuser(i_17),
    .s_axis_s2mm_tvalid(i_18),
    .s_axis_s2mm_tlast(i_19),
    .s_axi_lite_awready(out_ref[176:176]),
    .s_axi_lite_wready(out_ref[175:175]),
    .s_axi_lite_bresp(out_ref[174:173]),
    .s_axi_lite_bvalid(out_ref[172:172]),
    .s_axi_lite_arready(out_ref[171:171]),
    .s_axi_lite_rvalid(out_ref[170:170]),
    .s_axi_lite_rdata(out_ref[169:138]),
    .s_axi_lite_rresp(out_ref[137:136]),
    .s2mm_frame_ptr_out(out_ref[135:130]),
    .m_axi_s2mm_awaddr(out_ref[129:98]),
    .m_axi_s2mm_awlen(out_ref[97:90]),
    .m_axi_s2mm_awsize(out_ref[89:87]),
    .m_axi_s2mm_awburst(out_ref[86:85]),
    .m_axi_s2mm_awprot(out_ref[84:82]),
    .m_axi_s2mm_awcache(out_ref[81:78]),
    .m_axi_s2mm_awvalid(out_ref[77:77]),
    .m_axi_s2mm_wdata(out_ref[76:13]),
    .m_axi_s2mm_wstrb(out_ref[12:5]),
    .m_axi_s2mm_wlast(out_ref[4:4]),
    .m_axi_s2mm_wvalid(out_ref[3:3]),
    .m_axi_s2mm_bready(out_ref[2:2]),
    .s_axis_s2mm_tready(out_ref[1:1]),
    .s2mm_introut(out_ref[0:0])
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
    seed = 4293223864;
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
      i_17 = {$random(seed)};
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
