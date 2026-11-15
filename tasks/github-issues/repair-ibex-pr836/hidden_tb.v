// Hidden tests: 5000 cycles of seeded random inputs (seed 2166332861); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 403;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [15:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [31:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [33:0] i_17;
  reg [1:0] i_18;
  reg [0:0] i_19;
  reg [0:0] i_20;
  reg [0:0] i_21;
  reg [0:0] i_22;
  reg [0:0] i_23;
  reg [31:0] i_24;
  reg [0:0] i_25;
  reg [0:0] i_26;
  reg [17:0] i_27;
  reg [0:0] i_28;
  reg [0:0] i_29;
  reg [0:0] i_30;
  reg [0:0] i_31;
  reg [0:0] i_32;
  reg [0:0] i_33;
  reg [0:0] i_34;
  reg [0:0] i_35;
  reg [31:0] i_36;
  reg [31:0] i_37;
  reg [31:0] i_38;
  reg [31:0] i_39;
  reg [4:0] i_40;
  reg [31:0] i_41;
  reg [0:0] i_42;
  reg [0:0] i_43;
  reg [0:0] i_44;
  reg [0:0] i_45;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  ibex_id_stage dut (
    .clk_i(clk),
    .rst_ni(i_0),
    .fetch_enable_i(i_1),
    .instr_valid_i(i_2),
    .instr_rdata_i(i_3),
    .instr_rdata_alu_i(i_4),
    .instr_rdata_c_i(i_5),
    .instr_is_compressed_i(i_6),
    .branch_decision_i(i_7),
    .illegal_c_insn_i(i_8),
    .instr_fetch_err_i(i_9),
    .instr_fetch_err_plus2_i(i_10),
    .pc_id_i(i_11),
    .ex_valid_i(i_12),
    .lsu_valid_i(i_13),
    .lsu_load_i(i_14),
    .lsu_busy_i(i_15),
    .imd_val_we_ex_i(i_16),
    .imd_val_d_ex_i(i_17),
    .priv_mode_i(i_18),
    .csr_mstatus_tw_i(i_19),
    .illegal_csr_insn_i(i_20),
    .data_ind_timing_i(i_21),
    .lsu_req_done_i(i_22),
    .lsu_addr_incr_req_i(i_23),
    .lsu_addr_last_i(i_24),
    .csr_mstatus_mie_i(i_25),
    .irq_pending_i(i_26),
    .irqs_i(i_27),
    .irq_nm_i(i_28),
    .lsu_load_err_i(i_29),
    .lsu_store_err_i(i_30),
    .debug_req_i(i_31),
    .debug_single_step_i(i_32),
    .debug_ebreakm_i(i_33),
    .debug_ebreaku_i(i_34),
    .trigger_match_i(i_35),
    .result_ex_i(i_36),
    .csr_rdata_i(i_37),
    .rf_rdata_a_i(i_38),
    .rf_rdata_b_i(i_39),
    .rf_waddr_wb_i(i_40),
    .rf_wdata_fwd_wb_i(i_41),
    .rf_write_wb_i(i_42),
    .ready_wb_i(i_43),
    .outstanding_load_wb_i(i_44),
    .outstanding_store_wb_i(i_45),
    .ctrl_busy_o(out_dut[402:402]),
    .illegal_insn_o(out_dut[401:401]),
    .instr_req_o(out_dut[400:400]),
    .instr_first_cycle_id_o(out_dut[399:399]),
    .instr_valid_clear_o(out_dut[398:398]),
    .id_in_ready_o(out_dut[397:397]),
    .icache_inval_o(out_dut[396:396]),
    .pc_set_o(out_dut[395:395]),
    .pc_mux_o(out_dut[394:392]),
    .exc_pc_mux_o(out_dut[391:390]),
    .exc_cause_o(out_dut[389:384]),
    .alu_operator_ex_o(out_dut[383:378]),
    .alu_operand_a_ex_o(out_dut[377:346]),
    .alu_operand_b_ex_o(out_dut[345:314]),
    .imd_val_q_ex_o(out_dut[313:280]),
    .bt_a_operand_o(out_dut[279:248]),
    .bt_b_operand_o(out_dut[247:216]),
    .mult_en_ex_o(out_dut[215:215]),
    .div_en_ex_o(out_dut[214:214]),
    .multdiv_sel_ex_o(out_dut[213:213]),
    .multdiv_operator_ex_o(out_dut[212:211]),
    .multdiv_signed_mode_ex_o(out_dut[210:209]),
    .multdiv_operand_a_ex_o(out_dut[208:177]),
    .multdiv_operand_b_ex_o(out_dut[176:145]),
    .multdiv_ready_id_o(out_dut[144:144]),
    .csr_access_o(out_dut[143:143]),
    .csr_op_o(out_dut[142:141]),
    .csr_op_en_o(out_dut[140:140]),
    .csr_save_if_o(out_dut[139:139]),
    .csr_save_id_o(out_dut[138:138]),
    .csr_save_wb_o(out_dut[137:137]),
    .csr_restore_mret_id_o(out_dut[136:136]),
    .csr_restore_dret_id_o(out_dut[135:135]),
    .csr_save_cause_o(out_dut[134:134]),
    .csr_mtval_o(out_dut[133:102]),
    .lsu_req_o(out_dut[101:101]),
    .lsu_we_o(out_dut[100:100]),
    .lsu_type_o(out_dut[99:98]),
    .lsu_sign_ext_o(out_dut[97:97]),
    .lsu_wdata_o(out_dut[96:65]),
    .nmi_mode_o(out_dut[64:64]),
    .debug_mode_o(out_dut[63:63]),
    .debug_cause_o(out_dut[62:60]),
    .debug_csr_save_o(out_dut[59:59]),
    .rf_raddr_a_o(out_dut[58:54]),
    .rf_raddr_b_o(out_dut[53:49]),
    .rf_waddr_id_o(out_dut[48:44]),
    .rf_wdata_id_o(out_dut[43:12]),
    .rf_we_id_o(out_dut[11:11]),
    .en_wb_o(out_dut[10:10]),
    .instr_type_wb_o(out_dut[9:8]),
    .perf_jump_o(out_dut[7:7]),
    .perf_branch_o(out_dut[6:6]),
    .perf_tbranch_o(out_dut[5:5]),
    .perf_dside_wait_o(out_dut[4:4]),
    .perf_mul_wait_o(out_dut[3:3]),
    .perf_div_wait_o(out_dut[2:2]),
    .instr_id_done_o(out_dut[1:1]),
    .instr_id_done_compressed_o(out_dut[0:0])
  );
  ibex_id_stage__ref ref_i (
    .clk_i(clk),
    .rst_ni(i_0),
    .fetch_enable_i(i_1),
    .instr_valid_i(i_2),
    .instr_rdata_i(i_3),
    .instr_rdata_alu_i(i_4),
    .instr_rdata_c_i(i_5),
    .instr_is_compressed_i(i_6),
    .branch_decision_i(i_7),
    .illegal_c_insn_i(i_8),
    .instr_fetch_err_i(i_9),
    .instr_fetch_err_plus2_i(i_10),
    .pc_id_i(i_11),
    .ex_valid_i(i_12),
    .lsu_valid_i(i_13),
    .lsu_load_i(i_14),
    .lsu_busy_i(i_15),
    .imd_val_we_ex_i(i_16),
    .imd_val_d_ex_i(i_17),
    .priv_mode_i(i_18),
    .csr_mstatus_tw_i(i_19),
    .illegal_csr_insn_i(i_20),
    .data_ind_timing_i(i_21),
    .lsu_req_done_i(i_22),
    .lsu_addr_incr_req_i(i_23),
    .lsu_addr_last_i(i_24),
    .csr_mstatus_mie_i(i_25),
    .irq_pending_i(i_26),
    .irqs_i(i_27),
    .irq_nm_i(i_28),
    .lsu_load_err_i(i_29),
    .lsu_store_err_i(i_30),
    .debug_req_i(i_31),
    .debug_single_step_i(i_32),
    .debug_ebreakm_i(i_33),
    .debug_ebreaku_i(i_34),
    .trigger_match_i(i_35),
    .result_ex_i(i_36),
    .csr_rdata_i(i_37),
    .rf_rdata_a_i(i_38),
    .rf_rdata_b_i(i_39),
    .rf_waddr_wb_i(i_40),
    .rf_wdata_fwd_wb_i(i_41),
    .rf_write_wb_i(i_42),
    .ready_wb_i(i_43),
    .outstanding_load_wb_i(i_44),
    .outstanding_store_wb_i(i_45),
    .ctrl_busy_o(out_ref[402:402]),
    .illegal_insn_o(out_ref[401:401]),
    .instr_req_o(out_ref[400:400]),
    .instr_first_cycle_id_o(out_ref[399:399]),
    .instr_valid_clear_o(out_ref[398:398]),
    .id_in_ready_o(out_ref[397:397]),
    .icache_inval_o(out_ref[396:396]),
    .pc_set_o(out_ref[395:395]),
    .pc_mux_o(out_ref[394:392]),
    .exc_pc_mux_o(out_ref[391:390]),
    .exc_cause_o(out_ref[389:384]),
    .alu_operator_ex_o(out_ref[383:378]),
    .alu_operand_a_ex_o(out_ref[377:346]),
    .alu_operand_b_ex_o(out_ref[345:314]),
    .imd_val_q_ex_o(out_ref[313:280]),
    .bt_a_operand_o(out_ref[279:248]),
    .bt_b_operand_o(out_ref[247:216]),
    .mult_en_ex_o(out_ref[215:215]),
    .div_en_ex_o(out_ref[214:214]),
    .multdiv_sel_ex_o(out_ref[213:213]),
    .multdiv_operator_ex_o(out_ref[212:211]),
    .multdiv_signed_mode_ex_o(out_ref[210:209]),
    .multdiv_operand_a_ex_o(out_ref[208:177]),
    .multdiv_operand_b_ex_o(out_ref[176:145]),
    .multdiv_ready_id_o(out_ref[144:144]),
    .csr_access_o(out_ref[143:143]),
    .csr_op_o(out_ref[142:141]),
    .csr_op_en_o(out_ref[140:140]),
    .csr_save_if_o(out_ref[139:139]),
    .csr_save_id_o(out_ref[138:138]),
    .csr_save_wb_o(out_ref[137:137]),
    .csr_restore_mret_id_o(out_ref[136:136]),
    .csr_restore_dret_id_o(out_ref[135:135]),
    .csr_save_cause_o(out_ref[134:134]),
    .csr_mtval_o(out_ref[133:102]),
    .lsu_req_o(out_ref[101:101]),
    .lsu_we_o(out_ref[100:100]),
    .lsu_type_o(out_ref[99:98]),
    .lsu_sign_ext_o(out_ref[97:97]),
    .lsu_wdata_o(out_ref[96:65]),
    .nmi_mode_o(out_ref[64:64]),
    .debug_mode_o(out_ref[63:63]),
    .debug_cause_o(out_ref[62:60]),
    .debug_csr_save_o(out_ref[59:59]),
    .rf_raddr_a_o(out_ref[58:54]),
    .rf_raddr_b_o(out_ref[53:49]),
    .rf_waddr_id_o(out_ref[48:44]),
    .rf_wdata_id_o(out_ref[43:12]),
    .rf_we_id_o(out_ref[11:11]),
    .en_wb_o(out_ref[10:10]),
    .instr_type_wb_o(out_ref[9:8]),
    .perf_jump_o(out_ref[7:7]),
    .perf_branch_o(out_ref[6:6]),
    .perf_tbranch_o(out_ref[5:5]),
    .perf_dside_wait_o(out_ref[4:4]),
    .perf_mul_wait_o(out_ref[3:3]),
    .perf_div_wait_o(out_ref[2:2]),
    .instr_id_done_o(out_ref[1:1]),
    .instr_id_done_compressed_o(out_ref[0:0])
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
    seed = 2166332861;
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
      i_17 = {$random(seed), $random(seed)};
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
      i_36 = {$random(seed)};
      i_37 = {$random(seed)};
      i_38 = {$random(seed)};
      i_39 = {$random(seed)};
      i_40 = {$random(seed)};
      i_41 = {$random(seed)};
      i_42 = {$random(seed)};
      i_43 = {$random(seed)};
      i_44 = {$random(seed)};
      i_45 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
