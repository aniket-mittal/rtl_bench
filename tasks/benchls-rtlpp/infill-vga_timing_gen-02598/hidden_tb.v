// Hidden tests: 5000 cycles of seeded random inputs (seed 784765066); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 47;
  reg clk;
  reg [0:0] i_0;
  reg [7:0] i_1;
  reg [7:0] i_2;
  reg [7:0] i_3;
  reg [9:0] i_4;
  reg [9:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_02598 dut (
    .Clock(clk),
    .Reset(i_0),
    .Red(i_1),
    .Green(i_2),
    .Blue(i_3),
    .VScrollOffset(i_4),
    .HScrollOffset(i_5),
    .H_Sync_out(out_dut[46:46]),
    .V_Sync_out(out_dut[45:45]),
    .VideoBlanking_L(out_dut[44:44]),
    .Red_out(out_dut[43:36]),
    .Green_out(out_dut[35:28]),
    .Blue_out(out_dut[27:20]),
    .Column_out(out_dut[19:10]),
    .Row_out(out_dut[9:0])
  );
  rtlpp_02598__ref ref_i (
    .Clock(clk),
    .Reset(i_0),
    .Red(i_1),
    .Green(i_2),
    .Blue(i_3),
    .VScrollOffset(i_4),
    .HScrollOffset(i_5),
    .H_Sync_out(out_ref[46:46]),
    .V_Sync_out(out_ref[45:45]),
    .VideoBlanking_L(out_ref[44:44]),
    .Red_out(out_ref[43:36]),
    .Green_out(out_ref[35:28]),
    .Blue_out(out_ref[27:20]),
    .Column_out(out_ref[19:10]),
    .Row_out(out_ref[9:0])
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
    seed = 784765066;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
