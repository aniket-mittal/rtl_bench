// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 162;
  localparam OW = 69;
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
    .rst_ni(in_vec[161:161]),
    .illegal_insn_i(in_vec[160:160]),
    .ecall_insn_i(in_vec[159:159]),
    .mret_insn_i(in_vec[158:158]),
    .dret_insn_i(in_vec[157:157]),
    .wfi_insn_i(in_vec[156:156]),
    .ebrk_insn_i(in_vec[155:155]),
    .csr_pipe_flush_i(in_vec[154:154]),
    .instr_valid_i(in_vec[153:153]),
    .instr_i(in_vec[152:121]),
    .instr_compressed_i(in_vec[120:105]),
    .instr_is_compressed_i(in_vec[104:104]),
    .instr_bp_taken_i(in_vec[103:103]),
    .instr_fetch_err_i(in_vec[102:102]),
    .instr_fetch_err_plus2_i(in_vec[101:101]),
    .pc_id_i(in_vec[100:69]),
    .lsu_addr_last_i(in_vec[68:37]),
    .load_err_i(in_vec[36:36]),
    .load_intg_err_i(in_vec[35:35]),
    .store_err_i(in_vec[34:34]),
    .branch_set_i(in_vec[33:33]),
    .branch_not_set_i(in_vec[32:32]),
    .jump_set_i(in_vec[31:31]),
    .csr_mstatus_mie_i(in_vec[30:30]),
    .irq_pending_i(in_vec[29:29]),
    .irqs_i(in_vec[28:11]),
    .irq_nm_ext_i(in_vec[10:10]),
    .debug_req_i(in_vec[9:9]),
    .debug_single_step_i(in_vec[8:8]),
    .debug_ebreakm_i(in_vec[7:7]),
    .debug_ebreaku_i(in_vec[6:6]),
    .trigger_match_i(in_vec[5:5]),
    .priv_mode_i(in_vec[4:3]),
    .stall_id_i(in_vec[2:2]),
    .stall_wb_i(in_vec[1:1]),
    .ready_wb_i(in_vec[0:0]),
    .ctrl_busy_o(out_vec[68:68]),
    .instr_valid_clear_o(out_vec[67:67]),
    .id_in_ready_o(out_vec[66:66]),
    .controller_run_o(out_vec[65:65]),
    .instr_req_o(out_vec[64:64]),
    .pc_set_o(out_vec[63:63]),
    .pc_mux_o(out_vec[62:60]),
    .nt_branch_mispredict_o(out_vec[59:59]),
    .exc_pc_mux_o(out_vec[58:57]),
    .exc_cause_o(out_vec[56:50]),
    .wb_exception_o(out_vec[49:49]),
    .id_exception_o(out_vec[48:48]),
    .nmi_mode_o(out_vec[47:47]),
    .debug_cause_o(out_vec[46:44]),
    .debug_csr_save_o(out_vec[43:43]),
    .debug_mode_o(out_vec[42:42]),
    .debug_mode_entering_o(out_vec[41:41]),
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
    stim[0] = 162'h022f3b3ce4ec6cf80041ac4af02c5365a390185aa;
    stim[1] = 162'h1a097aed2737499e26a2fa1a5e29749fbde731521;
    stim[2] = 162'h2c7ba5952cc4ee3e977901dd1551920c2ee665480;
    stim[3] = 162'h2ac359aacdcf088b403f54436096bef1b7645afe7;
    stim[4] = 162'h3ec07993ecef6e8908972532db610e288ea99a9a8;
    stim[5] = 162'h3ce6c919bf3ab346d2aafe9a850a62a8fa078f94d;
    stim[6] = 162'h3921d85df24d9279093bdb964336c671c777b4174;
    stim[7] = 162'h227eb134de10f8f3f92dd2f44e9199d277f68b5e8;
    stim[8] = 162'h3472d7dc54f5b953cd4ffccb12532833fc9472edc;
    stim[9] = 162'h2a1488b9c24f11100ebd75a2d98d4e06651270df3;
    stim[10] = 162'h20af4acd75c65dc42d1c129888ff323577b66637e;
    stim[11] = 162'h250084c985e59a6c12e490dff8974de257e8079f4;
    stim[12] = 162'h3c790e15cbb47cd949dfc670cd7ef99abcc13e5b2;
    stim[13] = 162'h3d4964127f091237dc5de30c942b02fb7bfbc8251;
    stim[14] = 162'h2d93a7250ce9f023d0627b96c07b3b89b138f2beb;
    stim[15] = 162'h22571cd5fbe670e3dbd7b882d9a28d9ededd6673e;
    stim[16] = 162'h2485156f4179d06040b4577972372cb46361e5da8;
    stim[17] = 162'h2a7cb2c49aa2925a44f0b849dbfb461e991b48f85;
    stim[18] = 162'h2b3b8a8c910975a046ed83e1174add21fec4fab19;
    stim[19] = 162'h3125e88b3b7b7c4b9bc2d7252a7fa0b012550a48e;
    stim[20] = 162'h3324bd8a0d1a01cccbe81aec193aab548fb0f06d4;
    stim[21] = 162'h3470d3898a80ec60d5018df2301cd1dcfdf2f3252;
    stim[22] = 162'h37a07c27064b6fc9440cd740f6f0689335e88bfe8;
    stim[23] = 162'h36b4d38a465c185becf585b6f8a95caaa2209f655;
    stim[24] = 162'h3593c17fcbf4bd60af5cbd7c2cf6e0593198c5aa6;
    stim[25] = 162'h285d8e48bc9a697c0468459939f3d833e5d337a8a;
    stim[26] = 162'h35e9b4726e923e6b4656220b638a85422414d21e0;
    stim[27] = 162'h3f5fc16b4879bd3d31155f3ca5ea57af3cdd212ac;
    stim[28] = 162'h3112d5beefa88f8ede5b55b61a8898519263be8cb;
    stim[29] = 162'h22f9e839c31ab742b5cb3e99cbeb750fc898472ec;
    stim[30] = 162'h22ffff947070ede60745f6ac0014575df95effc50;
    stim[31] = 162'h3ceb0a9c70f7538315dec710bc49d4e470066cc20;
    stim[32] = 162'h3248ffe8d988033dae3d70a3741b82849f8d0c408;
    stim[33] = 162'h3aef5b3c46008a192e57b08e90220efebcbfae694;
    stim[34] = 162'h328162c37675f26c06f9a273e275701180294feb4;
    stim[35] = 162'h3cfcb03bee019a0f49683eb0c10d9b6019864c7a3;
    stim[36] = 162'h292176b3968942a563bb768fb410c57d1b1aa60d0;
    stim[37] = 162'h3756fb875fcb5e578eee9cfa867ff593200db8e01;
    stim[38] = 162'h275e0db199e56e66b44b36c9876e824f24830d880;
    stim[39] = 162'h286d62e12b272634189da4a84ec5afa2eb88a8b16;
    stim[40] = 162'h2507f36b54d2ea257b40f06faa2ef40ba9d275bd5;
    stim[41] = 162'h3a3983dd3c3ffee89ad6a5c0f962c354b5c9ee751;
    stim[42] = 162'h2aa1d2cfd2dc736d0b7556e9833a324a90eca855c;
    stim[43] = 162'h219339bff07415bd4ba30c32dd33b1693551e8948;
    stim[44] = 162'h387117c7b335d7d1117c06b8afd7625d11b184eb7;
    stim[45] = 162'h2c3a5c3c4ee0ca1f018de10d59fa99de6894388a0;
    stim[46] = 162'h244c45ad26373dd3e2d4b63970d81b03e99d23137;
    stim[47] = 162'h386aa4b9fa8ba5a354322e7265454ad6856b12bd8;
    stim[48] = 162'h205b3411c0506698d541c79606ec6073e55ce9592;
    stim[49] = 162'h3e499ea862a8db58faa83088aef91d8f6514f0735;
    stim[50] = 162'h211a99cb4b03fb0eade5ba25a5fb9457d0a2feb70;
    stim[51] = 162'h242052119af0748eae55202b9f27f6049ae847a1f;
    stim[52] = 162'h2efbc027e16eef1bccf71c5f4e4d22b73bc645da4;
    stim[53] = 162'h070ac0cd435db927a67d457ca7e0c0c2b1a2f52a8;
    stim[54] = 162'h23c87a69b08854ff27fc0925d2e5fe3ed2fc8d3ad;
    stim[55] = 162'h36b9d62c211fb88ad3796ba0c650adceb087a120e;
    stim[56] = 162'h3c64330284f7ef5cff6ebb96d4067aa628c89f792;
    stim[57] = 162'h355de76d4f32b4b663faaed64ed239a97ecfcea50;
    stim[58] = 162'h26c8855d77cb50d381743efd29c3829a17bcdd4ac;
    stim[59] = 162'h2dd7e76330cfb3a28c699c181bb9700de26bb27fa;
    stim[60] = 162'h3c692acc49483f4d7b146a8a6756edbb38823815b;
    stim[61] = 162'h3b5bc996828fec54e7e083db33fbba601fe2844ba;
    stim[62] = 162'h3abd47f9833a27a8ec07e3f2fd8c4a72909b0ea53;
    stim[63] = 162'h3a67ccfa4951fed9bb55c44ede38aeb419f5986fd;
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
      expv[0] = 69'h108200100000000000;
      expv[1] = 69'h1c8201100000000000;
      expv[2] = 69'h1c8201100000000000;
      expv[3] = 69'h118200100000000000;
      expv[4] = 69'h190201100000000000;
      expv[5] = 69'h19a4014b0800000004;
      expv[6] = 69'h131201140000000000;
      expv[7] = 69'h139200140000000001;
      expv[8] = 69'h139201140000000003;
      expv[9] = 69'h139200140000000001;
      expv[10] = 69'h19a6041408b4704a64;
      expv[11] = 69'h131200140000000000;
      expv[12] = 69'h139201140000000003;
      expv[13] = 69'h139201140000000003;
      expv[14] = 69'h19a608140ce9c9433c;
      expv[15] = 69'h139200140000000002;
      expv[16] = 69'h139200140000000001;
      expv[17] = 69'h139201140000000002;
      expv[18] = 69'h19a62c140800000004;
      expv[19] = 69'h131201140000000000;
      expv[20] = 69'h139201140000000002;
      expv[21] = 69'h139201140000000003;
      expv[22] = 69'h139201140000000001;
      expv[23] = 69'h139201140000000001;
      expv[24] = 69'h19a608140cf05ff2fc;
      expv[25] = 69'h139200140000000001;
      expv[26] = 69'h139201140000000001;
      expv[27] = 69'h139201140000000003;
      expv[28] = 69'h131201140000000000;
      expv[29] = 69'h19a608140e7a0e70c4;
      expv[30] = 69'h139201140000000003;
      expv[31] = 69'h139201140000000001;
      expv[32] = 69'h139201140000000002;
      expv[33] = 69'h139201140000000003;
      expv[34] = 69'h131201140000000000;
      expv[35] = 69'h139201140000000002;
      expv[36] = 69'h19a604140d8eedda3c;
      expv[37] = 69'h139201140000000001;
      expv[38] = 69'h19a608140f836c667c;
      expv[39] = 69'h139201140000000003;
      expv[40] = 69'h139200140000000003;
      expv[41] = 69'h19a620140800000004;
      expv[42] = 69'h131201140000000000;
      expv[43] = 69'h139200140000000001;
      expv[44] = 69'h131201140000000000;
      expv[45] = 69'h19a604140c06378444;
      expv[46] = 69'h139200140000000003;
      expv[47] = 69'h19a62c140800000004;
      expv[48] = 69'h139200140000000001;
      expv[49] = 69'h139201140000000001;
      expv[50] = 69'h19a608140ea672d2c4;
      expv[51] = 69'h139201140000000002;
      expv[52] = 69'h19a620140800000004;
      expv[53] = 69'h1c8200100000000000;
      expv[54] = 69'h108200100000000000;
      expv[55] = 69'h118201100000000000;
      expv[56] = 69'h110201100000000000;
      expv[57] = 69'h1da4013b0800000004;
      expv[58] = 69'h131200140000000000;
      expv[59] = 69'h139200140000000001;
      expv[60] = 69'h139201140000000003;
      expv[61] = 69'h19a60814080003fb14;
      expv[62] = 69'h131201140000000000;
      expv[63] = 69'h19a608140800047fb4;
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
