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
    stim[0] = 73'h009c0abca075dbea995;
    stim[1] = 73'h05b1c8ef4b84a6649f3;
    stim[2] = 73'h04d0759015d50a4c8aa;
    stim[3] = 73'h158de54b3cf7bd0b36d;
    stim[4] = 73'h18b2197552de99541b7;
    stim[5] = 73'h00b3cbe150a5a398ddc;
    stim[6] = 73'h1079fd1e32172698954;
    stim[7] = 73'h0bb6f8320f39fb2af3d;
    stim[8] = 73'h04f691d273e9ec958c0;
    stim[9] = 73'h10497d824dbf09d3dd4;
    stim[10] = 73'h02c9a0988bfe089691b;
    stim[11] = 73'h07b19907cb05d488a46;
    stim[12] = 73'h02b3a6d11b936580e69;
    stim[13] = 73'h065134f97f5e91762a0;
    stim[14] = 73'h1f1e4964070594b6cb1;
    stim[15] = 73'h0e51b433c274be8be2a;
    stim[16] = 73'h02f4ca85166c20bccba;
    stim[17] = 73'h16a2cd000841d4f260f;
    stim[18] = 73'h1a9e65dbad7fc714d86;
    stim[19] = 73'h0ab1d9f7a6f55ca063f;
    stim[20] = 73'h18fbca6fdee82ddb8ad;
    stim[21] = 73'h1e900a153f942284759;
    stim[22] = 73'h1286ae4d22826f81878;
    stim[23] = 73'h045deb36a0a83e8e888;
    stim[24] = 73'h0839113274467a82dfd;
    stim[25] = 73'h0287dab4607d253361e;
    stim[26] = 73'h1c25520537bb2cf84df;
    stim[27] = 73'h04767c7ef2178abdf93;
    stim[28] = 73'h0116876175fd4d542f2;
    stim[29] = 73'h1f4909712501272a821;
    stim[30] = 73'h188635cedc2f7722c26;
    stim[31] = 73'h0ef072323d8eeba57e2;
    stim[32] = 73'h0ad3141f0db0505a349;
    stim[33] = 73'h0843a21518733ba9941;
    stim[34] = 73'h0897941c640cd12d5e8;
    stim[35] = 73'h12c627d7f2541f56962;
    stim[36] = 73'h07d5b87f63c1eebd671;
    stim[37] = 73'h17d478499a09c4e187f;
    stim[38] = 73'h09374f099c660217c67;
    stim[39] = 73'h01da30c398c7f496320;
    stim[40] = 73'h008cf444833323359dc;
    stim[41] = 73'h14da35f0d7e793a2431;
    stim[42] = 73'h0bce54100aea3a0368d;
    stim[43] = 73'h1dd35442304bce0aa02;
    stim[44] = 73'h0a07e2ec84d5c310645;
    stim[45] = 73'h17f00692faf8570b958;
    stim[46] = 73'h0ac00a9d3bc0ec31996;
    stim[47] = 73'h004b733ecc97b8bb55a;
    stim[48] = 73'h1f8dce0c937e58fbb73;
    stim[49] = 73'h129e6cae3db5ccf4952;
    stim[50] = 73'h01024e6803b5869999b;
    stim[51] = 73'h0108c59d5771ef71336;
    stim[52] = 73'h12ba9d3bdfab24af66a;
    stim[53] = 73'h053aa45b754d86079ae;
    stim[54] = 73'h06075322cd652eb3d4e;
    stim[55] = 73'h1d84b0102208e600428;
    stim[56] = 73'h1c57510311c463cc7ed;
    stim[57] = 73'h013fda2e5c890e99473;
    stim[58] = 73'h1de6bb55173544563d7;
    stim[59] = 73'h112191e06cc4c000764;
    stim[60] = 73'h1ce6ff0b3ea301c36e7;
    stim[61] = 73'h021352e76407a8429c5;
    stim[62] = 73'h0bb3f78aa8779e67349;
    stim[63] = 73'h1bd0d157b0f02f9675d;
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
      expv[0] = 119'h40000b830008620002000102000001;
      expv[1] = 119'h40000b830008620002000102000001;
      expv[2] = 119'h40000b830008620002000102000001;
      expv[3] = 119'h40080b030008620002000302000001;
      expv[4] = 119'h40000b030008620002000102000001;
      expv[5] = 119'h40000b830008620002000102000001;
      expv[6] = 119'h000c0b0a0208620002000102000033;
      expv[7] = 119'h40000b830008620002000102000001;
      expv[8] = 119'h40000b830008620002000102000001;
      expv[9] = 119'h40000b030008620002000102000001;
      expv[10] = 119'h40000b830008620002000102000001;
      expv[11] = 119'h40000b830008620002000102000001;
      expv[12] = 119'h40000b830008620002000102000001;
      expv[13] = 119'h40000b982809620002000702000001;
      expv[14] = 119'h40000b030008620002000102000001;
      expv[15] = 119'h40000b830008620002000102000001;
      expv[16] = 119'h40000b830008620002000102000001;
      expv[17] = 119'h40000b030008620002000102000001;
      expv[18] = 119'h40000b030008620002000102000001;
      expv[19] = 119'h40000b830008620002000102000001;
      expv[20] = 119'h40000b030008620002000102000001;
      expv[21] = 119'h40000b030008620002000102000001;
      expv[22] = 119'h40000b030008620002000102000001;
      expv[23] = 119'h40000b830008620002000102000001;
      expv[24] = 119'h40000b830008620002000102000001;
      expv[25] = 119'h40000b830008620002000102000001;
      expv[26] = 119'h40000b030008620002000102000001;
      expv[27] = 119'h00000b982809e20002000702000015;
      expv[28] = 119'h00000b982809620002000702000001;
      expv[29] = 119'h40000b030008620002000102000001;
      expv[30] = 119'h40000b030008620002000102000001;
      expv[31] = 119'h400c0b980908e2000200010e000001;
      expv[32] = 119'h40000b830008620002000102000001;
      expv[33] = 119'h40000b830008620002000102000001;
      expv[34] = 119'h40000b830008620002000102000001;
      expv[35] = 119'h40000b030008620002000102000001;
      expv[36] = 119'h40000b830008620002000102000001;
      expv[37] = 119'h40000b030008620002000102000001;
      expv[38] = 119'h40000b830008620002000102000001;
      expv[39] = 119'h40000b830008620002000102000001;
      expv[40] = 119'h40000b830008620002000102000001;
      expv[41] = 119'h40000b030008620002000102000001;
      expv[42] = 119'h40000b830008620002000102000001;
      expv[43] = 119'h000e0b180508220002000107000001;
      expv[44] = 119'h40000b830008620002000102000001;
      expv[45] = 119'h40000b030008620002000102000001;
      expv[46] = 119'h40000b830008620002000102000001;
      expv[47] = 119'h40000b830008620002000102000001;
      expv[48] = 119'h40000b030008620002000102000001;
      expv[49] = 119'h400c0b000208620002000102000033;
      expv[50] = 119'h40000b830008620002000102000001;
      expv[51] = 119'h40000b830008620002000102000001;
      expv[52] = 119'h40000b030008620002000102000001;
      expv[53] = 119'h00000b984809620002000702000001;
      expv[54] = 119'h40000b830008620002000102000001;
      expv[55] = 119'h40000b030008620002000102000001;
      expv[56] = 119'h40000b030008620002000102000001;
      expv[57] = 119'h40000b830008620002000102000001;
      expv[58] = 119'h40000b030008620002000102000001;
      expv[59] = 119'h40000b030008620002000102000001;
      expv[60] = 119'h400813030808620002000302000001;
      expv[61] = 119'h40000b830008620002000102000001;
      expv[62] = 119'h40000b830008620002000102000001;
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
