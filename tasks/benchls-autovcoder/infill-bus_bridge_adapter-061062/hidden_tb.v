// Hidden tests: 5000 cycles of seeded random inputs (seed 3481998340); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 102;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [21:0] i_3;
  reg [5:0] i_4;
  reg [0:0] i_5;
  reg [3:0] i_6;
  reg [31:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [31:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_061062 dut (
    .clk_core(clk),
    .rst_x(i_0),
    .i_req(i_1),
    .i_wr(i_2),
    .i_adrs(i_3),
    .i_len(i_4),
    .i_strw(i_5),
    .i_be(i_6),
    .i_dbw(i_7),
    .i_ack(i_8),
    .i_ackw(i_9),
    .i_strr(i_10),
    .i_dbr(i_11),
    .o_ack(out_dut[101:101]),
    .o_ackw(out_dut[100:100]),
    .o_strr(out_dut[99:99]),
    .o_dbr(out_dut[98:67]),
    .o_req(out_dut[66:66]),
    .o_wr(out_dut[65:65]),
    .o_adrs(out_dut[64:43]),
    .o_len(out_dut[42:37]),
    .o_strw(out_dut[36:36]),
    .o_be(out_dut[35:32]),
    .o_dbw(out_dut[31:0])
  );
  autovcoder_061062__ref ref_i (
    .clk_core(clk),
    .rst_x(i_0),
    .i_req(i_1),
    .i_wr(i_2),
    .i_adrs(i_3),
    .i_len(i_4),
    .i_strw(i_5),
    .i_be(i_6),
    .i_dbw(i_7),
    .i_ack(i_8),
    .i_ackw(i_9),
    .i_strr(i_10),
    .i_dbr(i_11),
    .o_ack(out_ref[101:101]),
    .o_ackw(out_ref[100:100]),
    .o_strr(out_ref[99:99]),
    .o_dbr(out_ref[98:67]),
    .o_req(out_ref[66:66]),
    .o_wr(out_ref[65:65]),
    .o_adrs(out_ref[64:43]),
    .o_len(out_ref[42:37]),
    .o_strw(out_ref[36:36]),
    .o_be(out_ref[35:32]),
    .o_dbw(out_ref[31:0])
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
    seed = 3481998340;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
