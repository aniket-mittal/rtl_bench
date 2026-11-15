// Hidden tests: 5000 cycles of seeded random inputs (seed 1844857480); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 57;
  reg clk;
  reg [49:0] i_0;
  reg [26:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_06391 dut (
    .clk_i(clk),
    .dvdnd_i(i_0),
    .dvsor_i(i_1),
    .sign_dvd_i(i_2),
    .sign_div_i(i_3),
    .start_i(i_4),
    .ready_o(out_dut[56:56]),
    .qutnt_o(out_dut[55:29]),
    .rmndr_o(out_dut[28:2]),
    .sign_o(out_dut[1:1]),
    .div_zero_o(out_dut[0:0])
  );
  mg_06391__ref ref_i (
    .clk_i(clk),
    .dvdnd_i(i_0),
    .dvsor_i(i_1),
    .sign_dvd_i(i_2),
    .sign_div_i(i_3),
    .start_i(i_4),
    .ready_o(out_ref[56:56]),
    .qutnt_o(out_ref[55:29]),
    .rmndr_o(out_ref[28:2]),
    .sign_o(out_ref[1:1]),
    .div_zero_o(out_ref[0:0])
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
    seed = 1844857480;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed), $random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
