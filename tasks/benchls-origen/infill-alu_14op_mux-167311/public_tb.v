// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 460;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_167311 dut (
    .t0(in_vec[459:428]),
    .t1(in_vec[427:396]),
    .t2(in_vec[395:364]),
    .t3(in_vec[363:332]),
    .t4(in_vec[331:300]),
    .t5(in_vec[299:268]),
    .t6(in_vec[267:236]),
    .t7(in_vec[235:204]),
    .t8(in_vec[203:172]),
    .t9(in_vec[171:140]),
    .t10(in_vec[139:108]),
    .t11(in_vec[107:76]),
    .t12(in_vec[75:44]),
    .t13(in_vec[43:12]),
    .aluc(in_vec[11:8]),
    .c(in_vec[7:2]),
    .o(in_vec[1:0]),
    .r(out_vec[33:2]),
    .carry(out_vec[1:1]),
    .overflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 460'h1987c34beb36085d20d33635f825edf94a7bd5cb839eb1274ff97ec9335623286e51ff183503e82dbfba7766d1cbc2ca427b28d1fe4d2b11867;
    stim[1] = 460'hdadd073bdb5f09394c2ff777445941a862667bbbfa57e47563189d8f2e54432ba1ce32e0e9ffb424753b43e2e1cf0d7a6938f2de0f4dc5d3cf7;
    stim[2] = 460'h1c27692cc5c4ecd42a2a5004da0df1fa329edf18f41111fe1447a1de901ed0066cbf4c38b49281c139fb852a2df100d09a74573c2e1f042ec65;
    stim[3] = 460'h1ed0d7899677885bd7e9ea9812b642b264c9bf9a2933d7c8fe1a9aa7e205fc8e77e273cf063a643999c9ae4ea9ad3a40f53db05e941d7213f49;
    stim[4] = 460'h834ba1c5f147d7d5e91e8701e74cbcdec61e4b723fa1be172934d0e9316382fec3f215a564333536753625886a72457bbc3adc0854267fd7fef;
    stim[5] = 460'h003bc2799bc42bb48f34a355962f0e5f5cf90b75a7935f2957f4c5cc4f576bebb4cb76d42120f35c84c78d4c0256dba5ee341a6fd5eb1b2f6eb;
    stim[6] = 460'h9524cf1e9323430abfac21b923c46f77388219a4823fb7894a76110fc733b14fd418ad77c15667cdf0ad887b2d259cd0b966e6fdfc53d844dff;
    stim[7] = 460'had610cd3c7f9f07c1d23d59a8cf50653961e0357542052f54c4c18df4a9ee7b9a39c2256494671b4e9fae1beac92e2b9ea41dac03ea9d90d322;
    stim[8] = 460'h0b9da2cf0dc79e05a70ac3e9a892879208488ab55e34da3993a6c2802a1611688d2be2e1d4d04210d036c551feb45b36a254596badf87c6623a;
    stim[9] = 460'h0b6e0488c642445a7f2f25f8297cd3038d9c8b7d4a00c07090ac0727e33ae0dbd8db2266ce4c3e5c21e0b81893b18c31818b39407bba251ca69;
    stim[10] = 460'h68a18be47c88266d3743738e94107874bc90e9e6764a246f49c1330384d7fdfffcd786c99da27920d70f4bbe439d8d60f54d0ea55557f62291c;
    stim[11] = 460'hf3d7c763cabca72d946725e3e634dbe185e8923aa3515f0abb4ae36d62f869ff7460cb535fd3131e19615b2595f0e74b49400427c80b21347df;
    stim[12] = 460'h4347b0f982bdb55c65be08cb268b147c8e8e8f95c0f6a9419ed172fa15391bd203c7e9e8c36b821614180bd02fac74457cff2c754c6c12746de;
    stim[13] = 460'hb54f81a1fafbff748cf1ab0150c989c538d855f8b40112a09eef9f4add0572dcb3960b98d8f6b69bd09a17b2ce8907f5d11093e6b162779e387;
    stim[14] = 460'hfcd6b52dc8d01458342091331a3806aa27eee5c2d1da188c8e462f3ccfedbc4eddb77ab695417b520980fa283961c2aa0fb4c1916d5f6a0a376;
    stim[15] = 460'h29b328de709e043971dc013ab1e402232816d611a7396b96f106d35514f57e9d148f44fd02a15d29559b49200d51c5837ce82a0ba26fbff252d;
    stim[16] = 460'hc19a7accf22ddca2c7bb7950c4815a6d7040aa850ff485b4573ac189c89728a2e72af4431d7e8248ff43c42f94645c01ed964e7cdaf45b361ce;
    stim[17] = 460'ha77d32265f1886b8bfb1d95abf9c0e9a6a8ea7bc93f9848e846dcbd1623aa030bafa057ccdfd4614858a1e5f6aa8a37183811a03555e133a276;
    stim[18] = 460'hd0ef42b5799fb9a57c104718bb3294ab71c7a100fcc45a215a0eccbd46ee212102b8caed5cb63db34d83e53d01d32ac8fdeb61b26693af63cb1;
    stim[19] = 460'hedc11bbdad5736ddf6c58bc046c24d6c9aa452325f9ccc8708559d8654ffc8f270d3fb8e167124a44a95b838fc2c692df2db11a8b9ac06243cc;
    stim[20] = 460'h6020e25b4c8838accbfb7811d1ee7b4acb7a703db38b04237baeb22ba6f5208377dbee50b18b5ebe9c191b0036a2c80c61e960532170fc492f6;
    stim[21] = 460'h6733d5478eb0a694c5b74f05a07d3a327496230e2f63d6ea10ddd56732f53d6acad52bb30a600b91f513854fb928183768e60c8697e2303f83d;
    stim[22] = 460'h91be55aa7b8b92020b5de6cd8d00d24c0482f4155d217db391b0a5f895d4a49261281b6a1715f51675c16010c4749ec2caf96ed95e9256b44be;
    stim[23] = 460'hf0de592a7c142b7cbc218f696aba4ba4e980bdac1685410fbe28f518a9819449ff3012cdd59954655d7b92e1640bd6e42b74d77209a9b73dfc1;
    stim[24] = 460'h31301849d898700b5d729487c94b38c8a65d6024d1263a337453fdc33a3e0d5814fc2caaca46fabd07bdd5fd4742d35c34088ba8db82f420734;
    stim[25] = 460'hdebe9efe874f5dd34895f7fddc0500f81ce24aef89744fb8f8ec4bf68b2924157ff30c49561c0e15bbe602f9fb5ec54324feb1559174b8d9ec7;
    stim[26] = 460'h34cc31e8e05282e40c42bfc1087d3a0dfae0dd3c88922d0d079453e9cba144bbc4d8a9a227f929ae1bb0df265f8452e84735bb52a5568694305;
    stim[27] = 460'h24ae577b2ec83b3420ff2fa702a2c0e6d0109be5f600156625c55770cbea47152ff4b8b564e979cf854c5b44f92d5133557b36c62061a96f2b5;
    stim[28] = 460'hf4092359428466431367ce1be620fb133e3ff7737a85d4e223f6354af4ad3b31b250c6c2c9cbbf12f9e5188e378b48e3b8a0f226ce3d39c5f81;
    stim[29] = 460'h86ecf5dada5fa29bb852323d7f135bc1549ff631c657030286aad5476f4400aec906e1725451706bca84e1f1ba640c5c5ddc153c914d2da86b1;
    stim[30] = 460'ha80ccd644bfb0b51aa7893109beeed1847a82451016d870ee4538eb9a19fabb67e7abb5e291e3256a32986aa21f7d22f689b30c7c381f5626b0;
    stim[31] = 460'h86d60bd6e4263711968c9a1c1a6298ced81d052e495f8ac2da0d778666a3e2cdad6a23d5dfd152486435d15b7d0dbf2876b1266ee8908f532ef;
    stim[32] = 460'h0c310178ba7e5fc2b0903a93c5e1dae7c148f562a065b26a25465d00595a5a45fa07b6dd74f6269e81395cfdad71e990bd7507390d49194174c;
    stim[33] = 460'h9e1117ea09c34065c63754d2fbfe1ac0d11d764bf58c56aa10a0652b6182380e14372534af9c0df68e1a38c9eb88e656b05b2604156841a957a;
    stim[34] = 460'h6d31e0dff5c236d2e935f10c50a428885afe19028f37d8f4022619c0356296b70edb7a86330875c0460b9a0b35adcb6ab6835e4a3f1b04c6c4b;
    stim[35] = 460'hf2aa83b43a9919d9411576f7dff4dcad5f861ec3b32262611208da1623676cb880baf1888b2610d49d002eb74cfa9c5b658e273998d1f8a0c4c;
    stim[36] = 460'hfe4e7bb20fd35ad923991799de5729bc7ebcb4f24c82901f13c64570412fc24f7561d8bdb8f368a8074dfb292cb6e596289038b718edd21b1de;
    stim[37] = 460'h122fc57f537883cfe7885ff3edc555a7d968782e59fa850c7e41733be2c6d45d074532d952d500fb2e54659ed471c2a08498f2cfce9cdf4ea2a;
    stim[38] = 460'ha7610cf988d278080d8bc82be9c3f4608be9bfeb252e7a31e724c0d07d4e551a86f4d2f7f52d640941e708b559ece5ccea1568da5edf1daf9a8;
    stim[39] = 460'hcb2bdfb08fc61492aa79ad189b41f7a1e29f65d78ae088547e518696bc688f370f25746fd314da2b5401dc88c0df7a40d6eb159c8f27e2ab29f;
    stim[40] = 460'h32a6a6395cc9ab2329f76a2e1862abc9de30672fe5bc3c75be06d31913dbdafacf819ff73fcb9d5d983aa60747509c79df722856a11987c3a7b;
    stim[41] = 460'h29b42147348e1521f204fb1aeac45f4167c7408439ba311996e503e16f706dd18aaf6838f2767dc69b6a15a79ee2e4496c98843adbbc81f0483;
    stim[42] = 460'h9f5d268e14dc68a651241f39eb82d2efed66ea2f76111a16fc11565d9baac5c573f4d7600599fba4ce5ff9f05eaa65d6954cc796c643ec0f247;
    stim[43] = 460'hf8a379a42e85c96bb27f551c30a0593448e88f7d865458f718a37954e9f9513004b0fafac43954f2fb8e3a9b0022811131e73b95dd55bc24f0f;
    stim[44] = 460'h52756f6077290824bef6366ec2def327c318f7b7ccabe6a7cb5529d7392be2c11dad55faabb799111047329380b960af2249da2d69ccbcc301e;
    stim[45] = 460'h58e9286c2486b31c4fdd0e95d5f03ba4b4c557b2b68354406f7e5cd4f509f6daf6c02949154e77aebbb33e1e380ea399f18722552a13f74e487;
    stim[46] = 460'h4f2e81815b4777ff813f713db87d70a4b20e77c7c6ed6ab1878100d605e8221685b04165b65174dc4350530ec45a36708ab72ec97afc947e180;
    stim[47] = 460'hbb341e00136d0565f6030dc4bd0e721006e97c1ba4564d45f2ea2352fa84b978ce6b2c4dac35190e6a56427bf48c8b18ecb7dd6cb3a50bfb6bf;
    stim[48] = 460'h5ad7fbab27f732f78a437275640d795b96354a153e6e131acc57baf03a59ddf2fde8f75f55a8b298f77a471d72be5f5b2a1a422bdc96e7dfa3f;
    stim[49] = 460'h1654a49e792d8a5f080399116a08f0d65c3b3653802c80ce8e6e7bd6d5b41537b242f5de5adbfde6e68d7761ee6c87145173c5b82df7e56e7e3;
    stim[50] = 460'h274f2750202fdd16df24585e791b1a2576664bf3803d32bb3a682176cebd2d94980d0cbea404b9660cccd808b437ff73f3b78f393aa8809b077;
    stim[51] = 460'h94f1dd9605695829312ec7c66e4f1858c65fec8ee3eae361b886773e98f8b1ec343980b32679c2ed283f7ec0139c1f0d223b2d518224c06f0ca;
    stim[52] = 460'h214f1c2726da5b70c6e23b864eb37165e2076de6b3f289e3494389f260419c8702beca4d6bc70938c53cafde6ac7bd8865f88d615d5a3ea491d;
    stim[53] = 460'h093cc6921ed47e59a0b71a82da935afd11fb7f45cb8e1c678276018808c9c82627cba6361bd1ea64803c9c861b24d26fbcefc69c38d1d3aa466;
    stim[54] = 460'ha8bbb72f36b863fb650106ed2add584c979cc2bfd45c175b03897b3082b002d805e52f600cbbdd2933bb4f64892487f9636d48ab3bf084b6502;
    stim[55] = 460'h988550060513a2950182e29e38543466c889cfc91f5ce611479d5a933154ab673411a140a96bddf4936b9a5d3b475d2c779f4f33f3fc38a8f07;
    stim[56] = 460'hbac6d7c442a84dc9c3e6723b692e92ee84e4fe8a833d5b0ffd09abc1b500ca6de38e137ebb36821b620776a9e72a0941c0943b1e10f7d3c4f01;
    stim[57] = 460'haf6fcca253d2ea0758710d3e1521e6d1b0e2acc2674b1797d21c0e676fbc514b0fd2173282e115c67af1a8498177c61ca9293fd4f0fda2c999f;
    stim[58] = 460'h5d743e3de0c1f2ed3aed65080f49818beec5ef5b483622b610e0e9b8bf091b954a55086c51a1c2b42b2d6e739fe537bb8b219bb30244e8cd410;
    stim[59] = 460'h3c54520ceabbe8e07a8faaf98f587e8d5a3b4e59d5dfcbda1b86d611069a0400b033b1fb3ac4867c77fb3941160f09478508f341a3573680801;
    stim[60] = 460'h580858ad524defa36c7ee71eb5a5afa9f0ecc6d4ce56f7171bdd112d8f5b584a9aae369bcb95c2aee379eee804409b4b3138ccb9c16e77e690e;
    stim[61] = 460'h66e79f60084db07951f462e589685e4aabe1619a54ee109b2f1c5845b829912917f1590a7faa5698da59251875872108076a363f068081616a7;
    stim[62] = 460'hc46ecc00f2e3e2babb5deffe70705f9cf9609497fb6beb10d3c1d14ecd131d5bb7c006adc8339f7ce98afb0f1924ac21c346dcad921b4ef4a1e;
    stim[63] = 460'hbfb7bb649e70acd8721b4e96492d15f441f9c3a1452a8bede5051204120ed63eb4bace155de59284254a13b23263f04d217d1e70f67ed4684c4;
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
      expv[0] = 34'h1b947fc62;
      expv[1] = 34'h1a4e3cb7a;
      expv[2] = 34'h269d15cf2;
      expv[3] = 34'h000000000;
      expv[4] = 34'h000000000;
      expv[5] = 34'h15fd31731;
      expv[6] = 34'h3f14f6113;
      expv[7] = 34'h233d4194c;
      expv[8] = 34'h29c2b0fa4;
      expv[9] = 34'h08782e061;
      expv[10] = 34'h27689e483;
      expv[11] = 34'h18be1a7ff;
      expv[12] = 34'h27b45cbeb;
      expv[13] = 34'h143262716;
      expv[14] = 34'h068e01aaa;
      expv[15] = 34'h29ce5ae5b;
      expv[16] = 34'h3c8b7728a;
      expv[17] = 34'h2fec7656a;
      expv[18] = 34'h3f7ad86c8;
      expv[19] = 34'h11b0935b3;
      expv[20] = 34'h32fede046;
      expv[21] = 34'h32b54aecf;
      expv[22] = 34'h0120bd057;
      expv[23] = 34'h000000000;
      expv[24] = 34'h0e8f83562;
      expv[25] = 34'h000000000;
      expv[26] = 34'h021f4e836;
      expv[27] = 34'h083fcbe9f;
      expv[28] = 34'h000000000;
      expv[29] = 34'h21aab551c;
      expv[30] = 34'h3914e3ae4;
      expv[31] = 34'h25a326873;
      expv[32] = 34'h165696917;
      expv[33] = 34'h3d6315aa9;
      expv[34] = 34'h2da0d7929;
      expv[35] = 34'h196389ce7;
      expv[36] = 34'h03f4d6b66;
      expv[37] = 34'h0b9519679;
      expv[38] = 34'h3d4b59025;
      expv[39] = 34'h2a9e6b463;
      expv[40] = 34'h260ea981d;
      expv[41] = 34'h19f1d0210;
      expv[42] = 34'h144907ce7;
      expv[43] = 34'h000000000;
      expv[44] = 34'h149d5bd82;
      expv[45] = 34'h2d3155eca;
      expv[46] = 34'h16d1ddffc;
      expv[47] = 34'h3cba88d4b;
      expv[48] = 34'h3dde91c77;
      expv[49] = 34'h356d054dc;
      expv[50] = 34'h09d3c9d42;
      expv[51] = 34'h253c77658;
      expv[52] = 34'h1af1c24e3;
      expv[53] = 34'h047edfd16;
      expv[54] = 34'h351705d6c;
      expv[55] = 34'h000000000;
      expv[56] = 34'h000000000;
      expv[57] = 34'h20b84571b;
      expv[58] = 34'h3bb17bd6c;
      expv[59] = 34'h2c0cec7ec;
      expv[60] = 34'h32e570abb;
      expv[61] = 34'h0bc716116;
      expv[62] = 34'h3a62bec3f;
      expv[63] = 34'h107e70e86;
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
