// Hidden tests: 5000 cycles of seeded random inputs (seed 1195263916); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 275;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [63:0] i_3;
  reg [63:0] i_4;
  reg [3:0] i_5;
  reg [63:0] i_6;
  reg [8:0] i_7;
  reg [63:0] i_8;
  reg [63:0] i_9;
  reg [0:0] i_10;
  reg [3:0] i_11;
  reg [0:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_012794 dut (
    .clk(clk),
    .new_inst(i_0),
    .p1(i_1),
    .p2(i_2),
    .src1(i_3),
    .src2(i_4),
    .vb_request(i_5),
    .vb_data_in(i_6),
    .vb_tag_in(i_7),
    .res1(i_8),
    .res2(i_9),
    .busy(i_10),
    .wb_request(i_11),
    .kill(i_12),
    .vb_data_out(out_dut[274:211]),
    .vb_tag_out(out_dut[210:202]),
    .op1(out_dut[201:138]),
    .op2(out_dut[137:74]),
    .wb_data(out_dut[73:10]),
    .wb_tag(out_dut[9:1]),
    .nmi(out_dut[0:0])
  );
  origen_012794__ref ref_i (
    .clk(clk),
    .new_inst(i_0),
    .p1(i_1),
    .p2(i_2),
    .src1(i_3),
    .src2(i_4),
    .vb_request(i_5),
    .vb_data_in(i_6),
    .vb_tag_in(i_7),
    .res1(i_8),
    .res2(i_9),
    .busy(i_10),
    .wb_request(i_11),
    .kill(i_12),
    .vb_data_out(out_ref[274:211]),
    .vb_tag_out(out_ref[210:202]),
    .op1(out_ref[201:138]),
    .op2(out_ref[137:74]),
    .wb_data(out_ref[73:10]),
    .wb_tag(out_ref[9:1]),
    .nmi(out_ref[0:0])
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
    seed = 1195263916;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed), $random(seed)};
      i_4 = {$random(seed), $random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed), $random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed), $random(seed)};
      i_9 = {$random(seed), $random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
