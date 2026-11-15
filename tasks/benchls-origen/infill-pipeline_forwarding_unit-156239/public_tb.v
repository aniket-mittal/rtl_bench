// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 379;
  localparam OW = 160;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_156239 dut (
    .D1_Ad(in_vec[378:374]),
    .D2_Ad(in_vec[373:369]),
    .E1_Ad(in_vec[368:364]),
    .E2_Ad(in_vec[363:359]),
    .M2_Ad(in_vec[358:354]),
    .E_Ad2(in_vec[353:349]),
    .M_Ad2(in_vec[348:344]),
    .W_Ad2(in_vec[343:339]),
    .F_Ad2(in_vec[338:334]),
    .G_Ad2(in_vec[333:329]),
    .E_we(in_vec[328:328]),
    .M_we(in_vec[327:327]),
    .W_we(in_vec[326:326]),
    .F_we(in_vec[325:325]),
    .G_we(in_vec[324:324]),
    .D1_default(in_vec[323:292]),
    .D2_default(in_vec[291:260]),
    .E1_default(in_vec[259:228]),
    .E2_default(in_vec[227:196]),
    .M2_default(in_vec[195:164]),
    .E_Wd1(in_vec[163:132]),
    .M_Wd1(in_vec[131:100]),
    .W_Wd1(in_vec[99:68]),
    .F_Wd1(in_vec[67:36]),
    .G_Wd1(in_vec[35:4]),
    .E_delay(in_vec[3:2]),
    .M_delay(in_vec[1:0]),
    .D1(out_vec[159:128]),
    .D2(out_vec[127:96]),
    .E1(out_vec[95:64]),
    .E2(out_vec[63:32]),
    .M2(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 379'h7305de5c19b92b5d382ee77a57b98a844faa4344ff8ae184eb8a46b5ae673260ef64c3eb78c812aa6d86d7bc06d88b0;
    stim[1] = 379'h64a42d751b317bfca51189ef6ae1177423c7fd9744d8a67d15159a5274fe49af7782e8b387e77489b0891bd64951326;
    stim[2] = 379'h06edc43bc69babad65f75faf74619d1df0facb19e735dbe6cdb4862a9b1ee967443777cacaebe0ae935c12f11e15d79;
    stim[3] = 379'h700a491b4b0e515b3f4fadb5e81f3df4f9802cfbc4742906ef8abe9d443cba812c89238e81a1b887ba34473bf6c7e89;
    stim[4] = 379'h0306cd7ad052793b444460b0eda236e4fa714ab483b4709305f5f3110ff95f3195dd2f3ca45d08614bd28d80af0ec2b;
    stim[5] = 379'h2677ba87de72b979461dab22c0e6b108135083554d2748d258410004a887f95880b2989a97c9b61616ad4a1c3636ed8;
    stim[6] = 379'h2a5999c9da9ca7180fbd940a16df44581bccfb7d044caf3c6ae7e11aebc8fb0df25f74bde41c127f380602cca84cc4c;
    stim[7] = 379'h7af5d402bc4892b0ab1266bf35ad8b6657feb5fdee30d4483bc25edead23870a02275b90923bdc6326c6693748c0183;
    stim[8] = 379'h78b234f9b87263103a294e7996bdc5a787533768bb55f97663a023ed0d7163b73d67011720a2888670d7a25734d9bc7;
    stim[9] = 379'h534362b18d5edd248c2a763c16f3011dc6f00b4732d942fe24114d7e6ac7ee5bb9a8c1627ce307d01f1422e55867244;
    stim[10] = 379'h0233c53958773de6875a859bb4bf86035d95977a25ef2f925b70d91d0eb6c76b42664e6764e5c96399ee7f3b1cb81a7;
    stim[11] = 379'h574987a9392dda24b369ac1ac3631eb75d188a0e634f3c5c2c0c40d83beeea5c82b6d508c49a705bf886db7635109cb;
    stim[12] = 379'h3866383e68651da5ae82b61e360bb96982c085fe4be0ea8482745b565ea331aeee8c2cbea069775faaf7972d3d9c3e8;
    stim[13] = 379'h4748f701a3c26fb12a3c5bf692aea07c692135779782c05524bd8d3fc22f627798fb34661d6c686c3058364f2996837;
    stim[14] = 379'h009bbf6bdb56a8d0f1937ca48378a434a93a1383ea2839254bf3dbc15f7f0f5a7fc2ab88d3adf14686d87922780fb04;
    stim[15] = 379'h6c367c752b4064c904d609c369a0740c24e7e738665c4f61418ad7117b99b58427351bb5973c3474c936e5429e04c6f;
    stim[16] = 379'h4f2a1f19128510727e132043da8103e03142a490abb2eed779a91cf8d468c0fcdb016845457bcf1a46456bc9b9a2505;
    stim[17] = 379'h049737f06323f04b5b49e7cdcf215532d35457cfd178396d03091dab86d76ec0fed3b244a27442413ae4407945e55cd;
    stim[18] = 379'h48c85db387319913bb6e7fc8299fcf53c39b862b47ef3181c9beb613411f0fc0b4a1e34e8550fefa32e6ee2db6e3abe;
    stim[19] = 379'h182e04b300a9a9ab59d2633ebc9be86ab958197cd807b5cfa8abfd3ad1155c9243cfef5a81f5c4ecd8df3f55ca278c9;
    stim[20] = 379'h65c5c56a167fe0b07082348d865073a981f6aa9f4d396698f8446e2ee411dc51e044c1af835d606c81d4ac07beff59c;
    stim[21] = 379'h41779d11d5821e55fc3667b64723326aa59ad33977ee1cad9347ad3b3387296fd740f7b5f1d7c2f54ca504b08cffac4;
    stim[22] = 379'h2ef6f34d7affd9647ff89149367f273372388970d4145cf270d6179ffcddbbe9cbfa57ce2e6b487861bd771e44dcab1;
    stim[23] = 379'h4fef8a2b0a19af67cf258e2839fb7c79fc8162b59cf5c47abe690baeb62cf810dcbd7aef99b58836971d5e6912ea469;
    stim[24] = 379'h501fb58b3ecfa67b6e6b24632c867f2a277c9cc7763a1ec304665b15079e91d4138d0b8485c5d03ce423f536915b17c;
    stim[25] = 379'h0c796e50003d7ab06b8ce82116100267fc6e0aacf27ba334caa22c1f59f838b82d82bcce5f10337d3acdfb73db002ca;
    stim[26] = 379'h649b889cb28f1a4f78608282dac122699c44a5bb3d950fa1d796cc39ee772182596460adb65d6698e51acaf0cd1b874;
    stim[27] = 379'h7acf4e3dfdc3e9f116b4cb4d1cd2c709e97bcbb9e173f269d251ea2373df5ae745e296e75855140ca740d0a006c4f19;
    stim[28] = 379'h49daacf472ff684cd3fbc03433637ddaf3a3d2c1fb05cbfb6fc92e8b3419e4a6b2b44dbe51a3bf25a20637839d4ac07;
    stim[29] = 379'h7f53f95bee04f86b8a1dbf0e1b5de4668359b40df18199df863203e87a164f5a719d72b77d732a9bd4ca59ebf0ffd31;
    stim[30] = 379'h37f7f2c27a932f84b3b6310abbae58d8802ee2be6ad8fb997e067d2a0a294c4f33db117c4c35ea9a99d3d802ff82b63;
    stim[31] = 379'h7ff21c0485d036a95c5b84e744dd16577173769f0e53baa12dacbc48449e0e824d78a3483c62dc8d7bf476c90780b8c;
    stim[32] = 379'h31e8eb016d9b63761ee6f59cc1c5a691291356910c469e4a6f48fc0bd85cd5f576cc489599a76468c6b064a465e100b;
    stim[33] = 379'h3eecc971f5ac97324d1f109c50718ecb8d670ce3db9812fe2d8a52f49da289a746e27a0eb26e4ec71a53a9ad44c8561;
    stim[34] = 379'h16f693e99b581c6c54282b98149e9c7c0ac2dc5e800432b395d05b6c52e6cfefa9ad168955036c02b61bc70895ef4b4;
    stim[35] = 379'h2732083b944ac8a8569489c9d4bac96712207769c4ba9d43d006b82d5e2b21cd478a4af1bba922e3f02dbed6df887de;
    stim[36] = 379'h7645309c7d98b2fb32de90851976725a3d7b88f3ddef5466d8d3f6c52affefef4e7526f2d10c14f86c7332bfd9240a6;
    stim[37] = 379'h25246deb01b5fa0858faa6bd6d0d4a906a80b22fe5403d06f4065e3770d54f30efd02cbec03b37f02f79d4f0c9c2905;
    stim[38] = 379'h61e6b5dc6babd1843256e1324dc31c882ca846cfba125cddb94a4467ded49d7b0f1f71e0c6616bd110528fb49640422;
    stim[39] = 379'h5c5287be7aabd673ea3792f569e9085d43c192682c9d329a1d419f6013b3e82f808f26a8892aa159e80691c39d9fdd1;
    stim[40] = 379'h3ee9a21d5191724705a98b269377264e27c1ae55ba839e713ee74e8473277687e33154fd7d5e79b71beb43f74c17d60;
    stim[41] = 379'h64726764c100a4c6096c8907f3179e076fd8f1f086e4764f9442df844b00ff27c25dc04a6ab967d5400ebd7f34a1794;
    stim[42] = 379'h40011c2af1806dd101a6a4a6e9a521c0c03210dcd61a0e860ce22578d13ea9aa6cd75bde1c37f689bd8fd50c9d4205c;
    stim[43] = 379'h798556941a4a21367ae826f3b927a04f6cd32cfff415e74c8f9f5d3dad2eb6a9bcfc842b992ebeaa94c6e925c3284b3;
    stim[44] = 379'h3fa79998558e5b9d6feadc03d581dbd0db2083079567d9c8b29340b585ecea595a447b58604b5e16124574bb05d8a70;
    stim[45] = 379'h1d8202ebcf158e64e9d512b24df0a28935a305b16f8484613b0a21e31bcb22165c425cb3b8a60479a25085458576c1f;
    stim[46] = 379'h149eb69726ca8773d839a9b01e18e9ee935a8ddae18137e7e1697955957238670c0931f6da769f79f7351c1ab93e1dc;
    stim[47] = 379'h6eec86c701239a1a0a8607d1b8c4e0cfee219a4ebde4fba1e5a1d8fa789d4740410982e95c449aab1ed7de2ad02191d;
    stim[48] = 379'h403efad7db241ba61afc14b4b831fe3194a66d431f12c61a3d0377e6e521ba3eef41ba5e2a925af99967857f953fbc5;
    stim[49] = 379'h31b5f7c00b08e050b3d07709237ef79e50e472eb3cb546ff9f6e0bc64ce3e362a733ab934fc2b35f208f8b9609cb80e;
    stim[50] = 379'h1544211e556337a38ac9e9eb00fb3617f65eb5e5d87d3e381f68c50fa3d6d099df98b6b38cc1cc7e88a346ae66354d6;
    stim[51] = 379'h0a313a682789f81e99f0ba8f4ce70086b594cdac1275b27daee4b2ba8cdfa7de46f284d364def977c4c2d8ba82b4ce1;
    stim[52] = 379'h484a893f6d98b07a09fc6246e04864c890b8d97f083f06bc2a64e1e3d0e2dfc2e3e0b556ef9685a87eb673002395c69;
    stim[53] = 379'h1867268a94184abd92fcc9c8760406fce95989e10c355a5c291dc89c8b63aa724b65aeb5f8a065f4055031998784509;
    stim[54] = 379'h345372a8c74067341dc0e706b7bb1a4f6eef1e3601c0e5a74dc6c58216ff285b270736b25c57b7466b3e11e8ff9a197;
    stim[55] = 379'h74becc1af71f1294cc7fef291c18d476086c22c0b40bd223aba0d52b3de73feb862eff0ea8a6a366391dc492ad24a0f;
    stim[56] = 379'h66c9409f4d3b638a4f4beddf46fac9ec91c2bc29c9255a80ad0291f39c32ecdd44a9e0d53563ea71bb4bff5fa6285cd;
    stim[57] = 379'h6094eeb9d9a4a5b59f6c630654761b767512865b9b696fc1f758bc5c75c8b4e91e06cd0d64d517241068233dd86e0bb;
    stim[58] = 379'h6acb9557a8ee46c2d34ae0cac83e434c5539300d3f991f749dc5e97b21553ab7cbd7efeeddd1508641c86e3147be766;
    stim[59] = 379'h4142540745fcf89685a4429dd9885afa66567d0b84b04080707dfe4c82a4df35594ed8b8cd69182afa5f68f198a5617;
    stim[60] = 379'h017e2a5c96d4d7555363af551e8db250088f699b00df55308f4b65bc601e0d109ba922e8b10bce68d15d97088e0d009;
    stim[61] = 379'h447de95a8128732796afae6e6a4c0daecfc208adf8a9c3f9c9f006b43cb47d438f6f2e62fcaf12d408523034e4248ad;
    stim[62] = 379'h3510fe7aa299906fe5ac8d8c3ba2bb6e7e140438f60838b43d9f297424c02612b8c2a91914f318dfa634889f8c6e403;
    stim[63] = 379'h0b0a6373db0ff980285515b901be7426e60621aa346ade76c72b0a09db8e21108add56a8b8b2e8e5816a5c8deaaed25;
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
      expv[0] = 160'h5d382ee77a57b98a844faa4344ff8ae184eb8a46;
      expv[1] = 160'hfca51189ef6ae1177423c7fd9744d8a67d15159a;
      expv[2] = 160'had65f75faf74619d1df0facb19e735dbe6cdb486;
      expv[3] = 160'h5b3f4fadb5e81f3df4f9802cfbc4742906ef8abe;
      expv[4] = 160'h3b444460b0eda236e4fa714ab483b4709305f5f3;
      expv[5] = 160'h79461dab22c0e6b108135083554d2748d2584100;
      expv[6] = 160'h180fbd940a16df44581bccfb7d044caf3c6ae7e1;
      expv[7] = 160'hb0ab1266bf35ad8b6657feb5fdee30d4483bc25e;
      expv[8] = 160'h103a294e7996bdc5a787533768bb55f97663a023;
      expv[9] = 160'h248c2a76627ce3071dc6f00b4732d942fe24114d;
      expv[10] = 160'he6875a859bb4bf86035d95977a25ef2f925b70d9;
      expv[11] = 160'h24b369ac1ac3631eb75d188a0e634f3c5c2c0c40;
      expv[12] = 160'ha5ae82b61e360bb96982c085fe4be0ea8482745b;
      expv[13] = 160'hb12a3c5bf692aea07c692135779782c05524bd8d;
      expv[14] = 160'hd0f1937ca48378a434a93a1383ea2839254bf3db;
      expv[15] = 160'hc904d609c369a074b5973c3438665c4f61418ad7;
      expv[16] = 160'h727e132043da8103e03142a490abb2eed779a91c;
      expv[17] = 160'h4b5b49e7cdcf215532d35457cfd178396d03091d;
      expv[18] = 160'h13bb6e7fc8299fcf53c39b862b47ef3181c9beb6;
      expv[19] = 160'hab59d2633ebc9be86ab958197cd807b5cfa8abfd;
      expv[20] = 160'hb07082348d865073a981f6aa9f4d396698f8446e;
      expv[21] = 160'h55fc3667b5f1d7c26aa59ad33977ee1cad9347ad;
      expv[22] = 160'h647ff89149367f273372388970d4145cf270d617;
      expv[23] = 160'h67cf258e2839fb7c79fc8162b59cf5c47abe690b;
      expv[24] = 160'h7b6e6b24632c867f2a277c9cc7763a1ec304665b;
      expv[25] = 160'hb06b8ce82116100267fc6e0aacf27ba334caa22c;
      expv[26] = 160'h4f78608282dac122699c44a5bb3d950fa1d796cc;
      expv[27] = 160'hf116b4cb4d1cd2c709e97bcbb9e173f269d251ea;
      expv[28] = 160'h4cd3fbc03433637ddaf3a3d2c1fb05cbfb6fc92e;
      expv[29] = 160'h6b8a1dbf0e1b5de4668359b40df18199df863203;
      expv[30] = 160'h84b3b6310abbae58d8802ee2be6ad8fb997e067d;
      expv[31] = 160'ha95c5b84e744dd16577173769f0e53baa12dacbc;
      expv[32] = 160'h761ee6f59cc1c5a691291356910c469e4a6f48fc;
      expv[33] = 160'h324d1f109c50718ecb8d670ce3db9812fe2d8a52;
      expv[34] = 160'h6c54282b98149e9c8955036c5e800432b395d05b;
      expv[35] = 160'ha8569489c9d4bac96712207769c4ba9d43d006b8;
      expv[36] = 160'hfb32de90851976725a3d7b88f3ddef5466d8d3f6;
      expv[37] = 160'h0858faa6bd6d0d4a906a80b22fe5403d06f4065e;
      expv[38] = 160'h843256e1324dc31c882ca846cfba125cddb94a44;
      expv[39] = 160'h73ea3792f569e9085d43c192682c9d329a1d419f;
      expv[40] = 160'h4705a98b269377264e27c1ae55ba839e713ee74e;
      expv[41] = 160'hc6096c8907f3179e076fd8f1f086e4764f9442df;
      expv[42] = 160'haa6cd75ba6e9a521c0c03210de1c37f6860ce225;
      expv[43] = 160'h367ae826f3b927a04f6cd32cfff415e74c8f9f5d;
      expv[44] = 160'h9d6feadc03d581dbd0db2083079567d9c8b29340;
      expv[45] = 160'h64e9d512b24df0a28935a305b16f8484613b0a21;
      expv[46] = 160'h73d839a9b01e18e9ee935a8ddae18137e7e16979;
      expv[47] = 160'h1a0a8607d1b8c4e0cfee219a4ebde4fba1e5a1d8;
      expv[48] = 160'ha61afc14b4b831fe3194a66d431f12c61a3d0377;
      expv[49] = 160'h50b3d07709237ef79e50e472eb3cb546ff9f6e0b;
      expv[50] = 160'ha38ac9e9b38cc1cc17f65eb5e5d87d3e381f68c5;
      expv[51] = 160'h1e99f0baba8cdfa786b594cdac1275b27daee4b2;
      expv[52] = 160'h7a09fc6246e04864c890b8d97f083f06bc2a64e1;
      expv[53] = 160'hbd92fcc9c8760406fce95989e10c355a5c291dc8;
      expv[54] = 160'h341dc0e706b7bb1a4f6eef1eb25c57b7a74dc6c5;
      expv[55] = 160'h94cc7fef291c18d476086c22c0b40bd223aba0d5;
      expv[56] = 160'h8a4f4beddf46fac9ec91c2bc29c9255a80ad0291;
      expv[57] = 160'hb59f6c630654761b767512865b9b696fc1f758bc;
      expv[58] = 160'hc2d34ae0cac83e434c5539300d3f991f749dc5e9;
      expv[59] = 160'h9685a4429dd9885afa66567d0b84b04080707dfe;
      expv[60] = 160'h555363af551e8db250088f699b00df55308f4b65;
      expv[61] = 160'h2796afae6e6a4c0daecfc208adf8a9c3f9c9f006;
      expv[62] = 160'h6fe5ac8d8c3ba2bb6e7e140438f60838b43d9f29;
      expv[63] = 160'h80285515b901be7426e60621aa346ade76c72b0a;
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
