// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 213;
  localparam OW = 67;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  prim_sha2_pad dut (
    .clk_i(clk),
    .rst_ni(in_vec[212:212]),
    .fifo_rvalid_i(in_vec[211:211]),
    .fifo_rdata_i(in_vec[210:139]),
    .shaf_rready_i(in_vec[138:138]),
    .sha_en_i(in_vec[137:137]),
    .hash_start_i(in_vec[136:136]),
    .hash_stop_i(in_vec[135:135]),
    .hash_continue_i(in_vec[134:134]),
    .digest_mode_i(in_vec[133:130]),
    .hash_process_i(in_vec[129:129]),
    .hash_done_i(in_vec[128:128]),
    .message_length_i(in_vec[127:0]),
    .fifo_rready_o(out_vec[66:66]),
    .shaf_rvalid_o(out_vec[65:65]),
    .shaf_rdata_o(out_vec[64:1]),
    .msg_feed_complete_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 213'h06e0ada66e448118cf1d25c3d88ef4fd012d67b03f10903da908ed;
    stim[1] = 213'h07bd72b7f0dbe0e260f46b47a11f78bdd8068efe5efc2f18847edc;
    stim[2] = 213'h1f2e1cb99f30b6b121b0e7347e763c1cf5704cf1a5e72af74d15a7;
    stim[3] = 213'h11dacee9b267420ffca022ad190bf82f04c71bfbfbe2b01e4efd5c;
    stim[4] = 213'h11d4b0098c4c636706cc36fb8d3fb3bf8e3afd4414f3f6b3025694;
    stim[5] = 213'h1ec92675183336157ece63947450656611424adb617b659da8c765;
    stim[6] = 213'h1fa2b2b9b8d108253736b1243b6a8c4dd82df6fd37c27aa558baf6;
    stim[7] = 213'h12cf0f62dbb90e14ef6ea2b0163bef332590312011480835f6b225;
    stim[8] = 213'h15c2f1a2ec01e3967fbbd4161a8a0446aff2fb00d6f979dadf29b0;
    stim[9] = 213'h1023c4b0c464975fd5965e89fdf8cfac082949be3789cbada88d7b;
    stim[10] = 213'h15cf097fa331d5c6d25e743590b88126f593f6c1a0d85c6cd308d5;
    stim[11] = 213'h1377683b775044137b087217ec1381e3e94eabe48b88b1d84bf17c;
    stim[12] = 213'h14eabc9db07469c3f42cf8c31556565d9cf6a655204cf2a8ccde5a;
    stim[13] = 213'h13e0021edad641f4ed240dda6ec3d97a6bcbc951ecef5797ebb1b1;
    stim[14] = 213'h128720514ea6d5b197adcbd5f81d57c28dfdf5f2b073668b3b17f0;
    stim[15] = 213'h192c0827977bc2721e3bb2f07887d05fad239259525e5768128ce4;
    stim[16] = 213'h138752ecaeb77f036f865962950d1642e6ac2355f9a1aae0696930;
    stim[17] = 213'h166e284b0416a052f36e405f5fbfe722968d0fc6db832fece3b07d;
    stim[18] = 213'h19efeeb00bf5bcb21d10ecf76d03950661db89efd152b5a83d5ea0;
    stim[19] = 213'h146b0b6362da5166cafb3cfc3bbfacb7fdc7ad94bf6aa11cec33e3;
    stim[20] = 213'h169309d0fb9d5f9199014d86127deaeca4fdcc5c4253bf3cab80ac;
    stim[21] = 213'h1192d23d4a7469b6fca8ba5e6551d10eab4c7287f3e15371a4b828;
    stim[22] = 213'h1cbdc72aa8f385820b5ad486166182069db936b5872e07bb07420a;
    stim[23] = 213'h1b801d88f35b655f2f810690cbb3382b5bd9ab206d5d0616502f35;
    stim[24] = 213'h164d5db5a41f4e02670627c206edfb5f4c342149dbae217d22683e;
    stim[25] = 213'h1d471a1e20037df2ee3926c0fba2747c2b79de0870649c9d38de48;
    stim[26] = 213'h1f5434ab62cc362c5bba5dd35e029c0a2495c98dc6a47b003eda7e;
    stim[27] = 213'h1ed1660251adde295b992f56e5e402d48ade5893a2b52eeb2ad6f2;
    stim[28] = 213'h12483de1597cd95e7fcdef147a237bc1869f57e2b5accd07f5cb15;
    stim[29] = 213'h1a374206c197da46c11bd833836f3000c3326ad771011f6b8647db;
    stim[30] = 213'h1cdf4524c804fb4c0295db9883e4b002dcc9a96c02761bf14c8cb1;
    stim[31] = 213'h13a9bb659f69cc9ddaaeb9aaf02ba58364fcdc47851a001e8fdee6;
    stim[32] = 213'h10ad14bd6e3e68785066374119d2a32123079d991fc226a0f5737e;
    stim[33] = 213'h112123e237ba4168613b107fda347fe403f8c5e4e7b604b6500632;
    stim[34] = 213'h1e47ebf6db70c707e1457819764c1b558cb4e757dbf420366d524b;
    stim[35] = 213'h1d20e2aeb7bd54fdd0ca5f8279c3b1478e7af6665b0c569a3e40d0;
    stim[36] = 213'h1559d9e2ee1ef191dff8c95752e1e21887ca73553abf2875d4eead;
    stim[37] = 213'h1c60dbe2949625fee21ce84b05abb81e9a724fd5f975736b9fdf0d;
    stim[38] = 213'h1db3df3a6b848360b3305ec2abf65dcac3caa130123ef5ffbb8449;
    stim[39] = 213'h1fc4e2ca2c778ba718e12a267f55322ad2a610da87dab7591470b3;
    stim[40] = 213'h10b98b31aee527cd7a2aa07fadfead3de8fbfb5ee178b66f7d7936;
    stim[41] = 213'h1c6e69a82c8416d250cc9a33446e0207a14667c83075e1f4bb0118;
    stim[42] = 213'h18c78b1acd04ebe1e5084a6a4db0a76a30cd1392b583c2a0172271;
    stim[43] = 213'h18838095fd2a32e0c7f4381431703ebf0838541d87b243f0546620;
    stim[44] = 213'h1fc87d7f8407514704b81c5f07ff743967f7a307a34bdc1e424ded;
    stim[45] = 213'h1df27f433450c479056319235ab216f1fe496b3207a17c3de657b5;
    stim[46] = 213'h1254349d0ee9a09c2942facf2570f4782ac72e5ff88ff34899435a;
    stim[47] = 213'h11ef6098e43bd92f6cae0929dc8c00ad3742c7b68641660ddd5995;
    stim[48] = 213'h1d267291b72b16b99045d1786c6564db77b326e95381fa79ed0424;
    stim[49] = 213'h0a9f88d74f68bdeeb9386e3fca135e4792d6fd6128d999f8a05de7;
    stim[50] = 213'h1b7c847c9c0264f7c9db8f400dcf92e097066b826401b95e13dbb4;
    stim[51] = 213'h1d61d52dab21e25aeef0fb8895e29d520dbe2e2c626429abb2b9da;
    stim[52] = 213'h16024a8ac8b38966b9ee3ca44a60f6c60ad78faec8f8bbeff9bb66;
    stim[53] = 213'h1ff1df42fafa79e3edbc5c7114104788f36d488e04fa15cbc348b5;
    stim[54] = 213'h104da7b99f1a07770628942fcdad37e56eca4498fcf8509aad91f2;
    stim[55] = 213'h13d273b63e163a30f6bd45576f026f3939de8d78f637b345415255;
    stim[56] = 213'h1eab924cd0a8aeceba3e5c95e591d7715bd16b4509e333a933af32;
    stim[57] = 213'h115e862837d421dcdda80813f8ded47dc50dc127cc27492c14e667;
    stim[58] = 213'h1c7ff9c4df35947ebef65c625481b09c87165a203c0b889cd7b051;
    stim[59] = 213'h1c93d9b9392286996bfeec73838e7b73837b0fb6a3150adc62ef50;
    stim[60] = 213'h1ad015454925de0ab940815363c403228cb0092437d7829b713dcb;
    stim[61] = 213'h135c6c2b11203d52c682d5ef5f51f499c1abc7077b95b76f272b40;
    stim[62] = 213'h1646167188c1ba6a4f1a1cef78736831ca7eec016b92993ee57dfc;
    stim[63] = 213'h1e96f3ca5b020dedd81def8a5707d0d91ba6bfba62398ded6cd3e6;
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
      expv[0] = 67'h1b82b699b91204632;
      expv[1] = 67'h1ef5cadfc36f83898;
      expv[2] = 67'h1cb872e67cc2dac48;
      expv[3] = 67'h076b3ba6c99d083fe;
      expv[4] = 67'h0752c02631318d9c0;
      expv[5] = 67'h1b2499d460ccd855e;
      expv[6] = 67'h1e8acae6e3442094c;
      expv[7] = 67'h20000000000000000;
      expv[8] = 67'h20000000000000000;
      expv[9] = 67'h20000000000000000;
      expv[10] = 67'h20000000000000000;
      expv[11] = 67'h20000000000000000;
      expv[12] = 67'h13aaf276c1d1a70fc;
      expv[13] = 67'h0f80087b6b5907d3a;
      expv[14] = 67'h0a1c81453a9b56c64;
      expv[15] = 67'h04b0209e5def09c86;
      expv[16] = 67'h4e1d4bb2baddfc0da;
      expv[17] = 67'h59b8a12c105a814bc;
      expv[18] = 67'h07bfbac02fd6f2c86;
      expv[19] = 67'h11ac2d8d8b69459b2;
      expv[20] = 67'h1a4c2743ee757e466;
      expv[21] = 67'h064b48f529d1a6dbe;
      expv[22] = 67'h12f71caaa3ce16082;
      expv[23] = 67'h0e007623cd6d957ca;
      expv[24] = 67'h193576d6907d38098;
      expv[25] = 67'h151c6878800df7cba;
      expv[26] = 67'h1d50d2ad8b30d8b16;
      expv[27] = 67'h1b45980946b778a56;
      expv[28] = 67'h0920f78565f36579e;
      expv[29] = 67'h08dd081b065f691b0;
      expv[30] = 67'h137d14932013ed300;
      expv[31] = 67'h0ea6ed967da732776;
      expv[32] = 67'h02b452f5b8f9a1e14;
      expv[33] = 67'h04848f88dee905a18;
      expv[34] = 67'h191fafdb6dc31c1f8;
      expv[35] = 67'h14838abadef553f74;
      expv[36] = 67'h1567678bb87bc6476;
      expv[37] = 67'h11836f8a525897fb8;
      expv[38] = 67'h16cf7ce9ae120d82c;
      expv[39] = 67'h1f138b28b1de2e9c6;
      expv[40] = 67'h02e62cc6bb949f35e;
      expv[41] = 67'h11b9a6a0b2105b495;
      expv[42] = 67'h031e2c6b3413af878;
      expv[43] = 67'h020e0257f4a8cb830;
      expv[44] = 67'h1f21f5fe101d451c0;
      expv[45] = 67'h17c9fd0cd14311e40;
      expv[46] = 67'h0950d2743ba68270a;
      expv[47] = 67'h47bd826390ef64bda;
      expv[48] = 67'h1499ca46dcac5ae64;
      expv[49] = 67'h0a7e235d3da2f7bae;
      expv[50] = 67'h0df211f2700993df2;
      expv[51] = 67'h158754b6ac87896ba;
      expv[52] = 67'h18092a2b22ce259ae;
      expv[53] = 67'h1fc77d0bebe9e78fa;
      expv[54] = 67'h01369ee67c681ddc0;
      expv[55] = 67'h0f49ced8f858e8c3c;
      expv[56] = 67'h1aae493342a2bb3ae;
      expv[57] = 67'h057a18a0df5087736;
      expv[58] = 67'h11ffe7137cd651fae;
      expv[59] = 67'h124f66e4e48a1a65a;
      expv[60] = 67'h0b4055152497782ae;
      expv[61] = 67'h0d71b0ac4480f54b0;
      expv[62] = 67'h191859c62306e9a92;
      expv[63] = 67'h1a5bcf296c0837b76;
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
