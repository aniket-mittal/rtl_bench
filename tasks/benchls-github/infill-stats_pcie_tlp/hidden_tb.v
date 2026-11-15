// Hidden tests: 5000 cycles of seeded random inputs (seed 2861011004); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 46;
  reg clk;
  reg [0:0] i_0;
  reg [127:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  stats_pcie_tlp dut (
    .clk(clk),
    .rst(i_0),
    .tlp_hdr(i_1),
    .tlp_valid(i_2),
    .tlp_sop(i_3),
    .tlp_eop(i_4),
    .stat_tlp_mem_rd(out_dut[45:45]),
    .stat_tlp_mem_wr(out_dut[44:44]),
    .stat_tlp_io(out_dut[43:43]),
    .stat_tlp_cfg(out_dut[42:42]),
    .stat_tlp_msg(out_dut[41:41]),
    .stat_tlp_cpl(out_dut[40:40]),
    .stat_tlp_cpl_ur(out_dut[39:39]),
    .stat_tlp_cpl_ca(out_dut[38:38]),
    .stat_tlp_atomic(out_dut[37:37]),
    .stat_tlp_ep(out_dut[36:36]),
    .stat_tlp_hdr_dw(out_dut[35:33]),
    .stat_tlp_req_dw(out_dut[32:22]),
    .stat_tlp_payload_dw(out_dut[21:11]),
    .stat_tlp_cpl_dw(out_dut[10:0])
  );
  stats_pcie_tlp__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .tlp_hdr(i_1),
    .tlp_valid(i_2),
    .tlp_sop(i_3),
    .tlp_eop(i_4),
    .stat_tlp_mem_rd(out_ref[45:45]),
    .stat_tlp_mem_wr(out_ref[44:44]),
    .stat_tlp_io(out_ref[43:43]),
    .stat_tlp_cfg(out_ref[42:42]),
    .stat_tlp_msg(out_ref[41:41]),
    .stat_tlp_cpl(out_ref[40:40]),
    .stat_tlp_cpl_ur(out_ref[39:39]),
    .stat_tlp_cpl_ca(out_ref[38:38]),
    .stat_tlp_atomic(out_ref[37:37]),
    .stat_tlp_ep(out_ref[36:36]),
    .stat_tlp_hdr_dw(out_ref[35:33]),
    .stat_tlp_req_dw(out_ref[32:22]),
    .stat_tlp_payload_dw(out_ref[21:11]),
    .stat_tlp_cpl_dw(out_ref[10:0])
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
    seed = 2861011004;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed), $random(seed), $random(seed), $random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
