// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 486;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07555 dut (
    .in(in_vec[485:6]),
    .select(in_vec[5:0]),
    .out(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 486'h15c0de7d3abaa787cb6a2fee3e0b00418bb027093ee7592052249961e350c42802eba3cf05e3d9abc903106317db76bf69a8c4f0c7b9ff562d618202ce;
    stim[1] = 486'h2b891105014540828514f017364f408c2bb7717ebe42158fdf75642026a02ccd94cfcc9a8a901fcf2fa8bd6274bb559bd164fa09fe9241d52c431b676a;
    stim[2] = 486'h2e6fc650f5215080078bee96d0da1ef3d92a9b8a1676225f605df0e675b21351e778b785e66e849041ae24539b4211ddc4602716a47586940dd53d408e;
    stim[3] = 486'h25f4db7bfc0c0e03cc439f8da93e2e0b0b5cfd08b82bc1fe277986bc30156d56e9f5ea7a9d53ea7e534ddc6f624b4ff4620467b9857b70cc25ab3db48a;
    stim[4] = 486'h1789353760e6323a748dc1506b601d6d4ea9f7b3fd013a4db95aabf57baf4521ad5a2b97d43b0a3de1d4d2aaedbad09c5065ccdd1c30c005fba0216250;
    stim[5] = 486'h2257f068687b4f2e74451db171102a079e08dd22738ef26797320e610dde9a7174494825b467dc60657dcce05b64f96b788d54d463dc3d6e3509be8c51;
    stim[6] = 486'h0445d0f56c4d4c59e7793543c14a1c49ffc839a01ebdc09bedbb0c07423ad4be457d16778ff56536aefdd811e4e820f0ca3d90263c0fd8ab61c8283458;
    stim[7] = 486'h3d070b89bdbe1ba01416dae52b26b227bc2ad2838bdba29ed22be593e58c578c567cf8192af2778a5fb73ef858b05bcc92628194e0eeceaaab8698c5ee;
    stim[8] = 486'h1c0b54135660d3d0b6e2896b7f4072174a30aa5b608e2bd102dd1bb3885fc0e7b17144c1ec61ed2bb56e7383b9ef861b81b6ae42a1edbc29a8c876849f;
    stim[9] = 486'h0d0db684a21950a620ec383a21420f4039bcc661141bd1483ff1f240f983ad2eecffaf809e7d02e510ee08447acea78c54def9100073b9eeacc2d2780d;
    stim[10] = 486'h0bc5259dcb2f05d3161226728855c643bc168684d8a4bbcf1f6a9c8844420982537323c574f8feee0ac1baea49647215ed3d137873ae5e32c1be168abd;
    stim[11] = 486'h3b5f6305e6e2464b6ab3b847d92ce8dac7587e2b077dd87de4763035193926031aa0c24948d8190865a744bcfe515ca8dffd8571b7a32bb17bbf1bf5d0;
    stim[12] = 486'h025799b97f37a2d5fb8db46d717ac478a85a7fa9de1dee4d671f54459a98b3d4d3ed50fb0da3bedc54baeca35c12c1e7801c5b021be929c1386418a045;
    stim[13] = 486'h3058b6c97d3729a982f2a07ce48de78093a352bf030d982b06e7ac1790d8bc5c3a04afd108b9da7fad0c0b77fa83ab9ff41ec7c2bc69dccb107e0b87d0;
    stim[14] = 486'h34c806fc9472a821d164c43f2805c6d2f7273b8b4578734bcbc00775f05c9574b6af5638798b7520eccbe4b6a4d3a7988a7c6e6c4ec7179dc7c8c792cd;
    stim[15] = 486'h02a328d91059642ef528f70febbbe5e68ea4dafbd3c893f9c738bbc43ca4022472071fad180a6e44e69716bdc2ac3fb37b6b2b830e322be66f92000e94;
    stim[16] = 486'h39a60143b7364658e2adaf219d2f066c639b4dda9b903c91ea0430432b2e17e49cf8c40c8212f725557fed6338276549ab64f790f083a59b4055414542;
    stim[17] = 486'h0de325daa4eb7b6ef11b51102020ca6316241d5ecb53bcfe2cd8b21d15c6b2107b4bed7080a083fe0adcfee1f986c696a93b89b644dff9aa5d09b561d2;
    stim[18] = 486'h385635e9cf6a4c84c42a237ecfde65fde5b3bd2129c3528a3e599e1b042b7e7ba3b5f1e3b2368d7fde9659bbaed00abd93de02cdac1f201a45c76cb8fc;
    stim[19] = 486'h0ad885806c5799a5922f4ff1ccdf4ec3f626bbf00603d79e7a9a00275306d37ca75e160a79e8b31ee3521fa982b437e67351bff64d3ddcc345f55a5d29;
    stim[20] = 486'h06acae8f17ef0e85d08584ffb8f698ca5b5746d435bb460c3b38a659725d47b1662285da8187f240e9dcbfea829595fc8fff00f49bf7ef2be4886fd5f0;
    stim[21] = 486'h023266298270e0bcf83dd186dcdcbdbb3caa7932b2fd7c224745e4f0aa7d1b6b7bbe0aee3fe71b7baa96c7f143f63e9b66619d3256efb62e50e431071e;
    stim[22] = 486'h2873fd1f9dfdfc2beeb38584b99af4086e326b62caab41542b0640ba33cab30f90404fefa538d66a2c84848dcebb1b9974b792f1b28fc27a889945b486;
    stim[23] = 486'h25e71f5758e3c208304e5cef3ea366e0de2732ad71ac87f457150408994c9bacf7d8e286e299efc12f248750132fa541f566fe410a43c838d25a278006;
    stim[24] = 486'h2822bf2c8d3de3575a17234d78556678ab48d417417747dc34efa04b7713111014b36613a3ce80dc419a940fdbddba183d283f77ef05f98f0a70f1381b;
    stim[25] = 486'h296d309f2ce696c477b740b3311298f9452e0adf8f6e6629d3baf414276c227c60962b18832a5795f40aaa8cbb463516e581a4d51298e0cf66dbd28dd1;
    stim[26] = 486'h059b25f999ca5e7baccfb47a6282cd159b03af543ff6cf285f991cf00b56b9aa99ad990e1dc2cfa8a66e4e504a166df684291af40d0c302c04afc6e7a9;
    stim[27] = 486'h294d06be5518b375114b66dc612268a9a7b15172dac96b7c8a7174e709719371e3f180b7e5e4902ad00c8a4c3f5d6fe300dbb493cda0d82cbbec16fb69;
    stim[28] = 486'h31becc529957d4351622c952ea7f49944096078086eae868015c403a3face63294b0e25898871c3588f6c73897091727488c5def15fe84d9dc8869c75c;
    stim[29] = 486'h3cf98c6b3bb494b192e19a6f16ee576742e3c74f63fed5789801cd5e84b7e147f2914d7480e8df36c55dc01e2e96f6fcb7767bed4244bb5aee606a880a;
    stim[30] = 486'h1530c3d83fc9d0525385ebbdc5904c243e7939dc78fa978d9f61f05e638df7f9fb5b46a1e9fcfd1f581c942e87ec5c1a0f4c9cbd2fa2e2bfefb9ea1c6c;
    stim[31] = 486'h3375d24f01f3fb68a8ba6ad80602df708f481c710053349c98b05c556455050de8a99ca38bf6a6e0a5ac8abdb43f3cd6274806791c33c740ceec038086;
    stim[32] = 486'h301ab799ffea59bbbfd099aa6cc7869e40f2d41ea94d20680b038876279001150a3d392289a33a7115864f49cd8df67b4252bac7bcd74c810428c6b1f0;
    stim[33] = 486'h1a2941c6743d5ace718dfb7086deed99ced568ed7440fe201b0d6226db3d17f56e41e8c8034565e3ea79d17b6e58174a91125a0ff1e35ca12348a55760;
    stim[34] = 486'h3264e43f8afcf43407b58e822a84c6b7826881e3dca744b957b5902356fda22945af7d6f11f79ab15cd42b108fa91db4bc0be19966c45a3bff2490f200;
    stim[35] = 486'h180bc1497e1f8fe810bde519f78ec6539dc551b50282c40fa2b543f4d1e47f8c79952596806e20da01ea4ba3a66f7a62ea75c621eabdbcee82d8573db8;
    stim[36] = 486'h1f8a61d49a9824d405dccd1a01ba2339449971c5b422f45f04906dcf4bd2597ec1e01909c5819a71dc1e7e4b80a36c52aa9e46f004ec97d293fe693dda;
    stim[37] = 486'h3c185349c82fad3a6a50167613a43d4f86f80ec7cf4c067c1fa0fe3f5325a6465bff54d2b9d108e9e00afd82cd99219ea1bfce3668bdedb7f3b4b89a51;
    stim[38] = 486'h2dddee8e6af0511d54254f704cf921358452717b42445dc534a66a04564943263bcca33a01303e4712eff632c342bdc62170a9fb9249964eddc1d9ac14;
    stim[39] = 486'h15aa97c6f60e5d836eb48dc99d3d195de32d7cdd9c496f9de56ac67b6724f2835341466905605d75fccf53732d236c4068f1ef3b6cc25769cbc79ba5f4;
    stim[40] = 486'h3b9e0b8ccaaf02cefae5c72738da8cdbaec3ac62421b1b287662071f32d52dd00bf4d30e8924bf33f70e6a590711175c1e43e466cd25da95545496e27f;
    stim[41] = 486'h2ab439b38a26eeb291bc2807a41115c535f8bd336152dedf7d66e8894c402d67b0cba44835f8cdd492c42652231af988b0dc2ec6e9974b8f8271a05383;
    stim[42] = 486'h3571a30f3c7a1dda965f11a76cb93f0f980f198a69a34593a68e942fd1a096cc2ebe08d128cbec8d09e37f6bcae27a5195f59e47cc1bb657a43f0bc598;
    stim[43] = 486'h16f3540496e80f67241501f3914c80262dedd0c983bbfd52e516f2edc6252733b905cced4c553d1536b008ec281c2c5aa65d3c172dccc36e5c9c89e17a;
    stim[44] = 486'h12c5a46933a399b41e9b30adabac886f569f39fcb8965e40c971fe2c6fffa232e370108e42737819204ea2ca5eaa4bc728d73626e874f973f7f13e7e15;
    stim[45] = 486'h26c3970dbb2415ca4182f03fc57677587e97b6b2b664e16b89303db9354822022db9a1cd81e8067568325607134e934d0a207a82d480c8b0a076b649c3;
    stim[46] = 486'h04715359e912b340c162863670d784012645b345328c1b8a5428f727eef9f75aab61f6b5b5a43dab42dc8dfad50bee41943f0f5ac4c463670c41aa5ee5;
    stim[47] = 486'h36981ec738e3fdda6da1f40e55ad8ac565738a8726b4e3cedc94efced7232fcdc1dd69c3c35c48e0df8495035a96f71eb39e3721bd41ddcacf0366cad9;
    stim[48] = 486'h21803f949670f2246542139252cdc93ddaabd3c6e0b5e67cf3c96329a7ddd42c8426a8a236f0837a7c553d60fa08c0f6e8559d92f7b77dd206056bfb25;
    stim[49] = 486'h143a6eb054b05b7e3583c473ac1c39f7eaf98e505138232d59fa941e42ed9afb1b3d881d75569405dbaf5d420a169f23261be14150712de15c6b06ad71;
    stim[50] = 486'h1390d2aa1b9b21be75eef2f7930c9e4f97bae55c202a049790057be1a83565f52070af10ca647cee048d1d45f8ec9053ef2c04e4ac27736750f1344d04;
    stim[51] = 486'h274b1f020028c8c5ab9a2a97ebae5829b8f5c1a16732d33c06d0149ec187533090869d02632c99d0f13acd7e2e56805433b70ff38d4389a44d8b858f29;
    stim[52] = 486'h09110b82fbf209fe955c5a61297325011c5a83d16cccd0a1fa5aeef9b7bd2aa144ccfa10b758e8d9be672d1d8dded881b40416256976e230f83b9487f5;
    stim[53] = 486'h3de6e7d9cdff14fc18f68a2efe904ce4ab9443a6bb2bb2209aa05bad679deb470b777104a8d573c9d06e80b1be0fe805d55da654be867d23637f273add;
    stim[54] = 486'h184df90a62426f0ad9e3a3ea330fa216be01a6235e7353a455f039f3163ebd100463af0459781a5c34ca0c8fd79b9f9da134f4866d64a07bc5e0a22fea;
    stim[55] = 486'h3e3a8ca57fa732319029cf494d4cbd76b86d1ccd4ce8fb9cb5e50599266d534b0b614313b23b36940de8f930879aa75558afceb8bfb1db01b87d6195df;
    stim[56] = 486'h1afc8ddb9419fc9cab7c9c5c16902bb30c1c2ad6b6daaa818a94b93f996f6d9d67d00f8fb217132c084d96fb692a6b9b9c3bd9c4cab09b3c8711a383ef;
    stim[57] = 486'h132ce8eb4d03521c3d094a4156e78f69dae16c45d3a7471320a88c6719ff80a95ca8bfcd44bcc318019a69c0b2d02a7d55a1e3d1a1b5de717fee4fd161;
    stim[58] = 486'h37f57e0531daf6a6c9131f69ad28cc87215f1a60e29195aad8a0e7d0d5f295c7e440e1e30c8c1afc9eb7bb4156b41783bd5a1a93749ef85c82d366affd;
    stim[59] = 486'h339b2ec78ba6656cf15efa1a24e01cc0078eb0b855c447a211ef37f5f0434900d6084bddf0512637b4e3f1f8d98250c85f31802d4fdb1da97dd68e9025;
    stim[60] = 486'h1f8034ff383cbb9bac2199533b00d14922fa2a1c7c5fbb2451303ed2a48c368e3ffe7106f357b1b240921571e5bddbbbadddd8d2fb7ea56598c9f4c9bd;
    stim[61] = 486'h163df1a27e874af9d1f786944965afb69459c11421a2b7e97777867737196479db1277c137a3ccb10613c0de011f54f9f6069c8d08acf5c2d8f1860483;
    stim[62] = 486'h3a6c17d96803df5bbbbe06965fd2aa2373c6778e5441ca5bff010b99ba8ae741df51d02f5b4b72dd2e9a597ac0b56a5b91675f0b54f21ca39bee9a4d0b;
    stim[63] = 486'h2aa9a74b51ec26554ee92787478ee6154a318ad880fa38de0f5e0465430964a1894c0cafdf8399e8f66d23018eafef2ab8e8de405d036fdaad999ee90c;
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
      expv[0] = 12'hf66;
      expv[1] = 12'hxxx;
      expv[2] = 12'ha12;
      expv[3] = 12'hd89;
      expv[4] = 12'he5f;
      expv[5] = 12'h252;
      expv[6] = 12'h26f;
      expv[7] = 12'hxxx;
      expv[8] = 12'hfd0;
      expv[9] = 12'h944;
      expv[10] = 12'hxxx;
      expv[11] = 12'h925;
      expv[12] = 12'h086;
      expv[13] = 12'hf44;
      expv[14] = 12'h83b;
      expv[15] = 12'h290;
      expv[16] = 12'hd01;
      expv[17] = 12'h1ed;
      expv[18] = 12'hxxx;
      expv[19] = 12'hxxx;
      expv[20] = 12'hxxx;
      expv[21] = 12'h2f6;
      expv[22] = 12'he4b;
      expv[23] = 12'hbf9;
      expv[24] = 12'h505;
      expv[25] = 12'h58a;
      expv[26] = 12'hxxx;
      expv[27] = 12'hxxx;
      expv[28] = 12'h258;
      expv[29] = 12'h8ba;
      expv[30] = 12'hxxx;
      expv[31] = 12'h019;
      expv[32] = 12'hxxx;
      expv[33] = 12'hdc2;
      expv[34] = 12'h3c8;
      expv[35] = 12'hxxx;
      expv[36] = 12'h6d0;
      expv[37] = 12'hfd5;
      expv[38] = 12'h925;
      expv[39] = 12'hxxx;
      expv[40] = 12'hxxx;
      expv[41] = 12'h2e3;
      expv[42] = 12'h64e;
      expv[43] = 12'hxxx;
      expv[44] = 12'hb1b;
      expv[45] = 12'h22c;
      expv[46] = 12'h67a;
      expv[47] = 12'hd38;
      expv[48] = 12'h525;
      expv[49] = 12'hxxx;
      expv[50] = 12'h09d;
      expv[51] = 12'hxxx;
      expv[52] = 12'hxxx;
      expv[53] = 12'h92a;
      expv[54] = 12'hxxx;
      expv[55] = 12'h353;
      expv[56] = 12'hxxx;
      expv[57] = 12'h252;
      expv[58] = 12'hxxx;
      expv[59] = 12'h1e2;
      expv[60] = 12'hxxx;
      expv[61] = 12'hd70;
      expv[62] = 12'h65e;
      expv[63] = 12'h9b4;
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
