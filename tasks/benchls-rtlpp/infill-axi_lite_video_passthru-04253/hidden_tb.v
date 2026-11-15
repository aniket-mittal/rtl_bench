// Hidden tests: 5000 cycles of seeded random inputs (seed 1105477135); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 88;
  reg clk;
  reg [12:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [3:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [12:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [31:0] i_11;
  reg [3:0] i_12;
  reg [3:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_04253 dut (
    .ap_clk(clk),
    .s_axi_CTRL_AWADDR(i_0),
    .s_axi_CTRL_AWVALID(i_1),
    .s_axi_CTRL_WDATA(i_2),
    .s_axi_CTRL_WSTRB(i_3),
    .s_axi_CTRL_WVALID(i_4),
    .s_axi_CTRL_BREADY(i_5),
    .s_axi_CTRL_ARADDR(i_6),
    .s_axi_CTRL_ARVALID(i_7),
    .s_axi_CTRL_RREADY(i_8),
    .ap_rst_n(i_9),
    .s_axis_video_TVALID(i_10),
    .s_axis_video_TDATA(i_11),
    .s_axis_video_TKEEP(i_12),
    .s_axis_video_TSTRB(i_13),
    .s_axis_video_TUSER(i_14),
    .s_axis_video_TLAST(i_15),
    .s_axis_video_TID(i_16),
    .s_axis_video_TDEST(i_17),
    .m_axis_video_TREADY(i_18),
    .s_axi_CTRL_AWREADY(out_dut[87:87]),
    .s_axi_CTRL_WREADY(out_dut[86:86]),
    .s_axi_CTRL_BRESP(out_dut[85:84]),
    .s_axi_CTRL_BVALID(out_dut[83:83]),
    .s_axi_CTRL_ARREADY(out_dut[82:82]),
    .s_axi_CTRL_RDATA(out_dut[81:50]),
    .s_axi_CTRL_RRESP(out_dut[49:48]),
    .s_axi_CTRL_RVALID(out_dut[47:47]),
    .interrupt(out_dut[46:46]),
    .s_axis_video_TREADY(out_dut[45:45]),
    .m_axis_video_TVALID(out_dut[44:44]),
    .m_axis_video_TDATA(out_dut[43:12]),
    .m_axis_video_TKEEP(out_dut[11:8]),
    .m_axis_video_TSTRB(out_dut[7:4]),
    .m_axis_video_TUSER(out_dut[3:3]),
    .m_axis_video_TLAST(out_dut[2:2]),
    .m_axis_video_TID(out_dut[1:1]),
    .m_axis_video_TDEST(out_dut[0:0])
  );
  rtlpp_04253__ref ref_i (
    .ap_clk(clk),
    .s_axi_CTRL_AWADDR(i_0),
    .s_axi_CTRL_AWVALID(i_1),
    .s_axi_CTRL_WDATA(i_2),
    .s_axi_CTRL_WSTRB(i_3),
    .s_axi_CTRL_WVALID(i_4),
    .s_axi_CTRL_BREADY(i_5),
    .s_axi_CTRL_ARADDR(i_6),
    .s_axi_CTRL_ARVALID(i_7),
    .s_axi_CTRL_RREADY(i_8),
    .ap_rst_n(i_9),
    .s_axis_video_TVALID(i_10),
    .s_axis_video_TDATA(i_11),
    .s_axis_video_TKEEP(i_12),
    .s_axis_video_TSTRB(i_13),
    .s_axis_video_TUSER(i_14),
    .s_axis_video_TLAST(i_15),
    .s_axis_video_TID(i_16),
    .s_axis_video_TDEST(i_17),
    .m_axis_video_TREADY(i_18),
    .s_axi_CTRL_AWREADY(out_ref[87:87]),
    .s_axi_CTRL_WREADY(out_ref[86:86]),
    .s_axi_CTRL_BRESP(out_ref[85:84]),
    .s_axi_CTRL_BVALID(out_ref[83:83]),
    .s_axi_CTRL_ARREADY(out_ref[82:82]),
    .s_axi_CTRL_RDATA(out_ref[81:50]),
    .s_axi_CTRL_RRESP(out_ref[49:48]),
    .s_axi_CTRL_RVALID(out_ref[47:47]),
    .interrupt(out_ref[46:46]),
    .s_axis_video_TREADY(out_ref[45:45]),
    .m_axis_video_TVALID(out_ref[44:44]),
    .m_axis_video_TDATA(out_ref[43:12]),
    .m_axis_video_TKEEP(out_ref[11:8]),
    .m_axis_video_TSTRB(out_ref[7:4]),
    .m_axis_video_TUSER(out_ref[3:3]),
    .m_axis_video_TLAST(out_ref[2:2]),
    .m_axis_video_TID(out_ref[1:1]),
    .m_axis_video_TDEST(out_ref[0:0])
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
    seed = 1105477135;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
