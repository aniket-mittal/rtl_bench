// Hidden tests: 5000 cycles of seeded random inputs (seed 4278931294); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 5;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [2:0] i_7;
  reg [2:0] i_8;
  reg [0:0] i_9;
  reg [7:0] i_10;
  reg [7:0] i_11;
  reg [0:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_02562 dut (
    .clk(clk),
    .reset(i_0),
    .enable(i_1),
    .joint_mode(i_2),
    .page_cross(i_3),
    .joint_req(i_4),
    .prio_top(i_5),
    .prio_high(i_6),
    .prio_top_num(i_7),
    .prio_high_num(i_8),
    .hold(i_9),
    .ch_ready(i_10),
    .ch_active(i_11),
    .finish(i_12),
    .ch_go_out(out_dut[4:4]),
    .ch_num(out_dut[3:1]),
    .ch_last(out_dut[0:0])
  );
  rtlpp_02562__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .enable(i_1),
    .joint_mode(i_2),
    .page_cross(i_3),
    .joint_req(i_4),
    .prio_top(i_5),
    .prio_high(i_6),
    .prio_top_num(i_7),
    .prio_high_num(i_8),
    .hold(i_9),
    .ch_ready(i_10),
    .ch_active(i_11),
    .finish(i_12),
    .ch_go_out(out_ref[4:4]),
    .ch_num(out_ref[3:1]),
    .ch_last(out_ref[0:0])
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
    seed = 4278931294;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
