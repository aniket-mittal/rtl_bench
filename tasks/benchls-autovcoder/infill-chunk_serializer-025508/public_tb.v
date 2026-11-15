// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 130;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_025508 dut (
    .CLK(clk),
    .RST(in_vec[129:129]),
    .din(in_vec[128:1]),
    .empty(in_vec[0:0]),
    .rd_en(out_vec[13:13]),
    .da1(out_vec[12:7]),
    .da2(out_vec[6:1]),
    .da_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 130'h3033cd4a0e54dbe187085ae849fa9406d;
    stim[1] = 130'h396398d966aaa477c02b0cb749abddee2;
    stim[2] = 130'h1b1b594ae6aafd2f61051ef4f7c8d71d4;
    stim[3] = 130'h1b0814d1b5f46e8723e260bb31bae9137;
    stim[4] = 130'h079f9c465b4bd1940b5d32bf4d88a7b15;
    stim[5] = 130'h14c2ce1bd6fc07d9926d9e73d3edb9e58;
    stim[6] = 130'h2744cfc7a4fe56ffffd8d95192fa3e9a3;
    stim[7] = 130'h001b17e8ef3d357eb8f9208f9b90a320a;
    stim[8] = 130'h0f1bc8581985759a3c87cc794f7d8eabe;
    stim[9] = 130'h01f18aac6c73b197ecb0995ab7ca085fe;
    stim[10] = 130'h338c58dfceb4d49d7845be210dd752334;
    stim[11] = 130'h10f5809efb55a9453ed3129cadf016bc4;
    stim[12] = 130'h0476b6932e06363874339366307271234;
    stim[13] = 130'h117292af66443588d982b4aea0b6d031a;
    stim[14] = 130'h1d74d06abc300e40e86a906b07dad6661;
    stim[15] = 130'h0964555140760c5b95ec7bd0ad6cf4e0d;
    stim[16] = 130'h3111e6937e2a592083c2516115224548b;
    stim[17] = 130'h17472315935b6d27b5f33112fdee8fbca;
    stim[18] = 130'h17ce49fd6be7dea6a63c9bff26cf76e0c;
    stim[19] = 130'h19fa37378159f11201130b774166da2be;
    stim[20] = 130'h04b99613d4a4d8e6d013adf3586122865;
    stim[21] = 130'h106da6b0fd278d50400cb8fe025d93f20;
    stim[22] = 130'h008644cb2c0a72b83ff23e2a6cd315b34;
    stim[23] = 130'h1105203fd6492a1edf49ea496b24a3f8f;
    stim[24] = 130'h050dbc9afab3b26ad5f5867d62a2ed8a9;
    stim[25] = 130'h0d6d37e848161058f4b3b179f9f01cc8d;
    stim[26] = 130'h0687f59f449654035e7bad27f4b050da2;
    stim[27] = 130'h0fe234cd57c5ba1c1ebd99783edc62b82;
    stim[28] = 130'h18151a1457914b49fda85b97ae085c157;
    stim[29] = 130'h0149d9ba8af010e4b93aa20373a5ab1d5;
    stim[30] = 130'h113b5d1c979d35d3e0d303d3292df2dfc;
    stim[31] = 130'h085409e3e507428c2c5fa9553fbbf7565;
    stim[32] = 130'h02d27ccabb731fb9a0d9e6fe8322ca54e;
    stim[33] = 130'h107ab3c354eeb39ef28c147124634e113;
    stim[34] = 130'h126111912441e2a15f3b832bbfe080589;
    stim[35] = 130'h1335a7da1bc8eed487f12c5649bdfd4d8;
    stim[36] = 130'h118ca5400d871075e29ec201b7702c597;
    stim[37] = 130'h1bb9c866eab1f7ad5a9bf9b6e8ef78fda;
    stim[38] = 130'h22ca01406f9fc374adb1824567a9a965d;
    stim[39] = 130'h1cc7ed8a70bff0f6ba9cbc84be02d443d;
    stim[40] = 130'h0b698ef1d92b0953fc7b0ccb204b96445;
    stim[41] = 130'h0b0d0de03e61547b81677b244f8089952;
    stim[42] = 130'h13d46a8724e40da5c06112f11e82867d0;
    stim[43] = 130'h161925fff5c9adb8087382a5051d8b60f;
    stim[44] = 130'h030ecd1a22d57efc24359ebdde9d4ac4f;
    stim[45] = 130'h06962fedb19b8e782352f6ab7e5f51427;
    stim[46] = 130'h009efb4e792b18bd88be9dde2923d8607;
    stim[47] = 130'h060fcc9722b7a485847e657761d07d447;
    stim[48] = 130'h1c44372267ca7b850a1d49f2b37733d81;
    stim[49] = 130'h15c7b9d8991dafac54f738449300ba42d;
    stim[50] = 130'h08fd662f6475da72a4c093360d0eea01f;
    stim[51] = 130'h1d17e2c3225e02525d525bfb9ca8948af;
    stim[52] = 130'h1290d0e74fff7083d6e666529ac8820a5;
    stim[53] = 130'h165126d96b6a7e190612e2c39f58a59a4;
    stim[54] = 130'h0d45a0401b1b4ef816f9b1301a3c69e92;
    stim[55] = 130'h2122e28d7a86d997bb9214f7aa71ceed2;
    stim[56] = 130'h15b77f66b61c1e3701c0031fc0e9ffc88;
    stim[57] = 130'h1979d025f1f85edeab66ce91dc4f995f6;
    stim[58] = 130'h13d3acc65ea7d6168fd54251a4dc5123e;
    stim[59] = 130'h08a75b03c33cae067ef88cf2772f1cb90;
    stim[60] = 130'h11724c297c3549c667a5c59affa5ea520;
    stim[61] = 130'h062146d9f8b8a16dbdc01a720b022592e;
    stim[62] = 130'h11acb677fc67afe0b60d42a2476569d61;
    stim[63] = 130'h32df7fbc7995c7f0da8b22ff616d278c7;
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
      expv[0] = 14'h0000;
      expv[1] = 14'hxxxx;
      expv[2] = 14'h0000;
      expv[3] = 14'h0000;
      expv[4] = 14'h0000;
      expv[5] = 14'h0000;
      expv[6] = 14'h0000;
      expv[7] = 14'h0000;
      expv[8] = 14'h0000;
      expv[9] = 14'h0000;
      expv[10] = 14'h0000;
      expv[11] = 14'h0000;
      expv[12] = 14'h0000;
      expv[13] = 14'h0000;
      expv[14] = 14'h0000;
      expv[15] = 14'h0000;
      expv[16] = 14'h0000;
      expv[17] = 14'h0000;
      expv[18] = 14'h0000;
      expv[19] = 14'h0000;
      expv[20] = 14'h0000;
      expv[21] = 14'h0000;
      expv[22] = 14'h0000;
      expv[23] = 14'h0000;
      expv[24] = 14'h0000;
      expv[25] = 14'h0000;
      expv[26] = 14'h0000;
      expv[27] = 14'h0000;
      expv[28] = 14'h0000;
      expv[29] = 14'h0000;
      expv[30] = 14'h0000;
      expv[31] = 14'h0000;
      expv[32] = 14'h0000;
      expv[33] = 14'h0000;
      expv[34] = 14'h0000;
      expv[35] = 14'h0000;
      expv[36] = 14'h0000;
      expv[37] = 14'h0000;
      expv[38] = 14'h0000;
      expv[39] = 14'h0000;
      expv[40] = 14'h0000;
      expv[41] = 14'h0000;
      expv[42] = 14'h0000;
      expv[43] = 14'h0000;
      expv[44] = 14'h0000;
      expv[45] = 14'h0000;
      expv[46] = 14'h0000;
      expv[47] = 14'h0000;
      expv[48] = 14'h0000;
      expv[49] = 14'h0000;
      expv[50] = 14'h0000;
      expv[51] = 14'h0000;
      expv[52] = 14'h0000;
      expv[53] = 14'h0000;
      expv[54] = 14'h0000;
      expv[55] = 14'h0000;
      expv[56] = 14'h0000;
      expv[57] = 14'h0000;
      expv[58] = 14'h0000;
      expv[59] = 14'h0000;
      expv[60] = 14'h0000;
      expv[61] = 14'h0000;
      expv[62] = 14'h0000;
      expv[63] = 14'h0000;
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
