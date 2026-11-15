// Hidden tests: 5000 cycles of seeded random inputs (seed 3861846787); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 59;
  reg clk;
  reg [0:0] i_0;
  reg [7:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [7:0] i_5;
  reg [7:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  axis_fifo dut (
    .clk(clk),
    .rst(i_0),
    .s_axis_tdata(i_1),
    .s_axis_tkeep(i_2),
    .s_axis_tvalid(i_3),
    .s_axis_tlast(i_4),
    .s_axis_tid(i_5),
    .s_axis_tdest(i_6),
    .s_axis_tuser(i_7),
    .m_axis_tready(i_8),
    .pause_req(i_9),
    .s_axis_tready(out_dut[58:58]),
    .m_axis_tdata(out_dut[57:50]),
    .m_axis_tkeep(out_dut[49:49]),
    .m_axis_tvalid(out_dut[48:48]),
    .m_axis_tlast(out_dut[47:47]),
    .m_axis_tid(out_dut[46:39]),
    .m_axis_tdest(out_dut[38:31]),
    .m_axis_tuser(out_dut[30:30]),
    .pause_ack(out_dut[29:29]),
    .status_depth(out_dut[28:16]),
    .status_depth_commit(out_dut[15:3]),
    .status_overflow(out_dut[2:2]),
    .status_bad_frame(out_dut[1:1]),
    .status_good_frame(out_dut[0:0])
  );
  axis_fifo__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .s_axis_tdata(i_1),
    .s_axis_tkeep(i_2),
    .s_axis_tvalid(i_3),
    .s_axis_tlast(i_4),
    .s_axis_tid(i_5),
    .s_axis_tdest(i_6),
    .s_axis_tuser(i_7),
    .m_axis_tready(i_8),
    .pause_req(i_9),
    .s_axis_tready(out_ref[58:58]),
    .m_axis_tdata(out_ref[57:50]),
    .m_axis_tkeep(out_ref[49:49]),
    .m_axis_tvalid(out_ref[48:48]),
    .m_axis_tlast(out_ref[47:47]),
    .m_axis_tid(out_ref[46:39]),
    .m_axis_tdest(out_ref[38:31]),
    .m_axis_tuser(out_ref[30:30]),
    .pause_ack(out_ref[29:29]),
    .status_depth(out_ref[28:16]),
    .status_depth_commit(out_ref[15:3]),
    .status_overflow(out_ref[2:2]),
    .status_bad_frame(out_ref[1:1]),
    .status_good_frame(out_ref[0:0])
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
    seed = 3861846787;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
