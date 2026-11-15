// Hidden tests: 5000 cycles of seeded random inputs (seed 973038760); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 26;
  reg clk;
  reg [7:0] i_0;
  reg [0:0] i_1;
  reg [7:0] i_2;
  reg [7:0] i_3;
  reg [0:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_00038 dut (
    .scache3_cpx_req_bufpt_cq_l(i_0),
    .scache3_cpx_atom_bufpt_cq_l(i_1),
    .io_cpx_req_bufpt_cq_l(i_2),
    .cpx_scache3_grant_bufp3_ca_l(i_3),
    .cpx_spc7_data_rdy_bufp3_cx(i_4),
    .scache3_cpx_req_bufp4_cq(out_dut[25:18]),
    .scache3_cpx_atom_bufp4_cq(out_dut[17:17]),
    .io_cpx_req_bufp4_cq(out_dut[16:9]),
    .cpx_scache3_grant_bufp4_ca(out_dut[8:1]),
    .cpx_spc7_data_rdy_bufp4_cx(out_dut[0:0])
  );
  mg_00038__ref ref_i (
    .scache3_cpx_req_bufpt_cq_l(i_0),
    .scache3_cpx_atom_bufpt_cq_l(i_1),
    .io_cpx_req_bufpt_cq_l(i_2),
    .cpx_scache3_grant_bufp3_ca_l(i_3),
    .cpx_spc7_data_rdy_bufp3_cx(i_4),
    .scache3_cpx_req_bufp4_cq(out_ref[25:18]),
    .scache3_cpx_atom_bufp4_cq(out_ref[17:17]),
    .io_cpx_req_bufp4_cq(out_ref[16:9]),
    .cpx_scache3_grant_bufp4_ca(out_ref[8:1]),
    .cpx_spc7_data_rdy_bufp4_cx(out_ref[0:0])
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
    seed = 973038760;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
