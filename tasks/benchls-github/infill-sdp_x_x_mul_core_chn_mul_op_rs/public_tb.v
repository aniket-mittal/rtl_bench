// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 260;
  localparam OW = 258;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  SDP_X_X_mul_core_chn_mul_op_rsci_chn_mul_op_wait_dp dut (
    .nvdla_core_clk(clk),
    .nvdla_core_rstn(in_vec[259:259]),
    .chn_mul_op_rsci_oswt(in_vec[258:258]),
    .chn_mul_op_rsci_biwt(in_vec[257:257]),
    .chn_mul_op_rsci_bdwt(in_vec[256:256]),
    .chn_mul_op_rsci_d(in_vec[255:0]),
    .chn_mul_op_rsci_bawt(out_vec[257:257]),
    .chn_mul_op_rsci_wen_comp(out_vec[256:256]),
    .chn_mul_op_rsci_d_mxwt(out_vec[255:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 260'h68584b54ada9b06108fd6f95c73a202e53bf72b0f61733c5f1eb57481815ff3ab;
    stim[1] = 260'h0a757074534aac2a9349188d8ba4d5e84b0522b07197cec404b7b003603d8224f;
    stim[2] = 260'h4392f7b9a9ff208964a1d5e02393c98553fa5b15657c43937e7b7ba6ac734642c;
    stim[3] = 260'h8d80ba5801019f4e7acb34c99b64f3d067342e1b1966f8738cffe2dc63d034651;
    stim[4] = 260'hb1d7ecfad89d1ed0eeda6baec0f4c8663b8cbba45e9ca880c106f1a7b3b0d0f29;
    stim[5] = 260'hca408378516aaf4c5cfed3e491cba08b97ddb2cfd9a9f63e728863e7d40829e46;
    stim[6] = 260'hc6010c4b8e0a3282c43ba2c87860fe1eb0e1148e21fc8a46240182277119e7c0e;
    stim[7] = 260'hdda38d8cf9521861fe59091a5362f6bd5f738f808d5e57195ecebf071f66c37b9;
    stim[8] = 260'hb69e5a1a3d17ee05b8a6602b92f9c4659633458bbf8fc4428b99a5ef1fe2c0bb6;
    stim[9] = 260'hb7a7d1f2a255f4487d062c8d0aba77e7f197d68b42a36b58adcb1464073133d03;
    stim[10] = 260'h699d85badd9182d5e2c673b03b23b847b9ba88901c4f5ec3dd9602910139f804b;
    stim[11] = 260'hf37606397f750c62d496ba2e4a40ae53d9b2ca0647a9ea2e4c2b04d4058d2053e;
    stim[12] = 260'hc9381361745462f5e8b4781cc1c44435bf4b9a583807a3d9ab69fc504fca04857;
    stim[13] = 260'h4791ea30a837193256cbf5682dce9a0fee6e58a1b616083454815daef39c75928;
    stim[14] = 260'h9cf95dfe0e477946385e2cea496ff47884f6096cc7fbcb1a21cbb4f4d095e4deb;
    stim[15] = 260'h95a2e10e7a4d5878d27d26180fb887658b02c2227feec33346f299a9dcec0f921;
    stim[16] = 260'hc9952e6f247e9d2eac2d4c137c8aad0f23cddebd173bdee516604174c1c4b50ec;
    stim[17] = 260'heab8885d393bdfa15553421ec3d505a3064bc3b339c1a694f994ac96ee5fc4cc1;
    stim[18] = 260'ha59457c86e74e2ab9851bd5cd29048899d10636dbdc80b3bcb1420d1f00e4e54d;
    stim[19] = 260'hd067b2fcc3a6cf8d64d30e3db9a579f004e2a81d4eeeae1118da8ce2484192fcb;
    stim[20] = 260'h907d143be3f0270e6d9145d3e1bf28229cd7678f3ec129fd4cb9695a32c88b994;
    stim[21] = 260'hf3db69fed5000e89d3fe09ef6273bb81906538c0bdca40eb16d915a65170eb865;
    stim[22] = 260'hb15a1caa0cf376cd6adce61e8e9e27e820cc5f784d37da8ab37de86e6c11a1c07;
    stim[23] = 260'h9c18ba416c837ef8a21b6f602e4c543393f77ee04307bcb76bb4b5ced57b940a2;
    stim[24] = 260'h96c382f80d5595e9e129b89fa0fafac25829b5bc6715312c2a6d53d4dc9de2367;
    stim[25] = 260'h9ac6bc138a365bfa3b32a3052b30c1c7b39f31538066743de7fe5ca1bde4c4fd9;
    stim[26] = 260'hf52cb2f5e471cfa6b297e7a9722ddda6f92bdfb49a7e5fc76b5199e9114f38d53;
    stim[27] = 260'h87111af6b29316b3bb2b1cb418bd98fea8a323b15befb1cf1a19d7b0710cc1595;
    stim[28] = 260'h4a2e6095e5fe264486e7b96d6ec615d7f055200627182461e2183313851af6483;
    stim[29] = 260'hfdc2478baea44c8a0d9c932d12ad74bf17384d5fb6e1f31fc2be4b502c26a7517;
    stim[30] = 260'h8c431d3abbcf818d81930aac743cd7d5a647cf03fda6082d66db05cc287fc0878;
    stim[31] = 260'hba27fa1075c96410a1cda34dbf6eb2412be23ff8597536b506b00505e6b3bdb3c;
    stim[32] = 260'hbc949109af99163101646bd093ad93954683cdfb70acb5909bf7f766cf9fd818f;
    stim[33] = 260'h964a8085de75ed5206e9c62073900ab805f993c51b10f1eaa5e09c474a877dacb;
    stim[34] = 260'hc99da05d20167176a63ca63aeb0d8478a3470be37e9bcf8ccb650fd59f35ba72a;
    stim[35] = 260'hc0e43c63df6f9b3c7189f06d77243142aa55e7bccf674954b6cc1ab5e49ddd914;
    stim[36] = 260'had55a3381174893adf26be9f58e0e6ada2f1d13da1bf1983f7c38d75152e7c5cf;
    stim[37] = 260'hf64dee9e9a6b9061f6297d931c360c2b01e202c6316db5f21c631607a9c393267;
    stim[38] = 260'hcc70bdeacefd5dfb841af49a26c47fb25f2d3e963e7f94c718d3f454c984dd3a5;
    stim[39] = 260'hbc4d6c5594d8649fdec98d49fcc241b796b1ac28d066b0159c0de3f1ed23639a6;
    stim[40] = 260'hd0a24f3659d9c53ba01b17521e5913e658c18424d5822da63296942bec2cbd7c4;
    stim[41] = 260'hfe053a1b7bbc2bdbc8374a5ee3fa9c7a70820f7c7eca582b59fbd54233fcfd1c5;
    stim[42] = 260'hf662f250df32775c508d54193eff1ee82bc039fa0eaaa27b29aef49488b044c78;
    stim[43] = 260'ha7bf8b1df9124e02d38bdd96849e9ca9e6cd5bd70c689683b88338c23d34a061d;
    stim[44] = 260'hc908907414fff635fecd3ac522912278e9f31b4803977cad720041bd0b602593d;
    stim[45] = 260'hc0272cfc0e8521cec1b904f5787babfb916260e5f0eaf6f52cc9cbe413cfca7d9;
    stim[46] = 260'hd22b04f0a23464a3eeb4748fa585b7eeb3ef21e40d8a73c5b0f0451def60a163e;
    stim[47] = 260'h8c8e8377ec2ff34d9f07e6830f4c027a02c9d181746bfde9116d4d216920b36a9;
    stim[48] = 260'he642733057942bab6fc0bda3f1f89755550550e159c3e22c6824ef83ac75f1353;
    stim[49] = 260'hae75b1ed0da77ef6c33cf76676f873e1f3bfcccdca2eb83dd67b0e445c8720af0;
    stim[50] = 260'h9b819d5f0d3542aab0ef5c3283f430117e4181326a4e240893fd3cbf10b53a01f;
    stim[51] = 260'hc0f16c9609511c2b01f44f75adde36b8d8727ce69dc7941c0616d45a46c5efc75;
    stim[52] = 260'ha2d27483227334f1fb46070d74bd86496ac543db8d09d54896fd1d62ecb67864d;
    stim[53] = 260'hda77acaadab1f207b0505412e6145d9ed11bade1effe38c46c6eb34bdde85fd22;
    stim[54] = 260'h97479961bae3e7db884f1eda93928e56ff47aab1c0afef21fee47de110bd5f413;
    stim[55] = 260'ha7a2ecbaae2738a4a51bc1fd3a984dc13f322bebd55001a62de90bbea46dea145;
    stim[56] = 260'hba8106c577d056e4ece39b7967b28d8239fcd0e5096980b9ec5111ae2d13be6ab;
    stim[57] = 260'hd9a862dcb224ff7362910bb6cb66f73b6689c76a0dcd95351490c3e351b9f133d;
    stim[58] = 260'ha06190085c555854e4851b16a9fb20352e57f21ba4e10e482ee2a44b1989e886f;
    stim[59] = 260'hf45723d41ae68968d4297bd83822fee0249e3101d1fa37c8c84aeccd56520c71d;
    stim[60] = 260'h826133f1580e7864d2d9fc6c165f6e61409551bb1991c5c65580c81368f2d3695;
    stim[61] = 260'hd6f831c1e2f3e509469e0c6e6642367e18627bd970b32a78585352dd514b876fa;
    stim[62] = 260'hceadee3c8c31d4f63974a624f446871d77ee3f4d80362f0d7e202bd704316af57;
    stim[63] = 260'ha64764f49979c146d85809592da278ec25d69fb8337cddef292289539a70c86bd;
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
      expv[0] = 258'h38584b54ada9b06108fd6f95c73a202e53bf72b0f61733c5f1eb57481815ff3ab;
      expv[1] = 258'h1a757074534aac2a9349188d8ba4d5e84b0522b07197cec404b7b003603d8224f;
      expv[2] = 258'h0392f7b9a9ff208964a1d5e02393c98553fa5b15657c43937e7b7ba6ac734642c;
      expv[3] = 258'h1d80ba5801019f4e7acb34c99b64f3d067342e1b1966f8738cffe2dc63d034651;
      expv[4] = 258'h31d7ecfad89d1ed0eeda6baec0f4c8663b8cbba45e9ca880c106f1a7b3b0d0f29;
      expv[5] = 258'h0a408378516aaf4c5cfed3e491cba08b97ddb2cfd9a9f63e728863e7d40829e46;
      expv[6] = 258'h06010c4b8e0a3282c43ba2c87860fe1eb0e1148e21fc8a46240182277119e7c0e;
      expv[7] = 258'h0da38d8cf9521861fe59091a5362f6bd5f738f808d5e57195ecebf071f66c37b9;
      expv[8] = 258'h369e5a1a3d17ee05b8a6602b92f9c4659633458bbf8fc4428b99a5ef1fe2c0bb6;
      expv[9] = 258'h37a7d1f2a255f4487d062c8d0aba77e7f197d68b42a36b58adcb1464073133d03;
      expv[10] = 258'h399d85badd9182d5e2c673b03b23b847b9ba88901c4f5ec3dd9602910139f804b;
      expv[11] = 258'h337606397f750c62d496ba2e4a40ae53d9b2ca0647a9ea2e4c2b04d4058d2053e;
      expv[12] = 258'h09381361745462f5e8b4781cc1c44435bf4b9a583807a3d9ab69fc504fca04857;
      expv[13] = 258'h0791ea30a837193256cbf5682dce9a0fee6e58a1b616083454815daef39c75928;
      expv[14] = 258'h1cf95dfe0e477946385e2cea496ff47884f6096cc7fbcb1a21cbb4f4d095e4deb;
      expv[15] = 258'h15a2e10e7a4d5878d27d26180fb887658b02c2227feec33346f299a9dcec0f921;
      expv[16] = 258'h09952e6f247e9d2eac2d4c137c8aad0f23cddebd173bdee516604174c1c4b50ec;
      expv[17] = 258'h3ab8885d393bdfa15553421ec3d505a3064bc3b339c1a694f994ac96ee5fc4cc1;
      expv[18] = 258'h3ab8885d393bdfa15553421ec3d505a3064bc3b339c1a694f994ac96ee5fc4cc1;
      expv[19] = 258'h3ab8885d393bdfa15553421ec3d505a3064bc3b339c1a694f994ac96ee5fc4cc1;
      expv[20] = 258'h107d143be3f0270e6d9145d3e1bf28229cd7678f3ec129fd4cb9695a32c88b994;
      expv[21] = 258'h33db69fed5000e89d3fe09ef6273bb81906538c0bdca40eb16d915a65170eb865;
      expv[22] = 258'h315a1caa0cf376cd6adce61e8e9e27e820cc5f784d37da8ab37de86e6c11a1c07;
      expv[23] = 258'h1c18ba416c837ef8a21b6f602e4c543393f77ee04307bcb76bb4b5ced57b940a2;
      expv[24] = 258'h16c382f80d5595e9e129b89fa0fafac25829b5bc6715312c2a6d53d4dc9de2367;
      expv[25] = 258'h1ac6bc138a365bfa3b32a3052b30c1c7b39f31538066743de7fe5ca1bde4c4fd9;
      expv[26] = 258'h352cb2f5e471cfa6b297e7a9722ddda6f92bdfb49a7e5fc76b5199e9114f38d53;
      expv[27] = 258'h17111af6b29316b3bb2b1cb418bd98fea8a323b15befb1cf1a19d7b0710cc1595;
      expv[28] = 258'h0a2e6095e5fe264486e7b96d6ec615d7f055200627182461e2183313851af6483;
      expv[29] = 258'h3dc2478baea44c8a0d9c932d12ad74bf17384d5fb6e1f31fc2be4b502c26a7517;
      expv[30] = 258'h1c431d3abbcf818d81930aac743cd7d5a647cf03fda6082d66db05cc287fc0878;
      expv[31] = 258'h3a27fa1075c96410a1cda34dbf6eb2412be23ff8597536b506b00505e6b3bdb3c;
      expv[32] = 258'h3c949109af99163101646bd093ad93954683cdfb70acb5909bf7f766cf9fd818f;
      expv[33] = 258'h164a8085de75ed5206e9c62073900ab805f993c51b10f1eaa5e09c474a877dacb;
      expv[34] = 258'h099da05d20167176a63ca63aeb0d8478a3470be37e9bcf8ccb650fd59f35ba72a;
      expv[35] = 258'h00e43c63df6f9b3c7189f06d77243142aa55e7bccf674954b6cc1ab5e49ddd914;
      expv[36] = 258'h3d55a3381174893adf26be9f58e0e6ada2f1d13da1bf1983f7c38d75152e7c5cf;
      expv[37] = 258'h3d55a3381174893adf26be9f58e0e6ada2f1d13da1bf1983f7c38d75152e7c5cf;
      expv[38] = 258'h0c70bdeacefd5dfb841af49a26c47fb25f2d3e963e7f94c718d3f454c984dd3a5;
      expv[39] = 258'h3c4d6c5594d8649fdec98d49fcc241b796b1ac28d066b0159c0de3f1ed23639a6;
      expv[40] = 258'h00a24f3659d9c53ba01b17521e5913e658c18424d5822da63296942bec2cbd7c4;
      expv[41] = 258'h3e053a1b7bbc2bdbc8374a5ee3fa9c7a70820f7c7eca582b59fbd54233fcfd1c5;
      expv[42] = 258'h3662f250df32775c508d54193eff1ee82bc039fa0eaaa27b29aef49488b044c78;
      expv[43] = 258'h37bf8b1df9124e02d38bdd96849e9ca9e6cd5bd70c689683b88338c23d34a061d;
      expv[44] = 258'h37bf8b1df9124e02d38bdd96849e9ca9e6cd5bd70c689683b88338c23d34a061d;
      expv[45] = 258'h37bf8b1df9124e02d38bdd96849e9ca9e6cd5bd70c689683b88338c23d34a061d;
      expv[46] = 258'h37bf8b1df9124e02d38bdd96849e9ca9e6cd5bd70c689683b88338c23d34a061d;
      expv[47] = 258'h1c8e8377ec2ff34d9f07e6830f4c027a02c9d181746bfde9116d4d216920b36a9;
      expv[48] = 258'h3642733057942bab6fc0bda3f1f89755550550e159c3e22c6824ef83ac75f1353;
      expv[49] = 258'h3642733057942bab6fc0bda3f1f89755550550e159c3e22c6824ef83ac75f1353;
      expv[50] = 258'h3642733057942bab6fc0bda3f1f89755550550e159c3e22c6824ef83ac75f1353;
      expv[51] = 258'h00f16c9609511c2b01f44f75adde36b8d8727ce69dc7941c0616d45a46c5efc75;
      expv[52] = 258'h32d27483227334f1fb46070d74bd86496ac543db8d09d54896fd1d62ecb67864d;
      expv[53] = 258'h32d27483227334f1fb46070d74bd86496ac543db8d09d54896fd1d62ecb67864d;
      expv[54] = 258'h17479961bae3e7db884f1eda93928e56ff47aab1c0afef21fee47de110bd5f413;
      expv[55] = 258'h37a2ecbaae2738a4a51bc1fd3a984dc13f322bebd55001a62de90bbea46dea145;
      expv[56] = 258'h37a2ecbaae2738a4a51bc1fd3a984dc13f322bebd55001a62de90bbea46dea145;
      expv[57] = 258'h09a862dcb224ff7362910bb6cb66f73b6689c76a0dcd95351490c3e351b9f133d;
      expv[58] = 258'h306190085c555854e4851b16a9fb20352e57f21ba4e10e482ee2a44b1989e886f;
      expv[59] = 258'h306190085c555854e4851b16a9fb20352e57f21ba4e10e482ee2a44b1989e886f;
      expv[60] = 258'h126133f1580e7864d2d9fc6c165f6e61409551bb1991c5c65580c81368f2d3695;
      expv[61] = 258'h06f831c1e2f3e509469e0c6e6642367e18627bd970b32a78585352dd514b876fa;
      expv[62] = 258'h0eadee3c8c31d4f63974a624f446871d77ee3f4d80362f0d7e202bd704316af57;
      expv[63] = 258'h364764f49979c146d85809592da278ec25d69fb8337cddef292289539a70c86bd;
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
