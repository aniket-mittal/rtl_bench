// Hidden tests: 5000 cycles of seeded random inputs (seed 855945392); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 342;
  reg clk;
  reg [4:0] i_0;
  reg [1:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [20:0] i_4;
  reg [15:0] i_5;
  reg [0:0] i_6;
  reg [4:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [127:0] i_10;
  reg [127:0] i_11;
  reg [31:0] i_12;
  reg [0:0] i_13;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_00626 dut (
    .clk(clk),
    .aluop_in(i_0),
    .ww_in(i_1),
    .memEn_in(i_2),
    .memWrEn_in(i_3),
    .memAddr_in(i_4),
    .wbyteen_in(i_5),
    .regwren_in(i_6),
    .rwraddrd_in(i_7),
    .reginmuxop_in(i_8),
    .aluinmuxop_in(i_9),
    .immediate_in(i_10),
    .wrdata(i_11),
    .instruction_in(i_12),
    .reset(i_13),
    .aluop_out(out_dut[341:337]),
    .ww_out(out_dut[336:335]),
    .memEn_out(out_dut[334:334]),
    .memWrEn_out(out_dut[333:333]),
    .memAddr_out(out_dut[332:312]),
    .wbyteen_out(out_dut[311:296]),
    .regwren_out(out_dut[295:295]),
    .rwraddrd_out(out_dut[294:290]),
    .reginmuxop_out(out_dut[289:289]),
    .aluinmuxop_out(out_dut[288:288]),
    .immediate_out(out_dut[287:160]),
    .hz1data(out_dut[159:32]),
    .instruction_out(out_dut[31:0])
  );
  mg_00626__ref ref_i (
    .clk(clk),
    .aluop_in(i_0),
    .ww_in(i_1),
    .memEn_in(i_2),
    .memWrEn_in(i_3),
    .memAddr_in(i_4),
    .wbyteen_in(i_5),
    .regwren_in(i_6),
    .rwraddrd_in(i_7),
    .reginmuxop_in(i_8),
    .aluinmuxop_in(i_9),
    .immediate_in(i_10),
    .wrdata(i_11),
    .instruction_in(i_12),
    .reset(i_13),
    .aluop_out(out_ref[341:337]),
    .ww_out(out_ref[336:335]),
    .memEn_out(out_ref[334:334]),
    .memWrEn_out(out_ref[333:333]),
    .memAddr_out(out_ref[332:312]),
    .wbyteen_out(out_ref[311:296]),
    .regwren_out(out_ref[295:295]),
    .rwraddrd_out(out_ref[294:290]),
    .reginmuxop_out(out_ref[289:289]),
    .aluinmuxop_out(out_ref[288:288]),
    .immediate_out(out_ref[287:160]),
    .hz1data(out_ref[159:32]),
    .instruction_out(out_ref[31:0])
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
    seed = 855945392;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed), $random(seed), $random(seed), $random(seed)};
      i_11 = {$random(seed), $random(seed), $random(seed), $random(seed)};
      i_12 = {$random(seed)};
      i_13 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
