// Hidden tests: 5000 cycles of seeded random inputs (seed 73528886); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 94;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [21:0] i_3;
  reg [3:0] i_4;
  reg [31:0] i_5;
  reg [0:0] i_6;
  reg [21:0] i_7;
  reg [31:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [31:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_061039 dut (
    .clk_core(clk),
    .rst_x(i_0),
    .i_req_sys(i_1),
    .i_wr_sys(i_2),
    .i_adrs_sys(i_3),
    .i_be_sys(i_4),
    .i_dbw_sys(i_5),
    .i_req_dma(i_6),
    .i_adrs_dma(i_7),
    .i_dbw_dma(i_8),
    .i_ack(i_9),
    .i_strr(i_10),
    .i_dbr(i_11),
    .o_ack_sys(out_dut[93:93]),
    .o_strr_sys(out_dut[92:92]),
    .o_dbr_sys(out_dut[91:60]),
    .o_req(out_dut[59:59]),
    .o_wr(out_dut[58:58]),
    .o_adrs(out_dut[57:36]),
    .o_be(out_dut[35:32]),
    .o_dbw(out_dut[31:0])
  );
  autovcoder_061039__ref ref_i (
    .clk_core(clk),
    .rst_x(i_0),
    .i_req_sys(i_1),
    .i_wr_sys(i_2),
    .i_adrs_sys(i_3),
    .i_be_sys(i_4),
    .i_dbw_sys(i_5),
    .i_req_dma(i_6),
    .i_adrs_dma(i_7),
    .i_dbw_dma(i_8),
    .i_ack(i_9),
    .i_strr(i_10),
    .i_dbr(i_11),
    .o_ack_sys(out_ref[93:93]),
    .o_strr_sys(out_ref[92:92]),
    .o_dbr_sys(out_ref[91:60]),
    .o_req(out_ref[59:59]),
    .o_wr(out_ref[58:58]),
    .o_adrs(out_ref[57:36]),
    .o_be(out_ref[35:32]),
    .o_dbw(out_ref[31:0])
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
    seed = 73528886;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
