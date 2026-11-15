// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 275;
  localparam OW = 275;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_034340 dut (
    .clk(clk),
    .D_stat(in_vec[274:272]),
    .D_icode(in_vec[271:268]),
    .D_ifun(in_vec[267:264]),
    .D_valP(in_vec[263:200]),
    .D_valC(in_vec[199:136]),
    .d_valA(in_vec[135:72]),
    .d_valB(in_vec[71:8]),
    .d_rA(in_vec[7:4]),
    .d_rB(in_vec[3:0]),
    .E_stat(out_vec[274:272]),
    .E_icode(out_vec[271:268]),
    .E_ifun(out_vec[267:264]),
    .E_valC(out_vec[263:200]),
    .E_valA(out_vec[199:136]),
    .E_valB(out_vec[135:72]),
    .E_rA(out_vec[71:68]),
    .E_rB(out_vec[67:64]),
    .E_valP(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 275'h40c73bf21c270c12a5d86c99ef00a702a8e31159b586b144804e2f997e7e4bde92cf5;
    stim[1] = 275'h6479f5480a4de6bfab26b3d04bb9435ea1401e4a12e18bf7c84a67f05bb8fd6afa6a4;
    stim[2] = 275'h7d4c59df375531b3ebd4f4e7eeb608b454d9ba303f4b9f0b9e6d208291ece1a344b4e;
    stim[3] = 275'h5dea0e2cdfa935e3417c407f6ed6cb1943d32e3e830e0c32596e2cef8bcd7fcc7c075;
    stim[4] = 275'h4afac82282100189218306c3d2e6d30029fdfc1646372ce6c8acc0010ab0371cd04f1;
    stim[5] = 275'h6811111bd191761035582b77b18b997ce6ca2a3450c371e55fb45adcd0e8d875cdf0c;
    stim[6] = 275'h5bddb9113811fe12c5b7a025688c8b257d2bb9967a059455ad42621d3452bd759d877;
    stim[7] = 275'h0aa82a3b89d0668e1b664bac0512b22b5a78d1f5b5a96ce45dccc4af23b1e85889616;
    stim[8] = 275'h33391626ccfcf423c21ec63ae41d12abc194d1ee459b0666593cf16d4a3e42062d089;
    stim[9] = 275'h1b6d77a1a452b08c143ad0e8631c147a06be9f5b603fd32a4c785f3e0d2cd7b75fa39;
    stim[10] = 275'h2f33dad6eecad035d4173f95c2b2ef2702055d7ad14eca14894b8f4d86ecad0a00d16;
    stim[11] = 275'h24d26f97e7cab413cdb61d396cf23d898bfb35605eb82a6c73dc8917a01872ab96350;
    stim[12] = 275'h6f4d37ff08b6f44a855b1d43d6341bc4382bc2636a97c6a6efe06baf8711156ca264f;
    stim[13] = 275'h2d9f1abd24db65cd6d33d80c9ae7cba54fe69a2a351d264c472b010cf5084eb3cd293;
    stim[14] = 275'h59183daf9266c9c54ab4758fa35321e3084f18c9a1aff77da658f94319c9051efef60;
    stim[15] = 275'h5f603a682eb3738f3e284817872baca1ef3b152a3f449f4342aa6cbfbf72a9b74fdb7;
    stim[16] = 275'h391308fdf4eba122d09b422585afcd0dce3565f713508ba126bdb56eaa08f72523827;
    stim[17] = 275'h1b7e43b7d4fec85077073804108b313ded05c114b3b1ad1e2e1d872d9d17e18dcdd1c;
    stim[18] = 275'h37e026761d8871e234c78f8377f2ca8e9ef05798e5b329f4b088762b6bd3016d81ecb;
    stim[19] = 275'h6f9d798348f4dba350840f4b7b8e0179e8860bb7a5a4b303191b952a282cd4b15e8ea;
    stim[20] = 275'h7bc537a677de55c8b11b15846aa9a6ec36d5d44ab09b0c129fe139d1df11d88caf0c7;
    stim[21] = 275'h16cfb4b8dd60e8a94b665ecf4a5e0e7fe219f18fdc47ab49d1e0fa8aea842d25f288b;
    stim[22] = 275'h390cd65f4c0dd53085935417fc8f963d91495aac48aed65e3187919b57297ac1ded54;
    stim[23] = 275'h0572efdffdde4a5869cbf562ece22ec0c2c2816bf10d1438c4e3ee5668d9d0c213f21;
    stim[24] = 275'h129898410ddf5ebf231a0404e05df69eff1c1df2d1937e9bb81e523b776c71a002a5c;
    stim[25] = 275'h5952e1fabf5ef4a55081cc263ad9584bd645d28adbd60494d27c085d5af5d7b53614d;
    stim[26] = 275'h3853465159d8a2711bf8032bfae1513755a530b142d7947fcabc6499d7a8c8b77a2e3;
    stim[27] = 275'h17eac7d0c6928da34088e5be3285fb33d24c9e39b03cd422cbab7f042212ba2eb2b51;
    stim[28] = 275'h099619ac97a7b53ebf1cf6272819b969f95d6dc374809c139a3a23923c8b14a1c5fbb;
    stim[29] = 275'h50a047e4603eddf6138da1107f72203fd23591bd37c2090370718d40936dbbeacdf95;
    stim[30] = 275'h2c91eba9a857a69f77aa0f505687bf9a8c1a4667453cd20ecaf147bfa5ca35d8f63cb;
    stim[31] = 275'h35c947bd6869f87b177f8ac1d9c06923663b246421f57679dba7c8a9f75fd611be36b;
    stim[32] = 275'h4ec4744c6724ba4c7dbdec3d6a20ebae554ee8a5394bbd5bbb578c133c2abab971bce;
    stim[33] = 275'h72fc331224b24623ba3df27ceb978d5969a606c19b6d35ac4a1f5eac4f45b4954cd0d;
    stim[34] = 275'h6721a31702a6ab14e4092f337c5239c44dab26ac3142bcf01813530efeb5cc5b9b17f;
    stim[35] = 275'h48a50e7269eba1559c838e09004417f9a12a80d64bdc2abfd1c4ba9c5edacdf14d420;
    stim[36] = 275'h047de9bc273ce1bf26c6245b67e16da382f5945967999070f3f8e4faec13d0a82e640;
    stim[37] = 275'h5a318674fd46c5802a35431838c17a131fbc5707127f9abd9c70eba1f72043c4dce03;
    stim[38] = 275'h71d7621d407959656db6070e829d63270f5ac4219162683080fc367f1698ed9148a9a;
    stim[39] = 275'h0e161dadcbd7046e9fabe874226fc0c3468f4965a13eb737b777f3e87d47d824079b4;
    stim[40] = 275'h3b8dd7a7e430d78fa8ead8712b6576506ad3bbbc69bd21060261d9e757020a534c66c;
    stim[41] = 275'h1aaf97e72c5d33ff1c802646048c1e52b7c912fca4a6c28ddb8788043b89aa7b230f0;
    stim[42] = 275'h2f97369afa7cefaa2cd75101e4861e1895294a8abc8da86066f4eb9e69a0f8dfdce4b;
    stim[43] = 275'h51abdeec69c3f1ecb8cdfeab36605aa4e6f9ec8f4b6ae0630002445e0387ed37760e4;
    stim[44] = 275'h1d30221803460cab88622309f90ed5c8f88f4ec6e50acc5047b0e29bf724f729f8db2;
    stim[45] = 275'h765ee24a6a73e3444270a4b8e828e14ba2d877cbbd2e6c3e4df34ba670305694446e1;
    stim[46] = 275'h25758f3fcd7d5b79d4f9d3ccd9c2559b0cd5272da4adfaab7c9d55e29145701d98bbb;
    stim[47] = 275'h1b42e387cf505a0988e842e256f14e349d41b177108c5d61cee2a29b5f17503810c71;
    stim[48] = 275'h3dc544ef56d063709199ed37b8dc1d979de5b222652d2b0cff1e637b13f245ae9258c;
    stim[49] = 275'h637d40f6e29061cae28b7768488f45a49aba1516679144f12b2218c192240185a262d;
    stim[50] = 275'h19c0bc8f1320b7bcaa55e05af222f8f4aa7a2e840540d75e00dea873fe3bf5176a1c6;
    stim[51] = 275'h725dd4922f0915bdfb9ad9dca13ee4e690e05b423d7bc9a4891fb7a76f1dd3f226489;
    stim[52] = 275'h009c3c7f165797e4871ea69a6671fcf8a8824c29cb4e6c36230e2001165a37d068791;
    stim[53] = 275'h459571fb97fa716572c3f4c25b512a9d80690f84222707745e9afb6980db6e63b213b;
    stim[54] = 275'h01d35ee454fff018c2991b19f5595fa29b6c613be3b729d257ac7c83d7e8bcc122900;
    stim[55] = 275'h45b397dc7708c54de9366f14b3b342e2d797b26d43c0e60ef185babb78d521b6fec45;
    stim[56] = 275'h65433717c03d821d633177f9d96a980040603a3c2137d803a1de4e31fad643cc6d78b;
    stim[57] = 275'h127b859cbdafc6df40d44720f3886a4f8597563425fd78d252175d1ddbf7c486f95a4;
    stim[58] = 275'h37d7f5e5f60a831a9184b10dc1c18ac2cf7bf6218d8abe5744061665a954e2999648d;
    stim[59] = 275'h02d7f6cbfd61b94901c9c67c34238a5f5bd786b498753754d286ff54db97db1034d0a;
    stim[60] = 275'h6c5857ffe909024f35eeeaf8ce8a8c132c15848ccb6bc3a4dc9665824cf2403312d90;
    stim[61] = 275'h4047c7fa75e857316a630bbe54aa70eea22a0c7104801c82b21f85ad06c8affa6a1fa;
    stim[62] = 275'h505686f47c0cedd42ee36f9f891fd7854f36b77eb0123d37ea8ab78f804097da9c074;
    stim[63] = 275'h623a85929b47489368e6587865794834e1db8150b0ed2915791568f107c4e7363dc34;
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
      expv[0] = 275'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 275'h40c86c99ef00a702a8e31159b586b144804e2f997e7e4bde92cf573bf21c270c12a5d;
      expv[2] = 275'h6476b3d04bb9435ea1401e4a12e18bf7c84a67f05bb8fd6afa6a49f5480a4de6bfab2;
      expv[3] = 275'h7d44f4e7eeb608b454d9ba303f4b9f0b9e6d208291ece1a344b4ec59df375531b3ebd;
      expv[4] = 275'h5dec407f6ed6cb1943d32e3e830e0c32596e2cef8bcd7fcc7c075a0e2cdfa935e3417;
      expv[5] = 275'h4af306c3d2e6d30029fdfc1646372ce6c8acc0010ab0371cd04f1ac82282100189218;
      expv[6] = 275'h68182b77b18b997ce6ca2a3450c371e55fb45adcd0e8d875cdf0c1111bd1917610355;
      expv[7] = 275'h5bd7a025688c8b257d2bb9967a059455ad42621d3452bd759d877db9113811fe12c5b;
      expv[8] = 275'h0aa64bac0512b22b5a78d1f5b5a96ce45dccc4af23b1e8588961682a3b89d0668e1b6;
      expv[9] = 275'h333ec63ae41d12abc194d1ee459b0666593cf16d4a3e42062d08991626ccfcf423c21;
      expv[10] = 275'h1b6ad0e8631c147a06be9f5b603fd32a4c785f3e0d2cd7b75fa39d77a1a452b08c143;
      expv[11] = 275'h2f373f95c2b2ef2702055d7ad14eca14894b8f4d86ecad0a00d163dad6eecad035d41;
      expv[12] = 275'h24d61d396cf23d898bfb35605eb82a6c73dc8917a01872ab9635026f97e7cab413cdb;
      expv[13] = 275'h6f4b1d43d6341bc4382bc2636a97c6a6efe06baf8711156ca264fd37ff08b6f44a855;
      expv[14] = 275'h2d93d80c9ae7cba54fe69a2a351d264c472b010cf5084eb3cd293f1abd24db65cd6d3;
      expv[15] = 275'h5914758fa35321e3084f18c9a1aff77da658f94319c9051efef6083daf9266c9c54ab;
      expv[16] = 275'h5f684817872baca1ef3b152a3f449f4342aa6cbfbf72a9b74fdb703a682eb3738f3e2;
      expv[17] = 275'h391b422585afcd0dce3565f713508ba126bdb56eaa08f72523827308fdf4eba122d09;
      expv[18] = 275'h1b773804108b313ded05c114b3b1ad1e2e1d872d9d17e18dcdd1ce43b7d4fec850770;
      expv[19] = 275'h37e78f8377f2ca8e9ef05798e5b329f4b088762b6bd3016d81ecb026761d8871e234c;
      expv[20] = 275'h6f940f4b7b8e0179e8860bb7a5a4b303191b952a282cd4b15e8ead798348f4dba3508;
      expv[21] = 275'h7bcb15846aa9a6ec36d5d44ab09b0c129fe139d1df11d88caf0c7537a677de55c8b11;
      expv[22] = 275'h16c65ecf4a5e0e7fe219f18fdc47ab49d1e0fa8aea842d25f288bfb4b8dd60e8a94b6;
      expv[23] = 275'h39035417fc8f963d91495aac48aed65e3187919b57297ac1ded54cd65f4c0dd530859;
      expv[24] = 275'h057bf562ece22ec0c2c2816bf10d1438c4e3ee5668d9d0c213f212efdffdde4a5869c;
      expv[25] = 275'h129a0404e05df69eff1c1df2d1937e9bb81e523b776c71a002a5c898410ddf5ebf231;
      expv[26] = 275'h5951cc263ad9584bd645d28adbd60494d27c085d5af5d7b53614d2e1fabf5ef4a5508;
      expv[27] = 275'h3858032bfae1513755a530b142d7947fcabc6499d7a8c8b77a2e33465159d8a2711bf;
      expv[28] = 275'h17e8e5be3285fb33d24c9e39b03cd422cbab7f042212ba2eb2b51ac7d0c6928da3408;
      expv[29] = 275'h099cf6272819b969f95d6dc374809c139a3a23923c8b14a1c5fbb619ac97a7b53ebf1;
      expv[30] = 275'h50ada1107f72203fd23591bd37c2090370718d40936dbbeacdf95047e4603eddf6138;
      expv[31] = 275'h2c9a0f505687bf9a8c1a4667453cd20ecaf147bfa5ca35d8f63cb1eba9a857a69f77a;
      expv[32] = 275'h35cf8ac1d9c06923663b246421f57679dba7c8a9f75fd611be36b947bd6869f87b177;
      expv[33] = 275'h4ecdec3d6a20ebae554ee8a5394bbd5bbb578c133c2abab971bce4744c6724ba4c7db;
      expv[34] = 275'h72fdf27ceb978d5969a606c19b6d35ac4a1f5eac4f45b4954cd0dc331224b24623ba3;
      expv[35] = 275'h67292f337c5239c44dab26ac3142bcf01813530efeb5cc5b9b17f1a31702a6ab14e40;
      expv[36] = 275'h48a38e09004417f9a12a80d64bdc2abfd1c4ba9c5edacdf14d42050e7269eba1559c8;
      expv[37] = 275'h0476245b67e16da382f5945967999070f3f8e4faec13d0a82e640de9bc273ce1bf26c;
      expv[38] = 275'h5a35431838c17a131fbc5707127f9abd9c70eba1f72043c4dce0318674fd46c5802a3;
      expv[39] = 275'h71d6070e829d63270f5ac4219162683080fc367f1698ed9148a9a7621d407959656db;
      expv[40] = 275'h0e1be874226fc0c3468f4965a13eb737b777f3e87d47d824079b461dadcbd7046e9fa;
      expv[41] = 275'h3b8ad8712b6576506ad3bbbc69bd21060261d9e757020a534c66cdd7a7e430d78fa8e;
      expv[42] = 275'h1aa02646048c1e52b7c912fca4a6c28ddb8788043b89aa7b230f0f97e72c5d33ff1c8;
      expv[43] = 275'h2f975101e4861e1895294a8abc8da86066f4eb9e69a0f8dfdce4b7369afa7cefaa2cd;
      expv[44] = 275'h51adfeab36605aa4e6f9ec8f4b6ae0630002445e0387ed37760e4bdeec69c3f1ecb8c;
      expv[45] = 275'h1d322309f90ed5c8f88f4ec6e50acc5047b0e29bf724f729f8db20221803460cab886;
      expv[46] = 275'h7650a4b8e828e14ba2d877cbbd2e6c3e4df34ba670305694446e1ee24a6a73e344427;
      expv[47] = 275'h2579d3ccd9c2559b0cd5272da4adfaab7c9d55e29145701d98bbb58f3fcd7d5b79d4f;
      expv[48] = 275'h1b4842e256f14e349d41b177108c5d61cee2a29b5f17503810c712e387cf505a0988e;
      expv[49] = 275'h3dc9ed37b8dc1d979de5b222652d2b0cff1e637b13f245ae9258c544ef56d06370919;
      expv[50] = 275'h637b7768488f45a49aba1516679144f12b2218c192240185a262dd40f6e29061cae28;
      expv[51] = 275'h19c5e05af222f8f4aa7a2e840540d75e00dea873fe3bf5176a1c60bc8f1320b7bcaa5;
      expv[52] = 275'h725ad9dca13ee4e690e05b423d7bc9a4891fb7a76f1dd3f226489dd4922f0915bdfb9;
      expv[53] = 275'h009ea69a6671fcf8a8824c29cb4e6c36230e2001165a37d068791c3c7f165797e4871;
      expv[54] = 275'h4593f4c25b512a9d80690f84222707745e9afb6980db6e63b213b571fb97fa716572c;
      expv[55] = 275'h01d91b19f5595fa29b6c613be3b729d257ac7c83d7e8bcc12290035ee454fff018c29;
      expv[56] = 275'h45b66f14b3b342e2d797b26d43c0e60ef185babb78d521b6fec45397dc7708c54de93;
      expv[57] = 275'h654177f9d96a980040603a3c2137d803a1de4e31fad643cc6d78b33717c03d821d633;
      expv[58] = 275'h12744720f3886a4f8597563425fd78d252175d1ddbf7c486f95a4b859cbdafc6df40d;
      expv[59] = 275'h37d4b10dc1c18ac2cf7bf6218d8abe5744061665a954e2999648d7f5e5f60a831a918;
      expv[60] = 275'h02d9c67c34238a5f5bd786b498753754d286ff54db97db1034d0a7f6cbfd61b94901c;
      expv[61] = 275'h6c5eeaf8ce8a8c132c15848ccb6bc3a4dc9665824cf2403312d90857ffe909024f35e;
      expv[62] = 275'h40430bbe54aa70eea22a0c7104801c82b21f85ad06c8affa6a1fa7c7fa75e857316a6;
      expv[63] = 275'h50536f9f891fd7854f36b77eb0123d37ea8ab78f804097da9c074686f47c0cedd42ee;
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
