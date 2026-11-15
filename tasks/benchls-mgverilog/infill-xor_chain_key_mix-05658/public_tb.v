// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 192;
  localparam OW = 320;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05658 dut (
    .in(in_vec[191:0]),
    .out_1(out_vec[319:128]),
    .out_2(out_vec[127:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 192'hf567b0dd11e747c65d2c9ef3d4c7549812d536c833cb8d64;
    stim[1] = 192'hf10e6439a0822fb380adc37151284266c6b8b124d4717a2d;
    stim[2] = 192'h05a4b3821851e0b40464159ccec5fb464da8e9758ef7255e;
    stim[3] = 192'ha8dcb6b68837ae002a18f1e26547e98a91612e3238a71fb9;
    stim[4] = 192'h358f655d496e413af585c0c38ada137633606f0d35bb94a3;
    stim[5] = 192'hf9fa6d37cd2bc8600b728acaededa5fe01d1f444853cccfd;
    stim[6] = 192'he380d77fe2345caf40beaa2fc80eb20512a1f4e5cf7aecbc;
    stim[7] = 192'h5f81601343312395176f51b99fdc1ef3e32522eed815a48a;
    stim[8] = 192'h3f4d451338bd03f00d601a78d27916e434328d57ba6cba09;
    stim[9] = 192'hea19f3ef8ec677420145337eedf8fede27279234d5037417;
    stim[10] = 192'h9423da04c88265c0e07630e39229f057f4e28556a6e0b014;
    stim[11] = 192'h986afdfde435cbb7c0c365a65603ae8372cabe1cf00dcef8;
    stim[12] = 192'h570f7dff557c5f4441d42e97cdbd0a7ea3bf24c1aea49062;
    stim[13] = 192'hdfc812fe424cfc41a2228a911eb689ec63cc81d20279692b;
    stim[14] = 192'hd20272846d96fb382aacc0edb9e7fcaa546235c2507c0048;
    stim[15] = 192'hb375208513a5fb3eaa97e57b50191552950e8abefdb77751;
    stim[16] = 192'hf7c5550468a0e226bb43b26ed6d845e8af00e0fdf4cc08f3;
    stim[17] = 192'h7862d4c89a763bb0575f5574d4f6b32ae4e6d419e76196f9;
    stim[18] = 192'h0d3061690bec4ded7a3f9a1cd60669b6b6755e0b74e7faaf;
    stim[19] = 192'h206a0d426ff78caeb7c5650f6c35941fc0e39e866becfa48;
    stim[20] = 192'h0ac07e6f360a76edad8e8f4b3f4ae4675523323e08d28e63;
    stim[21] = 192'h2f52787c54c6b0e5ef6ae99a60aebc29fcdb4ec336140e2e;
    stim[22] = 192'hb8c278f064638bc018684a4d7b52eeac62b2c0a4353469d7;
    stim[23] = 192'he49e1794f164381033b8b961b5a444c9664857d8931b8ef0;
    stim[24] = 192'hf2ca29ddc628363860b1ff04d3075e3b4f5e46314c995e0a;
    stim[25] = 192'he05aa30f7573c159ef203c46a4ec0909a894f0e667f48561;
    stim[26] = 192'h1a4bb3f474be7b0758d943410916373f700c33c6fa22019f;
    stim[27] = 192'hf3a14b013c57fbdda56f2bb0f9b2a29a2f90d7266b7a7ee6;
    stim[28] = 192'h93a3ca310044c9e9b3181f54bfe1a1c3bf9ec5947e45987a;
    stim[29] = 192'h60c80a70989c0294efb0098a8db0d78a7d0179e66e1e3a28;
    stim[30] = 192'h17e60fd85a4b3a0c3b519ac120b64e2d518f88c1de2e1d58;
    stim[31] = 192'h2aa63ff74e4b96e0914c230d589dc1e713fda059cde275b7;
    stim[32] = 192'h2e16540116ee47429728c7fd7bc316a6c6a86c84588ef518;
    stim[33] = 192'h5ae4a7e0561fef02d61f7770e69b44dcc0f2b9a37d458056;
    stim[34] = 192'h1120d8cf8da08dfc5b6892cf195fa909c172a2afb2a311fe;
    stim[35] = 192'h2fcfcdcceb2ba11661bfa5bd35db3464d78d9916c2c0aaff;
    stim[36] = 192'h782fbd3fe886d95ce9699be88406c5375b412164fd70e98e;
    stim[37] = 192'hb060dee963fcafa8596b20c07f0745779bf1305f0bfd62ae;
    stim[38] = 192'hef6413e1af5f44cab8ab00cc51be70b87c7de1aa89b73bae;
    stim[39] = 192'h1061c1e83860b02608404d659ded215dc188a1a916aef9af;
    stim[40] = 192'h474b6d400f593629949aa2cae9ecb3feb56642ade895f226;
    stim[41] = 192'hba38f1cbe50f3a69fddd62bc851b37990c2b4eab8002e3bb;
    stim[42] = 192'h737fb28d968a5c178b3b9b0e81022bc0f0b871edccef0d0d;
    stim[43] = 192'h0db0e6f632e2ef1197d5086676ef4721e81caeee09c0883e;
    stim[44] = 192'h726d205038eb1a80f8a801dc4728167ed0166d3d5369d0de;
    stim[45] = 192'h6c697cf480582f7ea539a62a8824695ea8d2e3f8036e8fa3;
    stim[46] = 192'h8b4c62f5c8ca996ab59395948e06dba7f9ec914746f70351;
    stim[47] = 192'h4e273244b49e8a739ed588562dd50dee243bee1130da4703;
    stim[48] = 192'hf591b9233af1e129bd158929b01ef08b0d959e760ba4aa17;
    stim[49] = 192'h0eed1a96be10f54cb7071eaf315aa3dbd006755657dfa01f;
    stim[50] = 192'h5247c4366dd4716418f0d92ddb3747849c32721b00e7d06f;
    stim[51] = 192'ha68abe35f3b0354e28028c47afd8274c983d1dac37ef634a;
    stim[52] = 192'hd8fc109c27a8d0632c471ca374b5a0354211f569f9124369;
    stim[53] = 192'h6fd50a9ceaec0c85dfb5279ff3d1b9096d8efe0f4731efd4;
    stim[54] = 192'h68ded20c4917b8641528aa51665d7336ce9751db45abb3b3;
    stim[55] = 192'hbecc3b6f8b658a0d88e2fb79b146009d06e12bcb773a74c4;
    stim[56] = 192'h14c6036fc4307395a0facc226c8cc694e17f0b25c05a4cbc;
    stim[57] = 192'h8e85bc414e77f16ee8993423c49fdfcae79fa150684eceb4;
    stim[58] = 192'he7c4ed86a9f343d3ab64c94d3ac9ec8379abefbb28de4ebc;
    stim[59] = 192'ha365af78e5342669121dfe47ebebe5762bf986b268edcc96;
    stim[60] = 192'hcc752f76491f69468dac26a323eac71b50faec42137eb7de;
    stim[61] = 192'h5e690a5e7e30c0697e87f4ef73656af705c038e816805e7a;
    stim[62] = 192'h4d6d4018ddcea2dfd678e414e2ab1629a825c24958889c4f;
    stim[63] = 192'h6a2df6a3fa6e97bdca8c3e4a2d3f3b7d8508481d0cae3e3d;
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
      expv[0] = 320'hf567b0dd11e747c64ccbd935980c8dad8ad9bb65b91236014ccbd935980c8dad8ad9bb65b9123601;
      expv[1] = 320'hf10e6439a0822fb3202fecc27107aea4b7bf1f8063ce65ad202fecc27107aea4b7bf1f8063ce65ad;
      expv[2] = 320'h05a4b3821851e0b41c35f528d2f00e6e9f58e71b11afc2451c35f528d2f00e6e9f58e71b11afc245;
      expv[3] = 320'ha8dcb6b68837ae00a22f5fe2c768b6685609985a6eae87e3a22f5fe2c768b6685609985a6eae87e3;
      expv[4] = 320'h358f655d496e413abceb81f93631928f0551fd8230ea6921bceb81f93631928f0551fd8230ea6921;
      expv[5] = 320'hf9fa6d37cd2bc860c65942aa2bb4e7542a651310af59dfedc65942aa2bb4e7542a651310af59dfed;
      expv[6] = 320'he380d77fe2345cafa28af6806a8444857825b060b75f5cdca28af6806a8444857825b060b75f5cdc;
      expv[7] = 320'h5f81601343312395545e722ccb826cdf28a74e31f0b2eabb545e722ccb826cdf28a74e31f0b2eabb;
      expv[8] = 320'h3f4d451338bd03f035dd1988e7a40f6cd396823b69fa383235dd1988e7a40f6cd396823b69fa3832;
      expv[9] = 320'hea19f3ef8ec677428f83443c627bbae2455c28d6905f5cc18f83443c627bbae2455c28d6905f5cc1;
      expv[10] = 320'h9423da04c88265c028f45523badda5744e3f2022e8df903628f45523badda5744e3f2022e8df9036;
      expv[11] = 320'h986afdfde435cbb724f6ae1172f50092003fbe8ef032707624f6ae1172f50092003fbe8ef0327076;
      expv[12] = 320'h570f7dff557c5f4414a871d3d9157bad7aaa5f6cd40ecf0e14a871d3d9157bad7aaa5f6cd40ecf0e;
      expv[13] = 320'hdfc812fe424cfc41e06e76d0fed8ff3c9d147eee9f6d17c5e06e76d0fed8ff3c9d147eee9f6d17c5;
      expv[14] = 320'hd20272846d96fb38473a3bd5feddc77faabff2bdfac3f2f5473a3bd5feddc77faabff2bdfac3f2f5;
      expv[15] = 320'hb375208513a5fb3eb9321e45e92b0b177c2581a98192f6f8b9321e45e92b0b177c2581a98192f6f8;
      expv[16] = 320'hf7c5550468a0e226d3e35048053b15a0aa3bf55d5ef7fdaed3e35048053b15a0aa3bf55d5ef7fdae;
      expv[17] = 320'h7862d4c89a763bb0cd296ec419dfddeefd3909f71a589f0ecd296ec419dfddeefd3909f71a589f0e;
      expv[18] = 320'h0d3061690bec4ded71d3d7f1a7d5be4711a0e04c65471ae371d3d7f1a7d5be4711a0e04c65471ae3;
      expv[19] = 320'h206a0d426ff78caed832e9a1b4077dbe74e4e3381f081970d832e9a1b4077dbe74e4e3381f081970;
      expv[20] = 320'h0ac07e6f360a76ed9b84f9a6a4ce1dc1f1ed2ffff93fa19c9b84f9a6a4ce1dc1f1ed2ffff93fa19c;
      expv[21] = 320'h2f52787c54c6b0e5bbac597fdb02e55627d9ab9511cda5bbbbac597fdb02e55627d9ab9511cda5bb;
      expv[22] = 320'hb8c278f064638bc07c0bc18d07592f2165ebef8550df86527c0bc18d07592f2165ebef8550df8652;
      expv[23] = 320'he49e1794f1643810c2dc81717778c5b811309260822b1c90c2dc81717778c5b811309260822b1c90;
      expv[24] = 320'hf2ca29ddc6283638a699c93c759e97073ac0d13676598f3ca699c93c759e97073ac0d13676598f3c;
      expv[25] = 320'he05aa30f7573c1599a53fd1f3ebff416962b04f0f1df81919a53fd1f3ebff416962b04f0f1df8191;
      expv[26] = 320'h1a4bb3f474be7b072c67384625710f79557d3cbfaf5f3d202c67384625710f79557d3cbfaf5f3d20;
      expv[27] = 320'hf3a14b013c57fbdd9938d06d608a72f74f1aa5d12460db379938d06d608a72f74f1aa5d12460db37;
      expv[28] = 320'h93a3ca310044c9e9b35cd6bd0cbd777eb323b2eacd662a90b35cd6bd0cbd777eb323b2eacd662a90;
      expv[29] = 320'h60c80a70989c0294772c0b1efa9cdc94879da572e9839f5a772c0b1efa9cdc94879da572e9839f5a;
      expv[30] = 320'h17e60fd85a4b3a0c611aa0cd41aceee010236621ce0d7b79611aa0cd41aceee010236621ce0d7b79;
      expv[31] = 320'h2aa63ff74e4b96e0df07b5ed879a740a9467d4535985a1e4df07b5ed879a740a9467d4535985a1e4;
      expv[32] = 320'h2e16540116ee474281c680bffa0596193cadfa9d64230f8581c680bffa0596193cadfa9d64230f85;
      expv[33] = 320'h5ae4a7e0561fef0280009872669bdcaea669650ddb2ce55b80009872669bdcaea669650ddb2ce55b;
      expv[34] = 320'h1120d8cf8da08dfcd6c81f33cf97b63a0ee51495bc46056bd6c81f33cf97b63a0ee51495bc46056b;
      expv[35] = 320'h2fcfcdcceb2ba1168a9404abbf4f30cf68c2a9d9aa0203268a9404abbf4f30cf68c2a9d9aa020326;
      expv[36] = 320'h782fbd3fe886d95c01ef42b485e98783dea8a6e723d84f6901ef42b485e98783dea8a6e723d84f69;
      expv[37] = 320'hb060dee963fcafa83a978f684590ca1fde61fa40d59c98ee3a978f684590ca1fde61fa40d59c98ee;
      expv[38] = 320'hef6413e1af5f44ca17f44406464a34be3a37d514b380eeba17f44406464a34be3a37d514b380eeba;
      expv[39] = 320'h1061c1e83860b0263020fd43adcddc1e6c457db77aeb84183020fd43adcddc1e6c457db77aeb8418;
      expv[40] = 320'h474b6d400f5936299bc394e3722f271dc74965b02fdc97969bc394e3722f271dc74965b02fdc9796;
      expv[41] = 320'hba38f1cbe50f3a6918d258d59dc96f4c91e221e711e0c25c18d258d59dc96f4c91e221e711e0c25c;
      expv[42] = 320'h737fb28d968a5c171db1c7199cb3ecd96c0b9d34a0e490391db1c7199cb3ecd96c0b9d34a0e49039;
      expv[43] = 320'h0db0e6f632e2ef11a537e777d3d8a0563bc40eb832048686a537e777d3d8a0563bc40eb832048686;
      expv[44] = 320'h726d205038eb1a80c0431b5c876b0d22577d601f0414b0c1c0431b5c876b0d22577d601f0414b0c1;
      expv[45] = 320'h6c697cf480582f7e25618954ad45e00a059703f206f98c5125618954ad45e00a059703f206f98c51;
      expv[46] = 320'h8b4c62f5c8ca996a7d590cfef35fd7590ab3461e4c44454f7d590cfef35fd7590ab3461e4c44454f;
      expv[47] = 320'h4e273244b49e8a732a4b0225079e0fcb23a5e1da137fa6d92a4b0225079e0fcb23a5e1da137fa6d9;
      expv[48] = 320'hf591b9233af1e12987e4680037fa988b3a6f06fd31cbacea87e4680037fa988b3a6f06fd31cbacea;
      expv[49] = 320'h0eed1a96be10f54c0917ebe3384d4838e84b3d6ebf949d710917ebe3384d4838e84b3d6ebf949d71;
      expv[50] = 320'h5247c4366dd471647524a849ae13efcd32219dd632c64db97524a849ae13efcd32219dd632c64db9;
      expv[51] = 320'ha68abe35f3b0354edbb2b909746a9e45ec5783e9dbb8e0a3dbb2b909746a9e45ec5783e9dbb8e0a3;
      expv[52] = 320'hd8fc109c27a8d0630befccc07f5a6cf53d4b999cc459daf50befccc07f5a6cf53d4b999cc459daf5;
      expv[53] = 320'h6fd50a9ceaec0c8535592b1ac6889213ab066c1cec3783c835592b1ac6889213ab066c1cec3783c8;
      expv[54] = 320'h68ded20c4917b8645c3f12353a626103f4f530d8b15e836b5c3f12353a626103f4f530d8b15e836b;
      expv[55] = 320'hbecc3b6f8b658a0d03877174b2c171e9b4205a22c31a2ee603877174b2c171e9b4205a22c31a2ee6;
      expv[56] = 320'h14c6036fc430739564cabfb708467923e939720629633eba64cabfb708467923e939720629633eba;
      expv[57] = 320'h8e85bc414e77f16ea6eec54d62711a8785eebbd7eda07563a6eec54d62711a8785eebbd7eda07563;
      expv[58] = 320'he7c4ed86a9f343d302978a9e385e661d41f589a6692bc71a02978a9e385e661d41f589a6692bc71a;
      expv[59] = 320'ha365af78e5342669f729d82e1cc23d58373bbbea5fd6777cf729d82e1cc23d58373bbbea5fd6777c;
      expv[60] = 320'hcc752f76491f6946c4b34fe5e75988feb7a364bca4ddd362c4b34fe5e75988feb7a364bca4ddd362;
      expv[61] = 320'h5e690a5e7e30c06900b7348673d25e7176126699609238e300b7348673d25e7176126699609238e3;
      expv[62] = 320'h4d6d4018ddcea2df0bb646cbe91d50e2413892ab19b00ee40bb646cbe91d50e2413892ab19b00ee4;
      expv[63] = 320'h6a2df6a3fa6e97bd30e2a9f71ddd928a98d5da97947be4aa30e2a9f71ddd928a98d5da97947be4aa;
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
