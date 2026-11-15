// Hidden tests: 5000 cycles of seeded random inputs (seed 3191478408); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 100;
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
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [0:0] i_13;
  reg [0:0] i_14;
  reg [0:0] i_15;
  reg [0:0] i_16;
  reg [31:0] i_17;
  reg [0:0] i_18;
  reg [63:0] i_19;
  reg [63:0] i_20;
  reg [63:0] i_21;
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
  reg [1:0] i_32;
  reg [1:0] i_33;
  reg [0:0] i_34;
  reg [0:0] i_35;
  reg [4:0] i_36;
  reg [0:0] i_37;
  reg [1:0] i_38;
  reg [0:0] i_39;
  reg [0:0] i_40;
  reg [0:0] i_41;
  reg [0:0] i_42;
  reg [0:0] i_43;
  reg [0:0] i_44;
  reg [5:0] i_45;
  reg [0:0] i_46;
  reg [5:0] i_47;
  reg [0:0] i_48;
  reg [0:0] i_49;
  reg [0:0] i_50;
  reg [0:0] i_51;
  reg [0:0] i_52;
  reg [0:0] i_53;
  reg [0:0] i_54;
  reg [0:0] i_55;
  reg [0:0] i_56;
  reg [0:0] i_57;
  reg [0:0] i_58;
  reg [0:0] i_59;
  reg [0:0] i_60;
  reg [0:0] i_61;
  reg [0:0] i_62;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  cv32e40p_controller dut (
    .clk(clk),
    .clk_ungated_i(i_0),
    .rst_n(i_1),
    .fetch_enable_i(i_2),
    .is_fetch_failed_i(i_3),
    .illegal_insn_i(i_4),
    .ecall_insn_i(i_5),
    .mret_insn_i(i_6),
    .uret_insn_i(i_7),
    .dret_insn_i(i_8),
    .mret_dec_i(i_9),
    .uret_dec_i(i_10),
    .dret_dec_i(i_11),
    .wfi_i(i_12),
    .ebrk_insn_i(i_13),
    .fencei_insn_i(i_14),
    .csr_status_i(i_15),
    .instr_valid_i(i_16),
    .pc_id_i(i_17),
    .is_compressed_i(i_18),
    .hwlp_start_addr_i(i_19),
    .hwlp_end_addr_i(i_20),
    .hwlp_counter_i(i_21),
    .data_req_ex_i(i_22),
    .data_we_ex_i(i_23),
    .data_misaligned_i(i_24),
    .data_load_event_i(i_25),
    .data_err_i(i_26),
    .mult_multicycle_i(i_27),
    .apu_en_i(i_28),
    .apu_read_dep_i(i_29),
    .apu_write_dep_i(i_30),
    .branch_taken_ex_i(i_31),
    .ctrl_transfer_insn_in_id_i(i_32),
    .ctrl_transfer_insn_in_dec_i(i_33),
    .irq_req_ctrl_i(i_34),
    .irq_sec_ctrl_i(i_35),
    .irq_id_ctrl_i(i_36),
    .irq_wu_ctrl_i(i_37),
    .current_priv_lvl_i(i_38),
    .debug_req_i(i_39),
    .debug_single_step_i(i_40),
    .debug_ebreakm_i(i_41),
    .debug_ebreaku_i(i_42),
    .trigger_match_i(i_43),
    .regfile_we_id_i(i_44),
    .regfile_alu_waddr_id_i(i_45),
    .regfile_we_ex_i(i_46),
    .regfile_waddr_ex_i(i_47),
    .regfile_we_wb_i(i_48),
    .regfile_alu_we_fw_i(i_49),
    .reg_d_ex_is_reg_a_i(i_50),
    .reg_d_ex_is_reg_b_i(i_51),
    .reg_d_ex_is_reg_c_i(i_52),
    .reg_d_wb_is_reg_a_i(i_53),
    .reg_d_wb_is_reg_b_i(i_54),
    .reg_d_wb_is_reg_c_i(i_55),
    .reg_d_alu_is_reg_a_i(i_56),
    .reg_d_alu_is_reg_b_i(i_57),
    .reg_d_alu_is_reg_c_i(i_58),
    .id_ready_i(i_59),
    .id_valid_i(i_60),
    .ex_valid_i(i_61),
    .wb_ready_i(i_62),
    .ctrl_busy_o(out_dut[99:99]),
    .is_decoding_o(out_dut[98:98]),
    .deassert_we_o(out_dut[97:97]),
    .hwlp_mask_o(out_dut[96:96]),
    .instr_req_o(out_dut[95:95]),
    .pc_set_o(out_dut[94:94]),
    .pc_mux_o(out_dut[93:90]),
    .exc_pc_mux_o(out_dut[89:87]),
    .trap_addr_mux_o(out_dut[86:85]),
    .hwlp_dec_cnt_o(out_dut[84:83]),
    .hwlp_jump_o(out_dut[82:82]),
    .hwlp_targ_addr_o(out_dut[81:50]),
    .data_err_ack_o(out_dut[49:49]),
    .apu_stall_o(out_dut[48:48]),
    .irq_ack_o(out_dut[47:47]),
    .irq_id_o(out_dut[46:42]),
    .exc_cause_o(out_dut[41:37]),
    .debug_mode_o(out_dut[36:36]),
    .debug_cause_o(out_dut[35:33]),
    .debug_csr_save_o(out_dut[32:32]),
    .debug_p_elw_no_sleep_o(out_dut[31:31]),
    .debug_wfi_no_sleep_o(out_dut[30:30]),
    .debug_havereset_o(out_dut[29:29]),
    .debug_running_o(out_dut[28:28]),
    .debug_halted_o(out_dut[27:27]),
    .wake_from_sleep_o(out_dut[26:26]),
    .csr_save_if_o(out_dut[25:25]),
    .csr_save_id_o(out_dut[24:24]),
    .csr_save_ex_o(out_dut[23:23]),
    .csr_cause_o(out_dut[22:17]),
    .csr_irq_sec_o(out_dut[16:16]),
    .csr_restore_mret_id_o(out_dut[15:15]),
    .csr_restore_uret_id_o(out_dut[14:14]),
    .csr_restore_dret_id_o(out_dut[13:13]),
    .csr_save_cause_o(out_dut[12:12]),
    .operand_a_fw_mux_sel_o(out_dut[11:10]),
    .operand_b_fw_mux_sel_o(out_dut[9:8]),
    .operand_c_fw_mux_sel_o(out_dut[7:6]),
    .halt_if_o(out_dut[5:5]),
    .halt_id_o(out_dut[4:4]),
    .misaligned_stall_o(out_dut[3:3]),
    .jr_stall_o(out_dut[2:2]),
    .load_stall_o(out_dut[1:1]),
    .perf_pipeline_stall_o(out_dut[0:0])
  );
  cv32e40p_controller__ref ref_i (
    .clk(clk),
    .clk_ungated_i(i_0),
    .rst_n(i_1),
    .fetch_enable_i(i_2),
    .is_fetch_failed_i(i_3),
    .illegal_insn_i(i_4),
    .ecall_insn_i(i_5),
    .mret_insn_i(i_6),
    .uret_insn_i(i_7),
    .dret_insn_i(i_8),
    .mret_dec_i(i_9),
    .uret_dec_i(i_10),
    .dret_dec_i(i_11),
    .wfi_i(i_12),
    .ebrk_insn_i(i_13),
    .fencei_insn_i(i_14),
    .csr_status_i(i_15),
    .instr_valid_i(i_16),
    .pc_id_i(i_17),
    .is_compressed_i(i_18),
    .hwlp_start_addr_i(i_19),
    .hwlp_end_addr_i(i_20),
    .hwlp_counter_i(i_21),
    .data_req_ex_i(i_22),
    .data_we_ex_i(i_23),
    .data_misaligned_i(i_24),
    .data_load_event_i(i_25),
    .data_err_i(i_26),
    .mult_multicycle_i(i_27),
    .apu_en_i(i_28),
    .apu_read_dep_i(i_29),
    .apu_write_dep_i(i_30),
    .branch_taken_ex_i(i_31),
    .ctrl_transfer_insn_in_id_i(i_32),
    .ctrl_transfer_insn_in_dec_i(i_33),
    .irq_req_ctrl_i(i_34),
    .irq_sec_ctrl_i(i_35),
    .irq_id_ctrl_i(i_36),
    .irq_wu_ctrl_i(i_37),
    .current_priv_lvl_i(i_38),
    .debug_req_i(i_39),
    .debug_single_step_i(i_40),
    .debug_ebreakm_i(i_41),
    .debug_ebreaku_i(i_42),
    .trigger_match_i(i_43),
    .regfile_we_id_i(i_44),
    .regfile_alu_waddr_id_i(i_45),
    .regfile_we_ex_i(i_46),
    .regfile_waddr_ex_i(i_47),
    .regfile_we_wb_i(i_48),
    .regfile_alu_we_fw_i(i_49),
    .reg_d_ex_is_reg_a_i(i_50),
    .reg_d_ex_is_reg_b_i(i_51),
    .reg_d_ex_is_reg_c_i(i_52),
    .reg_d_wb_is_reg_a_i(i_53),
    .reg_d_wb_is_reg_b_i(i_54),
    .reg_d_wb_is_reg_c_i(i_55),
    .reg_d_alu_is_reg_a_i(i_56),
    .reg_d_alu_is_reg_b_i(i_57),
    .reg_d_alu_is_reg_c_i(i_58),
    .id_ready_i(i_59),
    .id_valid_i(i_60),
    .ex_valid_i(i_61),
    .wb_ready_i(i_62),
    .ctrl_busy_o(out_ref[99:99]),
    .is_decoding_o(out_ref[98:98]),
    .deassert_we_o(out_ref[97:97]),
    .hwlp_mask_o(out_ref[96:96]),
    .instr_req_o(out_ref[95:95]),
    .pc_set_o(out_ref[94:94]),
    .pc_mux_o(out_ref[93:90]),
    .exc_pc_mux_o(out_ref[89:87]),
    .trap_addr_mux_o(out_ref[86:85]),
    .hwlp_dec_cnt_o(out_ref[84:83]),
    .hwlp_jump_o(out_ref[82:82]),
    .hwlp_targ_addr_o(out_ref[81:50]),
    .data_err_ack_o(out_ref[49:49]),
    .apu_stall_o(out_ref[48:48]),
    .irq_ack_o(out_ref[47:47]),
    .irq_id_o(out_ref[46:42]),
    .exc_cause_o(out_ref[41:37]),
    .debug_mode_o(out_ref[36:36]),
    .debug_cause_o(out_ref[35:33]),
    .debug_csr_save_o(out_ref[32:32]),
    .debug_p_elw_no_sleep_o(out_ref[31:31]),
    .debug_wfi_no_sleep_o(out_ref[30:30]),
    .debug_havereset_o(out_ref[29:29]),
    .debug_running_o(out_ref[28:28]),
    .debug_halted_o(out_ref[27:27]),
    .wake_from_sleep_o(out_ref[26:26]),
    .csr_save_if_o(out_ref[25:25]),
    .csr_save_id_o(out_ref[24:24]),
    .csr_save_ex_o(out_ref[23:23]),
    .csr_cause_o(out_ref[22:17]),
    .csr_irq_sec_o(out_ref[16:16]),
    .csr_restore_mret_id_o(out_ref[15:15]),
    .csr_restore_uret_id_o(out_ref[14:14]),
    .csr_restore_dret_id_o(out_ref[13:13]),
    .csr_save_cause_o(out_ref[12:12]),
    .operand_a_fw_mux_sel_o(out_ref[11:10]),
    .operand_b_fw_mux_sel_o(out_ref[9:8]),
    .operand_c_fw_mux_sel_o(out_ref[7:6]),
    .halt_if_o(out_ref[5:5]),
    .halt_id_o(out_ref[4:4]),
    .misaligned_stall_o(out_ref[3:3]),
    .jr_stall_o(out_ref[2:2]),
    .load_stall_o(out_ref[1:1]),
    .perf_pipeline_stall_o(out_ref[0:0])
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
    seed = 3191478408;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
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
      i_19 = {$random(seed), $random(seed)};
      i_20 = {$random(seed), $random(seed)};
      i_21 = {$random(seed), $random(seed)};
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
      i_46 = {$random(seed)};
      i_47 = {$random(seed)};
      i_48 = {$random(seed)};
      i_49 = {$random(seed)};
      i_50 = {$random(seed)};
      i_51 = {$random(seed)};
      i_52 = {$random(seed)};
      i_53 = {$random(seed)};
      i_54 = {$random(seed)};
      i_55 = {$random(seed)};
      i_56 = {$random(seed)};
      i_57 = {$random(seed)};
      i_58 = {$random(seed)};
      i_59 = {$random(seed)};
      i_60 = {$random(seed)};
      i_61 = {$random(seed)};
      i_62 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
