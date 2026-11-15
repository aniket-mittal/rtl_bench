// Hidden tests: 5000 cycles of seeded random inputs (seed 1640895154); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 36;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_086067 dut (
    .clk_20Hz(clk),
    .btnU(i_0),
    .btnD(i_1),
    .btnC(i_2),
    .btnL(i_3),
    .btnR(i_4),
    .my_grid_r(out_dut[35:32]),
    .my_grid_g(out_dut[31:28]),
    .my_grid_b(out_dut[27:24]),
    .my_bg_r(out_dut[23:20]),
    .my_bg_g(out_dut[19:16]),
    .my_bg_b(out_dut[15:12]),
    .my_wave_r(out_dut[11:8]),
    .my_wave_g(out_dut[7:4]),
    .my_wave_b(out_dut[3:0])
  );
  origen_086067__ref ref_i (
    .clk_20Hz(clk),
    .btnU(i_0),
    .btnD(i_1),
    .btnC(i_2),
    .btnL(i_3),
    .btnR(i_4),
    .my_grid_r(out_ref[35:32]),
    .my_grid_g(out_ref[31:28]),
    .my_grid_b(out_ref[27:24]),
    .my_bg_r(out_ref[23:20]),
    .my_bg_g(out_ref[19:16]),
    .my_bg_b(out_ref[15:12]),
    .my_wave_r(out_ref[11:8]),
    .my_wave_g(out_ref[7:4]),
    .my_wave_b(out_ref[3:0])
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
    seed = 1640895154;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
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
