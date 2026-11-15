// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 230;
  localparam OW = 177;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02891 dut (
    .aclk(clk),
    .aresetn(in_vec[229:229]),
    .s_axi_awid(in_vec[228:217]),
    .s_axi_awaddr(in_vec[216:185]),
    .s_axi_awlen(in_vec[184:177]),
    .s_axi_awsize(in_vec[176:174]),
    .s_axi_awburst(in_vec[173:172]),
    .s_axi_awlock(in_vec[171:171]),
    .s_axi_awcache(in_vec[170:167]),
    .s_axi_awprot(in_vec[166:164]),
    .s_axi_awregion(in_vec[163:160]),
    .s_axi_awqos(in_vec[159:156]),
    .s_axi_awvalid(in_vec[155:155]),
    .s_axi_wdata(in_vec[154:123]),
    .s_axi_wstrb(in_vec[122:119]),
    .s_axi_wlast(in_vec[118:118]),
    .s_axi_wvalid(in_vec[117:117]),
    .s_axi_bready(in_vec[116:116]),
    .s_axi_arid(in_vec[115:104]),
    .s_axi_araddr(in_vec[103:72]),
    .s_axi_arlen(in_vec[71:64]),
    .s_axi_arsize(in_vec[63:61]),
    .s_axi_arburst(in_vec[60:59]),
    .s_axi_arlock(in_vec[58:58]),
    .s_axi_arcache(in_vec[57:54]),
    .s_axi_arprot(in_vec[53:51]),
    .s_axi_arregion(in_vec[50:47]),
    .s_axi_arqos(in_vec[46:43]),
    .s_axi_arvalid(in_vec[42:42]),
    .s_axi_rready(in_vec[41:41]),
    .m_axi_awready(in_vec[40:40]),
    .m_axi_wready(in_vec[39:39]),
    .m_axi_bresp(in_vec[38:37]),
    .m_axi_bvalid(in_vec[36:36]),
    .m_axi_arready(in_vec[35:35]),
    .m_axi_rdata(in_vec[34:3]),
    .m_axi_rresp(in_vec[2:1]),
    .m_axi_rvalid(in_vec[0:0]),
    .s_axi_awready(out_vec[176:176]),
    .s_axi_wready(out_vec[175:175]),
    .s_axi_bid(out_vec[174:163]),
    .s_axi_bresp(out_vec[162:161]),
    .s_axi_bvalid(out_vec[160:160]),
    .s_axi_arready(out_vec[159:159]),
    .s_axi_rid(out_vec[158:147]),
    .s_axi_rdata(out_vec[146:115]),
    .s_axi_rresp(out_vec[114:113]),
    .s_axi_rlast(out_vec[112:112]),
    .s_axi_rvalid(out_vec[111:111]),
    .m_axi_awaddr(out_vec[110:79]),
    .m_axi_awprot(out_vec[78:76]),
    .m_axi_awvalid(out_vec[75:75]),
    .m_axi_wdata(out_vec[74:43]),
    .m_axi_wstrb(out_vec[42:39]),
    .m_axi_wvalid(out_vec[38:38]),
    .m_axi_bready(out_vec[37:37]),
    .m_axi_araddr(out_vec[36:5]),
    .m_axi_arprot(out_vec[4:2]),
    .m_axi_arvalid(out_vec[1:1]),
    .m_axi_rready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 230'h1d18acc54456916602672ad65d7a42b3678f41f9a5e919c47d904abf98;
    stim[1] = 230'h133c5ad79e770cbf57e270eb0c03194d98ca5b0d294e353e7d5d2bbf60;
    stim[2] = 230'h2fdc045e68e134aede73b389069c3983a087ffe78145529e2cc9ca08cc;
    stim[3] = 230'h28a06d7467dfb330207ad80c32e9c4f3eead91bc8c0e1af20c061feacc;
    stim[4] = 230'h278e50ff69ff1fc41d804eff67d70b7d99df436f229af6f6c04934c4f3;
    stim[5] = 230'h271f4eef99c5f30febeeb0a96f768d9cde47323b1221cd8cb9152733db;
    stim[6] = 230'h31f2c5ff1fffb0ef3cdc0ee6d45764fb6e5c8ea20048d10e72731dadcd;
    stim[7] = 230'h2a6f4db081721c95c902a891e09cc555d50bb06fc3fd810e8ffc7864f3;
    stim[8] = 230'h3b366dabd08fc7d0a84f0f245d2b60f19f3b87b5b3aa9b23b10c2b5f2d;
    stim[9] = 230'h2deb8885e3673b5a45d5ba5ec5668c9bdc446a06e5c85aeb4adb8821a5;
    stim[10] = 230'h26a8aebb03e71714e6e698b4e30dba27d883830679acaaa36e456e01dd;
    stim[11] = 230'h3e04f9be473f271bb1823c6da3ed154fc844441a999048e6e92215a1f6;
    stim[12] = 230'h3109fac1b069c83185e446cd97074c8dece7957c57898834edfd87a7ba;
    stim[13] = 230'h25f4139b96dcd0e94dc90717cf149416b573bb6a86b92afe1e42ea4077;
    stim[14] = 230'h2cd610f995ff28402d38a46ebbaf733f39e4d802bc4e76bb9212fd356b;
    stim[15] = 230'h2b93cdd71f2a0f70f4de355157ecbf1145ddf2ca2290015c4fe319da2b;
    stim[16] = 230'h3d2732cf7bf3e564605b48149c1199110f3a2aafc655be4290247a8043;
    stim[17] = 230'h3924640db02d653edc7e1f3273673d25c649cd8ad091c6a9f262cf7d7c;
    stim[18] = 230'h396b92abf5d9da7917e404bceeb767d12043c5e098ac34e8fe66a89853;
    stim[19] = 230'h3b8cdcc63dbadb7bc1ce70d2fa28d6bb39d7d25bd887ab87dd43070d8c;
    stim[20] = 230'h34bf72c7d3af1f9f558b9ae20818fd5d96b5a610a337b208287d2e477c;
    stim[21] = 230'h330074db396cf3b8e0e51eaaf780a3e850ca3df466892d14978d9b6d3f;
    stim[22] = 230'h3c21d34057679e1f8165721bac3207976f45cf0f058eebfa6fb6870828;
    stim[23] = 230'h006b77511c2bb04392a45a7c6eaa545f2c5b972f8ae6516aa110477d8f;
    stim[24] = 230'h2a78bb5f4bf600ff211b0f45cda284a6100448ea30a67eace6139ec27a;
    stim[25] = 230'h31d6de12ae8db6fd04df0d475020273b522ed504bf01a11996f61994b9;
    stim[26] = 230'h23b60c12dc25bcfa1bd9bc5707ed290a0287e48472174bddd9ee4d3039;
    stim[27] = 230'h39676e650a0df52edace03e9c2660df806f10882ed1fd5b36616193d49;
    stim[28] = 230'h3b2cdcd19fd2f96d5ba2bf1d1458b8852aeb6c7e07e66339cd19c7c4fe;
    stim[29] = 230'h21f640149018b40c2a3702328e100770c18f2e777810b919361eb6717e;
    stim[30] = 230'h3f3ee328a4fd2874746c791ae1199b2a0f6eb4f05a050fb6a00d7aa2ea;
    stim[31] = 230'h3e27a057f8231294654e1324562e97ea191cc8c9c0e30d66db1455ca7f;
    stim[32] = 230'h362038306861b4b0b81a1b71aefd1103073cb692b945e05ef7a5b62fe8;
    stim[33] = 230'h2702d2375cdff1167429e278e5ee51e2141a6646f98f291f1e0ce9edf7;
    stim[34] = 230'h3a6a981176e8e953046b7d5538d8b1b555102b42112cc725d7cfdde80b;
    stim[35] = 230'h2102880f4ed578a164e5a73876c3ace213ccdea8b52a0f8b320cb2d495;
    stim[36] = 230'h3fc9da8d2731e4d0bdbf769df54b7589afe32b06d60a98f5b0e30f8087;
    stim[37] = 230'h2cfe821970b98f795475412033b0712157b5aee379a03319effeac714e;
    stim[38] = 230'h34fbb4909bd9f1055bac3821f23660a89cbd3f5174ecb3f78617903730;
    stim[39] = 230'h3c85cbc73c174b4d44a14c96f14191a874e97b62b2bc2dbc72582eede9;
    stim[40] = 230'h2df5b9d24e08ae61d67c10258d2b75ec855993819f00b734a8f729d03c;
    stim[41] = 230'h27596d3b80237fe19a8c9b4234e8ce363140a5cbdcb73a689f61bf1bbe;
    stim[42] = 230'h24b4924616aaad55c5afa017c7e0ec5c426dd8a9f4c3efa09fa9b7ffb8;
    stim[43] = 230'h239f41a589939f971f3e45810aea858f4db715ed81e6b9379f1a6d8a03;
    stim[44] = 230'h355a11a83452976203f12603f39a1e3ed03a63d5489995614c9ae1c3c6;
    stim[45] = 230'h3a55c186e81123cc47e3db963cd28333c7509dbfed30cc96e18400e43b;
    stim[46] = 230'h33517f5301da60b407389544839d66add487befaa9982be27dfc79572b;
    stim[47] = 230'h3435d66bf8b44dcc8893610086a84cdbbe6734126579c37b5b70627bc6;
    stim[48] = 230'h3ee5547418aa87b7a5c571a4e0f9be02816a9e300bb4dc9f29a4c97d06;
    stim[49] = 230'h2dc994adbf7df7354312ab5639a14881aecdf75b2fd0fcef30a0d0ebc2;
    stim[50] = 230'h2dd10212fd06106dae17baa9916b28bc32496a66125a74bbf016ec25a0;
    stim[51] = 230'h35663fe2bee535adadd79d99a2a5d1f37277a69e8046efcd24b338f935;
    stim[52] = 230'h39f6c4f5c19e259b22cea6bdb861967a30c632247c6f03179532ce2728;
    stim[53] = 230'h26aae2d91d4159529871013b9561b179f47699ff5dcf1c65698c9137d6;
    stim[54] = 230'h2e7113f6a6a44e54708c063f2a25ac81b93e9cb9ecaf653ef7aaa88770;
    stim[55] = 230'h31011065e40a9eed1aa6efc90f550a8c2afe0143a35a40595040c8ba49;
    stim[56] = 230'h31cce3db0542fe710ccef5fea41dc77e6dbeefff677b80c4f2dec46454;
    stim[57] = 230'h2daea0f94c34e415e18ca6c7675ddc7755e58af7a0f152b12ffcd80d0f;
    stim[58] = 230'h39632780969e02a8b0cb4470226ef74c93ffc8fba7e4a9f765f4e79667;
    stim[59] = 230'h239db5b64c1281074137a18b45d967488c18031b77dc1547fd4ed40826;
    stim[60] = 230'h29a791010fbb85351e025a82cd658285f9b495b67f44902b1aea78e7e1;
    stim[61] = 230'h3d69dfa5f2d8928f8357b49a56a1d5a0813fc006b42b40271aec665374;
    stim[62] = 230'h307f080d39558aeb2e428a4ee4453d91c3f719c2d16dfc6841555b973b;
    stim[63] = 230'h3369cc755154b5ee52fd782797eade32d28feb08af41090b8f62e856aa;
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
      expv[0] = 177'hxxxxxxxxxxxxxxxxxxb315115872ad65d7a0cf1e83f2e;
      expv[1] = 177'h0000000000000000016b5e79dd270eb0c0333194b61bb;
      expv[2] = 177'h0000000000000000001179a3853b389069c7410fffceb;
      expv[3] = 177'h000028004c9ca08cc1b5d19f7aad80c32e99dd5b2378d;
      expv[4] = 177'h000008004061feacc143fda7f904eff67d7133be86dfb;
      expv[5] = 177'h0800400004934c4f2d3bbe6716eb0a96f769bc8e64766;
      expv[6] = 177'h080038001152733dab17fc7ffbc0ee6d4574dcb91d44b;
      expv[7] = 177'h000070002731dadccd36c205cc2a891e09c9aa1760de3;
      expv[8] = 177'h080008007fc7864f29b6af423af0f245d2b53e770f6ad;
      expv[9] = 177'h1800300010c2b5f2ce22178d9c5ba5ec5669b888d40cd;
      expv[10] = 177'h100048002db8821a4abaec0f9e698b4e30dfb107060d5;
      expv[11] = 177'h100068006456e01dcbe6f91cfb23c6da3ed3908888347;
      expv[12] = 177'h0800680012215a1f67eb06c1a0446cd97071d9cf2af86;
      expv[13] = 177'h080068005fd87a7ba04e6e5b7490717cf14b6ae776d57;
      expv[14] = 177'h00001800642ea4076843e657fa8a46ebbaf673c9b0059;
      expv[15] = 177'h18001000212fd356af375c7cafe355157ece8bbbe5942;
      expv[16] = 177'h000048007e319da2accb3defceb48149c11a1e74555fd;
      expv[17] = 177'h080010000247a804299036c0b5e1f32736778c939b140;
      expv[18] = 177'h18007000262cf7d7c64aafd761404bceeb7440878bc18;
      expv[19] = 177'h08007800666a89852b7318f6ece70d2fa28a73afa4b77;
      expv[20] = 177'h18005800543070d8c5cb1f4ebdb9ae20818f2d6b4c218;
      expv[21] = 177'h0000280007d2e477c1d36ce5b651eaaf780ca1947be96;
      expv[22] = 177'h0800100078d9b6d3ef4d015d985721bac320de8b9e1f5;
      expv[23] = 177'h000068007b68708285dd4470a945a7c6eaa258b72e5e9;
      expv[24] = 177'h000000000000000002ed7d2fdab0f45cda28200891d5e;
      expv[25] = 177'h080060006139ec27a3784aba30f0d4750204a45daa090;
      expv[26] = 177'h180010006f61994b88304b70919bc5707ed4050fc9086;
      expv[27] = 177'h180058001ee4d3038db9942835e03e9c26600de211049;
      expv[28] = 177'h10006000616193d48b73467f4d2bf1d1458e55d6d8fd0;
      expv[29] = 177'h18004800519c7c4fe100524062702328e101831e5cefc;
      expv[30] = 177'h1000300061eb6717e38ca293f7c791ae119a1edd69e07;
      expv[31] = 177'h0800200000d7aa2ea6815fe08ee1324562ea323991927;
      expv[32] = 177'h0800580031455ca7e8e0c1a183a1b71aefd20e796d253;
      expv[33] = 177'h080070007a5b62fe8348dd737f9e278e5ee22834cc8d7;
      expv[34] = 177'h1000180060ce9edf6a6045dba0b7d5538d8eaa2056842;
      expv[35] = 177'h180050007cfdde80aa203d3b565a73876c3c2799bd505;
      expv[36] = 177'h1000300020cb2d494f6a349cc3f769df54b75fc6560ce;
      expv[37] = 177'h180030000e30f8086a0865c2e55412033b06af6b5dc78;
      expv[38] = 177'h180068007feac714e6d2426f65c3821f2365397a7ea3b;
      expv[39] = 177'h1800000061790373072f1cf05c14c96f141ae9d2f6c56;
      expv[40] = 177'h000070002582eede8ee7493825c10258d2b70ab32703a;
      expv[41] = 177'h080028000f729d03c5b4ee0089c9b4234e8862814b97c;
      expv[42] = 177'h08001800761bf1bbe249185aacfa017c7e0c84dbb1534;
      expv[43] = 177'h080018007a9b7ffb8506962649e45810aea89b6e2bdbf;
      expv[44] = 177'h1800180071a6d8a02846a0d14812603f39a3a074c7aa8;
      expv[45] = 177'h1000480049ae1c3c67061ba0443db963cd298ea13b7e7;
      expv[46] = 177'h0800600018400e43adfd4c076889544839d5a90f7df55;
      expv[47] = 177'h000078005fc79572af59afe2d03610086a817cce68241;
      expv[48] = 177'h10005800370627bc6551d062aa571a4e0f9f02d53c60f;
      expv[49] = 177'h100028001a4c97d06652b6fdf42ab5639a115d9beeb7f;
      expv[50] = 177'h100030000a0d0ebc24084bf41a7baa9916b46492d4cd9;
      expv[51] = 177'h18007000016ec25a00ff8afb9279d99a2a5ae4ef4d3d6;
      expv[52] = 177'h100020004b338f934b13d7067aea6bdb861a618c64483;
      expv[53] = 177'h18001000532ce272838b6475011013b9561fe8ed33fee;
      expv[54] = 177'h1000680018c9137d644fda9a97c063f2a25d727d39733;
      expv[55] = 177'h080070007aaa887704419790296efc90f55055fc02860;
      expv[56] = 177'h10005000040c8ba48b8f6c1508ef5fea41d8db7ddffe2;
      expv[57] = 177'h080070002dec46454283e530d6ca6c7675daabcb15ee8;
      expv[58] = 177'h100028007fcd80d0ec9e025a7bb4470226ef27ff91f77;
      expv[59] = 177'h100060005f4e79666ed6d9304c7a18b45d9518300636b;
      expv[60] = 177'h1800780054ed40826644043ee925a82cd659f3692b6c9;
      expv[61] = 177'h100018002ea78e7e0f7e97cb607b49a56a1b027f800c3;
      expv[62] = 177'h100018002ec66537442034e55228a4ee445787ee3385c;
      expv[63] = 177'h000040001555b973af31d54555d782797eaba51fd6105;
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
