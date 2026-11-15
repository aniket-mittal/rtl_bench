// Hidden tests: 5000 cycles of seeded random inputs (seed 1566548950); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 1151;
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
  reg [9:0] i_12;
  reg [9:0] i_13;
  reg [19:0] i_14;
  reg [9:0] i_15;
  reg [9:0] i_16;
  reg [319:0] i_17;
  reg [19:0] i_18;
  reg [9:0] i_19;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_03585 dut (
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
    .s_axi_awready(out_dut[1150:1150]),
    .s_axi_wready(out_dut[1149:1149]),
    .s_axi_bresp(out_dut[1148:1147]),
    .s_axi_bvalid(out_dut[1146:1146]),
    .s_axi_arready(out_dut[1145:1145]),
    .s_axi_rdata(out_dut[1144:1113]),
    .s_axi_rresp(out_dut[1112:1111]),
    .s_axi_rvalid(out_dut[1110:1110]),
    .m_axi_awaddr(out_dut[1109:790]),
    .m_axi_awprot(out_dut[789:760]),
    .m_axi_awvalid(out_dut[759:750]),
    .m_axi_wdata(out_dut[749:430]),
    .m_axi_wstrb(out_dut[429:390]),
    .m_axi_wvalid(out_dut[389:380]),
    .m_axi_bready(out_dut[379:370]),
    .m_axi_araddr(out_dut[369:50]),
    .m_axi_arprot(out_dut[49:20]),
    .m_axi_arvalid(out_dut[19:10]),
    .m_axi_rready(out_dut[9:0])
  );
  rtlpp_03585__ref ref_i (
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
    .s_axi_awready(out_ref[1150:1150]),
    .s_axi_wready(out_ref[1149:1149]),
    .s_axi_bresp(out_ref[1148:1147]),
    .s_axi_bvalid(out_ref[1146:1146]),
    .s_axi_arready(out_ref[1145:1145]),
    .s_axi_rdata(out_ref[1144:1113]),
    .s_axi_rresp(out_ref[1112:1111]),
    .s_axi_rvalid(out_ref[1110:1110]),
    .m_axi_awaddr(out_ref[1109:790]),
    .m_axi_awprot(out_ref[789:760]),
    .m_axi_awvalid(out_ref[759:750]),
    .m_axi_wdata(out_ref[749:430]),
    .m_axi_wstrb(out_ref[429:390]),
    .m_axi_wvalid(out_ref[389:380]),
    .m_axi_bready(out_ref[379:370]),
    .m_axi_araddr(out_ref[369:50]),
    .m_axi_arprot(out_ref[49:20]),
    .m_axi_arvalid(out_ref[19:10]),
    .m_axi_rready(out_ref[9:0])
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
    seed = 1566548950;
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
      i_17 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
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
