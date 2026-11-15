// Hidden tests: 5000 cycles of seeded random inputs (seed 2182513233); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 66;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [29:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_01505 dut (
    .dirrep_dir_wr_par_c4(i_0),
    .dir_vld_c4_l(i_1),
    .lkup_addr8_c4(i_2),
    .tagdp_lkup_addr_c4(i_3),
    .lkup_wr_data_up_buf(out_dut[65:33]),
    .lkup_wr_data_dn_buf(out_dut[32:0])
  );
  mg_01505__ref ref_i (
    .dirrep_dir_wr_par_c4(i_0),
    .dir_vld_c4_l(i_1),
    .lkup_addr8_c4(i_2),
    .tagdp_lkup_addr_c4(i_3),
    .lkup_wr_data_up_buf(out_ref[65:33]),
    .lkup_wr_data_dn_buf(out_ref[32:0])
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
    seed = 2182513233;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
