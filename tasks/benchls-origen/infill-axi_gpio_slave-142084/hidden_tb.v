// Hidden tests: 5000 cycles of seeded random inputs (seed 3876875638); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 72;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [3:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [31:0] i_8;
  reg [0:0] i_9;
  reg [31:0] i_10;
  reg [0:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_142084 dut (
    .s_axi_aclk(clk),
    .s_axi_aresetn(i_0),
    .s_axi_awvalid(i_1),
    .s_axi_awaddr(i_2),
    .s_axi_wvalid(i_3),
    .s_axi_wdata(i_4),
    .s_axi_wstrb(i_5),
    .s_axi_bready(i_6),
    .s_axi_arvalid(i_7),
    .s_axi_araddr(i_8),
    .s_axi_rready(i_9),
    .gpio_io_t(i_10),
    .gpio_xferAck_Reg(i_11),
    .s_axi_awready(out_dut[71:71]),
    .s_axi_wready(out_dut[70:70]),
    .s_axi_bvalid(out_dut[69:69]),
    .s_axi_bresp(out_dut[68:67]),
    .s_axi_arready(out_dut[66:66]),
    .s_axi_rvalid(out_dut[65:65]),
    .s_axi_rdata(out_dut[64:33]),
    .gpio2_io_t(out_dut[32:1]),
    .gpio_xferAck_Reg_out(out_dut[0:0])
  );
  origen_142084__ref ref_i (
    .s_axi_aclk(clk),
    .s_axi_aresetn(i_0),
    .s_axi_awvalid(i_1),
    .s_axi_awaddr(i_2),
    .s_axi_wvalid(i_3),
    .s_axi_wdata(i_4),
    .s_axi_wstrb(i_5),
    .s_axi_bready(i_6),
    .s_axi_arvalid(i_7),
    .s_axi_araddr(i_8),
    .s_axi_rready(i_9),
    .gpio_io_t(i_10),
    .gpio_xferAck_Reg(i_11),
    .s_axi_awready(out_ref[71:71]),
    .s_axi_wready(out_ref[70:70]),
    .s_axi_bvalid(out_ref[69:69]),
    .s_axi_bresp(out_ref[68:67]),
    .s_axi_arready(out_ref[66:66]),
    .s_axi_rvalid(out_ref[65:65]),
    .s_axi_rdata(out_ref[64:33]),
    .gpio2_io_t(out_ref[32:1]),
    .gpio_xferAck_Reg_out(out_ref[0:0])
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
    seed = 3876875638;
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
