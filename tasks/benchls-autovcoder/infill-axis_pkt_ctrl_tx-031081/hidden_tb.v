// Hidden tests: 5000 cycles of seeded random inputs (seed 4269958573); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 39;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [11:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [31:0] i_7;
  reg [3:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_031081 dut (
    .m_axis_txc_aclk(clk),
    .m_axis_txd_tvalid(i_0),
    .m_axis_txd_tlast(i_1),
    .m_axis_txd_tready(i_2),
    .tx_pkt_byte_cnt(i_3),
    .tx_pkt_byte_cnt_vld(i_4),
    .s_axis_rxs_aclk(i_5),
    .s_axis_rxs_aresetn(i_6),
    .s_axis_rxs_tdata(i_7),
    .s_axis_rxs_tkeep(i_8),
    .s_axis_rxs_tlast(i_9),
    .s_axis_rxs_tvalid(i_10),
    .m_axis_txc_aresetn(i_11),
    .m_axis_txc_tready(i_12),
    .s_axis_rxs_tready(out_dut[38:38]),
    .m_axis_txc_tvalid(out_dut[37:37]),
    .m_axis_txc_tdata(out_dut[36:5]),
    .m_axis_txc_tkeep(out_dut[4:1]),
    .m_axis_txc_tlast(out_dut[0:0])
  );
  autovcoder_031081__ref ref_i (
    .m_axis_txc_aclk(clk),
    .m_axis_txd_tvalid(i_0),
    .m_axis_txd_tlast(i_1),
    .m_axis_txd_tready(i_2),
    .tx_pkt_byte_cnt(i_3),
    .tx_pkt_byte_cnt_vld(i_4),
    .s_axis_rxs_aclk(i_5),
    .s_axis_rxs_aresetn(i_6),
    .s_axis_rxs_tdata(i_7),
    .s_axis_rxs_tkeep(i_8),
    .s_axis_rxs_tlast(i_9),
    .s_axis_rxs_tvalid(i_10),
    .m_axis_txc_aresetn(i_11),
    .m_axis_txc_tready(i_12),
    .s_axis_rxs_tready(out_ref[38:38]),
    .m_axis_txc_tvalid(out_ref[37:37]),
    .m_axis_txc_tdata(out_ref[36:5]),
    .m_axis_txc_tkeep(out_ref[4:1]),
    .m_axis_txc_tlast(out_ref[0:0])
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
    seed = 4269958573;
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
      i_6 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
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
