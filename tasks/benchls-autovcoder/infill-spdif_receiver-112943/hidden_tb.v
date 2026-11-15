// Hidden tests: 5000 cycles of seeded random inputs (seed 2453092045); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 84;
  reg clk;
  reg [0:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_112943 dut (
    .clk(clk),
    .SPDIFin(i_0),
    .BMCdec(out_dut[83:82]),
    .edgeclk(out_dut[81:81]),
    .clkout(out_dut[80:80]),
    .Dout(out_dut[79:52]),
    .synccode(out_dut[51:50]),
    .parityOK(out_dut[49:49]),
    .AudioL(out_dut[48:25]),
    .AudioR(out_dut[24:1]),
    .Audioclk(out_dut[0:0])
  );
  autovcoder_112943__ref ref_i (
    .clk(clk),
    .SPDIFin(i_0),
    .BMCdec(out_ref[83:82]),
    .edgeclk(out_ref[81:81]),
    .clkout(out_ref[80:80]),
    .Dout(out_ref[79:52]),
    .synccode(out_ref[51:50]),
    .parityOK(out_ref[49:49]),
    .AudioL(out_ref[48:25]),
    .AudioR(out_ref[24:1]),
    .Audioclk(out_ref[0:0])
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
    seed = 2453092045;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
