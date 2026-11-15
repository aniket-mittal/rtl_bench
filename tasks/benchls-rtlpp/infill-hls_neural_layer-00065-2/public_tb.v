// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 324;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00065 dut (
    .ap_clk(clk),
    .ap_rst_n(in_vec[323:323]),
    .in0_V_TVALID(in_vec[322:322]),
    .in0_V_TDATA(in_vec[321:290]),
    .weights_V_TVALID(in_vec[289:289]),
    .weights_V_TDATA(in_vec[288:1]),
    .out_V_TREADY(in_vec[0:0]),
    .in0_V_TREADY(out_vec[18:18]),
    .weights_V_TREADY(out_vec[17:17]),
    .out_V_TVALID(out_vec[16:16]),
    .out_V_TDATA(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 324'h3e7de0b7c97c459ace3de6777c788eceabdad6f163a76daa0e025fcf924b278dd8b8c537306b2514b;
    stim[1] = 324'h26801350e8bdf3a7d304759f2484419a93bcbf394b652d97b5b495ed0bcbbe655259e44e02b7c739f;
    stim[2] = 324'hea8bfe9085f0660107d83cda56597451a5c5799f25759a8b75ce67fd29d3385275781a8c3d5e8d6e8;
    stim[3] = 324'ha4743836302094a440b1dc7a6b187cfb9db96bda793c5315a53b7eef142891886d07e1d98a7c4017a;
    stim[4] = 324'hf1c8e5fae36c8fcca78f201121fc377799f69c3fa272a5003d37569ad49db2e7f90113e27597d4d07;
    stim[5] = 324'hadf1b2a49c66d44b2c6ca0591ce0ca1050b7c3cc26097fb3c7e30d6ea3ad49e5bec00621323945cf4;
    stim[6] = 324'hf608ef8785efaea149824238cbcecb65bc9e0a4c79bfaa4e3904047877c0a08b42fbd6f493cbfa04b;
    stim[7] = 324'he97743c7a42459cd0568b5ace5439883f4e1cb04552ac723810b7acecb6280c3fa01089e2cfe43d94;
    stim[8] = 324'hc9e5a452a8555518337f78bf95d988ab0ef20083c6c1030960c9f11217e3eb400aeb9c6df0b1e3310;
    stim[9] = 324'ha4ff1c3b34e086c190c1052e7f5c15f01fae051480b84e09888c7ffad7fab8984139f556063f89468;
    stim[10] = 324'h9ea2c450b223a5eef51b8041e05cb10fb06ecf6a1865b3f9a1719b786eaf59814c78260de0530fbee;
    stim[11] = 324'hd7c9285a3368938f2cf2f31ddaf1362f0c6bdcbcb78337efe7466f31a77ce049acacb04fb52a6eaa2;
    stim[12] = 324'hb93407dc59520d59595292fd289d959a148e82b23552ed3380c726efeb628c4dfd31c85b60e36cbda;
    stim[13] = 324'hf702ff26edd1ccb6045aa79b7adcf907947eef42ed4f440707a8f2d5abc28b508ba73fefc914e86a9;
    stim[14] = 324'hf354f05d886dcfe91e2afbacbbd8db4a0c829dc6de15216958b31b2f76c88f595a66f3a620e552700;
    stim[15] = 324'hb3c67a7e518ab36af6831a50035df108310323ace0d3fa60bdd468f45024027754de14defb14f8835;
    stim[16] = 324'hbe1506242e0a9be5b25472ee320a25d96a449867cc10724e530fd037302d05b45dfe306ce0d07b64d;
    stim[17] = 324'ha1713ac45c743e6c1964cbb35e117907dbf4c323998cb6f278a6a81162ab4f911e33d55039385f544;
    stim[18] = 324'he826fc2d1c1148b6a4d8b526392b79b20122385b75a1178fd7e32e249af0471f5f2c74327177f82f3;
    stim[19] = 324'hfa065deebbc27c6ebe07e6094c593a395ea31f775022e73b702deb1812cd3626f3c79399fe0a3dcc1;
    stim[20] = 324'hdb6bb1cb5a746b75f5234e2de110244052b383f755b21684b5cdca0a5bd2fa2c701f5c1eb602782d4;
    stim[21] = 324'he309a16c6e7702b88a4dd1442b6a57665c48a0b78ca3545f95e89b5cc67212dd20086683a42151130;
    stim[22] = 324'hbc0dfa2fa316d2f3d777e7b2794348fd50145016df88d4a23971e1047d668ff1ea98a7b05de965e19;
    stim[23] = 324'h85d7fd1c0df4d0e919cfc7f834d90e6756ab2e58ac7c194056d23b121bc0bd80c845eac250b1dde20;
    stim[24] = 324'h9a63606c4d6b5ccb113e24547e32ae9dc5ce80e19c475ecea7c3eb719710fbe0289e4ea163187409d;
    stim[25] = 324'ha62852df04dae93e93704c263f964bb488eadd450f67d7fd18234cd070e8cac68af166f9ce99f48b1;
    stim[26] = 324'hb7c75c5d1822f8be892287365562e2dc48d4776214372cc0485c8b21f40e47fca4ae82bb6fa1447b2;
    stim[27] = 324'hfa17d8749a54b342d5fddbb8f335b5fcde11737a70730ade2f7ff4db39a0ef91a5c49773e1989b7df;
    stim[28] = 324'hbf35441f176068002236c7027f263ccd6b30df6377a4652a84ea2e4569d56ef8ad251d711d18e7db5;
    stim[29] = 324'hacd7d676905dab93bc5107fbc6b16bfc8c842996f3bcd8f5404ed82eaa43acce66944e7399a131bd1;
    stim[30] = 324'hfb4957fb1ccc2c5da52d7d8f11c8736e56de8f019e0ef546ba7463f1ee08264ebbb3476e5233a56ec;
    stim[31] = 324'hf99f8dc782eba4684d503b5abcdc492c2386e2fc74129e8874c139d326d61fe8dbfadaeeef65903eb;
    stim[32] = 324'hd80416a6538e299bf98f86137b6b9b2e26d859dfa2e5ef1091a8cc519a478fa823e9643a416b07d5a;
    stim[33] = 324'hfe345e7bfd068798d0497950a884dc1a57b34b42ca7efebb2006a0005a63c6a119d06a8ef0fb27efc;
    stim[34] = 324'hbebec144ce8f4ae3dd50a9a4ea1b66c137eb337da2fddc0d32ea8d9408056986babbb00f71ac3244a;
    stim[35] = 324'hb4e4c162c674f1507b6e6f381590aedf76aea6d0fb411cee2a1a48925823edcb00101f29c00b79e3b;
    stim[36] = 324'hfef415cfd13135597fbb44146553d8ffd5197718a709d0ea7a28ff5bd7a85a9213402216eb26b9d7a;
    stim[37] = 324'hfcdf9752205afd407673a48f4a2e4f8df41f7397f2154c165dc0880d8c406c16a10a5c2f32dc9b708;
    stim[38] = 324'ha806321a4eed18fb2b2ce2ab5c240480c1a9852d882d49ce257598bfa03eeff5211c850f0e9e0878f;
    stim[39] = 324'hade528831d76e26e95a1de4e6589f43679929111ec8109442f62d224e331295bff0db0ff397a3b5d9;
    stim[40] = 324'hd54fd0a471fed7e2846bc9f54a62f15d9b059128fa9fa152f11961ba0a4dc0aa214201f608d17765f;
    stim[41] = 324'ha8f119254c3520faa37df833b9894256a1d02b4bd2decd330ab58d95f28113065f44e128c879a366b;
    stim[42] = 324'hacf267e0d1b91395e59e41d41a2ebe4448c9ad34fb4706b4c2e3d468d503d80e0f64859a9c28dd685;
    stim[43] = 324'he084ef16119c8ade6a7d4ef014149ac23f6aafdb9861b8be189ea96e6ffaa1becf5b2c565a7aa2f9a;
    stim[44] = 324'h8614d9eca8dd6f0bc26167e11841f360c3a8022a4d86dfa550746b2cbde85ba403039966e168bb7db;
    stim[45] = 324'ha4e8488b2530f3aaa3417f25dcf0302a13f39d6e7092a41a3d0d1313b6eb0a14e3a32880fbdf3b615;
    stim[46] = 324'hd1e382956711af7fcb8bfc548393fa0600afbd734b21beaa6b39e952af3a989231d6a7675b24bf587;
    stim[47] = 324'hfeea1dd32db6ec725adc4c0ef848cb2383572bd870dc42b8b04071461d55c77b5a29cb3d47e4662a9;
    stim[48] = 324'hd804672877b1a8bd546dab5932a02de21506026c627f112288eb79167ce792626402399d1f96f38bd;
    stim[49] = 324'hdc73b08507ed2f833238675b2d6f2df259749b0b3833f21c48864dcc2a1ffbcfae7a919028c1928eb;
    stim[50] = 324'hcab838ddc7c768362bff5791d2975f4284994dae7c2583ee3de3bbfb16da86f16ed8478ea9c128d4a;
    stim[51] = 324'he86f9c3a231b9030c7e6817d3f9629339250071685d7379c941a569fd96c9d56a9c95fcd9b2cb25c7;
    stim[52] = 324'hf6b4b06f8b19ecb170465c4cbcc705c0c040418de013335081d4ae7b57911242458432209f82c8d1c;
    stim[53] = 324'h93522abeb8bf4c559e4d019824636e91e5679a490c0d73066c2e3ded1d7659b12914f49e69b690c1d;
    stim[54] = 324'hbf73df2d3180d122c29009736a81865cac32340bde6bb58c5ed376e368a99c7f13eec3d2e65ef01e4;
    stim[55] = 324'hc451a264ebad5a1acc41abe57886654f90b03dca752b31c075c6f1834ce1b97540f9d2fc8dd163505;
    stim[56] = 324'hc4d5b073782c422de71af1875c22b697f2b859c0f3777efd944266cb0a57991f5d3f2cc7310880f49;
    stim[57] = 324'hb540cd6d8abfe3f8633483e2ea359a0100a7474a3abc5d5db94e3df59ee6f03e4a3be194d811d3a23;
    stim[58] = 324'hc6af901c5ca3885be2542267997ab75ed005e501598aba06a1bd7bcfabf591aeb46e096b7f59c5f86;
    stim[59] = 324'hd9072c8fb29059f4fedfc8ad9776a0007bbd8f95ca1934cdf199d4753a30617e405890c8d1e1c0218;
    stim[60] = 324'he528efab55607660705c634a12d7ddf0a5d9eeb1723b9a036f549a652695f383f4f1febb69ba7cbe0;
    stim[61] = 324'hed2fffa0419f55caffe41223c937cb72ac597f59667abb7eedc46f35424fb42c2b88775b3e215212c;
    stim[62] = 324'hac0b71b57e311e89609ff26fc45f52dacfd4e50002f375e1b81f20d65725cc457d83644f83b5e1632;
    stim[63] = 324'h81d236175dab39dd3c22c6d2c586ec0fdcd45abfdbf2f4fe153f63f756a79d2539a7bcaf4ecde5f55;
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
      expv[0] = 19'h00000;
      expv[1] = 19'h00000;
      expv[2] = 19'h00000;
      expv[3] = 19'h60000;
      expv[4] = 19'h60000;
      expv[5] = 19'h70000;
      expv[6] = 19'h70000;
      expv[7] = 19'h7287f;
      expv[8] = 19'h7287f;
      expv[9] = 19'h7287f;
      expv[10] = 19'h7287f;
      expv[11] = 19'h7287f;
      expv[12] = 19'h7287f;
      expv[13] = 19'h7287f;
      expv[14] = 19'h78358;
      expv[15] = 19'h78358;
      expv[16] = 19'h7688d;
      expv[17] = 19'h746da;
      expv[18] = 19'h746da;
      expv[19] = 19'h7a984;
      expv[20] = 19'h7a984;
      expv[21] = 19'h7a984;
      expv[22] = 19'h7a984;
      expv[23] = 19'h70fae;
      expv[24] = 19'h70fae;
      expv[25] = 19'h7c34c;
      expv[26] = 19'h7c34c;
      expv[27] = 19'h7c34c;
      expv[28] = 19'h7c34c;
      expv[29] = 19'h7c34c;
      expv[30] = 19'h723d8;
      expv[31] = 19'h723d8;
      expv[32] = 19'h723d8;
      expv[33] = 19'h723d8;
      expv[34] = 19'h723d8;
      expv[35] = 19'h723d8;
      expv[36] = 19'h79834;
      expv[37] = 19'h79834;
      expv[38] = 19'h79834;
      expv[39] = 19'h7a7f4;
      expv[40] = 19'h79760;
      expv[41] = 19'h79760;
      expv[42] = 19'h79760;
      expv[43] = 19'h7bdcc;
      expv[44] = 19'h7bdcc;
      expv[45] = 19'h7bdcc;
      expv[46] = 19'h7fc20;
      expv[47] = 19'h7a578;
      expv[48] = 19'h7a370;
      expv[49] = 19'h71e52;
      expv[50] = 19'h7acf8;
      expv[51] = 19'h7acf8;
      expv[52] = 19'h7b0c8;
      expv[53] = 19'h7b0c8;
      expv[54] = 19'h7e110;
      expv[55] = 19'h7e110;
      expv[56] = 19'h70c64;
      expv[57] = 19'h7259c;
      expv[58] = 19'h78cf6;
      expv[59] = 19'h78cf6;
      expv[60] = 19'h78cf6;
      expv[61] = 19'h78cf6;
      expv[62] = 19'h78cf6;
      expv[63] = 19'h78cf6;
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
