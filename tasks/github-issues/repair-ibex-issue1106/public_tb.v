// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 163;
  localparam OW = 67;
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
    .rst_ni(in_vec[162:162]),
    .illegal_insn_i(in_vec[161:161]),
    .ecall_insn_i(in_vec[160:160]),
    .mret_insn_i(in_vec[159:159]),
    .dret_insn_i(in_vec[158:158]),
    .wfi_insn_i(in_vec[157:157]),
    .ebrk_insn_i(in_vec[156:156]),
    .csr_pipe_flush_i(in_vec[155:155]),
    .instr_valid_i(in_vec[154:154]),
    .instr_i(in_vec[153:122]),
    .instr_compressed_i(in_vec[121:106]),
    .instr_is_compressed_i(in_vec[105:105]),
    .instr_bp_taken_i(in_vec[104:104]),
    .instr_fetch_err_i(in_vec[103:103]),
    .instr_fetch_err_plus2_i(in_vec[102:102]),
    .pc_id_i(in_vec[101:70]),
    .lsu_addr_last_i(in_vec[69:38]),
    .load_err_i(in_vec[37:37]),
    .store_err_i(in_vec[36:36]),
    .branch_set_i(in_vec[35:35]),
    .branch_set_spec_i(in_vec[34:34]),
    .branch_not_set_i(in_vec[33:33]),
    .jump_set_i(in_vec[32:32]),
    .csr_mstatus_mie_i(in_vec[31:31]),
    .irq_pending_i(in_vec[30:30]),
    .irqs_i(in_vec[29:12]),
    .irq_nm_i(in_vec[11:11]),
    .debug_req_i(in_vec[10:10]),
    .debug_single_step_i(in_vec[9:9]),
    .debug_ebreakm_i(in_vec[8:8]),
    .debug_ebreaku_i(in_vec[7:7]),
    .trigger_match_i(in_vec[6:6]),
    .priv_mode_i(in_vec[5:4]),
    .csr_mstatus_tw_i(in_vec[3:3]),
    .stall_id_i(in_vec[2:2]),
    .stall_wb_i(in_vec[1:1]),
    .ready_wb_i(in_vec[0:0]),
    .ctrl_busy_o(out_vec[66:66]),
    .instr_valid_clear_o(out_vec[65:65]),
    .id_in_ready_o(out_vec[64:64]),
    .controller_run_o(out_vec[63:63]),
    .instr_req_o(out_vec[62:62]),
    .pc_set_o(out_vec[61:61]),
    .pc_set_spec_o(out_vec[60:60]),
    .pc_mux_o(out_vec[59:57]),
    .nt_branch_mispredict_o(out_vec[56:56]),
    .exc_pc_mux_o(out_vec[55:54]),
    .exc_cause_o(out_vec[53:48]),
    .wb_exception_o(out_vec[47:47]),
    .nmi_mode_o(out_vec[46:46]),
    .debug_cause_o(out_vec[45:43]),
    .debug_csr_save_o(out_vec[42:42]),
    .debug_mode_o(out_vec[41:41]),
    .csr_save_if_o(out_vec[40:40]),
    .csr_save_id_o(out_vec[39:39]),
    .csr_save_wb_o(out_vec[38:38]),
    .csr_restore_mret_id_o(out_vec[37:37]),
    .csr_restore_dret_id_o(out_vec[36:36]),
    .csr_save_cause_o(out_vec[35:35]),
    .csr_mtval_o(out_vec[34:3]),
    .flush_id_o(out_vec[2:2]),
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
    stim[0] = 163'h1b9c83fa97527b510f3900ed9f52ee051530dbe4c;
    stim[1] = 163'h013927894af5185721b679af52bd6f26e52986bdf;
    stim[2] = 163'h5ab3f863695a0d47558c32f084e73f20b872f27cb;
    stim[3] = 163'h66dcdd46df09e859ff3e2f8e8b4745b2d2f919c96;
    stim[4] = 163'h6e989d445b64569973622327dcced8a144898bec5;
    stim[5] = 163'h4253a54d477f9ce9aca9442013b250a4a733a1211;
    stim[6] = 163'h42af8ad2d69a0358357c3c4618ca6c4c34586b7ba;
    stim[7] = 163'h794f66721002e3f26728216dd79d6219f529ffbb2;
    stim[8] = 163'h3e9ec2c0b15121c5d4f068b7d62867c68cee13a38;
    stim[9] = 163'h47a55848143ad9229f8e75e4b939ba8f60e059ac8;
    stim[10] = 163'h58d39a9a3b35f7af9c078c48a8f05fa14c22f781e;
    stim[11] = 163'h6c27eaa85cac448403a3cdc29840b017bf8162a85;
    stim[12] = 163'h7294f68101bf4ac3392463ec572866f6725d72488;
    stim[13] = 163'h51cbb35399160c4b1dceb8db1338e9a0537b6e8d2;
    stim[14] = 163'h69ccc837a27696cd2c428b63bf3ea3cbeb4834a3e;
    stim[15] = 163'h6853af2bc9d554d1b40b8cb51507b579de711da4d;
    stim[16] = 163'h51aa3ee826196fbc35e600d62b076fd31d6f34d73;
    stim[17] = 163'h798a5af5f90cd1ebf0025cb1d1e1bb73cf360bc98;
    stim[18] = 163'h64f9a6b3b132b28849cd2ca1c72f43215570367fe;
    stim[19] = 163'h428ea9d94d9e80044832eaa48329e3ff212d310a3;
    stim[20] = 163'h68f045135a0734c7e9913e0c33093e4056171f735;
    stim[21] = 163'h4c5c1ebe4da9e0d00ad7540898ea8cbbe8653faa9;
    stim[22] = 163'h40012bf3e2a072d94597d679ef3ba2f751737bb72;
    stim[23] = 163'h47b9dafefb307c2254056f12fccc8db38e83dbaae;
    stim[24] = 163'h67874d20d970f332c9de434d095189c722561156f;
    stim[25] = 163'h4742182118500e560cf0eeaf3d12853889351a56c;
    stim[26] = 163'h7ce371a04175ba8adf1996eaeb385d56e3f676f83;
    stim[27] = 163'h70e7ced658cdfd94d364d180df13cc79b160c4ad6;
    stim[28] = 163'h57ad78af7449563b8593a6f664771056c8b8a94ba;
    stim[29] = 163'h786059b0f68729b4a616a29ebb5cd6e2cdda49d5f;
    stim[30] = 163'h7b79c8d651ad20194b6c60cac5fb244ea692914f0;
    stim[31] = 163'h4dc68ac17875df9ec338a7a4bc58ee7d333ec96d7;
    stim[32] = 163'h7f21835dc3e0d56337481f43e5e75f1298c4f340e;
    stim[33] = 163'h75ca0901b9c58b0ffa9e3a28b4389e883399927a8;
    stim[34] = 163'h7605edd6c48b87ec805aa0160c5f80f38e3ff23a7;
    stim[35] = 163'h6382a404f342cb3950e3e22e226fbea2baa41b950;
    stim[36] = 163'h5438cbc65272311b646aea067dd9c4a89e9c54ebd;
    stim[37] = 163'h4f30e5195614af7168f4a55f9f3c96f4aa763f40e;
    stim[38] = 163'h7152f5417e8963f91936da080d493bd5571c2d554;
    stim[39] = 163'h4ef11aac1ffe88beac1514b41c59c34137297f304;
    stim[40] = 163'h741da2a3b0c7331b83a612f320dd9077a3bd6f472;
    stim[41] = 163'h6e38e5092156d90eb7af31db22e79f3329fee8f6e;
    stim[42] = 163'h5ce125a51360262c64bbf391473512e8c346801f4;
    stim[43] = 163'h6a4201d84bfa2710b7d5113a867a8be891c9e3bea;
    stim[44] = 163'h6e50f7e5d41e8e70ce2765bfcab8bd1054dda7127;
    stim[45] = 163'h5c56d6d7502d30526c40819696d8de19242a9c66f;
    stim[46] = 163'h5a7afcf9a980e0eff58dbcd72c4a387a2527a425f;
    stim[47] = 163'h4af6e74d2956288c3b6354b22f9056768d14d01fb;
    stim[48] = 163'h6bb30f94c7d938a3faf9afdb0e06651f86f6cb91f;
    stim[49] = 163'h4c091fdcd1c3c6e0703f371612f91037c277ab32f;
    stim[50] = 163'h4807632ea8276357bc274784293f97377ef79e8dd;
    stim[51] = 163'h4c45a90b85f4a8a0ab38fb0485bd862cd99dd4939;
    stim[52] = 163'h784861f9a9be8da27765fec90870a2874eb497ee3;
    stim[53] = 163'h509cd0e162de0f2edbfcda39ca44df5a3ec6c7beb;
    stim[54] = 163'h54421b80d0198e73e1520f5916b788dd68a733035;
    stim[55] = 163'h74aae305afa55f2ac142b493db486a0c0d033cecd;
    stim[56] = 163'h5bc9e315cb608ea5d99388efb83ac592bb5421c12;
    stim[57] = 163'h4caf73c0a8932322f35a4636892d3b69e785af57e;
    stim[58] = 163'h482ae75ac867e048e6e4de9cda2ee5a19ed0e2c09;
    stim[59] = 163'h4d4fbeabe164a5c30b24435f1abd9549e489bb9ad;
    stim[60] = 163'h55766577b235ec9d69bf5b3df115a57e97b5f57bd;
    stim[61] = 163'h414546368f07ea8128a89bbaee8ae4b8501d941f4;
    stim[62] = 163'h5dca74c4923dfe85ff62f58e951ff21ccbfd20c7f;
    stim[63] = 163'h4259a2b6c34a7f896a7404da518e1168414d4b8c1;
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
      expv[0] = 67'h43040080000000000;
      expv[1] = 67'h43040080000000000;
      expv[2] = 67'h43040080000000000;
      expv[3] = 67'h47040080000000000;
      expv[4] = 67'h44040080000000000;
      expv[5] = 67'h77480250800000004;
      expv[6] = 67'h4f2400a0000000002;
      expv[7] = 67'h4f2400a0000000003;
      expv[8] = 67'h73040080000000000;
      expv[9] = 67'h73040080000000000;
      expv[10] = 67'h47040080000000000;
      expv[11] = 67'h44040080000000000;
      expv[12] = 67'h74440080000000000;
      expv[13] = 67'h4c240080000000000;
      expv[14] = 67'h4c240080000000000;
      expv[15] = 67'h4f240080000000003;
      expv[16] = 67'h67402080800032df4;
      expv[17] = 67'h774801d0800000004;
      expv[18] = 67'h4c2400a0000000000;
      expv[19] = 67'h4c2400a0000000000;
      expv[20] = 67'h674c70a0866127c84;
      expv[21] = 67'h4f2400a0000000001;
      expv[22] = 67'h674c20a08257e7c54;
      expv[23] = 67'h4e2400a0000000001;
      expv[24] = 67'h4c2400a0000000000;
      expv[25] = 67'h674c20a084304230c;
      expv[26] = 67'h4c2400a0000000000;
      expv[27] = 67'h674c20a0cf9dacb1c;
      expv[28] = 67'h4f2400a0000000001;
      expv[29] = 67'h4f2400a0000000001;
      expv[30] = 67'h674c10a0a96d8c194;
      expv[31] = 67'h4c2400a0000000000;
      expv[32] = 67'h674c20a0800041aac;
      expv[33] = 67'h4c2400a0000000000;
      expv[34] = 67'h4e2400a0000000001;
      expv[35] = 67'h674c20a0800005964;
      expv[36] = 67'h4f2400a0000000003;
      expv[37] = 67'h4e2400a0000000001;
      expv[38] = 67'h4c2400a0000000000;
      expv[39] = 67'h4c2400a0000000000;
      expv[40] = 67'h4e2400a0000000001;
      expv[41] = 67'h4c2400a0000000000;
      expv[42] = 67'h4c2400a0000000000;
      expv[43] = 67'h4f2400a0000000003;
      expv[44] = 67'h4f2400a0000000002;
      expv[45] = 67'h674c20a0adadaea04;
      expv[46] = 67'h4c2400a0000000000;
      expv[47] = 67'h674c10a0876c6a974;
      expv[48] = 67'h4e2400a0000000001;
      expv[49] = 67'h674c20a08000078dc;
      expv[50] = 67'h4f2400a0000000002;
      expv[51] = 67'h674c70a090b7b0c5c;
      expv[52] = 67'h4d2400a0000000000;
      expv[53] = 67'h674c20a080003c1e4;
      expv[54] = 67'h4d2400a0000000000;
      expv[55] = 67'h674c70a0fb690d41c;
      expv[56] = 67'h4f2400a0000000003;
      expv[57] = 67'h4f2400a0000000001;
      expv[58] = 67'h4f2400a0000000003;
      expv[59] = 67'h444c00a0000000000;
      expv[60] = 67'h674800a0000000004;
      expv[61] = 67'h4f2400a0000000002;
      expv[62] = 67'h4f2400a0000000001;
      expv[63] = 67'h674c10a0ad4e809b4;
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
