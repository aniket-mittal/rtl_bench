// Hidden tests: 5000 cycles of seeded random inputs (seed 2822276549); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 215;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [0:0] i_3;
  reg [3:0] i_4;
  reg [0:0] i_5;
  reg [10:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [31:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [10:0] i_14;
  reg [31:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  reg [10:0] i_19;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  dcache_mux dut (
    .clk_i(clk),
    .rst_i(i_0),
    .mem_addr_i(i_1),
    .mem_data_wr_i(i_2),
    .mem_rd_i(i_3),
    .mem_wr_i(i_4),
    .mem_cacheable_i(i_5),
    .mem_req_tag_i(i_6),
    .mem_invalidate_i(i_7),
    .mem_writeback_i(i_8),
    .mem_flush_i(i_9),
    .mem_cached_data_rd_i(i_10),
    .mem_cached_accept_i(i_11),
    .mem_cached_ack_i(i_12),
    .mem_cached_error_i(i_13),
    .mem_cached_resp_tag_i(i_14),
    .mem_uncached_data_rd_i(i_15),
    .mem_uncached_accept_i(i_16),
    .mem_uncached_ack_i(i_17),
    .mem_uncached_error_i(i_18),
    .mem_uncached_resp_tag_i(i_19),
    .mem_data_rd_o(out_dut[214:183]),
    .mem_accept_o(out_dut[182:182]),
    .mem_ack_o(out_dut[181:181]),
    .mem_error_o(out_dut[180:180]),
    .mem_resp_tag_o(out_dut[179:169]),
    .mem_cached_addr_o(out_dut[168:137]),
    .mem_cached_data_wr_o(out_dut[136:105]),
    .mem_cached_rd_o(out_dut[104:104]),
    .mem_cached_wr_o(out_dut[103:100]),
    .mem_cached_cacheable_o(out_dut[99:99]),
    .mem_cached_req_tag_o(out_dut[98:88]),
    .mem_cached_invalidate_o(out_dut[87:87]),
    .mem_cached_writeback_o(out_dut[86:86]),
    .mem_cached_flush_o(out_dut[85:85]),
    .mem_uncached_addr_o(out_dut[84:53]),
    .mem_uncached_data_wr_o(out_dut[52:21]),
    .mem_uncached_rd_o(out_dut[20:20]),
    .mem_uncached_wr_o(out_dut[19:16]),
    .mem_uncached_cacheable_o(out_dut[15:15]),
    .mem_uncached_req_tag_o(out_dut[14:4]),
    .mem_uncached_invalidate_o(out_dut[3:3]),
    .mem_uncached_writeback_o(out_dut[2:2]),
    .mem_uncached_flush_o(out_dut[1:1]),
    .cache_active_o(out_dut[0:0])
  );
  dcache_mux__ref ref_i (
    .clk_i(clk),
    .rst_i(i_0),
    .mem_addr_i(i_1),
    .mem_data_wr_i(i_2),
    .mem_rd_i(i_3),
    .mem_wr_i(i_4),
    .mem_cacheable_i(i_5),
    .mem_req_tag_i(i_6),
    .mem_invalidate_i(i_7),
    .mem_writeback_i(i_8),
    .mem_flush_i(i_9),
    .mem_cached_data_rd_i(i_10),
    .mem_cached_accept_i(i_11),
    .mem_cached_ack_i(i_12),
    .mem_cached_error_i(i_13),
    .mem_cached_resp_tag_i(i_14),
    .mem_uncached_data_rd_i(i_15),
    .mem_uncached_accept_i(i_16),
    .mem_uncached_ack_i(i_17),
    .mem_uncached_error_i(i_18),
    .mem_uncached_resp_tag_i(i_19),
    .mem_data_rd_o(out_ref[214:183]),
    .mem_accept_o(out_ref[182:182]),
    .mem_ack_o(out_ref[181:181]),
    .mem_error_o(out_ref[180:180]),
    .mem_resp_tag_o(out_ref[179:169]),
    .mem_cached_addr_o(out_ref[168:137]),
    .mem_cached_data_wr_o(out_ref[136:105]),
    .mem_cached_rd_o(out_ref[104:104]),
    .mem_cached_wr_o(out_ref[103:100]),
    .mem_cached_cacheable_o(out_ref[99:99]),
    .mem_cached_req_tag_o(out_ref[98:88]),
    .mem_cached_invalidate_o(out_ref[87:87]),
    .mem_cached_writeback_o(out_ref[86:86]),
    .mem_cached_flush_o(out_ref[85:85]),
    .mem_uncached_addr_o(out_ref[84:53]),
    .mem_uncached_data_wr_o(out_ref[52:21]),
    .mem_uncached_rd_o(out_ref[20:20]),
    .mem_uncached_wr_o(out_ref[19:16]),
    .mem_uncached_cacheable_o(out_ref[15:15]),
    .mem_uncached_req_tag_o(out_ref[14:4]),
    .mem_uncached_invalidate_o(out_ref[3:3]),
    .mem_uncached_writeback_o(out_ref[2:2]),
    .mem_uncached_flush_o(out_ref[1:1]),
    .cache_active_o(out_ref[0:0])
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
    seed = 2822276549;
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
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
