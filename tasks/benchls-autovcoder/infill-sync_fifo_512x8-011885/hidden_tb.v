// Hidden tests: 5000 cycles of seeded random inputs (seed 2784082984); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 23;
  reg clk;
  reg [0:0] i_0;
  reg [7:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_011885 dut (
    .sysClk(clk),
    .sysRst(i_0),
    .in_data(i_1),
    .in_data_valid(i_2),
    .out_data_ready(i_3),
    .in_data_ready(out_dut[22:22]),
    .out_data(out_dut[21:14]),
    .out_data_valid(out_dut[13:13]),
    .fillLevel(out_dut[12:2]),
    .full(out_dut[1:1]),
    .empty(out_dut[0:0])
  );
  autovcoder_011885__ref ref_i (
    .sysClk(clk),
    .sysRst(i_0),
    .in_data(i_1),
    .in_data_valid(i_2),
    .out_data_ready(i_3),
    .in_data_ready(out_ref[22:22]),
    .out_data(out_ref[21:14]),
    .out_data_valid(out_ref[13:13]),
    .fillLevel(out_ref[12:2]),
    .full(out_ref[1:1]),
    .empty(out_ref[0:0])
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
    seed = 2784082984;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
