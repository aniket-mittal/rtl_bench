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
    stim[0] = 156'h67a60ccab63ac85d5ba62332ed105dc819d9bb3;
    stim[1] = 156'h55a9eee96a67c7670bc2c6f4cb3b6b6262a840e;
    stim[2] = 156'hfadb6533a98e3af95268d51feaa718ca36f1bbe;
    stim[3] = 156'hc2c89cd7b67ac5a3a8f3ccd07836c5c5f7978c5;
    stim[4] = 156'hdd9594e964cc4d86f64e68b7f451d0968ba3665;
    stim[5] = 156'hc0e2dc7a617dfd81e546050c0584339e7b0fd86;
    stim[6] = 156'hcfbdaff1468a84bbcfd7c5cace2a93bb1e85af1;
    stim[7] = 156'h89c9eb836103f36736c5f5dc1e67b2b501d2a0d;
    stim[8] = 156'hfb1c3c1e7f1307bffbcfd30867b11d2bfb492c4;
    stim[9] = 156'hc783b7fd0393f59441c390c3102d99fe6c59618;
    stim[10] = 156'hb2c361ffb0cc6fdf212afb627d95efde550b3ed;
    stim[11] = 156'h9b489aaab74b4e08d25ff7189a19b6f9c539b89;
    stim[12] = 156'he05a25ea61bc6eaf0b94b9ac6de698c7e18b956;
    stim[13] = 156'hd872f11aee559cd37076e896915c12d9592b20f;
    stim[14] = 156'hfb8c0e212ee032a25e13f4a9e6d6c907d7cab93;
    stim[15] = 156'h89f17c0563180ca6f06402c8f5b1ba57d983e98;
    stim[16] = 156'h9a0aedfd42585bdbaaa759a38a70b291dee5bdb;
    stim[17] = 156'hcf286c9033d872eaaadbfe393a04cb6cfed1707;
    stim[18] = 156'hf794453577adfaf83de9c831fb15d6215dc12e3;
    stim[19] = 156'hd3e6219e8fcf493722aa1af47ca3697d87df33b;
    stim[20] = 156'ha8dbef30db5e252c3443c1ff4ceb2771c40106b;
    stim[21] = 156'hb0f98954ad7a55781b072abb6112beeaa838e4b;
    stim[22] = 156'hc23fadd1afc0a84fa70da98ea79935fb6bbc5e9;
    stim[23] = 156'hf7482dc2f8aee5cab9175deeb347f7839c7605e;
    stim[24] = 156'h99f8b976d02b2dd9e98247a826451dbb1191c70;
    stim[25] = 156'h864ebf6363279774f96e18ea650a68e0413a234;
    stim[26] = 156'hbf757da830c6bc46f94a508d33696404f30c94d;
    stim[27] = 156'hd08205952edaac6c2dab9b654a270c842c771e4;
    stim[28] = 156'hc2369f8fa5cfeb9c7e39c2092a6d49428480f49;
    stim[29] = 156'ha552cd94a0403f7c298e981ef268215059f8cc4;
    stim[30] = 156'hf7c45c9af84dc781f2dabeba2eba0c76da0fab8;
    stim[31] = 156'hbabfefe05a3245ef04f0f837eb7306e0d1b52ff;
    stim[32] = 156'hbe6911e63de387243173666acfeb92949fd3735;
    stim[33] = 156'hcb976acd701e4168b01a2e6109c7011089459a7;
    stim[34] = 156'h86a63b1de469b9eac76df08e3c9ad4fae0482cb;
    stim[35] = 156'ha5933733af93a601216ca2950693096c67686e9;
    stim[36] = 156'hd0a4e9c3cd8b6f9ba6386005203fd9d0820cb8f;
    stim[37] = 156'hd2cefbc9d692a734dc84aa0ffd3e99ae464f33e;
    stim[38] = 156'h8872a12fbfd1b234c3b0c352445bd2f50bb3c60;
    stim[39] = 156'hf4713c265cf1f3cdca727fe3b1b4b98f5b6d1f3;
    stim[40] = 156'h710ddf1ef6af8f0c80d2bd25dce025c9ff6d92b;
    stim[41] = 156'h936a1eda0a2927317c8ceaf48d2e50156c17c31;
    stim[42] = 156'h97be1c5f078d162e8facf9d72abdf6c5a5769eb;
    stim[43] = 156'hfcee50262d5a2131964f0c0cdd09b543617bc3b;
    stim[44] = 156'hafd67924f694b4d9f912c123d89ebee4f694c5c;
    stim[45] = 156'h868a7737b8fb2e389088356f0900011a4cea695;
    stim[46] = 156'hbdf2b8c0d0d7b2b08676a137f32c06b47ea29bd;
    stim[47] = 156'hc3db070b45a4a8aa8d77c4ab7e7e51f9fcfccd5;
    stim[48] = 156'he55f85f71998b37d6ea4d78d00a9b8539f45542;
    stim[49] = 156'hf69fef365e57e396b4e410bf457f0d72d685e6a;
    stim[50] = 156'h97ece5e637031bdf51080302ee8bad133429334;
    stim[51] = 156'hd20071943b7d9e041fcad2982968f91f6a6e054;
    stim[52] = 156'hbbb9ec78d7bae398a83ea40aba823de44147e9f;
    stim[53] = 156'ha79daef80146ca61070ade053a0fc45d2154bbe;
    stim[54] = 156'hb54af3daccfe4074462a04919564f8c6c35f648;
    stim[55] = 156'h8abfc5f8dc166be8180de210751a7f584b63803;
    stim[56] = 156'hb4d6031a1162b7d82fc85ccb5d15c2ee8e46acf;
    stim[57] = 156'haf69f5d423d66e7d5e1174f36d4c91f44c7f11d;
    stim[58] = 156'h8f8213e58676d814c6e97287f136a675d17b3bd;
    stim[59] = 156'hc96d1782c793129f9617597cf501e65724a1412;
    stim[60] = 156'hf6ae1e54642645dceecbcd2442176ef227c2d57;
    stim[61] = 156'hc83fe49dcbe5e58f43f9fc30f1d895bbb3d7c4d;
    stim[62] = 156'hd8a4a1df7d8c97452a46d220d24260057c0bb6b;
    stim[63] = 156'hc7e7b332d55a3b276347a1f4cf1fee63d79b0a5;
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
      expv[5] = 60'h882010000000000;
      expv[6] = 60'h882010000000000;
      expv[7] = 60'h882010000000000;
      expv[8] = 60'had0391619ec4748;
      expv[9] = 60'h882010000000000;
      expv[10] = 60'h882010000000000;
      expv[11] = 60'had0111489aaab74;
      expv[12] = 60'h882010000000000;
      expv[13] = 60'had00914dc1dba24;
      expv[14] = 60'h882010000000000;
      expv[15] = 60'h882010000000000;
      expv[16] = 60'had03914e29c2ca4;
      expv[17] = 60'h882010000000000;
      expv[18] = 60'h882010000000000;
      expv[19] = 60'h882010000000000;
      expv[20] = 60'ha903917d33ac9dc;
      expv[21] = 60'h8d403a400000000;
      expv[22] = 60'h882014000000000;
      expv[23] = 60'h882014000000000;
      expv[24] = 60'had609567a6091e8;
      expv[25] = 60'h882014000000000;
      expv[26] = 60'had6595400000000;
      expv[27] = 60'h882014000000000;
      expv[28] = 60'h882014000000000;
      expv[29] = 60'h882014000000000;
      expv[30] = 60'had6115445c9af84;
      expv[31] = 60'h882014000000000;
      expv[32] = 60'h882014000000000;
      expv[33] = 60'had611540001e414;
      expv[34] = 60'h882014000000000;
      expv[35] = 60'h882014000000000;
      expv[36] = 60'h882014000000000;
      expv[37] = 60'h882014000000000;
      expv[38] = 60'had6095530ec30d4;
      expv[39] = 60'h882014000000000;
      expv[40] = 60'h842010000000000;
      expv[41] = 60'h842010000000000;
      expv[42] = 60'h842010000000000;
      expv[43] = 60'h842010000000000;
      expv[44] = 60'h8c2010000000000;
      expv[45] = 60'he82010000000000;
      expv[46] = 60'h8d3f92400000000;
      expv[47] = 60'h882010000000000;
      expv[48] = 60'had009175ba935e0;
      expv[49] = 60'h882010000000000;
      expv[50] = 60'h882010000000000;
      expv[51] = 60'had01114071943b4;
      expv[52] = 60'h882010000000000;
      expv[53] = 60'h882010000000000;
      expv[54] = 60'h882010000000000;
      expv[55] = 60'had01114000166bc;
      expv[56] = 60'h882010000000000;
      expv[57] = 60'had0091757845d3c;
      expv[58] = 60'h882010000000000;
      expv[59] = 60'h882010000000000;
      expv[60] = 60'had039151085dbbc;
      expv[61] = 60'h882010000000000;
      expv[62] = 60'h882010000000000;
      expv[63] = 60'h882010000000000;
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
