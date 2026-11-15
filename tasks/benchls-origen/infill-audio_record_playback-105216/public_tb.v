// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 71;
  localparam OW = 72;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_105216 dut (
    .i_clk(clk),
    .i_rst(in_vec[70:70]),
    .adc_left_data(in_vec[69:54]),
    .adc_left_valid(in_vec[53:53]),
    .adc_right_data(in_vec[52:37]),
    .adc_right_valid(in_vec[36:36]),
    .dac_left_ready(in_vec[35:35]),
    .dac_right_ready(in_vec[34:34]),
    .record_audio_ready(in_vec[33:33]),
    .play_audio_data(in_vec[32:1]),
    .play_audio_valid(in_vec[0:0]),
    .adc_left_ready(out_vec[71:71]),
    .adc_right_ready(out_vec[70:70]),
    .dac_left_data(out_vec[69:54]),
    .dac_left_valid(out_vec[53:53]),
    .dac_right_data(out_vec[52:37]),
    .dac_right_valid(out_vec[36:36]),
    .record_audio_data(out_vec[35:4]),
    .record_audio_valid(out_vec[3:3]),
    .play_audio_ready(out_vec[2:2]),
    .debug_state(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 71'h7c8b3d315819abcd42;
    stim[1] = 71'h7de1a414e86214ec2f;
    stim[2] = 71'h72fbf6c543a90f8dcc;
    stim[3] = 71'h18d41fa0b937459edd;
    stim[4] = 71'h7df60c1dfd15c37f2f;
    stim[5] = 71'h0748a90a8a504428a5;
    stim[6] = 71'h2104b91c0b573791d9;
    stim[7] = 71'h1becb6432b4726d713;
    stim[8] = 71'h1c0cfd3392dd3a02aa;
    stim[9] = 71'h3c552a2ccd591936dc;
    stim[10] = 71'h1aec65472eb4d9c2db;
    stim[11] = 71'h2ecf27072621b834a7;
    stim[12] = 71'h1c73a8be3da4572fdd;
    stim[13] = 71'h201f8b52813f8c6ecb;
    stim[14] = 71'h179ea98d6200690918;
    stim[15] = 71'h2640f3ebe69f47429e;
    stim[16] = 71'h1187220e2a9ce6f5e3;
    stim[17] = 71'h1d011bb7b5367cd517;
    stim[18] = 71'h0532dc6a8f1652f483;
    stim[19] = 71'h33bc006ff39afbbbef;
    stim[20] = 71'h35aabd0c9429b0fecc;
    stim[21] = 71'h1dc91f1ca035320e83;
    stim[22] = 71'h18f4abfd1a9f770645;
    stim[23] = 71'h0deebe8280717394ab;
    stim[24] = 71'h3e884a42f6f68ff032;
    stim[25] = 71'h22a26d982b1d7f1037;
    stim[26] = 71'h3824bae6c043cd8111;
    stim[27] = 71'h0f98c08e024688b019;
    stim[28] = 71'h1a77ec30f8c061523f;
    stim[29] = 71'h18a46eae4bb5504e98;
    stim[30] = 71'h0ca0deb7fee4817fd7;
    stim[31] = 71'h1d8a4f7a0ab9c7899f;
    stim[32] = 71'h0910d7bc02d336eac7;
    stim[33] = 71'h3918294fbc26fe0543;
    stim[34] = 71'h09f0bf61e049a7cb2d;
    stim[35] = 71'h34b6bcbd32e37bddb5;
    stim[36] = 71'h0ad1edbf2af14857dc;
    stim[37] = 71'h27b9c6a5ee920803fa;
    stim[38] = 71'h17c1525adff1eeec2f;
    stim[39] = 71'h1cfd5e6e083be58727;
    stim[40] = 71'h019a1b6dcbdb9f094b;
    stim[41] = 71'h032457ba3e9e0d1812;
    stim[42] = 71'h224dcbf6c43442c41a;
    stim[43] = 71'h06518b5f685d9d926d;
    stim[44] = 71'h250ab0df7a8974024c;
    stim[45] = 71'h348a312a997e58b43c;
    stim[46] = 71'h20288579a91b9b227a;
    stim[47] = 71'h3f6fd6f30667c8bd8d;
    stim[48] = 71'h2bb9b3642984715e04;
    stim[49] = 71'h33d3ffe8bfc007a115;
    stim[50] = 71'h2570ddf1c51e96b4a6;
    stim[51] = 71'h35b8891f5fba8a2c49;
    stim[52] = 71'h0fc085f14c1d92e382;
    stim[53] = 71'h16422ac248a6b45150;
    stim[54] = 71'h046674865e3065a6c0;
    stim[55] = 71'h3f0f6698ed30bb13ae;
    stim[56] = 71'h1cec3fe63e2f41130f;
    stim[57] = 71'h0be9cd069c108fa384;
    stim[58] = 71'h1e1b70dd6c9b7c6916;
    stim[59] = 71'h070fd9f1b62b5301e2;
    stim[60] = 71'h03f0a340709bb95b30;
    stim[61] = 71'h08fb1bca1e94eb890e;
    stim[62] = 71'h29a8178fb5c4cd3f97;
    stim[63] = 71'h1fc54622c5ad321721;
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
      expv[0] = 72'h000000000000000000;
      expv[1] = 72'h000000000000000000;
      expv[2] = 72'h000000000000000000;
      expv[3] = 72'h000000000000000000;
      expv[4] = 72'h000000000000000000;
      expv[5] = 72'h000000000000000000;
      expv[6] = 72'h000000000000000004;
      expv[7] = 72'h2ae6f91d9000000001;
      expv[8] = 72'h2ae6cd713000000001;
      expv[9] = 72'h2ae6c02ab000000001;
      expv[10] = 72'h2ae6c02aa000000004;
      expv[11] = 72'h2ae6c02aa000000004;
      expv[12] = 72'h0437234a7000000001;
      expv[13] = 72'h348ae34a6000000001;
      expv[14] = 72'h348ac34a6000000001;
      expv[15] = 72'h348ac34a6000000004;
      expv[16] = 72'hf48ac34a6990300006;
      expv[17] = 72'h748ac34a6990300006;
      expv[18] = 72'h748ac34a69903ddbd6;
      expv[19] = 72'h348ac34a69903ddbd4;
      expv[20] = 72'h335f7bbef9903ddbd1;
      expv[21] = 72'h05362fecd9903ddbd1;
      expv[22] = 72'h05360fecc9903ddbd4;
      expv[23] = 72'h13eef06459903ddbd1;
      expv[24] = 72'h13eed94ab9903ddbd1;
      expv[25] = 72'h13eedf0339903ddbd1;
      expv[26] = 72'h13eedf0329903ddbd4;
      expv[27] = 72'h0879b81119903ddbd1;
      expv[28] = 72'h08d12b0199903ddbd1;
      expv[29] = 72'h180c3523f9903ddbd1;
      expv[30] = 72'h180c04e999903ddbd1;
      expv[31] = 72'h180c04e989903ddbd4;
      expv[32] = 72'h1738f899f9903ddbd1;
      expv[33] = 72'h1738ceac79903ddbd1;
      expv[34] = 72'h1738c05439903ddbd1;
      expv[35] = 72'h1738c05429903ddbd1;
      expv[36] = 72'h1738c05429903ddbd4;
      expv[37] = 72'h1e29257dd9903ddbd1;
      expv[38] = 72'h1e29057dc9903ddbd4;
      expv[39] = 72'hde29057dc990392d66;
      expv[40] = 72'h9e29057dc990392d66;
      expv[41] = 72'h1e29057dc990392d64;
      expv[42] = 72'h13c1b1813990392d61;
      expv[43] = 72'h13c191812990392d64;
      expv[44] = 72'h13c191812990392d64;
      expv[45] = 72'h112ea024d990392d61;
      expv[46] = 72'h112e8024c990392d64;
      expv[47] = 72'h112e8024c990392d64;
      expv[48] = 72'h112e8024c990392d64;
      expv[49] = 72'h308e35e05990392d61;
      expv[50] = 72'h308e15e04990392d64;
      expv[51] = 72'h23d2eb4a7990392d61;
      expv[52] = 72'h23d2cb4a6990392d64;
      expv[53] = 72'h03b26e383990392d61;
      expv[54] = 72'h03b24e382990392d64;
      expv[55] = 72'h03b24e382990392d64;
      expv[56] = 72'hc3b24e382fc3d92d66;
      expv[57] = 72'h03b24e382fc3d92d64;
      expv[58] = 72'h0211fa385fc3d92d61;
      expv[59] = 72'h0211da384fc3d92d64;
      expv[60] = 72'h0211da384fc3d92d64;
      expv[61] = 72'hc211da3840fc21a036;
      expv[62] = 72'h0211da3840fc21a034;
      expv[63] = 72'hc211da3840fc2bc7d6;
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
