// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 169;
  localparam OW = 169;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_182673 dut (
    .clk(clk),
    .memtoreg_in(in_vec[168:168]),
    .regwrite_in(in_vec[167:167]),
    .memwrite_in(in_vec[166:163]),
    .ALUout_in(in_vec[162:131]),
    .rv2_in(in_vec[130:99]),
    .invalid_in(in_vec[98:98]),
    .immgen_in(in_vec[97:66]),
    .regin_in(in_vec[65:64]),
    .PC_plus4_in(in_vec[63:32]),
    .idata_in(in_vec[31:0]),
    .invalid_out(out_vec[168:168]),
    .rv2_out(out_vec[167:136]),
    .ALUout_out(out_vec[135:104]),
    .memwrite_out(out_vec[103:100]),
    .regwrite_out(out_vec[99:99]),
    .memtoreg_out(out_vec[98:98]),
    .immgen_out(out_vec[97:66]),
    .regin_out(out_vec[65:64]),
    .PC_plus4_out(out_vec[63:32]),
    .idata_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 169'h0dec7f267396ed05427a71cb07d1f73cccf96c92241;
    stim[1] = 169'h15ddfacba2606e2392b467b1178bd834654c3effdd7;
    stim[2] = 169'h0c6d59df86f32abae0711b7c224464fd1da6a697080;
    stim[3] = 169'h173eda3bcbdc678158026de702baa65773f3bd3e533;
    stim[4] = 169'h1bd31f4a9207b175a6836bca3376895905a5ccc07e9;
    stim[5] = 169'h07b47920e412c485b9decd4133d78c645bb3e65657e;
    stim[6] = 169'h15c449dde342b7719cc5b65473345ede65789cbf0c2;
    stim[7] = 169'h1b45aa3dd8de0278860319446177693c1b54cadd984;
    stim[8] = 169'h120693857fdf216d52a0b2c2a95aca8bd1653d743bf;
    stim[9] = 169'h0cd613bc709ea8bdf4b8aee42a47e0b37da6ecb442b;
    stim[10] = 169'h018f16c0cfc1c5e1a4e7ac67d6672613f1cf5f07529;
    stim[11] = 169'h0ae73e62976199f2bc9f35d488edc82bfecf556ec89;
    stim[12] = 169'h0f478241f8994fcad68a85e64d8223e758bd68c3983;
    stim[13] = 169'h129095d7d195b4043dc74690ceced319157f605e611;
    stim[14] = 169'h13fea63e1f0bbf0ccd54a80821281d1a5d44f104496;
    stim[15] = 169'h1a636172b2c3c00b0f149b1ad47063f341485811c48;
    stim[16] = 169'h17cd42d6420d8a87bf02ff2bf488e825e52b137fe3a;
    stim[17] = 169'h1448a8343c0b39a6db8486eddef31a41bc90987bcc3;
    stim[18] = 169'h0cb44ed04046890e0afd387289ce82703aa80b0d7b8;
    stim[19] = 169'h08cb4c2a49dd53046b37105be7af91f41dc145d56cf;
    stim[20] = 169'h0942664c677973abcd26f52bd8d0fa835aec713b58b;
    stim[21] = 169'h183c60fd04703ea85fb00a1089ba5e4653182e68395;
    stim[22] = 169'h11703a0f7a380b084527e0efb6a3af66d1e5c8b4ed3;
    stim[23] = 169'h11abb7919e9d58a9bc8f1a5ae2cf13afd033cacee9b;
    stim[24] = 169'h1ef45c9ba64af4f0cd963d41f3b11e4fe9a2ef1b2e3;
    stim[25] = 169'h099e87822ed17e7609fd52bed1b9f5f35469f76c624;
    stim[26] = 169'h0a4743be384382968ab5fa8a64702ee42b5117749c9;
    stim[27] = 169'h1743e9f815f51c981defc281647808536deedd14d70;
    stim[28] = 169'h0b73cc2bf1f65e115aaea6412c6c274d371ff6167d7;
    stim[29] = 169'h0f0b9f6689105d98749034714f281cb393c6c31963d;
    stim[30] = 169'h0eb67d349b71b7e62676616fd8cd3e37de25aed58f5;
    stim[31] = 169'h0a63bbb8778b7dbd68f46c399969a897a07703a1feb;
    stim[32] = 169'h0a013240fc4b074215c62fd3e0f5a40066c28b76a72;
    stim[33] = 169'h0fa837edeb7d5767336fac54c6c5db86ff2abbef7e7;
    stim[34] = 169'h080c1c59b387cd612cd3b3f0d8384ad859a48d0e0e9;
    stim[35] = 169'h09bf24e34407a7112abf0b99fd382a0df51f7a2c30a;
    stim[36] = 169'h052db14f8cf1eff230873656ef99dce6fb728e243ef;
    stim[37] = 169'h1d69c36d02ee8034f67a944642cc0f27931b2c6de80;
    stim[38] = 169'h1e257ef0f5ece38dd1180acd7d5604ee33a748108c9;
    stim[39] = 169'h18417b13dbbc4f45cb53b39f3ed03835d8ef8cc2e9c;
    stim[40] = 169'h0fefca0dc6039e81c9794365f06b7f12b92dc26c228;
    stim[41] = 169'h16e805359a94baac042abcc9f329c6e981a56264574;
    stim[42] = 169'h168ad8b3144bac4bab7d4f1dd9e2fa3edbdcd57e633;
    stim[43] = 169'h1f2f8e7b01a726d013bec059ed0584bd422fb7c9f4c;
    stim[44] = 169'h0985c2d58100bfd9fc6fe90c0ed2198c5a925724974;
    stim[45] = 169'h0345cfb10911e2472a6798a197bf135e17623fcf8b2;
    stim[46] = 169'h0365a77c0dd9e02d21beb720f7dbce5290c7b657cd8;
    stim[47] = 169'h1ce409b43ddb26ca2f3b2bc1cca3657f03109d2d235;
    stim[48] = 169'h088f1d25f80f1e25b92d7ad38b21ccf931a793d5281;
    stim[49] = 169'h160d6b0b970ef1b91a73935977c50ef05040cd040a0;
    stim[50] = 169'h1ea2f78cc2e3e6b2f0afc4ffbebb8cca6fdb1a19734;
    stim[51] = 169'h0a1ad0323cfcec75de8b5fff91febeda9587e616c20;
    stim[52] = 169'h0794d8752f6a120948024db45990791dc48ec75d4ea;
    stim[53] = 169'h07841d59a9d310b7f32a2dcd256c7c7cd1e9f5f4f1d;
    stim[54] = 169'h0f903ebc8b342f27fbeb1deb62c366035e3dc3bfe35;
    stim[55] = 169'h19a7a72dabc36b7147c092c8d0cd5dc7a8951d3e572;
    stim[56] = 169'h040713f5bf431d90e5ccecb11795de5571bae22a84b;
    stim[57] = 169'h030a5c723d044d1971814f6c9d25c60b0326606e4d1;
    stim[58] = 169'h127df38f2fb66f89096e60e18743ae513dc8bee6713;
    stim[59] = 169'h1d99e5e815bde5dc75c901d77761f1ff026995bedfd;
    stim[60] = 169'h0fd03a997981fed32f20303559b3ed92388a1a763b9;
    stim[61] = 169'h1aff38d0fd1c669451ed03d80089234f583ede83f3e;
    stim[62] = 169'h1843dea9827873ebe43e62bcba2553fc8cfec49f046;
    stim[63] = 169'h195f5056f1a91c3cbf9bb49f827495414d3d55e6db3;
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
      expv[0] = 169'h0000000000000000000000000000000000000000000;
      expv[1] = 169'h12dda0a84d8fe4ce7bba71cb07d1f73cccf96c92241;
      expv[2] = 169'h0c0dc4725bbf59744b7467b1178bd834654c3effdd7;
      expv[3] = 169'h1e65575c0dab3bf0d8b11b7c224464fd1da6a697080;
      expv[4] = 169'h0b8cf02b07db47797e426de702baa65773f3bd3e533;
      expv[5] = 169'h00f62eb4da63e95247c36bca3376895905a5ccc07e9;
      expv[6] = 169'h125890b7368f241c8f1ecd4133d78c645bb3e65657e;
      expv[7] = 169'h1856ee3398893bbc6b45b65473345ede65789cbf0c2;
      expv[8] = 169'h0bc04f10c8b547bb16c319446177693c1b54cadd984;
      expv[9] = 169'h0be42daa50d270aff460b2c2a95aca8bd1653d743bf;
      expv[10] = 169'h03d517be9ac2778e19b8aee42a47e0b37da6ecb442b;
      expv[11] = 169'h1838bc3491e2d819f327ac67d6672613f1cf5f07529;
      expv[12] = 169'h0c333e579ce7cc52e59f35d488edc82bfecf556ec89;
      expv[13] = 169'h0329f95ad8f0483f1e8a85e64d8223e758bd68c3983;
      expv[14] = 169'h12b68087b212bafa35474690ceced319157f605e611;
      expv[15] = 169'h1177e199afd4c7c3e754a80821281d1a5d44f104496;
      expv[16] = 169'h08780161ec6c2e5654d49b1ad47063f341485811c48;
      expv[17] = 169'h01b150f7e9a85ac84f42ff2bf488e825e52b137fe3a;
      expv[18] = 169'h016734db79150687884486eddef31a41bc90987bcc3;
      expv[19] = 169'h18d121c15689da0809bd387289ce82703aa80b0d7b8;
      expv[20] = 169'h0baa608d6969854931b7105be7af91f41dc145d56cf;
      expv[21] = 169'h0f2e7579a84cc98ce2a6f52bd8d0fa835aec713b58b;
      expv[22] = 169'h0e07d50bf78c1fa080f00a1089ba5e4653182e68395;
      expv[23] = 169'h07016108ae0741ef4267e0efb6a3af66d1e5c8b4ed3;
      expv[24] = 169'h03ab15379576f233d34f1a5ae2cf13afd033cacee9b;
      expv[25] = 169'h095e9e19be8b9374cdd63d41f3b11e4fe9a2ef1b2e3;
      expv[26] = 169'h1a2fcec133d0f045d3bd52bed1b9f5f35469f76c624;
      expv[27] = 169'h087052d158e877c704b5fa8a64702ee42b5117749c9;
      expv[28] = 169'h1ea39303b87d3f02be6fc281647808536deedd14d70;
      expv[29] = 169'h0ecbc22b5e79857e36aea6412c6c274d371ff6167d7;
      expv[30] = 169'h020bb30e9173ecd12e9034714f281cb393c6c31963d;
      expv[31] = 169'h1e36fcc4c6cfa6936db6616fd8cd3e37de25aed58f5;
      expv[32] = 169'h116fb7ad1c77770ef4b46c399969a897a07703a1feb;
      expv[33] = 169'h1960e842b026481f84862fd3e0f5a40066c28b76a72;
      expv[34] = 169'h1faaece66506fdbd6fafac54c6c5db86ff2abbef7e7;
      expv[35] = 169'h10f9ac2591838b367093b3f0d8384ad859a48d0e0e9;
      expv[36] = 169'h00f4e22557e49c6883bf0b99fd382a0df51f7a2c30a;
      expv[37] = 169'h0e3dfe4615b629f19a073656ef99dce6fb728e243ef;
      expv[38] = 169'h1dd0069ecd386da05afa944642cc0f27931b2c6de80;
      expv[39] = 169'h0d9c71ba24afde1ebcd80acd7d5604ee33a748108c9;
      expv[40] = 169'h1789e8b9682f627b70d3b39f3ed03835d8ef8cc2e9c;
      expv[41] = 169'h1073d0392df941b8cfb94365f06b7f12b92dc26c228;
      expv[42] = 169'h029755808d00a6b35d6abcc9f329c6e981a56264574;
      expv[43] = 169'h19758975615b16628d7d4f1dd9e2fa3edbdcd57e633;
      expv[44] = 169'h04e4da0275f1cf603efec059ed0584bd422fb7c9f4c;
      expv[45] = 169'h1017fb3f80b85ab023afe90c0ed2198c5a925724974;
      expv[46] = 169'h123c48e548b9f621262798a197bf135e17623fcf8b2;
      expv[47] = 169'h0b3c05a43cb4ef81b63eb720f7dbce5290c7b657cd8;
      expv[48] = 169'h0b64d945ec813687b9fb2bc1cca3657f03109d2d235;
      expv[49] = 169'h01e3c4b721e3a4bf01ad7ad38b21ccf931a793d5281;
      expv[50] = 169'h11de372341ad6172ec73935977c50ef05040cd040a0;
      expv[51] = 169'h0c7cd65e145ef1985defc4ffbebb8cca6fdb1a19734;
      expv[52] = 169'h0f9d8ebbd35a0647948b5fff91febeda9587e616c20;
      expv[53] = 169'h0d424129029b0ea5ef024db45990791dc48ec75d4ea;
      expv[54] = 169'h0a6216fe6083ab353f2a2dcd256c7c7cd1e9f5f4f1d;
      expv[55] = 169'h1685e4ff7207d7916fab1deb62c366035e3dc3bfe35;
      expv[56] = 169'h186d6e28f4f4e5b573c092c8d0cd5dc7a8951d3e572;
      expv[57] = 169'h1863b21cb0e27eb7e80cecb11795de5571bae22a84b;
      expv[58] = 169'h0089a32e314b8e47a6014f6c9d25c60b0326606e4d1;
      expv[59] = 169'h16cdf1212fbe71e5f46e60e18743ae513dc8bee6713;
      expv[60] = 169'h17bcbb8eb33cbd02bbc901d77761f1ff026995bedfd;
      expv[61] = 169'h003fda65ea07532f3fa0303559b3ed92388a1a763b9;
      expv[62] = 169'h138cd28a3fe71a1fa5ed03d80089234f583ede83f3e;
      expv[63] = 169'h0f0e7d7c887bd53040fe62bcba2553fc8cfec49f046;
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
