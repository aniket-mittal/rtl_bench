// Hidden tests: 5000 cycles of seeded random inputs (seed 1120458249); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 41;
  reg clk;
  reg [0:0] i_0;
  reg [9:0] i_1;
  reg [0:0] i_2;
  reg [31:0] i_3;
  reg [3:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [9:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_116438 dut (
    .s00_axi_aclk(clk),
    .s00_axi_aresetn(i_0),
    .s00_axi_awaddr(i_1),
    .s00_axi_awvalid(i_2),
    .s00_axi_wdata(i_3),
    .s00_axi_wstrb(i_4),
    .s00_axi_wvalid(i_5),
    .s00_axi_bready(i_6),
    .s00_axi_araddr(i_7),
    .s00_axi_arvalid(i_8),
    .s00_axi_rready(i_9),
    .s00_axi_awready(out_dut[40:40]),
    .s00_axi_wready(out_dut[39:39]),
    .s00_axi_bresp(out_dut[38:37]),
    .s00_axi_bvalid(out_dut[36:36]),
    .s00_axi_arready(out_dut[35:35]),
    .s00_axi_rdata(out_dut[34:3]),
    .s00_axi_rresp(out_dut[2:1]),
    .s00_axi_rvalid(out_dut[0:0])
  );
  origen_116438__ref ref_i (
    .s00_axi_aclk(clk),
    .s00_axi_aresetn(i_0),
    .s00_axi_awaddr(i_1),
    .s00_axi_awvalid(i_2),
    .s00_axi_wdata(i_3),
    .s00_axi_wstrb(i_4),
    .s00_axi_wvalid(i_5),
    .s00_axi_bready(i_6),
    .s00_axi_araddr(i_7),
    .s00_axi_arvalid(i_8),
    .s00_axi_rready(i_9),
    .s00_axi_awready(out_ref[40:40]),
    .s00_axi_wready(out_ref[39:39]),
    .s00_axi_bresp(out_ref[38:37]),
    .s00_axi_bvalid(out_ref[36:36]),
    .s00_axi_arready(out_ref[35:35]),
    .s00_axi_rdata(out_ref[34:3]),
    .s00_axi_rresp(out_ref[2:1]),
    .s00_axi_rvalid(out_ref[0:0])
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
    seed = 1120458249;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
