// Hidden tests: 5000 cycles of seeded random inputs (seed 1891884142); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 244;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  reg [15:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [31:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [31:0] i_16;
  reg [0:0] i_17;
  reg [0:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  reg [14:0] i_21;
  reg [0:0] i_22;
  reg [0:0] i_23;
  reg [0:0] i_24;
  reg [0:0] i_25;
  reg [0:0] i_26;
  reg [0:0] i_27;
  reg [0:0] i_28;
  reg [31:0] i_29;
  reg [31:0] i_30;
  reg [31:0] i_31;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  ibex_id_stage dut (
    .clk_i(clk),
    .rst_ni(i_0),
    .test_en_i(i_1),
    .fetch_enable_i(i_2),
    .instr_valid_i(i_3),
    .instr_new_i(i_4),
    .instr_rdata_i(i_5),
    .instr_rdata_c_i(i_6),
    .instr_is_compressed_i(i_7),
    .branch_decision_i(i_8),
    .illegal_c_insn_i(i_9),
    .instr_fetch_err_i(i_10),
    .pc_id_i(i_11),
    .ex_valid_i(i_12),
    .lsu_valid_i(i_13),
    .illegal_csr_insn_i(i_14),
    .lsu_addr_incr_req_i(i_15),
    .lsu_addr_last_i(i_16),
    .csr_mstatus_mie_i(i_17),
    .csr_msip_i(i_18),
    .csr_mtip_i(i_19),
    .csr_meip_i(i_20),
    .csr_mfip_i(i_21),
    .irq_pending_i(i_22),
    .irq_nm_i(i_23),
    .lsu_load_err_i(i_24),
    .lsu_store_err_i(i_25),
    .debug_req_i(i_26),
    .debug_single_step_i(i_27),
    .debug_ebreakm_i(i_28),
    .regfile_wdata_lsu_i(i_29),
    .regfile_wdata_ex_i(i_30),
    .csr_rdata_i(i_31),
    .ctrl_busy_o(out_dut[243:243]),
    .core_ctrl_firstfetch_o(out_dut[242:242]),
    .illegal_insn_o(out_dut[241:241]),
    .instr_req_o(out_dut[240:240]),
    .instr_valid_clear_o(out_dut[239:239]),
    .id_in_ready_o(out_dut[238:238]),
    .pc_set_o(out_dut[237:237]),
    .pc_mux_o(out_dut[236:234]),
    .exc_pc_mux_o(out_dut[233:232]),
    .exc_cause_o(out_dut[231:226]),
    .alu_operator_ex_o(out_dut[225:221]),
    .alu_operand_a_ex_o(out_dut[220:189]),
    .alu_operand_b_ex_o(out_dut[188:157]),
    .mult_en_ex_o(out_dut[156:156]),
    .div_en_ex_o(out_dut[155:155]),
    .multdiv_operator_ex_o(out_dut[154:153]),
    .multdiv_signed_mode_ex_o(out_dut[152:151]),
    .multdiv_operand_a_ex_o(out_dut[150:119]),
    .multdiv_operand_b_ex_o(out_dut[118:87]),
    .csr_access_o(out_dut[86:86]),
    .csr_op_o(out_dut[85:84]),
    .csr_save_if_o(out_dut[83:83]),
    .csr_save_id_o(out_dut[82:82]),
    .csr_restore_mret_id_o(out_dut[81:81]),
    .csr_save_cause_o(out_dut[80:80]),
    .csr_mtval_o(out_dut[79:48]),
    .data_req_ex_o(out_dut[47:47]),
    .data_we_ex_o(out_dut[46:46]),
    .data_type_ex_o(out_dut[45:44]),
    .data_sign_ext_ex_o(out_dut[43:43]),
    .data_reg_offset_ex_o(out_dut[42:41]),
    .data_wdata_ex_o(out_dut[40:9]),
    .debug_cause_o(out_dut[8:6]),
    .debug_csr_save_o(out_dut[5:5]),
    .perf_jump_o(out_dut[4:4]),
    .perf_branch_o(out_dut[3:3]),
    .perf_tbranch_o(out_dut[2:2]),
    .instr_ret_o(out_dut[1:1]),
    .instr_ret_compressed_o(out_dut[0:0])
  );
  ibex_id_stage__ref ref_i (
    .clk_i(clk),
    .rst_ni(i_0),
    .test_en_i(i_1),
    .fetch_enable_i(i_2),
    .instr_valid_i(i_3),
    .instr_new_i(i_4),
    .instr_rdata_i(i_5),
    .instr_rdata_c_i(i_6),
    .instr_is_compressed_i(i_7),
    .branch_decision_i(i_8),
    .illegal_c_insn_i(i_9),
    .instr_fetch_err_i(i_10),
    .pc_id_i(i_11),
    .ex_valid_i(i_12),
    .lsu_valid_i(i_13),
    .illegal_csr_insn_i(i_14),
    .lsu_addr_incr_req_i(i_15),
    .lsu_addr_last_i(i_16),
    .csr_mstatus_mie_i(i_17),
    .csr_msip_i(i_18),
    .csr_mtip_i(i_19),
    .csr_meip_i(i_20),
    .csr_mfip_i(i_21),
    .irq_pending_i(i_22),
    .irq_nm_i(i_23),
    .lsu_load_err_i(i_24),
    .lsu_store_err_i(i_25),
    .debug_req_i(i_26),
    .debug_single_step_i(i_27),
    .debug_ebreakm_i(i_28),
    .regfile_wdata_lsu_i(i_29),
    .regfile_wdata_ex_i(i_30),
    .csr_rdata_i(i_31),
    .ctrl_busy_o(out_ref[243:243]),
    .core_ctrl_firstfetch_o(out_ref[242:242]),
    .illegal_insn_o(out_ref[241:241]),
    .instr_req_o(out_ref[240:240]),
    .instr_valid_clear_o(out_ref[239:239]),
    .id_in_ready_o(out_ref[238:238]),
    .pc_set_o(out_ref[237:237]),
    .pc_mux_o(out_ref[236:234]),
    .exc_pc_mux_o(out_ref[233:232]),
    .exc_cause_o(out_ref[231:226]),
    .alu_operator_ex_o(out_ref[225:221]),
    .alu_operand_a_ex_o(out_ref[220:189]),
    .alu_operand_b_ex_o(out_ref[188:157]),
    .mult_en_ex_o(out_ref[156:156]),
    .div_en_ex_o(out_ref[155:155]),
    .multdiv_operator_ex_o(out_ref[154:153]),
    .multdiv_signed_mode_ex_o(out_ref[152:151]),
    .multdiv_operand_a_ex_o(out_ref[150:119]),
    .multdiv_operand_b_ex_o(out_ref[118:87]),
    .csr_access_o(out_ref[86:86]),
    .csr_op_o(out_ref[85:84]),
    .csr_save_if_o(out_ref[83:83]),
    .csr_save_id_o(out_ref[82:82]),
    .csr_restore_mret_id_o(out_ref[81:81]),
    .csr_save_cause_o(out_ref[80:80]),
    .csr_mtval_o(out_ref[79:48]),
    .data_req_ex_o(out_ref[47:47]),
    .data_we_ex_o(out_ref[46:46]),
    .data_type_ex_o(out_ref[45:44]),
    .data_sign_ext_ex_o(out_ref[43:43]),
    .data_reg_offset_ex_o(out_ref[42:41]),
    .data_wdata_ex_o(out_ref[40:9]),
    .debug_cause_o(out_ref[8:6]),
    .debug_csr_save_o(out_ref[5:5]),
    .perf_jump_o(out_ref[4:4]),
    .perf_branch_o(out_ref[3:3]),
    .perf_tbranch_o(out_ref[2:2]),
    .instr_ret_o(out_ref[1:1]),
    .instr_ret_compressed_o(out_ref[0:0])
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
    seed = 1891884142;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
