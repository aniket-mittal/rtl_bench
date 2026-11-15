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

  origen_180490 dut (
    .clk(clk),
    .Reset(in_vec[154:154]),
    .WB(in_vec[153:152]),
    .Mem(in_vec[151:150]),
    .EX(in_vec[149:143]),
    .PC_id(in_vec[142:111]),
    .Imm_id(in_vec[110:79]),
    .rdAddr_id(in_vec[78:74]),
    .rs1Addr_id(in_vec[73:69]),
    .rs2Addr_id(in_vec[68:64]),
    .rs1Data_id(in_vec[63:32]),
    .rs2Data_id(in_vec[31:0]),
    .WB_out_ID_EX(out_vec[153:152]),
    .Mem_out_ID_EX(out_vec[151:150]),
    .EX_out(out_vec[149:143]),
    .PC_ex(out_vec[142:111]),
    .Imm_ex(out_vec[110:79]),
    .rdAddr_ex(out_vec[78:74]),
    .rs1Addr_ex(out_vec[73:69]),
    .rs2Addr_ex(out_vec[68:64]),
    .rs1Data_ex(out_vec[63:32]),
    .rs2Data_ex(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 155'h4f1aab52cf57280918537c53809b89ea8c59ac6;
    stim[1] = 155'h5f679dd9ce45aaa9c28112ad991ee0ca18af40e;
    stim[2] = 155'h15152ea2fcc06de6378e3b765dd6d73ece104fa;
    stim[3] = 155'h1cf67eb4657180e8d7962aba114d23bfd938d81;
    stim[4] = 155'h2e51ae2fcae0a5801583fc097a829e4e1a793d4;
    stim[5] = 155'h3def496e32fdf4d3ccc9434638820ab369aa106;
    stim[6] = 155'h0c959a3a99317b6091e04f36ab17b17b71c8244;
    stim[7] = 155'h2c1c3acb06508c925e3c449854f942e39134ff3;
    stim[8] = 155'h1e629e75e384162f24026a7332fc2726ad53fef;
    stim[9] = 155'h07eb9c3ae87e3981aa11823eef86696b28c7885;
    stim[10] = 155'h1bc3855404575a92c9fa355e4e08461c2e7fd5c;
    stim[11] = 155'h334b523aa7c75e64533571df36dec37ff77e9e0;
    stim[12] = 155'h41c21ff7d06c2b1b09ea214a210067a0863b85e;
    stim[13] = 155'h2021dedcded0b6d38a3bcfddcdaa89e6e93e0d7;
    stim[14] = 155'h37598b1659fef6b8d54758987d472acd9d437fa;
    stim[15] = 155'h1fd885bcb0e503906c00e8c69d7f70de3758502;
    stim[16] = 155'h2000204a9a2b6c2773b96ede28533b68f5cb16d;
    stim[17] = 155'h0c80e075634313cb96a7e72d37e4e2b6e045962;
    stim[18] = 155'h7d1814cfdabf9b6e84eb64536db784a2edf739c;
    stim[19] = 155'h0717674e988a7ca0d0a513f0de0fa8cd801ce35;
    stim[20] = 155'h3fedc80aea8a54fd17b97ee79a7f96c54c10238;
    stim[21] = 155'h26d39882eae3bd60f32624092415f7e7d5b0cf2;
    stim[22] = 155'h37088a8397ef06b2bff2a89cddd71864f900da9;
    stim[23] = 155'h27f498597e76edb1a96511e5bffea040ee06581;
    stim[24] = 155'h03211ab8a281c8bba8e900ea125a752b8ef20a6;
    stim[25] = 155'h37d4e526314cfc97d9d85dcffdccfdb02b42d83;
    stim[26] = 155'h259cb69d43de4e203a5301364fb0702dc92738f;
    stim[27] = 155'h044cf19d681fb832f499394efe64e75605c7b79;
    stim[28] = 155'h32416964b7a5aacca1b226e2a666ebf7902b5ed;
    stim[29] = 155'h08c7eb9657bdd108bae304dd1bfd81e80ffb8a5;
    stim[30] = 155'h0203fa73aea763d48371ae00b3802e32e8adbc5;
    stim[31] = 155'h05e6a649587209f97ad5dc04cbe468ea13dadc9;
    stim[32] = 155'h366133969aad75851f3839a610e3197a1fc873d;
    stim[33] = 155'h32934699d8e97b58edde2a7e43daa02aab40ab3;
    stim[34] = 155'h0c1a3df04d510b097b8256b43dea389213aef56;
    stim[35] = 155'h27e59d161450aa62cdb25feafb1caae1e28c394;
    stim[36] = 155'h3df2d369b43ac535fae077f07ff2e01835ac4a2;
    stim[37] = 155'h004f644bcfac66c0d86d8891acd0363859fad11;
    stim[38] = 155'h183f70a8f515c4f2881d71e9c73d073c06c5b11;
    stim[39] = 155'h14d9b96216e0f0fd16d5bb0b11336b02f0a01b1;
    stim[40] = 155'h345868da9f3b68abde16eaef36fcac301d486e0;
    stim[41] = 155'h26b6ade4fa90d6eee1a7ccacd7888525a93c150;
    stim[42] = 155'h31ad74c410e5ff5e1fa3264d7979f24e5e904f2;
    stim[43] = 155'h104696c78c001e615ea2975b1087d5b3e7c3e72;
    stim[44] = 155'h3d492b8a6aa32a783a028bddb46053d41b6462f;
    stim[45] = 155'h0371f4076b85eab7e4ef6961aa094c3382952fc;
    stim[46] = 155'h279afef5be603444e46de4b065731f10e60cbf3;
    stim[47] = 155'h30d4b4984c0ddf4b32535616060449f34eb1016;
    stim[48] = 155'h22edabbac5a6692ea217216c1ee370cfb0b996b;
    stim[49] = 155'h36f5235414318f1b755f86ce159e9560af4f644;
    stim[50] = 155'h3e2c24df6387053e59051a243c8349f3805468b;
    stim[51] = 155'h1bd06a4fcf20ec119304a33c2d347543dcb71d4;
    stim[52] = 155'h278b9584926839f203795399378d668195ef6d3;
    stim[53] = 155'h0d6866967ef23c91287c83915d34013ff2fe11c;
    stim[54] = 155'h0d2e6a05ed9ebe1c36b06c575b5e35b5d90e2fd;
    stim[55] = 155'h38c8cc29c9729f77d8b3007e91a1e0023a1cad7;
    stim[56] = 155'h06f8795443b418c7aac2605725cdd368757c2ae;
    stim[57] = 155'h3dfa640dfc95e43f4c5c8cd06bb14f4f66fcb9f;
    stim[58] = 155'h35613e57cce19085a69d0cdb059e42d50218dfa;
    stim[59] = 155'h0f55c58fa79bf4e547793e83da064e695908550;
    stim[60] = 155'h33daf4d81be8f683d07b01de72afd5aee074c99;
    stim[61] = 155'h261fbce93b3b89361d728982ff615e62fea2982;
    stim[62] = 155'h0af5d815ccdb30ec1e2f9712594873aa3550777;
    stim[63] = 155'h0897299d78e0efaeffacd5738a89e362adf6705;
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
      expv[0] = 154'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 154'h000000000000000000000000000000000000000;
      expv[2] = 154'h000000000000000000000000000000000000000;
      expv[3] = 154'h15152ea2fcc06de6378e3b765dd6d73ece104fa;
      expv[4] = 154'h1cf67eb4657180e8d7962aba114d23bfd938d81;
      expv[5] = 154'h2e51ae2fcae0a5801583fc097a829e4e1a793d4;
      expv[6] = 154'h3def496e32fdf4d3ccc9434638820ab369aa106;
      expv[7] = 154'h0c959a3a99317b6091e04f36ab17b17b71c8244;
      expv[8] = 154'h2c1c3acb06508c925e3c449854f942e39134ff3;
      expv[9] = 154'h1e629e75e384162f24026a7332fc2726ad53fef;
      expv[10] = 154'h07eb9c3ae87e3981aa11823eef86696b28c7885;
      expv[11] = 154'h1bc3855404575a92c9fa355e4e08461c2e7fd5c;
      expv[12] = 154'h334b523aa7c75e64533571df36dec37ff77e9e0;
      expv[13] = 154'h000000000000000000000000000000000000000;
      expv[14] = 154'h2021dedcded0b6d38a3bcfddcdaa89e6e93e0d7;
      expv[15] = 154'h37598b1659fef6b8d54758987d472acd9d437fa;
      expv[16] = 154'h1fd885bcb0e503906c00e8c69d7f70de3758502;
      expv[17] = 154'h2000204a9a2b6c2773b96ede28533b68f5cb16d;
      expv[18] = 154'h0c80e075634313cb96a7e72d37e4e2b6e045962;
      expv[19] = 154'h000000000000000000000000000000000000000;
      expv[20] = 154'h0717674e988a7ca0d0a513f0de0fa8cd801ce35;
      expv[21] = 154'h3fedc80aea8a54fd17b97ee79a7f96c54c10238;
      expv[22] = 154'h26d39882eae3bd60f32624092415f7e7d5b0cf2;
      expv[23] = 154'h37088a8397ef06b2bff2a89cddd71864f900da9;
      expv[24] = 154'h27f498597e76edb1a96511e5bffea040ee06581;
      expv[25] = 154'h03211ab8a281c8bba8e900ea125a752b8ef20a6;
      expv[26] = 154'h37d4e526314cfc97d9d85dcffdccfdb02b42d83;
      expv[27] = 154'h259cb69d43de4e203a5301364fb0702dc92738f;
      expv[28] = 154'h044cf19d681fb832f499394efe64e75605c7b79;
      expv[29] = 154'h32416964b7a5aacca1b226e2a666ebf7902b5ed;
      expv[30] = 154'h08c7eb9657bdd108bae304dd1bfd81e80ffb8a5;
      expv[31] = 154'h0203fa73aea763d48371ae00b3802e32e8adbc5;
      expv[32] = 154'h05e6a649587209f97ad5dc04cbe468ea13dadc9;
      expv[33] = 154'h366133969aad75851f3839a610e3197a1fc873d;
      expv[34] = 154'h32934699d8e97b58edde2a7e43daa02aab40ab3;
      expv[35] = 154'h0c1a3df04d510b097b8256b43dea389213aef56;
      expv[36] = 154'h27e59d161450aa62cdb25feafb1caae1e28c394;
      expv[37] = 154'h3df2d369b43ac535fae077f07ff2e01835ac4a2;
      expv[38] = 154'h004f644bcfac66c0d86d8891acd0363859fad11;
      expv[39] = 154'h183f70a8f515c4f2881d71e9c73d073c06c5b11;
      expv[40] = 154'h14d9b96216e0f0fd16d5bb0b11336b02f0a01b1;
      expv[41] = 154'h345868da9f3b68abde16eaef36fcac301d486e0;
      expv[42] = 154'h26b6ade4fa90d6eee1a7ccacd7888525a93c150;
      expv[43] = 154'h31ad74c410e5ff5e1fa3264d7979f24e5e904f2;
      expv[44] = 154'h104696c78c001e615ea2975b1087d5b3e7c3e72;
      expv[45] = 154'h3d492b8a6aa32a783a028bddb46053d41b6462f;
      expv[46] = 154'h0371f4076b85eab7e4ef6961aa094c3382952fc;
      expv[47] = 154'h279afef5be603444e46de4b065731f10e60cbf3;
      expv[48] = 154'h30d4b4984c0ddf4b32535616060449f34eb1016;
      expv[49] = 154'h22edabbac5a6692ea217216c1ee370cfb0b996b;
      expv[50] = 154'h36f5235414318f1b755f86ce159e9560af4f644;
      expv[51] = 154'h3e2c24df6387053e59051a243c8349f3805468b;
      expv[52] = 154'h1bd06a4fcf20ec119304a33c2d347543dcb71d4;
      expv[53] = 154'h278b9584926839f203795399378d668195ef6d3;
      expv[54] = 154'h0d6866967ef23c91287c83915d34013ff2fe11c;
      expv[55] = 154'h0d2e6a05ed9ebe1c36b06c575b5e35b5d90e2fd;
      expv[56] = 154'h38c8cc29c9729f77d8b3007e91a1e0023a1cad7;
      expv[57] = 154'h06f8795443b418c7aac2605725cdd368757c2ae;
      expv[58] = 154'h3dfa640dfc95e43f4c5c8cd06bb14f4f66fcb9f;
      expv[59] = 154'h35613e57cce19085a69d0cdb059e42d50218dfa;
      expv[60] = 154'h0f55c58fa79bf4e547793e83da064e695908550;
      expv[61] = 154'h33daf4d81be8f683d07b01de72afd5aee074c99;
      expv[62] = 154'h261fbce93b3b89361d728982ff615e62fea2982;
      expv[63] = 154'h0af5d815ccdb30ec1e2f9712594873aa3550777;
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
