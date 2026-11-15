// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 384;
  localparam OW = 168;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_087576 dut (
    .clk(clk),
    .ra(in_vec[383:378]),
    .re(in_vec[377:377]),
    .ore(in_vec[376:376]),
    .wa(in_vec[375:370]),
    .we(in_vec[369:369]),
    .di(in_vec[368:201]),
    .byp_sel(in_vec[200:200]),
    .dbyp(in_vec[199:32]),
    .pwrbus_ram_pd(in_vec[31:0]),
    .dout(out_vec[167:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 384'h6df283b910c3c1279d1dc32077f346930d4cc67a67a7eb2431ea839d939b2794b3534ff4d91127e53e8fc9985a843472;
    stim[1] = 384'hd9e09d2d1392aa995cf0a1a8a9705794705a111d4c10826a02d8facadd89e294520777a4ff929dc804777a05daa37b4c;
    stim[2] = 384'hc2cc5f2e2522f2ff43f28f17b6e7047f7654e754cae808de2edaadb2f1902201409894d6f9d5df2c8d03f42c206bd77b;
    stim[3] = 384'h85f19a5fa81fd1567442da2fb4ab5f1d6a0670e09e4d2860b710d18be4b305eeedd9f799dcb9d277927172293399dc02;
    stim[4] = 384'h6ca2f6f5b725542d7f45dde680179916725769ee8a35a8c763044e0949a923c4808da054fb531d07a9524e146a92c004;
    stim[5] = 384'h5b6e9c52903955cd405c5032df912d1ff04a0e3d6d5e6152055ae306ec54dc302cc8a78089fd446b8822412862f79b53;
    stim[6] = 384'had659a4af2b289111abb0fe09d0813f285a5fa6c96615e501fea723c8e9243cd972af874030f46fb582265816e9cddad;
    stim[7] = 384'hf5d3759e1c0bbf45dfe7c802bcaaf146489059d4fd9d020f95c030dd963ba204ea1c7aac12de8869bc079e20b5bc6a87;
    stim[8] = 384'he10bc3df1848c479a3d496349d40a666bb5e9be22c021b6ca37adf9840cb1a5e20250a450e34565ede7231f965611ff4;
    stim[9] = 384'h1e1a3de2dce03c251fc51edf3741466049de03c7c4755e1a92ef99b54a0bf0d9fe51b5e8cd45857fc440b3a3ed00c6ed;
    stim[10] = 384'ha18840bd1c7bb9461a99dcde870e082322b721ae1079dcbf3988ab5f20cdc168d62eff47dccbec68fb566ad17a251934;
    stim[11] = 384'h107a4503112e37eb230d0f73347a66c2ad60ae586dc503d20a9faa85a3ad69546d704d4e5e0431abc26d98af82a1f6d4;
    stim[12] = 384'h5a225fe3612f92acb5f13ca29af8dab3da8a58bf379cbb10a500dae630713f07e3a0ab68617ae080e5293f660c00b4c0;
    stim[13] = 384'h2c13cc3292deab379976dd8acae4b17038224e91bae9c0ae907eec55e81a828f1b577f32344293f4937b1d78c5abe639;
    stim[14] = 384'h720a162f95ce536ce61b1d28eb7eb13bc8f275600b2467648e7930fd0997e96987f515432f8e77788b8bdcdd8866ed0d;
    stim[15] = 384'h6dbc38ac4f581857aba87dd35ed890641a5546062331ae5a1e52bf0ec6cf629c0e25e221a219f098db748c2730cb2645;
    stim[16] = 384'h86231393feb9b67344c3b43ab00e3c7d5f838cc16045c21c943ef94ed5d0fcbc9459485a26bccc4be00f88130907da3a;
    stim[17] = 384'h6f6ef129bcd6db6e33dac99a54be6eb91a4fd01dc7dabe97ec8d8548c62a9ce62ec0d8266192e48b39946d8321e51763;
    stim[18] = 384'hd39208ca82deb50898c256095e5db5417523fb1912f58f8f3e73c2b9702d51ecf77766cbdcda24feccc2f6d2df9c72af;
    stim[19] = 384'hb60b85378fb631556b007c36f0933c694c363912b6ec6488f545ccba0288b164ec1403767944c719a14bff27e8ad01e0;
    stim[20] = 384'h287dd604961f3fd25f978b0df98ddf44af4dadebab04dedbd83172df824d6c9e4ea623b87cda2e5082352a7300d3e6dc;
    stim[21] = 384'h67710c24fe584fe08bc5882a2c764fe936f2f7be2f90ede908316b100ffcef63d989afffb087ed71be8251cee33b8e36;
    stim[22] = 384'hc54995fbafefd07291973a77d27245e93ac646bacfc31538c8dc9c8790fdad00491d9de03e9639f381ec1d030aeea54d;
    stim[23] = 384'h792c11d15b1418a23d25859ba21ef789b03e417db6c261e237f53828f258ddf1bc3f8ac442f912c2c9c9faeeb52a6f32;
    stim[24] = 384'h37026f8740666ecadd09db8bb7b1d58ecc58a14539338d835f7366fff4cafda41aad59afb38bd403f838373ba8a3001b;
    stim[25] = 384'ha678a2b524481707048be00289f598e1da5266b56c0166cc894026ca7f88dc994171ad9ac4d780a29a5e4c189254f44e;
    stim[26] = 384'h8a0591b69cf147c93cfc5c9eaf878973dc350a48778dc0c377c9e0a9bafcad471e290c1189c85b26fcc85ecef22d82a3;
    stim[27] = 384'h47f2adbaf8e2805071585164f6e7d3f4a166a34b73a1bdccc8f504855f8338d043831c64e37431d5e515898ebe78a3cb;
    stim[28] = 384'h87541baae58f8e98b5f9a6730a0af39549d4e181e272e5fd319331d27536c06fc62dc7cbc604058962509d0c37719902;
    stim[29] = 384'h271e8abe3e5fb0beb9d345b0d9528eec3d34bb07bce3eed70e8891394381d94689e4f158941be8f01b3f0aa91767f239;
    stim[30] = 384'h227db083c197fe88caa71e36541604b4bdb1cb845b0004a139f20691ff07cacd927b4a7e52f288d7868d99659c90e3e3;
    stim[31] = 384'h12d25278837cdee764e53aa11fb98f89811be1c86464b66eb5509eeb0851983d74c48bcccdf08d432daacfb9e656104c;
    stim[32] = 384'hf8e3ee5e07217da8c884e486c8a03860b27a4ffc1d6ef3a84ed80833377b3cecefc595b5ded7ca85b2656330d3271692;
    stim[33] = 384'he8723b3c9a243c428674f8d5275c2cae698d11585143ffe0df8b97a11d3db00af1d2d541dfbb8fbe41b9cf0dfa1e586b;
    stim[34] = 384'h8b5b267444c30eace4491b3fb30cb752b53da78432a0e087f651922ba57038da9607734c2afb07aa3bc55899e354192c;
    stim[35] = 384'h280d52a5665484af2a2ee8b398eba6d91e0d85a1b89a7f1fe19a025b8326dde23358af0872eaf67cb5a2a85fced54378;
    stim[36] = 384'h8ef5ee2cdb9acb4c64b2017a085f8713f0235e853254c3638df5525009f230ef5998d2cbad27fffa7a68a99c34792f3f;
    stim[37] = 384'h9e648360612d496879d192afe9fcca90810c0eba4fc29f38be005e81cd97aa884f4395fb80963e0545ea6ec04e7cb6b4;
    stim[38] = 384'h75d24276c09cae438e7f2295817c0ecd2b650c40fc173b3ae80bb1b5d6e489dd215e33d8e62b3665b54ee4660ff9eada;
    stim[39] = 384'h6c27710280e9383dba7058a494b1785bca954caa5fc294034d28a37918564b863abd421aaaf66f3fd86074736bd6703e;
    stim[40] = 384'hac97fb6e56642fb8ad402ea13f91e73949367d4f5dde78eebfc3d60a211cd82739575dca1268d06f135aa601b44ffa78;
    stim[41] = 384'h256b8ad6ab963cdd6e338171cec25ae7f0a34516ca7f94dcbc69ed6cd2b3480f36006e70140261ef5fc0256cb0ca4aa6;
    stim[42] = 384'h22dee8b0f743453226ca26bf44c2addb9d56922dfa13ccdede56feb3f81953425b0b0111a1c25af166661af52d91dfd6;
    stim[43] = 384'h733729dbf5c18ff9d8e01fda4e539f32a5efd8d0a11c57c76d1c05dd1cb01047816674eeaa9851cc4496458d7f3bbcaa;
    stim[44] = 384'hf075972d9ab54ca824aec1f702169b3f38e59ade7db097cb306e0780f0d82aefe91efd4b22cf66e269e5ee919847f08c;
    stim[45] = 384'h872d49035652d7dba109df9c333eb06ba05886d4f000001ba1f31664e7972c2417b24c00f9e995cc9fe55ab3557882b6;
    stim[46] = 384'hb08d01747d9530c5e6af53282f270b6d40a0bfe045110e26a87e72a14409067a43d64b536ee4b649a93653fcf39352bd;
    stim[47] = 384'h486063963e78649f23ffab5afeac7371da1fed90433e1a4ba8330040bcbda5cc61aac7cb767d98cbcb862956d357872c;
    stim[48] = 384'h07e59415e844688c2cdb9e9477ebcb1e537b7dcdee854fc81ffef7c11bf93e62b8df61167caa0d2614477c2697b2d187;
    stim[49] = 384'h54a5ae83abe6329f26ea89ddf9a08778fef2221517bb5d2fc12e85a2b58da5fa56f25cac7c6fc509922b64caed882eff;
    stim[50] = 384'h3769045633d874f4b98645497e88c0e2d4fae44a59238a4dd2c63b7815d38dbf33587bbffcca01c95717fddfe3b17ee9;
    stim[51] = 384'hb443287688f4b733c2d18b857636c471caf9f6d5146b62d51d0d5625d731a10c0d883c55e649608628f3152538b77f22;
    stim[52] = 384'h15e6a1ddb8c8401e4715dfd1ea0de0b4813dc041aa252de18162b463ca3bcbd09ebfefa3f30b3921e20599084fe8145c;
    stim[53] = 384'h6025ee672a2dc46e70c9f54e1310c01bea92df75a2a0cef9657c53fe42d0a298c55286834f20d2c7b666ffdfcbb69419;
    stim[54] = 384'he124d927066ab95aecde3e8600a55161eb8a9aabb1d0b27acd240b3c4e7f33d8e68766d059aa0b4ba1527e12ce25b9a5;
    stim[55] = 384'h31ae891d609eb838153c0ff61718486334c259e04c197ea129105563c3eda7653a12379491ee01f6ba77fbe637ad8b87;
    stim[56] = 384'hd2cfd29fdd09cd397298798476afd5c7bba1b73c58ac769adae673f0b107791f75d93693c4e5039822877c130c40703f;
    stim[57] = 384'h7b88c60828df44bd50eee3723192d1f64556f6d6dadf87c3e6e42ebfe2a4ef4e7a10b29cbfc5bd7cfa9845415e598025;
    stim[58] = 384'hb5b1a06b27bebe59d5b7555842954d05d64c2e8c00f9c1f4d5c4297167e216a56be0a46400a7dd9ce930b171c4b27d8f;
    stim[59] = 384'h2308ef24cc080484aca73dc3969a1587a7f07abfa81a00cbe3aa381d638105d5741695bb824f3920d160ee283686e248;
    stim[60] = 384'h96c31e1d5d5acc546dc5424dec17cdd407029543a5619e1014801e03d71876f4276d976454e540dd92e481e93a5c0dd2;
    stim[61] = 384'h97efbff4a31b4ea7d3a2b4761ad77b9219f3856b0ba7565288be8153a642b0f163686fac971edfe29b590f9fac5b46ef;
    stim[62] = 384'h9414dace49ebafa1b5306173b8905fe7f1fd81a265d956e0a9e218d9c3253b56afe020c376747c6e28ca79446e6babdb;
    stim[63] = 384'h335a293e76031e50b326fe3d0d7e12d289e259d68cc82002efe309dbc6fec92e9520c22b4ef0442cb41369263378faa9;
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
      expv[0] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 168'h2431ea839d939b2794b3534ff4d91127e53e8fc998;
      expv[2] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 168'h52055ae306ec54dc302cc8a78089fd446b88224128;
      expv[7] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 168'h6ca37adf9840cb1a5e20250a450e34565ede7231f9;
      expv[10] = 168'h6ca37adf9840cb1a5e20250a450e34565ede7231f9;
      expv[11] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 168'h8f3e73c2b9702d51ecf77766cbdcda24feccc2f6d2;
      expv[20] = 168'h8f3e73c2b9702d51ecf77766cbdcda24feccc2f6d2;
      expv[21] = 168'h8f3e73c2b9702d51ecf77766cbdcda24feccc2f6d2;
      expv[22] = 168'he908316b100ffcef63d989afffb087ed71be8251ce;
      expv[23] = 168'h38c8dc9c8790fdad00491d9de03e9639f381ec1d03;
      expv[24] = 168'he237f53828f258ddf1bc3f8ac442f912c2c9c9faee;
      expv[25] = 168'h835f7366fff4cafda41aad59afb38bd403f838373b;
      expv[26] = 168'h835f7366fff4cafda41aad59afb38bd403f838373b;
      expv[27] = 168'h835f7366fff4cafda41aad59afb38bd403f838373b;
      expv[28] = 168'hccc8f504855f8338d043831c64e37431d5e515898e;
      expv[29] = 168'hfd319331d27536c06fc62dc7cbc604058962509d0c;
      expv[30] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 168'he619496f559bccbb6ec5657258b81c112748dd74e0;
      expv[36] = 168'he619496f559bccbb6ec5657258b81c112748dd74e0;
      expv[37] = 168'he619496f559bccbb6ec5657258b81c112748dd74e0;
      expv[38] = 168'he619496f559bccbb6ec5657258b81c112748dd74e0;
      expv[39] = 168'h3ae80bb1b5d6e489dd215e33d8e62b3665b54ee466;
      expv[40] = 168'h3ae80bb1b5d6e489dd215e33d8e62b3665b54ee466;
      expv[41] = 168'h3ae80bb1b5d6e489dd215e33d8e62b3665b54ee466;
      expv[42] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 168'hc76d1c05dd1cb01047816674eeaa9851cc4496458d;
      expv[45] = 168'hc76d1c05dd1cb01047816674eeaa9851cc4496458d;
      expv[46] = 168'h1d9e4d121e21433a7c6a93ae165734c688ac28a1ff;
      expv[47] = 168'h1d9e4d121e21433a7c6a93ae165734c688ac28a1ff;
      expv[48] = 168'h1d9e4d121e21433a7c6a93ae165734c688ac28a1ff;
      expv[49] = 168'hc81ffef7c11bf93e62b8df61167caa0d2614477c26;
      expv[50] = 168'hc81ffef7c11bf93e62b8df61167caa0d2614477c26;
      expv[51] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 168'he18162b463ca3bcbd09ebfefa3f30b3921e2059908;
      expv[54] = 168'he18162b463ca3bcbd09ebfefa3f30b3921e2059908;
      expv[55] = 168'h94edfae0c7fcec700fed2729cf9952f7ec68508e2b;
      expv[56] = 168'h94edfae0c7fcec700fed2729cf9952f7ec68508e2b;
      expv[57] = 168'h94edfae0c7fcec700fed2729cf9952f7ec68508e2b;
      expv[58] = 168'hc3e6e42ebfe2a4ef4e7a10b29cbfc5bd7cfa984541;
      expv[59] = 168'hf4d5c4297167e216a56be0a46400a7dd9ce930b171;
      expv[60] = 168'h228188971bf5918687b99a3d336156b0572c36e281;
      expv[61] = 168'h228188971bf5918687b99a3d336156b0572c36e281;
      expv[62] = 168'hfdb72b3217dc56a017509fc8f39ca49b3ea7aeef3c;
      expv[63] = 168'hfdb72b3217dc56a017509fc8f39ca49b3ea7aeef3c;
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
