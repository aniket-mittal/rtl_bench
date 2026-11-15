// Hidden tests: 5000 cycles of seeded random inputs (seed 271209403); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 177;
  reg clk;
  reg [0:0] i_0;
  reg [11:0] i_1;
  reg [31:0] i_2;
  reg [3:0] i_3;
  reg [2:0] i_4;
  reg [1:0] i_5;
  reg [1:0] i_6;
  reg [3:0] i_7;
  reg [2:0] i_8;
  reg [3:0] i_9;
  reg [0:0] i_10;
  reg [11:0] i_11;
  reg [31:0] i_12;
  reg [3:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [11:0] i_17;
  reg [31:0] i_18;
  reg [3:0] i_19;
  reg [2:0] i_20;
  reg [1:0] i_21;
  reg [1:0] i_22;
  reg [3:0] i_23;
  reg [2:0] i_24;
  reg [3:0] i_25;
  reg [0:0] i_26;
  reg [0:0] i_27;
  reg [0:0] i_28;
  reg [0:0] i_29;
  reg [1:0] i_30;
  reg [0:0] i_31;
  reg [0:0] i_32;
  reg [31:0] i_33;
  reg [1:0] i_34;
  reg [0:0] i_35;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_06485 dut (
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
    .s_axi_wid(i_11),
    .s_axi_wdata(i_12),
    .s_axi_wstrb(i_13),
    .s_axi_wlast(i_14),
    .s_axi_wvalid(i_15),
    .s_axi_bready(i_16),
    .s_axi_arid(i_17),
    .s_axi_araddr(i_18),
    .s_axi_arlen(i_19),
    .s_axi_arsize(i_20),
    .s_axi_arburst(i_21),
    .s_axi_arlock(i_22),
    .s_axi_arcache(i_23),
    .s_axi_arprot(i_24),
    .s_axi_arqos(i_25),
    .s_axi_arvalid(i_26),
    .s_axi_rready(i_27),
    .m_axi_awready(i_28),
    .m_axi_wready(i_29),
    .m_axi_bresp(i_30),
    .m_axi_bvalid(i_31),
    .m_axi_arready(i_32),
    .m_axi_rdata(i_33),
    .m_axi_rresp(i_34),
    .m_axi_rvalid(i_35),
    .s_axi_awready(out_dut[176:176]),
    .s_axi_wready(out_dut[175:175]),
    .s_axi_bid(out_dut[174:163]),
    .s_axi_bresp(out_dut[162:161]),
    .s_axi_bvalid(out_dut[160:160]),
    .s_axi_arready(out_dut[159:159]),
    .s_axi_rid(out_dut[158:147]),
    .s_axi_rdata(out_dut[146:115]),
    .s_axi_rresp(out_dut[114:113]),
    .s_axi_rlast(out_dut[112:112]),
    .s_axi_rvalid(out_dut[111:111]),
    .m_axi_awaddr(out_dut[110:79]),
    .m_axi_awprot(out_dut[78:76]),
    .m_axi_awvalid(out_dut[75:75]),
    .m_axi_wdata(out_dut[74:43]),
    .m_axi_wstrb(out_dut[42:39]),
    .m_axi_wvalid(out_dut[38:38]),
    .m_axi_bready(out_dut[37:37]),
    .m_axi_araddr(out_dut[36:5]),
    .m_axi_arprot(out_dut[4:2]),
    .m_axi_arvalid(out_dut[1:1]),
    .m_axi_rready(out_dut[0:0])
  );
  rtlpp_06485__ref ref_i (
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
    .s_axi_wid(i_11),
    .s_axi_wdata(i_12),
    .s_axi_wstrb(i_13),
    .s_axi_wlast(i_14),
    .s_axi_wvalid(i_15),
    .s_axi_bready(i_16),
    .s_axi_arid(i_17),
    .s_axi_araddr(i_18),
    .s_axi_arlen(i_19),
    .s_axi_arsize(i_20),
    .s_axi_arburst(i_21),
    .s_axi_arlock(i_22),
    .s_axi_arcache(i_23),
    .s_axi_arprot(i_24),
    .s_axi_arqos(i_25),
    .s_axi_arvalid(i_26),
    .s_axi_rready(i_27),
    .m_axi_awready(i_28),
    .m_axi_wready(i_29),
    .m_axi_bresp(i_30),
    .m_axi_bvalid(i_31),
    .m_axi_arready(i_32),
    .m_axi_rdata(i_33),
    .m_axi_rresp(i_34),
    .m_axi_rvalid(i_35),
    .s_axi_awready(out_ref[176:176]),
    .s_axi_wready(out_ref[175:175]),
    .s_axi_bid(out_ref[174:163]),
    .s_axi_bresp(out_ref[162:161]),
    .s_axi_bvalid(out_ref[160:160]),
    .s_axi_arready(out_ref[159:159]),
    .s_axi_rid(out_ref[158:147]),
    .s_axi_rdata(out_ref[146:115]),
    .s_axi_rresp(out_ref[114:113]),
    .s_axi_rlast(out_ref[112:112]),
    .s_axi_rvalid(out_ref[111:111]),
    .m_axi_awaddr(out_ref[110:79]),
    .m_axi_awprot(out_ref[78:76]),
    .m_axi_awvalid(out_ref[75:75]),
    .m_axi_wdata(out_ref[74:43]),
    .m_axi_wstrb(out_ref[42:39]),
    .m_axi_wvalid(out_ref[38:38]),
    .m_axi_bready(out_ref[37:37]),
    .m_axi_araddr(out_ref[36:5]),
    .m_axi_arprot(out_ref[4:2]),
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
    seed = 271209403;
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
      i_29 = {$random(seed)};
      i_30 = {$random(seed)};
      i_31 = {$random(seed)};
      i_32 = {$random(seed)};
      i_33 = {$random(seed)};
      i_34 = {$random(seed)};
      i_35 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
