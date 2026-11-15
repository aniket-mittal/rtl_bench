// Hidden tests: 5000 cycles of seeded random inputs (seed 649397696); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 76;
  reg clk;
  reg [15:0] i_0;
  reg [1:0] i_1;
  reg [0:0] i_2;
  reg [1:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_04312 dut (
    .flit(i_0),
    .ctrl(i_1),
    .en_dest_fifo(i_2),
    .dest_fifo(i_3),
    .flit2pass_req(out_dut[75:60]),
    .ctrl2pass_req(out_dut[59:58]),
    .flit2pass_rep(out_dut[57:42]),
    .ctrl2pass_rep(out_dut[41:40]),
    .flit2local_in_req(out_dut[39:24]),
    .ctrl2local_in_req(out_dut[23:22]),
    .flit2local_in_rep(out_dut[21:6]),
    .ctrl2local_in_rep(out_dut[5:4]),
    .en_pass_req(out_dut[3:3]),
    .en_pass_rep(out_dut[2:2]),
    .en_local_in_req(out_dut[1:1]),
    .en_local_in_rep(out_dut[0:0])
  );
  mg_04312__ref ref_i (
    .flit(i_0),
    .ctrl(i_1),
    .en_dest_fifo(i_2),
    .dest_fifo(i_3),
    .flit2pass_req(out_ref[75:60]),
    .ctrl2pass_req(out_ref[59:58]),
    .flit2pass_rep(out_ref[57:42]),
    .ctrl2pass_rep(out_ref[41:40]),
    .flit2local_in_req(out_ref[39:24]),
    .ctrl2local_in_req(out_ref[23:22]),
    .flit2local_in_rep(out_ref[21:6]),
    .ctrl2local_in_rep(out_ref[5:4]),
    .en_pass_req(out_ref[3:3]),
    .en_pass_rep(out_ref[2:2]),
    .en_local_in_req(out_ref[1:1]),
    .en_local_in_rep(out_ref[0:0])
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
    seed = 649397696;
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
