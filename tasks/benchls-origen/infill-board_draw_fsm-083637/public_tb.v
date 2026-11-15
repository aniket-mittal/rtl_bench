// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 429;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_083637 dut (
    .clk(clk),
    .board(in_vec[428:44]),
    .long_counter(in_vec[43:12]),
    .counter(in_vec[11:6]),
    .x_y_pos(in_vec[5:0]),
    .write(out_vec[7:7]),
    .update_x_y(out_vec[6:6]),
    .draw_value(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 429'h1871f8bcffa458c10613d59bb075b643abd10cdd4233fb2cd90bb5e1e977aeb64c4943b0176517c82a4ee1278cfd4d0d9ce373543096;
    stim[1] = 429'h1baefdbd72c443331665ad7a0bdd4dcd5c2649772ddfb3113951c662929e9182da35a288c75ea6c368ac56e63150aefe499ca9f21b6b;
    stim[2] = 429'h047411cfe9ab37dba88e4737d3a6d02e716012f74555b0b502561a6463ef8d99ba35b10a2f6eeb282df44b794948fb48980bad2d07f2;
    stim[3] = 429'h1b7e92bb5aae95d6b247a320159031e986d892bbda0db68a7b286e5ad83a94f9f8b0b4c7e9437033bd1984719e2909035e6055050c09;
    stim[4] = 429'h1cc97cc425732a517e02c4af5c97b3add73d87162c153626b19f769a4f8ceedb57a23921fe93f338e3402c8e691c3772b6bcaf291928;
    stim[5] = 429'h0f8200c84bb32dc33c3cb43bad65483fa537efa0d0b1ea51df188754213146ac1307276d81597722347288a14fae6ee495ee963a8819;
    stim[6] = 429'h16bef6c141398a46b1063fb82936daf1082f9276267e654d1afe6a0ffafeaac57464a656c98b6956fda8f94db65d77370e9084bba56f;
    stim[7] = 429'h0ac044a65df43d915b45bb42ec89adce513700d4a222a782ec54e388ce1c5672ac0428f1bddfca8d922299f320961fae3c21bfed2ec9;
    stim[8] = 429'h101c19943a16efb846c593634c353f7cf1dbebc79542edee4214fe672b2f44a25b45312af98f4b7c2bb6d24f834ccf513f9f16b5d721;
    stim[9] = 429'h0f667c5aa6cebc8e116226182e18fcbb9764e67cce35909d3c51f8267d71f99e152301e09ee72b46384215146d47b19ee8fea1a6f406;
    stim[10] = 429'h16a6f25972de56b7eb7f7c52166a22c15f8b6d55b82d451f4239bbdc1182d0f4fb06e061ea77c99ff19a7856f34e2aaca922cf75f89a;
    stim[11] = 429'h12e971b6c92c9a16ea330d916fcbd1700005da9937b4bda85db8ddca6008bfdfcd9a35616c27186abddd864fcc362bbeec95893175e4;
    stim[12] = 429'h00cc9be76bcf8174234e37764a651138539ab5f2cf26a657c313e2626e198a6ade92c12532832848a1609da2167e72a5c98b525c1409;
    stim[13] = 429'h0c80fc69fff58d26606ac9280775a822b6aeab26980833bafa1add431fa7ec84fdda5bb934f9de890a2253c2308acc177345eac5855f;
    stim[14] = 429'h0cd2802be951abcb86f2778451750d1e87a252bb7f1275679bf9db6db5ae98c0522484b9076dc727c644b66dc141ed6bb78b4f550ff0;
    stim[15] = 429'h09acf802748b97a47e580771021ec18bfe65293f352b170abb3220d3eb6dd3123b198b9eb0dfd6b349dd8c02e46522c403eaf0fd9750;
    stim[16] = 429'h100e4eec7e5df11aaa02701b09555acf4ead6c560b1459bbf13614b1efbc33a892c1e38dfb0274bc89f617210d91f55e84b33ac4a941;
    stim[17] = 429'h17d1aba0b5d6a8acdf7ac64741d8517180366c9cbf630f926231da0da8610450e3d064bb6eddb03e795cbe472aa7bad9e063ec730268;
    stim[18] = 429'h04942b2bf7b6c1ed9f103779393d10fb6bd6f021e39fcdfa53b47b70a523931a5c79ef92c7c65f50519528c4c9d8525b83c22ededcef;
    stim[19] = 429'h029d74ecd788547b0d6a36c4fc550bec6d2fe96375a4d9bbcf5a0883d7a857f35a46e124abce1464a63db9747f180bb55ae0c87705b7;
    stim[20] = 429'h0e7df4c694cf09a762ae668395c35055c630365b602d7380fbcb41ff702d2a6045816246004a958be28620dc976cdba48a5b56fa0c27;
    stim[21] = 429'h1ebdc30a21d77d4240b2402d8b9c94b984c1c404900d19d113fc61799907d38c5da46e23100859f842acaa90fcddccbee4b32dd81dda;
    stim[22] = 429'h1d9e3032640ade81adc1faf03dce70191e8f14cab2437a7bc8a0efde9f1814df1a333ddafb077c06898f0e48a4fb1bd6c2a1cda890a9;
    stim[23] = 429'h1c5b1df8507cd96631d0da6d4559dc2603ddee9bcf770eb76f69d9e1d368f7fe5279f2a3adadeb5795d4a5b92b73bb50dc0f34fbbdf0;
    stim[24] = 429'h0f54d3ac5a18777db5916ef6d4c57eb38fd370ebe9c9a279fe6facdb205185c45b5c2b121e5c0332359f6ce7e8a34ed9af4fb3be2d37;
    stim[25] = 429'h16512260cfe6ff9ecfa0afd145ff9d0316b1be19ce73d732f2999fc95beecbe3d4f20262d37b350912f3da06f762b77fbb73b6b9d7af;
    stim[26] = 429'h1efcfed516d6eeb359a30ca12732922ca8e972422acabeb0980432a42043225bd2e089f07e18cefa1c743ca845cc8e2baffe00c01094;
    stim[27] = 429'h07ee2b840cac49cfe735b6a54ab1106a5ab3be0d3200cfa274435d81728bfcd708c5cdd6f48c251c40230067c7b345e7763f2575bd06;
    stim[28] = 429'h1e5453abc0bf30b82545c818586fb75b13e48d2c3babadea1d9290f6a3d58bd751fd54c9a85dde5c0549cb68a8a715ee55fa7ae25a22;
    stim[29] = 429'h019e66b261fc441fd433c2d6e2cf2b01029a872299a043997e1a919d531e472f4881ccd695ae7806996c7b3090707db744b4ce683396;
    stim[30] = 429'h0c52056814b9b62dd9d54c94fbffdb1904927cd66c8ad176261fff5851f31994cddbd7916055a231403dbd116e75102d9c61ff858d31;
    stim[31] = 429'h1a88ca84b2eb5b28a1d738a648ba310ece2cc65363971d4cd8aaddfd26d7425b53737d4efcba94d6529865cbed4054f704460f29cff8;
    stim[32] = 429'h16b309c207e5f53f048b723d12892822e915bb75e025cbd8acf72d76bee9e028b91e3974cf174d91bca265834d04cb62293480b23915;
    stim[33] = 429'h1d171da897c148c0c085431ac9ad33ed58cf9e1e0906a2fa550c0556802886907af9ab78fb1504cec346fce7b1a95e70ae0967408228;
    stim[34] = 429'h0648f4d6efee2cb23b7acee52af5be0b697fa30c52e91dd5148c8b36565284898870a2db106b3ec6d75674d2bca1ea2a871a3fc986e2;
    stim[35] = 429'h1b35887f405c74dc49621fe71869aea25f7a60131d3cde6208716b55aebeb48179df15e9c1e18001ba8dfc56ab9f4a916c5406cd1dad;
    stim[36] = 429'h00bb2d473dc23d5ea31071eb5d31d79bac89d5f39076b9b77859f278a8d111460b777a7640f6bc3b06c1abed4b6074803df7a12992b4;
    stim[37] = 429'h1e036f3f4343c45393bc51b02c46f1c257ac6b7d1a982456f79e80ae0c42f1e455222cb0764f57008aa0c11887d0ef37aa6ad1e22679;
    stim[38] = 429'h1a27f661e08003a8d46ec7971abb5291fa1e82f92154ae261fe35d863093cc34fdbd5bd88cffb8d612d2f909e83c5abbe09a56f3866e;
    stim[39] = 429'h0fcce1d999da9dc7daf806d490cbdfd6f8ce07948a13b9daa905171a10469ceeb51cfe09683118e593afc32feacc995c651d42c90d28;
    stim[40] = 429'h1204aec7c0bce738be28bec91f4995def23d83d97d7e57f0012e0690c719c9f04d6617cfb0a6493c89b1795de16a80459bbdbc5ce3ad;
    stim[41] = 429'h108bcac713ed80abc261dc6e115c16081ae8677c09263729ab7a4e09e6aef8e44a6612b70d4a995d5386a7a04897360c7f5689ad24c3;
    stim[42] = 429'h0816dd564beed400d6365d2374f5c87f18b6f2094ba7ce85ffb938b1242fb43dc78a2a8ab17272f3112f137d044eccfaa01dd5bdfa0f;
    stim[43] = 429'h1a2070db5ff00c1f0e4596aadaf4ddbdad6bbcfa2f648547f3d8b1d6de9824f744ea9c15c1faa82ae919cefbf51f86388bbc254ddc4a;
    stim[44] = 429'h0ac6333395099260612e9454c9f15f6d2e062c46fda5bee4f4a96c2c3b492451dc857ea53ecea48da83eabba85687d99eaf7b3d43630;
    stim[45] = 429'h12911dee37b5d34ac6fbc907800cdb34e8f80882ddf7e18131bc017ebce9661791ceea295b5ff09ad7a66ebc1e9fc3e9c2344bbfdcf8;
    stim[46] = 429'h1c85f2b163040f6aa386e552461f97c553396872145bb1658905f054ac1660bcbb377a0c800cff8f4096523f4def7a6ac50bae31ba3e;
    stim[47] = 429'h1da32cced41f0a7b2049fe3fedba6a9a0c4cddfdb31355d664c0b9ac496f5ecc419c3f09320b17096cd6b2bdea43b7e67708e0984f40;
    stim[48] = 429'h035922cf15cb007875da7a9f89a01b55209b40b9bc57de08a0b0e16c0f840fff257e58f0c655658f97f97209271dff9fd2cd53f14cda;
    stim[49] = 429'h087c1888dff12dd9a4c76500db5fdadc7e7171cb62fca8f60b8726161297c8318a176afdd770f7c5659a5af9f189966d5e5e95801016;
    stim[50] = 429'h0f412193cc17ec565e31215878fd4fc3c7a1c9474a3d5c2c73e23180953f7754d148debcec940073962542b729acc327724c24303251;
    stim[51] = 429'h0c53d71b70d8925a023f166cd670ea577f4867e6e722e3a275cb4fe2277090bbd2f1f6d125778e3c8ab7b08b109b3557311466961c1e;
    stim[52] = 429'h09cd81c49b1f52192af77037fa18c3b915a1ec539af6ee00f03cea7225010b0356d76df7a12e30597354839771d584743259535c211c;
    stim[53] = 429'h0a2665f43e4d6d3f6d369b041b5f47d477663603ec698125c9d83e5acfa8a563485fa5f15b4cd8b2969e0c8f071f46a02244cf67e2b1;
    stim[54] = 429'h1e74fcb102722cae3e7b3ff6147a9922fe85b80178c24d3d005e2d6a38ce42810716663a98d85b3e42c3bba51049bcb267fd0dbd4567;
    stim[55] = 429'h03f2e4aa20124c39ea123ff64e48ef981024f18fce79d11a5ac5a299e362e7abf6906e6a6ed3c1bf2072c5e48cb43030cc2581b74ea4;
    stim[56] = 429'h04be32db1a8ccded3770ed00819ad0fdbfcba0d791fef917195e8901e0a40c0b2f01b251b99907af3b13671cde3aaeaab953c9b9c2cb;
    stim[57] = 429'h139595e354b447423e62985af146333775528a57f1c12e7597910876dadf16889ab2b7220a8e6530b161a37d69bda3c52f3b11ba700a;
    stim[58] = 429'h1242357c8e02d4a207cb0fa3436abfdb68bfbbcc7efb892ec8e202a7663987917ba77e22170ff87b7bc2ffcea6da9eadf1aa01b582a8;
    stim[59] = 429'h0a64420dac28a4420c1640bb0171b059d570f2f3ea427bad541f5513b8edf2f4b200173bb10cbf3d2805d6cc76f798fa29f7d4aa05b3;
    stim[60] = 429'h018af8b04e0f856d9e1acaaa1a84efa4f2ce2fadf2d28ff788b03a89c0b043758e328c67f1c08bc0804eb24fa63336237c5ba74901fd;
    stim[61] = 429'h014f3a697a766dd5749459322dc30a681f43e4722cf59aef7d0b342c7c909c8baf0cf97d2e23f4200c6925f71888799cfefc214195da;
    stim[62] = 429'h1f84b1aee57e92671e58f477ef8cdbf3b197098b4e54515480bae0092401a4765ff4972fbe74d452372572e72bb1ef84958fdf17c4ea;
    stim[63] = 429'h1ca578cabfcc4fc095ce750f693dc8a57b863a740680159b9aaee4732ddf620c4eb571467d5f04f571d48d02d3853a3bd954be9cd1c9;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h98;
      expv[3] = 8'h98;
      expv[4] = 8'h98;
      expv[5] = 8'h98;
      expv[6] = 8'h98;
      expv[7] = 8'h98;
      expv[8] = 8'h98;
      expv[9] = 8'h98;
      expv[10] = 8'h98;
      expv[11] = 8'h98;
      expv[12] = 8'h98;
      expv[13] = 8'h98;
      expv[14] = 8'h98;
      expv[15] = 8'h98;
      expv[16] = 8'h98;
      expv[17] = 8'h98;
      expv[18] = 8'h98;
      expv[19] = 8'h98;
      expv[20] = 8'h98;
      expv[21] = 8'h98;
      expv[22] = 8'h98;
      expv[23] = 8'h98;
      expv[24] = 8'h98;
      expv[25] = 8'h98;
      expv[26] = 8'h98;
      expv[27] = 8'h98;
      expv[28] = 8'h98;
      expv[29] = 8'h98;
      expv[30] = 8'h98;
      expv[31] = 8'h98;
      expv[32] = 8'h98;
      expv[33] = 8'h98;
      expv[34] = 8'h98;
      expv[35] = 8'h98;
      expv[36] = 8'h98;
      expv[37] = 8'h98;
      expv[38] = 8'h98;
      expv[39] = 8'h98;
      expv[40] = 8'h98;
      expv[41] = 8'h98;
      expv[42] = 8'h98;
      expv[43] = 8'h98;
      expv[44] = 8'h98;
      expv[45] = 8'h98;
      expv[46] = 8'h98;
      expv[47] = 8'h98;
      expv[48] = 8'h98;
      expv[49] = 8'h98;
      expv[50] = 8'h98;
      expv[51] = 8'h98;
      expv[52] = 8'h98;
      expv[53] = 8'h98;
      expv[54] = 8'h98;
      expv[55] = 8'h98;
      expv[56] = 8'h98;
      expv[57] = 8'h98;
      expv[58] = 8'h98;
      expv[59] = 8'h98;
      expv[60] = 8'h98;
      expv[61] = 8'h98;
      expv[62] = 8'h98;
      expv[63] = 8'h98;
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
