// Hidden tests: 5000 cycles of seeded random inputs (seed 3894267265); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 73;
  reg clk;
  reg [31:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_039113 dut (
    .clk(clk),
    .inst(i_0),
    .BRAM0(i_1),
    .BRAM1(i_2),
    .bram0_addr(out_dut[72:63]),
    .bram1_addr(out_dut[62:53]),
    .bram1_we(out_dut[52:49]),
    .bram1_en(out_dut[48:48]),
    .dsp_inmode(out_dut[47:43]),
    .dsp_opmode(out_dut[42:36]),
    .dsp_alumode(out_dut[35:32]),
    .BRAM1_in(out_dut[31:0])
  );
  origen_039113__ref ref_i (
    .clk(clk),
    .inst(i_0),
    .BRAM0(i_1),
    .BRAM1(i_2),
    .bram0_addr(out_ref[72:63]),
    .bram1_addr(out_ref[62:53]),
    .bram1_we(out_ref[52:49]),
    .bram1_en(out_ref[48:48]),
    .dsp_inmode(out_ref[47:43]),
    .dsp_opmode(out_ref[42:36]),
    .dsp_alumode(out_ref[35:32]),
    .BRAM1_in(out_ref[31:0])
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
    seed = 3894267265;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
