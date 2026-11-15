// Hidden tests: 5000 cycles of seeded random inputs (seed 768426689); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 15;
  reg clk;
  reg [31:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_089141 dut (
    .clk(clk),
    .instruction(i_0),
    .INaddr(out_dut[14:12]),
    .OUT1addr(out_dut[11:9]),
    .OUT2addr(out_dut[8:6]),
    .select(out_dut[5:3]),
    .out1mux(out_dut[2:2]),
    .out2mux(out_dut[1:1]),
    .immediatemux(out_dut[0:0])
  );
  origen_089141__ref ref_i (
    .clk(clk),
    .instruction(i_0),
    .INaddr(out_ref[14:12]),
    .OUT1addr(out_ref[11:9]),
    .OUT2addr(out_ref[8:6]),
    .select(out_ref[5:3]),
    .out1mux(out_ref[2:2]),
    .out2mux(out_ref[1:1]),
    .immediatemux(out_ref[0:0])
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
    seed = 768426689;
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
