// Hidden tests: 5000 cycles of seeded random inputs (seed 2231499544); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 174;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [4:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [3:0] i_10;
  reg [31:0] i_11;
  reg [31:0] i_12;
  reg [31:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_085955 dut (
    .clk_i(clk),
    .rsn_i(i_0),
    .stall_core_i(i_1),
    .decode_stall_i(i_2),
    .kill_i(i_3),
    .dec_read_data_a_i(i_4),
    .dec_read_data_b_i(i_5),
    .dec_write_addr_i(i_6),
    .dec_int_write_enable_i(i_7),
    .dec_tlbwrite_i(i_8),
    .dec_idtlb_i(i_9),
    .dec_exc_bits_i(i_10),
    .dec_instruction_i(i_11),
    .dec_pc_i(i_12),
    .dec_pred_pc_i(i_13),
    .dec_prediction_i(i_14),
    .dec_taken_i(i_15),
    .exe_read_data_a_o(out_dut[173:142]),
    .exe_read_data_b_o(out_dut[141:110]),
    .exe_write_addr_o(out_dut[109:105]),
    .exe_int_write_enable_o(out_dut[104:104]),
    .exe_tlbwrite_o(out_dut[103:103]),
    .exe_idtlb_o(out_dut[102:102]),
    .exe_exc_bits_o(out_dut[101:98]),
    .exe_instruction_o(out_dut[97:66]),
    .exe_pc_o(out_dut[65:34]),
    .exe_pred_pc_o(out_dut[33:2]),
    .exe_prediction_o(out_dut[1:1]),
    .exe_taken_o(out_dut[0:0])
  );
  origen_085955__ref ref_i (
    .clk_i(clk),
    .rsn_i(i_0),
    .stall_core_i(i_1),
    .decode_stall_i(i_2),
    .kill_i(i_3),
    .dec_read_data_a_i(i_4),
    .dec_read_data_b_i(i_5),
    .dec_write_addr_i(i_6),
    .dec_int_write_enable_i(i_7),
    .dec_tlbwrite_i(i_8),
    .dec_idtlb_i(i_9),
    .dec_exc_bits_i(i_10),
    .dec_instruction_i(i_11),
    .dec_pc_i(i_12),
    .dec_pred_pc_i(i_13),
    .dec_prediction_i(i_14),
    .dec_taken_i(i_15),
    .exe_read_data_a_o(out_ref[173:142]),
    .exe_read_data_b_o(out_ref[141:110]),
    .exe_write_addr_o(out_ref[109:105]),
    .exe_int_write_enable_o(out_ref[104:104]),
    .exe_tlbwrite_o(out_ref[103:103]),
    .exe_idtlb_o(out_ref[102:102]),
    .exe_exc_bits_o(out_ref[101:98]),
    .exe_instruction_o(out_ref[97:66]),
    .exe_pc_o(out_ref[65:34]),
    .exe_pred_pc_o(out_ref[33:2]),
    .exe_prediction_o(out_ref[1:1]),
    .exe_taken_o(out_ref[0:0])
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
    seed = 2231499544;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
