// Hidden tests: 5000 cycles of seeded random inputs (seed 2395522841); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 424;
  reg clk;
  reg [0:0] i_0;
  reg [103:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [103:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [103:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [103:0] i_10;
  reg [0:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_01754 dut (
    .cmesh_access_in(i_0),
    .cmesh_packet_in(i_1),
    .cmesh_wait_in(i_2),
    .rmesh_access_in(i_3),
    .rmesh_packet_in(i_4),
    .rmesh_wait_in(i_5),
    .xmesh_access_in(i_6),
    .xmesh_packet_in(i_7),
    .xmesh_wait_in(i_8),
    .emesh_access_in(i_9),
    .emesh_packet_in(i_10),
    .emesh_wait_in(i_11),
    .cmesh_wait_out(out_dut[423:423]),
    .cmesh_access_out(out_dut[422:422]),
    .cmesh_packet_out(out_dut[421:318]),
    .rmesh_wait_out(out_dut[317:317]),
    .rmesh_access_out(out_dut[316:316]),
    .rmesh_packet_out(out_dut[315:212]),
    .xmesh_wait_out(out_dut[211:211]),
    .xmesh_access_out(out_dut[210:210]),
    .xmesh_packet_out(out_dut[209:106]),
    .emesh_wait_out(out_dut[105:105]),
    .emesh_access_out(out_dut[104:104]),
    .emesh_packet_out(out_dut[103:0])
  );
  mg_01754__ref ref_i (
    .cmesh_access_in(i_0),
    .cmesh_packet_in(i_1),
    .cmesh_wait_in(i_2),
    .rmesh_access_in(i_3),
    .rmesh_packet_in(i_4),
    .rmesh_wait_in(i_5),
    .xmesh_access_in(i_6),
    .xmesh_packet_in(i_7),
    .xmesh_wait_in(i_8),
    .emesh_access_in(i_9),
    .emesh_packet_in(i_10),
    .emesh_wait_in(i_11),
    .cmesh_wait_out(out_ref[423:423]),
    .cmesh_access_out(out_ref[422:422]),
    .cmesh_packet_out(out_ref[421:318]),
    .rmesh_wait_out(out_ref[317:317]),
    .rmesh_access_out(out_ref[316:316]),
    .rmesh_packet_out(out_ref[315:212]),
    .xmesh_wait_out(out_ref[211:211]),
    .xmesh_access_out(out_ref[210:210]),
    .xmesh_packet_out(out_ref[209:106]),
    .emesh_wait_out(out_ref[105:105]),
    .emesh_access_out(out_ref[104:104]),
    .emesh_packet_out(out_ref[103:0])
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
    seed = 2395522841;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed), $random(seed), $random(seed), $random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed), $random(seed), $random(seed), $random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed), $random(seed), $random(seed), $random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed), $random(seed), $random(seed), $random(seed)};
      i_11 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
