// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 161;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_088302 dut (
    .clk(clk),
    .reset(in_vec[160:160]),
    .address(in_vec[159:128]),
    .data_line(in_vec[127:0]),
    .hit(out_vec[32:32]),
    .instruction(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 161'h11d334f7ecb29d4e9918f280408d3c04d0c4e261d;
    stim[1] = 161'h1f8adc1ec6b306455917d48a3c00c52ae1ac12128;
    stim[2] = 161'h0858d56073c20b1817d72d005768708c6f71d99f7;
    stim[3] = 161'h05bea8b58d9da6667c4cf8bc979297d6eba86572b;
    stim[4] = 161'h01028fe3ada7fe2dd99ba968f8429a346c22785a1;
    stim[5] = 161'h07c0f12eab8454e1a219cc530b4bda13027e56d4e;
    stim[6] = 161'h05b26895b94e489bdced514f7f63bbf0556269ecd;
    stim[7] = 161'h0fea4d7f431423baaeb6bb2686f1a7e70751ea186;
    stim[8] = 161'h0b4260886023a203a050bf7b8163117c14923e1a7;
    stim[9] = 161'h0c7a68503eef733fae3f54d9302f21ff3fc5b83fa;
    stim[10] = 161'h007bae323b0b9043d1381068f5fdd9db5dd2dede1;
    stim[11] = 161'h0ead22f3ab70e37d68a86daf2f92c0dccaf029721;
    stim[12] = 161'h0de4c8e3b27027ab8519759c97b0096eb1bde9d99;
    stim[13] = 161'h02daa1c1d2b6df2c71a1d4b744bf8c545fe5e7138;
    stim[14] = 161'h0bcccff9f7275ad7896544acaa7343bc4a87b7483;
    stim[15] = 161'h0ea564536b234869cd6e060ceff69967a1eebb495;
    stim[16] = 161'h07f3b5e80321bd4dabcc2097572db858bcebb9541;
    stim[17] = 161'h062dec198eb3bfe4b760246e762de485422de073e;
    stim[18] = 161'h0866293cc64f564a6641cfa3a74d335b572cf3f10;
    stim[19] = 161'h088a98f143dfe17d047843e5e29cbf02596a9d433;
    stim[20] = 161'h0e23d8a7a10f3ea646d3774e3c171e0173ef5133c;
    stim[21] = 161'h0bb94f85e9e827b843139bb90b68ba0b790ac2cc6;
    stim[22] = 161'h0e80567d912ce0b9203516bf9cc2c9adb4760ae77;
    stim[23] = 161'h020c59ab50fdc3af8568c4010c3d637bc83e73ccb;
    stim[24] = 161'h0ea9dd45b2ccd9d5811760eb4e00df907368935aa;
    stim[25] = 161'h0719ecd00919ceafc06d33fc12b1d82d3eabb58e2;
    stim[26] = 161'h0b0b6acc3635282b4af5353981125c92e8203ac25;
    stim[27] = 161'h0fe6a9e91799c63983bd363b6d2b974aef79ddd99;
    stim[28] = 161'h07615c67fcad9c88cd6a33c4a186f9ada8aac6e01;
    stim[29] = 161'h0baa643938a168679070f31abc5962b211dbb1049;
    stim[30] = 161'h0b09ae109c8ab43d94707f239b9e11ef7a4c27b2f;
    stim[31] = 161'h0091384fa128217f0f60432601af0208263e2d244;
    stim[32] = 161'h00b71b40749a13d658e06e826c3936b0f96683ce1;
    stim[33] = 161'h0a1fb6fcab3b06b9578b57d6f9f230faa8dba9bff;
    stim[34] = 161'h0b9cddf41acfbdf57a7d55924ef892c4c50830a18;
    stim[35] = 161'h0d01a21e1e7c8dc3231674a20376879704553fe21;
    stim[36] = 161'h08babda5fb3ae89eceeda6e9ad5d98a5bbfdcd09c;
    stim[37] = 161'h08d62e319350d74464beab0b5a55afbf4d4933a16;
    stim[38] = 161'h027f26177e93ca591a42a840ecc09c90a902d34e5;
    stim[39] = 161'h01dc4557314f1a8ad24a766036c7723312b24c81b;
    stim[40] = 161'h08c62adf65214b6713155aef062ada57aada1bdd3;
    stim[41] = 161'h0a62d9c88487be1932e61b65fd6e237758ec54a9a;
    stim[42] = 161'h02bf6a05895ce15c1dfc2a675b459038e68f9040b;
    stim[43] = 161'h047b671ed6660ac00f73d75e045f4a37d02ad956c;
    stim[44] = 161'h017b5ede54f5378e2f7f3fa2e1472e52a7f48c15b;
    stim[45] = 161'h07594bd222d46dd2b365cef2e3bd4925ee34fa2ae;
    stim[46] = 161'h0f8e6772d00688180f22d96d680e3650d3f1ae538;
    stim[47] = 161'h029e5ba0762c3fe1062db3b6803e172464f484a82;
    stim[48] = 161'h0ffa14ccf0cedfe85d44a499604cf71c2f3ca758c;
    stim[49] = 161'h02baed1415953df8880c99d843ad3461ac5cacad5;
    stim[50] = 161'h05f7e4b9cd7b47748e62212d369f218750a252bd3;
    stim[51] = 161'h0969a02107beb7a2601710c27547d537374d15870;
    stim[52] = 161'h06b2225d513c1db59b3f5df9b535d67b41a31cb16;
    stim[53] = 161'h0d4edc5c14eb05582cf8a5a16f84b346679480c61;
    stim[54] = 161'h08cb468ecc7a1d1ea1a38efa7a0b3524dfb5ddf21;
    stim[55] = 161'h098c5c43db031f1115a737d41cd547c719ba93786;
    stim[56] = 161'h0a98cfaa1fe8bc5eea771512f38768d4bc5aeac88;
    stim[57] = 161'h0d349d04facab572088942e489d9a78b501ead1af;
    stim[58] = 161'h063b5634fe5b7ba53abfe1ccbe94b753242f8df19;
    stim[59] = 161'h0cc667bf8530e15d49c7624e7249ee356f1cb2b19;
    stim[60] = 161'h0e0e7f8f9e4740a3aa618b10c3f54ed00c66b41e5;
    stim[61] = 161'h17cfeb2da66ef6307563eac9a5625947a6e51847a;
    stim[62] = 161'h09e6a2f91d6e9cb9eaa2a08bba717199948ddf48f;
    stim[63] = 161'h04237f75d620d053dafc8c56e89aa18b38919929d;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000000000;
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
