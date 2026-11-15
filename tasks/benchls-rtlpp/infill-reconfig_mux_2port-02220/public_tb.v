// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 155;
  localparam OW = 154;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02220 dut (
    .rcfg_clk(clk),
    .rcfg_reset_n(in_vec[154:154]),
    .rcfg_in_read_0(in_vec[153:153]),
    .rcfg_in_write_0(in_vec[152:152]),
    .rcfg_in_address_0(in_vec[151:142]),
    .rcfg_in_writedata_0(in_vec[141:110]),
    .rcfg_in_read_1(in_vec[109:109]),
    .rcfg_in_write_1(in_vec[108:108]),
    .rcfg_in_address_1(in_vec[107:98]),
    .rcfg_in_writedata_1(in_vec[97:66]),
    .rcfg_out_readdata_0(in_vec[65:34]),
    .rcfg_out_waitrequest_0(in_vec[33:33]),
    .rcfg_out_readdata_1(in_vec[32:1]),
    .rcfg_out_waitrequest_1(in_vec[0:0]),
    .rcfg_in_readdata_0(out_vec[153:122]),
    .rcfg_in_waitrequest_0(out_vec[121:121]),
    .rcfg_in_readdata_1(out_vec[120:89]),
    .rcfg_in_waitrequest_1(out_vec[88:88]),
    .rcfg_out_read_0(out_vec[87:87]),
    .rcfg_out_write_0(out_vec[86:86]),
    .rcfg_out_address_0(out_vec[85:76]),
    .rcfg_out_writedata_0(out_vec[75:44]),
    .rcfg_out_read_1(out_vec[43:43]),
    .rcfg_out_write_1(out_vec[42:42]),
    .rcfg_out_address_1(out_vec[41:32]),
    .rcfg_out_writedata_1(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 155'h22ed522e4175f4b49f9fa6e013d3ea798839ea6;
    stim[1] = 155'h13b9fbf71063850680916b31fd914a7f0488fb9;
    stim[2] = 155'h6b23271fe59501faccb5061f6d3dcb570e732f5;
    stim[3] = 155'h62b4e02e0be8d75480c0a6a0f29cde517a44cd6;
    stim[4] = 155'h5d6ba1cdd9f7fe121887ff07216e0c690f2b026;
    stim[5] = 155'h770a7fc9b555a9fe8c0ee5e145c5a85b21649f0;
    stim[6] = 155'h484f3006d316040ee4d8bf83c17efdf806266f6;
    stim[7] = 155'h72321e4dfcdf6da071e1f880192b03fa25b05b1;
    stim[8] = 155'h52853ce7b2796e96574a2a22057b43d4dd65ea3;
    stim[9] = 155'h4fb38d9c68768fb0e95c57137fc650acc66d74b;
    stim[10] = 155'h5eec109acad06892f5caed659cc5e1d1a002c42;
    stim[11] = 155'h299e11fb04f7bf17bb7501ca8bc5f9b60430229;
    stim[12] = 155'h70955274215f4baeb55c0294fc80a5176356a7f;
    stim[13] = 155'h5816c38d393e14195eeb9539582c0cfa6bace8a;
    stim[14] = 155'h525f2d6d712d6b0e683b245bf14d48ccc594c41;
    stim[15] = 155'h7a60e51db5854d8113df012e400a3f040ea5c01;
    stim[16] = 155'h783632f316e43d6d1466887e17e03a555f6de2d;
    stim[17] = 155'h50931f97cc08be0724a05ca83c3374bd6e4527e;
    stim[18] = 155'h6357e8ec028892ac5ff02d8d63e16c883ff7df8;
    stim[19] = 155'h467afc1cb13fd8351372b22e34d56ab5313adba;
    stim[20] = 155'h7dfad930e337bb2cac9943921cb5a88b8c3fe97;
    stim[21] = 155'h676e7be0fca14e0763fb0172b0df57c83e0cab0;
    stim[22] = 155'h4194fb93f90061a4c5ceba2dc958f14e76f6f7c;
    stim[23] = 155'h4db235cdc98c5c60837c39158eb5a06974d6852;
    stim[24] = 155'h4a52407497eb5ddb32b1f5f3f50b540dd9367c3;
    stim[25] = 155'h6fd1c470276e2b2fc0af782aecb295d18d54af0;
    stim[26] = 155'h6bf3630316d4c885f6675729b26213c27f01250;
    stim[27] = 155'h5ece274092c60719ccbe8123319b1627f7deca3;
    stim[28] = 155'h464d26d7d31e751b0cc807beb8182a3b30a45f4;
    stim[29] = 155'h65fd5975e7e2dcba379138950f2866e36879cf6;
    stim[30] = 155'h631b9df76eecc91c9364b2f6b3b9a105ccd00f8;
    stim[31] = 155'h6928bf1aa1d4bc059745bfe1f01e81b2dd8261c;
    stim[32] = 155'h668c6d40c2903254e029aeaf83cb99165ee828c;
    stim[33] = 155'h788f7ca6bb3eb8e9992c5b3a9e3604911223991;
    stim[34] = 155'h714a4cc26ea31e4c7439bf3735ef95c4ce102ab;
    stim[35] = 155'h6ed444b814ffc49c8b56b0652142ab53df8432a;
    stim[36] = 155'h41b6f9798fc6471d7dbce6c0b7829d83997c3f7;
    stim[37] = 155'h6042e2b491eaddd196b70307a8eb1ba30dddff6;
    stim[38] = 155'h47214ce21752dfdd85faca71a028b1062bc289d;
    stim[39] = 155'h56687b79eec20604c24b839c954732ecd94c0e5;
    stim[40] = 155'h5ace58d4b1fee9ecb6f2abb9615065e4166520d;
    stim[41] = 155'h7e4df81a47fc5c8db82e6e38aa7b996bdd8b73d;
    stim[42] = 155'h4111860c4cfe95a6154613c242cc3ea0c522ad2;
    stim[43] = 155'h6b8787c51095a615839dab721102a81897f976c;
    stim[44] = 155'h46669d81171dc9838ee41fbe60b0ec6269fe326;
    stim[45] = 155'h772d6f41931025c38abb6c6885a4fd74bf7e770;
    stim[46] = 155'h7f2efec29ba04ddfe4cc32988b4433a683247a9;
    stim[47] = 155'h5b5e23cb9a6f585d2ccdc6ebb31da40218dda4a;
    stim[48] = 155'h6c2c0a5f072ec78b9572b94337999a92d59b990;
    stim[49] = 155'h52ae3b96e871c0834b0b4ed964506ddf64f1651;
    stim[50] = 155'h4b4e85cf57d09e7886985e962bdab4257b2e5b9;
    stim[51] = 155'h6326352eaf89c0b2cd29bbe9453f7cc851a7013;
    stim[52] = 155'h684fc25de923d0450c6db65e401d5ddb7974dea;
    stim[53] = 155'h61d71c966b19ac23cb58798d2d45cefe4b0a2dc;
    stim[54] = 155'h45637d29484b4d2d205151c443b86d69d03e325;
    stim[55] = 155'h6871f7b6b035ab185f88076b19774e04ca31d00;
    stim[56] = 155'h601324185b2820a59b5ab241cdcc6ef1c1984d4;
    stim[57] = 155'h5700d814b0282530da94637cf408946dca846dd;
    stim[58] = 155'h530b17ac5b21acf4f40ea88a700fd25429f480e;
    stim[59] = 155'h5bb8a7e719bf945e505d120d7af468e3b5c9928;
    stim[60] = 155'h5061543fad4e554e86c02faa86b3669f76e5d3f;
    stim[61] = 155'h5b9de6601ee34f342507fad65ff30ee1e378a13;
    stim[62] = 155'h6b91b45c327b13b92ad24244486bb6b652481aa;
    stim[63] = 155'h6498357d2de0e21228b7ed8c527070acaac0cd9;
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
      expv[0] = 154'h000000002000000010000000000000000000000;
      expv[1] = 154'h000000002000000010000000000000000000000;
      expv[2] = 154'h000000002000000010000000000000000000000;
      expv[3] = 154'h00000000200000001ac8c9c7f965ac8c9c7f965;
      expv[4] = 154'h20f0889a5078444d30000000000000000000000;
      expv[5] = 154'h0000000020000000175ae873767d75ae873767d;
      expv[6] = 154'h2040c1281020609410000000000000000000000;
      expv[7] = 154'h000000002000000018103b9362fe8103b9362fe;
      expv[8] = 154'h000920022004900118103b9362fe8103b9362fe;
      expv[9] = 154'h20004b40700025a020000000000000000000000;
      expv[10] = 154'h00000000200000001a3ec3a5715ca3ec3a5715c;
      expv[11] = 154'h000000002000000010000000000000000000000;
      expv[12] = 154'h000000002000000010000000000000000000000;
      expv[13] = 154'h00000000200000001c25549d0857c25549d0857;
      expv[14] = 154'h305008005828040030000000000000000000000;
      expv[15] = 154'h00000000200000001497cb5b5c4b497cb5b5c4b;
      expv[16] = 154'h08000a000400050010000000000000000000000;
      expv[17] = 154'h00000000200000001e0d8cbcc5b9e0d8cbcc5b9;
      expv[18] = 154'h281c0244940e012250000000000000000000000;
      expv[19] = 154'h000000002000000018d5fa3b00a28d5fa3b00a2;
      expv[20] = 154'h2a20552215102a9110000000000000000000000;
      expv[21] = 154'h00000000200000001f7eb64c38cdf7eb64c38cd;
      expv[22] = 154'h1030195608180cab10000000000000000000000;
      expv[23] = 154'h000000002000000010000000000000000000000;
      expv[24] = 154'h000000002000000010000000000000000000000;
      expv[25] = 154'h00000000200000001d776ccac7d7d776ccac7d7;
      expv[26] = 154'h2208a0143104500a00000000000000000000000;
      expv[27] = 154'h00000000200000001afcd8c0c5b5afcd8c0c5b5;
      expv[28] = 154'h032199142190cc8a1afcd8c0c5b5afcd8c0c5b5;
      expv[29] = 154'h3620082a1b10041510000000000000000000000;
      expv[30] = 154'h0000000020000000197f565d79f897f565d79f8;
      expv[31] = 154'h0291a0010148d00090000000000000000000000;
      expv[32] = 154'h00000000200000001a4a2fc6a875a4a2fc6a875;
      expv[33] = 154'h2c81c0111640e00890000000000000000000000;
      expv[34] = 154'h00000000200000001e23df29aecfe23df29aecf;
      expv[35] = 154'h01142015408a100ab0000000000000000000000;
      expv[36] = 154'h00000000200000001bb5112e053fbb5112e053f;
      expv[37] = 154'h0032801c8019400e50000000000000000000000;
      expv[38] = 154'h00000000200000001810b8ad247a810b8ad247a;
      expv[39] = 154'h000000110000000890000000000000000000000;
      expv[40] = 154'h0000000020000000159a1ede7bb059a1ede7bb0;
      expv[41] = 154'h08204041a4102020d59a1ede7bb059a1ede7bb0;
      expv[42] = 154'h10aa128128550940959a1ede7bb059a1ede7bb0;
      expv[43] = 154'h0002441a0001220d10000000000000000000000;
      expv[44] = 154'h00000000200000001ae1e1f14425ae1e1f14425;
      expv[45] = 154'h0440b0644220583230000000000000000000000;
      expv[46] = 154'h00000000200000001dcb5bd064c4dcb5bd064c4;
      expv[47] = 154'h08024031240120189dcb5bd064c4dcb5bd064c4;
      expv[48] = 154'h0031190000188c8010000000000000000000000;
      expv[49] = 154'h00000000200000001b0b0297c1cbb0b0297c1cb;
      expv[50] = 154'h184040480c20202410000000000000000000000;
      expv[51] = 154'h000000002000000010000000000000000000000;
      expv[52] = 154'h000000002000000018c98d4babe28c98d4babe2;
      expv[53] = 154'h1640091d4b20048eb0000000000000000000000;
      expv[54] = 154'h00000000200000001875c7259ac6875c7259ac6;
      expv[55] = 154'h0000386420001c321875c7259ac6875c7259ac6;
      expv[56] = 154'h091063000488318010000000000000000000000;
      expv[57] = 154'h00000000200000001804c90616ca804c90616ca;
      expv[58] = 154'h189408902c4a04481804c90616ca804c90616ca;
      expv[59] = 154'h085009004428048030000000000000000000000;
      expv[60] = 154'h000000002000000016ee29f9c66f6ee29f9c66f;
      expv[61] = 154'h2a8483269542419350000000000000000000000;
      expv[62] = 154'h000000002000000016e7799807b86e7799807b8;
      expv[63] = 154'h040000340200001a10000000000000000000000;
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
