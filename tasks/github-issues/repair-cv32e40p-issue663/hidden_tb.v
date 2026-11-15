// Hidden tests: 5000 cycles of seeded random inputs (seed 4032453693); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 119;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [0:0] i_2;
  reg [2:0] i_3;
  reg [1:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [31:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  cv32e40p_decoder dut (
    .deassert_we_i(i_0),
    .instr_rdata_i(i_1),
    .illegal_c_insn_i(i_2),
    .frm_i(i_3),
    .current_priv_lvl_i(i_4),
    .debug_mode_i(i_5),
    .debug_wfi_no_sleep_i(i_6),
    .mcounteren_i(i_7),
    .illegal_insn_o(out_dut[118:118]),
    .ebrk_insn_o(out_dut[117:117]),
    .mret_insn_o(out_dut[116:116]),
    .uret_insn_o(out_dut[115:115]),
    .dret_insn_o(out_dut[114:114]),
    .mret_dec_o(out_dut[113:113]),
    .uret_dec_o(out_dut[112:112]),
    .dret_dec_o(out_dut[111:111]),
    .ecall_insn_o(out_dut[110:110]),
    .wfi_o(out_dut[109:109]),
    .fencei_insn_o(out_dut[108:108]),
    .rega_used_o(out_dut[107:107]),
    .regb_used_o(out_dut[106:106]),
    .regc_used_o(out_dut[105:105]),
    .reg_fp_a_o(out_dut[104:104]),
    .reg_fp_b_o(out_dut[103:103]),
    .reg_fp_c_o(out_dut[102:102]),
    .reg_fp_d_o(out_dut[101:101]),
    .bmask_a_mux_o(out_dut[100:100]),
    .bmask_b_mux_o(out_dut[99:98]),
    .alu_bmask_a_mux_sel_o(out_dut[97:97]),
    .alu_bmask_b_mux_sel_o(out_dut[96:96]),
    .alu_en_o(out_dut[95:95]),
    .alu_operator_o(out_dut[94:88]),
    .alu_op_a_mux_sel_o(out_dut[87:85]),
    .alu_op_b_mux_sel_o(out_dut[84:82]),
    .alu_op_c_mux_sel_o(out_dut[81:80]),
    .alu_vec_mode_o(out_dut[79:78]),
    .scalar_replication_o(out_dut[77:77]),
    .scalar_replication_c_o(out_dut[76:76]),
    .imm_a_mux_sel_o(out_dut[75:75]),
    .imm_b_mux_sel_o(out_dut[74:71]),
    .regc_mux_o(out_dut[70:69]),
    .is_clpx_o(out_dut[68:68]),
    .is_subrot_o(out_dut[67:67]),
    .mult_operator_o(out_dut[66:64]),
    .mult_int_en_o(out_dut[63:63]),
    .mult_dot_en_o(out_dut[62:62]),
    .mult_imm_mux_o(out_dut[61:61]),
    .mult_sel_subword_o(out_dut[60:60]),
    .mult_signed_mode_o(out_dut[59:58]),
    .mult_dot_signed_o(out_dut[57:56]),
    .fpu_dst_fmt_o(out_dut[55:53]),
    .fpu_src_fmt_o(out_dut[52:50]),
    .fpu_int_fmt_o(out_dut[49:48]),
    .apu_en_o(out_dut[47:47]),
    .apu_op_o(out_dut[46:41]),
    .apu_lat_o(out_dut[40:39]),
    .fp_rnd_mode_o(out_dut[38:36]),
    .regfile_mem_we_o(out_dut[35:35]),
    .regfile_alu_we_o(out_dut[34:34]),
    .regfile_alu_we_dec_o(out_dut[33:33]),
    .regfile_alu_waddr_sel_o(out_dut[32:32]),
    .csr_access_o(out_dut[31:31]),
    .csr_status_o(out_dut[30:30]),
    .csr_op_o(out_dut[29:28]),
    .data_req_o(out_dut[27:27]),
    .data_we_o(out_dut[26:26]),
    .prepost_useincr_o(out_dut[25:25]),
    .data_type_o(out_dut[24:23]),
    .data_sign_extension_o(out_dut[22:21]),
    .data_reg_offset_o(out_dut[20:19]),
    .data_load_event_o(out_dut[18:18]),
    .atop_o(out_dut[17:12]),
    .hwlp_we_o(out_dut[11:9]),
    .hwlp_target_mux_sel_o(out_dut[8:8]),
    .hwlp_start_mux_sel_o(out_dut[7:7]),
    .hwlp_cnt_mux_sel_o(out_dut[6:6]),
    .ctrl_transfer_insn_in_dec_o(out_dut[5:4]),
    .ctrl_transfer_insn_in_id_o(out_dut[3:2]),
    .ctrl_transfer_target_mux_sel_o(out_dut[1:0])
  );
  cv32e40p_decoder__ref ref_i (
    .deassert_we_i(i_0),
    .instr_rdata_i(i_1),
    .illegal_c_insn_i(i_2),
    .frm_i(i_3),
    .current_priv_lvl_i(i_4),
    .debug_mode_i(i_5),
    .debug_wfi_no_sleep_i(i_6),
    .mcounteren_i(i_7),
    .illegal_insn_o(out_ref[118:118]),
    .ebrk_insn_o(out_ref[117:117]),
    .mret_insn_o(out_ref[116:116]),
    .uret_insn_o(out_ref[115:115]),
    .dret_insn_o(out_ref[114:114]),
    .mret_dec_o(out_ref[113:113]),
    .uret_dec_o(out_ref[112:112]),
    .dret_dec_o(out_ref[111:111]),
    .ecall_insn_o(out_ref[110:110]),
    .wfi_o(out_ref[109:109]),
    .fencei_insn_o(out_ref[108:108]),
    .rega_used_o(out_ref[107:107]),
    .regb_used_o(out_ref[106:106]),
    .regc_used_o(out_ref[105:105]),
    .reg_fp_a_o(out_ref[104:104]),
    .reg_fp_b_o(out_ref[103:103]),
    .reg_fp_c_o(out_ref[102:102]),
    .reg_fp_d_o(out_ref[101:101]),
    .bmask_a_mux_o(out_ref[100:100]),
    .bmask_b_mux_o(out_ref[99:98]),
    .alu_bmask_a_mux_sel_o(out_ref[97:97]),
    .alu_bmask_b_mux_sel_o(out_ref[96:96]),
    .alu_en_o(out_ref[95:95]),
    .alu_operator_o(out_ref[94:88]),
    .alu_op_a_mux_sel_o(out_ref[87:85]),
    .alu_op_b_mux_sel_o(out_ref[84:82]),
    .alu_op_c_mux_sel_o(out_ref[81:80]),
    .alu_vec_mode_o(out_ref[79:78]),
    .scalar_replication_o(out_ref[77:77]),
    .scalar_replication_c_o(out_ref[76:76]),
    .imm_a_mux_sel_o(out_ref[75:75]),
    .imm_b_mux_sel_o(out_ref[74:71]),
    .regc_mux_o(out_ref[70:69]),
    .is_clpx_o(out_ref[68:68]),
    .is_subrot_o(out_ref[67:67]),
    .mult_operator_o(out_ref[66:64]),
    .mult_int_en_o(out_ref[63:63]),
    .mult_dot_en_o(out_ref[62:62]),
    .mult_imm_mux_o(out_ref[61:61]),
    .mult_sel_subword_o(out_ref[60:60]),
    .mult_signed_mode_o(out_ref[59:58]),
    .mult_dot_signed_o(out_ref[57:56]),
    .fpu_dst_fmt_o(out_ref[55:53]),
    .fpu_src_fmt_o(out_ref[52:50]),
    .fpu_int_fmt_o(out_ref[49:48]),
    .apu_en_o(out_ref[47:47]),
    .apu_op_o(out_ref[46:41]),
    .apu_lat_o(out_ref[40:39]),
    .fp_rnd_mode_o(out_ref[38:36]),
    .regfile_mem_we_o(out_ref[35:35]),
    .regfile_alu_we_o(out_ref[34:34]),
    .regfile_alu_we_dec_o(out_ref[33:33]),
    .regfile_alu_waddr_sel_o(out_ref[32:32]),
    .csr_access_o(out_ref[31:31]),
    .csr_status_o(out_ref[30:30]),
    .csr_op_o(out_ref[29:28]),
    .data_req_o(out_ref[27:27]),
    .data_we_o(out_ref[26:26]),
    .prepost_useincr_o(out_ref[25:25]),
    .data_type_o(out_ref[24:23]),
    .data_sign_extension_o(out_ref[22:21]),
    .data_reg_offset_o(out_ref[20:19]),
    .data_load_event_o(out_ref[18:18]),
    .atop_o(out_ref[17:12]),
    .hwlp_we_o(out_ref[11:9]),
    .hwlp_target_mux_sel_o(out_ref[8:8]),
    .hwlp_start_mux_sel_o(out_ref[7:7]),
    .hwlp_cnt_mux_sel_o(out_ref[6:6]),
    .ctrl_transfer_insn_in_dec_o(out_ref[5:4]),
    .ctrl_transfer_insn_in_id_o(out_ref[3:2]),
    .ctrl_transfer_target_mux_sel_o(out_ref[1:0])
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
    seed = 4032453693;
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
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
