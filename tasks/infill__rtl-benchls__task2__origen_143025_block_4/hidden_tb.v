// Hidden tests: 5000 cycles of seeded random inputs (seed 2906688133); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 105;
  reg clk;
  reg [63:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [7:0] i_5;
  reg [0:0] i_6;
  reg [6:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_143025 dut (
    .user_clk(clk),
    .trn_rd(i_0),
    .trn_rsof(i_1),
    .trn_reof(i_2),
    .trn_rsrc_rdy(i_3),
    .trn_rsrc_dsc(i_4),
    .trn_rrem(i_5),
    .trn_rerrfwd(i_6),
    .trn_rbar_hit(i_7),
    .trn_recrc_err(i_8),
    .user_rst(i_9),
    .m_axis_rx_tready(i_10),
    .m_axis_rx_tdata(out_dut[104:41]),
    .m_axis_rx_tvalid(out_dut[40:40]),
    .m_axis_rx_tkeep(out_dut[39:32]),
    .m_axis_rx_tlast(out_dut[31:31]),
    .m_axis_rx_tuser(out_dut[30:9]),
    .trn_rdst_rdy(out_dut[8:8]),
    .np_counter(out_dut[7:0])
  );
  origen_143025__ref ref_i (
    .user_clk(clk),
    .trn_rd(i_0),
    .trn_rsof(i_1),
    .trn_reof(i_2),
    .trn_rsrc_rdy(i_3),
    .trn_rsrc_dsc(i_4),
    .trn_rrem(i_5),
    .trn_rerrfwd(i_6),
    .trn_rbar_hit(i_7),
    .trn_recrc_err(i_8),
    .user_rst(i_9),
    .m_axis_rx_tready(i_10),
    .m_axis_rx_tdata(out_ref[104:41]),
    .m_axis_rx_tvalid(out_ref[40:40]),
    .m_axis_rx_tkeep(out_ref[39:32]),
    .m_axis_rx_tlast(out_ref[31:31]),
    .m_axis_rx_tuser(out_ref[30:9]),
    .trn_rdst_rdy(out_ref[8:8]),
    .np_counter(out_ref[7:0])
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
    seed = 2906688133;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed), $random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_10 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
