// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 139;
  localparam OW = 138;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_096194 dut (
    .clk(clk),
    .rst(in_vec[138:138]),
    .main_rcn_in(in_vec[137:69]),
    .sub_rcn_in(in_vec[68:0]),
    .main_rcn_out(out_vec[137:69]),
    .sub_rcn_out(out_vec[68:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 139'h703c15d3e673c446b876f142d62b34d983d;
    stim[1] = 139'h62bc01ab26db521f9d28f5586de2001ed09;
    stim[2] = 139'h0b8c727427f5443ebae6f1606cf3965c878;
    stim[3] = 139'h097df81d8373455ed02c6db194c86cb64ef;
    stim[4] = 139'h53eddf5a5574b2da551a19b52760a823ad5;
    stim[5] = 139'h68195455fa2f812a7e103396c3039b8c88c;
    stim[6] = 139'h050799934ed9f8eb1e8c1bdf55cd5ae4ce3;
    stim[7] = 139'h035e90930bfc9e4e3b6df892eee34ffde3d;
    stim[8] = 139'h09d30a737b414d86d1dbc235d8d04049043;
    stim[9] = 139'h1d2be02c6ba4331c7b0dc688981d89078de;
    stim[10] = 139'h2f6e59b6da26a317a375b31e52308def854;
    stim[11] = 139'h00af34e44b7319df68774765ac9fe87e748;
    stim[12] = 139'h2a7139b19ef2fa374c4a1579c7e0e1962be;
    stim[13] = 139'h2b7638a1610acba3c678f9f2c1f5141e4c4;
    stim[14] = 139'h360af1a25d04c966640a40e4e3d646cc793;
    stim[15] = 139'h2497eeae4383a7d9e9e8d950e9a999af1a5;
    stim[16] = 139'h30f676c05b0ed08c32cbd4435f7720df665;
    stim[17] = 139'h307e061d1770af93a439f2280e146a4c2ff;
    stim[18] = 139'h23ecc4293652d7273cd7d789e3251a3c169;
    stim[19] = 139'h1acc4fdeb64bbdf1cbf1a32344831ed36f6;
    stim[20] = 139'h114a4aec322e32d1e27ad972a59a31bf7dc;
    stim[21] = 139'h14edd6737b639c7fcecac7d3eddce1b5e1a;
    stim[22] = 139'h270c8ce22fef5f0f27d5fa164ef1ddca2de;
    stim[23] = 139'h29407884b21e0d62d1bc227f50de087a2d7;
    stim[24] = 139'h1c7fb9e92c3cfb51ac7903dbd8f2bfa1e8d;
    stim[25] = 139'h3c779974b596fea1a4e36fb6f7c23a60da2;
    stim[26] = 139'h3e43078e8905a1c6c41b77e50d333cfca1f;
    stim[27] = 139'h03b2540a4fc7a30040a576bc488c0d619e4;
    stim[28] = 139'h022be5a5707f3561081bb55a5ff32f357b3;
    stim[29] = 139'h1f7cffe5e0c00208c83aa44f3097cb22f78;
    stim[30] = 139'h223cf85f32d7d0a9a72f361385667a1de0f;
    stim[31] = 139'h164c145cfda8a1df35d8944fc3869dd3d85;
    stim[32] = 139'h26cc4b36ada1696e58fada9666ff21bdf11;
    stim[33] = 139'h0433adb6271ae850747066a7d20957c1175;
    stim[34] = 139'h1eb8e779039c95bcf7d93806008b317d9f1;
    stim[35] = 139'h20ac7cb80f62684a43a425b8481177399e8;
    stim[36] = 139'h056833dd6e0ae4614019230fcd49e1e92f0;
    stim[37] = 139'h22a9b2e80bb27086adc9884d585a09c330c;
    stim[38] = 139'h211054aa9b6b7b3ac5384d368d8e6863e68;
    stim[39] = 139'h11b13e2392ce4aa8c09bca2fc32b86d9862;
    stim[40] = 139'h33df8ac09bc947416e745d45b15265394db;
    stim[41] = 139'h1467dfe0dba13d1ae6aaa270bb2e7d5c97d;
    stim[42] = 139'h18f06d5a950517635b5ab458589db350ae3;
    stim[43] = 139'h209d6b5b3bd774861ca4f97238ecb992893;
    stim[44] = 139'h2b80df7e76458028755195f4ba406636418;
    stim[45] = 139'h025dd67d8e0c571e9bb70eacbd93dcb2d46;
    stim[46] = 139'h11544c139ad3db7548ce2117ea66963be2c;
    stim[47] = 139'h086c7027d2b450ac959af08b74930d7c8f6;
    stim[48] = 139'h079d5b17467b1894d38cf98b7630a63e99f;
    stim[49] = 139'h044440171181010e2a26c22c27b1416a7d2;
    stim[50] = 139'h3093913f16e49ef2c453150e8a25b810f05;
    stim[51] = 139'h29e2a569500fc8c10f21c9d193ec9d7e165;
    stim[52] = 139'h31e539ef68415ef821e3bb79f2265c41e7d;
    stim[53] = 139'h03e48f8a9f944c23808521d2d689d40227a;
    stim[54] = 139'h12eb6465ef833c34fcd298d46ae04be3ae5;
    stim[55] = 139'h1a2f1cb053ebee9f04007838e72d2e534ee;
    stim[56] = 139'h33700e6815e3d8116b95360fda8349e8629;
    stim[57] = 139'h1fd8e3f05a32a39e479c4a008fa96e1f9c9;
    stim[58] = 139'h3b7dced695f46915e8d7a9d20f7765e45d9;
    stim[59] = 139'h28ad4d14332b2ef915da2efbc6d7da5c48a;
    stim[60] = 139'h2937920b84e8a4d065a8258f401e21da8ca;
    stim[61] = 139'h11883df9fe017a758f4cd369a64d0aacca3;
    stim[62] = 139'h172bce19724123f2b427bd1ff5affe18cd4;
    stim[63] = 139'h1887189f27dab52649a08d52780bb59dbc4;
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
      expv[0] = 138'h00000000000000000000000000000000000;
      expv[1] = 138'h00000000000000000000000000000000000;
      expv[2] = 138'h00000000000000000000000000000000000;
      expv[3] = 138'h00000000000000000000000000000000000;
      expv[4] = 138'h00000000000000000000000000000000000;
      expv[5] = 138'h00000000000000000000000000000000000;
      expv[6] = 138'h00000000000000000000000000000000000;
      expv[7] = 138'h00000000000000000000000000000000000;
      expv[8] = 138'h050799934ed9f8eb1e8c1bdf55cd5ae4ce3;
      expv[9] = 138'h2dbf125ddc69ffbc7a00000000000000000;
      expv[10] = 138'h09d30a737b414d86d1dbc235d8d04049043;
      expv[11] = 138'h21b8d11303b120f1bc00000000000000000;
      expv[12] = 138'h2f6e59b6da26a317a375b31e52308def854;
      expv[13] = 138'h00af34e44b7319df68774765ac9fe87e748;
      expv[14] = 138'h2a7139b19ef2fa374c4a1579c7e0e1962be;
      expv[15] = 138'h2b7638a1610acba3c678f9f2c1f5141e4c4;
      expv[16] = 138'h000000000000000001b0578d12e8264b332;
      expv[17] = 138'h2497eeae4383a7d9e9e8d950e9a999af1a5;
      expv[18] = 138'h00000000000000000187b3b602d87684619;
      expv[19] = 138'h00000000000000000183f030e8bb857c9d2;
      expv[20] = 138'h23ecc4293652d7273cd7d789e3251a3c169;
      expv[21] = 138'h1acc4fdeb64bbdf1cbf1a32344831ed36f6;
      expv[22] = 138'h114a4aec322e32d1e27ad972a59a31bf7dc;
      expv[23] = 138'h14edd6737b639c7fcecac7d3eddce1b5e1a;
      expv[24] = 138'h270c8ce22fef5f0f27d5fa164ef1ddca2de;
      expv[25] = 138'h29407884b21e0d62d1bc227f50de087a2d7;
      expv[26] = 138'h1c7fb9e92c3cfb51ac7903dbd8f2bfa1e8d;
      expv[27] = 138'h000000000000000001e3bccba5acb7f50d2;
      expv[28] = 138'h000000000000000001f2183c74482d0e362;
      expv[29] = 138'h03b2540a4fc7a30040a576bc488c0d619e4;
      expv[30] = 138'h022be5a5707f3561081bb55a5ff32f357b3;
      expv[31] = 138'h1f7cffe5e0c00208c83aa44f3097cb22f78;
      expv[32] = 138'h223cf85f32d7d0a9a72f361385667a1de0f;
      expv[33] = 138'h164c145cfda8a1df35d8944fc3869dd3d85;
      expv[34] = 138'h26cc4b36ada1696e58fada9666ff21bdf11;
      expv[35] = 138'h0433adb6271ae850747066a7d20957c1175;
      expv[36] = 138'h1eb8e779039c95bcf7d93806008b317d9f1;
      expv[37] = 138'h20ac7cb80f62684a43a425b8481177399e8;
      expv[38] = 138'h056833dd6e0ae4614019230fcd49e1e92f0;
      expv[39] = 138'h22a9b2e80bb27086adc9884d585a09c330c;
      expv[40] = 138'h211054aa9b6b7b3ac5384d368d8e6863e68;
      expv[41] = 138'h11b13e2392ce4aa8c09bca2fc32b86d9862;
      expv[42] = 138'h0000000000000000019efc5604de4a3a0b7;
      expv[43] = 138'h1467dfe0dba13d1ae6aaa270bb2e7d5c97d;
      expv[44] = 138'h2b568b0b13b66a15c600000000000000000;
      expv[45] = 138'h209d6b5b3bd774861ca4f97238ecb992893;
      expv[46] = 138'h2b80df7e76458028755195f4ba406636418;
      expv[47] = 138'h025dd67d8e0c571e9bb70eacbd93dcb2d46;
      expv[48] = 138'h11544c139ad3db7548ce2117ea66963be2c;
      expv[49] = 138'h086c7027d2b450ac959af08b74930d7c8f6;
      expv[50] = 138'h079d5b17467b1894d38cf98b7630a63e99f;
      expv[51] = 138'h044440171181010e2a26c22c27b1416a7d2;
      expv[52] = 138'h000000000000000001849c89f8b724f7962;
      expv[53] = 138'h29e2a569500fc8c10f21c9d193ec9d7e165;
      expv[54] = 138'h31e539ef68415ef821e3bb79f2265c41e7d;
      expv[55] = 138'h03e48f8a9f944c23808521d2d689d40227a;
      expv[56] = 138'h12eb6465ef833c34fcd298d46ae04be3ae5;
      expv[57] = 138'h1a2f1cb053ebee9f04007838e72d2e534ee;
      expv[58] = 138'h33700e6815e3d8116b95360fda8349e8629;
      expv[59] = 138'h1fd8e3f05a32a39e479c4a008fa96e1f9c9;
      expv[60] = 138'h000000000000000001dbee76b4afa348af4;
      expv[61] = 138'h28ad4d14332b2ef915da2efbc6d7da5c48a;
      expv[62] = 138'h2937920b84e8a4d065a8258f401e21da8ca;
      expv[63] = 138'h299a6d34c9a155994600000000000000000;
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
