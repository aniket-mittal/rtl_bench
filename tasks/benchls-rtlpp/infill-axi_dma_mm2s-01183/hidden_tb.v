// Hidden tests: 5000 cycles of seeded random inputs (seed 4181545893); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 97;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [0:0] i_2;
  reg [1:0] i_3;
  reg [0:0] i_4;
  reg [9:0] i_5;
  reg [0:0] i_6;
  reg [9:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [31:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [31:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_01183 dut (
    .s_axi_lite_aclk(clk),
    .M_AXI_MM2S_arready(i_0),
    .M_AXI_MM2S_rdata(i_1),
    .M_AXI_MM2S_rlast(i_2),
    .M_AXI_MM2S_rresp(i_3),
    .M_AXI_MM2S_rvalid(i_4),
    .S_AXI_LITE_araddr(i_5),
    .S_AXI_LITE_arvalid(i_6),
    .S_AXI_LITE_awaddr(i_7),
    .S_AXI_LITE_awvalid(i_8),
    .S_AXI_LITE_bready(i_9),
    .S_AXI_LITE_rready(i_10),
    .S_AXI_LITE_wdata(i_11),
    .S_AXI_LITE_wvalid(i_12),
    .axi_resetn(i_13),
    .Lcl_M_AXIS_MM2S_TDATA(i_14),
    .Lcl_M_AXIS_MM2S_TLAST(i_15),
    .Lcl_M_AXIS_MM2S_TVALID(i_16),
    .useLcl(i_17),
    .M_AXI_MM2S_araddr(out_dut[96:65]),
    .M_AXI_MM2S_arburst(out_dut[64:63]),
    .M_AXI_MM2S_arcache(out_dut[62:59]),
    .M_AXI_MM2S_arlen(out_dut[58:51]),
    .M_AXI_MM2S_arprot(out_dut[50:48]),
    .M_AXI_MM2S_arsize(out_dut[47:45]),
    .M_AXI_MM2S_arvalid(out_dut[44:44]),
    .M_AXI_MM2S_rready(out_dut[43:43]),
    .S_AXI_LITE_arready(out_dut[42:42]),
    .S_AXI_LITE_awready(out_dut[41:41]),
    .S_AXI_LITE_bresp(out_dut[40:39]),
    .S_AXI_LITE_bvalid(out_dut[38:38]),
    .S_AXI_LITE_rdata(out_dut[37:6]),
    .S_AXI_LITE_rresp(out_dut[5:4]),
    .S_AXI_LITE_rvalid(out_dut[3:3]),
    .S_AXI_LITE_wready(out_dut[2:2]),
    .Lcl_M_AXIS_MM2S_TREADY(out_dut[1:1]),
    .mm2s_introut(out_dut[0:0])
  );
  rtlpp_01183__ref ref_i (
    .s_axi_lite_aclk(clk),
    .M_AXI_MM2S_arready(i_0),
    .M_AXI_MM2S_rdata(i_1),
    .M_AXI_MM2S_rlast(i_2),
    .M_AXI_MM2S_rresp(i_3),
    .M_AXI_MM2S_rvalid(i_4),
    .S_AXI_LITE_araddr(i_5),
    .S_AXI_LITE_arvalid(i_6),
    .S_AXI_LITE_awaddr(i_7),
    .S_AXI_LITE_awvalid(i_8),
    .S_AXI_LITE_bready(i_9),
    .S_AXI_LITE_rready(i_10),
    .S_AXI_LITE_wdata(i_11),
    .S_AXI_LITE_wvalid(i_12),
    .axi_resetn(i_13),
    .Lcl_M_AXIS_MM2S_TDATA(i_14),
    .Lcl_M_AXIS_MM2S_TLAST(i_15),
    .Lcl_M_AXIS_MM2S_TVALID(i_16),
    .useLcl(i_17),
    .M_AXI_MM2S_araddr(out_ref[96:65]),
    .M_AXI_MM2S_arburst(out_ref[64:63]),
    .M_AXI_MM2S_arcache(out_ref[62:59]),
    .M_AXI_MM2S_arlen(out_ref[58:51]),
    .M_AXI_MM2S_arprot(out_ref[50:48]),
    .M_AXI_MM2S_arsize(out_ref[47:45]),
    .M_AXI_MM2S_arvalid(out_ref[44:44]),
    .M_AXI_MM2S_rready(out_ref[43:43]),
    .S_AXI_LITE_arready(out_ref[42:42]),
    .S_AXI_LITE_awready(out_ref[41:41]),
    .S_AXI_LITE_bresp(out_ref[40:39]),
    .S_AXI_LITE_bvalid(out_ref[38:38]),
    .S_AXI_LITE_rdata(out_ref[37:6]),
    .S_AXI_LITE_rresp(out_ref[5:4]),
    .S_AXI_LITE_rvalid(out_ref[3:3]),
    .S_AXI_LITE_wready(out_ref[2:2]),
    .Lcl_M_AXIS_MM2S_TREADY(out_ref[1:1]),
    .mm2s_introut(out_ref[0:0])
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
    seed = 4181545893;
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
      i_13 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
