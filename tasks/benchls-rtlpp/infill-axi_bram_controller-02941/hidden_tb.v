// Hidden tests: 5000 cycles of seeded random inputs (seed 3251863014); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 96;
  reg clk;
  reg [31:0] i_0;
  reg [14:0] i_1;
  reg [1:0] i_2;
  reg [3:0] i_3;
  reg [7:0] i_4;
  reg [0:0] i_5;
  reg [2:0] i_6;
  reg [2:0] i_7;
  reg [0:0] i_8;
  reg [14:0] i_9;
  reg [1:0] i_10;
  reg [3:0] i_11;
  reg [7:0] i_12;
  reg [0:0] i_13;
  reg [2:0] i_14;
  reg [2:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  reg [31:0] i_19;
  reg [0:0] i_20;
  reg [3:0] i_21;
  reg [0:0] i_22;
  reg [0:0] i_23;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_02941 dut (
    .s_axi_aclk_0(clk),
    .BRAM_PORTA_0_dout(i_0),
    .S_AXI_0_araddr(i_1),
    .S_AXI_0_arburst(i_2),
    .S_AXI_0_arcache(i_3),
    .S_AXI_0_arlen(i_4),
    .S_AXI_0_arlock(i_5),
    .S_AXI_0_arprot(i_6),
    .S_AXI_0_arsize(i_7),
    .S_AXI_0_arvalid(i_8),
    .S_AXI_0_awaddr(i_9),
    .S_AXI_0_awburst(i_10),
    .S_AXI_0_awcache(i_11),
    .S_AXI_0_awlen(i_12),
    .S_AXI_0_awlock(i_13),
    .S_AXI_0_awprot(i_14),
    .S_AXI_0_awsize(i_15),
    .S_AXI_0_awvalid(i_16),
    .S_AXI_0_bready(i_17),
    .S_AXI_0_rready(i_18),
    .S_AXI_0_wdata(i_19),
    .S_AXI_0_wlast(i_20),
    .S_AXI_0_wstrb(i_21),
    .S_AXI_0_wvalid(i_22),
    .s_axi_aresetn_0(i_23),
    .BRAM_PORTA_0_addr(out_dut[95:81]),
    .BRAM_PORTA_0_clk(out_dut[80:80]),
    .BRAM_PORTA_0_din(out_dut[79:48]),
    .BRAM_PORTA_0_en(out_dut[47:47]),
    .BRAM_PORTA_0_rst(out_dut[46:46]),
    .BRAM_PORTA_0_we(out_dut[45:42]),
    .S_AXI_0_arready(out_dut[41:41]),
    .S_AXI_0_awready(out_dut[40:40]),
    .S_AXI_0_bresp(out_dut[39:38]),
    .S_AXI_0_bvalid(out_dut[37:37]),
    .S_AXI_0_rdata(out_dut[36:5]),
    .S_AXI_0_rlast(out_dut[4:4]),
    .S_AXI_0_rresp(out_dut[3:2]),
    .S_AXI_0_rvalid(out_dut[1:1]),
    .S_AXI_0_wready(out_dut[0:0])
  );
  rtlpp_02941__ref ref_i (
    .s_axi_aclk_0(clk),
    .BRAM_PORTA_0_dout(i_0),
    .S_AXI_0_araddr(i_1),
    .S_AXI_0_arburst(i_2),
    .S_AXI_0_arcache(i_3),
    .S_AXI_0_arlen(i_4),
    .S_AXI_0_arlock(i_5),
    .S_AXI_0_arprot(i_6),
    .S_AXI_0_arsize(i_7),
    .S_AXI_0_arvalid(i_8),
    .S_AXI_0_awaddr(i_9),
    .S_AXI_0_awburst(i_10),
    .S_AXI_0_awcache(i_11),
    .S_AXI_0_awlen(i_12),
    .S_AXI_0_awlock(i_13),
    .S_AXI_0_awprot(i_14),
    .S_AXI_0_awsize(i_15),
    .S_AXI_0_awvalid(i_16),
    .S_AXI_0_bready(i_17),
    .S_AXI_0_rready(i_18),
    .S_AXI_0_wdata(i_19),
    .S_AXI_0_wlast(i_20),
    .S_AXI_0_wstrb(i_21),
    .S_AXI_0_wvalid(i_22),
    .s_axi_aresetn_0(i_23),
    .BRAM_PORTA_0_addr(out_ref[95:81]),
    .BRAM_PORTA_0_clk(out_ref[80:80]),
    .BRAM_PORTA_0_din(out_ref[79:48]),
    .BRAM_PORTA_0_en(out_ref[47:47]),
    .BRAM_PORTA_0_rst(out_ref[46:46]),
    .BRAM_PORTA_0_we(out_ref[45:42]),
    .S_AXI_0_arready(out_ref[41:41]),
    .S_AXI_0_awready(out_ref[40:40]),
    .S_AXI_0_bresp(out_ref[39:38]),
    .S_AXI_0_bvalid(out_ref[37:37]),
    .S_AXI_0_rdata(out_ref[36:5]),
    .S_AXI_0_rlast(out_ref[4:4]),
    .S_AXI_0_rresp(out_ref[3:2]),
    .S_AXI_0_rvalid(out_ref[1:1]),
    .S_AXI_0_wready(out_ref[0:0])
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
    seed = 3251863014;
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
      i_23 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
