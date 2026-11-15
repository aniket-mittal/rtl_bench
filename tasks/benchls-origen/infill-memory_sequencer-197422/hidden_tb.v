// Hidden tests: 5000 cycles of seeded random inputs (seed 85593241); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 83;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_197422 dut (
    .clk(clk),
    .rst_n(i_0),
    .aluout(i_1),
    .rd(i_2),
    .ram_rd(i_3),
    .ra(out_dut[82:77]),
    .wa(out_dut[76:71]),
    .wd(out_dut[70:39]),
    .td(out_dut[38:7]),
    .ram_we(out_dut[6:6]),
    .ram_ra(out_dut[5:0])
  );
  origen_197422__ref ref_i (
    .clk(clk),
    .rst_n(i_0),
    .aluout(i_1),
    .rd(i_2),
    .ram_rd(i_3),
    .ra(out_ref[82:77]),
    .wa(out_ref[76:71]),
    .wd(out_ref[70:39]),
    .td(out_ref[38:7]),
    .ram_we(out_ref[6:6]),
    .ram_ra(out_ref[5:0])
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
    seed = 85593241;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
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
