// Hidden tests: 5000 cycles of seeded random inputs (seed 1049062016); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 41;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_113378 dut (
    .TCLK(clk),
    .TRST(i_0),
    .TMS(i_1),
    .TDI(i_2),
    .TDO(out_dut[40:40]),
    .clk(out_dut[39:39]),
    .reset(out_dut[38:38]),
    .data_reg(out_dut[37:6]),
    .data_reg_valid(out_dut[5:5]),
    .inst_reg(out_dut[4:1]),
    .inst_reg_valid(out_dut[0:0])
  );
  origen_113378__ref ref_i (
    .TCLK(clk),
    .TRST(i_0),
    .TMS(i_1),
    .TDI(i_2),
    .TDO(out_ref[40:40]),
    .clk(out_ref[39:39]),
    .reset(out_ref[38:38]),
    .data_reg(out_ref[37:6]),
    .data_reg_valid(out_ref[5:5]),
    .inst_reg(out_ref[4:1]),
    .inst_reg_valid(out_ref[0:0])
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
    seed = 1049062016;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
