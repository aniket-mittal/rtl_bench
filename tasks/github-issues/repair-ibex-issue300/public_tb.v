// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 156;
  localparam OW = 60;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ibex_controller dut (
    .clk_i(clk),
    .rst_ni(in_vec[155:155]),
    .fetch_enable_i(in_vec[154:154]),
    .illegal_insn_i(in_vec[153:153]),
    .ecall_insn_i(in_vec[152:152]),
    .mret_insn_i(in_vec[151:151]),
    .dret_insn_i(in_vec[150:150]),
    .wfi_insn_i(in_vec[149:149]),
    .ebrk_insn_i(in_vec[148:148]),
    .csr_pipe_flush_i(in_vec[147:147]),
    .instr_valid_i(in_vec[146:146]),
    .instr_i(in_vec[145:114]),
    .instr_compressed_i(in_vec[113:98]),
    .instr_is_compressed_i(in_vec[97:97]),
    .instr_fetch_err_i(in_vec[96:96]),
    .pc_id_i(in_vec[95:64]),
    .lsu_addr_last_i(in_vec[63:32]),
    .load_err_i(in_vec[31:31]),
    .store_err_i(in_vec[30:30]),
    .branch_set_i(in_vec[29:29]),
    .jump_set_i(in_vec[28:28]),
    .csr_mstatus_mie_i(in_vec[27:27]),
    .csr_msip_i(in_vec[26:26]),
    .csr_mtip_i(in_vec[25:25]),
    .csr_meip_i(in_vec[24:24]),
    .csr_mfip_i(in_vec[23:9]),
    .irq_pending_i(in_vec[8:8]),
    .irq_nm_i(in_vec[7:7]),
    .debug_req_i(in_vec[6:6]),
    .debug_single_step_i(in_vec[5:5]),
    .debug_ebreakm_i(in_vec[4:4]),
    .stall_lsu_i(in_vec[3:3]),
    .stall_multdiv_i(in_vec[2:2]),
    .stall_jump_i(in_vec[1:1]),
    .stall_branch_i(in_vec[0:0]),
    .ctrl_busy_o(out_vec[59:59]),
    .first_fetch_o(out_vec[58:58]),
    .instr_valid_clear_o(out_vec[57:57]),
    .id_in_ready_o(out_vec[56:56]),
    .instr_req_o(out_vec[55:55]),
    .pc_set_o(out_vec[54:54]),
    .pc_mux_o(out_vec[53:51]),
    .exc_pc_mux_o(out_vec[50:49]),
    .exc_cause_o(out_vec[48:43]),
    .debug_cause_o(out_vec[42:40]),
    .debug_csr_save_o(out_vec[39:39]),
    .debug_mode_o(out_vec[38:38]),
    .csr_save_if_o(out_vec[37:37]),
    .csr_save_id_o(out_vec[36:36]),
    .csr_restore_mret_id_o(out_vec[35:35]),
    .csr_save_cause_o(out_vec[34:34]),
    .csr_mtval_o(out_vec[33:2]),
    .perf_jump_o(out_vec[1:1]),
    .perf_tbranch_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 156'h3e3d432a624425a0275554533dacd24823ad371;
    stim[1] = 156'h49e03d06b66241d384211de8df8bcde0c35de0c;
    stim[2] = 156'hf2314787d1546f852db013efa71b077c5e740d4;
    stim[3] = 156'h9e55a2a55b381a627bd0f2c4448c2fad59b96ed;
    stim[4] = 156'hbeab9226691a2ca265f138c71eab619bb0cbc43;
    stim[5] = 156'hc458ac237997758a093e39e2b65c204fcb2994a;
    stim[6] = 156'hcea8e274a777bec13af1cc4366804494ca05394;
    stim[7] = 156'hdcbf152fb6070cef402e5013ccf48de53c8b1a9;
    stim[8] = 156'h8dc4481d29acd67fdf2111b5104f38fbc66c860;
    stim[9] = 156'hafe176e593005d500a99e2a4ab93b56f71067a5;
    stim[10] = 156'h898809046d50e2f726ed6328048b1f16f06c536;
    stim[11] = 156'hc79b262391a4a4e6f66ddb7024a6c8954e15c3b;
    stim[12] = 156'h9de5af41e41deb26e3cfb58ac1064fdb1e870d6;
    stim[13] = 156'hffa5dcc50d92b03f33339b19157f137d32f9e26;
    stim[14] = 156'hb4a69d8a36bfb468fb29c1cc40b42392520dac8;
    stim[15] = 156'hf47fc2ba72f3be0d67bcd81aaddfe8db9fe5226;
    stim[16] = 156'h95830b6b5329124b4264e96ed6e3c0683b3e12c;
    stim[17] = 156'ha537420b423f3a91206ed9375834100b7e7df47;
    stim[18] = 156'he12b877d6ef9563e3526752f088ff3b3760aa29;
    stim[19] = 156'ha0aaac48a4e966b7a9f9a5616b496ccf8f810f7;
    stim[20] = 156'hbb1c7349c93183878d98092ef171dcfeea447d2;
    stim[21] = 156'hfc906b4b000debacafa673fab74dbc8276f4521;
    stim[22] = 156'h917224b8415ec42a1014913a8dd0ecfecc9a18c;
    stim[23] = 156'ha4391a154144313a44a784dd4efc55a2246195b;
    stim[24] = 156'hba95ac052bf59090cdaf91154b3b8c2d3df1679;
    stim[25] = 156'hfb0ebccc8c5e05bca5b3660cea5c95582aee8ea;
    stim[26] = 156'he813df7f59a3656e08a1ebf9c331aaec1fcca48;
    stim[27] = 156'h8349f50523870c7f3a840ba38e5cab3dc6b7d39;
    stim[28] = 156'hebeb99f7ec493685d4610f5975a672fdcdb0c0a;
    stim[29] = 156'he2d3a36d3f490360fe749c7ffef07ee12883dfa;
    stim[30] = 156'hf562eb5f162fbc1b2bba8a84377ed9924fdaeec;
    stim[31] = 156'hc1c4b3329de7fa4490ea6bab7691e31aab68921;
    stim[32] = 156'hd3bc141f90094500c0dba6ed3924db0ac287d4a;
    stim[33] = 156'ha4ba6de8b5565869cf121bfb951ed364704d338;
    stim[34] = 156'h95f8a5dc1a252d5bcc56b2ecce6cc676309be88;
    stim[35] = 156'ha5a50d12312a4a7c8c0ea4dbae7685e8727e7e1;
    stim[36] = 156'ha254dbd75371c55fbb778b1efdbac4ce2708d4e;
    stim[37] = 156'hd9cec9c516b1a01968b48018918742ae6c67ff3;
    stim[38] = 156'he8c652991fc1409814e4c4dc6350011b6d2e523;
    stim[39] = 156'he7170d99deaf38f3c8ae17e4069583f31aea3dd;
    stim[40] = 156'hd0f6ce7eeddf5dd084ca4062c6c97b4d6032591;
    stim[41] = 156'hda49e0ad58a463ac6e12172cbb36ccfd60163ec;
    stim[42] = 156'hfc2dcf70e888c8fe24a0ebf67a86e01648d98f7;
    stim[43] = 156'he15b3f581247d45573ee9e085bf55c59e931ce1;
    stim[44] = 156'h9483e476a2dffb20852c831e0159dff198be3ba;
    stim[45] = 156'ha8cf1127e73e6cc1b64c97df9955633477cc991;
    stim[46] = 156'h88598c7a08c1bc19f50d7c755375b193989d80b;
    stim[47] = 156'hc08c9896bb275df8d6a6cb157fd1261b8ef91a2;
    stim[48] = 156'ha9f7270119520897db260fcfc2204641792a960;
    stim[49] = 156'hbe8a3518bb3ea808558a9552da6b5a01bcc05af;
    stim[50] = 156'hf3a9b7edaeff42c4318af46e2438d4807bafce9;
    stim[51] = 156'h950d2544441b7f404f6409fd9eaef1a2fa8ad9f;
    stim[52] = 156'hb36f6ed3a8a85f44ba5d4e1a325380c58068fc0;
    stim[53] = 156'h8ade232384a40eef34bbd827de44c76ad3b684a;
    stim[54] = 156'ha30037a3adf7c4e190e8e57d36cf20a786e1137;
    stim[55] = 156'hed7e41ec39fd69df2c2681dc190837f7b9d58b3;
    stim[56] = 156'he47a58f2c462c8700d8e5a3378106afdaac816d;
    stim[57] = 156'h8e80f0a11c59818538930e5c94611501fde7e15;
    stim[58] = 156'hdf8a573d6601b355d523b6f95cec238db8ef833;
    stim[59] = 156'h9a46a00408816261ee56e7186d311f38401a5e7;
    stim[60] = 156'hcc739f82213f4d1ef0858aa19aa56ebbef02eb6;
    stim[61] = 156'hf9cd3046510ff708424ec27263a3e60e51bb319;
    stim[62] = 156'ha5fece85b2787830fdf2686e41c8ef691e7e5ce;
    stim[63] = 156'he54913e55779b4ea8e7f30a16dcdf6a5d26d026;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 60'h842010000000000;
      expv[1] = 60'h842010000000000;
      expv[2] = 60'h842010000000000;
      expv[3] = 60'h8c2010000000000;
      expv[4] = 60'he82010000000000;
      expv[5] = 60'h8d403a400000000;
      expv[6] = 60'h882014000000000;
      expv[7] = 60'h882014000000000;
      expv[8] = 60'hbca014000000003;
      expv[9] = 60'h8ca014000000003;
      expv[10] = 60'h882014000000000;
      expv[11] = 60'h882014000000000;
      expv[12] = 60'h8ca014000000003;
      expv[13] = 60'h882014000000000;
      expv[14] = 60'h882014000000000;
      expv[15] = 60'h8ca014000000003;
      expv[16] = 60'h882014000000000;
      expv[17] = 60'h882014000000000;
      expv[18] = 60'h882014000000000;
      expv[19] = 60'h882014000000000;
      expv[20] = 60'h882014000000000;
      expv[21] = 60'h882014000000000;
      expv[22] = 60'h8ca014000000001;
      expv[23] = 60'h882014000000000;
      expv[24] = 60'h882014000000000;
      expv[25] = 60'h882014000000000;
      expv[26] = 60'h882014000000000;
      expv[27] = 60'h8ca014000000002;
      expv[28] = 60'h8ca014000000002;
      expv[29] = 60'h8ca014000000002;
      expv[30] = 60'h8ca014000000001;
      expv[31] = 60'h8ca014000000001;
      expv[32] = 60'h882014000000000;
      expv[33] = 60'h882014000000000;
      expv[34] = 60'h8ca014000000001;
      expv[35] = 60'h882014000000000;
      expv[36] = 60'h8ca014000000001;
      expv[37] = 60'h8ca014000000001;
      expv[38] = 60'h8ca014000000003;
      expv[39] = 60'h882014000000000;
      expv[40] = 60'h8ca014000000002;
      expv[41] = 60'h8ca014000000002;
      expv[42] = 60'h882014000000000;
      expv[43] = 60'h8ca014000000002;
      expv[44] = 60'h882014000000000;
      expv[45] = 60'ha82014000000000;
      expv[46] = 60'had609567d435f1c;
      expv[47] = 60'h882014000000000;
      expv[48] = 60'hbca014000000002;
      expv[49] = 60'h882014000000000;
      expv[50] = 60'h882014000000000;
      expv[51] = 60'h882014000000000;
      expv[52] = 60'hbca014000000002;
      expv[53] = 60'h8ca014000000001;
      expv[54] = 60'h882014000000000;
      expv[55] = 60'h8ca014000000003;
      expv[56] = 60'h8ca014000000002;
      expv[57] = 60'h882014000000000;
      expv[58] = 60'h882014000000000;
      expv[59] = 60'ha82014000000000;
      expv[60] = 60'had60957bc2162a8;
      expv[61] = 60'h8ca014000000001;
      expv[62] = 60'h8ca014000000002;
      expv[63] = 60'h8ca014000000002;
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
