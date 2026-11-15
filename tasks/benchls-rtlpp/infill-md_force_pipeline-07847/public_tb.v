// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 321;
  localparam OW = 97;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07847 dut (
    .clk(clk),
    .coeff_14(in_vec[320:289]),
    .coeff_8(in_vec[288:257]),
    .dx(in_vec[256:225]),
    .dy(in_vec[224:193]),
    .dz(in_vec[192:161]),
    .r2(in_vec[160:129]),
    .term_0_14(in_vec[128:97]),
    .term_0_8(in_vec[96:65]),
    .term_1_14(in_vec[64:33]),
    .term_1_8(in_vec[32:1]),
    .term_valid(in_vec[0:0]),
    .frc_valid(out_vec[96:96]),
    .fx(out_vec[95:64]),
    .fy(out_vec[63:32]),
    .fz(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 321'h1f2a34a5ab4ca97cf9f4b9f412fc1cb39f3d5e09f0782715d51ff77f96ccc163b47bfac327f4d4c4a;
    stim[1] = 321'h00dc741793b700ea1e6bef3fb64260801a53a6b1e991865cf66963521e572685953e05d042259bc9e;
    stim[2] = 321'h107d864ebc5ad076d5877af19632aa1cb0954e3cb452ec5182c891b85e787163e572adf336f987d7a;
    stim[3] = 321'h1c38c9162432bb3b614d0b6a76743fa75b33d025c003b72fa37f269254182b4c24ef50f225011b964;
    stim[4] = 321'h0fd26c0b9c830880a10908e866c8e959adfc5576e20759f8f043097fe374b6a141b54cffb3e3d2c1b;
    stim[5] = 321'h0d6c4a2d427f29cac81ab05ef7becb34dba9c0ec4a9856a21e84dad935a6739e6553b662bee64e1ab;
    stim[6] = 321'h1fed9f3cf74f1bcd7e67e9609eac3fe92e0e803d4c460ffd5b602aac165301f4efe6ecceffcd8c16b;
    stim[7] = 321'h172f81950174981e347521588deb216f4944856a46924d77ef7ff712bdcbf633f09262dcf8ae80b70;
    stim[8] = 321'h18c91aad8052cec458cd92f0e2c4e80fb9c22d3c8445b661858c0053b53fb31a1fcea1c68b75e29d5;
    stim[9] = 321'h144c4cf0ba289053c66e36b47c5a258cbb24636874e347b9e120063724a0e59bc4412fe76fed232f0;
    stim[10] = 321'h1b7033f7880f6c4d28815216b22cd09d11964ac1697307cd8b841583cfe199cb3b98a7daa5e8dc2ac;
    stim[11] = 321'h15e5435122b3d1094f6964cc4d217ebb834698518ce4fe2644f108ebe1cef8cb9a82dabb93cecc5cf;
    stim[12] = 321'h07751aa7ff44244c98e0e3dd31a68aedb01f77f1c77e58b9063b3a0d7e7f3699902a8247fca529ab7;
    stim[13] = 321'h12917601a46b7259e45054ace0c27c37b17beaa69a4a73ce6b8edc7ebac2173a6facd9098184d5421;
    stim[14] = 321'h1c28ef067f9710a8b8e7bb53a512732e8aeda1f5bf40e0a08404bb93f8f9b535d0b24b4222db62807;
    stim[15] = 321'h1aa624b3c164a00b13356480473d68fef06d250cf0bbe133877f42c79d029ec4744bd4ae93d7a370f;
    stim[16] = 321'h070700b450008f46ef56efe844922d34a304fc0f1aecaef4f590acf01c42ab6e93864e3aca7962a13;
    stim[17] = 321'h0d091580e42e891dea9048f1ed79ccb756149994fcf52e95242ea0a5a58d3ef8fd3d624d2c0ea42ab;
    stim[18] = 321'h0085e7e02cd7ad7a9586411f9774d06bacb6ff691c0f0ed6b5040b490caf35643ee205fad51936e9e;
    stim[19] = 321'h1ade0fe9df595622561438f94b366d14396fd6d15b0326105421e362fdd3cce83bc27bbfb6716a93c;
    stim[20] = 321'h1e5e56b67f4403381ada40887e88e5bc5b1f22bf83f5f23b367808ad5e7fb7ab275b8de374f29fb2f;
    stim[21] = 321'h0cb4fc358897a76dfc6109337f5556bd3bd1e54b5447291ba16ccb550ea5daf39a00e524d7fdd42ea;
    stim[22] = 321'h0a232400215e29bed15ea41b9bae2715dd8deab35823f68c22ffe664b5f93833eb66996dd3b0598ac;
    stim[23] = 321'h196a239b1cef09234e853de1b1c1c1f5a4c00b582c547991b09b33a766464990d6edf1f193cdde212;
    stim[24] = 321'h1d6d61c2a7aa41d40dd5d18bcd8b08d1d56e9e49940cf235d1b5cd999edde8ab64b8e14d5eb17677d;
    stim[25] = 321'h06fb9dfa8dca6b7d1cc3243f678b63dc1d8f690c1e36aa1295f2a0a968e07e3b0b4151ea486da597b;
    stim[26] = 321'h0450b22976498d0b8afb5f80da4336091825eb6abb4e789d2102c80ad7165f1d2a70bb57d1a8bf052;
    stim[27] = 321'h1a1543216c4ea1ed23bac536d217ddb29244713489a7c4531beb40f489f3d914ab309591c143739cc;
    stim[28] = 321'h014dc47593b4ec856dd704c6cbe985fdefb16dad767657b6d0239956a6179f4b0e9eab14eb2b7d5df;
    stim[29] = 321'h1fc203088f2056480bf58a2068d8cd9e57dcb013c593dc40b6f285e58d6818417eed2273942e8c982;
    stim[30] = 321'h16580fb17888d6b64e94bde5e444f0652efc63110884374d411bae1a58f063915cfb94357bc1d1b5c;
    stim[31] = 321'h18449037bc46a945c211396c4ff0167d2076ec6061f547b358fcb0729122e5dbf5f896437de7f1007;
    stim[32] = 321'h17e9fec199e4d071a2b0c6b76a4c3330b44ede7c7c2553885c05af1a5d04d04eff026fc618eefd320;
    stim[33] = 321'h12df9f92ede95277858d33b80c974500f09df5e0ec7094d34452cce0bf7cdf6baf916d08d2fac09b2;
    stim[34] = 321'h1616a4bac6d745e0318c3a2b89feb3045a4d82b8f0875581e8767df1a0e604ccf7340ea13d905ceda;
    stim[35] = 321'h148cbe285bd77c49163aff89fa71a682f28e358135c7763fbf3bb781326199a3a2c56c22c764b0775;
    stim[36] = 321'h1e3fa021ac5cd9e59bd74400da1c07b2fe2ce0860a1b0d251f6949f0a211ad901089c09133a932089;
    stim[37] = 321'h011a87f42b479dfacd7fa659b7580ee0847029ffad97f1b18749fdd9b6b0e614e4a737cc4346ec2d4;
    stim[38] = 321'h1b74eaf0589a4d9b5f7549750d107a302649e66177ee66181f9db5ea8d2ff459ad3b2c0a6b20d132e;
    stim[39] = 321'h0b762d38221056a5f09a2f24b929bc9f66d4aa78294e4fca5a268c57a4c72a1d439cb647f14429409;
    stim[40] = 321'h08b82610a8ea82ce2e805a78ddd0ab3bbb398574a5ae962cb864b32e0860a6960d3df8b650f6aa33c;
    stim[41] = 321'h0bd79abb744abf37283718560b5a7d6381e424314443e0a6897ef4447df880b67a9a7a160d8e339f7;
    stim[42] = 321'h0aa8ec14aa94325ea110060f60fe09c819f74f90ef187dcbefc4ae1858cfc627f90a3487b8d7123ca;
    stim[43] = 321'h06028a7de1d3fc88add9dd2cf10203ba1ab5af966b90068727b2f97063b21b568f59f6ee292ce5a39;
    stim[44] = 321'h1efaa370768011e44dc456f1dd3efb3a65e70f9c3ec1e7cecb1255e22451c0b1c26f9aef430b49197;
    stim[45] = 321'h185df745c8d303a0b60592dea324670ca0886d070cd067ca1943c1c1c8c986aa2056dc9e04cd2fca1;
    stim[46] = 321'h069058f844db092f715f187998a3d9a62167fac39058571330ee704918a7a6e03a04498d500c39a57;
    stim[47] = 321'h105f1265a38d17ef340fee474700f24dcb0c624675247cf192db7cc1cf7ef2cf8e7661e1ae8cc8caf;
    stim[48] = 321'h0d2ac72d5d2f2859f5a1270737450511696008debcdc29d59780bc1918197b4d466d2e18125e8d272;
    stim[49] = 321'h183bb44e417e5019f244a019d11785fd743e8fc30921796d4fcf6110f688dfe7da58cfd7cba3fcc6b;
    stim[50] = 321'h195c66ccc926f08798c65a7a7d2ac74d492760db3fdad2da255274dcad56df794dcfd0aef70862b45;
    stim[51] = 321'h0fe3ca6d6a6bac1c1757f1552e4afe573e53781d6c4bf5997b895084216628283b062555822a83e71;
    stim[52] = 321'h115149c111a1883eea9ebf7e850c2e98a1bace80cd5f8df736a6ae48e48f3bcc50a53ed8215530e0f;
    stim[53] = 321'h05c770896849cdd7c41386f099e0bd3bd9971478170a9be2141076e54e8ab3d6af94f75fb9431152c;
    stim[54] = 321'h1e5f84d6c373d5f6ec10e433e54948e03cea084bccadb3f00ac7824b1ac96ee268f97d7fa8274da33;
    stim[55] = 321'h03ec69a31a43e7ec48eb22e152246d99e1d79295e0497f690caa6d5a2893375a488505559b6ce5c41;
    stim[56] = 321'h0617b3a92816b335ca7bed2959dd58848e702d322a1a43b9c2d0b2bf69be89575410619155c95e4bc;
    stim[57] = 321'h1e94534a49aefefd9f8d4064a8c1e96c479fa72366e133e653445fe829b36d473375b845a183a28d2;
    stim[58] = 321'h1dd9f687406be45be9b6b5bb637437fde71790df8780ba35b99b908bbb440fe486bb97123c8fb2539;
    stim[59] = 321'h0f3d6308b7b657a49265c22099781ba39180d6d35807c456e63718f0571f4b2e6b135ee7efbbe7785;
    stim[60] = 321'h1009b01adab1a19b262bc1fb0e4bb91375e687acbc17d8565b7982293305d88051824f5c338557e48;
    stim[61] = 321'h0f398d4846ac8af18e84ffa997f2f154b4f8f83660ceb19853160824148e8eef3823972ecdd14613b;
    stim[62] = 321'h17024703c508315f522dd22ca853171f67396b75f4addd8e0f7e7ee5224a7946f462e3ed7abdfd80a;
    stim[63] = 321'h1bbde56537715697c8634e629177b0d8d3858c2fe3dbb83d7de27e9ec22b1049d32f349606cb6cfab;
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
      expv[0] = 97'hxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 97'h0xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 97'h0xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 97'h0xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 97'h0xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 97'h0xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 97'h0xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 97'h0xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 97'h1xxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 97'h110d18c583448593c245a6acc;
      expv[10] = 97'h1ab840de2f9bea0562080b878;
      expv[11] = 97'h11c59d795c69c21a3d75b5af5;
      expv[12] = 97'h179f958aeb2e43cf0de94b3d2;
      expv[13] = 97'h111824f02dfa3969cd5c9ca4c;
      expv[14] = 97'h1e53cf52404638d34c85c9b38;
      expv[15] = 97'h1c2f5d1e3b7888e51f7e08884;
      expv[16] = 97'h1787af45df5f74074473d356d;
      expv[17] = 97'h160cb07d678a0aabd6be4618d;
      expv[18] = 97'h1d626a75838c41c5c9e2d74a0;
      expv[19] = 97'h1cc5d0476494fba84ce36b266;
      expv[20] = 97'h10243ae24991308fb3c137c78;
      expv[21] = 97'h1b3638ffaee01cdd958a238ba;
      expv[22] = 97'h18012408a88bc219c75d6cd48;
      expv[23] = 97'h1d80247b4572e7bbcbe795058;
      expv[24] = 97'h1324d7a581b7b93acbbb297a4;
      expv[25] = 97'h199b43a84f6b4f70473611a94;
      expv[26] = 97'h1dd422b668f24b0d6c175261c;
      expv[27] = 97'h13236b5d8ad44b7009e310300;
      expv[28] = 97'h1a144bfe64284dec875d82ce5;
      expv[29] = 97'h1a2f892308fb3a3a053fb3020;
      expv[30] = 97'h1ef8b6076604a108ff07bb88b;
      expv[31] = 97'h1823d599f15a0861a027f68b6;
      expv[32] = 97'h1351b5370b639661066958480;
      expv[33] = 97'h159eeb478bb5c595ce9e136f4;
      expv[34] = 97'h16a4af2dbfcfad46551da4803;
      expv[35] = 97'h1c20e6c40c0828da146c6aea1;
      expv[36] = 97'h17b03c2641c53d2fe53c75e29;
      expv[37] = 97'h114fcf5ce12cf8fded6e2aa62;
      expv[38] = 97'h1d013913a084c6489401205d0;
      expv[39] = 97'h194e5d84cdaa169f059fa2b8c;
      expv[40] = 97'h171836998b28e99879ee27a4d;
      expv[41] = 97'h16b466021688eef7f12e4610d;
      expv[42] = 97'h122c77a1c2127247277fa12c2;
      expv[43] = 97'h1507696f0930e616cff516582;
      expv[44] = 97'h1b67ea467f58307409223a8a3;
      expv[45] = 97'h10d1ba4f1722a16b0e09c0285;
      expv[46] = 97'h19ace8d98b05220bc67dab454;
      expv[47] = 97'h1dca36aaa32e6318abc72b270;
      expv[48] = 97'h1fbb31cb05180f1e4cb5ddff0;
      expv[49] = 97'h1bae9003c0fdc9b34da7fa2c2;
      expv[50] = 97'h14b42e3693508941b721a8365;
      expv[51] = 97'h1e9d35814aec12ea24834b590;
      expv[52] = 97'h168312a9c7c056a086a658754;
      expv[53] = 97'h136df9964e54e45a4619d03ec;
      expv[54] = 97'h1e15b8b283580b2dae1ae3e6c;
      expv[55] = 97'h155ae8c103feb80786509af00;
      expv[56] = 97'h1092b48877da7ef19d4a87b2e;
      expv[57] = 97'h19ad945d4293dd53eece0d8fe;
      expv[58] = 97'h12dc7bc7a7cdcfa0459f2d0c9;
      expv[59] = 97'h181f15422faa491b4929e025e;
      expv[60] = 97'h105918a2f2ac7e4f3d64b8e0c;
      expv[61] = 97'h1929b8a68eb4f24d814d853a4;
      expv[62] = 97'h1ea25312015a1e9a43fe51e5c;
      expv[63] = 97'h164670e980e13184ab435e866;
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
