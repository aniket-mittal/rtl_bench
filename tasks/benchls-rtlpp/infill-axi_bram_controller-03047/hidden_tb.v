// Hidden tests: 5000 cycles of seeded random inputs (seed 3345421041); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 96;
  reg clk;
  reg [0:0] i_0;
  reg [14:0] i_1;
  reg [7:0] i_2;
  reg [2:0] i_3;
  reg [1:0] i_4;
  reg [0:0] i_5;
  reg [3:0] i_6;
  reg [2:0] i_7;
  reg [0:0] i_8;
  reg [31:0] i_9;
  reg [3:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [14:0] i_14;
  reg [7:0] i_15;
  reg [2:0] i_16;
  reg [1:0] i_17;
  reg [0:0] i_18;
  reg [3:0] i_19;
  reg [2:0] i_20;
  reg [0:0] i_21;
  reg [0:0] i_22;
  reg [31:0] i_23;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_03047 dut (
    .s_axi_aclk(clk),
    .s_axi_aresetn(i_0),
    .s_axi_awaddr(i_1),
    .s_axi_awlen(i_2),
    .s_axi_awsize(i_3),
    .s_axi_awburst(i_4),
    .s_axi_awlock(i_5),
    .s_axi_awcache(i_6),
    .s_axi_awprot(i_7),
    .s_axi_awvalid(i_8),
    .s_axi_wdata(i_9),
    .s_axi_wstrb(i_10),
    .s_axi_wlast(i_11),
    .s_axi_wvalid(i_12),
    .s_axi_bready(i_13),
    .s_axi_araddr(i_14),
    .s_axi_arlen(i_15),
    .s_axi_arsize(i_16),
    .s_axi_arburst(i_17),
    .s_axi_arlock(i_18),
    .s_axi_arcache(i_19),
    .s_axi_arprot(i_20),
    .s_axi_arvalid(i_21),
    .s_axi_rready(i_22),
    .bram_rddata_a(i_23),
    .s_axi_awready(out_dut[95:95]),
    .s_axi_wready(out_dut[94:94]),
    .s_axi_bresp(out_dut[93:92]),
    .s_axi_bvalid(out_dut[91:91]),
    .s_axi_arready(out_dut[90:90]),
    .s_axi_rdata(out_dut[89:58]),
    .s_axi_rresp(out_dut[57:56]),
    .s_axi_rlast(out_dut[55:55]),
    .s_axi_rvalid(out_dut[54:54]),
    .bram_rst_a(out_dut[53:53]),
    .bram_clk_a(out_dut[52:52]),
    .bram_en_a(out_dut[51:51]),
    .bram_we_a(out_dut[50:47]),
    .bram_addr_a(out_dut[46:32]),
    .bram_wrdata_a(out_dut[31:0])
  );
  rtlpp_03047__ref ref_i (
    .s_axi_aclk(clk),
    .s_axi_aresetn(i_0),
    .s_axi_awaddr(i_1),
    .s_axi_awlen(i_2),
    .s_axi_awsize(i_3),
    .s_axi_awburst(i_4),
    .s_axi_awlock(i_5),
    .s_axi_awcache(i_6),
    .s_axi_awprot(i_7),
    .s_axi_awvalid(i_8),
    .s_axi_wdata(i_9),
    .s_axi_wstrb(i_10),
    .s_axi_wlast(i_11),
    .s_axi_wvalid(i_12),
    .s_axi_bready(i_13),
    .s_axi_araddr(i_14),
    .s_axi_arlen(i_15),
    .s_axi_arsize(i_16),
    .s_axi_arburst(i_17),
    .s_axi_arlock(i_18),
    .s_axi_arcache(i_19),
    .s_axi_arprot(i_20),
    .s_axi_arvalid(i_21),
    .s_axi_rready(i_22),
    .bram_rddata_a(i_23),
    .s_axi_awready(out_ref[95:95]),
    .s_axi_wready(out_ref[94:94]),
    .s_axi_bresp(out_ref[93:92]),
    .s_axi_bvalid(out_ref[91:91]),
    .s_axi_arready(out_ref[90:90]),
    .s_axi_rdata(out_ref[89:58]),
    .s_axi_rresp(out_ref[57:56]),
    .s_axi_rlast(out_ref[55:55]),
    .s_axi_rvalid(out_ref[54:54]),
    .bram_rst_a(out_ref[53:53]),
    .bram_clk_a(out_ref[52:52]),
    .bram_en_a(out_ref[51:51]),
    .bram_we_a(out_ref[50:47]),
    .bram_addr_a(out_ref[46:32]),
    .bram_wrdata_a(out_ref[31:0])
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
    seed = 3345421041;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
