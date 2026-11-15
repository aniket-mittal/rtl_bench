// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 347;
  localparam OW = 176;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_007959 dut (
    .i_clk(clk),
    .i_rst(in_vec[346:346]),
    .ar_dma_write_addr(in_vec[345:282]),
    .ar_dma_write_len(in_vec[281:262]),
    .ar_dma_write_pending(in_vec[261:260]),
    .ar_dma_write_data(in_vec[259:4]),
    .ar_dma_write_data_valid(in_vec[3:2]),
    .dma_write_done(in_vec[1:1]),
    .dma_write_data_ready(in_vec[0:0]),
    .ar_dma_write_done(out_vec[175:174]),
    .ar_dma_write_data_ready(out_vec[173:172]),
    .dma_write_addr(out_vec[171:140]),
    .dma_write_len(out_vec[139:130]),
    .dma_write_pending(out_vec[129:129]),
    .dma_write_data_valid(out_vec[128:128]),
    .dma_write_data(out_vec[127:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 347'h46aefa4f8c5d85fae07de7149e3f27c971bf86707c51c7bd8bdde5298c29e1077f52931e18076cf31d1ac3c;
    stim[1] = 347'h4d30c5fec12f26d39d1b1415c7df0d4db26f0caddc02de9361a91e88fbd0847c6b3ac09d2d27bf1a0c424a2;
    stim[2] = 347'h10e266eb7c2f56a01f50d3405b408b78c61554e8e055d477b50f14099aadb4580e25aab99038cf5f33d7091;
    stim[3] = 347'h18b91265d5484d91a87e26020b4c5d56b0e7c7ba283ab58433567385dffa76620fc053f91933acb8abbdb9a;
    stim[4] = 347'h178ac02d7e0a938f12d88dfb987018ce0bb435d08b7b3c00e946bf156a06def8c894740c244682f79d3caf6;
    stim[5] = 347'h131bf8d385954a0b245191ba740aa125eb41f0420d738429d8f68e9ba0218d36062f1ae3217f901972fac8d;
    stim[6] = 347'h1005822546f2132e1e3ea2d816d92e8a719bc19bf528156c60b949e28c3b57c5047fb51b7a9a028ef826a4f;
    stim[7] = 347'h1fb800852339001b63d6a94de76aed8ed82253c0f343de75d4d16239a2fdfcaa16b1df8f870b05ea4669c9a;
    stim[8] = 347'h1987b8879794afc36411f2439d698d2b29f11d0520e878a558a868c74cd0efc8143d9acf92c96b75cd264b3;
    stim[9] = 347'h1761a5489fd9d715d1a9c052f1be7eae121be72054d454bc31485a6c4909bda529d7cb3c33d9108610b5bb8;
    stim[10] = 347'h0502a10b9620b27c117d09d79ed7cbc84a03406637ab7fbbcfd81c3b826c34eb444b331180abc022f245a15;
    stim[11] = 347'h305b45ffaa848adc0b66d8303e95889b5e035c1604bc3751fc50eb99b9fceaa2db098fc3bda0214def98f5f;
    stim[12] = 347'h06ba5ff1fb020c036e24609912b9d10bd9f31f7dace695022ee68e5a28d39857a0ead9ca593989aa078ef3c;
    stim[13] = 347'h1d144d6fd2f3135809054019a46ce93d87156f601da2036b27251f38d50bfa87417cd6efd90af0c324eab03;
    stim[14] = 347'h261d765ddbf88af57d3789afcf180bfa8ce890b4c9b3592870ed2e0eec3c1a970b3f3ef793f3f6a30b047f7;
    stim[15] = 347'h3bf6c335e6371b068f8b3acb5de8002574b121c114906db22f119ccd92e19c9511e28ccae32e1ae64ec9046;
    stim[16] = 347'h278d5693fe9c2303db425ec3d71d11f64822665b90c63e22545595ccd13cc4b962027e142085b19d1b3823e;
    stim[17] = 347'h1e14baeead9c64c94b3cca5a6f70d31774e8e9d9b1c51685d18227061bd8a9ba2b85677fdf67db82fa663f2;
    stim[18] = 347'h282483525c70145ce5a004da514c1627cb2372602be7716f36b58841625e78a60e48ccbe65792f593115ebf;
    stim[19] = 347'h20f96841d90c8fd3e999b528df9452a69576737316479c5c7c49b1981611cc0d72b57f3646752d18f34eb7c;
    stim[20] = 347'h048d5663d97ee5d74831d6fac77cae9e7dddd47800158d8ed3f226cea2922d6eaf9d06b25a05c136905535d;
    stim[21] = 347'h396998f82da2aafe30cf71525f0c5599c5091a121a9c006021bd6b3a4451ed98c35c933ef324c54e417895f;
    stim[22] = 347'h3577d6695a107e7ecb6a66fafe254e4f2154782d0194292fd1b9c9d07b3e02db7cc104f0dc8b7e43cfbf81a;
    stim[23] = 347'h1e57902af57209ef1d95f47ce98200a4ed1b45e3e59056f327b7bddba443f21e29e0c9603a1bc05ee57d8ca;
    stim[24] = 347'h0029df65e223d769dd6dab949eb41e5f17e5d857943a8ecccd5df19ef4374318046bbf017253cb548f9e5cf;
    stim[25] = 347'h3ddbf7929544ccd77a20d4e16fa54c30c64f3b6d2c3cd458fa2f51aaf2b8207acd4dce40e6396102f57559e;
    stim[26] = 347'h02292b46638bee8fe12fac1036241b9b31b1e5f871cdb57f946c02bd8b668c9051c8663c59ae0bd47e5c24e;
    stim[27] = 347'h05d7f7051851fa3c7a3f0035ce904029f48162a8885e4c0eb61db12800b5eb66c3740a6094ff2dd2d7c058a;
    stim[28] = 347'h25f27d92e17fb96e75095802e657e1dafd4a9d0a75c2e99c9bc3e400d7eb1b1dac3aef08b5dc6c9a548e7d4;
    stim[29] = 347'h1e11884587411db4052b45ab5d93c67bc17d77392c0297e9cce24b5f35e7f402682cf6ae30db9b9a8418d00;
    stim[30] = 347'h3148ea6008c0a7ebc685d33f380e3c9813cfc8755976332fe9b47ffc04c430b43b1bea0c0fa5f5e50c2cc3f;
    stim[31] = 347'h09f7454405c2adf997b9c33f18d6891c90986bf3e0747040b6e8219ba0c5f5245a811fed2dc08f4855f66e9;
    stim[32] = 347'h253028a791a4610ffc09a493ede1614d74c521621cec3e2b8cb5e4a1501d55b3aad58419341c5b31dbed073;
    stim[33] = 347'h1b97b129596e7a7a550cbe80ab990c73a70d07185991ec7ad5f378ef94a8e68aaa000cdce6b2c0d555f2546;
    stim[34] = 347'h1a897acb699ac9a09dfc99ee518f1f1329a61fef1fe54e9669994e6a3a2d03d45fb8fd9a6bda6b790aeb86f;
    stim[35] = 347'h2f95c03e9434a18557652b6282f2f474870171a72b03e2b588d22419e166a11b4cd0ee96fdfd3bf12652802;
    stim[36] = 347'h2f4515134f71d928522ef5cf364067b6ef8055fc7edd488416c5a82afe945edf3686734490a99b87f4ca414;
    stim[37] = 347'h20d1521fa2998b6867a2e34d1e35a003f6f56823dd16c8dc3e98a238fdbbc8bcfe379f3966e1139a827139b;
    stim[38] = 347'h07b9f18472d5d160716a0b70c98ffd8737f0d7dea40b627191ccb05054a2d9a1326fb3ceb60aa2f1e91eb01;
    stim[39] = 347'h353561028df2305c5c1987bb885ff83d02538d5570db41c4cdda2f20062cd0e17bbc5400c66301ead0f98a5;
    stim[40] = 347'h3ccc0f7e0beffce47749b1005cd2846806972663d1612cfc010a32ec7b7393b76eb863a4dcc42ac2b0951aa;
    stim[41] = 347'h3dddff1767b27f889079ec6ab91e73ebd92f8b372ea4c6d08fdfdf9bd3812a1bedd07e35d7b9c93ca0524b2;
    stim[42] = 347'h0ebf9fbf80c25085c2121b6d8eded140ffdcd848438e2415aef395fdaf6f224e52823e39860a68816d98df9;
    stim[43] = 347'h39cfff46707c24c5c9005f07e736ecefedb6e227287e9d70a2a80441fc064b21ef0f6b0d73a0d2524ed5fba;
    stim[44] = 347'h174961366f50b8b18328f1888a89ead6ee250bc664756e2ff7f41eee257912bc73fedede06743efc9a0fbb9;
    stim[45] = 347'h024de7fbe5b89aec4f5290d26eeeca36ff7393a74eb20152c92b4f9b74a85736be296f47d71c1f001f7bc3b;
    stim[46] = 347'h04c9a44cedbd309ba95a6ed921a859fd7bf3bea07777e9cd5750725cfcdc2394a80dd26170ec8a14124591b;
    stim[47] = 347'h0df5a1b800187e53dc8e23c9486610c434f05ade4e891b5d8d7fb5bc30bdea0159d9856b96181aa7c48d012;
    stim[48] = 347'h18e8e14be12a1a5f70cf5206a2bd6ba2b55ac1dd7ced6a38dada71d8f7d34ee676edbc7fe35865ad96a160c;
    stim[49] = 347'h009d5a8f9d9f3904db379a5300c7767b8bcf51e79de0a56bb32d1f6f2d5188dc837749a1b855d068804a0d9;
    stim[50] = 347'h396d60c2cbf165d61686cd9706fbdd959b66bb2064946e0581332ff0b2461e1afa3ea0ac0f2be5f6c0e2510;
    stim[51] = 347'h2974e3bff7892844296b16bd44cf4131a3e34e63c0507300288e5e8065f81c147c1b9d07707e0ec21fbf582;
    stim[52] = 347'h19a81fa1ca77b7c55a699a0f2de83b5cf9a5e91b3b40da9cfecef9d9ba599b4a3ef944c69789910fb1946f8;
    stim[53] = 347'h138b19458e3c982d4dc20fb1ea127b5f6ce374a6e985d879cd6bd75d110de2fdde9aa9a6007a673e64d68a7;
    stim[54] = 347'h08dcb4c9c4d763eeef240512e2230c2ac80e9788aed628ab895f06c894e285439bded3deaea8dc9ec3b8e03;
    stim[55] = 347'h17c5720ecc7a272277085cf5d0cfd52d09be554f3bf9f7034a38aeba8c83bcf9734b50d8acf52dc3141ebb3;
    stim[56] = 347'h321f9f67dcf1eaa4a65eced0e3ad2ef4112937b1f01daef2480ec05367e777667ef8f4f637d3160ea6465a8;
    stim[57] = 347'h028fe5dd880e7d436bb2940ca7173b5df1582fb1d079edb0e2c89c665c1263f1d0af1cb6cdedc2e2b2e380b;
    stim[58] = 347'h0d1846da87464647c90070fa384f186242a163b9ac84a78b721235af392bdaaf367fa0905f7b3ef1279f619;
    stim[59] = 347'h24ad3e594dc4cb7c787f2086eded8a013e3736d5b052f75910ac670d65dbac4eb8eaf1d3015d0aa1dd74c9e;
    stim[60] = 347'h1381eced47b0b3e273ff278372fce194c32c770700086ba596c5419f1b3b1108d108630a67aebaed9c6bec9;
    stim[61] = 347'h18942bd6bb0b4d05ae9fd4a4690c8233525b40ed7e666ce4abdf42620cdc03b8965108c45d4ef91915a0c54;
    stim[62] = 347'h06132a35c5f05b736fe4481630d9e849ac6774f8e779f372fb9ce568d93914e1e94814a3bc7fbb71e04ca5b;
    stim[63] = 347'h3654b182279587a69f0e140124d0ff9fcdb4663a81c752217ac6c1bc997768ac83d6174003a42f94f5e08b1;
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
      expv[0] = 176'h00000000000000000000000000000000000000000000;
      expv[1] = 176'h00000000000000000000000000000000000000000000;
      expv[2] = 176'h00000000000000000000000000000000000000000000;
      expv[3] = 176'h055213646e2485dffa76620fc053f91933acb8abbdb9;
      expv[4] = 176'h0f82a4e3c88f156a06def8c894740c244682f79d3caf;
      expv[5] = 176'h11655282c1939ba0218d36062f1ae3217f901972fac8;
      expv[6] = 176'h11bc84cb8ea1e28c3b57c5047fb51b7a9a028ef826a4;
      expv[7] = 176'h08ce4006d6aa39a2fdfcaa16b1df8f870b05ea4669c9;
      expv[8] = 176'h15e52bf0d1f0c74cd0efc8143d9acf92c96b75cd264b;
      expv[9] = 176'h07f675c579c06c4909bda529d7cb3c33d9108610b5bb;
      expv[10] = 176'h15882c9f0d0b3b826c34eb444b331180abc022f245a1;
      expv[11] = 176'h1aa122b706d999b9fceaa2db098fc3bda0214def98f5;
      expv[12] = 176'h0ec08300d4615a28d39857a0ead9ca593989aa078ef3;
      expv[13] = 176'h14bcc4d6054038d50bfa87417cd6efd90af0c324eab0;
      expv[14] = 176'h16fe22bd578b0eec3c1a970b3f3ef793f3f6a30b047f;
      expv[15] = 176'h098dc6c1ab39cd92e19c9511e28ccae32e1ae64ec904;
      expv[16] = 176'h0fa708c0f25dccd13cc4b962027e142085b19d1b3823;
      expv[17] = 176'h0b6719325cc8061bd8a9ba2b85677fdf67db82fa663f;
      expv[18] = 176'h171c0517300541625e78a60e48ccbe65792f593115eb;
      expv[19] = 176'h064323f4f9b7981611cc0d72b57f3646752d18f34eb7;
      expv[20] = 176'h165fb975d1d5cea2922d6eaf9d06b25a05c136905535;
      expv[21] = 176'h1b68aabf8f733a4451ed98c35c933ef324c54e417895;
      expv[22] = 176'h06841f9fba64d07b3e02db7cc104f0dc8b7e43cfbf81;
      expv[23] = 176'h0d5c827bc5f4dba443f21e29e0c9603a1bc05ee57d8c;
      expv[24] = 176'h1888f5da7dab9ef4374318046bbf017253cb548f9e5c;
      expv[25] = 176'h05513335d0d5aaf2b8207acd4dce40e6396102f57559;
      expv[26] = 176'h08e2fba3ffadbd8b668c9051c8663c59ae0bd47e5c24;
      expv[27] = 176'h06147e8f1f002800b5eb66c3740a6094ff2dd2d7c058;
      expv[28] = 176'h085fee5b995900d7eb1b1dac3aef08b5dc6c9a548e7d;
      expv[29] = 176'h01d0476d0b465f35e7f402682cf6ae30db9b9a8418d0;
      expv[30] = 176'h123029faf5d3fc04c430b43b1bea0c0fa5f5e50c2cc3;
      expv[31] = 176'h1170ab7e69c29ba0c5f5245a811fed2dc08f4855f66e;
      expv[32] = 176'h14691843f9a4a1501d55b3aad58419341c5b31dbed07;
      expv[33] = 176'h065b9e9e9cbdef94a8e68aaa000cdce6b2c0d555f254;
      expv[34] = 176'h1a66b2682c9b6a3a2d03d45fb8fd9a6bda6b790aeb86;
      expv[35] = 176'h050d2861552a19e166a11b4cd0ee96fdfd3bf1265280;
      expv[36] = 176'h03dc764a1ef72afe945edf3686734490a99b87f4ca41;
      expv[37] = 176'h18a662da12e238fdbbc8bcfe379f3966e1139a827139;
      expv[38] = 176'h1cb574581a0a5054a2d9a1326fb3ceb60aa2f1e91eb0;
      expv[39] = 176'h137c8c17198720062cd0e17bbc5400c66301ead0f98a;
      expv[40] = 176'h02fbff3919b2ec7b7393b76eb863a4dcc42ac2b0951a;
      expv[41] = 176'h09ec9fe229ec9bd3812a1bedd07e35d7b9c93ca0524b;
      expv[42] = 176'h10309421721afdaf6f224e52823e39860a68816d98df;
      expv[43] = 176'h0c1f0931705e41fc064b21ef0f6b0d73a0d2524ed5fb;
      expv[44] = 176'h1bd42e2c68f2ee257912bc73fedede06743efc9a0fbb;
      expv[45] = 176'h196e26bb12909b74a85736be296f47d71c1f001f7bc3;
      expv[46] = 176'h1b6f4c26ea6c5cfcdc2394a80dd26170ec8a14124591;
      expv[47] = 176'h00061f94fe22bc30bdea0159d9856b96181aa7c48d01;
      expv[48] = 176'h084a8697df51d8f7d34ee676edbc7fe35865ad96a160;
      expv[49] = 176'h1767ce4137986f2d5188dc837749a1b855d068804a0d;
      expv[50] = 176'h02fc597586cef0b2461e1afa3ea0ac0f2be5f6c0e251;
      expv[51] = 176'h0de24a110b148065f81c147c1b9d07707e0ec21fbf58;
      expv[52] = 176'h029dedf15998d9ba599b4a3ef944c69789910fb1946f;
      expv[53] = 176'h138f260b520f5d110de2fdde9aa9a6007a673e64d68a;
      expv[54] = 176'h1135d8fbb406c894e285439bded3deaea8dc9ec3b8e0;
      expv[55] = 176'h131e89c8985cba8c83bcf9734b50d8acf52dc3141ebb;
      expv[56] = 176'h073c7aa92ecc5367e777667ef8f4f637d3160ea6465a;
      expv[57] = 176'h12039f50d294665c1263f1d0af1cb6cdedc2e2b2e380;
      expv[58] = 176'h11d19191f070af392bdaaf367fa0905f7b3ef1279f61;
      expv[59] = 176'h037132df1f210d65dbac4eb8eaf1d3015d0aa1dd74c9;
      expv[60] = 176'h11ec2cf89f269f1b3b1108d108630a67aebaed9c6bec;
      expv[61] = 176'h0ec2d3416fd5620cdc03b8965108c45d4ef91915a0c5;
      expv[62] = 176'h117c16dcd44868d93914e1e94814a3bc7fbb71e04ca5;
      expv[63] = 176'h19e561e9ae14bc997768ac83d6174003a42f94f5e08b;
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
