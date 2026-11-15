// Hidden tests: 5000 cycles of seeded random inputs (seed 289176645); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 143;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [4:0] i_5;
  reg [4:0] i_6;
  reg [4:0] i_7;
  reg [31:0] i_8;
  reg [31:0] i_9;
  reg [4:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [2:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  reg [0:0] i_21;
  reg [0:0] i_22;
  reg [0:0] i_23;
  reg [0:0] i_24;
  reg [0:0] i_25;
  reg [0:0] i_26;
  reg [0:0] i_27;
  reg [0:0] i_28;
  reg [0:0] i_29;
  reg [0:0] i_30;
  reg [0:0] i_31;
  reg [4:0] i_32;
  reg [31:0] i_33;
  reg [0:0] i_34;
  reg [31:0] i_35;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_02374 dut (
    .clk(clk),
    .reset_n(i_0),
    .stall(i_1),
    .a_decode(i_2),
    .b_decode(i_3),
    .offset_decode(i_4),
    .a_rs_idx(i_5),
    .b_rs_idx(i_6),
    .regfile_rd_idx(i_7),
    .regfile_rd_val(i_8),
    .pc_in(i_9),
    .rd_in(i_10),
    .branch_in(i_11),
    .jump_in(i_12),
    .system_in(i_13),
    .load_in(i_14),
    .store_in(i_15),
    .ld_store_width(i_16),
    .cancelled(i_17),
    .add_nsub(i_18),
    .arith(i_19),
    .cmp_unsigned(i_20),
    .cmp_is_lt(i_21),
    .cmp_is_ge(i_22),
    .cmp_is_eq(i_23),
    .cmp_is_ne(i_24),
    .bit_is_and(i_25),
    .bit_is_or(i_26),
    .bit_is_xor(i_27),
    .shift_arith(i_28),
    .shift_left(i_29),
    .shift_right(i_30),
    .extm_update_rd(i_31),
    .extm_rd_idx(i_32),
    .extm_rd_val(i_33),
    .clr_load_op(i_34),
    .ld_data(i_35),
    .rd(out_dut[142:138]),
    .update_pc(out_dut[137:137]),
    .load(out_dut[136:136]),
    .store(out_dut[135:135]),
    .pc(out_dut[134:103]),
    .c(out_dut[102:71]),
    .addr(out_dut[70:39]),
    .st_be(out_dut[38:35]),
    .retired_instr(out_dut[34:34]),
    .misaligned_load(out_dut[33:33]),
    .misaligned_store(out_dut[32:32]),
    .misaligned_addr(out_dut[31:0])
  );
  rtlpp_02374__ref ref_i (
    .clk(clk),
    .reset_n(i_0),
    .stall(i_1),
    .a_decode(i_2),
    .b_decode(i_3),
    .offset_decode(i_4),
    .a_rs_idx(i_5),
    .b_rs_idx(i_6),
    .regfile_rd_idx(i_7),
    .regfile_rd_val(i_8),
    .pc_in(i_9),
    .rd_in(i_10),
    .branch_in(i_11),
    .jump_in(i_12),
    .system_in(i_13),
    .load_in(i_14),
    .store_in(i_15),
    .ld_store_width(i_16),
    .cancelled(i_17),
    .add_nsub(i_18),
    .arith(i_19),
    .cmp_unsigned(i_20),
    .cmp_is_lt(i_21),
    .cmp_is_ge(i_22),
    .cmp_is_eq(i_23),
    .cmp_is_ne(i_24),
    .bit_is_and(i_25),
    .bit_is_or(i_26),
    .bit_is_xor(i_27),
    .shift_arith(i_28),
    .shift_left(i_29),
    .shift_right(i_30),
    .extm_update_rd(i_31),
    .extm_rd_idx(i_32),
    .extm_rd_val(i_33),
    .clr_load_op(i_34),
    .ld_data(i_35),
    .rd(out_ref[142:138]),
    .update_pc(out_ref[137:137]),
    .load(out_ref[136:136]),
    .store(out_ref[135:135]),
    .pc(out_ref[134:103]),
    .c(out_ref[102:71]),
    .addr(out_ref[70:39]),
    .st_be(out_ref[38:35]),
    .retired_instr(out_ref[34:34]),
    .misaligned_load(out_ref[33:33]),
    .misaligned_store(out_ref[32:32]),
    .misaligned_addr(out_ref[31:0])
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
    seed = 289176645;
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
      i_18 = {$random(seed)};
      i_19 = {$random(seed)};
      i_20 = {$random(seed)};
      i_21 = {$random(seed)};
      i_22 = {$random(seed)};
      i_23 = {$random(seed)};
      i_24 = {$random(seed)};
      i_25 = {$random(seed)};
      i_26 = {$random(seed)};
      i_27 = {$random(seed)};
      i_28 = {$random(seed)};
      i_29 = {$random(seed)};
      i_30 = {$random(seed)};
      i_31 = {$random(seed)};
      i_32 = {$random(seed)};
      i_33 = {$random(seed)};
      i_34 = {$random(seed)};
      i_35 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
