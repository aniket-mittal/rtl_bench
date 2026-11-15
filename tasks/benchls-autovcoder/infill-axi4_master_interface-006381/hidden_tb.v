// Hidden tests: 5000 cycles of seeded random inputs (seed 3330101628); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 46;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [7:0] i_3;
  reg [2:0] i_4;
  reg [1:0] i_5;
  reg [0:0] i_6;
  reg [3:0] i_7;
  reg [2:0] i_8;
  reg [3:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [31:0] i_12;
  reg [3:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  reg [31:0] i_19;
  reg [7:0] i_20;
  reg [2:0] i_21;
  reg [1:0] i_22;
  reg [0:0] i_23;
  reg [3:0] i_24;
  reg [2:0] i_25;
  reg [3:0] i_26;
  reg [0:0] i_27;
  reg [0:0] i_28;
  reg [0:0] i_29;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_006381 dut (
    .ACLK(clk),
    .ARESETN(i_0),
    .M_AXI_AWID(i_1),
    .M_AXI_AWADDR(i_2),
    .M_AXI_AWLEN(i_3),
    .M_AXI_AWSIZE(i_4),
    .M_AXI_AWBURST(i_5),
    .M_AXI_AWLOCK(i_6),
    .M_AXI_AWCACHE(i_7),
    .M_AXI_AWPROT(i_8),
    .M_AXI_AWQOS(i_9),
    .M_AXI_AWUSER(i_10),
    .M_AXI_AWVALID(i_11),
    .M_AXI_WDATA(i_12),
    .M_AXI_WSTRB(i_13),
    .M_AXI_WLAST(i_14),
    .M_AXI_WUSER(i_15),
    .M_AXI_WVALID(i_16),
    .M_AXI_BREADY(i_17),
    .M_AXI_ARID(i_18),
    .M_AXI_ARADDR(i_19),
    .M_AXI_ARLEN(i_20),
    .M_AXI_ARSIZE(i_21),
    .M_AXI_ARBURST(i_22),
    .M_AXI_ARLOCK(i_23),
    .M_AXI_ARCACHE(i_24),
    .M_AXI_ARPROT(i_25),
    .M_AXI_ARQOS(i_26),
    .M_AXI_ARUSER(i_27),
    .M_AXI_ARVALID(i_28),
    .M_AXI_RREADY(i_29),
    .M_AXI_AWREADY(out_dut[45:45]),
    .M_AXI_WREADY(out_dut[44:44]),
    .M_AXI_BID(out_dut[43:43]),
    .M_AXI_BRESP(out_dut[42:41]),
    .M_AXI_BUSER(out_dut[40:40]),
    .M_AXI_BVALID(out_dut[39:39]),
    .M_AXI_ARREADY(out_dut[38:38]),
    .M_AXI_RID(out_dut[37:37]),
    .M_AXI_RDATA(out_dut[36:5]),
    .M_AXI_RRESP(out_dut[4:3]),
    .M_AXI_RLAST(out_dut[2:2]),
    .M_AXI_RUSER(out_dut[1:1]),
    .M_AXI_RVALID(out_dut[0:0])
  );
  autovcoder_006381__ref ref_i (
    .ACLK(clk),
    .ARESETN(i_0),
    .M_AXI_AWID(i_1),
    .M_AXI_AWADDR(i_2),
    .M_AXI_AWLEN(i_3),
    .M_AXI_AWSIZE(i_4),
    .M_AXI_AWBURST(i_5),
    .M_AXI_AWLOCK(i_6),
    .M_AXI_AWCACHE(i_7),
    .M_AXI_AWPROT(i_8),
    .M_AXI_AWQOS(i_9),
    .M_AXI_AWUSER(i_10),
    .M_AXI_AWVALID(i_11),
    .M_AXI_WDATA(i_12),
    .M_AXI_WSTRB(i_13),
    .M_AXI_WLAST(i_14),
    .M_AXI_WUSER(i_15),
    .M_AXI_WVALID(i_16),
    .M_AXI_BREADY(i_17),
    .M_AXI_ARID(i_18),
    .M_AXI_ARADDR(i_19),
    .M_AXI_ARLEN(i_20),
    .M_AXI_ARSIZE(i_21),
    .M_AXI_ARBURST(i_22),
    .M_AXI_ARLOCK(i_23),
    .M_AXI_ARCACHE(i_24),
    .M_AXI_ARPROT(i_25),
    .M_AXI_ARQOS(i_26),
    .M_AXI_ARUSER(i_27),
    .M_AXI_ARVALID(i_28),
    .M_AXI_RREADY(i_29),
    .M_AXI_AWREADY(out_ref[45:45]),
    .M_AXI_WREADY(out_ref[44:44]),
    .M_AXI_BID(out_ref[43:43]),
    .M_AXI_BRESP(out_ref[42:41]),
    .M_AXI_BUSER(out_ref[40:40]),
    .M_AXI_BVALID(out_ref[39:39]),
    .M_AXI_ARREADY(out_ref[38:38]),
    .M_AXI_RID(out_ref[37:37]),
    .M_AXI_RDATA(out_ref[36:5]),
    .M_AXI_RRESP(out_ref[4:3]),
    .M_AXI_RLAST(out_ref[2:2]),
    .M_AXI_RUSER(out_ref[1:1]),
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
    seed = 3330101628;
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
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      i_21 = {$random(seed)};
      i_22 = {$random(seed)};
      i_23 = {$random(seed)};
      i_24 = {$random(seed)};
      i_25 = {$random(seed)};
      i_26 = {$random(seed)};
      i_27 = {$random(seed)};
      i_28 = {$random(seed)};
      i_29 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
