// Hidden tests: 5000 cycles of seeded random inputs (seed 3616839297); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 133;
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

  rtlpp_06429 dut (
    .aclk(clk),
    .aresetn(i_0),
    .S00_AXI_awid(i_1),
    .S00_AXI_awaddr(i_2),
    .S00_AXI_awlen(i_3),
    .S00_AXI_awsize(i_4),
    .S00_AXI_awburst(i_5),
    .S00_AXI_awlock(i_6),
    .S00_AXI_awcache(i_7),
    .S00_AXI_awprot(i_8),
    .S00_AXI_awqos(i_9),
    .S00_AXI_awvalid(i_10),
    .S00_AXI_wid(i_11),
    .S00_AXI_wdata(i_12),
    .S00_AXI_wstrb(i_13),
    .S00_AXI_wlast(i_14),
    .S00_AXI_wvalid(i_15),
    .S00_AXI_bready(i_16),
    .S00_AXI_arid(i_17),
    .S00_AXI_araddr(i_18),
    .S00_AXI_arlen(i_19),
    .S00_AXI_arsize(i_20),
    .S00_AXI_arburst(i_21),
    .S00_AXI_arlock(i_22),
    .S00_AXI_arcache(i_23),
    .S00_AXI_arprot(i_24),
    .S00_AXI_arqos(i_25),
    .S00_AXI_arvalid(i_26),
    .S00_AXI_rready(i_27),
    .M00_AXI_awready(i_28),
    .M00_AXI_wready(i_29),
    .M00_AXI_bresp(i_30),
    .M00_AXI_bvalid(i_31),
    .M00_AXI_arready(i_32),
    .M00_AXI_rdata(i_33),
    .M00_AXI_rresp(i_34),
    .M00_AXI_rvalid(i_35),
    .S00_AXI_awready(out_dut[132:132]),
    .S00_AXI_wready(out_dut[131:131]),
    .S00_AXI_bid(out_dut[130:119]),
    .S00_AXI_bresp(out_dut[118:117]),
    .S00_AXI_bvalid(out_dut[116:116]),
    .S00_AXI_arready(out_dut[115:115]),
    .S00_AXI_rid(out_dut[114:103]),
    .S00_AXI_rdata(out_dut[102:71]),
    .S00_AXI_rresp(out_dut[70:69]),
    .S00_AXI_rlast(out_dut[68:68]),
    .S00_AXI_rvalid(out_dut[67:67]),
    .M00_AXI_awaddr(out_dut[66:57]),
    .M00_AXI_awprot(out_dut[56:54]),
    .M00_AXI_awvalid(out_dut[53:53]),
    .M00_AXI_wdata(out_dut[52:21]),
    .M00_AXI_wstrb(out_dut[20:17]),
    .M00_AXI_wvalid(out_dut[16:16]),
    .M00_AXI_bready(out_dut[15:15]),
    .M00_AXI_araddr(out_dut[14:5]),
    .M00_AXI_arprot(out_dut[4:2]),
    .M00_AXI_arvalid(out_dut[1:1]),
    .M00_AXI_rready(out_dut[0:0])
  );
  rtlpp_06429__ref ref_i (
    .aclk(clk),
    .aresetn(i_0),
    .S00_AXI_awid(i_1),
    .S00_AXI_awaddr(i_2),
    .S00_AXI_awlen(i_3),
    .S00_AXI_awsize(i_4),
    .S00_AXI_awburst(i_5),
    .S00_AXI_awlock(i_6),
    .S00_AXI_awcache(i_7),
    .S00_AXI_awprot(i_8),
    .S00_AXI_awqos(i_9),
    .S00_AXI_awvalid(i_10),
    .S00_AXI_wid(i_11),
    .S00_AXI_wdata(i_12),
    .S00_AXI_wstrb(i_13),
    .S00_AXI_wlast(i_14),
    .S00_AXI_wvalid(i_15),
    .S00_AXI_bready(i_16),
    .S00_AXI_arid(i_17),
    .S00_AXI_araddr(i_18),
    .S00_AXI_arlen(i_19),
    .S00_AXI_arsize(i_20),
    .S00_AXI_arburst(i_21),
    .S00_AXI_arlock(i_22),
    .S00_AXI_arcache(i_23),
    .S00_AXI_arprot(i_24),
    .S00_AXI_arqos(i_25),
    .S00_AXI_arvalid(i_26),
    .S00_AXI_rready(i_27),
    .M00_AXI_awready(i_28),
    .M00_AXI_wready(i_29),
    .M00_AXI_bresp(i_30),
    .M00_AXI_bvalid(i_31),
    .M00_AXI_arready(i_32),
    .M00_AXI_rdata(i_33),
    .M00_AXI_rresp(i_34),
    .M00_AXI_rvalid(i_35),
    .S00_AXI_awready(out_ref[132:132]),
    .S00_AXI_wready(out_ref[131:131]),
    .S00_AXI_bid(out_ref[130:119]),
    .S00_AXI_bresp(out_ref[118:117]),
    .S00_AXI_bvalid(out_ref[116:116]),
    .S00_AXI_arready(out_ref[115:115]),
    .S00_AXI_rid(out_ref[114:103]),
    .S00_AXI_rdata(out_ref[102:71]),
    .S00_AXI_rresp(out_ref[70:69]),
    .S00_AXI_rlast(out_ref[68:68]),
    .S00_AXI_rvalid(out_ref[67:67]),
    .M00_AXI_awaddr(out_ref[66:57]),
    .M00_AXI_awprot(out_ref[56:54]),
    .M00_AXI_awvalid(out_ref[53:53]),
    .M00_AXI_wdata(out_ref[52:21]),
    .M00_AXI_wstrb(out_ref[20:17]),
    .M00_AXI_wvalid(out_ref[16:16]),
    .M00_AXI_bready(out_ref[15:15]),
    .M00_AXI_araddr(out_ref[14:5]),
    .M00_AXI_arprot(out_ref[4:2]),
    .M00_AXI_arvalid(out_ref[1:1]),
    .M00_AXI_rready(out_ref[0:0])
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
    seed = 3616839297;
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
