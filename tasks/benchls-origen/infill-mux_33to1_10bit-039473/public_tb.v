// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 325;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_039473 dut (
    .in2(in_vec[324:315]),
    .in3(in_vec[314:305]),
    .in4(in_vec[304:295]),
    .in5(in_vec[294:285]),
    .in6(in_vec[284:275]),
    .in7(in_vec[274:265]),
    .in8(in_vec[264:255]),
    .in9(in_vec[254:245]),
    .in10(in_vec[244:235]),
    .in11(in_vec[234:225]),
    .in12(in_vec[224:215]),
    .in13(in_vec[214:205]),
    .in14(in_vec[204:195]),
    .in15(in_vec[194:185]),
    .in16(in_vec[184:175]),
    .in17(in_vec[174:165]),
    .in18(in_vec[164:155]),
    .in19(in_vec[154:145]),
    .in20(in_vec[144:135]),
    .in21(in_vec[134:125]),
    .in22(in_vec[124:115]),
    .in23(in_vec[114:105]),
    .in24(in_vec[104:95]),
    .in25(in_vec[94:85]),
    .in26(in_vec[84:75]),
    .in27(in_vec[74:65]),
    .in28(in_vec[64:55]),
    .in29(in_vec[54:45]),
    .in30(in_vec[44:35]),
    .in31(in_vec[34:25]),
    .in32(in_vec[24:15]),
    .in33(in_vec[14:5]),
    .ctrl1(in_vec[4:0]),
    .out1(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 325'h1828ff9b0b46b3038f5bedd9e0b496fb778f1c5ad288ef26b8f8b81c16701fb8d3d6e83a7c13082381;
    stim[1] = 325'h0fe412c79ab2f54303471888cba46270ef1e58a5dd90f652a773f986193a25f767448b65918fe52326;
    stim[2] = 325'h109ec4a5a546ecabb967d07f33c96c36390b70a963f0277cc020c7751f97961ea16c18d500339a5f19;
    stim[3] = 325'h117143b85d2a38c74204998acbd5a78157f13a199b5dc690e5d764cc100fc6fe775c23e30b117e2baa;
    stim[4] = 325'h1e27a548a8fc731ea5032b45939c619589bdc3919862be671f01aa13c3b4c90308773cfff69e194066;
    stim[5] = 325'h04df5e379f683dfc2f8d831d8d593ae48236ab5fe13056442f010f6944caa4ec2a40fe3c1f461fb2eb;
    stim[6] = 325'h0043b0b280756e9e37ea36bff57e180319b6a9bca60be9455312c398ef2963afce02d9c48a6cc7161b;
    stim[7] = 325'h0b4017b3f1a6d29acaa4738a6f4591e6ae4ecb87a364fcdc2482da477a4f9400b057297031cbc0a893;
    stim[8] = 325'h1856bb9f0fa201121d1b646da7a6509b609bb23e9f70aa57c4dd01b5b669dc3195c0087cc9527988bd;
    stim[9] = 325'h1a703590694d444e99f4f35e2f0e9fa9d6fa8945adbedad426368263c632f15bcfb37288763c3dc99a;
    stim[10] = 325'h143aadf8174e8f728381facfb387a5d21384c3c9739864642015daefaa78a19c64431e056b5e53a7d1;
    stim[11] = 325'h11422cd9df710e800fe63f04854dfde32cab816cffcbab520a5598644b2708592c027fa453886878ef;
    stim[12] = 325'h17ea49cc7e8e388f93ed62fbc50d9fc176f660d344b82d9290a008cb0880d230868cd073280b165c6a;
    stim[13] = 325'h0ff8a664d4e8cd8104353ae166c81bbe0dff8334d097106343d03b6abffe7e42b7b05c5fa40fc701a3;
    stim[14] = 325'h00834bb4171d1c1a2fe92dfd0d880625b0cbac2553d48d250f137dd96e03fe399a7eece65c2a29a446;
    stim[15] = 325'h197bd459954a2622206eb71ee43ddafbb86d2c7d9a204e3e3f912fefc7a8eade61d67d8e6befc56695;
    stim[16] = 325'h09d8222b66b2a8b6187ea50a1b1c14228fd1bf147cb08265bf37113286955bce17d72fc630d8fc0210;
    stim[17] = 325'h0e09ec08502055adf4cd9f9d2893b009636e2831ad9694bf2f4fc13540ffdf23d49681d1a4f9aba2ce;
    stim[18] = 325'h059de7f849b82c801dbccb48d1e723c24f5d65a3677045c17982b62b017302ed55cd306e286a7015d8;
    stim[19] = 325'h1d005ac99c3ffb12ed3e8c5ff391aca7b291dcc41d01ba3b2d22efffc192205ed4defbece73b9098b7;
    stim[20] = 325'h1965c9d3e2766b0d93b66754ab32715a6145efa17bcd0d7fc469ddbb5344efe5c13ca2ebbaccd7d5dd;
    stim[21] = 325'h0feead9ed2c2bf74346e3d89e4a0808ea36366f245a4811f07cbf95d12d494f00e3ce8298a8ef3d9f3;
    stim[22] = 325'h1c19b383352d7539e610e795f4f7e5d7049110ac9588a5f8778df4d8ae29e9e298ddda3420bcf70834;
    stim[23] = 325'h00cfe26e93896e6b2105d59d6c2ac7eb65a73a855dbdea537c030393f466fc924db7bd59f644b4a87e;
    stim[24] = 325'h18e500c8373e18aaf5db3535006a669189198b607c95db6ee1bf11550b74fa08c55b8906424ac15f35;
    stim[25] = 325'h01bb4e17a3ee363a361f2eea51111f285b9070325cf5e0b9d87fff936191d728983e332207be5333de;
    stim[26] = 325'h149cd641faa295f2f0b38e1f2b787002fade68bcbc180a23fe96ef65cc82bd49371f3dddaac2a79721;
    stim[27] = 325'h1362f7af23d857f9fb4ea7ab4083af50bcec8f5b7df2f8cd811d1ffc3b4094bf4c05fd11e0764d5507;
    stim[28] = 325'h12b9a7cfba2cc5913d2a49252f79342fe516e1c15d856a5a37d8abf656b8159d990eac1e9aa8496e18;
    stim[29] = 325'h05077a6d87b27656b754c4767fa4a214a83472e1df88e09eb3c7fbb814b718c8418c0c47d14c52a036;
    stim[30] = 325'h1cb5c80674bd16b466c8d7a73ef3f00d3bccd38a92f7ba02bce9197acf91ab0262904c85adca9d66c1;
    stim[31] = 325'h1f287e9626d30b74821ebc421b054c38c8c58cae7978fabf989953272df7e420459b316b049c29f748;
    stim[32] = 325'h1fa6fb19d3882507d2a1ce4a87bf99653f3dd2e03627e24fed9adb707fd156ef5bd535533ddf34b2f0;
    stim[33] = 325'h1d2ea4cd2937d57adbff75031e820addb9d2204b8d2b12dc10a72d8776c9fa031085c3a00805e1181b;
    stim[34] = 325'h12194423db31845682ba69fc0ba343d68d0ab25d98a1a6c5822ea9b754a92dc4da4600ac308ffd5c8f;
    stim[35] = 325'h1d232bee2cb1adaad663d606b5ac6b09c1061d68828281c488b0f6dc8fbf5b5a29fe99f75b48987f7d;
    stim[36] = 325'h115a3c5ad18209cd06f36492ffd94a2139ef263f9d64af5a29d40bfa872979c0b250289defb3346cd0;
    stim[37] = 325'h185e3dc67b9feb50a3e545a18c3413ab7fdf69b3f3d857ce98d536c736ac625ec1a585e9bc675bf1b5;
    stim[38] = 325'h032da5a59c39d4dce2b99de15b09f5d328b7e156bc14fc82fa3fa0c98f7d70eb626d0363f3d9fbfa53;
    stim[39] = 325'h198559a79f9fe3ac3a86e6f303ce86f3d32755183f2cf142780fd09145fef408a7820ccd0de4b611bf;
    stim[40] = 325'h1a4ec02446fa9c8e96b5f7f5fef42072a2f3adf9a760e33b4e0421e81af475f92abdd72f3442e7b73c;
    stim[41] = 325'h1c90f44f886a3008639f8e6ea1729712ef21f2a8a1af167f772d92a606403d6f522679be4ff9cbcecb;
    stim[42] = 325'h013520b435f9ac8ab4cf1b4700fdd5162417250752c74795dfd5ae204cebfa61d1d1ffdcef604fa56f;
    stim[43] = 325'h04e4757d0a21ab5aed7a53591b8237fd1797f4e7b5d1a43b22c600a8ddc021d4062acd29e2569115e6;
    stim[44] = 325'h1823cbc0aed16ca5d0397e3510140e9cbcaa82e02d29a8b350fa844835fc250667a8b990c7aeabfcc6;
    stim[45] = 325'h07a80f195f68a2f94c491e854cc7306ca64d6f47c962da14f5509a0b4496f8aec663e2da7c49073810;
    stim[46] = 325'h1b53b4d17919e1c400c4c32212e61f1c0a2314df6c1bf8ddd3bdd1274f1d76955ee9522cdcbe09445a;
    stim[47] = 325'h023688a52e7d0bd7a8248341877b763e4f5f46d21ed510d297e4baf3f1dbd0c447207bfce6e9b5c749;
    stim[48] = 325'h044d8a5e6255d1dcb7d4de1b606195ca8b196a70b5252bc90ddbb8f984aa98b4fcaf1f08aed430300f;
    stim[49] = 325'h10dc85539ecd6df1ef84a30adb661dad21a1234ffc5bd502d08bf74bd069ceb31d41aac040bf122c86;
    stim[50] = 325'h0752beba63fe3f7f6f9347d3e2388b72f16a6745158e86509f40f43d5eef1ca1a2bb83419d78cf89e6;
    stim[51] = 325'h0a0300c9689be1d60103ae0b358927b7f724ff68fd8e76d70a2383a0f251b754eab2d0fdeafca2f0fe;
    stim[52] = 325'h177a90a67c2f8a4fa229a3abd5e2b9e6af9e759faaf7b59722d7ea60d731ab6a26692cce4bd899b2ec;
    stim[53] = 325'h0734bca746d4f0190935d1c8f36afe4938545637d1eb2b54f445ac36a6ca302d93e4b3bb3480c5b23e;
    stim[54] = 325'h0e0d09d28a5b55b183cfd0ac7bccde307568e7b0986e3a288b4517d862fde3cf273211764ffea8d839;
    stim[55] = 325'h12ee811edc99a40bbc0e46afa242c419087121adb7fce4f711f951098eb9d8196a0746d7941ee9ce6a;
    stim[56] = 325'h1796b422c2fc354ecddb761db2b069246a72c812c2c0bc39b5f9a6e3c05e567985d435f1352a035ab4;
    stim[57] = 325'h0c8877733d8416efc3d2dd6ebf94b5a598d4cca200023ef8f9ac67b9b0fd10f9c25e5bfa7e655e1f43;
    stim[58] = 325'h1c172a6e01cf922ad5912f39d0b55b7a4bf010c6e5748749136bdf75be0308c483d8baaef7bd405fbc;
    stim[59] = 325'h1d352ba7bf954e633ec1a5b463d7b68539808080027398c84c9daea5bacfb23a2991e95f4edc41f87f;
    stim[60] = 325'h0c7d6fbb416d68abef94eb430cf58aec04fe3ebf0ba88033464c84ca5b509c1f53aa82aee4a1fa32d7;
    stim[61] = 325'h1fae84ef3235315db36b139e8bb10e946008b979902dabd1c07f69b4e0bbb043a120083fc91c197e3d;
    stim[62] = 325'h0b507f833fbb24900292772702835e863bdc33ae83088ebd57b37753ece2001e344eda1ce572c5e0a0;
    stim[63] = 325'h00c7e75b4c281143620f9bdaea90b097a870343f928e897aac5ea69b9ce2c359990f9dced048b306b0;
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
      expv[0] = 10'h07f;
      expv[1] = 10'h206;
      expv[2] = 10'h350;
      expv[3] = 10'h3ab;
      expv[4] = 10'h14a;
      expv[5] = 10'h1d7;
      expv[6] = 10'h2ce;
      expv[7] = 10'h124;
      expv[8] = 10'h0a9;
      expv[9] = 10'h366;
      expv[10] = 10'h032;
      expv[11] = 10'h367;
      expv[12] = 10'h21b;
      expv[13] = 10'h2a7;
      expv[14] = 10'h05f;
      expv[15] = 10'h3f7;
      expv[16] = 10'h396;
      expv[17] = 10'h050;
      expv[18] = 10'h05d;
      expv[19] = 10'h091;
      expv[20] = 10'h166;
      expv[21] = 10'h03e;
      expv[22] = 10'h1be;
      expv[23] = 10'h169;
      expv[24] = 10'h0aa;
      expv[25] = 10'h0a6;
      expv[26] = 10'h26b;
      expv[27] = 10'h275;
      expv[28] = 10'h2b3;
      expv[29] = 10'h029;
      expv[30] = 10'h2e4;
      expv[31] = 10'h388;
      expv[32] = 10'h2c4;
      expv[33] = 10'h21d;
      expv[34] = 10'h2ec;
      expv[35] = 10'h1a4;
      expv[36] = 10'h3ac;
      expv[37] = 10'h363;
      expv[38] = 10'h3d1;
      expv[39] = 10'h08d;
      expv[40] = 10'h1e6;
      expv[41] = 10'h0b8;
      expv[42] = 10'h03a;
      expv[43] = 10'h1da;
      expv[44] = 10'h3a0;
      expv[45] = 10'h12c;
      expv[46] = 10'h1d2;
      expv[47] = 10'h0c3;
      expv[48] = 10'h385;
      expv[49] = 10'h3df;
      expv[50] = 10'h2df;
      expv[51] = 10'h145;
      expv[52] = 10'h0d5;
      expv[53] = 10'h18b;
      expv[54] = 10'h393;
      expv[55] = 10'h085;
      expv[56] = 10'h334;
      expv[57] = 10'h1ec;
      expv[58] = 10'h1de;
      expv[59] = 10'h3c3;
      expv[60] = 10'h284;
      expv[61] = 10'h08e;
      expv[62] = 10'h16a;
      expv[63] = 10'h251;
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
