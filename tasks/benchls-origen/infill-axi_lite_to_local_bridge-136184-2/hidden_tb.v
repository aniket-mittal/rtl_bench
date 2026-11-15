// Hidden tests: 5000 cycles of seeded random inputs (seed 156502585); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 111;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [3:0] i_2;
  reg [2:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  reg [3:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [31:0] i_9;
  reg [3:0] i_10;
  reg [2:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [31:0] i_16;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_136184 dut (
    .ACLK(clk),
    .ARESETN(i_0),
    .S_AXI_AWADDR(i_1),
    .S_AXI_AWCACHE(i_2),
    .S_AXI_AWPROT(i_3),
    .S_AXI_AWVALID(i_4),
    .S_AXI_WDATA(i_5),
    .S_AXI_WSTRB(i_6),
    .S_AXI_WVALID(i_7),
    .S_AXI_BREADY(i_8),
    .S_AXI_ARADDR(i_9),
    .S_AXI_ARCACHE(i_10),
    .S_AXI_ARPROT(i_11),
    .S_AXI_ARVALID(i_12),
    .S_AXI_RREADY(i_13),
    .LOCAL_CLK(i_14),
    .LOCAL_ACK(i_15),
    .LOCAL_RDATA(i_16),
    .S_AXI_AWREADY(out_dut[110:110]),
    .S_AXI_WREADY(out_dut[109:109]),
    .S_AXI_BVALID(out_dut[108:108]),
    .S_AXI_BRESP(out_dut[107:106]),
    .S_AXI_ARREADY(out_dut[105:105]),
    .S_AXI_RDATA(out_dut[104:73]),
    .S_AXI_RRESP(out_dut[72:71]),
    .S_AXI_RVALID(out_dut[70:70]),
    .LOCAL_CS(out_dut[69:69]),
    .LOCAL_RNW(out_dut[68:68]),
    .LOCAL_ADDR(out_dut[67:36]),
    .LOCAL_BE(out_dut[35:32]),
    .LOCAL_WDATA(out_dut[31:0])
  );
  origen_136184__ref ref_i (
    .ACLK(clk),
    .ARESETN(i_0),
    .S_AXI_AWADDR(i_1),
    .S_AXI_AWCACHE(i_2),
    .S_AXI_AWPROT(i_3),
    .S_AXI_AWVALID(i_4),
    .S_AXI_WDATA(i_5),
    .S_AXI_WSTRB(i_6),
    .S_AXI_WVALID(i_7),
    .S_AXI_BREADY(i_8),
    .S_AXI_ARADDR(i_9),
    .S_AXI_ARCACHE(i_10),
    .S_AXI_ARPROT(i_11),
    .S_AXI_ARVALID(i_12),
    .S_AXI_RREADY(i_13),
    .LOCAL_CLK(i_14),
    .LOCAL_ACK(i_15),
    .LOCAL_RDATA(i_16),
    .S_AXI_AWREADY(out_ref[110:110]),
    .S_AXI_WREADY(out_ref[109:109]),
    .S_AXI_BVALID(out_ref[108:108]),
    .S_AXI_BRESP(out_ref[107:106]),
    .S_AXI_ARREADY(out_ref[105:105]),
    .S_AXI_RDATA(out_ref[104:73]),
    .S_AXI_RRESP(out_ref[72:71]),
    .S_AXI_RVALID(out_ref[70:70]),
    .LOCAL_CS(out_ref[69:69]),
    .LOCAL_RNW(out_ref[68:68]),
    .LOCAL_ADDR(out_ref[67:36]),
    .LOCAL_BE(out_ref[35:32]),
    .LOCAL_WDATA(out_ref[31:0])
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
    seed = 156502585;
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
