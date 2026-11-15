// Hidden tests: 5000 cycles of seeded random inputs (seed 2319355119); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 83;
  reg clk;
  reg [6:0] i_0;
  reg [0:0] i_1;
  reg [3:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  reg [0:0] i_6;
  reg [7:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_04285 dut (
    .WBs_CLK_i(clk),
    .WBs_ADR_i(i_0),
    .WBs_CYC_i(i_1),
    .WBs_BYTE_STB_i(i_2),
    .WBs_WE_i(i_3),
    .WBs_STB_i(i_4),
    .WBs_DAT_i(i_5),
    .WBs_RST_i(i_6),
    .GPIO_IN_i(i_7),
    .WBs_DAT_o(out_dut[82:51]),
    .WBs_ACK_o(out_dut[50:50]),
    .CLK_4M_CNTL_o(out_dut[49:49]),
    .CLK_1M_CNTL_o(out_dut[48:48]),
    .Device_ID_o(out_dut[47:16]),
    .GPIO_OUT_o(out_dut[15:8]),
    .GPIO_OE_o(out_dut[7:0])
  );
  rtlpp_04285__ref ref_i (
    .WBs_CLK_i(clk),
    .WBs_ADR_i(i_0),
    .WBs_CYC_i(i_1),
    .WBs_BYTE_STB_i(i_2),
    .WBs_WE_i(i_3),
    .WBs_STB_i(i_4),
    .WBs_DAT_i(i_5),
    .WBs_RST_i(i_6),
    .GPIO_IN_i(i_7),
    .WBs_DAT_o(out_ref[82:51]),
    .WBs_ACK_o(out_ref[50:50]),
    .CLK_4M_CNTL_o(out_ref[49:49]),
    .CLK_1M_CNTL_o(out_ref[48:48]),
    .Device_ID_o(out_ref[47:16]),
    .GPIO_OUT_o(out_ref[15:8]),
    .GPIO_OE_o(out_ref[7:0])
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
    seed = 2319355119;
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
      i_6 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
