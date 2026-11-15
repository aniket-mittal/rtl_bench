// Hidden tests: 5000 cycles of seeded random inputs (seed 2742770212); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 16;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [3:0] i_5;
  reg [3:0] i_6;
  reg [3:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_058286 dut (
    .clk_sys(clk),
    .enable(i_0),
    .hs_in(i_1),
    .vs_in(i_2),
    .hbl_in(i_3),
    .vbl_in(i_4),
    .r_in(i_5),
    .g_in(i_6),
    .b_in(i_7),
    .hs_out(out_dut[15:15]),
    .vs_out(out_dut[14:14]),
    .hbl_out(out_dut[13:13]),
    .vbl_out(out_dut[12:12]),
    .r_out(out_dut[11:8]),
    .g_out(out_dut[7:4]),
    .b_out(out_dut[3:0])
  );
  origen_058286__ref ref_i (
    .clk_sys(clk),
    .enable(i_0),
    .hs_in(i_1),
    .vs_in(i_2),
    .hbl_in(i_3),
    .vbl_in(i_4),
    .r_in(i_5),
    .g_in(i_6),
    .b_in(i_7),
    .hs_out(out_ref[15:15]),
    .vs_out(out_ref[14:14]),
    .hbl_out(out_ref[13:13]),
    .vbl_out(out_ref[12:12]),
    .r_out(out_ref[11:8]),
    .g_out(out_ref[7:4]),
    .b_out(out_ref[3:0])
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
    seed = 2742770212;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
