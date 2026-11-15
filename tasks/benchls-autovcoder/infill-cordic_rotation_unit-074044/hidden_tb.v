// Hidden tests: 5000 cycles of seeded random inputs (seed 131349386); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 147;
  reg clk;
  reg [15:0] i_0;
  reg [15:0] i_1;
  reg [15:0] i_2;
  reg [15:0] i_3;
  reg [15:0] i_4;
  reg [15:0] i_5;
  reg [15:0] i_6;
  reg [15:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_074044 dut (
    .clk(clk),
    .x_in(i_0),
    .y_in(i_1),
    .phi_in(i_2),
    .e_in(i_3),
    .teta_in(i_4),
    .phi_right_in(i_5),
    .x_i(i_6),
    .y_i(i_7),
    .start(i_8),
    .rst_n(i_9),
    .x_out(out_dut[146:131]),
    .y_out(out_dut[130:115]),
    .phi_out(out_dut[114:99]),
    .x_o(out_dut[98:83]),
    .y_o(out_dut[82:67]),
    .ce_vec(out_dut[66:66]),
    .ce_rot(out_dut[65:65]),
    .phi(out_dut[64:49]),
    .teta(out_dut[48:33]),
    .e(out_dut[32:17]),
    .phi_right_out(out_dut[16:1]),
    .ready(out_dut[0:0])
  );
  autovcoder_074044__ref ref_i (
    .clk(clk),
    .x_in(i_0),
    .y_in(i_1),
    .phi_in(i_2),
    .e_in(i_3),
    .teta_in(i_4),
    .phi_right_in(i_5),
    .x_i(i_6),
    .y_i(i_7),
    .start(i_8),
    .rst_n(i_9),
    .x_out(out_ref[146:131]),
    .y_out(out_ref[130:115]),
    .phi_out(out_ref[114:99]),
    .x_o(out_ref[98:83]),
    .y_o(out_ref[82:67]),
    .ce_vec(out_ref[66:66]),
    .ce_rot(out_ref[65:65]),
    .phi(out_ref[64:49]),
    .teta(out_ref[48:33]),
    .e(out_ref[32:17]),
    .phi_right_out(out_ref[16:1]),
    .ready(out_ref[0:0])
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
    seed = 131349386;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
