// Hidden tests: 5000 cycles of seeded random inputs (seed 1970552388); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 66;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [3:0] i_2;
  reg [31:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [31:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_06996 dut (
    .clk(clk),
    .resetn(i_0),
    .ser_rx(i_1),
    .reg_div_we(i_2),
    .reg_div_di(i_3),
    .reg_dat_we(i_4),
    .reg_dat_re(i_5),
    .reg_dat_di(i_6),
    .ser_tx(out_dut[65:65]),
    .reg_div_do(out_dut[64:33]),
    .reg_dat_do(out_dut[32:1]),
    .reg_dat_wait(out_dut[0:0])
  );
  mg_06996__ref ref_i (
    .clk(clk),
    .resetn(i_0),
    .ser_rx(i_1),
    .reg_div_we(i_2),
    .reg_div_di(i_3),
    .reg_dat_we(i_4),
    .reg_dat_re(i_5),
    .reg_dat_di(i_6),
    .ser_tx(out_ref[65:65]),
    .reg_div_do(out_ref[64:33]),
    .reg_dat_do(out_ref[32:1]),
    .reg_dat_wait(out_ref[0:0])
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
    seed = 1970552388;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
