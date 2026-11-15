// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 261;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_081792 dut (
    .in0(in_vec[260:253]),
    .in1(in_vec[252:245]),
    .in2(in_vec[244:237]),
    .in3(in_vec[236:229]),
    .in4(in_vec[228:221]),
    .in5(in_vec[220:213]),
    .in6(in_vec[212:205]),
    .in7(in_vec[204:197]),
    .in8(in_vec[196:189]),
    .in9(in_vec[188:181]),
    .in10(in_vec[180:173]),
    .in11(in_vec[172:165]),
    .in12(in_vec[164:157]),
    .in13(in_vec[156:149]),
    .in14(in_vec[148:141]),
    .in15(in_vec[140:133]),
    .in16(in_vec[132:125]),
    .in17(in_vec[124:117]),
    .in18(in_vec[116:109]),
    .in19(in_vec[108:101]),
    .in20(in_vec[100:93]),
    .in21(in_vec[92:85]),
    .in22(in_vec[84:77]),
    .in23(in_vec[76:69]),
    .in24(in_vec[68:61]),
    .in25(in_vec[60:53]),
    .in26(in_vec[52:45]),
    .in27(in_vec[44:37]),
    .in28(in_vec[36:29]),
    .in29(in_vec[28:21]),
    .in30(in_vec[20:13]),
    .in31(in_vec[12:5]),
    .cnt(in_vec[4:0]),
    .out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 261'h1a517933027dcb3023a867247d5a24ca5ced27a77f310930cb3eecd40bc78b6f8c;
    stim[1] = 261'h02e9db34b9af2e5aa66ca25352773d5a1f98e2bce2ca59940b0474b10d78a38e1e;
    stim[2] = 261'h12761630daca2e051ca22101fee8dad3ffc89e209cb2545d830feca70de8f95735;
    stim[3] = 261'h00b9fe4de77c87f54e34a89cfc64d1e99a1ba90f52a04eb88b5525811176a113ab;
    stim[4] = 261'h16d677ade0eee1b2a6205b7e5a438344733501cedebbe0532b17e250a2962f5e39;
    stim[5] = 261'h069a64a457481cde30041da8a41b8333a6d5a33a3c1efc79546fe0fe00929e93fe;
    stim[6] = 261'h1dae7634e5eee9384de8f8c9b6acf6f7a576046134d35c2a72fe35a93095f61d45;
    stim[7] = 261'h0fdfdd7c7705b38b8b6efe1060956728ae99500c97ed5c4ef1816fb7a89d09cd70;
    stim[8] = 261'h1d3006e1d36a93b55df308d1efdf6f9edbf1cda6d72cbe012e6b5cc90cd97e5d14;
    stim[9] = 261'h1857dbf1c765be3f56810d9c849ad038a59f55360a67f99f951c017be2c97f0477;
    stim[10] = 261'h0116b02a679200238808ceb7f062992a8c7fdaa7a8e65cce31c3a7a4da82f1bfd2;
    stim[11] = 261'h0ad0f6f8535e3fdbc425ff9dbe00f088a0fe1f347a857adafac97b6e4f54dfcf64;
    stim[12] = 261'h06296162151ec98820445a21e7b8e6a84a5f7229efbdf3843b2121d2e94bac4c59;
    stim[13] = 261'h1807ee8a2fd8622079f8b78ff43cdaaa4976bdc4bca047de74413786eadb23cad5;
    stim[14] = 261'h1e2d6a51a73fd008d1ff320c2f7ff8f4739c398832170df7100a4c92f663da47d7;
    stim[15] = 261'h142a6e1b6a37273d93a4f1a98764e6c616bb52f8081adf1055b513b6e2108d95da;
    stim[16] = 261'h12531739c22273c3e8cdd5797e1d73d279bff2a17227143879b38cc1c72502e497;
    stim[17] = 261'h15311109775d9a391c4c7e8e6ce57d5bbdb770c2b53563b70a18e5a728b8dbd225;
    stim[18] = 261'h0f72d58902fd099d24975c8cbc714f7abdfee28c6fe210f8d95234b11cdcf3d3b6;
    stim[19] = 261'h110f34ce1668461264c5e7f33cb7c255d5e52abecd6061393ecfd914ba468c3069;
    stim[20] = 261'h1447ef793ddcfcedeca75009e8d9daf6436c1e3fff9892209b1c7783a7c261b329;
    stim[21] = 261'h01d494cda593e4c3ecf72ad1e1df4776e7f1a320912cafe4f9614eae7e60cfcc40;
    stim[22] = 261'h1f2ded094dc7bfad70bd0a790021aec22939db2f135ea178371662fdec7f7cfedc;
    stim[23] = 261'h13f683fa6846c0d195343b890750874fa55c3a0b93bfaf3920b016da773eef4006;
    stim[24] = 261'h0fa56fd72d5a9f37f4d8f41704e087e30f90a8f83ab8a5c31345cdb551c80f7e4d;
    stim[25] = 261'h0e7d9aba582a865c8a51a2cf67554dc39dcd500da625eacb978fe473db1e9fb065;
    stim[26] = 261'h0b962fd94116406de5fbcc26dc60c2097290ead06bee9b009091062c974a8d2a5d;
    stim[27] = 261'h15d356995f443938bea2043c066324f9ba06ee6bc44cda439055139a91a5217a60;
    stim[28] = 261'h0c1100bf2671b9b58990534b6c2314e22df9bf596d70375b6fd46ff33de82acdb6;
    stim[29] = 261'h1e39298aa6f7cb0138291e7f21dc55b85f92f492162005493a54e27a5389aeed3c;
    stim[30] = 261'h0f2c7a7da3b08a743bde8c94963248057ccdcfb96671481b88c8d05661211dbf95;
    stim[31] = 261'h0f1abb5b8002368cb4f894c0300c2943123983550d30dccc891fc4fb007b6d3fe3;
    stim[32] = 261'h04688a37fc4816494fb1caa17947e1ac2199a015c3c862ea814c522d727b996e4e;
    stim[33] = 261'h12f69f9031d5b477c8f42f2b2f4bb6388b4d43dfc90b163ef4db83da89196133db;
    stim[34] = 261'h0bef1193e48b43cf45fd476886ea92479fa96e0f421d7d3c9f7f90a9f92a5fc45f;
    stim[35] = 261'h1d51c7a320fc8927d2c3267f1aa70a878f262784fbcc949625b52a2605bf4530fd;
    stim[36] = 261'h0bc861e49ae8f201a34f0f934c1b5b1f5c25b116d173bd165f29bcb3b3e84eff2a;
    stim[37] = 261'h0619ec0104e7b26b405c6ff3e2fdf1a76e4fda47fa18eac023c45d55f531cc184d;
    stim[38] = 261'h199d63b75cab094347198a5abfbb20e73578f7aec2bef35ad1a8374e79d57da218;
    stim[39] = 261'h0ed66d244b3e6d402c11e7f5b27bcd8f8cb3088d9162376cf4c89a4488df2d764d;
    stim[40] = 261'h0da95c25adca2a368b1d9ebec06b3d3b4ecc22f4d643683074c739e225bb9638cb;
    stim[41] = 261'h158e8e1dbace0b52d21f3b2b868ad9eabca1e795a09d3a2ffe3e2b21629a54bf66;
    stim[42] = 261'h1a2ec5b820b3bfd5d860788b10e3b28c463854751ae024d176be304739e7d08018;
    stim[43] = 261'h086fb867de1ee1252445f854df8e96216b2042dedbf5923885200e40aeb3f59854;
    stim[44] = 261'h1a2f17d9c459e80ad9f5a72eb435a2245983b59f6124c3aa2811ac9fc0b805815c;
    stim[45] = 261'h0b5cd1340cb116b1fe62eb1b90df0e71babb92854ba80cf05a66d52578bb9fd8d8;
    stim[46] = 261'h05a1e936e2faa9f3dfbffee995d5e63e629e81756af88b611d0a893e84d8a7b0f2;
    stim[47] = 261'h18588dcaba6abd0a6a3f00cb69b39fbd7b6046a3a1910179333f379246b9f1709a;
    stim[48] = 261'h04f61ecfb661d4f94be8d942645a328110c3773193ddb5b80e748405b4db14d916;
    stim[49] = 261'h1b20a1b5cab7db59246a3747fd606ea24368aecfef4c1738e05cd0aedd4b690a1b;
    stim[50] = 261'h12603ee27fed200e6d01153dcaf64437fa57c7bd2a4a5330127dad7f5d49d34d89;
    stim[51] = 261'h11e478fe4286e01699f941e6a24fdfd8ef211900efe657614dbd3e521c330636c3;
    stim[52] = 261'h156c2a46cbd3cf958a454e5f812928fde5509741898907d9df380f80dff44244c5;
    stim[53] = 261'h0a0ede693d32426225c0ecb710bd869d1d341ae354a3bce78ab1f0dbd25d9bc302;
    stim[54] = 261'h0a89a8c717e683ea146b110e648678cb613fa72c762b5c8b9783e0e0da754e56e9;
    stim[55] = 261'h1521efa577103e5740f9283c6bb3118a9782f8dbfe4109128b2bb4eb1a3d6b70d2;
    stim[56] = 261'h0a034d85a25633eff454cd7fa13a5a2bf8712700da8c61ce5c6c0b1fbc5366547a;
    stim[57] = 261'h115a83b9aa722b501a2c3f3d141cc7560e8185eed1cdcc43d87beca3cd4fc8370c;
    stim[58] = 261'h158f8e785775641db46ff83aaddc421a9dfcfb908061565794a107dff4c2a17f17;
    stim[59] = 261'h07bba0a6acaf0ea54757d612cfe2e5ac2b1466ac9ebca961a12f751d79007dba6f;
    stim[60] = 261'h1182a5b9884377d11308bfb19dc58d4d1c61e9a0b7503bc69910b2442b78ae4a4a;
    stim[61] = 261'h168ee0e3982d1209fd2a4170bdd2a5e7dfdc8e91630c12528fce4f869063c8b170;
    stim[62] = 261'h1a5da587a47f84ee800cadf6a18de6d5e9a4efd4e27db28ea48aaacfce5bde5662;
    stim[63] = 261'h0b7cc9ac3a544ef9fb2be7be21590376b9f6df835e6879d31f3474e2b836f04d8e;
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
      expv[0] = 8'hea;
      expv[1] = 8'h1c;
      expv[2] = 8'h92;
      expv[3] = 8'he7;
      expv[4] = 8'hbf;
      expv[5] = 8'hf4;
      expv[6] = 8'h77;
      expv[7] = 8'h74;
      expv[8] = 8'hb9;
      expv[9] = 8'hfc;
      expv[10] = 8'hd5;
      expv[11] = 8'h9a;
      expv[12] = 8'h09;
      expv[13] = 8'h02;
      expv[14] = 8'hb8;
      expv[15] = 8'h9d;
      expv[16] = 8'hc3;
      expv[17] = 8'hec;
      expv[18] = 8'h87;
      expv[19] = 8'h2f;
      expv[20] = 8'h3a;
      expv[21] = 8'h0e;
      expv[22] = 8'h63;
      expv[23] = 8'h06;
      expv[24] = 8'h04;
      expv[25] = 8'h54;
      expv[26] = 8'h54;
      expv[27] = 8'hae;
      expv[28] = 8'hba;
      expv[29] = 8'h9c;
      expv[30] = 8'h8a;
      expv[31] = 8'hdc;
      expv[32] = 8'h0d;
      expv[33] = 8'hd4;
      expv[34] = 8'h22;
      expv[35] = 8'hfa;
      expv[36] = 8'h7c;
      expv[37] = 8'hef;
      expv[38] = 8'h8d;
      expv[39] = 8'hde;
      expv[40] = 8'hf6;
      expv[41] = 8'h5a;
      expv[42] = 8'hb5;
      expv[43] = 8'hdf;
      expv[44] = 8'h05;
      expv[45] = 8'hd3;
      expv[46] = 8'h0b;
      expv[47] = 8'hbc;
      expv[48] = 8'had;
      expv[49] = 8'h76;
      expv[50] = 8'h08;
      expv[51] = 8'hf2;
      expv[52] = 8'h9e;
      expv[53] = 8'hf3;
      expv[54] = 8'h58;
      expv[55] = 8'hc6;
      expv[56] = 8'h58;
      expv[57] = 8'ha0;
      expv[58] = 8'hbc;
      expv[59] = 8'h61;
      expv[60] = 8'hfd;
      expv[61] = 8'hfe;
      expv[62] = 8'h2c;
      expv[63] = 8'h1b;
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
