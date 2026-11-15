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
    stim[0] = 156'h607e9bbb1b3f05c795340eb0b3dfacf995f22ad;
    stim[1] = 156'h104983d05a8bcca522eed4feb6f1999c316f255;
    stim[2] = 156'he3d439807c73d4ca4de40d6a8febe1d1f752762;
    stim[3] = 156'had0cc7ee5208a75f71f513407aec5ba0d2cc30a;
    stim[4] = 156'h95a4fce84bcc2d2cabcaeb7e3926640c7344656;
    stim[5] = 156'hd7f9074f7cd61f1ba1b6a36e4445a199a456dd5;
    stim[6] = 156'ha4ef1b92e99fdc1977ef218a523bf31d7549637;
    stim[7] = 156'ha91840c047a2fc18e8aaeedc8a0557312efc398;
    stim[8] = 156'hd5fb7c14a61e350c6d9c806d0f8a680b9d696f5;
    stim[9] = 156'hf98f419fe26f41f8a8da80bfd82d9868f7a7c57;
    stim[10] = 156'hc15e99d9bb3aa2ebc3a936b72a3dfddbe2e05f4;
    stim[11] = 156'hf5faac56926ff20f1c9d1f2c1e8fbc986cd3900;
    stim[12] = 156'hed5858c77f5b08a1d870f64e10129e4671e7aa2;
    stim[13] = 156'h92258470fd031201c0cb7e5645835f9587dbaea;
    stim[14] = 156'hfac044a2b30db54be3688b29879e26692f9b899;
    stim[15] = 156'hc063dfc36dfe1057140a0aa86eaf638e30b8b6d;
    stim[16] = 156'hedec263e0cf7c175a2f6c4a10ba3934d8ffb9f0;
    stim[17] = 156'hf94557f0f47f9b4ac82dae56c694f33ad50fdc2;
    stim[18] = 156'hdb43f744b79bc8f7b0ee0422c69c524ee983311;
    stim[19] = 156'he7497b9d28714e4c65d01a892bc81b2470a3c79;
    stim[20] = 156'hcb0092b8e2264834238a676e3bcd2cd1646f02f;
    stim[21] = 156'he0a2d183b7ca510f8d13ef460514c7f85f9fe7b;
    stim[22] = 156'he65241fae393c599112d3352278f8adf25c0ae7;
    stim[23] = 156'hf33047fc9b3927b2fa5f07d84830222e614ef59;
    stim[24] = 156'hd47260a37bd6ff03eb192a53924a83d4f83e8b5;
    stim[25] = 156'had79a848ef321e245aa3d8ac7e818ca6cdd347b;
    stim[26] = 156'hdea18306f4e1029ccdc5f23dc9eb451f5013309;
    stim[27] = 156'h914ce60d90748b47ac6b552e6e0a27bb5ed2d18;
    stim[28] = 156'hfd7687750b19a5ec0d7334b7bfbf4719ff3bfbb;
    stim[29] = 156'ha2cc877b796001aae4f200962a3443275190f63;
    stim[30] = 156'hfb2e3e37a0cf3e432098125d0962b1246f9c8c7;
    stim[31] = 156'hb4f6c3f868b97f9fb544088d3812036d9fc1ee2;
    stim[32] = 156'hab54d7e33d4c6ac740a5c306f8f294ad523e4e2;
    stim[33] = 156'hc59191ced554dd14c5b970683edb1c821c6a5d3;
    stim[34] = 156'ha4bcec99a9fd37a1c3e37e7407bd0983979a10c;
    stim[35] = 156'hab291e1865883a5c9c88990331a69b43ace50ea;
    stim[36] = 156'heb0482203e9d3daa869facbf7fafab03609470a;
    stim[37] = 156'h84f2cd41b7a3ceb7f6be063979bcb9c8ec93fd3;
    stim[38] = 156'hdbc4ac6c2cf12fddeb4f590aa5668bff25e5dc8;
    stim[39] = 156'hb238a4420a7e7162890ddbf9285bb3097b97c6d;
    stim[40] = 156'hd06ec96cbe19e7b4a4732588ad6fb8004f7e025;
    stim[41] = 156'hcbf1dfbfccb51c51bae3eb98e691fc6a5b4108d;
    stim[42] = 156'hcc9f94ddb64e72f2b0054eac061a6992238db31;
    stim[43] = 156'hc5d32b40ab8a8c70f76f318ff308b1100d8c049;
    stim[44] = 156'hd199d6a7de0d461762510db72a0ae24444376c1;
    stim[45] = 156'h9750a4afad6a55dc6ff9d6136eb059f037349d9;
    stim[46] = 156'hafd8788e5b6510b86605062a6c462ba5d84c128;
    stim[47] = 156'hcf939959ecd84e058948df29fcc4c8210d62655;
    stim[48] = 156'h92664604d0f754a6c4f8ed018a177a6660cc3f3;
    stim[49] = 156'he947eeb4188813c03d410daa3411956bebdefc1;
    stim[50] = 156'ha53e63b5af674f9cb422ce5333312cbcfdd0754;
    stim[51] = 156'hf11e395aad21415cd297cae2f2a00515757a5ea;
    stim[52] = 156'hafc090f6b2190e590cd7797a0484bfb87566658;
    stim[53] = 156'he08bc135b329a4d7fa7fb796ae83c967d2bb3cb;
    stim[54] = 156'ha5f6732b0a0476f082b781b2448b85f27611e87;
    stim[55] = 156'he4a5c527b11d9e50fa0589d0f8000ed1c828c6a;
    stim[56] = 156'hb05ed4e175d3e33af673ad3d8f795f95fa1afa6;
    stim[57] = 156'hb491730b654f7a381583dd6c2a8175cfd6678e2;
    stim[58] = 156'h90b33d38fb30fc51218e4bbf59a75e3b5263a80;
    stim[59] = 156'hdfd5c98a4bab2e6cd3cc421eacc149e32c29358;
    stim[60] = 156'hfed3c91d97f742dee506a027866028dc69723c0;
    stim[61] = 156'ha24a0d4e4b6a768e797d2735628bde739571bbb;
    stim[62] = 156'hd9ecdad3f5d92f0c2c51001b631afc0f3a05d37;
    stim[63] = 156'he0c669bb6b82ef568353617132d8384f5c021eb;
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
      expv[6] = 60'h8ca014000000002;
      expv[7] = 60'h882014000000000;
      expv[8] = 60'h8ca014000000003;
      expv[9] = 60'h882014000000000;
      expv[10] = 60'h8ca014000000003;
      expv[11] = 60'ha82014000000000;
      expv[12] = 60'had611540001b088;
      expv[13] = 60'h882014000000000;
      expv[14] = 60'h8ca014000000002;
      expv[15] = 60'h8ca014000000001;
      expv[16] = 60'hbca014000000002;
      expv[17] = 60'h8ca014000000001;
      expv[18] = 60'h8ca014000000001;
      expv[19] = 60'ha82014000000000;
      expv[20] = 60'had6095508e299d8;
      expv[21] = 60'h882014000000000;
      expv[22] = 60'h8ca014000000003;
      expv[23] = 60'h882014000000000;
      expv[24] = 60'ha82014000000000;
      expv[25] = 60'had61154000321e0;
      expv[26] = 60'h882014000000000;
      expv[27] = 60'h8ca014000000003;
      expv[28] = 60'h8ca014000000002;
      expv[29] = 60'h8ca014000000003;
      expv[30] = 60'h882014000000000;
      expv[31] = 60'h8ca014000000002;
      expv[32] = 60'h8ca014000000002;
      expv[33] = 60'h882014000000000;
      expv[34] = 60'h882014000000000;
      expv[35] = 60'h882014000000000;
      expv[36] = 60'h882014000000000;
      expv[37] = 60'ha82014000000000;
      expv[38] = 60'had609577ad3d640;
      expv[39] = 60'h882014000000000;
      expv[40] = 60'ha82014000000000;
      expv[41] = 60'had609546eb8fae4;
      expv[42] = 60'h882014000000000;
      expv[43] = 60'ha82014000000000;
      expv[44] = 60'had60955d894436c;
      expv[45] = 60'ha82014000000000;
      expv[46] = 60'had6095619814188;
      expv[47] = 60'h882014000000000;
      expv[48] = 60'h8ca014000000001;
      expv[49] = 60'h8ca014000000003;
      expv[50] = 60'h882014000000000;
      expv[51] = 60'h882014000000000;
      expv[52] = 60'ha82014000000000;
      expv[53] = 60'had60955fe9fede4;
      expv[54] = 60'h8ca014000000001;
      expv[55] = 60'h882014000000000;
      expv[56] = 60'h8ca014000000002;
      expv[57] = 60'h882014000000000;
      expv[58] = 60'hb82014000000000;
      expv[59] = 60'h8ca014000000003;
      expv[60] = 60'ha82014000000000;
      expv[61] = 60'had61154a0d4e4b4;
      expv[62] = 60'h8ca014000000003;
      expv[63] = 60'h8ca014000000003;
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
