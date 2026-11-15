// Hidden tests: 5000 cycles of seeded random inputs (seed 3875817825); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 292;
  reg clk;
  reg [0:0] i_0;
  reg [96:0] i_1;
  reg [0:0] i_2;
  reg [96:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_053447 dut (
    .clk(clk),
    .reset(i_0),
    .din_leaf_bft2interface(i_1),
    .resend(i_2),
    .stream_in(i_3),
    .dout_leaf_interface2bft(out_dut[291:195]),
    .stream_out(out_dut[194:98]),
    .resend_out(out_dut[97:97]),
    .configure_out(out_dut[96:0])
  );
  origen_053447__ref ref_i (
    .clk(clk),
    .reset(i_0),
    .din_leaf_bft2interface(i_1),
    .resend(i_2),
    .stream_in(i_3),
    .dout_leaf_interface2bft(out_ref[291:195]),
    .stream_out(out_ref[194:98]),
    .resend_out(out_ref[97:97]),
    .configure_out(out_ref[96:0])
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
    seed = 3875817825;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed), $random(seed), $random(seed), $random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed), $random(seed), $random(seed), $random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
