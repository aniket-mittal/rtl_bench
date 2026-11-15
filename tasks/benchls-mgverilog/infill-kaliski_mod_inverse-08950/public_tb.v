// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 513;
  localparam OW = 257;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08950 dut (
    .clk(clk),
    .reset(in_vec[512:512]),
    .rx_a(in_vec[511:256]),
    .rx_p(in_vec[255:0]),
    .tx_done(out_vec[256:256]),
    .tx_a(out_vec[255:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 513'h17982be57a46ecf4b96685ad952503261927944b233200e91972e4fe042dc9cee1b59fbc62664890bb391286e8f610d23121b1b8385a8a74edcd0a5683509aed7;
    stim[1] = 513'h1644d7a22249772bbaf3a286d2f7201a9aa037764b88309679df9f27880dc11d4a0380cf51e6060d3fca251e105c765731bd79b65fef2ebf286dd5dc3128aff24;
    stim[2] = 513'h009b0a0f49f2aa0fd10a599c8f2852ac54a73014caf1c47cb3105f3e723fa55cf3f2c31f5b91291ebdb2cc4c09358ae3a54d0bde0f2f06e412bcd9d38cc9a2172;
    stim[3] = 513'h05de94b6e314d1eccc4e30ceb9e2a28d0cad4adbc78263b7b9f84d9fcaf8c4bba70ebc724a430c87cff4cf57eedcfc0b860f6797abc07f40652b6af6ac1148ed5;
    stim[4] = 513'h0ac0b61ab1d471a19ce6fb5076aaa571f02b817e457dd9675e8576bfad19e7e8fcc4bda8b82801df0f2a62d015cc449e828839db507a9b95a2c23d1b9f1187fbf;
    stim[5] = 513'h09f3d8c2c8e379b321b3d8441596ea9e997fa8d5561bb2254b76b777dad4940f32f1609cff6a0a483150b9521dc4ec0bf350a98fa2011ece35337bd4b57b94a4c;
    stim[6] = 513'h0d964c59cb81bdd360bfbfda94d928923f96e34e1563f35b175ac6ae2541edd48ff1165a2cb0e7b15fb886465c621a0fb8f54cda225be2237d7e68befffd68b73;
    stim[7] = 513'h06573920f1bb2fd255c31ccf87ea8568744e7ba81e0e9e08fc4202def0a7c0288cf9664af27b92caf7f480d2c08bed91a325a1614cee6a9c85e54afc37dda8f92;
    stim[8] = 513'h0d75de162b4ecd3129bdfae4c1c21c027aa99c806e4d1aa367805f537b84b2911443f537568ebbc8a733eccf72fad671c7964c344ce6cb91ea6d7dc6a3ef0967c;
    stim[9] = 513'h03ea1ec9b2368aec8ce5f8173cef5c7d475b3b42d4804d573a760d37e11cae75bd0dc765838a09bac568c5901d4afccedc0e6df63a0dd61baa29d31ce92a560b4;
    stim[10] = 513'h028cb8f4b63e34acf2ddc3e95d022e22fd40e2ec84fa7c936c4c7e93ba4bd00d74ed2e3624f3eb2172babf6b82ad9471f817e509d38ecf180865c5a89bfe83308;
    stim[11] = 513'h03c998c214066b58a3c857888d3ddc3fbb3bd1c25882ab5ae8a20983eb1b24e01fa9d01363f9af7d7b4b5457aabe0b5200537b9ad98d3032b1e8827f92037cdb7;
    stim[12] = 513'h0cc12af569442e2136f16bb85004770d86123c8204c033582317f9348825e5de1a35287167c29e30cc4048bda66cf177aa575338c2e632031cf1f39ef2b5430cc;
    stim[13] = 513'h0bcab253b3a0df8f4760f9cbc2596dc3295f05444e69187c42b9fd9c94c05d573fb0cd7346a5132d6c69db2c2cdb1127ea1ca35b3d3aad785ca3640c457e8418e;
    stim[14] = 513'h0d56796ebacece170dd7cb62023ea727e52d19a2de300ed7c14f626cd58251d5e25fa2914a0b9da4b5f734f9454ddca3c4533c58c46254a877867c0b196ed0b1e;
    stim[15] = 513'h09e3d723e945d9869555e66e6c258dd64f9aedca41bb65e7ecc1c04a415c3d6a4c829ebb508a0ae3ce8dd9b039e27a52dc92b4d6ca31fbc3c36de5210b7160e6d;
    stim[16] = 513'h044804e94f7bc454a383f9126c6e3c42b4267f7dfdc4392bd9209d1cb9998987df2e88da522a96f26facb8ed9cca163b888de67c154168c0c2f16d22db7a46549;
    stim[17] = 513'h020b350df32688471e2420d72259e95a0e53640d1bafc5c4d8b893a7e6e6ae06fe557a2601bd48c8387c9054d86d3de35aab2e52f2368672a501f552c115152e7;
    stim[18] = 513'h009c77b1a4aa0646e5fe0c1e5f0bace7fd1ec6575931c58361c54b7261d98dac1f87fa76b045636c2d5b83c03ab79c0369a5171ac1f077ee16f5b14e1403344bd;
    stim[19] = 513'h0abea3f1992d34a9e3c0b3a220688a54e3764b4624cddd70b2db645633efc0c411ba444b76839c1ebc7b1113b1d6178c9b57e7e42a700b2ab6de4dfc6bf4110c5;
    stim[20] = 513'h0d3e42028fa4d5bc1cf28aee1f921ae0092e4c3f74cfbc4eb76256e1cd12379946f5c79a13604580391d0dafb876b5f12ddb36c15b4b5226d6f74d4d8959f5396;
    stim[21] = 513'h012974a6ae6ec5a69e86cd8dc2f7f5817cf4f52a29c747f3016d75ae5c4e50a1216d80ea0feed615eaa937119d6786c820bd20a6f3835341759055e460f99481e;
    stim[22] = 513'h0de9d0a8d6f2764f6952236fe8de9e5b62e39874fbaa57b133b2ae2c20d5084121d480a92da6898bbd13fd416ce20361db6fb19c2af361c0af1d65b6d96013fd5;
    stim[23] = 513'h06035dd06eb77a9fb99057faeecb0584c0907553b3216571f2822b710fafc3049cf2f9b5243653775d9e5af9b37182a3b52a447f55dda9666c79c0f2b9d10861a;
    stim[24] = 513'h01d8c0d88db5c5174fd438feda3c65200b745be0550c11fa8a74129b589803176d10f51bb8a31063163185c9b27f5a3e42a1498bdc91a11136e4ca28fd9ad8245;
    stim[25] = 513'h0cf3e9d90664e69807471f019193a6b96f4c8e8403f6b32667d203f334fd2c6ee93a2b9894bac56c9bf29c060851ac95f87994e710585556fd7adc227c2c323f1;
    stim[26] = 513'h0ce0f62f9ffb0e1d966021c8951cd6cf2db31322ce903efff6796bf1128526c75e8bd744cab10bcabefef4672cb45cde69e4cbb27f5b818b81dc125ddaa09eba4;
    stim[27] = 513'h0215275a948c1a6ff371a9147f91b8908429ecc931adc882e38ff52fc6eaf22a3114c75d7137812322892c6bb43c8cc0cab196a0985efa669539f698c69959e68;
    stim[28] = 513'h04d69b3ff7862cc0a440543676cdb145854631df68623907efcc61720e98ef82f19cb7ce7efa9082a2c9f3422f9a9f956cf2eb0bfbf0afdbaf9125b4fc5e0f962;
    stim[29] = 513'h0bb58eca45bcf73b399ae71842aa611c0388a196447f108527b16b8fd31de23cbd386ef0f101353bcd374190da9f1cab812d80ad746249d96456f90409c6811d0;
    stim[30] = 513'h0215aa41713937aef006bc5adde4f0b8e86b10aedaf020dc6e5f29eb678acf306d4022e3762c0778c63c56031e6f92a2dcf9135d9f320eb7d1f96f04b38d0abe1;
    stim[31] = 513'h01a4dfa4b608d43208f3f5a42775007dbcbb95530044cc7f741d14230b181245b367a238f85481156e843e55cc2171ef7a20519f3a9e887f0796221bdae842b89;
    stim[32] = 513'h049d3ab64e3f0c495833708d286c37bc22bd96b055f9d306d72036c0dd3037f3b55c411df4165c11d90e5c925b55901b42b00a2e2d6464b48e62e38294e946232;
    stim[33] = 513'h00af0436ed305306628f7483b8f35fe7670a7346ee27cadf8c857957504aa3fe834430cc9291a8617dc129888c778457e6b9c95027f31e20d5ef96d3322f0b0a7;
    stim[34] = 513'h0d056724eb5c0d0c5a3f8a429c4d64e337e15ca79279cc9da7e4f1b0d13800766e1fa1e9738649f0d7c6aed859b044075eef6724405d9ac77c15ddcfac00d160e;
    stim[35] = 513'h099b603f1b9a120f38cdd6cb0fb2983d109b7a1207f7dd0557f15b7f10a74a59f9809a85135ad8de3341161b4fc30fc5e2765925725e53cb91537e006af6f5197;
    stim[36] = 513'h02d1d6f8e59997de9c2b47098014e2c8ed7c51a0f40ed8dcd3996b3783d1f1794138dec20bac8408e26cbe065d388a2d48764a55ec46646458c7e7c9f085fa433;
    stim[37] = 513'h094e4c2da2c79c3cf98d525133df4296651c0d652e975cd2df565955db8d784db4476faa1580f39fc22bc7b2aebcd40c67287189e36e55ebb38014061fd419d7e;
    stim[38] = 513'h0698072fad194b7d9462f54b7d2231a7c2965d214f2aa120c3a57669ca6d52ce0f9b0f83eb32d730e25b57d93d1dbb6fcc9374958e4915c141554a9bf8d281624;
    stim[39] = 513'h071c115fe5893de307819da1d7a880c9c6f7ace5072d10a48b9b992f4a62700ae47e540a741a190c91858cc5bf4b9c57e0531c5d4d22d29fcf54dbb507606e36e;
    stim[40] = 513'h0cc5a01af1678ecb9d366faf17a9fadfdd3be584ec6d7f99d21234b1424112c8141e163f555bde11567f935976e28481fd862a1b3ef54e1d933d8fda046076180;
    stim[41] = 513'h062c97a19eebffd60ca5a949af674215bb2cc6a2ece060c01f1d28fad2c55565b61f14ec349f069afa69ad112fefa5b7c65b5131af21a1400cc8aea4f818f3b0c;
    stim[42] = 513'h0db4856c3a1a531469d01c75eb098dacfc17618733a2ac63aa81c6dbfc888947019a96569e1621f00519d6e29df10fd5c52511af8260be7a77640e0474e9db36c;
    stim[43] = 513'h01c21976c0ae61e65cdcf5e12689bc29cd21da73082b7ad65722d50f72176964f500acc7950dad7089932df91f5b5eeb354cc04dcd02fe15bf31c0ca068c9bcb8;
    stim[44] = 513'h05196daeac767e044cc839031e1882a3d4ebd5ba3c336fbdc8f4c71fc07e6b53180acedc306abe8350f0e09af979ab9eeb6638e9f3b9f3c583ab84d35d2550273;
    stim[45] = 513'h0ecf91bdfe859e8ea9407e777fa579e56376e401fca574b38a281be87660a1e6ef0758e69439e450cea6758659218f33db56dcea6b1df17631f7733c6e26071dd;
    stim[46] = 513'h06f71c7d554073b6644098b07b99545f0888528af2e7680b4ecb0d823485a26ceacd2295fd3341105e7f29f492a90713832786c2359d0804c8140d45f89bc2d77;
    stim[47] = 513'h0a19c93b9f5b9531567c9e862f062ecc93c427f8559cfa283b22ee6834526d8f2aa985d9f96cc272bb788f01198232e2bf10264fbeb9308da9b4c4a27af1eff06;
    stim[48] = 513'h0d5c73158c0f13137f0a42b725e22d2a6074ee92dd83b0f68f619a5b9027d844b7787f837f8a3d2da2cf7445cd259e473ff52d76c7932b6f1f23169e13d477d70;
    stim[49] = 513'h0c6224a8f47e84409a21be4bc51ea9fd42ab044be1f504a498b0a1af4ee7ae20e9501dc6b6bc6b8741acf0c03280bf1178ab314a8fc48711d7e0f93906a2f2fb4;
    stim[50] = 513'h0e9e793c557682e8cc9d0755a575e32b2bfa6aa5611952c1726e5070abac62fcaf311797097388ae9cd95531cf8e4099d60676681b1cbfab97f2ee9133aa29142;
    stim[51] = 513'h0f7c765bb4b2086c30d30d8c732bd28c1692053bc2f5db3c910d83d0828ef207b0a1b9a52744e9153fac32db5aa423f44648d10be34c4b4e965d3252bbfb1d4f1;
    stim[52] = 513'h05424cd132a468a0a484255c04b2524190a20814e931dbfd8524598ae50f978406ef930c5a186f88e35f0322530753b98f319eb1990384c6fb8732a82b9660a94;
    stim[53] = 513'h048ec7d23e53e68d015014ee80cc9a64c22daf363893dec0b64a2cf31d7ec167edebe95560238560e50ca11e5884d62041d5e2666e8eafabd625436e74571f36b;
    stim[54] = 513'h068600030932759d649748d171d8f41da49e00f8b54b27697d9a702852343ed0387280f0792e2fbf85c5db444ba3395be0eb676110f2c13bb5e0587af36766f8d;
    stim[55] = 513'h02797b1b507260500b298bc13c20eef136ac4f67d5f4e398f05e6068a0509aa32078400bf92367bc2b3117113d1d083a084c19f3ea0932853c88a32a9d3c5ae00;
    stim[56] = 513'h0f59748699053e81efc9e857753c305923fe4966d4fdda653852b5e3ca20edb09fc7dff26f83c756a4697c9a0b2fcdddd87b8524c6ceeacb410eb1d4c6a2182f8;
    stim[57] = 513'h0c832718a09aa192302afdb29420ce1f31be57e65d658d4c89042aa9cab0de710fa17f7f64d39a9b7b6b21d4c20a951c82f9ce3b9c8d5dd233455e73adfa559a8;
    stim[58] = 513'h0c81d9d3a145006d03ab197a9a42ab659d101de95e98a201f0f854f8bd61c426afac0741dfe3a89ea9ab79901a101723decdf43e4ddfff1b4bdf3b3fb70fbab0f;
    stim[59] = 513'h00f09b914f5e459eb5cc348a9e1561df4e3571f4e8941cfd1eb03e64fc64a25679859b42b50cd87d6905ab671737d2f6379a42c96684982884427200e58660fc7;
    stim[60] = 513'h0a2420099805e62b1420048efa52656b0fb00a779aa0c19d8b0e70118c7fce8ce6af66393ca71b55b0f679da02ed828ba54d49a91161cefaac0a486944efb5277;
    stim[61] = 513'h09ecd6cffa6b29849e30baf35cefc6d14890c38dc89673a6b1c32dc3e8a1cd2938c8e22aaa5d7d13417300b5dcf87b5764e30c3d1aa239b4f6d96cc8c9b935cc3;
    stim[62] = 513'h0e943aaa372c6a0c76b3f676c9046a3b231cc103ce00a7264a0432b20643c01b6d9f8cf2c21fbe57f1ace5ef33887e593d4b044718b8053a568cf39046086b8c8;
    stim[63] = 513'h0ae43b81e77498369f305a5fbec5d5935f7f29e0b80f051e85e2ce8ecf9c59b964e7442079da434bed641bd90a5f74f5f61289d9d286388561945f29fa043d5ae;
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
      expv[0] = 257'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[24] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[36] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[37] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[38] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[39] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[40] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[41] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[45] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[47] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[48] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[49] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[50] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[51] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[54] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[55] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[59] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[62] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[63] = 257'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
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
