// Hidden tests: 5000 cycles of seeded random inputs (seed 1741496145); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 17;
  reg clk;
  reg [4:0] i_0;
  reg [0:0] i_1;
  reg [4:0] i_2;
  reg [0:0] i_3;
  reg [4:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_04608 dut (
    .spc6_pcx_req_bufpt_pq_l(i_0),
    .spc6_pcx_atom_bufpt_pq_l(i_1),
    .spc7_pcx_req_bufpt_pq_l(i_2),
    .spc7_pcx_atom_bufpt_pq_l(i_3),
    .pcx_spc7_grant_bufp3_pa_l(i_4),
    .pcx_spc7_grant_bufp4_pa(out_dut[16:12]),
    .spc6_pcx_req_bufp4_pq(out_dut[11:7]),
    .spc6_pcx_atom_bufp4_pq(out_dut[6:6]),
    .spc7_pcx_req_bufp4_pq(out_dut[5:1]),
    .spc7_pcx_atom_bufp4_pq(out_dut[0:0])
  );
  mg_04608__ref ref_i (
    .spc6_pcx_req_bufpt_pq_l(i_0),
    .spc6_pcx_atom_bufpt_pq_l(i_1),
    .spc7_pcx_req_bufpt_pq_l(i_2),
    .spc7_pcx_atom_bufpt_pq_l(i_3),
    .pcx_spc7_grant_bufp3_pa_l(i_4),
    .pcx_spc7_grant_bufp4_pa(out_ref[16:12]),
    .spc6_pcx_req_bufp4_pq(out_ref[11:7]),
    .spc6_pcx_atom_bufp4_pq(out_ref[6:6]),
    .spc7_pcx_req_bufp4_pq(out_ref[5:1]),
    .spc7_pcx_atom_bufp4_pq(out_ref[0:0])
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
    seed = 1741496145;
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
