// Hidden tests: 5000 cycles of seeded random inputs (seed 17984994); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 51;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [6:0] i_2;
  reg [0:0] i_3;
  reg [6:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [31:0] i_8;
  reg [3:0] i_9;
  reg [0:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_132545 dut (
    .s_axi_aclk(clk),
    .ext_spi_clk(i_0),
    .s_axi_aresetn(i_1),
    .AXI_LITE_SPI_araddr(i_2),
    .AXI_LITE_SPI_arvalid(i_3),
    .AXI_LITE_SPI_awaddr(i_4),
    .AXI_LITE_SPI_awvalid(i_5),
    .AXI_LITE_SPI_bready(i_6),
    .AXI_LITE_SPI_rready(i_7),
    .AXI_LITE_SPI_wdata(i_8),
    .AXI_LITE_SPI_wstrb(i_9),
    .AXI_LITE_SPI_wvalid(i_10),
    .Pmod_out_pin1(out_dut[50:50]),
    .Pmod_out_pin2(out_dut[49:49]),
    .Pmod_out_pin3(out_dut[48:48]),
    .Pmod_out_pin4(out_dut[47:47]),
    .Pmod_out_pin5(out_dut[46:46]),
    .Pmod_out_pin6(out_dut[45:45]),
    .Pmod_out_pin7(out_dut[44:44]),
    .Pmod_out_pin8(out_dut[43:43]),
    .Pmod_out_pin9(out_dut[42:42]),
    .Pmod_out_pin10(out_dut[41:41]),
    .AXI_LITE_SPI_arready(out_dut[40:40]),
    .AXI_LITE_SPI_awready(out_dut[39:39]),
    .AXI_LITE_SPI_bresp(out_dut[38:37]),
    .AXI_LITE_SPI_bvalid(out_dut[36:36]),
    .AXI_LITE_SPI_rdata(out_dut[35:4]),
    .AXI_LITE_SPI_rresp(out_dut[3:2]),
    .AXI_LITE_SPI_rvalid(out_dut[1:1]),
    .AXI_LITE_SPI_wready(out_dut[0:0])
  );
  origen_132545__ref ref_i (
    .s_axi_aclk(clk),
    .ext_spi_clk(i_0),
    .s_axi_aresetn(i_1),
    .AXI_LITE_SPI_araddr(i_2),
    .AXI_LITE_SPI_arvalid(i_3),
    .AXI_LITE_SPI_awaddr(i_4),
    .AXI_LITE_SPI_awvalid(i_5),
    .AXI_LITE_SPI_bready(i_6),
    .AXI_LITE_SPI_rready(i_7),
    .AXI_LITE_SPI_wdata(i_8),
    .AXI_LITE_SPI_wstrb(i_9),
    .AXI_LITE_SPI_wvalid(i_10),
    .Pmod_out_pin1(out_ref[50:50]),
    .Pmod_out_pin2(out_ref[49:49]),
    .Pmod_out_pin3(out_ref[48:48]),
    .Pmod_out_pin4(out_ref[47:47]),
    .Pmod_out_pin5(out_ref[46:46]),
    .Pmod_out_pin6(out_ref[45:45]),
    .Pmod_out_pin7(out_ref[44:44]),
    .Pmod_out_pin8(out_ref[43:43]),
    .Pmod_out_pin9(out_ref[42:42]),
    .Pmod_out_pin10(out_ref[41:41]),
    .AXI_LITE_SPI_arready(out_ref[40:40]),
    .AXI_LITE_SPI_awready(out_ref[39:39]),
    .AXI_LITE_SPI_bresp(out_ref[38:37]),
    .AXI_LITE_SPI_bvalid(out_ref[36:36]),
    .AXI_LITE_SPI_rdata(out_ref[35:4]),
    .AXI_LITE_SPI_rresp(out_ref[3:2]),
    .AXI_LITE_SPI_rvalid(out_ref[1:1]),
    .AXI_LITE_SPI_wready(out_ref[0:0])
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
    seed = 17984994;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
