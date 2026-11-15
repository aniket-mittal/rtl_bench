// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 73;
  localparam OW = 119;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  cv32e40p_decoder dut (
    .deassert_we_i(in_vec[72:72]),
    .instr_rdata_i(in_vec[71:40]),
    .illegal_c_insn_i(in_vec[39:39]),
    .frm_i(in_vec[38:36]),
    .current_priv_lvl_i(in_vec[35:34]),
    .debug_mode_i(in_vec[33:33]),
    .debug_wfi_no_sleep_i(in_vec[32:32]),
    .mcounteren_i(in_vec[31:0]),
    .illegal_insn_o(out_vec[118:118]),
    .ebrk_insn_o(out_vec[117:117]),
    .mret_insn_o(out_vec[116:116]),
    .uret_insn_o(out_vec[115:115]),
    .dret_insn_o(out_vec[114:114]),
    .mret_dec_o(out_vec[113:113]),
    .uret_dec_o(out_vec[112:112]),
    .dret_dec_o(out_vec[111:111]),
    .ecall_insn_o(out_vec[110:110]),
    .wfi_o(out_vec[109:109]),
    .fencei_insn_o(out_vec[108:108]),
    .rega_used_o(out_vec[107:107]),
    .regb_used_o(out_vec[106:106]),
    .regc_used_o(out_vec[105:105]),
    .reg_fp_a_o(out_vec[104:104]),
    .reg_fp_b_o(out_vec[103:103]),
    .reg_fp_c_o(out_vec[102:102]),
    .reg_fp_d_o(out_vec[101:101]),
    .bmask_a_mux_o(out_vec[100:100]),
    .bmask_b_mux_o(out_vec[99:98]),
    .alu_bmask_a_mux_sel_o(out_vec[97:97]),
    .alu_bmask_b_mux_sel_o(out_vec[96:96]),
    .alu_en_o(out_vec[95:95]),
    .alu_operator_o(out_vec[94:88]),
    .alu_op_a_mux_sel_o(out_vec[87:85]),
    .alu_op_b_mux_sel_o(out_vec[84:82]),
    .alu_op_c_mux_sel_o(out_vec[81:80]),
    .alu_vec_mode_o(out_vec[79:78]),
    .scalar_replication_o(out_vec[77:77]),
    .scalar_replication_c_o(out_vec[76:76]),
    .imm_a_mux_sel_o(out_vec[75:75]),
    .imm_b_mux_sel_o(out_vec[74:71]),
    .regc_mux_o(out_vec[70:69]),
    .is_clpx_o(out_vec[68:68]),
    .is_subrot_o(out_vec[67:67]),
    .mult_operator_o(out_vec[66:64]),
    .mult_int_en_o(out_vec[63:63]),
    .mult_dot_en_o(out_vec[62:62]),
    .mult_imm_mux_o(out_vec[61:61]),
    .mult_sel_subword_o(out_vec[60:60]),
    .mult_signed_mode_o(out_vec[59:58]),
    .mult_dot_signed_o(out_vec[57:56]),
    .fpu_dst_fmt_o(out_vec[55:53]),
    .fpu_src_fmt_o(out_vec[52:50]),
    .fpu_int_fmt_o(out_vec[49:48]),
    .apu_en_o(out_vec[47:47]),
    .apu_op_o(out_vec[46:41]),
    .apu_lat_o(out_vec[40:39]),
    .fp_rnd_mode_o(out_vec[38:36]),
    .regfile_mem_we_o(out_vec[35:35]),
    .regfile_alu_we_o(out_vec[34:34]),
    .regfile_alu_we_dec_o(out_vec[33:33]),
    .regfile_alu_waddr_sel_o(out_vec[32:32]),
    .csr_access_o(out_vec[31:31]),
    .csr_status_o(out_vec[30:30]),
    .csr_op_o(out_vec[29:28]),
    .data_req_o(out_vec[27:27]),
    .data_we_o(out_vec[26:26]),
    .prepost_useincr_o(out_vec[25:25]),
    .data_type_o(out_vec[24:23]),
    .data_sign_extension_o(out_vec[22:21]),
    .data_reg_offset_o(out_vec[20:19]),
    .data_load_event_o(out_vec[18:18]),
    .atop_o(out_vec[17:12]),
    .hwlp_we_o(out_vec[11:9]),
    .hwlp_target_mux_sel_o(out_vec[8:8]),
    .hwlp_start_mux_sel_o(out_vec[7:7]),
    .hwlp_cnt_mux_sel_o(out_vec[6:6]),
    .ctrl_transfer_insn_in_dec_o(out_vec[5:4]),
    .ctrl_transfer_insn_in_id_o(out_vec[3:2]),
    .ctrl_transfer_target_mux_sel_o(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 73'h1629385294c39fa34bd;
    stim[1] = 73'h16350f22203752737dc;
    stim[2] = 73'h1f27630d4517469666a;
    stim[3] = 73'h11ed4037719f56f366b;
    stim[4] = 73'h132f5b0315e664adc04;
    stim[5] = 73'h1235794848ffa979b1e;
    stim[6] = 73'h1d3c737165fb69b1894;
    stim[7] = 73'h1f4edce6057cb43f4c8;
    stim[8] = 73'h1645cebb81e60b15604;
    stim[9] = 73'h1b7448708c30f4f7c8d;
    stim[10] = 73'h1d88c3378159e7013a6;
    stim[11] = 73'h1274020b56479fcce2d;
    stim[12] = 73'h0a08029081bf2fb9828;
    stim[13] = 73'h0240417cfa53692df6a;
    stim[14] = 73'h09cb93ff2c6a02522c3;
    stim[15] = 73'h0ef556c74303fd8d350;
    stim[16] = 73'h12d0d705143845651c2;
    stim[17] = 73'h14c51e6e9833240e635;
    stim[18] = 73'h12bfba9ff293b80b993;
    stim[19] = 73'h01ed685ca8fdfac0b18;
    stim[20] = 73'h145edc4673e8540c342;
    stim[21] = 73'h1d74b9394e866deefe1;
    stim[22] = 73'h1392a2b1aeeed96a641;
    stim[23] = 73'h1748b39cac24530c5c1;
    stim[24] = 73'h00ab02ad600b86ddd20;
    stim[25] = 73'h08a51a7c2ef636c2864;
    stim[26] = 73'h0ca3985b67feaf71a6d;
    stim[27] = 73'h1ce40bc80f01c4a00cc;
    stim[28] = 73'h115315f020e682af09f;
    stim[29] = 73'h0cbb9380e0762a76a99;
    stim[30] = 73'h1929d02f618ffe22a10;
    stim[31] = 73'h169d837fd15660adc42;
    stim[32] = 73'h1a75541a45e9ce8d80e;
    stim[33] = 73'h0b28de88f49fc34ff00;
    stim[34] = 73'h095176f00c3efbf598f;
    stim[35] = 73'h0911f4a3c406a66511d;
    stim[36] = 73'h138495137181e8b0fc7;
    stim[37] = 73'h0e36b06629595293494;
    stim[38] = 73'h18b059b0ada431b5915;
    stim[39] = 73'h1a3d03fbf7a107995b1;
    stim[40] = 73'h1222fb51555329e4a58;
    stim[41] = 73'h1044bda1481e71415f2;
    stim[42] = 73'h1ffb39109d203213e03;
    stim[43] = 73'h16f40c40d4c12fbdb43;
    stim[44] = 73'h0f9889d788f3d0ff753;
    stim[45] = 73'h1791ebde1e8dfe06cf6;
    stim[46] = 73'h19fac40c06f6b15009d;
    stim[47] = 73'h086cc2b0d93f0c9de20;
    stim[48] = 73'h0639a17383006eabdc7;
    stim[49] = 73'h03b029430b9283b5c72;
    stim[50] = 73'h1ae245ce73e59dd08d4;
    stim[51] = 73'h0216abd4eb9488d467b;
    stim[52] = 73'h0ac2fcaa9f3bc859801;
    stim[53] = 73'h105bb397fb1c26f2fba;
    stim[54] = 73'h0411011d0413ce6266c;
    stim[55] = 73'h0cdef231f32b99900a4;
    stim[56] = 73'h1aa19597db2a58735de;
    stim[57] = 73'h0cc32657b1bf5108849;
    stim[58] = 73'h1eeb97c2bfde425fdc2;
    stim[59] = 73'h14eb7acc4b096ff7184;
    stim[60] = 73'h05b1b82372fa0ea6009;
    stim[61] = 73'h12a9bb82f0d87fed99b;
    stim[62] = 73'h00bf9a2738b06a602e7;
    stim[63] = 73'h15c79e164078e155c30;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 119'h40000b030008620002000102000001;
      expv[1] = 119'h40000b030008620002000102000001;
      expv[2] = 119'h40000b030008620002000102000001;
      expv[3] = 119'h40000b030008620002000102000001;
      expv[4] = 119'h40000b030008620002000102000001;
      expv[5] = 119'h40000b030008620002000102000001;
      expv[6] = 119'h40000b030008620002000102000001;
      expv[7] = 119'h40000b030008620002000102000001;
      expv[8] = 119'h40000b030008620002000102000001;
      expv[9] = 119'h40000b030008620002000102000001;
      expv[10] = 119'h40000b030008620002000102000001;
      expv[11] = 119'h40000b030008620002000102000001;
      expv[12] = 119'h40000b830008620002000102000001;
      expv[13] = 119'h40000b830008620002000102000001;
      expv[14] = 119'h40000b830008620002000102000001;
      expv[15] = 119'h40000b830008620002000102000001;
      expv[16] = 119'h40000b030008620002000102000001;
      expv[17] = 119'h40000b030008620002000102000001;
      expv[18] = 119'h40000b030008620002000102000001;
      expv[19] = 119'h40000b830008620002000102000001;
      expv[20] = 119'h40080b182809e20002000102000002;
      expv[21] = 119'h40000b030008620002000102000001;
      expv[22] = 119'h40000b030008620002000102000001;
      expv[23] = 119'h40000b030008620002000102000001;
      expv[24] = 119'h40000b830008620002000102000001;
      expv[25] = 119'h40000b830008620002000102000001;
      expv[26] = 119'h40000b830008620002000102000001;
      expv[27] = 119'h40000b030008620002000102000001;
      expv[28] = 119'h40000b030008620002000102000001;
      expv[29] = 119'h40000b830008620002000102000001;
      expv[30] = 119'h40000b030008620002000102000001;
      expv[31] = 119'h40000b030008620002000102000001;
      expv[32] = 119'h40000b030008620002000102000001;
      expv[33] = 119'h40000b830008620002000102000001;
      expv[34] = 119'h40000b830008620002000102000001;
      expv[35] = 119'h40000b830008620002000102000001;
      expv[36] = 119'h00000b184809620002000302000001;
      expv[37] = 119'h40000b830008620002000102000001;
      expv[38] = 119'h40000b030008620002000102000001;
      expv[39] = 119'h40000b030008620002000102000001;
      expv[40] = 119'h40000b030008620002000102000001;
      expv[41] = 119'h40000b030008620002000102000001;
      expv[42] = 119'h40000b030008620002000102000001;
      expv[43] = 119'h40000b030008620002000102000001;
      expv[44] = 119'h40000b830008620002000102000001;
      expv[45] = 119'h40000b030008620002000102000001;
      expv[46] = 119'h40000b030008620002000102000001;
      expv[47] = 119'h40000b830008620002000102000001;
      expv[48] = 119'h40000b830008620002000102000001;
      expv[49] = 119'h40000b830008620002000102000001;
      expv[50] = 119'h40080b182809e20002000102000002;
      expv[51] = 119'h40000b830008620002000102000001;
      expv[52] = 119'h40000b830008620002000102000001;
      expv[53] = 119'h40000b030008620002000102000001;
      expv[54] = 119'h40000b830008620002000102000001;
      expv[55] = 119'h40000b830008620002000102000001;
      expv[56] = 119'h40000b030008620002000102000001;
      expv[57] = 119'h40000b830008620002000102000001;
      expv[58] = 119'h400e0b180508220002000200000001;
      expv[59] = 119'h40000b030008620002000102000001;
      expv[60] = 119'h00000b984809620002000702000001;
      expv[61] = 119'h40000b030008620002000102000001;
      expv[62] = 119'h40080b8308006200020007a2000001;
      expv[63] = 119'h40000b030008620002000102000001;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
