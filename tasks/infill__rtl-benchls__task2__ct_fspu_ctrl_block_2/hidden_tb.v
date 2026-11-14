// Hidden tests: 5000 cycles of seeded random inputs (seed 4266879335); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 3;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [2:0] i_3;
  reg [0:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  ct_fspu_ctrl dut (
    .forever_cpuclk(clk),
    .cp0_vfpu_icg_en(i_0),
    .cp0_yy_clk_en(i_1),
    .cpurst_b(i_2),
    .dp_vfalu_ex1_pipex_sel(i_3),
    .pad_yy_icg_scan_en(i_4),
    .ex1_pipedown(out_dut[2:2]),
    .ex2_pipedown(out_dut[1:1]),
    .ex3_pipedown(out_dut[0:0])
  );
  ct_fspu_ctrl__ref ref_i (
    .forever_cpuclk(clk),
    .cp0_vfpu_icg_en(i_0),
    .cp0_yy_clk_en(i_1),
    .cpurst_b(i_2),
    .dp_vfalu_ex1_pipex_sel(i_3),
    .pad_yy_icg_scan_en(i_4),
    .ex1_pipedown(out_ref[2:2]),
    .ex2_pipedown(out_ref[1:1]),
    .ex3_pipedown(out_ref[0:0])
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
    seed = 4266879335;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
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
