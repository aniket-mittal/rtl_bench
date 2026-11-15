// Hidden tests: 5000 cycles of seeded random inputs (seed 3913427866); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 42;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [7:0] i_2;
  reg [2:0] i_3;
  reg [1:0] i_4;
  reg [0:0] i_5;
  reg [31:0] i_6;
  reg [3:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [31:0] i_11;
  reg [7:0] i_12;
  reg [2:0] i_13;
  reg [1:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_082653 dut (
    .ACLK(clk),
    .ARESETN(i_0),
    .M_AXI_AWADDR(i_1),
    .M_AXI_AWLEN(i_2),
    .M_AXI_AWSIZE(i_3),
    .M_AXI_AWBURST(i_4),
    .M_AXI_AWVALID(i_5),
    .M_AXI_WDATA(i_6),
    .M_AXI_WSTRB(i_7),
    .M_AXI_WLAST(i_8),
    .M_AXI_WVALID(i_9),
    .M_AXI_BREADY(i_10),
    .M_AXI_ARADDR(i_11),
    .M_AXI_ARLEN(i_12),
    .M_AXI_ARSIZE(i_13),
    .M_AXI_ARBURST(i_14),
    .M_AXI_ARVALID(i_15),
    .M_AXI_RREADY(i_16),
    .M_AXI_AWREADY(out_dut[41:41]),
    .M_AXI_WREADY(out_dut[40:40]),
    .M_AXI_BRESP(out_dut[39:38]),
    .M_AXI_BVALID(out_dut[37:37]),
    .M_AXI_ARREADY(out_dut[36:36]),
    .M_AXI_RDATA(out_dut[35:4]),
    .M_AXI_RRESP(out_dut[3:2]),
    .M_AXI_RLAST(out_dut[1:1]),
    .M_AXI_RVALID(out_dut[0:0])
  );
  origen_082653__ref ref_i (
    .ACLK(clk),
    .ARESETN(i_0),
    .M_AXI_AWADDR(i_1),
    .M_AXI_AWLEN(i_2),
    .M_AXI_AWSIZE(i_3),
    .M_AXI_AWBURST(i_4),
    .M_AXI_AWVALID(i_5),
    .M_AXI_WDATA(i_6),
    .M_AXI_WSTRB(i_7),
    .M_AXI_WLAST(i_8),
    .M_AXI_WVALID(i_9),
    .M_AXI_BREADY(i_10),
    .M_AXI_ARADDR(i_11),
    .M_AXI_ARLEN(i_12),
    .M_AXI_ARSIZE(i_13),
    .M_AXI_ARBURST(i_14),
    .M_AXI_ARVALID(i_15),
    .M_AXI_RREADY(i_16),
    .M_AXI_AWREADY(out_ref[41:41]),
    .M_AXI_WREADY(out_ref[40:40]),
    .M_AXI_BRESP(out_ref[39:38]),
    .M_AXI_BVALID(out_ref[37:37]),
    .M_AXI_ARREADY(out_ref[36:36]),
    .M_AXI_RDATA(out_ref[35:4]),
    .M_AXI_RRESP(out_ref[3:2]),
    .M_AXI_RLAST(out_ref[1:1]),
    .M_AXI_RVALID(out_ref[0:0])
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
    seed = 3913427866;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
