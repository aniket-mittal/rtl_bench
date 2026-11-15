// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 517;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_072097 dut (
    .clk(clk),
    .en(in_vec[516:516]),
    .rst(in_vec[515:515]),
    .available_read(in_vec[514:514]),
    .data_valid(in_vec[513:513]),
    .read_data(in_vec[512:1]),
    .pop_data(in_vec[0:0]),
    .request_read(out_vec[17:17]),
    .available_pop(out_vec[16:16]),
    .data_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 517'h0ca947dce32e89076c96ba17a36dd3b1fc6f905f586669e81ae51f6cc893cd5fa731a15ae08d9227892d262740231d685e1c25bba28f4030231c49fe5d498ceb3a;
    stim[1] = 517'h0bb0e1a404c5d874ab85db5a83afe1c6b12c3315e3fc8d2b08b69fad7e6c92be3a638953c2ba6614250df0feae98b676bafb558362b6ddde65901933e121d834a4;
    stim[2] = 517'h00e617b0e7617151a592bf6b681ec73278bf8acec6487a5e64922a4cb082f14f0b6156d38a9453633f3f61d998cdb44c2865718de223e06331177eec713b140263;
    stim[3] = 517'h12d81e003862323d53dbde7ebe59279a90859c0e40d48d2a2bc6cca5837492949d902664c9f5dfc064059717ff7f9c82a64dc41ad52b8422390cda00835c5b6826;
    stim[4] = 517'h17dbcd379b49b3fbe6ca7f27f09ef8750a1f771ed872221de7eed5e10a3860e9383cd7958903460c3eae513bd21d07e2b88705d34cb24ef20920d83d71eb91affd;
    stim[5] = 517'h06408a5427152eab6a17673af7dafd1c8aaad5c90b0ba3aebba264fa09346bbdf0bd7363f8d2a80e8c5f029942b7d4dffa155f818252cfa9344331053c62d2aba0;
    stim[6] = 517'h10ee2855b8d1e92fbeafb667f78b2fb1c7c81e3dc30dafaba8282ea2d22fa2ccff14136383cea1521a6cdb9e9b3c2344215462d599469f336df583b4c7bb96b32b;
    stim[7] = 517'h11cba8a0516c50aee33637ced7e60d37faa6ae05621f12591f31d1e1d922de235e1d91616d596b0573138b3cb20a3acc214d80dfcb12ee58a6985ce9aa83e41785;
    stim[8] = 517'h0575c1918cf989841303cd004d06aa0976e4b4af5bf20d121b39cf7697926b9c45e477a480f8b9f2335e3b5f6f9e4646d33b8b5b237a0996ee928b1f66ea7a1b56;
    stim[9] = 517'h187599fb38b8ef6d3f80e8703dbb5a361a555996f69a282647b37a44bdce027465778a5e262c874a9db1375ce7d5153ed22985f78cb56d821b3069eca9647f6cfd;
    stim[10] = 517'h16a5401a4fbd91dd098819b6172aea4be031eecb46580aceff4d3cf1fc346738954cf404234a326c1470541eb9fe6cee4adba8d14da2a1750a5b94a759f3d57b80;
    stim[11] = 517'h023ed61d5dd76855b73d0c5ebed6c405565365fa2b5fd4cc676cd07495d02d2c920ec3c6f10d7004d476d8ef10875fa563c8e95b247b0594584f8e2ed69db4c1cd;
    stim[12] = 517'h06da76781f7a06dea3fc5cf17ac31edf76c4de23868d820ac2b879d631cebf15d008432b6247aaa83924fddd4d420cdf96796827bf36414a80ceb2dc92e7ce24c5;
    stim[13] = 517'h11cb9160babe8f1efffe913af92b3ec586919fca800afdcc05f88b09cdeb784693af817e966e12ae9c6520c8ccde6d1f8a98f0b91881f870946ce1e4ca3a75f717;
    stim[14] = 517'h17d64d51aaacfa2aaf7300d309be969e6bb07b64f6c3b30ffc12b8b6abd9be4c33189aefa1357393c7bfcae42c0689a7571d5292581a198e36bb2ecb0ed8622aaa;
    stim[15] = 517'h1171faa5404e176be104d1f1eb3d86e4ff98ac0ed6cb29f90f2849f078965be0ee1369e5bf1b25a6e0381cde2816decdc5dea0f721026dad9e2bd601b0849abbf9;
    stim[16] = 517'h044a5635673179d2eacad0ee29183a823690a27ebd4a9c70cb0198bdff00f7784a93d8d56be9536896cb9073a3f17a719037c5ff27a45f56d5d44384da61ddfb05;
    stim[17] = 517'h10fd2032bcaacb30af479f16e41a927d8f8411790c83c45016e170564160ffe4ee2493b5be9e270df96551f3d47886213f94c8ae64bf86af31d8900fb55fd04b39;
    stim[18] = 517'h118d7e8f3cd59c9b3faa432a2413dd7e9f338ee900aade7fd05efc9a3a6dce8b13e0c1792ed244841e43d4fc02af7cda21f2142f1ecc4d0b13265ba74e4c95094b;
    stim[19] = 517'h15ff9d15228044dad950d1834439d240b7324d0ce4780963966c3b09a7de0c6d3a2ef216303ec8f5b16dc4b3b9022e46bfa061069673f139cc2a7d0f7a876346ee;
    stim[20] = 517'h0117192496ee12b0c5fcab4d274b8c227f71bfb59cb2c3fa09e2748e9da444874baa6bfd87d1c1fb42d692e2e7d7a1c372cdd85d26fadbfa5f410afb5eb5c71c4d;
    stim[21] = 517'h13b6dfcee5bc50c29821b0e1289d70b90043c31847313da222529c292c55b5372f697f84ec99c1fc4d271f0c42a9515ca3bc649cd118cd84c1c94cd1d025538d75;
    stim[22] = 517'h0710b8ffa047027bee2f70ff06060fcb0072eadbc222b28f70e2d1a1c95bd0f2f7980914d0b47997d95e0283b2608d89692128bbd5d749ab6bf8e2af469c9906b6;
    stim[23] = 517'h07e1666cdf41ddf4f56a8ccd738830fe1ac1abcbb5e031b716fbb4cdb77469596aa955da11d83e60ab4046df1e2623204db1e70a63d4bbe1aa286471c93a04b049;
    stim[24] = 517'h05429e4b8ecb58ebbadfddff8918ae9d657f0c8fa54205b6cb2354857c0cbab8913baa804408ebaef7228f2f6c4f7a6e7790a879bd037e2ba3774866e9b11bfabd;
    stim[25] = 517'h05ec02e03cb5b9ee62477f1377492c659dac80e555585ee61f3f34da844c389111b370385f0ce920aaac17f976eabbbb8a1879c147a5197dcb88a33a0c94ddc9b9;
    stim[26] = 517'h001e849160389ea90a9185e5e7a25765d9ce40ec641a93c0e45a3d246b9e697e6884a36da85bf86547a6d67fa49c78b9f74e8632e304df0d2d1f3094c2b918662d;
    stim[27] = 517'h17c8b9c0c39a0f70523fca434b4e118a1f8e0c5ccd8b47e814822c526f15a98a9aa44231b14a6b220252f040dae211d6ce8f70cdb7bf5a6b4c730d6fe0f7236325;
    stim[28] = 517'h03eaa2792de3404dca42983264fe88678065aff37f81a95644bee2b3861ca781c4a24deee09589fc84923f26507cf4d3beb1451b84377f04443859872cc13ffac1;
    stim[29] = 517'h103788ecc7411e205a4f5af5195758d3779efe82d23d583c1047ab7db3f3c2c1f4449492691088e7017b9de67ccf8dab9a85962c64ccc4c58ae68afebfa6a51fcc;
    stim[30] = 517'h115e8b0d30c932533e36bd419a5279326f13a0b642cfaefc642b4909dfd54fa11954da814b8aac9f7a537c47d18f972612a5aafdd13bb0ee91b8b54f804c383c46;
    stim[31] = 517'h134da67ff6b47cc3cd400a54372d9dcdbcdaf4d478877ebfc5db3218c087c94aaa6d52c8eda42f48281fc359a766d9705964da2e42ed831063d4b8d636e12a852a;
    stim[32] = 517'h106a97afa55f9c436a495f5ff40bde0f66942b962f78735d5665684a2ff45a874aa8780991f3205c75bdb20ae733e4f104986601195404c3d230575bd51d7e3493;
    stim[33] = 517'h17ca12f400ff2440dface9039ee2e8bae653702d0d0ab8d7df487839d835d0845c1686c97023ab58eaba79e88d95d347c99f2595f2064dbf815326f77bee743aa6;
    stim[34] = 517'h0094b4d60b147c53e0088cbc2526688782407e88b082a95d7cc753194c541e49fccf36f850f7f2c58112facd6de8336e161357d5054eaf1421de3996148e9cbeb0;
    stim[35] = 517'h119e3d2a64b8d5e1205462151d17963bbf7803f96122a3a32487f8387d7068227365eedfd90c56dee0cf9d977d2bb1edc1d567b333173e85b30720aa40989d6805;
    stim[36] = 517'h15f59aeb7a7b1edf8946696dbf1f93ed847a1b804eba581fa70b31f1e1fbee6b840f6883c6d917aa0e2bfdf888a32af8ed3c354be47d532ac6b12922c33af7fcce;
    stim[37] = 517'h13ff7fe04fc167981ad3828fa69d0581f3671bb3c64113d14bdbd3df5dae4e0afb813f36408c0839afe551d834d38899849af7fb4f101a17b45e5f231cdba1d7c4;
    stim[38] = 517'h05b132136759f1380195a9ab52738fb46a1496f14fcb5635c1f023d3c3d562652f7f6dcfee4e20904cb48de95262fb68f81bd6d57d02946973c8f5f875aea7f9eb;
    stim[39] = 517'h07e5ade0b17fe56e140f6dcbaff152fe8e3dca7c51905f548b8a34f37abf8e15f6d87831b82135046654a001a476f3e2b625f0a3e4e7a78795e71701cc29fb3966;
    stim[40] = 517'h06c3fa8c0af6e365fd9b0df77bbb7105f8127e6d712de2fa31b78f2485d439022fb8134657cc6642d09a1c5900fc7e3ade3ebb879964a659637fa69b9b5ffd05ae;
    stim[41] = 517'h118bccae1f3a0e0e0113607d772f871c7484bf9cc9374116a4fc6eec7f0ef4a7dc0a19cb309afea2e806aa397c48867a5127771297449e2996f9f6dcea0baf352a;
    stim[42] = 517'h14770369b2ebfac6a00dcf2e03e39a41919167194c88092c84617062d61b3ff87e6d730e48ce7c95c1e1e016c7e0551a002543c6e9168be2bef65146ebb5b7b1ce;
    stim[43] = 517'h1597d8fef1f495b2d41f43adc41ff9e27a83a43eec15683fb765d4fa77873d16df8b9037a3a4ea351b0a92aa97287bde2c488fec691c8c77a8018c9ba980fb4d23;
    stim[44] = 517'h1108b671fe59236c88d12fb5d69add34d52a4c6befbc4e1cbb94bba756430191acba657025592c902e3231014d7a471ebcb52cc2fd15e1f826ca162833c411809f;
    stim[45] = 517'h035763c5d99acef64e0c0d93ce8545f08a5a242daa9edcbf64aaf2303b9e237a5b05e3323c98e4796742b5d8602691d7e380b4c5a96b34b7cc8a6a5e014ad70aea;
    stim[46] = 517'h154425144608b5abac07b3a660818fddee0a553b5e55563062631e1bc746661a7c066c4fcd79e2b9953933b2a7546bb5dbfe17dd2bb28c6cb26dd6178ea76ab158;
    stim[47] = 517'h066b69767d759fcc3dba57632aa7ae647d971742b97b0a7d65a7dae0dc09e667936298839091b011c7ee17fa0c902d2a7631bdc71b087a7b2383be04857d024d7e;
    stim[48] = 517'h16896d3d12e0cea08835d76b3b2da074392852a90df415a33784bc3a1e519da23308c5a97e785f60780a407f0cfe816609ed5318510af89a1f5c5056bf1a5e77f7;
    stim[49] = 517'h04f02447bc878b219cb92b447f9db01ab0eaa7875938846f5da299cf22d4d1bc7d9b3a9fc728f905a0f60d7de39b4a4f5a03f715ca3af48ab831edbb177ba16bf8;
    stim[50] = 517'h1779d13bd5b6730c27ea9e678d01011d5ee11ee7a295f6dd971c43a894b3399b820191a2fd401b6324f67e5ed4777aed42187085c7935863b787ed721026dd7bd6;
    stim[51] = 517'h14b498537e9478af1852529803ef7b870f9608428308f668fa3a279d7a04b02e5200b4501aaf1722939bf3cb515393a533f3d8ece33b07ef4e2f477d5433504e66;
    stim[52] = 517'h05639c5008363c944da5d480dec61af5cc63962e25f7c39d0393e187c85a8450509b64cb863dded7887f57a8cad929fb1ea308f80187849b15e7787e6ee0cb9f1c;
    stim[53] = 517'h00b88c712f541c4a80eebe3647a1c5b1fbffae624a699e7f12aff918a17b11601dc157c88e80a2ed93906f58f493b41b2ee0d3f79baad2a635c24271e0621d01f2;
    stim[54] = 517'h07cb16ed43a54b1b3d4791eece8c4ea5dbb57a72957e003a8522fc116dee5721b6fb881b5f8c325988e8ad012ddd55957f6f225042d16bb5489082a942a51734dd;
    stim[55] = 517'h0174ff5f1434f1f0bac6a85e2a204e59ff56e404c9c239d22c5584323e3fdfe8ef06b7a717ea85662640eee7afe44529e7306539d063b52ce61c4cc1bd50c09c82;
    stim[56] = 517'h03e4e0e038db2de9b71b9a747854e131ae6f01fdc0df11ff819421c354f1d0fe925d082394614161cf6fa8c9347f17965fe8f84229d1893e43a9f08700e3c1ca86;
    stim[57] = 517'h102becda00a10061d10ea30581b5a0f8be7c85c7617616d071da3974fd002984ef518c646e9330aae8d8ea826a4f106f56edcfefc3f484250d7b8aa86de984dfed;
    stim[58] = 517'h118e7c6d6fbc16f575636282cd2b0737c94bfd3abe44b7d86760a561251db0bd11af0f35942c895a84121f42f4cf7b54add7abe682b2c723ae8ce4dd6f4a6507ad;
    stim[59] = 517'h11cf079d25e5dd03a359e681f77837ca55cf835f8c9649788d7d0a64d43bf32a1c0f68307a20f63d657e7de7df6ab5a00c642bfbbb5d5cb0d550bdd2633973b64f;
    stim[60] = 517'h004a8de153a76f7904231100b95dca8eee2e69746acc0cc9cb445eed9e7ce257334d84ebe687b531a4773748f02a44697d68bd39df26d00b2320036afa6945142a;
    stim[61] = 517'h1536026c6a79e8b2b60e96a2f2c7a0155e1a8f67b84504b2c85775abdbd5bcfab377303563d692d899e111b7bde383016881418ffe2f9bbeb4698f2cb19aa1331b;
    stim[62] = 517'h14ffb52de14e1292875e99e8663b756739a1466d892ba702c316fe149d085697e90061a83c84faf4a6d66258e7cd254d9966ae2f2a1ddc8fc4b2f0ecb4ad21b752;
    stim[63] = 517'h12ea040bff24a85a211b45bc90e6e3b59b6af67de80e155f0c9cf7908370bf6008d53b43aac50e14b6e6462f34884dc534d80b6d2fea8d24c7a6203b35562aad76;
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
      expv[0] = 18'h00000;
      expv[1] = 18'h00000;
      expv[2] = 18'h00000;
      expv[3] = 18'h00000;
      expv[4] = 18'h00000;
      expv[5] = 18'h00000;
      expv[6] = 18'h00000;
      expv[7] = 18'h20000;
      expv[8] = 18'h20000;
      expv[9] = 18'h00000;
      expv[10] = 18'h00000;
      expv[11] = 18'h00000;
      expv[12] = 18'h00000;
      expv[13] = 18'h00000;
      expv[14] = 18'h20000;
      expv[15] = 18'h00000;
      expv[16] = 18'h00000;
      expv[17] = 18'h00000;
      expv[18] = 18'h1eb26;
      expv[19] = 18'h00000;
      expv[20] = 18'h00000;
      expv[21] = 18'h00000;
      expv[22] = 18'h20000;
      expv[23] = 18'h20000;
      expv[24] = 18'h20000;
      expv[25] = 18'h20000;
      expv[26] = 18'h20000;
      expv[27] = 18'h20000;
      expv[28] = 18'h00000;
      expv[29] = 18'h00000;
      expv[30] = 18'h00000;
      expv[31] = 18'h10000;
      expv[32] = 18'h10000;
      expv[33] = 18'h1e45c;
      expv[34] = 18'h1e45c;
      expv[35] = 18'h1e45c;
      expv[36] = 18'h1e061;
      expv[37] = 18'h1e061;
      expv[38] = 18'h1e061;
      expv[39] = 18'h1e061;
      expv[40] = 18'h1e061;
      expv[41] = 18'h1e061;
      expv[42] = 18'h1e061;
      expv[43] = 18'h1e061;
      expv[44] = 18'h1cd07;
      expv[45] = 18'h1b829;
      expv[46] = 18'h1b829;
      expv[47] = 18'h1b829;
      expv[48] = 18'h1b829;
      expv[49] = 18'h11fe5;
      expv[50] = 18'h11fe5;
      expv[51] = 18'h11fe5;
      expv[52] = 18'h11fe5;
      expv[53] = 18'h11fe5;
      expv[54] = 18'h11fe5;
      expv[55] = 18'h11fe5;
      expv[56] = 18'h11fe5;
      expv[57] = 18'h11fe5;
      expv[58] = 18'h121a5;
      expv[59] = 18'h1a708;
      expv[60] = 18'h1c50f;
      expv[61] = 18'h1c50f;
      expv[62] = 18'h1c706;
      expv[63] = 18'h1c706;
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
