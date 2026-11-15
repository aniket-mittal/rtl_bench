// Hidden tests: 5000 cycles of seeded random inputs (seed 1247569621); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 228;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [7:0] i_2;
  reg [2:0] i_3;
  reg [1:0] i_4;
  reg [0:0] i_5;
  reg [3:0] i_6;
  reg [2:0] i_7;
  reg [3:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [31:0] i_11;
  reg [7:0] i_12;
  reg [2:0] i_13;
  reg [1:0] i_14;
  reg [0:0] i_15;
  reg [3:0] i_16;
  reg [2:0] i_17;
  reg [3:0] i_18;
  reg [0:0] i_19;
  reg [31:0] i_20;
  reg [3:0] i_21;
  reg [0:0] i_22;
  reg [0:0] i_23;
  reg [0:0] i_24;
  reg [0:0] i_25;
  reg [0:0] i_26;
  reg [1:0] i_27;
  reg [0:0] i_28;
  reg [0:0] i_29;
  reg [63:0] i_30;
  reg [1:0] i_31;
  reg [0:0] i_32;
  reg [0:0] i_33;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_03019 dut (
    .aclk(clk),
    .aresetn(i_0),
    .S00_AXI_araddr(i_1),
    .S00_AXI_arlen(i_2),
    .S00_AXI_arsize(i_3),
    .S00_AXI_arburst(i_4),
    .S00_AXI_arlock(i_5),
    .S00_AXI_arcache(i_6),
    .S00_AXI_arprot(i_7),
    .S00_AXI_arqos(i_8),
    .S00_AXI_arvalid(i_9),
    .S00_AXI_rready(i_10),
    .S01_AXI_awaddr(i_11),
    .S01_AXI_awlen(i_12),
    .S01_AXI_awsize(i_13),
    .S01_AXI_awburst(i_14),
    .S01_AXI_awlock(i_15),
    .S01_AXI_awcache(i_16),
    .S01_AXI_awprot(i_17),
    .S01_AXI_awqos(i_18),
    .S01_AXI_awvalid(i_19),
    .S01_AXI_wdata(i_20),
    .S01_AXI_wstrb(i_21),
    .S01_AXI_wlast(i_22),
    .S01_AXI_wvalid(i_23),
    .S01_AXI_bready(i_24),
    .M00_AXI_awready(i_25),
    .M00_AXI_wready(i_26),
    .M00_AXI_bresp(i_27),
    .M00_AXI_bvalid(i_28),
    .M00_AXI_arready(i_29),
    .M00_AXI_rdata(i_30),
    .M00_AXI_rresp(i_31),
    .M00_AXI_rlast(i_32),
    .M00_AXI_rvalid(i_33),
    .S00_AXI_arready(out_dut[227:227]),
    .S00_AXI_rdata(out_dut[226:195]),
    .S00_AXI_rresp(out_dut[194:193]),
    .S00_AXI_rlast(out_dut[192:192]),
    .S00_AXI_rvalid(out_dut[191:191]),
    .S01_AXI_awready(out_dut[190:190]),
    .S01_AXI_wready(out_dut[189:189]),
    .S01_AXI_bresp(out_dut[188:187]),
    .S01_AXI_bvalid(out_dut[186:186]),
    .M00_AXI_awaddr(out_dut[185:154]),
    .M00_AXI_awlen(out_dut[153:150]),
    .M00_AXI_awsize(out_dut[149:147]),
    .M00_AXI_awburst(out_dut[146:145]),
    .M00_AXI_awlock(out_dut[144:143]),
    .M00_AXI_awcache(out_dut[142:139]),
    .M00_AXI_awprot(out_dut[138:136]),
    .M00_AXI_awqos(out_dut[135:132]),
    .M00_AXI_awvalid(out_dut[131:131]),
    .M00_AXI_wdata(out_dut[130:67]),
    .M00_AXI_wstrb(out_dut[66:59]),
    .M00_AXI_wlast(out_dut[58:58]),
    .M00_AXI_wvalid(out_dut[57:57]),
    .M00_AXI_bready(out_dut[56:56]),
    .M00_AXI_araddr(out_dut[55:24]),
    .M00_AXI_arlen(out_dut[23:20]),
    .M00_AXI_arsize(out_dut[19:17]),
    .M00_AXI_arburst(out_dut[16:15]),
    .M00_AXI_arlock(out_dut[14:13]),
    .M00_AXI_arcache(out_dut[12:9]),
    .M00_AXI_arprot(out_dut[8:6]),
    .M00_AXI_arqos(out_dut[5:2]),
    .M00_AXI_arvalid(out_dut[1:1]),
    .M00_AXI_rready(out_dut[0:0])
  );
  rtlpp_03019__ref ref_i (
    .aclk(clk),
    .aresetn(i_0),
    .S00_AXI_araddr(i_1),
    .S00_AXI_arlen(i_2),
    .S00_AXI_arsize(i_3),
    .S00_AXI_arburst(i_4),
    .S00_AXI_arlock(i_5),
    .S00_AXI_arcache(i_6),
    .S00_AXI_arprot(i_7),
    .S00_AXI_arqos(i_8),
    .S00_AXI_arvalid(i_9),
    .S00_AXI_rready(i_10),
    .S01_AXI_awaddr(i_11),
    .S01_AXI_awlen(i_12),
    .S01_AXI_awsize(i_13),
    .S01_AXI_awburst(i_14),
    .S01_AXI_awlock(i_15),
    .S01_AXI_awcache(i_16),
    .S01_AXI_awprot(i_17),
    .S01_AXI_awqos(i_18),
    .S01_AXI_awvalid(i_19),
    .S01_AXI_wdata(i_20),
    .S01_AXI_wstrb(i_21),
    .S01_AXI_wlast(i_22),
    .S01_AXI_wvalid(i_23),
    .S01_AXI_bready(i_24),
    .M00_AXI_awready(i_25),
    .M00_AXI_wready(i_26),
    .M00_AXI_bresp(i_27),
    .M00_AXI_bvalid(i_28),
    .M00_AXI_arready(i_29),
    .M00_AXI_rdata(i_30),
    .M00_AXI_rresp(i_31),
    .M00_AXI_rlast(i_32),
    .M00_AXI_rvalid(i_33),
    .S00_AXI_arready(out_ref[227:227]),
    .S00_AXI_rdata(out_ref[226:195]),
    .S00_AXI_rresp(out_ref[194:193]),
    .S00_AXI_rlast(out_ref[192:192]),
    .S00_AXI_rvalid(out_ref[191:191]),
    .S01_AXI_awready(out_ref[190:190]),
    .S01_AXI_wready(out_ref[189:189]),
    .S01_AXI_bresp(out_ref[188:187]),
    .S01_AXI_bvalid(out_ref[186:186]),
    .M00_AXI_awaddr(out_ref[185:154]),
    .M00_AXI_awlen(out_ref[153:150]),
    .M00_AXI_awsize(out_ref[149:147]),
    .M00_AXI_awburst(out_ref[146:145]),
    .M00_AXI_awlock(out_ref[144:143]),
    .M00_AXI_awcache(out_ref[142:139]),
    .M00_AXI_awprot(out_ref[138:136]),
    .M00_AXI_awqos(out_ref[135:132]),
    .M00_AXI_awvalid(out_ref[131:131]),
    .M00_AXI_wdata(out_ref[130:67]),
    .M00_AXI_wstrb(out_ref[66:59]),
    .M00_AXI_wlast(out_ref[58:58]),
    .M00_AXI_wvalid(out_ref[57:57]),
    .M00_AXI_bready(out_ref[56:56]),
    .M00_AXI_araddr(out_ref[55:24]),
    .M00_AXI_arlen(out_ref[23:20]),
    .M00_AXI_arsize(out_ref[19:17]),
    .M00_AXI_arburst(out_ref[16:15]),
    .M00_AXI_arlock(out_ref[14:13]),
    .M00_AXI_arcache(out_ref[12:9]),
    .M00_AXI_arprot(out_ref[8:6]),
    .M00_AXI_arqos(out_ref[5:2]),
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
    seed = 1247569621;
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
      i_30 = {$random(seed), $random(seed)};
      i_31 = {$random(seed)};
      i_32 = {$random(seed)};
      i_33 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
