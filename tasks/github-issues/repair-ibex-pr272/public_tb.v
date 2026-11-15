// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 156;
  localparam OW = 59;
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
    .ctrl_busy_o(out_vec[58:58]),
    .first_fetch_o(out_vec[57:57]),
    .instr_valid_clear_o(out_vec[56:56]),
    .id_in_ready_o(out_vec[55:55]),
    .instr_req_o(out_vec[54:54]),
    .pc_set_o(out_vec[53:53]),
    .pc_mux_o(out_vec[52:50]),
    .exc_pc_mux_o(out_vec[49:48]),
    .exc_cause_o(out_vec[47:42]),
    .debug_cause_o(out_vec[41:39]),
    .debug_csr_save_o(out_vec[38:38]),
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
    stim[0] = 156'h7b00d161bcd9d111b78d3a4a61d7cc1e5f01217;
    stim[1] = 156'h203950625bc5ce715fd7fdb68c7ac9b6cda66da;
    stim[2] = 156'hb21d52a8847bb76e6a8b2fbe371b5dad45970be;
    stim[3] = 156'hf01c3c2d8cbfd7d5213f1cf512e81115c54869e;
    stim[4] = 156'he67d01b8e4c89d6580b8717c3512b338e3affe7;
    stim[5] = 156'h9b5b145746943ea60ab57190d23312660039081;
    stim[6] = 156'ha678be59e41120da725a7fc7c51681c0a7db908;
    stim[7] = 156'hce15d1a999bc3d888a21cd1d9462e5b30382973;
    stim[8] = 156'hde7ed3b4889d0b64b1dec39db8b13a0426ab978;
    stim[9] = 156'ha3efe3dcc488bf5120d563556713e3a3a20cc17;
    stim[10] = 156'hc61fb85248e249ff027fc97d81d568e6e426d68;
    stim[11] = 156'hffba5995474be840f866b65c9c855272a57fdaf;
    stim[12] = 156'h99e9e9d9bafd3464e58fde31409f742dc5f5d66;
    stim[13] = 156'hd38f57b07f377c1e4f1e507364b943203e626f5;
    stim[14] = 156'ha42c1f187c08c84209cad86c3d44a53c2f9c6a6;
    stim[15] = 156'hd2a7294eeace4a53fd88ab896500623c04890e6;
    stim[16] = 156'hff727699f9d8bf0e319546424480a68869f0443;
    stim[17] = 156'hbc12adb7c1f9d6ca6d576f829a7f0371e2a252a;
    stim[18] = 156'hff4abc6fb90c20646a22203455de45abe1d7da7;
    stim[19] = 156'hc5346bce33d8f7af9e4beb08beb8e56425a8e68;
    stim[20] = 156'h936910dbda014fdf482650bab8441cadd68b5fd;
    stim[21] = 156'h989c83fb7664d84312da454f52774e470fb01e8;
    stim[22] = 156'heda2ce1e273609ba8d277dc56293d70d79a87a9;
    stim[23] = 156'hca12a75611920d81eb9393cf790e09494f494b6;
    stim[24] = 156'hc6573ecfec80a46d2cf1bc16cd347193502bf49;
    stim[25] = 156'hd02966e074dab7734ae80a968c7f27327c1a585;
    stim[26] = 156'hfdcfed71df1f0bc04a455b1fce44f313fe5d975;
    stim[27] = 156'h9a2baa7e0ed15d16a824bb3fe5579d79d7386cd;
    stim[28] = 156'hb8ca3667eb0c88e6aa7c03e1c07f85b2e636379;
    stim[29] = 156'h82cd0bcf09132373bf7039ca7a14fdb4df9f084;
    stim[30] = 156'hfa9e388d64a5c76fa1efc60305604f5dd2456e1;
    stim[31] = 156'hdb85e60efe61fab87a6ae0fe72852c60d1daa0b;
    stim[32] = 156'hdc687da7b2c711b1420ab9361395ba1bc8f1767;
    stim[33] = 156'h819129be5144a808125f3259795d136b0d6bbc3;
    stim[34] = 156'hea4bf669432d3aa86087db404dd7110084bac7a;
    stim[35] = 156'hc3802791d18f4f37ef8c6d8ec194727dd442ca3;
    stim[36] = 156'hc6dd7e16d14be26cd2734e91c46bcec00aba9b8;
    stim[37] = 156'ha1609ec00053732272d6d724e54b324f0716b62;
    stim[38] = 156'h85d0a10f4176f5d7d3d7ea1942dd0a1bef67327;
    stim[39] = 156'hb0ac9d0e73c6fff4e419e2ab05664ebc5e14627;
    stim[40] = 156'h860e541b5f4595cdf3be0abfa0a18ca3236d635;
    stim[41] = 156'ha28142e56568a1146eaa982426f0d1dfdb6d5a7;
    stim[42] = 156'he1babf2a67aaa14a81fdec9723ef1f6e4e4f9eb;
    stim[43] = 156'hb94e1f4e26bfdfc796d3f08d9de9c45cd081ea2;
    stim[44] = 156'hadb62a0ad277b10bcb11f2316a02f7d6e88c63e;
    stim[45] = 156'he29d28b9737b851907753b4651ff319a4104e6f;
    stim[46] = 156'hecff46316202f9a2025fa44e5603f190b5c7d7f;
    stim[47] = 156'hb6bfd5d35f28bf56516b99cd4e699945505e150;
    stim[48] = 156'hb8bc112d1ec32b235bac0e84eccaa0acf2d2872;
    stim[49] = 156'he969e9e41bc23f0c36880cb59fe61bb941498a6;
    stim[50] = 156'ha41b8fce63a2b938482f5d1db3af6b3785accdc;
    stim[51] = 156'hef0063bb2955972b9a0a929f7ea4ab85a5e7b41;
    stim[52] = 156'ha2895925f56f09c16a79331e1248be18043be4a;
    stim[53] = 156'hb5d2e537779e0f246760ea9951bd06aca79145b;
    stim[54] = 156'hac18c255fe20a7f1a153143ea22e5a4d0cd8999;
    stim[55] = 156'h92389726d22eecac7fee3134b2f0aacf9aa62b7;
    stim[56] = 156'ha4df6883be92514991c6163b1681187a1e4ed41;
    stim[57] = 156'hf54accf5ae611dced87ec41ec142c81492fd736;
    stim[58] = 156'hc6b7ae2bebc05c6c45aef658b296f1d6de535ca;
    stim[59] = 156'hb6de9cda31f563508878439d80d00c1e55da4de;
    stim[60] = 156'h948c9fce4af6eca7f29f1e3697bcae1267205dd;
    stim[61] = 156'hb3764834ad76e8517a8fc62ec76563ae9c588eb;
    stim[62] = 156'hfc2b5a3e50805dfe4f050d211815f28501d5455;
    stim[63] = 156'h9a879f3093774ca1a6479ab47079a8af1d6e694;
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
      expv[0] = 59'h421008000000000;
      expv[1] = 59'h421008000000000;
      expv[2] = 59'h421008000000000;
      expv[3] = 59'h421008000000000;
      expv[4] = 59'h461008000000000;
      expv[5] = 59'h741008000000000;
      expv[6] = 59'h469b4a400000000;
      expv[7] = 59'h441008000000000;
      expv[8] = 59'h541008000000000;
      expv[9] = 59'h5680494483558d4;
      expv[10] = 59'h441008000000000;
      expv[11] = 59'h441008000000000;
      expv[12] = 59'h465008000000002;
      expv[13] = 59'h441008000000000;
      expv[14] = 59'h441008000000000;
      expv[15] = 59'h441008000000000;
      expv[16] = 59'h541008000000000;
      expv[17] = 59'h54808952adb7c1c;
      expv[18] = 59'h46a026400000000;
      expv[19] = 59'h441008000000000;
      expv[20] = 59'h465008000000002;
      expv[21] = 59'h441008000000000;
      expv[22] = 59'h441008000000000;
      expv[23] = 59'h441008000000000;
      expv[24] = 59'h465008000000003;
      expv[25] = 59'h441008000000000;
      expv[26] = 59'h465008000000003;
      expv[27] = 59'h441008000000000;
      expv[28] = 59'h465008000000001;
      expv[29] = 59'h541008000000000;
      expv[30] = 59'h56b089400025c74;
      expv[31] = 59'h441008000000000;
      expv[32] = 59'h465008000000003;
      expv[33] = 59'h441008000000000;
      expv[34] = 59'h541008000000000;
      expv[35] = 59'h56b0495fbe31b60;
      expv[36] = 59'h541008000000000;
      expv[37] = 59'h56b089400013730;
      expv[38] = 59'h465008000000003;
      expv[39] = 59'h441008000000000;
      expv[40] = 59'h441008000000000;
      expv[41] = 59'h441008000000000;
      expv[42] = 59'h441008000000000;
      expv[43] = 59'h541008000000000;
      expv[44] = 59'h56b089762a0ad24;
      expv[45] = 59'h441008000000000;
      expv[46] = 59'h541008000000000;
      expv[47] = 59'h56b0495945ae670;
      expv[48] = 59'h441008000000000;
      expv[49] = 59'h465008000000002;
      expv[50] = 59'h441008000000000;
      expv[51] = 59'h441008000000000;
      expv[52] = 59'h441008000000000;
      expv[53] = 59'h541008000000000;
      expv[54] = 59'h56b04946854c50c;
      expv[55] = 59'h441008000000000;
      expv[56] = 59'h465008000000001;
      expv[57] = 59'h541008000000000;
      expv[58] = 59'h56b1c962ca5bc74;
      expv[59] = 59'h465008000000001;
      expv[60] = 59'h441008000000000;
      expv[61] = 59'h465008000000001;
      expv[62] = 59'h441008000000000;
      expv[63] = 59'h441008000000000;
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
