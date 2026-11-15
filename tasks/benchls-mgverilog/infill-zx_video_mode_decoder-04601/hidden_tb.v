// Hidden tests: 5000 cycles of seeded random inputs (seed 3799244612); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 11;
  reg clk;
  reg [1:0] i_0;
  reg [2:0] i_1;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_04601 dut (
    .clk(clk),
    .pent_vmode(i_0),
    .atm_vmode(i_1),
    .mode_atm_n_pent(out_dut[10:10]),
    .mode_zx(out_dut[9:9]),
    .mode_p_16c(out_dut[8:8]),
    .mode_p_hmclr(out_dut[7:7]),
    .mode_a_hmclr(out_dut[6:6]),
    .mode_a_16c(out_dut[5:5]),
    .mode_a_text(out_dut[4:4]),
    .mode_a_txt_1page(out_dut[3:3]),
    .mode_pixf_14(out_dut[2:2]),
    .mode_bw(out_dut[1:0])
  );
  mg_04601__ref ref_i (
    .clk(clk),
    .pent_vmode(i_0),
    .atm_vmode(i_1),
    .mode_atm_n_pent(out_ref[10:10]),
    .mode_zx(out_ref[9:9]),
    .mode_p_16c(out_ref[8:8]),
    .mode_p_hmclr(out_ref[7:7]),
    .mode_a_hmclr(out_ref[6:6]),
    .mode_a_16c(out_ref[5:5]),
    .mode_a_text(out_ref[4:4]),
    .mode_a_txt_1page(out_ref[3:3]),
    .mode_pixf_14(out_ref[2:2]),
    .mode_bw(out_ref[1:0])
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
    seed = 3799244612;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
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
