// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 516;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_084687 dut (
    .in0(in_vec[515:484]),
    .in1(in_vec[483:452]),
    .in2(in_vec[451:420]),
    .in3(in_vec[419:388]),
    .in4(in_vec[387:356]),
    .in5(in_vec[355:324]),
    .in6(in_vec[323:292]),
    .in7(in_vec[291:260]),
    .in8(in_vec[259:228]),
    .in9(in_vec[227:196]),
    .in10(in_vec[195:164]),
    .in11(in_vec[163:132]),
    .in12(in_vec[131:100]),
    .in13(in_vec[99:68]),
    .in14(in_vec[67:36]),
    .in15(in_vec[35:4]),
    .sel(in_vec[3:0]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 516'h1e83036b128e31eb40cd79b857bf0e160099e0fd66ccbe93c4c4d403d2b0544e347cf269daa736f06d4efc5d12ecf65b7fa70e04c6328f59f7c03ac9b603c1fb6;
    stim[1] = 516'h50a7a9c319ce481d5b089fae3bf170952aa30e07549376ed51d4086e5784d2c4fbec4fc8c8b4cdcc7cf5940e20dff28b173a9c73a98b991f50ec3728dac2c206e;
    stim[2] = 516'h7af4dc95c3644b2802c2ce459b23f8f0af765dc0dbd2ceff9f30fd11d07661a2240ebe33deab3067550898ab7992fd0584eb3bf11314f3637c06473e747b2a68c;
    stim[3] = 516'hd1aec8da131cab3c7aa79e0997461ae365381336056f900b1297492e9b1e2baf84990e505c1b3074a7659b3246d14c35b7fd8b5870834136b45da3c2b6c19b375;
    stim[4] = 516'h896bf80a8262b5c26266db484a3fbd4f20fd45faf7e1462698d516715eb622c57b6b45455f2467eeac18872f9f714801e4d2b69fb74709fbaf56488063307819b;
    stim[5] = 516'h66517653cac971410ca9ca0a1e09ae896117ff0d1aba2da5c97efcfb7ab249b68bc4783fb17ffd1577f0efd59b8e9a318faa9990abeac832e5cf799d4cc709f34;
    stim[6] = 516'h9799d8403d508903ed53b85bba794a5943e93e5d566a0086002520cbdfadf55eb69a770da9a977042611b520041f340ecd2cbac1590e41afc614ee2ad88259d8c;
    stim[7] = 516'hede98d476a6c6586aa09786f04d8a178c335c8a8e4bbc2b7cab4782b7081782abc21a9fb444d1475ac2a50cdb443947f96f2168129168b73ed8580a59de5f5773;
    stim[8] = 516'hcca850f0190c7543f9ce2f4e184d1568af408be6d100f4b9fc4892119972e0cf1929511cec65599a383b85cd309e01a3bd82325955060282da8d26ae523024852;
    stim[9] = 516'he1727f8a71ded83eddb25f0cefbd4dae0c43abcffd5d1b30c270f0d0b62cc281c3626ff042ab574d7c8030795e2f55a7e4b44abec05e0fdaee7f383e7e750eb11;
    stim[10] = 516'ha3a47e986d349b30d1e4b49350dbbe7c8b2478b114c3c725706797b03bbf326ac4c373670298155838d8a904302e6d6c18170fce7371e7f54080e2e9a5bf0e5f7;
    stim[11] = 516'hd5ecab5cfe1e59f758b243fc16d4441f352705a31dd5305ac014bc033e1feea7af4aad1bab466e6ab8f3c8c1b1c4c471061d998e85c416acd5dbb7332dd5f1341;
    stim[12] = 516'h0dde89b730a137366636d889034d290525dddb68b285611117686e675b37dca47d9298a7211b8f9abc69d57c7853cd627836f47a0f45346fbb5cff26162a12391;
    stim[13] = 516'h05d652b5202cee693c31c47c338cb0efd7213ecc5c6cb58fdf7a1f88dca1cc21d12c2edfa558f5d40e54be7984bacb8e314c1bec6f3d9fd91990aa1ad57da9cae;
    stim[14] = 516'hf2ee9c873d2b148432aaf6873985c6047da3271b69f0268fbdea203315e0b2862272011ba7da83cdd76d99f2a693252b443229db796bb590a7b056bf304830af9;
    stim[15] = 516'h723c66e9668094023dee514afa0eacdf726550dd4b7df32efe99c7eab2b11153e2ddb796836b75a0674bce0df6b43b46c799f820ee4277a0e481ee74e52528de1;
    stim[16] = 516'h1d0f2a7cc4da10813aabc5e5bf5a7ef30f29d07fabdf2aa39c2608bcba6dc233aebc1ab39b3121db5ea6263622b1c51c5f622c49a4f708d7bfb376adbfbb7c573;
    stim[17] = 516'h633781b1450b0081c73157ef5f0f53d28a12fc2ce2051590a94da8f95903392705e18bd26826ae3c33e456fd975f49677672f979accf955ea06156201ffa5a1f3;
    stim[18] = 516'ha17211f7d4913fb7df343e5913fdb957085193c082e9ffa7497ca18ef72ae9937fdf79fdcd7ed38cecf2146d8f86f6b69f6465ebc258e532883dacfc3bc74c794;
    stim[19] = 516'hb0181dc15b5b4c3495aa209b86f31312f0894b6510ad79e8f86edbc4fdb0ea6b46ce755787a7cb0d1a840daee8ac87621e9d727cab0e9db8833f1cf9e05d044c6;
    stim[20] = 516'hbed87af73ea1ed87d4df54e0c28771db90e85774d3b696b3c020b25d84e42918f1991c06df91345609e3961c7a550c65013d98c47ae260c94b393e993cad85ea5;
    stim[21] = 516'hd0d2691ac3731c5ebf2cf0b7a7e854f009735ada0e71c86923167736c1d46e9dec9102580a0af9a9c8ed3caa967d51531f62c32d4ccb3d120d04f6b0266d8b2ac;
    stim[22] = 516'hf6713b23f1be60fcd73a76684a9a9b638086ed177bea093a358b8baca7916dc99fad5157bba0704ed9fba360e89ed387d43257bf4afbf35c27a4a917692c9ac9f;
    stim[23] = 516'h1b6b9100705adc126c60820711fe7ec5a70646bd4d2eea8247b0f2b9a962e55fe64d4bb57344116b0e1164a84fae79b016dbdf387f395dabb271b484fef9e5840;
    stim[24] = 516'h333f66d81578e3285be597b9fb6fe9e7816710254c141ba97651cad2a1c33f7d64639ccbda8c852f412f145f07e57d6be119ab9937ea62ba1f418d3cb55933d0c;
    stim[25] = 516'h440933886674653bfbaaa1977107e92c969e92fe94aad4c5ac1fea8adb4066aeca9d4a2064915011f00ae043dbab50c83b29ded667e864cd21a232e89313f07a5;
    stim[26] = 516'h1806c90b44f9aaa6686a85b0db58c8dbc80a2d28a11748f3f982c6157915116d7e1782bc8b8f3fd7c90cb3a3245faf7c3983a854716f35dd2211a48342e1225ff;
    stim[27] = 516'h32e02de95395ac6d52d5249b62a92fce69596a4d68e518741b914b4217dc81119ddf558d8c62869856e1a8e9be30bc7172a0c0f685810c57ecb7091263ad81d2e;
    stim[28] = 516'h0d7e21fb87e309b15ce8b54511c173a86491ce86d19b5657323a1b212e910ba9f0915b708170e964d93862ff32845952fa5d7b98438e6636273772621bba84321;
    stim[29] = 516'hc880add4f04b221963e06ec282321de249dbbefa9cbab9ff63a8f8909b94fefd519f5cfc8de382c66c1e1fa8209a236424bac942459a1ae7714db117d6ab3f3e6;
    stim[30] = 516'h7e977ea8584b2863048934cdb06b890553a5edf80448926196209270475d7465d4e65e5450d4258c3518fe577c60c627328eb5b2e2238fd9eae05002771c46972;
    stim[31] = 516'h9f6be51eae4e06adc4fc9ba92e9e48a52e38ae097844dbeda2d57edddc22c3a86afa1b7fdcd2a405df6e9942fdf6586b9712d586875af94e3a02a1153aca649c5;
    stim[32] = 516'hfe8827e1fe130b778ffbbd6f492a50d131211a39090254a49eb0461f377c9909caea20b38982bce381a4e3f787b271d2936064708c7c2709531ce2f39cd232927;
    stim[33] = 516'h6201efe8946bdea7b437afa8d6ccfda78f21176ca9b3535511b47d171be0822681c89b64c07c123f5082e1d6eb8ec92460d77bc4cde70d48b5128a17397a1875c;
    stim[34] = 516'he6b2ca08bce81933ee6ca8782d4e5b15ce831ec50fb75aabf88f13e842a58006f8bfd6ad6a26c68902961f8e108e508626b06b1bdabe37a455d8b60a72f3ccf53;
    stim[35] = 516'he9164d6bf06c6531b04ca06a376b191d11a3d4beca8f30c285dbcabd3eb3b3bb0426637fba688af3c5b35ecda955db6045f191cf4d6f1cc58913d667e40160b4e;
    stim[36] = 516'hf61865359d09c5de9ab29de5abe6d6e93afbfcc2f42a0ee5acf079c0c23e2a05b0730135365d902bbda1a1c3df875c8dea77936cb27e179d0aab7479365ce480b;
    stim[37] = 516'h7e279e82077c06e9057061022f29f2f7d8380b7a92973b58b44596b0d9794f4b5119fada748000e1b092f410119daabef765d4285ef3c84ec70ee62dd83c0e14c;
    stim[38] = 516'h00ce8325c36d7c9fe35803cf6196607001c262e675b2dede018cf63ead932675ee88d19602aba21c55e2a87c917769ef7b93bed187b60ba9af2d65193ba759926;
    stim[39] = 516'h66bbd2eb5f7875941c4b6dbd715ef471bb0231836e02cea4969977091aa57a2b05a69f1ceb3fd7b0f99d4f277fc1d8177ddd3976ed410961cb7afcfe4982c321c;
    stim[40] = 516'h767988b96311350daef31d486ed878882f842dfaa87a66c45ac0383b24948fef44f4f3394d172beb02849c17e7e6c29c19db80b4e3ec5cfc4e52c68ea2277aabe;
    stim[41] = 516'hdfc4f867b973b0b60ac3c78864f3ef99fd93d8095bf9455059d53bc4f8175990ecc6dda4666c4b6982414b7553c890e057bd2a30e360410c55efc66a854b4bcef;
    stim[42] = 516'h7827d0e132d826b4a398979d29ef1cb8ad6af8d28ce6a42071241749f63662e209eeedb6d03461cb71074200783d178d637d8e4e98c45e6e64452760257436708;
    stim[43] = 516'h8b6f7c310c792f68e6b2c2f1a155a76f18b8fbe8fefb29b66b535f9c24fab0f0784fd8a2f884d0c255a824702f816ecdb28614de1d68d2debf7cd05c616dec901;
    stim[44] = 516'h5d51caa893962f71607770f50f186706be65cda3b496228a2b8fbcf99b2806ef4025167d5c8a69eeb89a5a1ac5e364a0974b0a3ad450a46a1a88f21e2d801083b;
    stim[45] = 516'h8237a49333e04e7af19b1ad5afd7e0a8638232a6b886fc60c2d74a2aaf70440e5c3bf59051b5bbfb39176a068756215ae8f709ea74a0708716a34988c9646d75a;
    stim[46] = 516'h512ce01a4d9bb182095f61d51eb80ba90484776bcb470f757927942815efb060183f98736360c413db77beda5dfaac761184d52c3d42f37b7f476162e46fff4e5;
    stim[47] = 516'h3037725e9f3c0e75a14b8288b7bc288a25edd5005ea32dc3edccc9bb93e5526d8d34d98a101d8bd92ef61539cda5d9b5541417f6f8cf253d01bda0b8ab4f4a263;
    stim[48] = 516'hce70f5f34407cb26b80ca9652e10532c0580ea5e6eddcab72f2290a2683cd8c2c0104c1f99342aa35a3ac0e1bc6d8d53cb53d459f811a3919f60718c2eeb631cb;
    stim[49] = 516'h98d6af9e73c041374f6e0f64de9ca0237946a356491c8891dae426f130de18f4c49f6b9f1417be0cff391cf60d616957699e232a1b8f7098de0990e48651ade35;
    stim[50] = 516'h61f572baba051ab44cd7007d77d2f0af6ef20014711fe8e2fc732d41b187ecdcb748d37a479023d38dc7fea38bdab55c9223634e1e872ae2d3f80710cd8f8e5b4;
    stim[51] = 516'h8f652faddec0f83eaa21b079348a7658542f060d33ebbb84cdaf6c9fe395048dc5c64101359d666c1f6a8fdbe0680a52059ed96b4d7dc85f1d22b152f38a29767;
    stim[52] = 516'h049f74fa2a33bccf7c7d4fc2f9d353d289481e4f08ac4c532e3455abedcf7321563ec18ab2a90987dbd9f639cb521caf6086c2dcb91bc6a3bc8af08588be6bcac;
    stim[53] = 516'h77e255ccc3761dc1d0125bbbde28caa89a34aac3bad66c6c3066c0b6d792f0588ea0c9bc10b9828c4c69277eccd93b1b84add781e3dbf0a44068a11f8c9c5cdd1;
    stim[54] = 516'hb7103f74d6895d1319d95aed4f6364d1bdce5153887fcd790cf372d182308d5994ed531f90b4a4389c7d175fa7aa2e519e6c5eeaa5ba2f3130bd89278a51cd8c9;
    stim[55] = 516'haaed76480d13b7beacc8342a181364f53e3bd3b37a06f557085e342fe1fd11af835f915c20a49fae302ae672608bd618fdfc74c7c64f3044876e7ec122a642456;
    stim[56] = 516'h4a40e974d1537ccfea0249ada11dda44096559331b5db65ba65d9950079ddfa5517da9d0f8baceb0a3b2ef5489976e8d95fd6da9c5f7b8d121d032f8ef3e6842b;
    stim[57] = 516'h3b33cac21871c77a21ac55dfde5ff00447aae35ae15212f8f21af8b6d7fee85a80bceb2cf1d358dd07da8173782c76b37953cbc6c71ef6157b8b6693f5471b17c;
    stim[58] = 516'hcc01d0a89414c8d0ba80ab29656ff8b2cdd8ab9d25e550ba2f84258c080fdf911005040ac17ae3525bf44638fc44b686026185c79e9bd56e786a3c6f1f9e5623e;
    stim[59] = 516'hf8d5191496a148604dc43dc9ca187875ece33e5272966818f3c1f53858263c9cf047e725c3e18977c91147b02d268980bd2c11616937535033b95606fbeb5dc6e;
    stim[60] = 516'hb690470f1a4104d7fba2a719990ce7e45c7e2bdc2a573ac45106739c0236640c685578c348bef6d733ae7e96dff39d5c5f9a5edcfda80c172aa183b8bcbcf086d;
    stim[61] = 516'ha26bad2cf36cd4ee5ead4fc5ee7d76c70e55e46a912686b501b15a2cbc68929d4320be918f5000f64b6cc6bee9368fc17aec474b395efe64b6a5070dca58c4dd3;
    stim[62] = 516'h8cfb20f0133902b52bb3ffb31c2798870f4c35154dd20d9c9677413857e4ce2cc00d11fc2e478e83371bf14fce725b066c1167c9dcaed1f49f8ff654ec4f12461;
    stim[63] = 516'h620733f4488931b2873af56945d6a0c0255868981c5d1603f19988bb52d6008a94a4c1a2e85482b415825b65da73a6d10ea3edb13a338aef641d251d7c78b1e46;
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
      expv[0] = 32'hc4c4d403;
      expv[1] = 32'h50ec3728;
      expv[2] = 32'h84eb3bf1;
      expv[3] = 32'h056f900b;
      expv[4] = 32'h9f714801;
      expv[5] = 32'h6117ff0d;
      expv[6] = 32'hcd2cbac1;
      expv[7] = 32'h04d8a178;
      expv[8] = 32'hf9ce2f4e;
      expv[9] = 32'h71ded83e;
      expv[10] = 32'h3bbf326a;
      expv[11] = 32'hfe1e59f7;
      expv[12] = 32'h30a13736;
      expv[13] = 32'h1990aa1a;
      expv[14] = 32'ha7da83cd;
      expv[15] = 32'h66809402;
      expv[16] = 32'hbf5a7ef3;
      expv[17] = 32'h5f0f53d2;
      expv[18] = 32'h085193c0;
      expv[19] = 32'hf86edbc4;
      expv[20] = 32'hd3b696b3;
      expv[21] = 32'h1f62c32d;
      expv[22] = 32'h692c9ac9;
      expv[23] = 32'h1b6b9100;
      expv[24] = 32'he119ab99;
      expv[25] = 32'h94aad4c5;
      expv[26] = 32'h42e1225f;
      expv[27] = 32'hecb70912;
      expv[28] = 32'h87e309b1;
      expv[29] = 32'h63a8f890;
      expv[30] = 32'h048934cd;
      expv[31] = 32'h7844dbed;
      expv[32] = 32'h377c9909;
      expv[33] = 32'h60d77bc4;
      expv[34] = 32'h2d4e5b15;
      expv[35] = 32'h8913d667;
      expv[36] = 32'hdf875c8d;
      expv[37] = 32'hf765d428;
      expv[38] = 32'h018cf63e;
      expv[39] = 32'h7ddd3976;
      expv[40] = 32'h4e52c68e;
      expv[41] = 32'h854b4bce;
      expv[42] = 32'h09eeedb6;
      expv[43] = 32'h0c792f68;
      expv[44] = 32'hc5e364a0;
      expv[45] = 32'h39176a06;
      expv[46] = 32'hcb470f75;
      expv[47] = 32'hb7bc288a;
      expv[48] = 32'hbc6d8d53;
      expv[49] = 32'h491c8891;
      expv[50] = 32'h6ef20014;
      expv[51] = 32'he395048d;
      expv[52] = 32'h6086c2dc;
      expv[53] = 32'hc3761dc1;
      expv[54] = 32'h90b4a438;
      expv[55] = 32'h085e342f;
      expv[56] = 32'h89976e8d;
      expv[57] = 32'h7953cbc6;
      expv[58] = 32'h786a3c6f;
      expv[59] = 32'h33b95606;
      expv[60] = 32'hfda80c17;
      expv[61] = 32'hee7d76c7;
      expv[62] = 32'h133902b5;
      expv[63] = 32'hf19988bb;
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
