// Hidden tests: 5000 cycles of seeded random inputs (seed 2076376554); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 61;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [9:0] i_6;
  reg [23:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [9:0] i_10;
  reg [23:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [0:0] i_17;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_00534 dut (
    .clk(clk),
    .rst(i_0),
    .flush_i(i_1),
    .adv_i(i_2),
    .start_i(i_3),
    .is_sub_i(i_4),
    .signa_i(i_5),
    .exp10a_i(i_6),
    .fract24a_i(i_7),
    .infa_i(i_8),
    .signb_i(i_9),
    .exp10b_i(i_10),
    .fract24b_i(i_11),
    .infb_i(i_12),
    .snan_i(i_13),
    .qnan_i(i_14),
    .anan_sign_i(i_15),
    .addsub_agtb_i(i_16),
    .addsub_aeqb_i(i_17),
    .add_rdy_o(out_dut[60:60]),
    .add_sign_o(out_dut[59:59]),
    .add_sub_0_o(out_dut[58:58]),
    .add_shl_o(out_dut[57:53]),
    .add_exp10shl_o(out_dut[52:43]),
    .add_exp10sh0_o(out_dut[42:33]),
    .add_fract28_o(out_dut[32:5]),
    .add_inv_o(out_dut[4:4]),
    .add_inf_o(out_dut[3:3]),
    .add_snan_o(out_dut[2:2]),
    .add_qnan_o(out_dut[1:1]),
    .add_anan_sign_o(out_dut[0:0])
  );
  rtlpp_00534__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .flush_i(i_1),
    .adv_i(i_2),
    .start_i(i_3),
    .is_sub_i(i_4),
    .signa_i(i_5),
    .exp10a_i(i_6),
    .fract24a_i(i_7),
    .infa_i(i_8),
    .signb_i(i_9),
    .exp10b_i(i_10),
    .fract24b_i(i_11),
    .infb_i(i_12),
    .snan_i(i_13),
    .qnan_i(i_14),
    .anan_sign_i(i_15),
    .addsub_agtb_i(i_16),
    .addsub_aeqb_i(i_17),
    .add_rdy_o(out_ref[60:60]),
    .add_sign_o(out_ref[59:59]),
    .add_sub_0_o(out_ref[58:58]),
    .add_shl_o(out_ref[57:53]),
    .add_exp10shl_o(out_ref[52:43]),
    .add_exp10sh0_o(out_ref[42:33]),
    .add_fract28_o(out_ref[32:5]),
    .add_inv_o(out_ref[4:4]),
    .add_inf_o(out_ref[3:3]),
    .add_snan_o(out_ref[2:2]),
    .add_qnan_o(out_ref[1:1]),
    .add_anan_sign_o(out_ref[0:0])
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
    seed = 2076376554;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
