// Hidden tests: 5000 cycles of seeded random inputs (seed 450299020); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 269;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [7:0] i_3;
  reg [2:0] i_4;
  reg [1:0] i_5;
  reg [0:0] i_6;
  reg [3:0] i_7;
  reg [2:0] i_8;
  reg [3:0] i_9;
  reg [3:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [63:0] i_13;
  reg [7:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  reg [0:0] i_19;
  reg [31:0] i_20;
  reg [7:0] i_21;
  reg [2:0] i_22;
  reg [1:0] i_23;
  reg [0:0] i_24;
  reg [3:0] i_25;
  reg [2:0] i_26;
  reg [3:0] i_27;
  reg [3:0] i_28;
  reg [0:0] i_29;
  reg [0:0] i_30;
  reg [0:0] i_31;
  reg [0:0] i_32;
  reg [0:0] i_33;
  reg [0:0] i_34;
  reg [1:0] i_35;
  reg [0:0] i_36;
  reg [0:0] i_37;
  reg [0:0] i_38;
  reg [63:0] i_39;
  reg [1:0] i_40;
  reg [0:0] i_41;
  reg [0:0] i_42;
  reg [0:0] i_43;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_01327 dut (
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
    .s_axi_awregion(i_9),
    .s_axi_awqos(i_10),
    .s_axi_awuser(i_11),
    .s_axi_awvalid(i_12),
    .s_axi_wdata(i_13),
    .s_axi_wstrb(i_14),
    .s_axi_wlast(i_15),
    .s_axi_wuser(i_16),
    .s_axi_wvalid(i_17),
    .s_axi_bready(i_18),
    .s_axi_arid(i_19),
    .s_axi_araddr(i_20),
    .s_axi_arlen(i_21),
    .s_axi_arsize(i_22),
    .s_axi_arburst(i_23),
    .s_axi_arlock(i_24),
    .s_axi_arcache(i_25),
    .s_axi_arprot(i_26),
    .s_axi_arregion(i_27),
    .s_axi_arqos(i_28),
    .s_axi_aruser(i_29),
    .s_axi_arvalid(i_30),
    .s_axi_rready(i_31),
    .m_axi_awready(i_32),
    .m_axi_wready(i_33),
    .m_axi_bid(i_34),
    .m_axi_bresp(i_35),
    .m_axi_bvalid(i_36),
    .m_axi_arready(i_37),
    .m_axi_rid(i_38),
    .m_axi_rdata(i_39),
    .m_axi_rresp(i_40),
    .m_axi_rlast(i_41),
    .m_axi_ruser(i_42),
    .m_axi_rvalid(i_43),
    .s_axi_awready(out_dut[268:268]),
    .s_axi_wready(out_dut[267:267]),
    .s_axi_bid(out_dut[266:266]),
    .s_axi_bresp(out_dut[265:264]),
    .s_axi_bvalid(out_dut[263:263]),
    .s_axi_arready(out_dut[262:262]),
    .s_axi_rid(out_dut[261:261]),
    .s_axi_rdata(out_dut[260:197]),
    .s_axi_rresp(out_dut[196:195]),
    .s_axi_rlast(out_dut[194:194]),
    .s_axi_ruser(out_dut[193:193]),
    .s_axi_rvalid(out_dut[192:192]),
    .m_axi_awid(out_dut[191:191]),
    .m_axi_awaddr(out_dut[190:159]),
    .m_axi_awlen(out_dut[158:155]),
    .m_axi_awsize(out_dut[154:152]),
    .m_axi_awburst(out_dut[151:150]),
    .m_axi_awlock(out_dut[149:148]),
    .m_axi_awcache(out_dut[147:144]),
    .m_axi_awprot(out_dut[143:141]),
    .m_axi_awqos(out_dut[140:137]),
    .m_axi_awuser(out_dut[136:136]),
    .m_axi_awvalid(out_dut[135:135]),
    .m_axi_wid(out_dut[134:134]),
    .m_axi_wdata(out_dut[133:70]),
    .m_axi_wstrb(out_dut[69:62]),
    .m_axi_wlast(out_dut[61:61]),
    .m_axi_wuser(out_dut[60:60]),
    .m_axi_wvalid(out_dut[59:59]),
    .m_axi_bready(out_dut[58:58]),
    .m_axi_arid(out_dut[57:57]),
    .m_axi_araddr(out_dut[56:25]),
    .m_axi_arlen(out_dut[24:21]),
    .m_axi_arsize(out_dut[20:18]),
    .m_axi_arburst(out_dut[17:16]),
    .m_axi_arlock(out_dut[15:14]),
    .m_axi_arcache(out_dut[13:10]),
    .m_axi_arprot(out_dut[9:7]),
    .m_axi_arqos(out_dut[6:3]),
    .m_axi_aruser(out_dut[2:2]),
    .m_axi_arvalid(out_dut[1:1]),
    .m_axi_rready(out_dut[0:0])
  );
  rtlpp_01327__ref ref_i (
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
    .s_axi_awregion(i_9),
    .s_axi_awqos(i_10),
    .s_axi_awuser(i_11),
    .s_axi_awvalid(i_12),
    .s_axi_wdata(i_13),
    .s_axi_wstrb(i_14),
    .s_axi_wlast(i_15),
    .s_axi_wuser(i_16),
    .s_axi_wvalid(i_17),
    .s_axi_bready(i_18),
    .s_axi_arid(i_19),
    .s_axi_araddr(i_20),
    .s_axi_arlen(i_21),
    .s_axi_arsize(i_22),
    .s_axi_arburst(i_23),
    .s_axi_arlock(i_24),
    .s_axi_arcache(i_25),
    .s_axi_arprot(i_26),
    .s_axi_arregion(i_27),
    .s_axi_arqos(i_28),
    .s_axi_aruser(i_29),
    .s_axi_arvalid(i_30),
    .s_axi_rready(i_31),
    .m_axi_awready(i_32),
    .m_axi_wready(i_33),
    .m_axi_bid(i_34),
    .m_axi_bresp(i_35),
    .m_axi_bvalid(i_36),
    .m_axi_arready(i_37),
    .m_axi_rid(i_38),
    .m_axi_rdata(i_39),
    .m_axi_rresp(i_40),
    .m_axi_rlast(i_41),
    .m_axi_ruser(i_42),
    .m_axi_rvalid(i_43),
    .s_axi_awready(out_ref[268:268]),
    .s_axi_wready(out_ref[267:267]),
    .s_axi_bid(out_ref[266:266]),
    .s_axi_bresp(out_ref[265:264]),
    .s_axi_bvalid(out_ref[263:263]),
    .s_axi_arready(out_ref[262:262]),
    .s_axi_rid(out_ref[261:261]),
    .s_axi_rdata(out_ref[260:197]),
    .s_axi_rresp(out_ref[196:195]),
    .s_axi_rlast(out_ref[194:194]),
    .s_axi_ruser(out_ref[193:193]),
    .s_axi_rvalid(out_ref[192:192]),
    .m_axi_awid(out_ref[191:191]),
    .m_axi_awaddr(out_ref[190:159]),
    .m_axi_awlen(out_ref[158:155]),
    .m_axi_awsize(out_ref[154:152]),
    .m_axi_awburst(out_ref[151:150]),
    .m_axi_awlock(out_ref[149:148]),
    .m_axi_awcache(out_ref[147:144]),
    .m_axi_awprot(out_ref[143:141]),
    .m_axi_awqos(out_ref[140:137]),
    .m_axi_awuser(out_ref[136:136]),
    .m_axi_awvalid(out_ref[135:135]),
    .m_axi_wid(out_ref[134:134]),
    .m_axi_wdata(out_ref[133:70]),
    .m_axi_wstrb(out_ref[69:62]),
    .m_axi_wlast(out_ref[61:61]),
    .m_axi_wuser(out_ref[60:60]),
    .m_axi_wvalid(out_ref[59:59]),
    .m_axi_bready(out_ref[58:58]),
    .m_axi_arid(out_ref[57:57]),
    .m_axi_araddr(out_ref[56:25]),
    .m_axi_arlen(out_ref[24:21]),
    .m_axi_arsize(out_ref[20:18]),
    .m_axi_arburst(out_ref[17:16]),
    .m_axi_arlock(out_ref[15:14]),
    .m_axi_arcache(out_ref[13:10]),
    .m_axi_arprot(out_ref[9:7]),
    .m_axi_arqos(out_ref[6:3]),
    .m_axi_aruser(out_ref[2:2]),
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
    seed = 450299020;
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
      i_13 = {$random(seed), $random(seed)};
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
      i_29 = {$random(seed)};
      i_30 = {$random(seed)};
      i_31 = {$random(seed)};
      i_32 = {$random(seed)};
      i_33 = {$random(seed)};
      i_34 = {$random(seed)};
      i_35 = {$random(seed)};
      i_36 = {$random(seed)};
      i_37 = {$random(seed)};
      i_38 = {$random(seed)};
      i_39 = {$random(seed), $random(seed)};
      i_40 = {$random(seed)};
      i_41 = {$random(seed)};
      i_42 = {$random(seed)};
      i_43 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
