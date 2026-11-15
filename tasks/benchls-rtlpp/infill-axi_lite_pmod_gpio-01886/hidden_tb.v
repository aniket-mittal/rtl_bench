// Hidden tests: 5000 cycles of seeded random inputs (seed 3545257326); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 57;
  reg clk;
  reg [8:0] i_0;
  reg [0:0] i_1;
  reg [8:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [31:0] i_6;
  reg [3:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_01886 dut (
    .s_axi_aclk(clk),
    .AXI_LITE_GPIO_araddr(i_0),
    .AXI_LITE_GPIO_arvalid(i_1),
    .AXI_LITE_GPIO_awaddr(i_2),
    .AXI_LITE_GPIO_awvalid(i_3),
    .AXI_LITE_GPIO_bready(i_4),
    .AXI_LITE_GPIO_rready(i_5),
    .AXI_LITE_GPIO_wdata(i_6),
    .AXI_LITE_GPIO_wstrb(i_7),
    .AXI_LITE_GPIO_wvalid(i_8),
    .Pmod_out_pin10_i(i_9),
    .Pmod_out_pin1_i(i_10),
    .Pmod_out_pin2_i(i_11),
    .Pmod_out_pin3_i(i_12),
    .Pmod_out_pin4_i(i_13),
    .Pmod_out_pin7_i(i_14),
    .Pmod_out_pin8_i(i_15),
    .Pmod_out_pin9_i(i_16),
    .s_axi_aresetn(i_17),
    .AXI_LITE_GPIO_arready(out_dut[56:56]),
    .AXI_LITE_GPIO_awready(out_dut[55:55]),
    .AXI_LITE_GPIO_bresp(out_dut[54:53]),
    .AXI_LITE_GPIO_bvalid(out_dut[52:52]),
    .AXI_LITE_GPIO_rdata(out_dut[51:20]),
    .AXI_LITE_GPIO_rresp(out_dut[19:18]),
    .AXI_LITE_GPIO_rvalid(out_dut[17:17]),
    .AXI_LITE_GPIO_wready(out_dut[16:16]),
    .Pmod_out_pin10_o(out_dut[15:15]),
    .Pmod_out_pin10_t(out_dut[14:14]),
    .Pmod_out_pin1_o(out_dut[13:13]),
    .Pmod_out_pin1_t(out_dut[12:12]),
    .Pmod_out_pin2_o(out_dut[11:11]),
    .Pmod_out_pin2_t(out_dut[10:10]),
    .Pmod_out_pin3_o(out_dut[9:9]),
    .Pmod_out_pin3_t(out_dut[8:8]),
    .Pmod_out_pin4_o(out_dut[7:7]),
    .Pmod_out_pin4_t(out_dut[6:6]),
    .Pmod_out_pin7_o(out_dut[5:5]),
    .Pmod_out_pin7_t(out_dut[4:4]),
    .Pmod_out_pin8_o(out_dut[3:3]),
    .Pmod_out_pin8_t(out_dut[2:2]),
    .Pmod_out_pin9_o(out_dut[1:1]),
    .Pmod_out_pin9_t(out_dut[0:0])
  );
  rtlpp_01886__ref ref_i (
    .s_axi_aclk(clk),
    .AXI_LITE_GPIO_araddr(i_0),
    .AXI_LITE_GPIO_arvalid(i_1),
    .AXI_LITE_GPIO_awaddr(i_2),
    .AXI_LITE_GPIO_awvalid(i_3),
    .AXI_LITE_GPIO_bready(i_4),
    .AXI_LITE_GPIO_rready(i_5),
    .AXI_LITE_GPIO_wdata(i_6),
    .AXI_LITE_GPIO_wstrb(i_7),
    .AXI_LITE_GPIO_wvalid(i_8),
    .Pmod_out_pin10_i(i_9),
    .Pmod_out_pin1_i(i_10),
    .Pmod_out_pin2_i(i_11),
    .Pmod_out_pin3_i(i_12),
    .Pmod_out_pin4_i(i_13),
    .Pmod_out_pin7_i(i_14),
    .Pmod_out_pin8_i(i_15),
    .Pmod_out_pin9_i(i_16),
    .s_axi_aresetn(i_17),
    .AXI_LITE_GPIO_arready(out_ref[56:56]),
    .AXI_LITE_GPIO_awready(out_ref[55:55]),
    .AXI_LITE_GPIO_bresp(out_ref[54:53]),
    .AXI_LITE_GPIO_bvalid(out_ref[52:52]),
    .AXI_LITE_GPIO_rdata(out_ref[51:20]),
    .AXI_LITE_GPIO_rresp(out_ref[19:18]),
    .AXI_LITE_GPIO_rvalid(out_ref[17:17]),
    .AXI_LITE_GPIO_wready(out_ref[16:16]),
    .Pmod_out_pin10_o(out_ref[15:15]),
    .Pmod_out_pin10_t(out_ref[14:14]),
    .Pmod_out_pin1_o(out_ref[13:13]),
    .Pmod_out_pin1_t(out_ref[12:12]),
    .Pmod_out_pin2_o(out_ref[11:11]),
    .Pmod_out_pin2_t(out_ref[10:10]),
    .Pmod_out_pin3_o(out_ref[9:9]),
    .Pmod_out_pin3_t(out_ref[8:8]),
    .Pmod_out_pin4_o(out_ref[7:7]),
    .Pmod_out_pin4_t(out_ref[6:6]),
    .Pmod_out_pin7_o(out_ref[5:5]),
    .Pmod_out_pin7_t(out_ref[4:4]),
    .Pmod_out_pin8_o(out_ref[3:3]),
    .Pmod_out_pin8_t(out_ref[2:2]),
    .Pmod_out_pin9_o(out_ref[1:1]),
    .Pmod_out_pin9_t(out_ref[0:0])
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
    seed = 3545257326;
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
      i_17 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
