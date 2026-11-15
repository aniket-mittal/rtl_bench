// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 366;
  localparam OW = 366;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00945 dut (
    .extend_temp1_V_read(in_vec[365:244]),
    .extend_temp2_V_read(in_vec[243:122]),
    .extend_temp1_V_write(in_vec[121:0]),
    .ap_return_0(out_vec[365:244]),
    .ap_return_1(out_vec[243:122]),
    .ap_return_2(out_vec[121:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 366'h0a721e66e14fb07c2199c7feffaa751f44855b6282d6157bab893e5574a37fa4e9a7d6130778b8b81ca25cf532bc;
    stim[1] = 366'h38d00bd5312b5d4f52044d8435589445b04a4f40dee41c74c9b8b8164ca76e15d9fdcf4102ead1b9dc4d307f2401;
    stim[2] = 366'h18946238d7f677173731a64ff20b7c03ac112915331a84c5ccc7ec4d8a4acd27eaf5d62f7a0e7db6a544b2f93468;
    stim[3] = 366'h35d678140ba8ef1b8df9aac3ff42bc7bb21c979827b5ce4039143990bcbf2c7ff4a3d04c518876259be1da717896;
    stim[4] = 366'h0d817a8f910a6ce397942a3359ff7ef18386122684e003a2cab7d3fa2ee16a03b27c8623be42c1c0fbaabd2dee3c;
    stim[5] = 366'h2eb6eab16cd4ed2c8c880147949c3151a788dfca2eee3f8c7f332e7ac7309f592b7ed835e73d7bb37c7d0ef61630;
    stim[6] = 366'h3bb8321a21fbd590f1ea1b171c3d7e3cbc5b21fad81a717304dcc053563f21e427b81e445eb2bc290656e0efa071;
    stim[7] = 366'h24ad0f053a487cb66f1858109e9c1d9a54e3d7de372dc48baae103ffd681b18a9908e1f308f81e7cd916dc541afd;
    stim[8] = 366'h24c925dffb804e623f653976dea5b5555a6c4ea663df8d1a0abb9cffb460c44624b4838a94f3367f8846297580fb;
    stim[9] = 366'h111d46adeaae289bdb4139a66e1de070be3c4dfabee2c812087abe8e69072993c142f7a31298020ba5a3f7fc70f9;
    stim[10] = 366'h234ddc4c3cac7ca431d554a40f40647ee8d2a3d8de7110e841e39e866bd4c5ed8bf08951e7b41a03ac577f0193a9;
    stim[11] = 366'h256e89fed191acbd74159963999b6d54f18f8d94910f40f33c37c02bf97ff8214af911bb551761ca731246af604c;
    stim[12] = 366'h013d74e70ee64167c6d1c97a1667cd19e5003e956b28b8a5102ee534820d68ca23ce6fbdceea4d6606dec1f56b42;
    stim[13] = 366'h36c9ec78e907e7fb327629d81344bf6215813596adaea6fa7734ed81afa11e566780d76b3dd7607b390f5a4cd535;
    stim[14] = 366'h2e3a527a173a015c59386cca8717e11037f17d56545c60436b6c4122070b9e0798772fcb9e02ca745d0d7416262b;
    stim[15] = 366'h37f8ba582e007d1b42fa149a08e3ec3bdca71943ce8f04d0bb583ae7da917221cc278935f22f3dc3d6570e0c9f50;
    stim[16] = 366'h3ccc8767744fd4f37c9b287794fd338db07ee763541006918ba9d587d2e8e80daf6e1b28d159d4ad7c545febf5a0;
    stim[17] = 366'h0df32d5b2c2c82886c85702d422f54c18e43930ddd07f72c3885ba657ab57c46c47cb6747a97ef712f0425b40735;
    stim[18] = 366'h04e8ead325b5a6a3fd3c1673218052d31223510e6a99d13b8a84642ef0d037e109e591c97d445418a29eafcc8f87;
    stim[19] = 366'h02e66b75cbaaa6dbceb2dd996e9a68a2ad46650d777f4d62fe5bd2f3dcae869bef2b938c3c910b8d8d46a2f91a54;
    stim[20] = 366'h07b4d95a6dff8f30511d9937cc59d6d02765f2b869f01642c3aec36bd2c8d5af05f0b640819663eca4061fd54045;
    stim[21] = 366'h1613d5b14d34d0cd2739dd3db5ea348a84675ab98d15181f802bceb814f55c733c36d392c2cf7d50e5b4e85d1318;
    stim[22] = 366'h3ddb8d3c2fc839c336e7abe91430f10d02e9230289eba3ff4911002e86ee1c20987f70d679b50eecf0d242d29af0;
    stim[23] = 366'h3200df1e9aa39ec30a3c3a4d514cb7f9d43dc8b152bd262eb3671d66f5fb5a5ddfa2e9e44333d7d7f2fcdab7b04c;
    stim[24] = 366'h306f54dca733b0637a3ee8b9ed81cae359017ae9a54670bfaf17269f35e96ff96f614fdabaecfa29b9e03a6a704e;
    stim[25] = 366'h09229a6531beea28ae937ed557885edcf33cbdea8d569ac56290dd7064332600bcc31dd509011696dddb8142a829;
    stim[26] = 366'h1b9b46c753b1b8cc5a1a4a46b8ab57a0b8445bdd2df5da42f168c51322e7eba8cdc2f8ebc13a6a0810b658b07aa0;
    stim[27] = 366'h00a18f4360716d5cc735878db365135b701cbb37d6b8705abc8f78557f3b2cf565dce4c79f50bd51d6770214810d;
    stim[28] = 366'h3a484fc278d4a845a4fb356c8ffee65a04aa8537dfde38abc90cdd917c1da55a81f38acbba8a8919ba2795f29d22;
    stim[29] = 366'h187b367aa5fab62edfc3b2c59ea66e17218e47aad0b2095f2211c2b77fb17d2f3082e1a67018dc5cb3e9c220802c;
    stim[30] = 366'h1bf287c2a2698a3bcef79e05bdc8cea53fde2392e09fca53fa29f32d8a85483760e0c1adfcc07ddb5b42fda73d0c;
    stim[31] = 366'h01fbd109f41eda05d2963d90000ae948b87941e73788cd3cfb9bedb7f3caff9f46c1d64e501a55887a31cfb82760;
    stim[32] = 366'h0c12c4112cb74529e7f789d08f514668cf2297d7629146d660761b76a4b6a1c3da9c5c8c35aac4973fe79b4569b4;
    stim[33] = 366'h26c1c32812d5b3a5b440c9dd873d574533435521f91c71cbce0d4ed89e640ac5a9820c0b998719d2ac12bc4a5f6a;
    stim[34] = 366'h150f184cfd30249e7713f69609538b627e27886d70e96e37448b436a30a2912284b7eafa52b85f74fcdaec029505;
    stim[35] = 366'h24ac6c95ecf18e4cf00affb4d1ecf88b33174e626af097079b9aa289fbc5449ea1d907911a7bff68f4946077cd56;
    stim[36] = 366'h09189166836c083be6d5bfc7a6adbb56bc66adc6574c0d649048eb23291df0a89b0eb5e5ac24c8efabb3e165dee7;
    stim[37] = 366'h0eb92ea0b5e20f9e9546433db63bdd5b65e6f91a50168ea0d183f77caf112236b8fcca0df2562f2d157f3adf49b3;
    stim[38] = 366'h0d9e87fee6f0f38ceab914f0d682670ac5d5ab186287f1e6058b2433c7e3da3ac3bd1d8df3b4f245fef60b440e04;
    stim[39] = 366'h270f68673e833f6044311bbd121c6a8fea269a7163542aa1964265db724415e866add4b103e390f427e13d733196;
    stim[40] = 366'h2314b7ed972a73d9671740847e87589eea2abd2a5c38446ccba8085c47d42c6f3544b485c7255472922bb8c4efdb;
    stim[41] = 366'h07788dde556cba9ae30ddaefefa6b143a376671a9f66ef033213a8c040acda7afb40e0f1799f76b75b8993fed5cf;
    stim[42] = 366'h22f6a980854b0ffdd50cfcc7ca3c49760ac3e3e15df5c8d61eb261a1dfeb5a0605fee16a6edcd8e75fa3cf9b859f;
    stim[43] = 366'h16a788f641e38f61a152f6f7fc4ffeeface6108e0a0402b8c4b809909e53cd03fa0b55403b40cab9309d68e4c5f0;
    stim[44] = 366'h21e771422b43d22a77ceb596366943ed1d8389fa5ac8d14de22bdbf30679b89edd9f1dca04dab3464f387d6e5912;
    stim[45] = 366'h3f57df04e9d667a7d048b17ff64f6a81f1028ddd9c47a788b5305ade87479b2cb6d0417f26f815d2926e77a5c82f;
    stim[46] = 366'h3a8a202746ad9064d2031b341840672874aff3ce31f0e0b25ba4c0ee039a175595f8eb0f556fda127da167887076;
    stim[47] = 366'h2215210748e4b86bfaa46a8e91e046cda13b7ca7669b4cf147d292ccfc77d8e17122800a5132d58896ef9ce4e9ee;
    stim[48] = 366'h2542aa47d5118cc0c81bdab5f78fb0ae4a00fb38a9fe9ca090b4d14a6667365c62bb9c01f21c53f46c5c167bbe62;
    stim[49] = 366'h3c08ad99ce46be0a75ea30e10715bede651211d09ce0201d691724f6b81b446f551ab41080fbb214d90938b459f2;
    stim[50] = 366'h2f474dbd64be15145c7687670cecac9aa7fa584f0db779413d85c76214a1de1a0c090bd47c3b6f99509336ec0d03;
    stim[51] = 366'h0de0e4fbc65873739092d997cc6388b6fe77af5433bb83f71e218edbe96e7ab5163ef1b944eed183adbf86f546b1;
    stim[52] = 366'h29492b944488bbfc1f8ce87d2d1318dc58f46f32b74e035c9da1734e1167f794c6451b81d7044e28f83822204fe1;
    stim[53] = 366'h1e8f5313d6ee807ccf61608f4cf634ea9fa15f140066f6a0e9173b2816297520cd7e730af4248c814a726ac22d66;
    stim[54] = 366'h0c8de9a4663878e663e6806330d3fa4c8e38bdfd5b33981de23291c2f077b71d2cfc8038b5abf0a2147c0c09bd18;
    stim[55] = 366'h057c8383c8acdf76c3b4e6656596a358807630742b01652a34aff754f6d6cc2099519ddb30f5df2015d1f9d57cc9;
    stim[56] = 366'h29596c13570f6de618c5688afd7cead61b31740848e6d2d365e5357d9ade3398e15ab0fb2eea77c66241cf14e955;
    stim[57] = 366'h045b27f74a2f019b39410ffca3115b3d009a608336603491ef9bed42de4e08685955282ebaee46a341e785205627;
    stim[58] = 366'h2d6e5e7e48647c5e6a57c8384217d1894e6c76a34dd56f16568e85826b9fbf374cad17e558b3c54e9684d0782325;
    stim[59] = 366'h123b5a569bc3ea855c08500c9a155eb8f4359bba7626c20208d8502e4e2b5e3739f8ef3d68438ec570f70a5eeaa4;
    stim[60] = 366'h01e5b76eb3c1fe3cc174934d219b791fb88f6622da6b3537bc068a01daea9d0066c3b0683f569117cee77b9b1b27;
    stim[61] = 366'h1fef95f488f5ec22b7e6f2d6b7234b6523ec5c79c85fc644ac16a1fee89564ed94b03a00c452c5aa791d8fc525f2;
    stim[62] = 366'h22c16d17b1a6f9f52d8d79299aaec06195627dee9237f8a0440d0177bb113771cef8af8ef1f4abe09e18eae02d69;
    stim[63] = 366'h2ae8c00e3632c03ef11dfcd4d877644f9c0990c3c3a423deb5b0fce1a3536af5dfb18bb7fbc65604179c663917d7;
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
      expv[0] = 366'h3f7e9f7feb7fffffefbfeffffffbfffe93a69f584c1de2e2e0728973d4caf0a721e66e14fb07c2199c7feffaa751;
      expv[1] = 366'h3fddbffdf77bffffdbbfeff77ffaddf85767f73d040bab46e77134c1fc90078d00bd5312b5d4f52044d843558944;
      expv[2] = 366'h1efeeffdf7fffff7ff7bffffffbb7fb49fabd758bde839f6da9512cbe4d1a18946238d7f677173731a64ff20b7c0;
      expv[3] = 366'h3fff7a7f6fffffbfeffdfefffff7fdf1ffd28f41314621d8966f8769c5e25b5d678140ba8ef1b8df9aac3ff42bc7;
      expv[4] = 366'h2fbf7fcffb3becef9fbffffffbfffff80ec9f2188ef90b0703eeaaf4b7b8f0d817a8f910a6ce397942a3359ff7ef;
      expv[5] = 366'h3fbeffffefffffffbfffcffffffdf37d64adfb60d79cf5eecdf1f43bd858c2eb6eab16cd4ed2c8c880147949c315;
      expv[6] = 366'h3ffb7f9feffffffffffb7f7f5fffffb7909ee079117acaf0a4195b83be81c7bb8321a21fbd590f1ea1b171c3d7e3;
      expv[7] = 366'h3dff9fdf7ffcffb7efffdd7fffdfbfd62a642387cc23e079f3645b71506bf64ad0f053a487cb66f1858109e9c1d9;
      expv[8] = 366'h35ebfffffbaf7f777fffff77fffdbff11892d20e2a53ccd9fe2118a5d603ee4c925dffb804e623f653976dea5b55;
      expv[9] = 366'h1bfdf7bffaffabbbfbfbfbff7ffffff64f050bde8c4a60082e968fdff1c3e511d46adeaae289bdb4139a66e1de07;
      expv[10] = 366'h3fffffcfffffffe7b1ffdfffffff7ff7b62fc225479ed0680eb15dfc064ea634ddc4c3cac7ca431d554a40f40647;
      expv[11] = 366'h37febfffdbf5fdfffcf7ff67fffffff0852be446ed545d8729cc491abd813256e89fed191acbd74159963999b6d5;
      expv[12] = 366'h2fbf7cfffffeefe7d6f1fffedf7ffdb3288f39bef73ba935981b7b07d5ad0813d74e70ee64167c6d1c97a1667cd1;
      expv[13] = 366'h3ffffcffffb7fffffffffbffb7ffff79599e035dacf75d81ece43d693354d76c9ec78e907e7fb327629d81344bf6;
      expv[14] = 366'h2effd7fffffbf1fdfffdfddfcf7feff81e61dcbf2e780b29d17435d05898aee3a527a173a015c59386cca8717e11;
      expv[15] = 366'h3ffefe7dbf7f7ffbdeff75fbffebfdf887309e24d7c8bcf70f595c38327d437f8ba582e007d1b42fa149a08e3ec3;
      expv[16] = 366'h3edfffffffdfd5ff7effef77fffffba036bdb86ca3456752b5f1517fafd683ccc8767744fd4f37c9b287794fd338;
      expv[17] = 366'h0fff6fdf7f7fbffefff7f6efdfeff7f11b11f2d9d1ea5fbdc4bc1096d01cd4df32d5b2c2c82886c85702d422f54c;
      expv[18] = 366'h3ef8ffdf3dbff7e7ffbe3ffbffcbfaff8427964725f51150628a7abf323e1c4e8ead325b5a6a3fd3c1673218052d;
      expv[19] = 366'h2bfffbfdfffffffffffbfffbeffbfffa6fbcae4e30f2442e36351a8be469502e66b75cbaaa6dbceb2dd996e9a68a;
      expv[20] = 366'h1ffddfdbedffdf7f7fdffb7fff5ff7d6bc17c2d90206598fb290187f5501147b4d95a6dff8f30511d9937cc59d6d;
      expv[21] = 366'h3f33dfffff3cfcffff3fff7ff5fbf5f1ccf0db4e4b0b3df54396d3a1744c61613d5b14d34d0cd2739dd3db5ea348;
      expv[22] = 366'h3fdbafff2fefbfdfffefefedbf3bff708261fdc359e6d43bb3c3490b4a6bc3ddb8d3c2fc839c336e7abe91430f10;
      expv[23] = 366'h37ddff3edfefffffffffbffdfbfffff9777e8ba7910ccf5f5fcbf36adec133200df1e9aa39ec30a3c3a4d514cb7f;
      expv[24] = 366'h3ffff7ffffbfbfeffebffebbfff7efffe5bd853f6aebb3e8a6e780e9a9c13b06f54dca733b0637a3ee8b9ed81cae;
      expv[25] = 366'h3beffef7fffffa7bfffffffdd7baded802f30c775424045a5b776e050aa0a49229a6531beea28ae937ed557885ed;
      expv[26] = 366'h3bffdfefffbfffeffbdfeb77ffafffaea3370be3af04e9a82042d962c1ea81b9b46c753b1b8cc5a1a4a46b8ab57a;
      expv[27] = 366'h2ff7ffefff7bfddffffffffdf7fdfff3d59773931e7d42f54759dc085204340a18f4360716d5cc735878db365135;
      expv[28] = 366'h3ffafffefffff8efbfffb77fdffff6f56a07ce2b2eea2a2466e89e57ca748ba484fc278d4a845a4fb356c8ffee65;
      expv[29] = 366'h1eff3f7ebfffffafffcbffdffffeeff4bcc20b8699c0637172cfa7088200b187b367aa5fab62edfc3b2c59ea66e1;
      expv[30] = 366'h1fffffcefbffff3fdfffbfeffffbdfe0dd838306b7f301f76d6d0bf69cf431bf287c2a2698a3bcef79e05bdc8cea;
      expv[31] = 366'h3bfffd1ffcfffbb5fbffffbeffcffffe7d1b07593940695621e8c73ee09d801fbd109f41eda05d2963d90000ae94;
      expv[32] = 366'h3f3fefdffdff5fbffff7fffdffd7dfe70f6a717230d6ab125cff9e6d15a6d0c12c4112cb74529e7f789d08f51466;
      expv[33] = 366'h3edfdf7cd7fdfbf7bf7afdffe7fdf7eb16a608302e661c674ab04af1297daa6c1c32812d5b3a5b440c9dd873d574;
      expv[34] = 366'h1fffdf7ffff7afbfff5fffbfe9fbdb748a12dfabe94ae17dd3f36bb00a541550f184cfd30249e7713f69609538b6;
      expv[35] = 366'h2dee7dbdfdfbeffffeeffffef7fffdf27a87641e4469effda3d25181df355a4ac6c95ecf18e4cf00affb4d1ecf88;
      expv[36] = 366'h1bf9bbffdf7ffa7ffeffbfffbefdfff2a26c3ad796b09323beaecf85977b9c9189166836c083be6d5bfc7a6adbb5;
      expv[37] = 366'h2fffbfecfdff7ffef7d75fffffffdff8dae3f32837c958bcb455fceb7d26cceb92ea0b5e20f9e9546433db63bdd5;
      expv[38] = 366'h2fbfffffffffffcffefffff0ffdfef68eb0ef47637ced3c917fbd82d103810d9e87fee6f0f38ceab914f0d682670;
      expv[39] = 366'h3faffaffff9f7ffbcf7b7fbfffff7bf7a19ab752c40f8e43d09f84f5ccc65a70f68673e833f6044311bbd121c6a8;
      expv[40] = 366'h3fffffffff7ef3ddf73fe2bfffdffdb1bcd512d2171c9551ca48aee313bf6e314b7ed972a73d9671740847e87589;
      expv[41] = 366'h2ffffdde7f7fbbffeffdfeffffeffff9ebed0383c5e67ddadd6e264ffb573c7788dde556cba9ae30ddaefefa6b14;
      expv[42] = 366'h3affffef97ffffffdf7ffffffffffdf81817fb85a9bb73639d7e8f3e6e167e2f6a980854b0ffdd50cfcc7ca3c497;
      expv[43] = 366'h3ebfb8f77debbf6febd3fff7fe7ffff40fe82d5500ed032ae4c275a39317c16a788f641e38f61a152f6f7fc4ffee;
      expv[44] = 366'h3dfffff7ffebffef77eefffffefdf7e27b767c7728136acd193ce1f5b9644a1e771422b43d22a77ceb596366943e;
      expv[45] = 366'h3fdfff37fff77fbffffdf7fffe5ffefcb2db4105fc9be0574a49b9de9720bff57df04e9d667a7d048b17ff64f6a8;
      expv[46] = 366'h3fdbffeffeffd7fffb6fdb37f8cf6f7d5657e3ac3d55bf6849f6859e21c1dba8a202746ad9064d2031b341840672;
      expv[47] = 366'h3e97ffffddffff7fffbf6effffffdfe385c48a002944cb56225bbe7393a7ba215210748e4b86bfaa46a8e91e046c;
      expv[48] = 366'h3deeabfff7bffff7ff5fdff5ffbffef9718aee7007c8714fd1b17059eef98a542aa47d5118cc0c81bdab5f78fb0a;
      expv[49] = 366'h3ffdfdffcf7fbfbb75effcf3dff5fff1bd546ad04203eec8536424e2d167cbc08ad99ce46be0a75ea30e10715bed;
      expv[50] = 366'h2fffedfdfdffdff7fdf79f7feefefff86830242f51f0edbe65424cdbb0340ef474dbd64be15145c7687670cecac9;
      expv[51] = 366'h3ff9ffffdfdeffffdcfadfffeff7fbfad458fbc6e513bb460eb6fe1bd51ac4de0e4fbc65873739092d997cc6388b;
      expv[52] = 366'h396ffffdfeddfbfdffffefff3f57ffde5319146e075c1138a3e0e088813f869492b944488bbfc1f8ce87d2d1318d;
      expv[53] = 366'h3effd7fff6efdbfecff5ffefecfef7f48335f9cc2bd092320529c9ab08b599e8f5313d6ee807ccf61608f4cf634e;
      expv[54] = 366'h3fffeffff7fffeff7fefcfe7fbdbffdc74b3f200e2d6afc28851f03026f460c8de9a4663878e663e6806330d3fa4;
      expv[55] = 366'h277ddfdbddbfdffffbf7ffffffdffff0826546776cc3d77c805747e755f32457c8383c8acdf76c3b4e6656596a35;
      expv[56] = 366'h39fffdfb7fbfffef7df7fcdfff7fffde63856ac3ecbba9df1989073c53a5569596c13570f6de618c5688afd7cead;
      expv[57] = 366'h36dffff7ceffafff7fff7ffdfb7d7b71a16554a0baebb91a8d079e1481589c45b27f74a2f019b39410ffca3115b3;
      expv[58] = 366'h3f7fffffff77fffe7ffffa7f4fbffffcdd32b45f9562cf153a5a1341e08c96d6e5e7e48647c5e6a57c8384217d18;
      expv[59] = 366'h33fbdffefbdfffbdfc7f7f7cbffffff8dce7e3bcf5a10e3b15c3dc297baa9123b5a569bc3ea855c08500c9a155eb;
      expv[60] = 366'h3fe7ffffbfebfffddffcff7fbffbfb74019b0ec1a0fd5a445f3b9dee6c6c9c1e5b76eb3c1fe3cc174934d219b791;
      expv[61] = 366'h1ffffff7effdff3ffff7fbdffff35ff3b652c0e803114b16a9e4763f1497c9fef95f488f5ec22b7e6f2d6b7234b6;
      expv[62] = 366'h37ddeffffbefffffbf9dfdaffeeed6fdc73be2be3bc7d2af827863ab80b5a62c16d17b1a6f9f52d8d79299aaec06;
      expv[63] = 366'h3ffdff5fbf7ffcfffbdffff7ffff7dfbd77ec62edfef1958105e7198e45f5eae8c00e3632c03ef11dfcd4d877644;
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
