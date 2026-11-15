// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 521;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_020933 dut (
    .clk(clk),
    .rst(in_vec[520:520]),
    .input_update0(in_vec[519:456]),
    .input_update1(in_vec[455:392]),
    .input_update2(in_vec[391:328]),
    .input_update3(in_vec[327:264]),
    .input_update4(in_vec[263:200]),
    .input_update5(in_vec[199:136]),
    .input_update6(in_vec[135:72]),
    .input_update7(in_vec[71:8]),
    .input_valid0(in_vec[7:7]),
    .input_valid1(in_vec[6:6]),
    .input_valid2(in_vec[5:5]),
    .input_valid3(in_vec[4:4]),
    .input_valid4(in_vec[3:3]),
    .input_valid5(in_vec[2:2]),
    .input_valid6(in_vec[1:1]),
    .input_valid7(in_vec[0:0]),
    .output_word(out_vec[65:2]),
    .output_valid(out_vec[1:1]),
    .se_stall_request(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 521'h1e3eba93782c1592fd922529617d574667f93cd8aa6f69e9f4d661945ab4b24693fc2a70c2258eed55af873e402138adf52ffd229717efbd136f3e1dd3fe3c5957e;
    stim[1] = 521'h1749d7a4653f2f92cbc49dcf8e4f074964b593c2db28d58eb7efd819895b5cc5075ea8d02ef986496f01484ca4648207e360c7a24b80e4f4b853e9adec1abefa838;
    stim[2] = 521'h098a077cb1ac93ddbb65809670dabeafdff3ff1c92fe7759916db5687f2af77c3e8797d3cd6de85133340f149a5eccc6c1f3fe8576d5ec8c275868d281ec5fd5585;
    stim[3] = 521'h0bc187ed39c288705bdc8fb9a178e0c6e678327f50075d0b0ab2638277f0899a7a34a9de4da0a56347a49c3f8aa46b322fab6f26eff2074de0c8376137a03d178c6;
    stim[4] = 521'h0f5fa00132265c6e4a528a82c45011e8ea1d040963dad1274766d82dcfd9318d5dccc4d150ce869ba240c340740e98cc9bc1a46428d95a00152293e9038d3c46574;
    stim[5] = 521'h06e2b81c19c6d417f1c4640b0c5909d432fd0f9f8ea52bb834f18fc5bc964638f630c46da367041b06460a180523ab49e25ad298ec0832082586d5e0a4b2bd77d14;
    stim[6] = 521'h0ededce918b3ffeab233976ec4ca52cba73a1ff7f2cc0c62d6f8f263552a7b975e9828270cb226e07e51b28bc552f336d9ec77b088d2f5fcf61b27174b582c21a61;
    stim[7] = 521'h05bd60d7c11ea78231de987075128179b4b7d9bdf7c02f1e36dff67b9e2cd2e4cd2736715f07661aed0c64a685ac99e8b80312f29b1208c2c23eabe42dcb192be43;
    stim[8] = 521'h0b70980c170d4d2562469026b99e9b3069771fb2e7dbb3081ebf57e2b942b5a53726367a28583283d0614f4226eefb371f55bdda5148f0d9a4d8905aba1059eb8ff;
    stim[9] = 521'h0beaa551cb1ebd0b1e747511b4cb03021f714047b642ea45888932c804c04adc26d71ead85ec43be3c9f7b52ef7ce10f287f8476edb89a57fbb1edee8a45315986b;
    stim[10] = 521'h076313452b0453464ff9e8d0b54eebea8d86e802b6553e1f362fe379ed10095f3c30169b799bb13435a6ded34aaec4d211b3f1672658ecf7a2682e569f1a9f42d48;
    stim[11] = 521'h0c3956e6dcf391308849320ea847c05f7299670d3749bdce87805426d8255f7f2b7bc045e28af3ccc336eb4824a6b71cf5265971b07d03751be59b89145ef20ce6f;
    stim[12] = 521'h03907ce03734b4bee955cdfb5f6d87a24c4bddeaee31faa4641063a8e13e03848711247f80c17ea91cdff73f3f30a0718572a729c0fed9c8a4d661580954b110c6d;
    stim[13] = 521'h0155454a5ee786d7de44bc875bdfdf750d48707dc0a0e9fb670dc18984c9905856e8570e7f22491fc4048c4b8c74b422aad64aba0c0bc4c80e377af130f5865a602;
    stim[14] = 521'h0545b71d2d4b26f74e109d3b9c81e54820718b33d7c8acfbebb5f36d0da78619fa7ff136a76b7ad2feca7115ba5344b049dc754ec033a6b3427c6b3a9ddc6ceccb4;
    stim[15] = 521'h05c9f45e70260580a5791d12d040b6302e6352a3d0c5364f6bd8170e6fe662cf93ac256fd640702623daddd856d5cc2c864545133a69e574dfb8b019282d89684c0;
    stim[16] = 521'h0aac68f37b0fd2a3c8d7846b7a698cde2b24a8c28eb64a0fc5e40d9a5ab097cc7a1b942b4b7430daa1b7f754f0376c8cbd7cdc33e6636b3cbc3dcf0b363434c4a0a;
    stim[17] = 521'h051c63fc77dce24fa8777353cb7a9dfd488df09720797df9a8525e029ceb2cc83ad3106f5a2b3a42f9def8324eeb1a42e0d38daeebb3636114cc6b70184efa90154;
    stim[18] = 521'h0df3c31afb77eaf2f051bf6c9987a1e1b9c5063072b9e24094e98cd007dfb09943f34663714fe972d1b34bd65a6a84f5f64525c9681dbe195806c111d42257e7b8b;
    stim[19] = 521'h0f17c2e9850f830daa2bb223ab3278e91e93850f0854b68cd48bd7667b15e34d7dce4a6e9e811d2f2565f8b3e2a3ff100a97db009805f7b90fa3280cb06240bb43a;
    stim[20] = 521'h01eb2e0945f4d20d1e040b45ab678a65e5c20340f30b5ce4276fe971b5de97f88f9bb3ef1318874f06fcff43effce8668dc81c83f9d0d3c7ee9607f1864ebc1fad5;
    stim[21] = 521'h040f516c36a421863eb6172417db5517908687edc533559525ec2b54d1210a77f5e6247829ee6e38019c13046dde4a79818b0d4a839ee08fa40056d39ef272ae16b;
    stim[22] = 521'h0437091c0658ccd04535d6f70c38941dbba62df672b2ce51b1d10421a8d9fc825efb54d166b4a6739a49bfaf2d9cc471cd812d8afbfb6298c7714025832c1434a19;
    stim[23] = 521'h0d50394cb627eb82e871a040c06e2bc58098967d8a29819dff7bc007031fc1a56248890d465fd8a85637eb42bb970454e52de113641f2226612677c9b8041d9dc7a;
    stim[24] = 521'h05d18f52a8aee81262555f98a5c2103aaf29284166c461b59119b39c9c66c890aeb28b00d8ab71dd32977fe49b00a4891a087ad41b824b9f147d098fd3e3d224807;
    stim[25] = 521'h0c9c689176f91cb680e2061ba88d5c99ad5cb06ea7cb5e700d70ec7a8c45ff4401cd4f3e6de1276b5c63edc33018655cdebf33646e3ad691ef81caa834dec87eb19;
    stim[26] = 521'h07726f508a10d991279d026c64aaee463016430780e1494106019e16e66d905ce6e4f8926223d92e79cac8a6fced8a0578616c7f64d3676e707659d3cc8165166e4;
    stim[27] = 521'h05605175cfaa19da48c1471affad805388cf94de6656218ba5f5ab1b653a7b4d5fbb650e117bbf6baae9c30412c3ce9020398c7667380904fddce9e90c7a7d79354;
    stim[28] = 521'h0b2e232297e44c96617be152f66199165c632b593eb427dc1a5ede34fd4afc4578d71958b1a0f8c5746795f8aa4b34cd2c9c549c919fdd024c930af89036e08e526;
    stim[29] = 521'h05c3b104f0d1174057c1a83d67ab7a0eb40da5660cd8971e0b9c0d9a6ed8523b9e8c8c1118fe86df65573dbf61f6b87821666fe8d15802f852197d2bb177f4e4abc;
    stim[30] = 521'h0fa45f4e8de7c1717573453abea3b084c672abca50e4481ac3ed2f47219803f8f8857835607f5f184269696a89c6bc7ba2c84d452a1a284fb5eb3439643ab2634fb;
    stim[31] = 521'h03ff227bf17510d0e5a88dd353a7c851abc226a9f73074b953c0c22e0c09184250a59f502d30a179292c8c88abbbf9908eb532bb18c2dfecd3129662fa30ed84471;
    stim[32] = 521'h0aeb3faa1c742ba0e89d9521ab73d98883969f7ac8d1f8903ec1f3325bc41bd7aee10b9650588887dbadfc68a2becf1ba48d219f4abed00d666eed8318a324837c2;
    stim[33] = 521'h0fb61a42983210dbca4eb67c077f6c696b2fb21ae6d829e2b47193ea8337d27ed2ca850ad8f6933112febc9a50561f77c388082d9758c3f37fa1aaef4d49c0308c9;
    stim[34] = 521'h05cab4712da61259c2afcaa804f1d522bb36961360d3a6ca35437a7029881800367fc15b6e2d37d4bb2c1c2b41bcd872b1076d9e43de5bce213af30fb02a0b90074;
    stim[35] = 521'h0a033981002f1769065cbcebdaf689d41a17ddf86c2808d3f0ba8e33a199082683c1587d65c020634f1c64ad72ed34d6c9ff0c8cac3ed4c457ec14ef3307ce8aa33;
    stim[36] = 521'h058bba233da29604b0c3328011dcdf9c7cbd95948d84f4f3caf2b5c7a886f3475451e921e87e8c8c7e6ff33aec6c50dff7437e18fe9c36b7cc333b8de3e5e7a91ab;
    stim[37] = 521'h0790d8409946bbbd685036764d9bd01cbadd97ebc3e9fc58dda4b15560f55a6b31777002274b6b1826ee16a89af37c5fce4f1adbcdc0337345ae1c83f9eeaed9205;
    stim[38] = 521'h06456651b014474e5dc3c2f504085977618bc670ac3b3bbfbcd63554521858bff4327c7a6f8c77ce5bad4d6da564ddfa9e0a490d3727deea8a6406f6be886f826dc;
    stim[39] = 521'h09f6866a323a2bf07e8a211f9ae8778c61d862f0b5c2fb897dd7af4f11127157960d41d3773ce80e659996aba8f7cbc01057c252323ee3bcc58b709b30c570dea37;
    stim[40] = 521'h0167745ef40b60e8d64a91fd6474a59bbb337ae008431b1e913f4ad8efbcbb084c45ea096619bf3eeb47eac09e8520a4e9ab927c2b9da9e2c25a5878de0759cec75;
    stim[41] = 521'h047296c4a529cb19773c8354c9a94e33df457016f72bcc539f43e447c3178bf2ebb6bb16932cfc2ec97e5569f0b4d63ee8a863b2d4a1361ce9bf22122a7727b022b;
    stim[42] = 521'h02458f1d6618f2c3d415dc88487fcc07f40898183a78fed75b390820b988fec0935492c5c44e6c9367b1aa6fd4ee301a891872a9e5f0a3c101d32b37818c024e8ca;
    stim[43] = 521'h0bde4afaa5f776838299f6ab0e71695c65f675d4b4c3ae5d5b3e75caaa63056513dce001e54c91dcaf2511634009fc8f57ecf570e6c7efca4418496e19479d0e62c;
    stim[44] = 521'h012bbf533fd45e11d567f5ef9905ffa6144e03036cd10e0e863d6e489da83608d26143bfd53f9c032670eb81f5fb489b228013a03eb8dc7018873516a1471141939;
    stim[45] = 521'h051ba8a10c72cf884b2bf26a7a6900af1158759504d37c3f6f181073a604c7de62b33798617497404036d54e4b6c8f2d0e0cc517778305e2116e6a1286034b980f3;
    stim[46] = 521'h052e1b9823641fe939aafcb7204aaf0c696a155f43e928ee31db5ab709524c6e68e4865242b4773eb2f79c5b7dd21ff1bf42d966387a8edcb44f54edfe64161d950;
    stim[47] = 521'h0a4b398415a22e0905c8a6cad4dc57332fc93ee47ebe3c983f62c4af19a8a001e9d3171b7495365d444a8b9c84d915f44908cf3b29832fce4ad6278938c36693c04;
    stim[48] = 521'h03739e64362c7b3289f487d611cb43ac98ede48883b0602c4945c3c9e49c534532a177862ccffad4b818d94b61f66a8e1087f59f9c9b30255622f6789a2529f070f;
    stim[49] = 521'h0dea2603743fcbdbf4f2bf6c65b1abade36182ab7712f6091056f3c3b5941838071300b2644042405e8903b7cf1689eb8dff9459a8f7f1ff19f5bf8f56beab50d97;
    stim[50] = 521'h069874a1375a8d570f94a51e5726266bb6579f8288e4760a7c3d16257722774f80453c75497c7337c38cd35a8ba0e7e26fdbb4f0021064168195f01379aada055ef;
    stim[51] = 521'h0ef664ad8c6bf0b6ed2a25ec98dbcd6fdfe7cc95357d7fbeba1a0a61ad01da481bc0e2a7687e57682137d5906a82db75c5b2e037bc93991b4d3f4569fbc3f0ff30f;
    stim[52] = 521'h0041000042f38709597baaaf4953ec70b769c5fa22822922e05e104eaae068b2609563a2bfdeea2197163b43fffbfae6814f02642e24d64efaa005cf561c3b36f43;
    stim[53] = 521'h096d6ea9399ccfca6818feab4078749f1c479749035294f749196136640a42e41c4084ad36deaa814c4192af4ba7c465b58f3bda81f64b71c131cc117792dd7ee28;
    stim[54] = 521'h0c8333f72bf1218abe1d78b499bf06f057a04ced2ef9e91e6e1ea5d8bb6f19dd2089ae6aee73d3d3f2ba41c2ae263aad0ddfb7bdf739b3559ae7f1f37b18c4522a4;
    stim[55] = 521'h0147a78a6ed0166f5993f10b67cccacc7d747d6f9d39d9d85ef482633a0d6182571a3d723bfdceedf779a2ab2c0846e94b3e46b10689d9f13444957fc880e47cc85;
    stim[56] = 521'h04d231ae2a84b01e7f7226083a0530a9065e5c76d57cce9236a8d71dddcd6b97c2cc587f5046a0be1e61b685852806a7794bd60c4725885e7ea7503f79299557e70;
    stim[57] = 521'h02079565666ead10bfec077a4dc1b0b556e43f2b06d7e6d029619dff975275dd1d2b1f6f96f97ddada3c0b1ddab6302522bdaad4b2ef381db0eb1fe7a832b6eb4ee;
    stim[58] = 521'h0f53404f6feaea6d7e9d123693a336439b7d83f40f3903703d9e1b3f905845e8b4644888c4d282f44c670f97dd551a790c3ba6d988e9734a4432bd6ed64bee1fc61;
    stim[59] = 521'h071a08021de6db836999eb88471f0b5522cef011424f84840d621f6eca2fc897071a5a132a78c2b6393db525c4e578ce87b13d6acca92471a8e197c582a409e1958;
    stim[60] = 521'h06f934b8cf8d79a401556981cd28cc510ad58cf52b2617c572f73e7b71e801081c2dd757fe758bb11d42ca38fdcbde82d141208ec68f0246365fab63e343de95890;
    stim[61] = 521'h0109ebedece923eda4f9dbabc994eb43fac192900deef45b97ecc3e729b6ce547984ca83433c970f12ac6390f13450e0e126a44bdd4782a2a29a01ba5baefad0fa8;
    stim[62] = 521'h0dc42e75c2866029d7852d69b25494b6c476cd0188fd1b49d1ae35b77b5cf10a9cc78de98f0f9bed0c83629b08abab316358b7e8a21e7bc79d1f50004c116950707;
    stim[63] = 521'h0f7203c02415a295b71e33cfe31f27c159884cb065c3ad831244bde507800afffd62bfdce95ca86924b3fe31a0d851171f23853c58685f283de057695694fccbf52;
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
      expv[0] = 66'hxxxxxxxxxxxxxxxxx;
      expv[1] = 66'hxxxxxxxxxxxxxxxxx;
      expv[2] = 66'hxxxxxxxxxxxxxxxxx;
      expv[3] = 66'h00000000000000000;
      expv[4] = 66'h26281df2c6b24f76f;
      expv[5] = 66'h2d960259c36afabf7;
      expv[6] = 66'h3fcffc724bf9dd667;
      expv[7] = 66'h05b6d5a1fcabddf0f;
      expv[8] = 66'h3a1e5f4f35b7a144f;
      expv[9] = 66'h0cd03c52697b331b3;
      expv[10] = 66'h07cffa15db57b230b;
      expv[11] = 66'h1d61a34a07b17f556;
      expv[12] = 66'h1d8c4d14ac114d193;
      expv[13] = 66'h3fe7a342d53bafaa3;
      expv[14] = 66'h361ba00ad954f87cf;
      expv[15] = 66'h18bf8de7b440257cf;
      expv[16] = 66'h30c05a6de66ec4d0e;
      expv[17] = 66'h1727d179c0981602b;
      expv[18] = 66'h15e4744b4102d8c0a;
      expv[19] = 66'h14718ff1df73893eb;
      expv[20] = 66'h21ddcd4f2dea77f53;
      expv[21] = 66'h2237c25c81e5f7e6b;
      expv[22] = 66'h2149780a73acb320f;
      expv[23] = 66'h2b4c41bd68ace90bf;
      expv[24] = 66'h277be0c93bac690ba;
      expv[25] = 66'h3540e532d89fae0bb;
      expv[26] = 66'h21c6810301b8af163;
      expv[27] = 66'h026259f628a60677f;
      expv[28] = 66'h3def001c0c7f0695b;
      expv[29] = 66'h09222435197f62a17;
      expv[30] = 66'h18dfad0aee5c1153b;
      expv[31] = 66'h14b7844d907c8899a;
      expv[32] = 66'h3e917d3a379f05c5f;
      expv[33] = 66'h15cd14eafa8ec2133;
      expv[34] = 66'h19caaf294391206b3;
      expv[35] = 66'h0fb4bd1c86600fe3f;
      expv[36] = 66'h2215e0d581fd7c613;
      expv[37] = 66'h09a5a5aa271af1eeb;
      expv[38] = 66'h0b213514a868a13ef;
      expv[39] = 66'h17acd0e590eac98d2;
      expv[40] = 66'h19159946c0511d397;
      expv[41] = 66'h370f0bd4102165ddb;
      expv[42] = 66'h062f19c2b0eceefef;
      expv[43] = 66'h3358d551486162fff;
      expv[44] = 66'h10c9f1e9be31df397;
      expv[45] = 66'h2eb535b6959377ea6;
      expv[46] = 66'h04aefd4cff5178477;
      expv[47] = 66'h159fd7be6417fe987;
      expv[48] = 66'h11380c0db344383a3;
      expv[49] = 66'h18f5b92276a0d8237;
      expv[50] = 66'h09850eff54fe700cb;
      expv[51] = 66'h19c3ae07d7ed226cb;
      expv[52] = 66'h0a004e80fae371c07;
      expv[53] = 66'h221cd45a851c45066;
      expv[54] = 66'h010400010bce1c257;
      expv[55] = 66'h25eeaabd254fb1c2f;
      expv[56] = 66'h1da717e88a08a48bb;
      expv[57] = 66'h0178413aab81a2c9b;
      expv[58] = 66'h02558e8aff7ba8867;
      expv[59] = 66'h1c58ed0fffefeb9a3;
      expv[60] = 66'h053c0990b893593bf;
      expv[61] = 66'h2a80173d5870ecdbe;
      expv[62] = 66'h1be4d2e33e35e6903;
      expv[63] = 66'h0555a60734a331443;
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
