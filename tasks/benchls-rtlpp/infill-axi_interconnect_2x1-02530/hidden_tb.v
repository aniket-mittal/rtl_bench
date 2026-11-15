// Hidden tests: 5000 cycles of seeded random inputs (seed 3386402347); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 300;
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
  reg [63:0] i_20;
  reg [7:0] i_21;
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

  rtlpp_02530 dut (
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
    .S00_AXI_arready(out_dut[299:299]),
    .S00_AXI_rdata(out_dut[298:235]),
    .S00_AXI_rresp(out_dut[234:233]),
    .S00_AXI_rlast(out_dut[232:232]),
    .S00_AXI_rvalid(out_dut[231:231]),
    .S01_AXI_awready(out_dut[230:230]),
    .S01_AXI_wready(out_dut[229:229]),
    .S01_AXI_bresp(out_dut[228:227]),
    .S01_AXI_bvalid(out_dut[226:226]),
    .M00_AXI_awaddr(out_dut[225:177]),
    .M00_AXI_awlen(out_dut[176:169]),
    .M00_AXI_awsize(out_dut[168:166]),
    .M00_AXI_awburst(out_dut[165:164]),
    .M00_AXI_awlock(out_dut[163:163]),
    .M00_AXI_awcache(out_dut[162:159]),
    .M00_AXI_awprot(out_dut[158:156]),
    .M00_AXI_awqos(out_dut[155:152]),
    .M00_AXI_awvalid(out_dut[151:151]),
    .M00_AXI_wdata(out_dut[150:87]),
    .M00_AXI_wstrb(out_dut[86:79]),
    .M00_AXI_wlast(out_dut[78:78]),
    .M00_AXI_wvalid(out_dut[77:77]),
    .M00_AXI_bready(out_dut[76:76]),
    .M00_AXI_araddr(out_dut[75:27]),
    .M00_AXI_arlen(out_dut[26:19]),
    .M00_AXI_arsize(out_dut[18:16]),
    .M00_AXI_arburst(out_dut[15:14]),
    .M00_AXI_arlock(out_dut[13:13]),
    .M00_AXI_arcache(out_dut[12:9]),
    .M00_AXI_arprot(out_dut[8:6]),
    .M00_AXI_arqos(out_dut[5:2]),
    .M00_AXI_arvalid(out_dut[1:1]),
    .M00_AXI_rready(out_dut[0:0])
  );
  rtlpp_02530__ref ref_i (
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
    .S00_AXI_arready(out_ref[299:299]),
    .S00_AXI_rdata(out_ref[298:235]),
    .S00_AXI_rresp(out_ref[234:233]),
    .S00_AXI_rlast(out_ref[232:232]),
    .S00_AXI_rvalid(out_ref[231:231]),
    .S01_AXI_awready(out_ref[230:230]),
    .S01_AXI_wready(out_ref[229:229]),
    .S01_AXI_bresp(out_ref[228:227]),
    .S01_AXI_bvalid(out_ref[226:226]),
    .M00_AXI_awaddr(out_ref[225:177]),
    .M00_AXI_awlen(out_ref[176:169]),
    .M00_AXI_awsize(out_ref[168:166]),
    .M00_AXI_awburst(out_ref[165:164]),
    .M00_AXI_awlock(out_ref[163:163]),
    .M00_AXI_awcache(out_ref[162:159]),
    .M00_AXI_awprot(out_ref[158:156]),
    .M00_AXI_awqos(out_ref[155:152]),
    .M00_AXI_awvalid(out_ref[151:151]),
    .M00_AXI_wdata(out_ref[150:87]),
    .M00_AXI_wstrb(out_ref[86:79]),
    .M00_AXI_wlast(out_ref[78:78]),
    .M00_AXI_wvalid(out_ref[77:77]),
    .M00_AXI_bready(out_ref[76:76]),
    .M00_AXI_araddr(out_ref[75:27]),
    .M00_AXI_arlen(out_ref[26:19]),
    .M00_AXI_arsize(out_ref[18:16]),
    .M00_AXI_arburst(out_ref[15:14]),
    .M00_AXI_arlock(out_ref[13:13]),
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
    seed = 3386402347;
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
      i_20 = {$random(seed), $random(seed)};
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
