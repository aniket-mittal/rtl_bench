// Hidden tests: 5000 cycles of seeded random inputs (seed 432042807); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 67;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [4:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [3:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [4:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [23:0] i_11;
  reg [0:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_01288 dut (
    .ap_clk(clk),
    .ap_rst_n(i_0),
    .s_axilite_AWVALID(i_1),
    .s_axilite_AWADDR(i_2),
    .s_axilite_WVALID(i_3),
    .s_axilite_WDATA(i_4),
    .s_axilite_WSTRB(i_5),
    .s_axilite_BREADY(i_6),
    .s_axilite_ARVALID(i_7),
    .s_axilite_ARADDR(i_8),
    .s_axilite_RREADY(i_9),
    .in0_V_TVALID(i_10),
    .in0_V_TDATA(i_11),
    .out_V_TREADY(i_12),
    .s_axilite_AWREADY(out_dut[66:66]),
    .s_axilite_WREADY(out_dut[65:65]),
    .s_axilite_BVALID(out_dut[64:64]),
    .s_axilite_BRESP(out_dut[63:62]),
    .s_axilite_ARREADY(out_dut[61:61]),
    .s_axilite_RVALID(out_dut[60:60]),
    .s_axilite_RDATA(out_dut[59:28]),
    .s_axilite_RRESP(out_dut[27:26]),
    .in0_V_TREADY(out_dut[25:25]),
    .out_V_TVALID(out_dut[24:24]),
    .out_V_TDATA(out_dut[23:0])
  );
  rtlpp_01288__ref ref_i (
    .ap_clk(clk),
    .ap_rst_n(i_0),
    .s_axilite_AWVALID(i_1),
    .s_axilite_AWADDR(i_2),
    .s_axilite_WVALID(i_3),
    .s_axilite_WDATA(i_4),
    .s_axilite_WSTRB(i_5),
    .s_axilite_BREADY(i_6),
    .s_axilite_ARVALID(i_7),
    .s_axilite_ARADDR(i_8),
    .s_axilite_RREADY(i_9),
    .in0_V_TVALID(i_10),
    .in0_V_TDATA(i_11),
    .out_V_TREADY(i_12),
    .s_axilite_AWREADY(out_ref[66:66]),
    .s_axilite_WREADY(out_ref[65:65]),
    .s_axilite_BVALID(out_ref[64:64]),
    .s_axilite_BRESP(out_ref[63:62]),
    .s_axilite_ARREADY(out_ref[61:61]),
    .s_axilite_RVALID(out_ref[60:60]),
    .s_axilite_RDATA(out_ref[59:28]),
    .s_axilite_RRESP(out_ref[27:26]),
    .in0_V_TREADY(out_ref[25:25]),
    .out_V_TVALID(out_ref[24:24]),
    .out_V_TDATA(out_ref[23:0])
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
    seed = 432042807;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
