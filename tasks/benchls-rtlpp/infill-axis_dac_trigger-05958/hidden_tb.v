// Hidden tests: 5000 cycles of seeded random inputs (seed 4270415845); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 624;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [3:0] i_5;
  reg [2:0] i_6;
  reg [0:0] i_7;
  reg [31:0] i_8;
  reg [3:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [3:0] i_12;
  reg [2:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [255:0] i_16;
  reg [31:0] i_17;
  reg [0:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  reg [0:0] i_21;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_05958 dut (
    .aclk(clk),
    .dac_aclk(i_0),
    .dac_aresetn(i_1),
    .aresetn(i_2),
    .s00_axi_aclk(i_3),
    .s00_axi_aresetn(i_4),
    .s00_axi_awaddr(i_5),
    .s00_axi_awprot(i_6),
    .s00_axi_awvalid(i_7),
    .s00_axi_wdata(i_8),
    .s00_axi_wstrb(i_9),
    .s00_axi_wvalid(i_10),
    .s00_axi_bready(i_11),
    .s00_axi_araddr(i_12),
    .s00_axi_arprot(i_13),
    .s00_axi_arvalid(i_14),
    .s00_axi_rready(i_15),
    .s00_axis_tdata(i_16),
    .s00_axis_tkeep(i_17),
    .s00_axis_tlast(i_18),
    .s00_axis_tvalid(i_19),
    .m00_axis_tready(i_20),
    .m01_axis_tready(i_21),
    .trn_pulse_o(out_dut[623:623]),
    .valid_temp(out_dut[622:622]),
    .s00_axi_awready(out_dut[621:621]),
    .s00_axi_wready(out_dut[620:620]),
    .s00_axi_bresp(out_dut[619:618]),
    .s00_axi_bvalid(out_dut[617:617]),
    .s00_axi_arready(out_dut[616:616]),
    .s00_axi_rdata(out_dut[615:584]),
    .s00_axi_rresp(out_dut[583:582]),
    .s00_axi_rvalid(out_dut[581:581]),
    .s00_axis_tready(out_dut[580:580]),
    .m00_axis_tdata(out_dut[579:324]),
    .m00_axis_tkeep(out_dut[323:292]),
    .m00_axis_tlast(out_dut[291:291]),
    .m00_axis_tvalid(out_dut[290:290]),
    .m01_axis_tdata(out_dut[289:34]),
    .m01_axis_tkeep(out_dut[33:2]),
    .m01_axis_tlast(out_dut[1:1]),
    .m01_axis_tvalid(out_dut[0:0])
  );
  rtlpp_05958__ref ref_i (
    .aclk(clk),
    .dac_aclk(i_0),
    .dac_aresetn(i_1),
    .aresetn(i_2),
    .s00_axi_aclk(i_3),
    .s00_axi_aresetn(i_4),
    .s00_axi_awaddr(i_5),
    .s00_axi_awprot(i_6),
    .s00_axi_awvalid(i_7),
    .s00_axi_wdata(i_8),
    .s00_axi_wstrb(i_9),
    .s00_axi_wvalid(i_10),
    .s00_axi_bready(i_11),
    .s00_axi_araddr(i_12),
    .s00_axi_arprot(i_13),
    .s00_axi_arvalid(i_14),
    .s00_axi_rready(i_15),
    .s00_axis_tdata(i_16),
    .s00_axis_tkeep(i_17),
    .s00_axis_tlast(i_18),
    .s00_axis_tvalid(i_19),
    .m00_axis_tready(i_20),
    .m01_axis_tready(i_21),
    .trn_pulse_o(out_ref[623:623]),
    .valid_temp(out_ref[622:622]),
    .s00_axi_awready(out_ref[621:621]),
    .s00_axi_wready(out_ref[620:620]),
    .s00_axi_bresp(out_ref[619:618]),
    .s00_axi_bvalid(out_ref[617:617]),
    .s00_axi_arready(out_ref[616:616]),
    .s00_axi_rdata(out_ref[615:584]),
    .s00_axi_rresp(out_ref[583:582]),
    .s00_axi_rvalid(out_ref[581:581]),
    .s00_axis_tready(out_ref[580:580]),
    .m00_axis_tdata(out_ref[579:324]),
    .m00_axis_tkeep(out_ref[323:292]),
    .m00_axis_tlast(out_ref[291:291]),
    .m00_axis_tvalid(out_ref[290:290]),
    .m01_axis_tdata(out_ref[289:34]),
    .m01_axis_tkeep(out_ref[33:2]),
    .m01_axis_tlast(out_ref[1:1]),
    .m01_axis_tvalid(out_ref[0:0])
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
    seed = 4270415845;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
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
      i_16 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      i_21 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
