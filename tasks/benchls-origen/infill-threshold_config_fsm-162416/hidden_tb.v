// Hidden tests: 5000 cycles of seeded random inputs (seed 208388755); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 34;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_162416 dut (
    .clk(clk),
    .reset(i_0),
    .umbralMF(i_1),
    .umbralVC(i_2),
    .umbralD(i_3),
    .Fifo_empties(i_4),
    .Fifo_errors(i_5),
    .init(i_6),
    .init_out(out_dut[33:33]),
    .idle_out(out_dut[32:32]),
    .active_out(out_dut[31:31]),
    .error_out(out_dut[30:30]),
    .umbralMF_out(out_dut[29:22]),
    .umbralVC_out(out_dut[21:14]),
    .umbralD_out(out_dut[13:6]),
    .state(out_dut[5:3]),
    .next_state(out_dut[2:0])
  );
  origen_162416__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .umbralMF(i_1),
    .umbralVC(i_2),
    .umbralD(i_3),
    .Fifo_empties(i_4),
    .Fifo_errors(i_5),
    .init(i_6),
    .init_out(out_ref[33:33]),
    .idle_out(out_ref[32:32]),
    .active_out(out_ref[31:31]),
    .error_out(out_ref[30:30]),
    .umbralMF_out(out_ref[29:22]),
    .umbralVC_out(out_ref[21:14]),
    .umbralD_out(out_ref[13:6]),
    .state(out_ref[5:3]),
    .next_state(out_ref[2:0])
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
    seed = 208388755;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
