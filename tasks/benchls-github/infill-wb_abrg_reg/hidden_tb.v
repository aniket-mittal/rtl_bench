// Hidden tests: 5000 cycles of seeded random inputs (seed 693727091); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 58;
  reg clk;
  reg [0:0] i_0;
  reg [18:0] i_1;
  reg [15:0] i_2;
  reg [1:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [15:0] i_9;
  reg [0:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  wb_abrg_reg dut (
    .wbs_clk_i(clk),
    .sys_rst(i_0),
    .wbs_adr_i(i_1),
    .wbs_dat_i(i_2),
    .wbs_sel_i(i_3),
    .wbs_tga_i(i_4),
    .wbs_stb_i(i_5),
    .wbs_cyc_i(i_6),
    .wbs_we_i(i_7),
    .wbm_clk_i(i_8),
    .wbm_dat_i(i_9),
    .wbm_ack_i(i_10),
    .wbs_dat_o(out_dut[57:42]),
    .wbs_ack_o(out_dut[41:41]),
    .wbm_adr_o(out_dut[40:22]),
    .wbm_dat_o(out_dut[21:6]),
    .wbm_sel_o(out_dut[5:4]),
    .wbm_tga_o(out_dut[3:3]),
    .wbm_stb_o(out_dut[2:2]),
    .wbm_cyc_o(out_dut[1:1]),
    .wbm_we_o(out_dut[0:0])
  );
  wb_abrg_reg__ref ref_i (
    .wbs_clk_i(clk),
    .sys_rst(i_0),
    .wbs_adr_i(i_1),
    .wbs_dat_i(i_2),
    .wbs_sel_i(i_3),
    .wbs_tga_i(i_4),
    .wbs_stb_i(i_5),
    .wbs_cyc_i(i_6),
    .wbs_we_i(i_7),
    .wbm_clk_i(i_8),
    .wbm_dat_i(i_9),
    .wbm_ack_i(i_10),
    .wbs_dat_o(out_ref[57:42]),
    .wbs_ack_o(out_ref[41:41]),
    .wbm_adr_o(out_ref[40:22]),
    .wbm_dat_o(out_ref[21:6]),
    .wbm_sel_o(out_ref[5:4]),
    .wbm_tga_o(out_ref[3:3]),
    .wbm_stb_o(out_ref[2:2]),
    .wbm_cyc_o(out_ref[1:1]),
    .wbm_we_o(out_ref[0:0])
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
    seed = 693727091;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
