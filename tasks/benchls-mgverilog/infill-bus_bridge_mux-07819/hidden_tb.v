// Hidden tests: 5000 cycles of seeded random inputs (seed 3366047902); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 98;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [14:0] i_5;
  reg [3:0] i_6;
  reg [0:0] i_7;
  reg [35:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [35:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_07819 dut (
    .clk(clk),
    .reset(i_0),
    .m_wr_rs(i_1),
    .m_rq_cyc(i_2),
    .m_rd_rq(i_3),
    .m_wr_rq(i_4),
    .m_ma(i_5),
    .m_sel(i_6),
    .m_fmc_select(i_7),
    .m_mb_write(i_8),
    .s0_addr_ack(i_9),
    .s0_rd_rs(i_10),
    .s0_mb_read(i_11),
    .m_addr_ack(out_dut[97:97]),
    .m_rd_rs(out_dut[96:96]),
    .m_mb_read(out_dut[95:60]),
    .s0_wr_rs(out_dut[59:59]),
    .s0_rq_cyc(out_dut[58:58]),
    .s0_rd_rq(out_dut[57:57]),
    .s0_wr_rq(out_dut[56:56]),
    .s0_ma(out_dut[55:41]),
    .s0_sel(out_dut[40:37]),
    .s0_fmc_select(out_dut[36:36]),
    .s0_mb_write(out_dut[35:0])
  );
  mg_07819__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .m_wr_rs(i_1),
    .m_rq_cyc(i_2),
    .m_rd_rq(i_3),
    .m_wr_rq(i_4),
    .m_ma(i_5),
    .m_sel(i_6),
    .m_fmc_select(i_7),
    .m_mb_write(i_8),
    .s0_addr_ack(i_9),
    .s0_rd_rs(i_10),
    .s0_mb_read(i_11),
    .m_addr_ack(out_ref[97:97]),
    .m_rd_rs(out_ref[96:96]),
    .m_mb_read(out_ref[95:60]),
    .s0_wr_rs(out_ref[59:59]),
    .s0_rq_cyc(out_ref[58:58]),
    .s0_rd_rq(out_ref[57:57]),
    .s0_wr_rq(out_ref[56:56]),
    .s0_ma(out_ref[55:41]),
    .s0_sel(out_ref[40:37]),
    .s0_fmc_select(out_ref[36:36]),
    .s0_mb_write(out_ref[35:0])
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
    seed = 3366047902;
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
      i_8 = {$random(seed), $random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed), $random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
