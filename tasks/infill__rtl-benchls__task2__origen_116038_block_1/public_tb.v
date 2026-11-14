// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 204;
  localparam OW = 203;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_116038 dut (
    .clk(clk),
    .reset(in_vec[203:203]),
    .Branch(in_vec[202:202]),
    .MemRead(in_vec[201:201]),
    .MemWrite(in_vec[200:200]),
    .RegWrite(in_vec[199:199]),
    .MemtoReg(in_vec[198:198]),
    .mux_ForwardB(in_vec[197:134]),
    .mux_ALU(in_vec[133:70]),
    .ALUzero(in_vec[69:69]),
    .adder2out(in_vec[68:5]),
    .rd(in_vec[4:0]),
    .EX_MEM_Branch(out_vec[202:202]),
    .EX_MEM_MemRead(out_vec[201:201]),
    .EX_MEM_MemWrite(out_vec[200:200]),
    .EX_MEM_RegWrite(out_vec[199:199]),
    .EX_MEM_MemtoReg(out_vec[198:198]),
    .EX_MEM_mux_ForwardB(out_vec[197:134]),
    .EX_MEM_mux_ALU(out_vec[133:70]),
    .EX_MEM_ALUzero(out_vec[69:69]),
    .EX_MEM_adder2out(out_vec[68:5]),
    .EX_MEM_rd(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 204'hb2f96b7ecc0d0ff8f57b031f0d41f6b1e160e4a108309e8db51;
    stim[1] = 204'hc84ac9408ad2cd67a76e6d1577e24c69a6362d227534c6b1b7e;
    stim[2] = 204'h70062a18a99be5b8a910b454f0e8b85a48fe8a15e5fb5937db9;
    stim[3] = 204'h3a4670929e2ccf046331058da097867a4c0c0bdeaf6ea6cf1e5;
    stim[4] = 204'h7c030fa40c3b68f975a6ba347b8ad345c0ab86ea10d0825222d;
    stim[5] = 204'h7a1a6b1e4c6c242feaf144a7b0207b3ff280d9803b8fa280c75;
    stim[6] = 204'h4fd82f546c7a8275fae97b2609c130d2796cb98153e24455994;
    stim[7] = 204'h3f1d1db000e7837085d0a67529bb7fc3d652ccd7a2584b2d460;
    stim[8] = 204'h0b391d49dde0ce94e78d379ecbe8cf75a6e3c422857fb6caeee;
    stim[9] = 204'h70203cb5a3513ebd1cbc482fa57dbe0b672db1a62c472fec3ec;
    stim[10] = 204'h63930d0663f087e6bfcbcdf2649c1c6d746c90b87a2a0724463;
    stim[11] = 204'h4eaffeed3ac2c08bf30c08d930ed560a65fa8af0ff8a790b8fb;
    stim[12] = 204'h1827a6049038292e79ddaf963bc1f05d243a4309f2a32b0137e;
    stim[13] = 204'h76f4746962d0a0aff554eec4fbd2f75bbcd2f6360f2c2e68ae1;
    stim[14] = 204'h6b3fa526603b80b2f35923cfe3cf585d7ecea0bde84ef72ac3a;
    stim[15] = 204'h718104affb91767515663dcdcd0eaac04fec707a0fd08869932;
    stim[16] = 204'h1b7c54494f0b4c12b0c86a9734a270e4f8fbd34a9b175cafcc6;
    stim[17] = 204'h422bd157382d31ea097a13142c97bdf8424f907f1e6d8289f00;
    stim[18] = 204'h09f279cd31a2796b3008c7c24396f7acdaada690d88e1367110;
    stim[19] = 204'h1c86c7e0525361ca140fedd491141584de3f76cfd3db0825caf;
    stim[20] = 204'h552be4032f6f3fd7c6ad78635d6c77c5670c8382689062f33fd;
    stim[21] = 204'h04399b166e183d2770e267bb50e47078552c586376401004859;
    stim[22] = 204'h1e33c62989a60390f205a830ad82c9c0fd56e09f98f66ad3832;
    stim[23] = 204'h0bef30e49886d2850a0136b40158e2733cbc8848ac97c19b217;
    stim[24] = 204'h1360d65ed1d56377080e7cb8a39b92a5f4fe5e1c2bcc4841326;
    stim[25] = 204'h14994d8093230045175e58966efd6519a52992975bb04ba0fe6;
    stim[26] = 204'h072c654d0b12fc4d8879c277cbaeeea39d4fa12a0cb7d56aa14;
    stim[27] = 204'h4d4deb751ec7da6a02734b82803aac5a5500751979feca5565d;
    stim[28] = 204'h693ea65ec8a08cc6cc9d13b7e20feee8ddcb8b26cca3d241091;
    stim[29] = 204'h13d66c2b10ca6fd925cb9e3480b940c680fab355a6d9700ca0e;
    stim[30] = 204'h48d9d153be41e3f89e43ca7aa02c1ded41d27abb371638a7c39;
    stim[31] = 204'h2eb47451c0ef2048f88ab665b0f50e6caf5270ee578c46400ed;
    stim[32] = 204'h0cfb4775d70a965c2b611337d72e57ac3eba74abdb368502431;
    stim[33] = 204'h044913002dc9082189786f20b9b9fa1358564d7229a0e3921cf;
    stim[34] = 204'h605c7abfaad103a41bc26683944a058959ed4faae3c7c483de0;
    stim[35] = 204'h26a6f39b4964d0ebe022cdda4246be6070e6001e9ba08b92869;
    stim[36] = 204'h601bcb31ab2663ca0b76b868229acd9b081abb2b3ad5945b28b;
    stim[37] = 204'h10ee730032eda1091cc5652aa302e537340531e3b97eaac2d68;
    stim[38] = 204'h5a009947829703d398d8518b382ca4af3ed2c09fc911afc9ded;
    stim[39] = 204'h4ff51964dd33b1a2950c586c43134f6b31f90db8b8ebee3b9b0;
    stim[40] = 204'h1d8ad627d52565226bbb35924bceab63bea34babb2342194740;
    stim[41] = 204'h569f861ab7db6b1ff5aaa6acdfb64951754cb9c2e8a7d26a224;
    stim[42] = 204'h1869f21237a92d124cfce6d32f337c6c8ac79f6efc8a647b1d5;
    stim[43] = 204'h0b841e7cfcdc4f39046f1ac75c1097b0ddea6a6e96673c41ac4;
    stim[44] = 204'h7d896ba2a8fa3552cb98cc0c9fcc9f707fb3b3366eb1af2e20f;
    stim[45] = 204'h0fc8d4ac7661911968d784827cc9ec815d72b671c3eefaf1f49;
    stim[46] = 204'h3bf1b2aeb1a34f49e77b93bdc170c218ac9cc7a5dfb1ba1a547;
    stim[47] = 204'h681fdd0b062689cd4c0045773bd436fcc3061e7e9b42e79326e;
    stim[48] = 204'h44f10a72a67a5b728b9ed1853b272f2fbb0721b15e732632080;
    stim[49] = 204'h077e12cdb970299137c1b59168b2d1fb787e5901f7a4bedd992;
    stim[50] = 204'h7b55e438723e6a3585b5b4579192ca879f6d71140191595cfe9;
    stim[51] = 204'h526e4c2d157e4f7a772072e6047fe70cb6ac2b0e6c87d336ccd;
    stim[52] = 204'h6840a19d224c76609d93454769bc75ba534f7204bffad394374;
    stim[53] = 204'h03a42235a4bc2889041c09fb3999605d0bd69dc784f9af31f40;
    stim[54] = 204'h5b869780427327029cc047fc37c51cb3b5f0b125ab389e02f2b;
    stim[55] = 204'h098e1d6f967db943eadb3769235a2f16eb64e50d1ccdb8f61c9;
    stim[56] = 204'h429f1cafaa3f26ab93434f981974fe95e355ff04563f690fe28;
    stim[57] = 204'h32f3b42f90d92d0dbc3b31162e7887f1f18318b7b3bbe222be3;
    stim[58] = 204'h4bf6a20fa5e55988aa7d0767bf3fa0c25bda18f6f60c8d28f56;
    stim[59] = 204'h32236a2021d35baea832ee8bdda25da9e0ece6da42779abd6a2;
    stim[60] = 204'h69e136d358c404c27002c2418f2cf01fbb40489bf17b80af860;
    stim[61] = 204'h55ce85ba325238a776cf6906c76ea35fc59ba494fd826ae6f72;
    stim[62] = 204'h000255ecadec00fd0087b0157fb96884b3dfd6d967d4dd02df2;
    stim[63] = 204'h3be6398530d2a4b7daa2b69e02cca3f5a244d5132b022a14d62;
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
      expv[0] = 203'h000000000000000000000000000000000000000000000000000;
      expv[1] = 203'h000000000000000000000000000000000000000000000000000;
      expv[2] = 203'h000000000000000000000000000000000000000000000000000;
      expv[3] = 203'h70062a18a99be5b8a910b454f0e8b85a48fe8a15e5fb5937db9;
      expv[4] = 203'h3a4670929e2ccf046331058da097867a4c0c0bdeaf6ea6cf1e5;
      expv[5] = 203'h7c030fa40c3b68f975a6ba347b8ad345c0ab86ea10d0825222d;
      expv[6] = 203'h7a1a6b1e4c6c242feaf144a7b0207b3ff280d9803b8fa280c75;
      expv[7] = 203'h4fd82f546c7a8275fae97b2609c130d2796cb98153e24455994;
      expv[8] = 203'h3f1d1db000e7837085d0a67529bb7fc3d652ccd7a2584b2d460;
      expv[9] = 203'h0b391d49dde0ce94e78d379ecbe8cf75a6e3c422857fb6caeee;
      expv[10] = 203'h70203cb5a3513ebd1cbc482fa57dbe0b672db1a62c472fec3ec;
      expv[11] = 203'h63930d0663f087e6bfcbcdf2649c1c6d746c90b87a2a0724463;
      expv[12] = 203'h4eaffeed3ac2c08bf30c08d930ed560a65fa8af0ff8a790b8fb;
      expv[13] = 203'h1827a6049038292e79ddaf963bc1f05d243a4309f2a32b0137e;
      expv[14] = 203'h76f4746962d0a0aff554eec4fbd2f75bbcd2f6360f2c2e68ae1;
      expv[15] = 203'h6b3fa526603b80b2f35923cfe3cf585d7ecea0bde84ef72ac3a;
      expv[16] = 203'h718104affb91767515663dcdcd0eaac04fec707a0fd08869932;
      expv[17] = 203'h1b7c54494f0b4c12b0c86a9734a270e4f8fbd34a9b175cafcc6;
      expv[18] = 203'h422bd157382d31ea097a13142c97bdf8424f907f1e6d8289f00;
      expv[19] = 203'h09f279cd31a2796b3008c7c24396f7acdaada690d88e1367110;
      expv[20] = 203'h1c86c7e0525361ca140fedd491141584de3f76cfd3db0825caf;
      expv[21] = 203'h552be4032f6f3fd7c6ad78635d6c77c5670c8382689062f33fd;
      expv[22] = 203'h04399b166e183d2770e267bb50e47078552c586376401004859;
      expv[23] = 203'h1e33c62989a60390f205a830ad82c9c0fd56e09f98f66ad3832;
      expv[24] = 203'h0bef30e49886d2850a0136b40158e2733cbc8848ac97c19b217;
      expv[25] = 203'h1360d65ed1d56377080e7cb8a39b92a5f4fe5e1c2bcc4841326;
      expv[26] = 203'h14994d8093230045175e58966efd6519a52992975bb04ba0fe6;
      expv[27] = 203'h072c654d0b12fc4d8879c277cbaeeea39d4fa12a0cb7d56aa14;
      expv[28] = 203'h4d4deb751ec7da6a02734b82803aac5a5500751979feca5565d;
      expv[29] = 203'h693ea65ec8a08cc6cc9d13b7e20feee8ddcb8b26cca3d241091;
      expv[30] = 203'h13d66c2b10ca6fd925cb9e3480b940c680fab355a6d9700ca0e;
      expv[31] = 203'h48d9d153be41e3f89e43ca7aa02c1ded41d27abb371638a7c39;
      expv[32] = 203'h2eb47451c0ef2048f88ab665b0f50e6caf5270ee578c46400ed;
      expv[33] = 203'h0cfb4775d70a965c2b611337d72e57ac3eba74abdb368502431;
      expv[34] = 203'h044913002dc9082189786f20b9b9fa1358564d7229a0e3921cf;
      expv[35] = 203'h605c7abfaad103a41bc26683944a058959ed4faae3c7c483de0;
      expv[36] = 203'h26a6f39b4964d0ebe022cdda4246be6070e6001e9ba08b92869;
      expv[37] = 203'h601bcb31ab2663ca0b76b868229acd9b081abb2b3ad5945b28b;
      expv[38] = 203'h10ee730032eda1091cc5652aa302e537340531e3b97eaac2d68;
      expv[39] = 203'h5a009947829703d398d8518b382ca4af3ed2c09fc911afc9ded;
      expv[40] = 203'h4ff51964dd33b1a2950c586c43134f6b31f90db8b8ebee3b9b0;
      expv[41] = 203'h1d8ad627d52565226bbb35924bceab63bea34babb2342194740;
      expv[42] = 203'h569f861ab7db6b1ff5aaa6acdfb64951754cb9c2e8a7d26a224;
      expv[43] = 203'h1869f21237a92d124cfce6d32f337c6c8ac79f6efc8a647b1d5;
      expv[44] = 203'h0b841e7cfcdc4f39046f1ac75c1097b0ddea6a6e96673c41ac4;
      expv[45] = 203'h7d896ba2a8fa3552cb98cc0c9fcc9f707fb3b3366eb1af2e20f;
      expv[46] = 203'h0fc8d4ac7661911968d784827cc9ec815d72b671c3eefaf1f49;
      expv[47] = 203'h3bf1b2aeb1a34f49e77b93bdc170c218ac9cc7a5dfb1ba1a547;
      expv[48] = 203'h681fdd0b062689cd4c0045773bd436fcc3061e7e9b42e79326e;
      expv[49] = 203'h44f10a72a67a5b728b9ed1853b272f2fbb0721b15e732632080;
      expv[50] = 203'h077e12cdb970299137c1b59168b2d1fb787e5901f7a4bedd992;
      expv[51] = 203'h7b55e438723e6a3585b5b4579192ca879f6d71140191595cfe9;
      expv[52] = 203'h526e4c2d157e4f7a772072e6047fe70cb6ac2b0e6c87d336ccd;
      expv[53] = 203'h6840a19d224c76609d93454769bc75ba534f7204bffad394374;
      expv[54] = 203'h03a42235a4bc2889041c09fb3999605d0bd69dc784f9af31f40;
      expv[55] = 203'h5b869780427327029cc047fc37c51cb3b5f0b125ab389e02f2b;
      expv[56] = 203'h098e1d6f967db943eadb3769235a2f16eb64e50d1ccdb8f61c9;
      expv[57] = 203'h429f1cafaa3f26ab93434f981974fe95e355ff04563f690fe28;
      expv[58] = 203'h32f3b42f90d92d0dbc3b31162e7887f1f18318b7b3bbe222be3;
      expv[59] = 203'h4bf6a20fa5e55988aa7d0767bf3fa0c25bda18f6f60c8d28f56;
      expv[60] = 203'h32236a2021d35baea832ee8bdda25da9e0ece6da42779abd6a2;
      expv[61] = 203'h69e136d358c404c27002c2418f2cf01fbb40489bf17b80af860;
      expv[62] = 203'h55ce85ba325238a776cf6906c76ea35fc59ba494fd826ae6f72;
      expv[63] = 203'h000255ecadec00fd0087b0157fb96884b3dfd6d967d4dd02df2;
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
