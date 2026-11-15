// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 384;
  localparam OW = 168;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_087576 dut (
    .clk(clk),
    .ra(in_vec[383:378]),
    .re(in_vec[377:377]),
    .ore(in_vec[376:376]),
    .wa(in_vec[375:370]),
    .we(in_vec[369:369]),
    .di(in_vec[368:201]),
    .byp_sel(in_vec[200:200]),
    .dbyp(in_vec[199:32]),
    .pwrbus_ram_pd(in_vec[31:0]),
    .dout(out_vec[167:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 384'hc0cb88644a1b5e64ad87afc05f10a734db781c6f56863468a62aec758b02ff221f47358748a9b0d6c3efa69a4fa70620;
    stim[1] = 384'h0acf2b5097296d8ce391295ee087ba6cdb732aa5a6a8c315fffd34f5cdd1d14c53aa6a4931e54d011d12d4f69ed3e2a2;
    stim[2] = 384'h851af441745bcf4d0d00d1b9e640899b59732a9efbb2813d9e47acd1b5e61e3426ff98581ef345ea7f73f3359d507dc5;
    stim[3] = 384'h6b187c885e02851d619781f91547b048ff583861869d3c13fff50eec3ef57a0308e09e60ab0d84640301b1aab30b9f05;
    stim[4] = 384'h8bd356478cc3dedbfe44646b458300d1ed20d96b12776a09b9b0397f79f8353439a1fd06557753a0f4c83e59fd59c1bf;
    stim[5] = 384'h4dfb0b6c861c1bb2b5f03e576bda553fa3ba63ba4ffd92b78772ac96a71b7af70009b7d7bb634356a6dcfe5602d4057c;
    stim[6] = 384'h54b8d9f53155431417aaeac48eaffe2a587114a356029c6638bad6984e169b630d04cdea1562b21d8918e016beb73f27;
    stim[7] = 384'h9222b732ce33e28680e5b2e4ebf057367e09ae2068f9314519726f5a94337a8afd1f2b4c0a3a74a050c234df46dc7d00;
    stim[8] = 384'h016960db0cd7aaeee8ee9415690ba440028f81519f78e6878a2b28b764357b2fdda2ea8e68caca7f074621ee547377ce;
    stim[9] = 384'h04b543a0ff5f44ce3cb1c2cf769dc00259e4dce2ab82df063698c1e6c1044733951732d8a9cecb4867e4ba838c9660a6;
    stim[10] = 384'h0f425bb5055923b9c9cfbc2c7cfd5c083892c86d69062cb073b21b8ac3be87a8d20e53b839f6b60421e8714a4c9ba20b;
    stim[11] = 384'h7b85c6585d0e46969fb0cfd993ca9d0f74582f9d5ffd9df6791c2c79a5f73d1b093c5d5db8d905ec5a3093048b2918aa;
    stim[12] = 384'h002c6f82e4bea2642aef6676aa84edb0522838b4dc7f0a557552359ba3fe6710a18f181f50ee1d2aad5211736a23809f;
    stim[13] = 384'h048a1418716bdd584ba5852b13ecf5ad8c2bebf25f38bb18ec2a8c08c12e3d8be2c01601bb85166570d8d5da1fae8511;
    stim[14] = 384'ha6f93c7dfdf5cc65f9c499856ae9bc3a43b15ca10e38cff0cd0ab991a75dd8bf538f99178b0460a6633b42c3a7f30f8c;
    stim[15] = 384'h3ddc7d318eb78f591d31b7f461d3dc33287b6b952ad662830235af033e137dea3fde38456f7cec6ea33222b4201ba10e;
    stim[16] = 384'h8d4907a696210997620363897185c4928ac9a51b9e8c720ba51155a1975c06133877182346b67b7d7487ec051cddc347;
    stim[17] = 384'h881a4fcc4f35b54c48e50d8a6d8cd26d765c8ff8350ee3555297611b984665a07c3e8c076d2ea11c4035c39f0094e4ac;
    stim[18] = 384'he9d956f2edeb49772fca0feb30b9c7ae7df68ae4baa0ad34018c7ddef78e61016bf7539e90eb89fd6fbd9f4b286d526b;
    stim[19] = 384'h23fa3553e0a2031699b79e579fa135f18639201ec93eaa864663561d6ad246a9d9dfb2acfc7d8905dfffe69d5066e349;
    stim[20] = 384'h95a8f8114cfc11a87ac734ba95ae65f25c8ac542c7074876c46971533249cca08d6876df86bfb34bca04898a7afd79cd;
    stim[21] = 384'h0908f10f2e2d8349c9171680c8c3c1a9bce8517bdc24472c30dd7e51d326151ad02c844f07d0a9a40184ac23ed17acc3;
    stim[22] = 384'h96e425da9286f2e213c6c369346f0e95c89e5110cf56c406ba7b8e286563c98b6bd4317b721c176426dbfd55c71af5c0;
    stim[23] = 384'h03f34003c15a560a1029d095b142a2ea063d46a9e54385217d269e74f03524acf31d4b873d5e3f3477390735397d7f40;
    stim[24] = 384'h15a999e44e2455d14b878acec10c4b415c95a089262b57c95fa546bdcc2425b084b45c02b5c62c04b537fafbf77fe019;
    stim[25] = 384'hb101295366aafbcb5c50aa701311a7e08c6e94daed3d988a7e84af0cc1428474c8495fb578a83111d4b99899c8e70e09;
    stim[26] = 384'h5d807cb27f8799c6384315a4131bf3a8465c95d15831a1609c5a6cce85dfa6b46d11acca9b9c34d46fc4f62de2087c6f;
    stim[27] = 384'hc166d21323c1d8b37992854a9b58818d096f9ce6037efb9b6fbe917a2ff2a3d81fef82862dbae1721a354de15ca86609;
    stim[28] = 384'h16a7c622920e825bcf12994cbe95b937412842b02dd715c7f7bba7214b4cde975dd6eb999d6e87c0351a2425eaa0b596;
    stim[29] = 384'h0b73b9577caa139118d73d779a3b818020074843bfc582d01a07b8407756d6639cc40387177932a753b1cb9f7783c946;
    stim[30] = 384'hf6c40e5bad0bd2290c8c0edf8fcab4234f9bd9e203b6db8f388c2e3567888c27ea643fd905cf8751d2a1bd6814ce9272;
    stim[31] = 384'h8f99a084b354e8fd11a6a9f1a04af64dcc088555b00a003c808974beb4777bab5066e2ddcd38a4d44dc6bcaad61d0eb4;
    stim[32] = 384'hd85595501014e0c7a1b9272a054ecd8f721834b056d66599b4d3f8052c9ed00e719aac7bcfcd8133de84859761b44d94;
    stim[33] = 384'hf8b9846b729eb8fbb1b6453515de88784d0c4b551b455f09c6fe8434d9d433e54e55e8e2a844cbec7b1089ab7dce4981;
    stim[34] = 384'h2d7831b8fadcf7f7272dbfb4693c74d548df4ed78ac8f77a71068a40e0f54016b2608e091a0592f1bea0e14e965ce822;
    stim[35] = 384'hd24323bf03f4eb5186d2afeaeb425be08c5f78a5fcabf0665f3c9ffff63c06c9eba30b41430d1d590ed7a676a70cff23;
    stim[36] = 384'ha71287feca23302d9f564a4bc292ebb54d10f7697c45f21143256c81a5758791256897c069306a0a7728e07725362d54;
    stim[37] = 384'hbe4717309d9af3d51e798e66f2e58fb4692fb89ce4d391304ab5281f626c95b029f4596dfb58dde93ebb9a95e28460d8;
    stim[38] = 384'h41f99f42d5219717ac231f25370acad038fd71bc605a13d79332b1ba939e4626160a05aca2fe902760c71c272fa183dd;
    stim[39] = 384'h18fd952a63b7ba224327d1974f969fff9ad5a7824c11598d1bc2637ecc4a2da8dccee29b13bbb6d63420a6cfe4dacc1c;
    stim[40] = 384'hbd1a83fb61a5b908bdfdf5bdceb3c0af96ddda006d20b37c44fc674eb7f2d780f255cb4a1e8fb84ef80ceb9bfe2c270a;
    stim[41] = 384'he985514b597e80e980be130fa52f23f50425c28fd3c49274a550c248565abbf48b8b6cbd6e9f393cd0f3ab1b11c959a7;
    stim[42] = 384'he744cb725c570821aea5bb668fd9b640614ab8383e9c38a8c5678f31dd3619568033d4c8a975ca92bf2e0a80438c17ff;
    stim[43] = 384'hbd3ee9c2e17f147f678b2c85fc768cb30957a01032dd4b88498100ccee274fde431422ec5cf2ec1b9e28ea233bb8e082;
    stim[44] = 384'hb029e499d6f3041d3fa8b1ba166caf72fc6eded537781f1bebdf30cbe99139d4549f9e775f09270e3f0ea99cef9dcc32;
    stim[45] = 384'h7a01fbc995f04700b9077f5186739c6dce059e15061006410580014af9779ced693af715ed4611d3d206d0db188af0ae;
    stim[46] = 384'h9e7f9636ebaec9451b72f0ebd5b8f7b8aca21e007f86713cfddca35f90d1944a4f61c34747fcec9444f89e4f68e226c6;
    stim[47] = 384'hee08906325d352fd3ebce9886f7fc9288159941b2a3c483639d8a03fd9872d51cbd653c2f6a607fe46d198ceba89102c;
    stim[48] = 384'h7eabc56fe8466639dbca1e1fb67b94a53b5577356b1c9b5a9cbd10908555d959a145c750b0b0160b9579e35f7fe5d814;
    stim[49] = 384'h36ebdddde687e93f68fa2a8230fbf3f462e0f43b97e982db812edeed7f78cdea1da1a13274d79e51527c85db79f5d17b;
    stim[50] = 384'h0fee51f70bd7563d47ce73aab933cd89126d0f04d8680833d7f849d20646be3d5fc40734ce231b325bcfac7d96c5a4b3;
    stim[51] = 384'he88204cbd2c8df1ac3c7a5e10c7e1bc29a36d26dd0e24d56301e19fc79b9168d90628a9a2dc80d7a84dd35d8d08fb378;
    stim[52] = 384'h1f540cbf62b25886513004c34c02a429bf4f9ebf47f280073c89ac24b43ee03704e201a5fba1db59b398a4c02c0dc6c0;
    stim[53] = 384'h8c596d1c8dfddcdfb9613214ee6ad7e5bbb149cca6070b0dbcabb0ff8527c46af2efa8a9b7ea4f1a43a3a2173b082668;
    stim[54] = 384'hb699596b78484b86334dc2eb77037e36d19eb69ce4d8bda58b9e5f45ca94af48e6fb68af667f867ec8d5a7008ac3fda3;
    stim[55] = 384'hc292a2166c86693cb52f713fa704bf0d906c873ffbb7a51e0e9a6670cfe94a12df5b2002165bf795cb1a343acf78bf05;
    stim[56] = 384'hc3ad467f75a8f22b0c565be0e953da115ad18b68cf8613d5d4e04dfce33cb8221b6ad825d8bd6f0dbfb0e7b7d760f4f3;
    stim[57] = 384'h6fea51b5f6e89346177583fdf17d0de079f3f8d702be9c1fc7b493e999a3a5164094f8bf851fd5cdbf89f8ca7da53ab9;
    stim[58] = 384'h86617233a9750de1e347ae8e6a12bad6707d036a132120293bd251768586d584ee2419ef4eef48a360bfb452f642b811;
    stim[59] = 384'h5495ec740c6fec1fc06124fc7a4e3374615b47321e0b31b014269814127ffa5965b2396af5c3aaf8feba815cba2d11ad;
    stim[60] = 384'hc54f10ad8d8e8c7ec451d3eb2c25dabf7054c5439524c6adf35d2c261f2a4df86bde67e328f1cc98ad778439617a7665;
    stim[61] = 384'h58802725043c402b5822a540b01e54d8b54b678583361fd37370d8ef4901f68014d00856228afe19695e90ddd317b04b;
    stim[62] = 384'h7c5ec82c8a2d495266d8ff668cac36dbb0e8d1e76afa765d26a0b2d4a963f29dc3d999c0514d8b72eb35081e1d11f548;
    stim[63] = 384'h9e186f57b617136b57c93e19bdf29602cdd6799d5d4f2c3abaad528b8dee284c4a6e21983d7c75e2bccb3cb13c08a1a7;
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
      expv[0] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 168'h3d9e47acd1b5e61e3426ff98581ef345ea7f73f335;
      expv[4] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 168'hf6791c2c79a5f73d1b093c5d5db8d905ec5a309304;
      expv[13] = 168'hf6791c2c79a5f73d1b093c5d5db8d905ec5a309304;
      expv[14] = 168'hf6791c2c79a5f73d1b093c5d5db8d905ec5a309304;
      expv[15] = 168'hf6791c2c79a5f73d1b093c5d5db8d905ec5a309304;
      expv[16] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 168'h34018c7ddef78e61016bf7539e90eb89fd6fbd9f4b;
      expv[20] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 168'h5b996719f1434072d97275f82b9b3f04d710347c98;
      expv[22] = 168'h2c30dd7e51d326151ad02c844f07d0a9a40184ac23;
      expv[23] = 168'h2c30dd7e51d326151ad02c844f07d0a9a40184ac23;
      expv[24] = 168'h217d269e74f03524acf31d4b873d5e3f3477390735;
      expv[25] = 168'hc95fa546bdcc2425b084b45c02b5c62c04b537fafb;
      expv[26] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 168'h609c5a6cce85dfa6b46d11acca9b9c34d46fc4f62d;
      expv[28] = 168'h9b6fbe917a2ff2a3d81fef82862dbae1721a354de1;
      expv[29] = 168'h9b6fbe917a2ff2a3d81fef82862dbae1721a354de1;
      expv[30] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 168'h7a71068a40e0f54016b2608e091a0592f1bea0e14e;
      expv[36] = 168'h7a71068a40e0f54016b2608e091a0592f1bea0e14e;
      expv[37] = 168'hab23c661ef6dff223235a2c18068f6906cb5893bb5;
      expv[38] = 168'hab23c661ef6dff223235a2c18068f6906cb5893bb5;
      expv[39] = 168'hd79332b1ba939e4626160a05aca2fe902760c71c27;
      expv[40] = 168'hd79332b1ba939e4626160a05aca2fe902760c71c27;
      expv[41] = 168'h7c44fc674eb7f2d780f255cb4a1e8fb84ef80ceb9b;
      expv[42] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 168'h88498100ccee274fde431422ec5cf2ec1b9e28ea23;
      expv[45] = 168'h88498100ccee274fde431422ec5cf2ec1b9e28ea23;
      expv[46] = 168'h88498100ccee274fde431422ec5cf2ec1b9e28ea23;
      expv[47] = 168'h88498100ccee274fde431422ec5cf2ec1b9e28ea23;
      expv[48] = 168'h88498100ccee274fde431422ec5cf2ec1b9e28ea23;
      expv[49] = 168'h88498100ccee274fde431422ec5cf2ec1b9e28ea23;
      expv[50] = 168'h88498100ccee274fde431422ec5cf2ec1b9e28ea23;
      expv[51] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[54] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[55] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 168'hd5d4e04dfce33cb8221b6ad825d8bd6f0dbfb0e7b7;
      expv[58] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[59] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[62] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[63] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
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
