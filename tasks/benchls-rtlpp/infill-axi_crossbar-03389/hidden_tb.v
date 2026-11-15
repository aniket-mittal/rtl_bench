// Hidden tests: 5000 cycles of seeded random inputs (seed 1511911268); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 374;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [2:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [3:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [31:0] i_8;
  reg [2:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [2:0] i_12;
  reg [2:0] i_13;
  reg [5:0] i_14;
  reg [2:0] i_15;
  reg [2:0] i_16;
  reg [95:0] i_17;
  reg [5:0] i_18;
  reg [2:0] i_19;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_03389 dut (
    .aclk(clk),
    .aresetn(i_0),
    .s_axi_awaddr(i_1),
    .s_axi_awprot(i_2),
    .s_axi_awvalid(i_3),
    .s_axi_wdata(i_4),
    .s_axi_wstrb(i_5),
    .s_axi_wvalid(i_6),
    .s_axi_bready(i_7),
    .s_axi_araddr(i_8),
    .s_axi_arprot(i_9),
    .s_axi_arvalid(i_10),
    .s_axi_rready(i_11),
    .m_axi_awready(i_12),
    .m_axi_wready(i_13),
    .m_axi_bresp(i_14),
    .m_axi_bvalid(i_15),
    .m_axi_arready(i_16),
    .m_axi_rdata(i_17),
    .m_axi_rresp(i_18),
    .m_axi_rvalid(i_19),
    .s_axi_awready(out_dut[373:373]),
    .s_axi_wready(out_dut[372:372]),
    .s_axi_bresp(out_dut[371:370]),
    .s_axi_bvalid(out_dut[369:369]),
    .s_axi_arready(out_dut[368:368]),
    .s_axi_rdata(out_dut[367:336]),
    .s_axi_rresp(out_dut[335:334]),
    .s_axi_rvalid(out_dut[333:333]),
    .m_axi_awaddr(out_dut[332:237]),
    .m_axi_awprot(out_dut[236:228]),
    .m_axi_awvalid(out_dut[227:225]),
    .m_axi_wdata(out_dut[224:129]),
    .m_axi_wstrb(out_dut[128:117]),
    .m_axi_wvalid(out_dut[116:114]),
    .m_axi_bready(out_dut[113:111]),
    .m_axi_araddr(out_dut[110:15]),
    .m_axi_arprot(out_dut[14:6]),
    .m_axi_arvalid(out_dut[5:3]),
    .m_axi_rready(out_dut[2:0])
  );
  rtlpp_03389__ref ref_i (
    .aclk(clk),
    .aresetn(i_0),
    .s_axi_awaddr(i_1),
    .s_axi_awprot(i_2),
    .s_axi_awvalid(i_3),
    .s_axi_wdata(i_4),
    .s_axi_wstrb(i_5),
    .s_axi_wvalid(i_6),
    .s_axi_bready(i_7),
    .s_axi_araddr(i_8),
    .s_axi_arprot(i_9),
    .s_axi_arvalid(i_10),
    .s_axi_rready(i_11),
    .m_axi_awready(i_12),
    .m_axi_wready(i_13),
    .m_axi_bresp(i_14),
    .m_axi_bvalid(i_15),
    .m_axi_arready(i_16),
    .m_axi_rdata(i_17),
    .m_axi_rresp(i_18),
    .m_axi_rvalid(i_19),
    .s_axi_awready(out_ref[373:373]),
    .s_axi_wready(out_ref[372:372]),
    .s_axi_bresp(out_ref[371:370]),
    .s_axi_bvalid(out_ref[369:369]),
    .s_axi_arready(out_ref[368:368]),
    .s_axi_rdata(out_ref[367:336]),
    .s_axi_rresp(out_ref[335:334]),
    .s_axi_rvalid(out_ref[333:333]),
    .m_axi_awaddr(out_ref[332:237]),
    .m_axi_awprot(out_ref[236:228]),
    .m_axi_awvalid(out_ref[227:225]),
    .m_axi_wdata(out_ref[224:129]),
    .m_axi_wstrb(out_ref[128:117]),
    .m_axi_wvalid(out_ref[116:114]),
    .m_axi_bready(out_ref[113:111]),
    .m_axi_araddr(out_ref[110:15]),
    .m_axi_arprot(out_ref[14:6]),
    .m_axi_arvalid(out_ref[5:3]),
    .m_axi_rready(out_ref[2:0])
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
    seed = 1511911268;
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
      i_17 = {$random(seed), $random(seed), $random(seed)};
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
