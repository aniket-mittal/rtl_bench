// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 385;
  localparam OW = 320;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_065252 dut (
    .ww_i1(in_vec[384:320]),
    .ww1_i2(in_vec[319:255]),
    .ww2_i3(in_vec[254:160]),
    .ww3_i4(in_vec[159:65]),
    .w_i5(in_vec[64:0]),
    .topLet_o(out_vec[319:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 385'h1d683e81cec7f54424c38ab55d6b4e14766c0347e6954c43ca519fdf3518de6f8216646732b0044e4c906ca9ec12cb2c6;
    stim[1] = 385'h0d451ac457f6e081e60e059b4bb8a1c1d8f697efc7e560216d0c7fa1101eb31309c4b6c6f6961d0cabb8da3cec47fd221;
    stim[2] = 385'h1e981ba5a21efdb6d8a24bbdbca8c37217987d1b58b2ef90de97fa0bf0f070e28fb22e9488295d7760b93339b605875c0;
    stim[3] = 385'h087aa66123d205cb91e6a1b8648870d22849326e287478d47db009d90861de7d9e326fa45b7c1cfcd0802f13c5c51313e;
    stim[4] = 385'h0e73357df0d9276bd7ce69caa394b06f34dafdea659ef36f943511745f5cbdef614ffdaaa58eacca7f71d923d9f58f619;
    stim[5] = 385'h1120ed82a13d20ea50a9435176bcc326e6d80b4a99ce855189c7a859f578b4bbfed521feb31aa5e9b6e5ff0d29876a651;
    stim[6] = 385'h1f94ac2518f737fccb3670f37761cf1cccb5b66bfe6d92eacb25669f3fdf781c5cea78032e10e8de461472bfa6c47abc8;
    stim[7] = 385'h00d2f7c491b4d272968307358941cc023c945e6ca0b611cad4003cb1c3086856e7966b2c1494c0b419108a85985cfce75;
    stim[8] = 385'h0ac6a61b797485a0d0902e85caa05474f40373cb03ee5eca3341c61c32703bbf8df25c532f57bf9a205eab7349a35f489;
    stim[9] = 385'h09efa779fe4f227c19d3112400a71321b7495bdce06bfc277890a9856699e9e2bac4b415d5c39857d12e9039179922898;
    stim[10] = 385'h0a855412ebfda01ae90ccf85deb72cdfc2ea1b5909387cdf3348968cb818ee6937e6e047b463b3cca4a4253cd505ea718;
    stim[11] = 385'h02c7e25663205a0d31343f22e4048d0028ca8fdab20c51496fbc8740938ee2af5da255cecbf5f73adf00b880c8ac00792;
    stim[12] = 385'h028358aa5f7311b5a28c21dbeb9b94d5adfcd32aae82352c08efe1e7dacb0ada189081800ec6a250d7eb93bfda76d23d6;
    stim[13] = 385'h1907e268c0cf7a923e5fa3e43639df3caea3affa0434f58661726092c8a848bbfea4347cf9af23a523d211bbb2f9cb0d8;
    stim[14] = 385'h0f73b222233c40ff27b1e77a71817ddd355c1133e29351bfb7afdd5073ea680c9a8ac867d2d24d699a5e57e2056c0c809;
    stim[15] = 385'h10354ac9d204e4ac9d4f051cee909094b458a28c924d6642c8bb6ed07a799d9e05a8fcfaed414a0044416bd1b3deeae0b;
    stim[16] = 385'h0989e9220c4bab35a3d87b138dbde3a4c2ff0a0f0b551c2cbecd564deb9bb4316bf8b49b86a9a333bc9dd438f85659513;
    stim[17] = 385'h14eee8222a48e44035c4e2a2672409564e4ba591dfd7ffc889dc3fa96e4fda086d1335adfd3d3fd00461abb1727b6a9f5;
    stim[18] = 385'h078f5ee9d95192ef99f43bf808d01b30870bdcc8bc192eb476d9f92d2e451607ae4fb5581197a70d0cbd8d9274364847c;
    stim[19] = 385'h09ac63c351e2b0509ac2cc5032202f747ac5d3925576285f8f79890450c0097d0007ce1cff79390a7e142b34af44b1e0a;
    stim[20] = 385'h1ab37331cf6f5f020643ac523ccbbbc9352d06f87d5e7c97d3404a9eb589c1187d6bc1d2c7e7cf5faf45d6a9172c9b474;
    stim[21] = 385'h01b0e7ec82d6398fe4a746cb868617c939dca2de5cd13e3d25588ef2b07aacb12ab4992e0da5037a12820076c1a8bd6ae;
    stim[22] = 385'h112a0cc819dd0a196416511099fc52cc1f1892313e078a7b482d154c076547594be92d9cd423f237e223a1d7bc6ca9fb4;
    stim[23] = 385'h192f1068053b5b3e2706f3ddd5a1aaa9445e2dd6f636ebe2e5b4b5f1aa7a52b4e5aebd1ce62677829dfb4df5d7c9d9ee6;
    stim[24] = 385'h0017f46395836e62459c98fea534e5462d49e9547f2389cc2489403332768b4b0f9698fa56f8c7eb08bd812af5e3a541b;
    stim[25] = 385'h1176a76f620d41dc2fe582f34220187b0e6436cfc6ae9b27389b85185514de3ad8b4877ae172405272633dc999cc92ce1;
    stim[26] = 385'h140df1d282bf7c703a79319c387352caaabdea542570d1c7a2ab7d99edc4a1b8e3d2e527867dc3ccfe8c77c55ea2c31da;
    stim[27] = 385'h151eb436d38cfabc9e7b1d4d9470060c960165cb93366037b31817e91f45ce25d38f256b164f5c9011ddec04d0e470680;
    stim[28] = 385'h166009045330675f20a32cc43ddaeb2109f9e6154ff3ee210f5b542186fff067e0aff168fcebb17e34504b0d02f60c9a5;
    stim[29] = 385'h0676ab4de19a7bf770e4574afd6688ae6680da1fe886d5cffa1a3682217f6ef3e9fb7abe56f1c9d1267f1ca0da567e3c7;
    stim[30] = 385'h1ba34a132f87575f5460adeaf9932300c60a5d251218b7e2e2e2578060ec920f4928eb60dc7053de003607b286678af07;
    stim[31] = 385'h037aab50e63cfd2af8b2e434b1c0fd42aae841e35ea40930fb9f11663f137f257123ea9ad513fc42447efa4088d973d2d;
    stim[32] = 385'h016f23f337e7ef702f2a042da79cbf22ae18cab1ae71a7a93a409f67cef4558af65f1c74e9791df03fb24127b5c00041f;
    stim[33] = 385'h03537812961e581e07e3ba3260c75e122a46336343f09bb9187d661f017f0468308833d321df29bf4ed89948ea3ee7533;
    stim[34] = 385'h1f8c1d0967f651393ff149334954920a97304fbe5814ad87f7b806c7e2d03042213a9a9e8891685c69d131a677d274576;
    stim[35] = 385'h048c93b610888561769765c40f4d9190d50085ea532d364f55938b066ccc66ed028144ff2032bd112eb6a49d8ee2a078e;
    stim[36] = 385'h003076c93bb08d8277c9dbd28ec275b79479d3d7251b3afe5f2da7e6c56a6100d7b7a3c6eb383e149281f6a290d05b828;
    stim[37] = 385'h171d48a4d9411b9f7a3d1092c79017d4b186db75051485296358bebf904c9864f8e3582b3ec65fac3aa03c05da5122c0a;
    stim[38] = 385'h1abecbf2d423a276672dec03dd27591a449e60d54c5900eca53edb9b15e28d3f66dc9f1031da789e2396f8ee37547f9af;
    stim[39] = 385'h1727b97fda34c6418c336a44be7fc405467d08116d34ed03694b63680189029a0892ede57c8e1a09c7ab7a2a9d2a4efda;
    stim[40] = 385'h1becd9853e8ae2e3f0a97e22e77038a2952de7338bbdb77f8db15a1b465717f598758e30b44c23d7db07a6db07afa9a72;
    stim[41] = 385'h078a949eef30eec216a773fd7e3cf611b03cc62b9db807828f832fd9e6eca5d8c41e5795ebd873baf705dbab8364d43d8;
    stim[42] = 385'h1eda3ea32afd8efaf0658f9ba04d83b7c6c8065ada7d3919d14a823a6871253edfc2530033dde8b70f7b764268ba50b63;
    stim[43] = 385'h020a6d0cc841fa83c555eafbf83e871139c10041fbfc750cba898186ee45d3afbb4b5d4219d3445c8a4ff48962bfde5bc;
    stim[44] = 385'h10aaab37da85097e62a2334f8bc443b636a8780583f0375864401cf4bcd5d9bf6e6524261b51785e7b2088667f4301e1d;
    stim[45] = 385'h03762a44b901ad175280d6e575d16280ba6ac073a07ba3d7eb3a1862c0b8609d824e7f8cf9ba9ade1ec6e29ad40f0b338;
    stim[46] = 385'h080832156a46fe22aff318e861de0721c2888e43dfe09cd941e842fdd3607a1a85858fd4db48458a5cf8a45004c0fde69;
    stim[47] = 385'h06b105043fd5c6e7c39d11d4cc8363399311336ff4ee942818a5bcfd9441cd0b723167e56519585dfef1ada5d17ad4915;
    stim[48] = 385'h0ab725929059b37902a0b6e1d5a028661b6065bbd802ac45fdeab4aa750d7af15e7a80ecb7fa763de7979d85547f61a29;
    stim[49] = 385'h1dc06ff82c9b9fab1f54abe061e84ade143299c9201676d2176db669858116d0bf39925630799e9908301dcc816e23525;
    stim[50] = 385'h0e920991fd28269c7dae90e91c4d7856350f74e36d29cc219bf673c0d98a26a8b8150aa72765ccdb43a67ea6e13b5371a;
    stim[51] = 385'h0d750c23b3e263c2ede832a8db9f9835a3edcaf4c797a06d6851f8e0d9c1ef3fbe8ee1941a491061f39365e1ad1f93941;
    stim[52] = 385'h079621f0ee1bd3d01e3f347004d78ad3e683862b3d7cf53d48d0e751d4eddee430234b90fd4ed04d882ea59294b599cbe;
    stim[53] = 385'h00c8da123ba0a43cc7347c90c7dc0d697a44bee760658399f5059768568da8607c54024a6721a19e00744c2188bbe5010;
    stim[54] = 385'h1e3551832c9dc36ab531f015b7c15e1dce49178b5986f942747fa0b52e696da520aa026c14014384e5cf5173bd2bc8415;
    stim[55] = 385'h065c3aa67c9af2775fa7242ffb744dfce1bd7fdedc669fa7791d373da44ffb58fea1816c5fdeb208a3194e2cf71a22426;
    stim[56] = 385'h0cafb517ba90a5bfec352c99f0f2521c19a7ceda09ea8ab322e189efebd06b2af234cbf959e10765d52a487cedb019fe1;
    stim[57] = 385'h18862a278b3270de36ffb1646eeae72439c283a51bcf745615bc2606ebd7e1c27b88e3c65b1f441ba1dfcef844f7b2682;
    stim[58] = 385'h14e6276d5d740de14225d32a61bbab2f73c6943d2b28b4657ba7f9fb3c1faf0882a79de2281576daafeeb3f7e9556fc26;
    stim[59] = 385'h02a9e6419590a16893333f85332a0eb15033ee141729957e69052dcb527b9bcbf961fa53e3ce35b142afe16a9df554f36;
    stim[60] = 385'h0565bab0d2723a67cc80a314e6c14b8bb572a006867600e5bc0e0d93880955be6e5869ab265eb924df9e27328ad7919ad;
    stim[61] = 385'h023a787832de88c95455528fcfe55f5b0e970dfa5ee2209727c243c9043a00c1e12de2a245357eb3a424b38f31d70ba5c;
    stim[62] = 385'h0f514c5f72bca83126b3e27176597a9167e19b9080fa9bb3138ede2091ddb19a85fc5fc9e3d5894aa364ff0e25b85630d;
    stim[63] = 385'h17df6c10f73c9e5eb134e52d1284316cc2d0d883de2907fded19277a0c40969203c0679a4b6a17daa4b0e6ff14886f5e8;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 320'heb41f40e763faa215241b2a7b04b2cb1b3601a3f34aa621e528cfef9a8c6f37c10b3233995802272;
      expv[1] = 320'h9dc6d1e7623fe910b0702cda5dc50e0ec7b4bf7e3f2b010b6863fd0880f598984e25b637b4b0e865;
      expv[2] = 320'hf4c0dd2d10f7edb6c5125dede5461b90bcc3e8dac5977c86f4bfd05f878387147d9174a4414aebbb;
      expv[3] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 320'h89076c1509e90752854a1a8bb5e61937200000000000000000000000400000000000000000000000;
      expv[6] = 320'hfca56128c7b9bfe659b3879bbb0e78e665adb35ff36c9756592b34f9fefbc0e2e753c019708746f2;
      expv[7] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 320'h563530dbcba42d068481742e5502a3a7a01b9e581f72f6519a0e30e19381ddfc6f92e2997abdfcd1;
      expv[9] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 320'h542aa0975fed00d748667c2ef5b966fe1750dac849c3e6f99a44b465c0c77349bf37023da31d9e65;
      expv[11] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 320'hc83f1346067bd491f2fd1f21b1cef9e5751d7fd021a7ac330b930496454245dff521a3e7cd791d29;
      expv[14] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 320'h81aa564e90272564ea7828e7748484a5a2c51464926b321645db7683d3ccecf02d47e7d76a0a5002;
      expv[16] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 320'ha777411152472201ae27151339204ab2725d2c8efebffe444ee1fd4b727ed0436899ad6fe9e9fe80;
      expv[18] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 320'hd59b998e7b7af8105d175aa45cb26d1d296837c3eaf3e4be9a0254f5ac4e08c3eb5e0e963f3e7afd;
      expv[21] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 320'h89506640cee850cb20b28884cfe29660f8c49189f03c53da4168aa603b2a3aca5f496ce6a11f91bf;
      expv[23] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[24] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 320'h8bb53b7b106a0ee17f2c179a1100c3d8600000000000000000000000400000000000000000000000;
      expv[26] = 320'ha06f8e9415fbe381d3c98ce1c39a96556000000000000000000000006e250dc71e97293c33ee1e67;
      expv[27] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 320'h33b55a6f0cd3dfbb8722ba57eb3445733406d0ff4436ae7fd0d1b4110bfb779f4fdbd5f2b78e4e89;
      expv[30] = 320'hdd1a50997c3abafaa3056f57cc9918063052e92890c5bf171712bc030764907a49475b06e3829ef0;
      expv[31] = 320'h1bd55a8731e7e957c59721a58e07ea1557420f1af5204987dcf88b31f89bf92b891f54d6a89fe212;
      expv[32] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[36] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[37] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[38] = 320'hd5f65f96a11d13b3396f601ee93ac8d224f306aa62c8076529f6dcd8af1469fb36e4f8818ed3c4f1;
      expv[39] = 320'hb93dcbfed1a6320c619b5225f3fe202a33e8408b69a7681b4a5b1b400c4814d044976f2be470d04e;
      expv[40] = 320'hdf66cc29f457171f854bf1173b81c514a00000000000000000000000400000000000000000000000;
      expv[41] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[45] = 320'h1bb15225c80d68ba9406b72bae8b1405e0000000000000000000000005c304ec1273fc67cdd4d6f0;
      expv[46] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[47] = 320'h35882821feae373e1ce88ea6641b19cca00000000000000000000000220e685b918b3f2b28cac2ef;
      expv[48] = 320'h55b92c9482cd9bc81505b70ead014330db032ddec015622fef55a553a86bd78af3d40765bfd3b1ef;
      expv[49] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[50] = 320'h74904c8fe94134e3ed748748e26bc2b1a87ba71b694e610cdfb39e06cc513545c0a855393b2e66da;
      expv[51] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 320'h0646d091dd0521e639a3e4863ee06b4bd225f73b032c1ccfa82cbb42b46d4303e2a01253390d0cf0;
      expv[54] = 320'hf1aa8c1964ee1b55a98f80adbe0af0ee7248bc5acc37ca13a3fd05a9734b6d2905501360a00a1c27;
      expv[55] = 320'h32e1d533e4d793bafd39217fdba26fe70debfef6e334fd3bc8e9b9ed227fdac7f50c0b62fef59045;
      expv[56] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 320'hc431513c599386f1b7fd8b2377573921ce141d28de7ba2b0ade130375ebf0e13dc471e32d8fa20dd;
      expv[58] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[59] = 320'h154f320cac850b449999fc299950758a819f70a0b94cabf348296e5a93dcde5fcb0fd29f1e71ad8a;
      expv[60] = 320'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 320'h11d3c3c196f4464aa2aa947e7f2afad874b86fd2f71104b93e121e4821d0060f096f151229abf59d;
      expv[62] = 320'h7a8a62fb95e54189359f138bb2cbd48b3f0cdc8407d4dd989c76f1048eed8cd42fe2fe4f1eac4a55;
      expv[63] = 320'hbefb6087b9e4f2f589a7296894218b661686c41ef1483fef68c93bd06204b4901e033cd25b50bed5;
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
