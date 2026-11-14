// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 169;
  localparam OW = 203;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10596 dut (
    .clk_i(clk),
    .IF_addr_i(in_vec[168:137]),
    .IF_req_i(in_vec[136:136]),
    .MEM_req_i(in_vec[135:135]),
    .MEM_we_i(in_vec[134:134]),
    .MEM_addr_i(in_vec[133:102]),
    .MEM_data_i(in_vec[101:70]),
    .MEM_bwsel_i(in_vec[69:66]),
    .dmem_ack_i(in_vec[65:65]),
    .dmem_data_i(in_vec[64:33]),
    .imem_ack_i(in_vec[32:32]),
    .imem_inst_i(in_vec[31:0]),
    .ID_inst_o(out_vec[202:171]),
    .WB_data_o(out_vec[170:139]),
    .dmem_cyc_o(out_vec[138:138]),
    .dmem_stb_o(out_vec[137:137]),
    .dmem_waddr_o(out_vec[136:105]),
    .dmem_raddr_o(out_vec[104:73]),
    .dmem_we_o(out_vec[72:72]),
    .dmem_bwsel_o(out_vec[71:68]),
    .dmem_data_o(out_vec[67:36]),
    .imem_cyc_o(out_vec[35:35]),
    .imem_stb_o(out_vec[34:34]),
    .imem_addr_o(out_vec[33:2]),
    .dmem_rdy_o(out_vec[1:1]),
    .imem_rdy_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 169'h00ac893392c7dfab2a3de279c0e0a31adc92bcf7d67;
    stim[1] = 169'h173cce946623cd9535a754b3872d84f700b701e982a;
    stim[2] = 169'h13aaacf8012378646600e62dad24832309818ca94fd;
    stim[3] = 169'h159780e367665a39eb3d44dc5212f9aaf1d91c8e691;
    stim[4] = 169'h049cc9791191988c7b745e9bc614f42532967f8743c;
    stim[5] = 169'h00b334fc1d76d1486ce4c24fa57b43435a1961919ce;
    stim[6] = 169'h1ac57315877d9f852e48141cd188cbc3831a7d27574;
    stim[7] = 169'h0feeafbf9424c91ae3dff123591ac566292c90c1b98;
    stim[8] = 169'h02810f9e2d2a33e1d4e2ef8c3451df49c3c6abbdb8c;
    stim[9] = 169'h12c3492ba0f2446bbd15f76cea801eb6a8b21d48abd;
    stim[10] = 169'h137165bc9402eddb06e0ccc52f0289a9a3328598956;
    stim[11] = 169'h12da155db7726c1a7d54666e5eceb0713869574baac;
    stim[12] = 169'h08af0cb21bf09286c44f02694eadce962bacbe97b69;
    stim[13] = 169'h0472e26bcd5457fdef60005de183822c9b99183d40e;
    stim[14] = 169'h0f7e5530ff1805b017163447e74158798a195cbe00a;
    stim[15] = 169'h0ba86731e13b392238307d0317b95b46f778da9080c;
    stim[16] = 169'h073e514258c0eb9a679a2f8ef8bd1b00d7eb4cfb5c7;
    stim[17] = 169'h02eb608f5a6671d2b74c23163c1545ef7d32fd4fee1;
    stim[18] = 169'h036fcc951d636a347f005ef1f41c093977e518da4bf;
    stim[19] = 169'h18ad85e161b1dfecc0f4ddaff955824de5a1abda795;
    stim[20] = 169'h0fdecf53f4ec4753741dafa584945c83c1bf70a5fa7;
    stim[21] = 169'h1e846d27a33a58ffb628d8a5dfea959daf1dfc470e3;
    stim[22] = 169'h054dfffd60a95121fdfeb5682bd85476e37dabb38ad;
    stim[23] = 169'h0e61d97370d586dc7a024c05fec6220e32a889cf498;
    stim[24] = 169'h08d86bfdc91cf916803649dae2ffed14ab1368bf65d;
    stim[25] = 169'h1e14eae4d3d237cc9f7f463d020ed7e4740ee3a4a35;
    stim[26] = 169'h0321e65d53b4469fa710cd090760e82269670df3cee;
    stim[27] = 169'h03c11d12fd97127574850622b6520f7b7d1a0a13e98;
    stim[28] = 169'h14fb27a832084a6d77a20d33bfd4664cc9ecef95094;
    stim[29] = 169'h1769d9eccba911cac32e59b4acda2307f389f9c3711;
    stim[30] = 169'h0aa1b80a3347aaa57764f0275b2f6486f3273362563;
    stim[31] = 169'h1e079c7f084fa358890ea826df2b542225de26823eb;
    stim[32] = 169'h07decd8dc6a20a21a1719e8d82ee0596f6b2556042b;
    stim[33] = 169'h014096471c0c8c59e3cce7c2bcd4ee9cd7019ddb16d;
    stim[34] = 169'h167d07183fea7a736e6b1b1d1301acbaa1f89bcc41a;
    stim[35] = 169'h00d3b8fab58fa94ed12b0b3d6dad14c0a13b69ef324;
    stim[36] = 169'h0445da2629ff10a87846899b255b031835a13c8fc4d;
    stim[37] = 169'h1f4b135556ec0de60265551c36eb6e4177932142383;
    stim[38] = 169'h0e2291398367b58ed4a3ebe3acc259259c5ed52e9c0;
    stim[39] = 169'h0f8805a538b41b368b4f1d2cafd6096fb95052142b7;
    stim[40] = 169'h08b9c1deadfc00d46c67f3a36967dc17518303269f8;
    stim[41] = 169'h106f6bbbfff182d60344ece7fb9f56d95f7b8fefdba;
    stim[42] = 169'h0ee79d77da61af57d21855b07713f47dc6591473818;
    stim[43] = 169'h0529b27935c7be0ba1c4af03969e13ab90e7c2d3432;
    stim[44] = 169'h0e2dabd45dd698e7afc9c25d91a848a8a6405688bd8;
    stim[45] = 169'h03a6556877c034612ee4fee30648179c305339b0864;
    stim[46] = 169'h140d6c1a49ad81457cc11dffdcc50a494f4907af747;
    stim[47] = 169'h01dc9979879344d21c93d2b9ce7b749986281b1454b;
    stim[48] = 169'h14c0f9e46d2052b5fb57d611a804708843b0ab8db8a;
    stim[49] = 169'h076e0487e8ed900ccdc2b4ae521cabe8269cfc4203a;
    stim[50] = 169'h1d6fce45aaa9e1e3cacee8025314b018dad863aaece;
    stim[51] = 169'h14fe797679052f53babaf5f32c6e702e25438a3f23b;
    stim[52] = 169'h1e3b057214926c137e4301a03e85bf275cdb3a2da6c;
    stim[53] = 169'h1f6dd2b75b45e88807d27b9480898c81b396cf405a2;
    stim[54] = 169'h00f5a89038df5effb58a8b3ab6c6e1b1f95cfea0c51;
    stim[55] = 169'h169200b97a40ad2002f4ad1ebdffa914f0164ad984f;
    stim[56] = 169'h0f9386d29ffb57a1fc059f508521044f5904daf9363;
    stim[57] = 169'h010ea1840e090c048c1466382cf64632680ed22039a;
    stim[58] = 169'h1a7fd788f0172232525cfa78e0cfb90b7ce776c0df4;
    stim[59] = 169'h1108277934a617e8509db4037172cd8df73cd31763f;
    stim[60] = 169'h098755845feea3ad33aa0febfa8e652efe498f3f022;
    stim[61] = 169'h15aefd019d80d4c01fd066c0131b82035c7a58bdcfd;
    stim[62] = 169'h157cfbeb4cb3aca639c9785f842d9d8a3c1dc64c2de;
    stim[63] = 169'h04c386b4136d9ee013fbdcbe9fbc588484dac8bc3f8;
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
      expv[0] = 203'h15e7beb3828c6b72163efd59163efd59038f789e70c15912673;
      expv[1] = 203'h380f4c153613dc02911e6ca9911e6ca99c69d52ce12e799d28f;
      expv[2] = 203'h0c654a7e920c8c26091bc323091bc3230480398b6b275559f03;
      expv[3] = 203'h48e47348cbe6abc71b32d1cf1b32d1cf18cf5137142b2f01c6f;
      expv[4] = 203'h33fc3a1e53d094ca0c8cc4638c8cc46388dd17a6f1c93992f23;
      expv[5] = 203'h4b0c8ce76d0d0d686bb68a430bb68a4315393093e9c16669f83;
      expv[6] = 203'h53e93aba232f0e0c1becfc291becfc291692050734358ae62b1;
      expv[7] = 203'h64860dcc6b1598a4812648d7012648d714f7fc48d6dfdd5f7f3;
      expv[8] = 203'h355dedc6477d270f69519f0e89519f0e9138bbe30d05021f3c6;
      expv[9] = 203'h10ea455e807adaa28792235d8792235d8a457ddb3a258692575;
      expv[10] = 203'h142cc4ab0a26a68c80176ed800176ed81cb833314be6e2cb793;
      expv[11] = 203'h4aba5d563ac1c4e19b9360d39b9360d39b55199b97e5b42abb6;
      expv[12] = 203'h65f4bdb4b73a58aeff8494361f8494360a13c09a53d15e19642;
      expv[13] = 203'h48c1ea070e08b26e6aa2bfef0aa2bfef16d800177808e5c4d79;
      expv[14] = 203'h4ae5f0050561e62878c02d8098c02d809dc58d11f9defcaa61d;
      expv[15] = 203'h46d48406656d1bdd89d9c91189d9c9118e0c1f40c51750ce63f;
      expv[16] = 203'h5a67dae3f46c035fe6075cd306075cd302e68be3bece7ca284b;
      expv[17] = 203'h17ea7f70d517bdf4f3338e9593338e9580d308c58fc5d6c11e9;
      expv[18] = 203'h28c6d25ff024e5dfeb1b51a38b1b51a390c017bc7dc6df992a0;
      expv[19] = 203'h0d5ed3cad60937968d8eff660d8eff66053d376bfe315b0bc2c;
      expv[20] = 203'h7b852fd3d1720f0687623a9b87623a9b92076be961dfbd9ea7f;
      expv[21] = 203'h6fe23871aa5676bc19d2c7fd99d2c7fd8f8a3629773d08da4f7;
      expv[22] = 203'h6d5d9c56e151db8d854a890f854a890f8f7fad5a0a0a9bfffaf;
      expv[23] = 203'h444e7a4c188838ca86ac36e386ac36e38b8093017fdcc3b2e6f;
      expv[24] = 203'h1b45fb2effb452ac68e7c8b408e7c8b40b0d9276b811b0d7fbb;
      expv[25] = 203'h771d251abb5f91d01e91be649e91be6488dfd18f40fc29d5c99;
      expv[26] = 203'h386f9e7703a089a59da234fd1da234fd0dc4334241c643ccbaa;
      expv[27] = 203'h50509f4c483dedf46cb893ab8cb893ab99214188adc7823a25f;
      expv[28] = 203'h677ca84a519933279042536b9042536b8fe8834cefe9f64f504;
      expv[29] = 203'h4fce1b88e88c1fce7d488e561d488e5603cb966d2b2ed3b3d9a;
      expv[30] = 203'h399b12b1bd921bcc9a3d552b9a3d552b8cd93c09d6d54370147;
      expv[31] = 203'h713411f5ad508897627d1ac4027d1ac40c43aa09b73c0f38fe3;
      expv[32] = 203'h12ab0215b8165bda9510510d1510510d1b5c67a3600fbd9b1bb;
      expv[33] = 203'h0ceed8b6d3ba735c606462cf006462cf13f339f0afc2812c8e3;
      expv[34] = 203'h44de620d06b2ea87ff53d39b1f53d39b1c9ac6c744ecfa0e305;
      expv[35] = 203'h5b4f7992345302848c7d4a768c7d4a76964ac2cf5bc1a771f57;
      expv[36] = 203'h09e47e26ec0c60d6eff885438ff885438511a266c9088bb44c6;
      expv[37] = 203'h190a11c1adb905de17606f3017606f301b9955470dfe9626aab;
      expv[38] = 203'h76a974e0096496711b3dac769b3dac768328faf8eb1c4522733;
      expv[39] = 203'h0290a15bd825bee565a0d9b405a0d9b40fd3c74b2bdf100b4a7;
      expv[40] = 203'h181934fc1f705d466fe006a30fe006a31519fce8da117383bd6;
      expv[41] = 203'h5c7f7edd7d5b657dff8c16b01f8c16b01ed13b39fee0ded777d;
      expv[42] = 203'h48a39c0c4fd1f719730d7abe930d7abe8c86156c1dddcf3aef9;
      expv[43] = 203'h3e169a19784eae438e3df05d0e3df05d1a712bc0e5ca5364f24;
      expv[44] = 203'h02b445ec2122a2996eb4c73d0eb4c73d16f2709764dc5b57a8a;
      expv[45] = 203'h19cd8432205e70c11e01a3091e01a30919b93fb8c1c74caad0d;
      expv[46] = 203'h483d7ba39429253d6d6c0a2b8d6c0a2b8330477ff7281ad834a;
      expv[47] = 203'h40d8a2a5edd266189c9a26909c9a26909924f4ae7303b932f33;
      expv[48] = 203'h055c6dc511c2210ee90295af890295af90d5f5846a2981f3c8f;
      expv[49] = 203'h67e2101d72afa09a676c8066076c80660870ad2b940edc090fd;
      expv[50] = 203'h431d576752c0636b754f0f1e154f0f1e0cb3ba00943adf9c8b5;
      expv[51] = 203'h1c51f91db9c0b89568297a9d88297a9d81aebd7ccbe9fcf2ecf;
      expv[52] = 203'h59d16d3616fc9d730493609b8493609b9a90c0680ffc760ae41;
      expv[53] = 203'h367a02d1263206ce7a2f44401a2f444002f49ee520fedba56eb;
      expv[54] = 203'h67f506289b86c7e566faf7fd86faf7fd8b62a2ceadc1eb51205;
      expv[55] = 203'h3256cc27fea453c0720569001205690007bd2b47afed240172f;
      expv[56] = 203'h26d7c9b184113d647fdabd0f9fdabd0f940167d421df270da52;
      expv[57] = 203'h769101cd5918c9a070486024104860241305198e0b021d43082;
      expv[58] = 203'h3bb606fa3ee42df380b9119280b9119283973e9e38f4ffaf11d;
      expv[59] = 203'h6698bb1fcb3637dc8530bf428530bf4295276d00dce2104ef27;
      expv[60] = 203'h4c79f8113994bbf97f751d699f751d699aea83fafed30eab08a;
      expv[61] = 203'h52c5ee7eee080d71ec06a6008c06a6009cf419b004eb5dfa031;
      expv[62] = 203'h6e32616f367628f0659d6531859d653190725e17e12af9f7d6b;
      expv[63] = 203'h5645e1fc716212131b6cf7009b6cf7008efef72fa7c9870d683;
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
