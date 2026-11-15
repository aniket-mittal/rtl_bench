// Hidden tests: 5000 cycles of seeded random inputs (seed 971141099); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 34;
  reg clk;
  reg [0:0] i_0;
  reg [28:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_121304 dut (
    .clk(clk),
    .reset(i_0),
    .rom_q(i_1),
    .rom_addr(out_dut[33:25]),
    .ram_a_addr(out_dut[24:19]),
    .ram_b_addr(out_dut[18:13]),
    .ram_b_w(out_dut[12:12]),
    .pe(out_dut[11:1]),
    .done(out_dut[0:0])
  );
  autovcoder_121304__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .rom_q(i_1),
    .rom_addr(out_ref[33:25]),
    .ram_a_addr(out_ref[24:19]),
    .ram_b_addr(out_ref[18:13]),
    .ram_b_w(out_ref[12:12]),
    .pe(out_ref[11:1]),
    .done(out_ref[0:0])
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
    seed = 971141099;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
