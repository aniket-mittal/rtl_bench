// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 107;
  localparam OW = 107;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04238 dut (
    .clk(clk),
    .ctlwb_out(in_vec[106:105]),
    .ctlm_out(in_vec[104:102]),
    .adder_out(in_vec[101:70]),
    .aluzero(in_vec[69:69]),
    .aluout(in_vec[68:37]),
    .readdat2(in_vec[36:5]),
    .muxout(in_vec[4:0]),
    .wb_ctlout(out_vec[106:105]),
    .m_ctlout(out_vec[104:102]),
    .add_result(out_vec[101:70]),
    .zero(out_vec[69:69]),
    .alu_result(out_vec[68:37]),
    .rdata2out(out_vec[36:5]),
    .five_bit_muxout(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 107'h7857cb30c74879db1de2bccef32;
    stim[1] = 107'h27a1239d2fb4a7d3186ed5a2c00;
    stim[2] = 107'h7ba50f07a9b1cb3b3ed8ce078ea;
    stim[3] = 107'h271e4435d2d441830fb33bf4811;
    stim[4] = 107'h57bcbc18d06e16d73d1e3bbe728;
    stim[5] = 107'h56c26cd5489ca0c86957acb980b;
    stim[6] = 107'h786722d282230633f92538bd79d;
    stim[7] = 107'h75cd3bb21b08130f3ecf2daa1db;
    stim[8] = 107'h493ce0ecc88aaec9a8c72d8a748;
    stim[9] = 107'h17e1b7c1486bdcea44ac6812cc0;
    stim[10] = 107'h67e1efef55065cd72de4480053a;
    stim[11] = 107'h4425d5807ff661c2a25073331a7;
    stim[12] = 107'h273600030f51c06505fc8516845;
    stim[13] = 107'h25e3dfff66b0b314a169cc2036c;
    stim[14] = 107'h660f008a0a5987644628546f342;
    stim[15] = 107'h7d94a8ca666f327a422861dee46;
    stim[16] = 107'h3d5713bb8fe70dab0af4e60d36d;
    stim[17] = 107'h52fa6de3360f6f5186b9535c55a;
    stim[18] = 107'h27db73306f5b8ac2bfcaa076e2f;
    stim[19] = 107'h00643f7cd12db769d42206b0999;
    stim[20] = 107'h2865e58335e58211478717b7ee3;
    stim[21] = 107'h7dcfefd45d145ab0fc3289afde3;
    stim[22] = 107'h69a239ffe7738225c409853b078;
    stim[23] = 107'h10f06e2a12d8bfc6234c129becd;
    stim[24] = 107'h2b78d97699c130affa79017bebe;
    stim[25] = 107'h78942908e95a1cdebc64e0c755d;
    stim[26] = 107'h5b37dbdf928daa451ddd3a1c5b4;
    stim[27] = 107'h3385dab6dbf3356fdb8fd347a1d;
    stim[28] = 107'h18b294372e5bc4936e75883226c;
    stim[29] = 107'h6b232adbd4fbd8ea4bda594a9bd;
    stim[30] = 107'h059b90ddef56db1b87e578eda39;
    stim[31] = 107'h48de91f0ac5d8a925233aeaaffd;
    stim[32] = 107'h207b6e43edd53b160a91611d87b;
    stim[33] = 107'h5ca32dc1b0c0bedb98eb32971a4;
    stim[34] = 107'h515449bdede3478a2d33356da7e;
    stim[35] = 107'h57964e52a9dcd06c7906c36ee91;
    stim[36] = 107'h1d22e15c566ebf41c5ce4745aef;
    stim[37] = 107'h05f14fbaccf0ebbde2ecc60c643;
    stim[38] = 107'h6d7479a9298d3ac5155479afa8f;
    stim[39] = 107'h779cb28d0ce5f445eaa654d25f0;
    stim[40] = 107'h0a7c57dbabe5afaf9efb1bc49a1;
    stim[41] = 107'h799874e5f38df4dcadc90ecf840;
    stim[42] = 107'h3f1ca7d9cb20eed8ef024db85f0;
    stim[43] = 107'h5bf7d8ff3a90fc9b30e15b3c0cd;
    stim[44] = 107'h1477cd19be12f066f2434059ccc;
    stim[45] = 107'h3307e4aa1e1cb101d8d9d555234;
    stim[46] = 107'h0cad54520d9cc78a845e7a28be5;
    stim[47] = 107'h3b023a098eccd336ed58f51fa64;
    stim[48] = 107'h4b676b1c7bdb64f10d9fb5fc55d;
    stim[49] = 107'h16683d13e2f4262795597ec5f4c;
    stim[50] = 107'h2725397758d7a87809e4f05f3fe;
    stim[51] = 107'h31a7a61fadb241448ec32ab2499;
    stim[52] = 107'h401ad34e8a5cde4aab32feeb9b8;
    stim[53] = 107'h04786551a2fbf798328756429eb;
    stim[54] = 107'h3301359c0b752b9c8078f13acf8;
    stim[55] = 107'h0459f0dbbf2818379caf5de4bc2;
    stim[56] = 107'h0f2def08d9f007dd8bf73255b70;
    stim[57] = 107'h5cb0f05e88434c54eb220a28fe8;
    stim[58] = 107'h2e5de48ff4c424a0a409595383d;
    stim[59] = 107'h27bf00a15c17c446bec701a71e0;
    stim[60] = 107'h56d40751960db645bca07582694;
    stim[61] = 107'h4ac89afe18c3bc7f2d1016611ce;
    stim[62] = 107'h7f5748b82f3773779ed23a8eca9;
    stim[63] = 107'h4e8dcf8f50d3cbfac58241b835e;
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
      expv[0] = 107'h000000000000000000000000000;
      expv[1] = 107'h7857cb30c74879db1de2bccef32;
      expv[2] = 107'h27a1239d2fb4a7d3186ed5a2c00;
      expv[3] = 107'h7ba50f07a9b1cb3b3ed8ce078ea;
      expv[4] = 107'h271e4435d2d441830fb33bf4811;
      expv[5] = 107'h57bcbc18d06e16d73d1e3bbe728;
      expv[6] = 107'h56c26cd5489ca0c86957acb980b;
      expv[7] = 107'h786722d282230633f92538bd79d;
      expv[8] = 107'h75cd3bb21b08130f3ecf2daa1db;
      expv[9] = 107'h493ce0ecc88aaec9a8c72d8a748;
      expv[10] = 107'h17e1b7c1486bdcea44ac6812cc0;
      expv[11] = 107'h67e1efef55065cd72de4480053a;
      expv[12] = 107'h4425d5807ff661c2a25073331a7;
      expv[13] = 107'h273600030f51c06505fc8516845;
      expv[14] = 107'h25e3dfff66b0b314a169cc2036c;
      expv[15] = 107'h660f008a0a5987644628546f342;
      expv[16] = 107'h7d94a8ca666f327a422861dee46;
      expv[17] = 107'h3d5713bb8fe70dab0af4e60d36d;
      expv[18] = 107'h52fa6de3360f6f5186b9535c55a;
      expv[19] = 107'h27db73306f5b8ac2bfcaa076e2f;
      expv[20] = 107'h00643f7cd12db769d42206b0999;
      expv[21] = 107'h2865e58335e58211478717b7ee3;
      expv[22] = 107'h7dcfefd45d145ab0fc3289afde3;
      expv[23] = 107'h69a239ffe7738225c409853b078;
      expv[24] = 107'h10f06e2a12d8bfc6234c129becd;
      expv[25] = 107'h2b78d97699c130affa79017bebe;
      expv[26] = 107'h78942908e95a1cdebc64e0c755d;
      expv[27] = 107'h5b37dbdf928daa451ddd3a1c5b4;
      expv[28] = 107'h3385dab6dbf3356fdb8fd347a1d;
      expv[29] = 107'h18b294372e5bc4936e75883226c;
      expv[30] = 107'h6b232adbd4fbd8ea4bda594a9bd;
      expv[31] = 107'h059b90ddef56db1b87e578eda39;
      expv[32] = 107'h48de91f0ac5d8a925233aeaaffd;
      expv[33] = 107'h207b6e43edd53b160a91611d87b;
      expv[34] = 107'h5ca32dc1b0c0bedb98eb32971a4;
      expv[35] = 107'h515449bdede3478a2d33356da7e;
      expv[36] = 107'h57964e52a9dcd06c7906c36ee91;
      expv[37] = 107'h1d22e15c566ebf41c5ce4745aef;
      expv[38] = 107'h05f14fbaccf0ebbde2ecc60c643;
      expv[39] = 107'h6d7479a9298d3ac5155479afa8f;
      expv[40] = 107'h779cb28d0ce5f445eaa654d25f0;
      expv[41] = 107'h0a7c57dbabe5afaf9efb1bc49a1;
      expv[42] = 107'h799874e5f38df4dcadc90ecf840;
      expv[43] = 107'h3f1ca7d9cb20eed8ef024db85f0;
      expv[44] = 107'h5bf7d8ff3a90fc9b30e15b3c0cd;
      expv[45] = 107'h1477cd19be12f066f2434059ccc;
      expv[46] = 107'h3307e4aa1e1cb101d8d9d555234;
      expv[47] = 107'h0cad54520d9cc78a845e7a28be5;
      expv[48] = 107'h3b023a098eccd336ed58f51fa64;
      expv[49] = 107'h4b676b1c7bdb64f10d9fb5fc55d;
      expv[50] = 107'h16683d13e2f4262795597ec5f4c;
      expv[51] = 107'h2725397758d7a87809e4f05f3fe;
      expv[52] = 107'h31a7a61fadb241448ec32ab2499;
      expv[53] = 107'h401ad34e8a5cde4aab32feeb9b8;
      expv[54] = 107'h04786551a2fbf798328756429eb;
      expv[55] = 107'h3301359c0b752b9c8078f13acf8;
      expv[56] = 107'h0459f0dbbf2818379caf5de4bc2;
      expv[57] = 107'h0f2def08d9f007dd8bf73255b70;
      expv[58] = 107'h5cb0f05e88434c54eb220a28fe8;
      expv[59] = 107'h2e5de48ff4c424a0a409595383d;
      expv[60] = 107'h27bf00a15c17c446bec701a71e0;
      expv[61] = 107'h56d40751960db645bca07582694;
      expv[62] = 107'h4ac89afe18c3bc7f2d1016611ce;
      expv[63] = 107'h7f5748b82f3773779ed23a8eca9;
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
