// Hidden tests: 5000 cycles of seeded random inputs (seed 3209123597); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 29;
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
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  axis_pipeline_fifo dut (
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
    .s_axis_tready(out_dut[28:28]),
    .m_axis_tdata(out_dut[27:20]),
    .m_axis_tkeep(out_dut[19:19]),
    .m_axis_tvalid(out_dut[18:18]),
    .m_axis_tlast(out_dut[17:17]),
    .m_axis_tid(out_dut[16:9]),
    .m_axis_tdest(out_dut[8:1]),
    .m_axis_tuser(out_dut[0:0])
  );
  axis_pipeline_fifo__ref ref_i (
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
    .s_axis_tready(out_ref[28:28]),
    .m_axis_tdata(out_ref[27:20]),
    .m_axis_tkeep(out_ref[19:19]),
    .m_axis_tvalid(out_ref[18:18]),
    .m_axis_tlast(out_ref[17:17]),
    .m_axis_tid(out_ref[16:9]),
    .m_axis_tdest(out_ref[8:1]),
    .m_axis_tuser(out_ref[0:0])
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
    seed = 3209123597;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
