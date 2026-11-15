// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 162;
  localparam OW = 68;
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
    .ctrl_busy_o(out_vec[67:67]),
    .instr_valid_clear_o(out_vec[66:66]),
    .id_in_ready_o(out_vec[65:65]),
    .controller_run_o(out_vec[64:64]),
    .instr_req_o(out_vec[63:63]),
    .pc_set_o(out_vec[62:62]),
    .pc_mux_o(out_vec[61:59]),
    .nt_branch_mispredict_o(out_vec[58:58]),
    .exc_pc_mux_o(out_vec[57:56]),
    .exc_cause_o(out_vec[55:49]),
    .wb_exception_o(out_vec[48:48]),
    .id_exception_o(out_vec[47:47]),
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
    stim[0] = 162'h08f66256b5cb14a3e4023d37bb4a67e9711b0c680;
    stim[1] = 162'h07236e795bf46fdf2391224995d5c5ebe201e749d;
    stim[2] = 162'h3091677b813e762a91db9e562097cf766be4b7cab;
    stim[3] = 162'h22398640e524321625cbb43f4fde25377770b99ea;
    stim[4] = 162'h31ef916021e633d9385e083999e3ec003bf3ccf9b;
    stim[5] = 162'h33bd3d95bd2da1a5dc68ddcdd6bcb04b31c209a7e;
    stim[6] = 162'h2b9e3ea9dc2d26afc2a094e2cb9f9c2e260b3f620;
    stim[7] = 162'h38e28bceab6afdd28c01a537f565edfc05b430ce5;
    stim[8] = 162'h2f4629655f209aa0f73a5ecd34c6acc745a4d17cf;
    stim[9] = 162'h2f1cd8338372d7af27369da12cf0a6c08c20fb3f8;
    stim[10] = 162'h33836765e4b80e24e1cb34ac99b62b8573f7dc7b7;
    stim[11] = 162'h22becba2405b20fc75c74a77bb3cc0ddec70b22bd;
    stim[12] = 162'h2e93cf53bb2efcb796803873bbd1ab3257e325c02;
    stim[13] = 162'h2363588df2f161ce467d6e29ec97a7e63c907e60c;
    stim[14] = 162'h24c7121e8bca7dd5e67f58bf3dc49d853ce55409c;
    stim[15] = 162'h2aa096f689f9982f3926682221a54e4db9f3494b1;
    stim[16] = 162'h1af4c0bc8dfcdf5f77a699a7c99a73a232e4d133e;
    stim[17] = 162'h322bef4612794cf788f818bc80a6d5bcdd6d36edf;
    stim[18] = 162'h3f409ae7d93f76ad5e3e1cd2453fb263cbfcdbc20;
    stim[19] = 162'h3f07b5281f1a91d0c908a12f8a3e2d481d1755c02;
    stim[20] = 162'h3801fa37d4295e444c6d75d3db80ee3f2f50d6509;
    stim[21] = 162'h26e8aa5a41798f38f0bf5cfc0f2a09802fa6ab9e7;
    stim[22] = 162'h23e7f2463c6af947c77a99933a9e26ffd2577e383;
    stim[23] = 162'h3e2293f5e122e58e561dfc4971cee5249ac284d50;
    stim[24] = 162'h283fcd3f3e01d10a79987ec5bcccfc7003122b7b2;
    stim[25] = 162'h3def7b036e85767062122815ad6520bd72a48a7b7;
    stim[26] = 162'h3e2e75c63ef98462c9f84392fb57175a3cb5a7a9e;
    stim[27] = 162'h23b82829f5d23934f0232690544b5bc2c2c395af3;
    stim[28] = 162'h3b172cbbf78c9112c1d0f939fda2c5ffd5d01bf34;
    stim[29] = 162'h3f33911ac6b5176cb3927bee122832a01d2695d4c;
    stim[30] = 162'h310f763a9fedd86d2b0962d9acea23bd42ea70b99;
    stim[31] = 162'h2c340d659bb22b528a2ae05e2ef1f15f4264f48df;
    stim[32] = 162'h3c4ea524f7cccfa1abd1b4b74bc16cec26fa772e5;
    stim[33] = 162'h2daf9180dcb70502bcaa52cae98ebbd9c863fae56;
    stim[34] = 162'h2e91b9eef09381da554e02b0d2a35f832bc3b1e11;
    stim[35] = 162'h31ee1d1cb15af8126bdf00ebb3f2001c7933ac7cb;
    stim[36] = 162'h2fdc80434fdd0bf08e339d42bbb876698d0f453e0;
    stim[37] = 162'h345927010a5223f3f7bc0888bcbc474ca408e6226;
    stim[38] = 162'h3f97907a2a2681cd6cf3babb4126137cebfcfe206;
    stim[39] = 162'h27f6e5aa53bafb7f904471cb0e51aee2fdb5ff8a8;
    stim[40] = 162'h24da33d11746c4107d7acdf316622d1fa07e202c0;
    stim[41] = 162'h2a64a2f5b89d70ae9879bb597e724460cfd71f0ef;
    stim[42] = 162'h34addc0e32bafdd3f814b61097d713bc6a73da405;
    stim[43] = 162'h2cca52fe1059af5fded1ae87ef179fcc3468dfb8f;
    stim[44] = 162'h06a892808937f91bda508eacb4e4f514d10269ad6;
    stim[45] = 162'h32100ff2a8c3757eace2480716d58e0e9a3cdac5b;
    stim[46] = 162'h3012ee8a33b0c1c46dcb1f87fb010a864114210b6;
    stim[47] = 162'h2c8e8d06d8a3c49c8d7967f05cd33ced71bdfd5ca;
    stim[48] = 162'h2feb851311390009eb1237777f173b4cd4d35385f;
    stim[49] = 162'h3921d12b25205f80258c8d129e8724f0ecf9c9c8a;
    stim[50] = 162'h218f71b858309cb7a63d77141393b6e90d2fc1b3e;
    stim[51] = 162'h396074e2dd9fa0b9e45526fec5c3bbccf439574e3;
    stim[52] = 162'h39f2e2f833a5761b6ff857689294f3be5935a43db;
    stim[53] = 162'h3bbe98c1782eb8dee9f0ffcfb3573971cdfdc0d61;
    stim[54] = 162'h3b51095a59483e646417d3af979a087810d89d673;
    stim[55] = 162'h34abbfc85513008505da24e8ec1976e243566f95f;
    stim[56] = 162'h28b66687e735a9f88f470839c5b1c278cf2874dac;
    stim[57] = 162'h299682e8a9c0ec28c819bc26cce14582d072b20f2;
    stim[58] = 162'h364b882d1228226a275de09e71bfdc1fe6e2f5b4c;
    stim[59] = 162'h3a922089f48b5581d20154a8ea575925cf25141ef;
    stim[60] = 162'h3837ddd29c4cbb1d07de185f07ffb78587300f322;
    stim[61] = 162'h2edf503a58674bc27f7631a168fcf6175e9066c49;
    stim[62] = 162'h3e7a44dfc79bdeb6eff33f11e7d23c6624f60fca6;
    stim[63] = 162'h3ea12bcd1dbdec07d89979e8041d09c73916f377d;
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
      expv[0] = 68'he4100880000000000;
      expv[1] = 68'h84100880000000000;
      expv[2] = 68'h84100880000000000;
      expv[3] = 68'h8c100880000000000;
      expv[4] = 68'h88100880000000000;
      expv[5] = 68'hcd200950800000004;
      expv[6] = 68'hfc9000a0000000001;
      expv[7] = 68'h989008a0000000000;
      expv[8] = 68'hcd3040a098a5957cc;
      expv[9] = 68'hfc9000a0000000002;
      expv[10] = 68'h9c9008a0000000001;
      expv[11] = 68'hcd3020a09d71d29dc;
      expv[12] = 68'h989000a0000000000;
      expv[13] = 68'h9c9008a0000000003;
      expv[14] = 68'h9c9000a0000000003;
      expv[15] = 68'h9c9008a0000000003;
      expv[16] = 68'h84100880000000000;
      expv[17] = 68'h84100880000000000;
      expv[18] = 68'hec100880000000000;
      expv[19] = 68'h88100880000000000;
      expv[20] = 68'hed17e890800000000;
      expv[21] = 68'h9c900c80000000003;
      expv[22] = 68'hcd002480f1dea665c;
      expv[23] = 68'hed200e50800000004;
      expv[24] = 68'h98900ca0000000000;
      expv[25] = 68'h9c900ca0000000001;
      expv[26] = 68'hcd3044a0b9d718fbc;
      expv[27] = 68'h98900ca0000000000;
      expv[28] = 68'hcd30e4a0ff68b17fc;
      expv[29] = 68'h9c900ca0000000002;
      expv[30] = 68'h98900ca0000000000;
      expv[31] = 68'hcd3044a0800048ad4;
      expv[32] = 68'h9c900ca0000000001;
      expv[33] = 68'hcd3044a0be460372c;
      expv[34] = 68'h9c9004a0000000003;
      expv[35] = 68'h893004a0000000000;
      expv[36] = 68'hed2004a0000000004;
      expv[37] = 68'h9c900ca0000000001;
      expv[38] = 68'h9c900ca0000000003;
      expv[39] = 68'h9c900ca0000000003;
      expv[40] = 68'h9c9004a0000000001;
      expv[41] = 68'h9c900ca0000000002;
      expv[42] = 68'h893004a0000000000;
      expv[43] = 68'hcd2004a0000000004;
      expv[44] = 68'h84100880000000000;
      expv[45] = 68'h84100880000000000;
      expv[46] = 68'h8c100880000000000;
      expv[47] = 68'h88100080000000000;
      expv[48] = 68'h89100880000000000;
      expv[49] = 68'h9c900880000000003;
      expv[50] = 68'h9c900080000000002;
      expv[51] = 68'h9c900880000000001;
      expv[52] = 68'hcd004080800015d84;
      expv[53] = 68'h9c900880000000002;
      expv[54] = 68'hcd004080c42569654;
      expv[55] = 68'hcd200a50800000004;
      expv[56] = 68'h9c9008a0000000002;
      expv[57] = 68'h989000a0000000000;
      expv[58] = 68'h9c9008a0000000001;
      expv[59] = 68'h9c9008a0000000002;
      expv[60] = 68'hcd3020a0c1f78617c;
      expv[61] = 68'h9c9000a0000000002;
      expv[62] = 68'hcd3020a0bbfccfc54;
      expv[63] = 68'h9c9008a0000000003;
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
