// Hidden tests: 5000 cycles of seeded random inputs (seed 2624442905); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 121;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [63:0] i_4;
  reg [0:0] i_5;
  reg [1:0] i_6;
  reg [0:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_215945 dut (
    .ACLK(clk),
    .ARESETN(i_0),
    .CONFIG_VALID(i_1),
    .CONFIG_START_ADDR(i_2),
    .CONFIG_NBYTES(i_3),
    .DATA(i_4),
    .DATA_VALID(i_5),
    .M_AXI_BRESP(i_6),
    .M_AXI_BVALID(i_7),
    .M_AXI_AWADDR(out_dut[120:89]),
    .M_AXI_AWREADY(out_dut[88:88]),
    .M_AXI_AWVALID(out_dut[87:87]),
    .M_AXI_WDATA(out_dut[86:23]),
    .M_AXI_WSTRB(out_dut[22:15]),
    .M_AXI_WREADY(out_dut[14:14]),
    .M_AXI_WVALID(out_dut[13:13]),
    .M_AXI_WLAST(out_dut[12:12]),
    .M_AXI_BREADY(out_dut[11:11]),
    .M_AXI_AWLEN(out_dut[10:7]),
    .M_AXI_AWSIZE(out_dut[6:4]),
    .M_AXI_AWBURST(out_dut[3:2]),
    .CONFIG_READY(out_dut[1:1]),
    .DATA_READY(out_dut[0:0])
  );
  origen_215945__ref ref_i (
    .ACLK(clk),
    .ARESETN(i_0),
    .CONFIG_VALID(i_1),
    .CONFIG_START_ADDR(i_2),
    .CONFIG_NBYTES(i_3),
    .DATA(i_4),
    .DATA_VALID(i_5),
    .M_AXI_BRESP(i_6),
    .M_AXI_BVALID(i_7),
    .M_AXI_AWADDR(out_ref[120:89]),
    .M_AXI_AWREADY(out_ref[88:88]),
    .M_AXI_AWVALID(out_ref[87:87]),
    .M_AXI_WDATA(out_ref[86:23]),
    .M_AXI_WSTRB(out_ref[22:15]),
    .M_AXI_WREADY(out_ref[14:14]),
    .M_AXI_WVALID(out_ref[13:13]),
    .M_AXI_WLAST(out_ref[12:12]),
    .M_AXI_BREADY(out_ref[11:11]),
    .M_AXI_AWLEN(out_ref[10:7]),
    .M_AXI_AWSIZE(out_ref[6:4]),
    .M_AXI_AWBURST(out_ref[3:2]),
    .CONFIG_READY(out_ref[1:1]),
    .DATA_READY(out_ref[0:0])
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
    seed = 2624442905;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed), $random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
