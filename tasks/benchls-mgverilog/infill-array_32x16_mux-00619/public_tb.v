// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 517;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00619 dut (
    .add(in_vec[516:512]),
    .i_0(in_vec[511:496]),
    .i_1(in_vec[495:480]),
    .i_2(in_vec[479:464]),
    .i_3(in_vec[463:448]),
    .i_4(in_vec[447:432]),
    .i_5(in_vec[431:416]),
    .i_6(in_vec[415:400]),
    .i_7(in_vec[399:384]),
    .i_8(in_vec[383:368]),
    .i_9(in_vec[367:352]),
    .i_10(in_vec[351:336]),
    .i_11(in_vec[335:320]),
    .i_12(in_vec[319:304]),
    .i_13(in_vec[303:288]),
    .i_14(in_vec[287:272]),
    .i_15(in_vec[271:256]),
    .i_16(in_vec[255:240]),
    .i_17(in_vec[239:224]),
    .i_18(in_vec[223:208]),
    .i_19(in_vec[207:192]),
    .i_20(in_vec[191:176]),
    .i_21(in_vec[175:160]),
    .i_22(in_vec[159:144]),
    .i_23(in_vec[143:128]),
    .i_24(in_vec[127:112]),
    .i_25(in_vec[111:96]),
    .i_26(in_vec[95:80]),
    .i_27(in_vec[79:64]),
    .i_28(in_vec[63:48]),
    .i_29(in_vec[47:32]),
    .i_30(in_vec[31:16]),
    .i_31(in_vec[15:0]),
    .o_i(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 517'h1a19b071aefe27669cb8e123511890f51ebccbd6c9457cf4e4de259fe7476f99348e73a05c709a13ece380b77e6c8bf501590a0074bc504db738946e1e6461c90e;
    stim[1] = 517'h03cf3403c37d0597a6403e8729c066a4d72b71cc397434650f5693127b9fcb4584f298f73839bb1be2c5c672e9a24bf8ae39bf48dd9aec60e1e6bfda6ef3c67cdf;
    stim[2] = 517'h02eb208afb743ee60526d356d22fe4d4eba22e91a58ad04c2df1aca3db2106ef75d73c0ff893c4d78f6dab84c0bd0772cb3bd85e1d2f3730ede7b23b215c13d5af;
    stim[3] = 517'h12b91cd7893be5260111fd544025c11d6e7957c06b208f861af783c2185c6d6057dd1b88b8baf837de62e7ffb8a174a09ac9b3fc2b2331d1d8f92e68983a2e1d96;
    stim[4] = 517'h11f68ad89adf997475ffd3228cc1b8816bcbd780df2614bcbc88e8b173b9958b4b91a4170e8cfb87008650d646b36e1fe4ebae4c0dbf495c1586727cf884671719;
    stim[5] = 517'h01f8da90ac9bccb492e7f367b4de488ed0d1b38c3b274b4fb67d952672d4f613fcc7d8f51f0c9ad2e4995d8a3be6a91b4d9926a62525a210b2af877065ed8e32db;
    stim[6] = 517'h167bb1128ae8e202e927abb02b685e261f94c20c38ef637a6aab037515d1187a5e8982dde2244c1194d1094153542b69922b30c648a0f185056547de10728193c0;
    stim[7] = 517'h12d5890e3a2bafd6264cf019d205e12f551848c2b5f3b4cc34433cff77ef2a336ff2de7d55aa13e2e1b7638267c42753a5d053228a202c7999b8abfc64afe8b679;
    stim[8] = 517'h13fc717ad312a733341d96dd7547dcf94dd3f0f30fe04bcdfd270d0ea59456d0337be2b478b8f3931ab8af64da23c3c347f1f0688bafeff68ea50cb7c3b39d97ef;
    stim[9] = 517'h0b748e1944ef07b20a81738023779a15639e9d7d7a00a1217c7b6ab072f93ba5dd631772187962ea638f0f2fa41a6abe6c8d20440052db19ff97b4f367c625f75d;
    stim[10] = 517'h0a2662efd2de4cd519124b2688e8f75cfee4b9d94192c9b29a87a41d6f40530081bb51c7738bb47c3a9a614225f0a21f0dcbad589b82790e113af26e333044edc5;
    stim[11] = 517'h13e765fc1a76f2836daba78f03d8073aab85c20321ee61dbd657ff86e95bc792ea9a3ec18dffaf42227e29b9ed66627f6c0f4848afcffd9dd5b367a34402ff13ff;
    stim[12] = 517'h1391b66bf1da6257639d9fa0b8787012d0f1d41962bcd4f7018f83fa0d0db096ba1a1fe1e194f4c37b621a629b49ad8e249148685a77d3dccd591c3be5229bfff2;
    stim[13] = 517'h0faa16983e40c942f28fd8067722588708186b791d2aac00278ae279beb9944946fbc1043775fdeffab9d38ce1655b320f1433b58bc8fab2d5e2727f935bc7148a;
    stim[14] = 517'h05d8b575b108d635c47c9224987f41a52b70534a817646d0ac8c3d69ca6fbc2d8ab9591b6c6fa10aa8c48c4f92815b82097cb8f5ce6ed073c617e17a250ed885d9;
    stim[15] = 517'h1f7554361c3f76346cb50d29a886a6a9897195975a2c2f3adec4a7b828b03399b1aaf38282246276dd5eff3bdae9f0230a47ad402a6b05a42c3da197c0d9414ae9;
    stim[16] = 517'h07ed98f4f21fbd6842b909a3ffc068df84c703d389e4a77ef6f7c738152eaeed50a04769bc594c91612dd63a8fdb46424cdf431e9331dcdeb19f8d0c3ad8067189;
    stim[17] = 517'h1a1f1d4339a5d00fc6bdf7317f02f7effe906645051b27c8cf09122ede9672dcaa51e92812bab615139db86ed8f8c02204cb5a2c58c5281cc8188a9e7ee5672dba;
    stim[18] = 517'h05fc05d8bbad44fd9c2d78f3bd27954b47cedd13894514aaf2cfbd20a351c9af1c784f943af67d41354f10f07543557672b5151f8415e8831252e45dc0db7e9235;
    stim[19] = 517'h04db115e9c25b5db0efd5be9fce8b628d398cd2f3b74ea635d93b7960ccdc4530eef7633a6c26ccfda646f2a23012957ca914766a446a1bced2e564baffe2d6723;
    stim[20] = 517'h1c31d696a415e698cc53526cb8924f53ba5caaf1a3cfa23cc7baae4a5ef7fe2e45393715d857a86c8f9ac6723f51c2581fba24ea371a072eb8e6778b8d36564f61;
    stim[21] = 517'h12688863cc0e7b41e567552959ebd19012a109e4c8a54be78354efdbc560b8a59e72871557918093a04517796aafd72f049de589eeac746ee34775ff54a925dfec;
    stim[22] = 517'h1fa4cd8b5f2b742d392866533c7f93f9b34b7f40af7cc93a87424f91f63b7feb063cc0064e00f85cc3ddba678c1412fe762a9cf452406f8cb77c88ae6c12fb3438;
    stim[23] = 517'h0c261c9135754a22af369c7615235266c83cf711f6cf89d4750d80771208a9f3ffe0d54e6a3793ef9d6b36749b62f2a9470dc9ac68beedfd4a973169c0dd5be4fc;
    stim[24] = 517'h0d08fadabe83794c37b0ea20cffa63706e375b40ef2fd069ca26b1c7b36fae47878986d22632fd7457c233a53b0fc62b755df18b74d92b4621a1d759045a23f6e8;
    stim[25] = 517'h006d24aaa59075d28c2423786b5db8edece8d5432601d22860bc6bb907653ff3acc8fe133b70821043da43059bd5c032a100a52aa0e900b2702351d0356e7576da;
    stim[26] = 517'h05e76cd4c66809606714d112da1f0912c36f2025cf94fe24e068a4bbb212ca76563c3f7eeb41f25deacf195ca544ac35b892b9c387a54a2e689ae25be42e6b0bab;
    stim[27] = 517'h09c6e8616485a82104ae94f7355c0efaf74ab05c2a2d5486aa58005604a91d53d62ec0a8ef60ed4e06bf5dd6fbdc4af5397f0b0eefa7080a0e3802a021f7fee3d0;
    stim[28] = 517'h159d28e110fec4f36bc73388f2247d987c7736f47ab64b1ed9095defcc8bfa271c517d060a465bcb2f64ee6363f0015929b0516d6701fca9c68afa71c5641cc160;
    stim[29] = 517'h071a3d35866274c723faa5cf7cc30a05c19d02f116697c5e8fd9fbf732450aad5e7dc7431a0273d3966aabd1682ae6b1c7f961ba33c26887487ed1e88d12c1ec0e;
    stim[30] = 517'h0c0b1108b22a492d7e8a61553285c671440d963f1ede6fc76de3cef6ee7e4d00250e608c2e053f5925ea2865345cdb31eac65b3e159954ce6cf33e1dac95976736;
    stim[31] = 517'h13544adb9fee9abe762aef553a01a3cf54198d51c08e25e937244b49f02b2f7af1b90149128a743922fca446c001255a2867cefad505c47d9dcda2c52028f470dd;
    stim[32] = 517'h187b8052e17a71ee5e4382050acb19b4206d77011197864c6fad04ecfd6bee076e401ae2a0f4f2179efbd27ce7a6f3cb48be00a61fb1cd242e3749f2943f5c62fa;
    stim[33] = 517'h07d8a4011f867a8f005192374d206d3b8ea948bbb12591d7d3187b4ec26ad773df1ff40e8fa594f0cfee87d7e420adde299f1629283fdf8abcd5071da8b450d89e;
    stim[34] = 517'h1435bec7e616bcbcb7912950bbbf9c4021ffe8196bf959dcbb6a6b35916fc4e99614b2b2094a639aaf25df8c35879093e3caa52097b8b12b6320e7e4319c0c336a;
    stim[35] = 517'h0fa1346f65466fd1a45aaf55042486a1cc45bc298a532dabf6987c9dd52ac391697c4421942182b8cabb087e8aa554f34337aa410a1a0567e5dd1aca758a38c514;
    stim[36] = 517'h084887c0dcdbd61398a781d24600de5cc7e63841b1ef1de453e494a3a649206e9f5d56368a63a8da1ac029b3f0f9be428a0db440ceeadb8dfb94d7d0f89d494eff;
    stim[37] = 517'h0b42f8cc306fd86102ca3df1d7c1a079e2f8bb61573d61f4e8251a35e1201c03dc4acda7b77a3200753a0417f30124058dfd35410b209881ab971b1b611906e79f;
    stim[38] = 517'h15b08555692bb43cde9a2661f9dfc4f83942bf28c08ff25c63fd791ebdc9378f26e567fd3ed89ece1427a4c36451025248d2d06e2d56165d973283c2a4d8ccfcb7;
    stim[39] = 517'h1edae938730605b1e8e353ede0b2d26c9cfc29f9132f8799fdae0c6ef87a8489af8239388db2b4aefbccf30295daa03e57f7f02d8b16032f70c9c49dd88ac46c5e;
    stim[40] = 517'h02cb3f23ab0f0c99f0ded3fcea81de15c57b79e057e7d24a2125913cc047175ad76eb924060968797260a3fb7dd0d8bbe6881fc1308b5eb1da5e26a7c23be0cff6;
    stim[41] = 517'h00c6b85a28c5db456bb5edae5bad1d94ec63bb2ecfa0178021329b9b190c318465743267418a80375260227f807f7cab2c0e29ca3b6ee0a1dbe337fb9bebe7db09;
    stim[42] = 517'h1c60b48ec7609a537f6871b1c49ec22594d6f3c54d051fdfca7d3f65a77aae043cd268c753f40e7dea64ea257385d01fd338a40cc810280e06bda9542746538eba;
    stim[43] = 517'h1188c4db8654bad926067532c550aaaa93e9a959b6984e5417e8c14f7e7b9f7a751573e75d4691d20c35d3ba175b200368736d739c3f1e5b55cd1391a5689ec849;
    stim[44] = 517'h135f912b364abe7bcdcb8372d8eb6f688e339be6916bb90337467facc0a9b2375b6b349ff88f4c2b6b9e3a5aab7287f0b1457805a6016bc617be7fb23b9bec4129;
    stim[45] = 517'h0ee51e758a3403f52d544d7a4a495dc6ba00888fc6b55e7a3c0dd7bc7eba7cca42b441639f15924fae89d57e0a6bcd7ebf8dfd2a309b24fdb82d0a6c7fe1c9d28a;
    stim[46] = 517'h07728da348298e2695a249aafcfc6a4082ddb5dd280f179eabd96b06effbd72f4b608ce8176ac41e69c41c27ce290db96f73b1b0e23fca5bd6c9781698a1a7d964;
    stim[47] = 517'h0cdf6e51f8421fa5e877f0872241dbaa70ed8bfbd221e51965e474d82d560d88d2c028f3f24b34bd592fd2193fed2e1a62f9bc96aa0849633a72264a74dab46c6e;
    stim[48] = 517'h1f79f659e3ceb9bea4d6da8155611fbbf956288e7cb09c67648415570ef95417ae3c09e59b1ff3b07aaa8c04eb84c11a25c6e5cab6ac53c8e473c40102478c544d;
    stim[49] = 517'h1dd17954ffc3736742c9140cde8921926fd79c1b4b12fd82dbdab584a2e588e98d0912812199465c383fe5e574b2679272fb2a47fe04636002609bdbfec75254a7;
    stim[50] = 517'h1a51e932396ec11a35d270bae20c2f26014f152fe1e482de5fe1b584ac444c9c5337878473aeafc38945f038dd1588fce0e9e98bd04163b6c12cd652053ccd50d4;
    stim[51] = 517'h153af5d38fb687e64e1828a3967c1e65de6a16ef2d235d89f5e2023a0d55d459cc11e24493bf40fd8cf5e6feb80be506b765a5c025be2ceb565f2b46654e119248;
    stim[52] = 517'h0cee92aa62c8aa586c0644c3b24f89d22f73b99089088826c0f6e3dc3e8c508628736a40281241ab2970ca371db573c3ad18ec0101e7fd865fb2342f3bfe70b37b;
    stim[53] = 517'h0b628275863b309a8dc5127230ddbdfeaaaaf835b8a764547659b7af5562a794bbfc064aa6307298297360252fd9c605291e68751e611d525eee042acbb85e8acb;
    stim[54] = 517'h0bf859001a81214c5bde38b3e9666b01b20a493c01223c120affcf2f25586eec282f9799e4769d75b6ea4e0a30bb205bec906d72de3c4aee1fe247d6927f22660c;
    stim[55] = 517'h1daf4155b830d5999d6826f1536ad9e524e902ae6d7eff98cdd328312642f67edf21722a6dbba127fdfde925ea74862a97f8a293600fa20cff578e5ae8f82a602a;
    stim[56] = 517'h136411704601b97082f205b3f3accb2507715ee820dce3f173da7ec7ac07ff4599ca37da828043ac898d6ef026f0dc2b775be3b4db255de62c71d9bab5ff4c755d;
    stim[57] = 517'h08d86c55b52e16524297b30bd0ff3a1930aa978266b9602dfea30f2909ae0d64ac810a5cf4c7a82232da89932730b5093b3bd3805891c86a533f2305b70e339d4d;
    stim[58] = 517'h16d88e0c1357c8be526205027f9d2a6cbff475399fbc0f4f9588725123858c89c0e101d903ceb8b4e1d92474380d939e7b75d1b108ca0f010be7482e48e2aea1de;
    stim[59] = 517'h063d87f38774c87ec9b9db836140b55d145f8c8f8449005fe49d9879506f72f192a348be995b5966b3c2dd19048804c3eab9f2639d1789cb50a4469211495788fb;
    stim[60] = 517'h08ff3d02356829f16b80f76b1386fc6ed52553d0a0b96211d9319276371c0476afedf0b69a8719599ab2d50abaab9c932954e64e3d2b085f78fec53fbe5c67cc11;
    stim[61] = 517'h1b6168742edad7aae9d0535f5f20ab2f605251111cdb6bc61d45994bec4727f2cae1e3e65f4380b4e0b6efc3f51c772cf0477cc4cecfafd444b9a292009a5bb480;
    stim[62] = 517'h00ad2bec711084b6b036c34c53ca0aa6ea0b05a41b17b9940a7c8917d8b2c9ed5b7cfd9c16a1e89fa705bab04ba6ed305a692b49523f5f41b5e8fec9aba903347d;
    stim[63] = 517'h02cd90b0f7f903a547b0d91e411610e4084e19358c81c1afbd9beb157d1f36c3c0b8ce1fd6455f64b1aa39c83967050496132e6800e67d84a223f607529391d9a4;
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
      expv[0] = 16'hbc50;
      expv[1] = 16'h97a6;
      expv[2] = 16'h743e;
      expv[3] = 16'hbaf8;
      expv[4] = 16'h170e;
      expv[5] = 16'h90ac;
      expv[6] = 16'h542b;
      expv[7] = 16'haa13;
      expv[8] = 16'h931a;
      expv[9] = 16'h217c;
      expv[10] = 16'h92c9;
      expv[11] = 16'h4222;
      expv[12] = 16'hc37b;
      expv[13] = 16'h4946;
      expv[14] = 16'h2498;
      expv[15] = 16'h4ae9;
      expv[16] = 16'hdf84;
      expv[17] = 16'hc528;
      expv[18] = 16'hf3bd;
      expv[19] = 16'hfd5b;
      expv[20] = 16'he677;
      expv[21] = 16'h9180;
      expv[22] = 16'h3438;
      expv[23] = 16'h0d80;
      expv[24] = 16'hc7b3;
      expv[25] = 16'h6d24;
      expv[26] = 16'h12da;
      expv[27] = 16'h5c2a;
      expv[28] = 16'h6363;
      expv[29] = 16'h05c1;
      expv[30] = 16'he3ce;
      expv[31] = 16'h3922;
      expv[32] = 16'hbe00;
      expv[33] = 16'h3b8e;
      expv[34] = 16'h25df;
      expv[35] = 16'h9169;
      expv[36] = 16'he638;
      expv[37] = 16'hf4e8;
      expv[38] = 16'hc364;
      expv[39] = 16'h8ac4;
      expv[40] = 16'h0f0c;
      expv[41] = 16'hc6b8;
      expv[42] = 16'hbda9;
      expv[43] = 16'he75d;
      expv[44] = 16'h2b6b;
      expv[45] = 16'hba7c;
      expv[46] = 16'h4082;
      expv[47] = 16'he474;
      expv[48] = 16'h544d;
      expv[49] = 16'hdbfe;
      expv[50] = 16'h4163;
      expv[51] = 16'hfeb8;
      expv[52] = 16'hf6e3;
      expv[53] = 16'h5476;
      expv[54] = 16'h120a;
      expv[55] = 16'h5ae8;
      expv[56] = 16'hac89;
      expv[57] = 16'haa97;
      expv[58] = 16'h0d93;
      expv[59] = 16'h40b5;
      expv[60] = 16'h2553;
      expv[61] = 16'hd444;
      expv[62] = 16'had2b;
      expv[63] = 16'hf903;
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
