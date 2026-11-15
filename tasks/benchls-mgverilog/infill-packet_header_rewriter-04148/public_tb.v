// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 196;
  localparam OW = 163;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04148 dut (
    .clk(clk),
    .reset(in_vec[195:195]),
    .next_dst_sid(in_vec[194:179]),
    .pkt_size(in_vec[178:163]),
    .i_tdata(in_vec[162:131]),
    .i_tuser(in_vec[130:3]),
    .i_tlast(in_vec[2:2]),
    .i_tvalid(in_vec[1:1]),
    .o_tready(in_vec[0:0]),
    .i_tready(out_vec[162:162]),
    .o_tdata(out_vec[161:130]),
    .o_tuser(out_vec[129:2]),
    .o_tlast(out_vec[1:1]),
    .o_tvalid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 196'hd9420f4ff052e0bfc8b31a81db3871f15b153a63726d4ce98;
    stim[1] = 196'ha2820721149ad3e3e6566618d4f2669b88248adb576099a26;
    stim[2] = 196'h2cd9523a1980d1016006d1bdf2379bf6ed888d946d0fa649f;
    stim[3] = 196'h4076a5c2db4e51d37e92bc6c056e0dd6471725d668eb40f6e;
    stim[4] = 196'h4cbe23b1cd1e8032f3510cf96d7258f07fb37cea7cd5afac2;
    stim[5] = 196'h712a253c30e4e2a040eab8b7b02295fdd9693f33a44fb7460;
    stim[6] = 196'h22066f2b08a802e9dc1b876772cb368fcc39f709716c2b59b;
    stim[7] = 196'h211a4872da96909fcb2694ade10f728067266eeb6bef96bdd;
    stim[8] = 196'h2a4ff9f66baa21bd4e491a6421b5fb2e20217f000ef7c4da3;
    stim[9] = 196'h1da919063cad66e186192f705d3970ca68b52f91154450cdd;
    stim[10] = 196'h00c2e1e8ae283dc49df1cf56a9a4d338b0176758aef63f8e2;
    stim[11] = 196'h1e9ae5a989b9e7017bfd57c488e4335ce227acd0a03021178;
    stim[12] = 196'h3c19d344a9eaa9d6a700d696f36321998c790f710aaec86e7;
    stim[13] = 196'h342f5cebdee090612f16053f6fbba6f082ec9e0ab5de5b1d9;
    stim[14] = 196'h0881657cef2a180d4a060cc32dfe9b6608216a8053be9929a;
    stim[15] = 196'h732ea7b89769fc9e85b35fb118cb5d393eb83f77f998210e1;
    stim[16] = 196'h5861d12a0b05fa0cd4de29e65dee9327ea2666a3c36f8b5ba;
    stim[17] = 196'h022ebc60a19b206a7d3ad6809ce9b9ae80ae98ae6ba694e18;
    stim[18] = 196'h745a10eaa7e3cad7c309695a7def1e46f6d095984caf2b042;
    stim[19] = 196'h4a52b894fd753e044bb672819d6712483b35ff1587229a51e;
    stim[20] = 196'h131b4b114bfe5e83e65357063b82af7fae4b66574f6c99b11;
    stim[21] = 196'h31a5be804f4acc899732fd830c5e25b8297e83b11f8421ca3;
    stim[22] = 196'h4d3b6d86c1f988d46be90d6c5520bb7dc77c769d7c475a16b;
    stim[23] = 196'h770f4a6522607649b196c7fc45bc8519f91d391876ecac94a;
    stim[24] = 196'h4f1e3c2b292a3867f0346ec4453bb1e752d31af0921122e98;
    stim[25] = 196'h71eb4c86bee659d31cfd484d497474e952f918c77a9a54f5f;
    stim[26] = 196'h3e21566ea99d4c4826d11a462e9811336c69e717b2fb3d685;
    stim[27] = 196'h1fde81d8eeaae6f0be1b98e4952f781f5ce6eeccc3a07d6f9;
    stim[28] = 196'h60357f6515c7b46899cd549830a2a80e560133446da189f70;
    stim[29] = 196'h6ddeeb4cc21936876690376767ca6d7d63d8b505abc54ef81;
    stim[30] = 196'h24afa725a67f9c5667bee4d0050e6c0d70a8f6a49d1751426;
    stim[31] = 196'h2d42e2243f117caecaac8693a166e9145ac8baab829e63fc7;
    stim[32] = 196'h5096fb82771554528eda4fecc9dab0f7c46bd61b973cc0e25;
    stim[33] = 196'h79830bc2b18103a79690568f4c0d57684ed155868894ae9a1;
    stim[34] = 196'h535753d2169090543d31c25287f35b578c0b8273fc1823d7b;
    stim[35] = 196'h7ed72518b2edab86070bce0d5e903a6d3036c4a330a374419;
    stim[36] = 196'h451b0e3771da378ff594160a6a59de20499bcbcdc8066d9d0;
    stim[37] = 196'h76c17b361824fa93d9b2e49c2748c9a7ec0c332a606e484e0;
    stim[38] = 196'h315156edc307e32188855bd602c25472d485c6ffeef541656;
    stim[39] = 196'h3728aaa6e6763e77faaa4ed28fdbc70df8e67fc14be3b68ac;
    stim[40] = 196'h60932fdcd51bc56c9533825a919517e5cc7d240371b52f23a;
    stim[41] = 196'h52b6b9d7ba3b7cf22ea333f4e807b9257687e865ba716a204;
    stim[42] = 196'h302007a8532e28bfd060b446fa97dfe22cfd1664e790fb758;
    stim[43] = 196'h4a5d5e0937ddd21282c6cc9e908afa51ce5518f44dba813e4;
    stim[44] = 196'h596bc9cbf9d5eec7e5e4138908f2a96effba6418ba94323c0;
    stim[45] = 196'h62907fdb61a633193c82bc36a0fe6e8207896583437c968b4;
    stim[46] = 196'h5701fbb639b468dc6638081eb5f1ddefe4c899a099c8b5d81;
    stim[47] = 196'h5f9208ddd1f8a5b2d5eecb8142d23813f9fe5ee7622d8b67c;
    stim[48] = 196'h42ec93f494978736388f2e04448cbad6f26fb3f00803f7fbf;
    stim[49] = 196'h166e22922908d44c56a61a002aebcf615fa3190b9438fc8cb;
    stim[50] = 196'h58b5187e6f69050f3c10d0a2c58f7722c3781adab67c65ea6;
    stim[51] = 196'h2d41e864b993e9e86fd0c83651f80e9f52382db3f8b819d34;
    stim[52] = 196'h30213100366663cee2a13feb1818815a8834885bf18c64609;
    stim[53] = 196'h0f984274ad7c05970832a60d8cee390762fd39a3590567d93;
    stim[54] = 196'h059f36809420cbc0927b4a36811a85575dbf8d7fffeb20af1;
    stim[55] = 196'h5dcf7d644a39f274aa57185e9b477e7aec0a0136a475de5fe;
    stim[56] = 196'h40e4c9d8236ea682b713cafb41fc60d90eefd8387181156a4;
    stim[57] = 196'h6a1929cea464622f19bf68a64595d4300aeb26c22904adefb;
    stim[58] = 196'h42d76f5d6b9fdf1061b49dccbc539f3c1bd05951fc870c1ab;
    stim[59] = 196'h32df0018f9d4913c2dd8b38e68762c9d31fa0a7fc1b06ee5f;
    stim[60] = 196'h145f1e995aef195472570da86a10f007d7bddfaa414c5c137;
    stim[61] = 196'h0e0e2b79b829f075c16c4c0f2739826ba6565b1049ecbbfed;
    stim[62] = 196'h1d940dd645abef6755c786fd4260a2021e337b93ab7748f6a;
    stim[63] = 196'h3173cf214baaac1e7cb3474db4643d94d8734738fc91421a3;
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
      expv[0] = 163'h3829705fe0598d40f8f8aca12d8a9d31b936a674x;
      expv[1] = 163'h0a4d69f1f32b330c734dd1410412456dabb04cd11;
      expv[2] = 163'h4cc06880b00368decdfb566cb6c446ca3687d324d;
      expv[3] = 163'h2da728e9bf495e3606eb203b638b92eb3475a07b7;
      expv[4] = 163'h268f401979a8867cac78265f3fd9be753e6ad7d61;
      expv[5] = 163'h1872715020755c5bcafef8952cb49f99d227dba30;
      expv[6] = 163'h44540174ea0dc3b39b47d103261cfb84b8b615acd;
      expv[7] = 163'h6d4b484fe5934a56f940108d33933775b5f7cb5ee;
      expv[8] = 163'h75d510dea3248d323d971527d010bf80077be26d1;
      expv[9] = 163'h5e56b370c30c97b838650ed4b45a97c88aa22866c;
      expv[10] = 163'h17141ee24af8e7ab699c4061580bb3ac577b1fc71;
      expv[11] = 163'h04dcf380b9feabe259ae4f4d7113d6685018108bc;
      expv[12] = 163'h54f554eb53806b4b50ccde0cc63c87b8855764371;
      expv[13] = 163'h6f704830938b029f93785a1781764f055aef2d8ec;
      expv[14] = 163'h37950c06a10306618db304408410b54029df4c94d;
      expv[15] = 163'h4bb4fe4f42d9afd8ae9cb9975f5c1fbbfccc10870;
      expv[16] = 163'h0582fd066a6f14f30993ec30f5133351e1b7c5add;
      expv[17] = 163'h10cd90353a9d6b405cd7411740574c5735d34a70c;
      expv[18] = 163'h13f1e56be184b4ad0f237a2d3b684acc265795821;
      expv[19] = 163'h3eba9f0225db3940c92425295d9aff8ac3914d28f;
      expv[20] = 163'h65ff2f41f329ab8317bfc98d9725b32ba7b64cd88;
      expv[21] = 163'h67a56644cb997ec192dc18d2d4bf41d88fc210e51;
      expv[22] = 163'h60fcc46a31f486b61dbee69da3be3b4ebe23ad0b5;
      expv[23] = 163'h11303b24d8cb63fe028cfb87bc8e9c8c3b76564a5;
      expv[24] = 163'h14951c33f81a376218f3a78f29698d7849089174c;
      expv[25] = 163'h5f732ce98e7ea426ba74b8f5a97c8c63bd4d2a7af;
      expv[26] = 163'h54cea62413688d2308999f10b634f38bd97d9eb40;
      expv[27] = 163'h775573785b0dcc727c0f8fef6e73776661d03eb7c;
      expv[28] = 163'h0ae3da3448e6aa4c1407301aab0099a236d0c4fb8;
      expv[29] = 163'h610c9b43b3481bb3b6beb6ef71ec5a82d5e2a77c0;
      expv[30] = 163'h133fce2b33df726836069257f8547b524e8ba8a11;
      expv[31] = 163'h5f88be5765564349f48a16a16d645d55c14f31fe3;
      expv[32] = 163'h7b8aaa29476d27f6587be84b6235eb0dcb9e60712;
      expv[33] = 163'h58c081d3cb482b47abb43cc1a768aac3444a574d0;
      expv[34] = 163'h4b48482a1a98e1296dabe9ab8605c139fe0c11ebd;
      expv[35] = 163'h5976d5c30385e7069d36bf6b981b62519851ba20c;
      expv[36] = 163'h38ed1bc7faca0b052f10228da4cde5e6e40336ce8;
      expv[37] = 163'h0c127d49e8d9724e24d3fb60b6061995303724270;
      expv[38] = 163'h2183f190c442adeb2a3958a8aa42e37ff77aa0b2b;
      expv[39] = 163'h333b1f3bfd5527696386db947c733fe0a5f1db456;
      expv[40] = 163'h2a8de2b64a99c12d4bf2f049a63e9201b8da9791d;
      expv[41] = 163'h1d1dbe79175199fa5c92a95b7b43f432dd38b5102;
      expv[42] = 163'h2997145fe8305a236ff11810167e8b3273c87dbac;
      expv[43] = 163'h1beee9094163664f7d28e52ea72a8c7a26dd409f0;
      expv[44] = 163'h3ceaf763f2f209c494b76cb5ffdd320c5d4a191e0;
      expv[45] = 163'h30d3198c9e415e1b7741314803c4b2c1a1be4b45a;
      expv[46] = 163'h5cda346e331c040f6ef7eb80f2644cd04ce45aec0;
      expv[47] = 163'h28fc52d96af765c09c09efc93cff2f73b116c5b3c;
      expv[48] = 163'h4a4bc39b1c4797021d6b61767937d9f80401fbfdf;
      expv[49] = 163'h54846a262b530d0027b08b372fd18c85ca1c7e465;
      expv[50] = 163'h37b482879e0868517b916c5aa1bc0d6d5b3e32f53;
      expv[51] = 163'h1cc9f4f437e8641b074f96a0e91c16d9fc5c0ce9a;
      expv[52] = 163'h5b3331e771509ff580ad5810841a442df8c632304;
      expv[53] = 163'h56be02cb80195306dc8387cc317e9cd1ac82b3ec9;
      expv[54] = 163'h4a1065e0493da51b42ab82cfaedfc6bffff590578;
      expv[55] = 163'h251cf93a552b8c2f7f3d6ee7b605009b523aef2ff;
      expv[56] = 163'h11b753415b89e57db06ca0724777ec1c38c08ab50;
      expv[57] = 163'h5232311788dfb4532a18350c85759361148256f7d;
      expv[58] = 163'h75cfef8830da4ee64f9e216b8de82ca8fe43860d5;
      expv[59] = 163'h7cea489e16ec59c7164e996f98fd053fe0d83772f;
      expv[60] = 163'h6d778caa392b86d43803ca2fabdeefd520a62e099;
      expv[61] = 163'h5c14f83ae0b626078135c707132b2d8824f65dff4;
      expv[62] = 163'h22d5f7b3aae3c37e91010eca0f19bdc9d5bba47b5;
      expv[63] = 163'h65d5560f3a59a3a6deca58b9ec39a39c7e48a10d1;
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
