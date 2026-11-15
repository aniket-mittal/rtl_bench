// Hidden tests: 5000 cycles of seeded random inputs (seed 3198984067); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 73;
  reg clk;
  reg [0:0] i_0;
  reg [8:0] i_1;
  reg [0:0] i_2;
  reg [31:0] i_3;
  reg [3:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [8:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [3:0] i_10;
  reg [11:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_147379 dut (
    .s_axi_aclk(clk),
    .s_axi_aresetn(i_0),
    .s_axi_awaddr(i_1),
    .s_axi_awvalid(i_2),
    .s_axi_wdata(i_3),
    .s_axi_wstrb(i_4),
    .s_axi_wvalid(i_5),
    .s_axi_bready(i_6),
    .s_axi_araddr(i_7),
    .s_axi_arvalid(i_8),
    .s_axi_rready(i_9),
    .gpio_io_i(i_10),
    .gpio2_io_i(i_11),
    .s_axi_awready(out_dut[72:72]),
    .s_axi_wready(out_dut[71:71]),
    .s_axi_bresp(out_dut[70:69]),
    .s_axi_bvalid(out_dut[68:68]),
    .s_axi_arready(out_dut[67:67]),
    .s_axi_rdata(out_dut[66:35]),
    .s_axi_rresp(out_dut[34:33]),
    .s_axi_rvalid(out_dut[32:32]),
    .gpio_io_o(out_dut[31:28]),
    .gpio_io_t(out_dut[27:24]),
    .gpio2_io_o(out_dut[23:12]),
    .gpio2_io_t(out_dut[11:0])
  );
  origen_147379__ref ref_i (
    .s_axi_aclk(clk),
    .s_axi_aresetn(i_0),
    .s_axi_awaddr(i_1),
    .s_axi_awvalid(i_2),
    .s_axi_wdata(i_3),
    .s_axi_wstrb(i_4),
    .s_axi_wvalid(i_5),
    .s_axi_bready(i_6),
    .s_axi_araddr(i_7),
    .s_axi_arvalid(i_8),
    .s_axi_rready(i_9),
    .gpio_io_i(i_10),
    .gpio2_io_i(i_11),
    .s_axi_awready(out_ref[72:72]),
    .s_axi_wready(out_ref[71:71]),
    .s_axi_bresp(out_ref[70:69]),
    .s_axi_bvalid(out_ref[68:68]),
    .s_axi_arready(out_ref[67:67]),
    .s_axi_rdata(out_ref[66:35]),
    .s_axi_rresp(out_ref[34:33]),
    .s_axi_rvalid(out_ref[32:32]),
    .gpio_io_o(out_ref[31:28]),
    .gpio_io_t(out_ref[27:24]),
    .gpio2_io_o(out_ref[23:12]),
    .gpio2_io_t(out_ref[11:0])
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
    seed = 3198984067;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
