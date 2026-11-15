// Hidden tests: 5000 cycles of seeded random inputs (seed 1912409729); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 25;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [3:0] i_10;
  reg [0:0] i_11;
  reg [3:0] i_12;
  reg [15:0] i_13;
  reg [15:0] i_14;
  reg [15:0] i_15;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_05990 dut (
    .clk(clk),
    .rst(i_0),
    .clr_max(i_1),
    .clr_inv_ids(i_2),
    .clr_sel_cnt_inv(i_3),
    .clr_sel_cnt(i_4),
    .inc_sel_cnt(i_5),
    .inc_sel_cnt_inv(i_6),
    .en_flit_max_in(i_7),
    .en_for_reg(i_8),
    .en_inv_ids(i_9),
    .inv_ids_in(i_10),
    .dest_sel(i_11),
    .flit_max_in(i_12),
    .head_flit(i_13),
    .addrhi(i_14),
    .addrlo(i_15),
    .flit_out(out_dut[24:9]),
    .cnt_eq_max(out_dut[8:8]),
    .cnt_invs_eq_3(out_dut[7:7]),
    .cnt_eq_0(out_dut[6:6]),
    .inv_ids_reg_out(out_dut[5:2]),
    .sel_cnt_invs_out(out_dut[1:0])
  );
  mg_05990__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .clr_max(i_1),
    .clr_inv_ids(i_2),
    .clr_sel_cnt_inv(i_3),
    .clr_sel_cnt(i_4),
    .inc_sel_cnt(i_5),
    .inc_sel_cnt_inv(i_6),
    .en_flit_max_in(i_7),
    .en_for_reg(i_8),
    .en_inv_ids(i_9),
    .inv_ids_in(i_10),
    .dest_sel(i_11),
    .flit_max_in(i_12),
    .head_flit(i_13),
    .addrhi(i_14),
    .addrlo(i_15),
    .flit_out(out_ref[24:9]),
    .cnt_eq_max(out_ref[8:8]),
    .cnt_invs_eq_3(out_ref[7:7]),
    .cnt_eq_0(out_ref[6:6]),
    .inv_ids_reg_out(out_ref[5:2]),
    .sel_cnt_invs_out(out_ref[1:0])
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
    seed = 1912409729;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
