// Hidden tests: 5000 cycles of seeded random inputs (seed 1841689679); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 243;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [3:0] i_2;
  reg [2:0] i_3;
  reg [2:0] i_4;
  reg [0:0] i_5;
  reg [127:0] i_6;
  reg [15:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [31:0] i_11;
  reg [3:0] i_12;
  reg [2:0] i_13;
  reg [2:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  reg [1:0] i_19;
  reg [0:0] i_20;
  reg [0:0] i_21;
  reg [31:0] i_22;
  reg [1:0] i_23;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_008575 dut (
    .user_clk(clk),
    .t_awvalid(i_0),
    .t_awaddr(i_1),
    .t_awlen(i_2),
    .t_awregion(i_3),
    .t_awsize(i_4),
    .t_wvalid(i_5),
    .t_wdata(i_6),
    .t_wstrb(i_7),
    .t_wlast(i_8),
    .t_bready(i_9),
    .t_arvalid(i_10),
    .t_araddr(i_11),
    .t_arlen(i_12),
    .t_arregion(i_13),
    .t_arsize(i_14),
    .t_rready(i_15),
    .s_axi_awready(i_16),
    .s_axi_wready(i_17),
    .s_axi_bvalid(i_18),
    .s_axi_bresp(i_19),
    .s_axi_arready(i_20),
    .s_axi_rvalid(i_21),
    .s_axi_rdata(i_22),
    .s_axi_rresp(i_23),
    .t_awready(out_dut[242:242]),
    .t_wready(out_dut[241:241]),
    .t_bvalid(out_dut[240:240]),
    .t_bresp(out_dut[239:238]),
    .t_arready(out_dut[237:237]),
    .t_rvalid(out_dut[236:236]),
    .t_rdata(out_dut[235:108]),
    .t_rresp(out_dut[107:106]),
    .t_rlast(out_dut[105:105]),
    .s_axi_awvalid(out_dut[104:104]),
    .s_axi_awaddr(out_dut[103:72]),
    .s_axi_wvalid(out_dut[71:71]),
    .s_axi_wdata(out_dut[70:39]),
    .s_axi_wstrb(out_dut[38:35]),
    .s_axi_bready(out_dut[34:34]),
    .s_axi_arvalid(out_dut[33:33]),
    .s_axi_araddr(out_dut[32:1]),
    .s_axi_rready(out_dut[0:0])
  );
  autovcoder_008575__ref ref_i (
    .user_clk(clk),
    .t_awvalid(i_0),
    .t_awaddr(i_1),
    .t_awlen(i_2),
    .t_awregion(i_3),
    .t_awsize(i_4),
    .t_wvalid(i_5),
    .t_wdata(i_6),
    .t_wstrb(i_7),
    .t_wlast(i_8),
    .t_bready(i_9),
    .t_arvalid(i_10),
    .t_araddr(i_11),
    .t_arlen(i_12),
    .t_arregion(i_13),
    .t_arsize(i_14),
    .t_rready(i_15),
    .s_axi_awready(i_16),
    .s_axi_wready(i_17),
    .s_axi_bvalid(i_18),
    .s_axi_bresp(i_19),
    .s_axi_arready(i_20),
    .s_axi_rvalid(i_21),
    .s_axi_rdata(i_22),
    .s_axi_rresp(i_23),
    .t_awready(out_ref[242:242]),
    .t_wready(out_ref[241:241]),
    .t_bvalid(out_ref[240:240]),
    .t_bresp(out_ref[239:238]),
    .t_arready(out_ref[237:237]),
    .t_rvalid(out_ref[236:236]),
    .t_rdata(out_ref[235:108]),
    .t_rresp(out_ref[107:106]),
    .t_rlast(out_ref[105:105]),
    .s_axi_awvalid(out_ref[104:104]),
    .s_axi_awaddr(out_ref[103:72]),
    .s_axi_wvalid(out_ref[71:71]),
    .s_axi_wdata(out_ref[70:39]),
    .s_axi_wstrb(out_ref[38:35]),
    .s_axi_bready(out_ref[34:34]),
    .s_axi_arvalid(out_ref[33:33]),
    .s_axi_araddr(out_ref[32:1]),
    .s_axi_rready(out_ref[0:0])
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
    seed = 1841689679;
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
      i_6 = {$random(seed), $random(seed), $random(seed), $random(seed)};
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
