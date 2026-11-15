// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 217;
  localparam OW = 104;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ct_f_spsram_128x104 dut (
    .CLK(clk),
    .A(in_vec[216:210]),
    .CEN(in_vec[209:209]),
    .D(in_vec[208:105]),
    .GWEN(in_vec[104:104]),
    .WEN(in_vec[103:0]),
    .Q(out_vec[103:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 217'h11541d3d627edb7774492f583d7ba81938dd4680a277b3f70b7d9d4;
    stim[1] = 217'h169cb609e0bc9b8ad2b5f8146978776a0e166e319714974ff71ddeb;
    stim[2] = 217'h06dee5b9431a4651ec4afdadcfd930a4ced1cb3d6835a7a1ce2664e;
    stim[3] = 217'h13159a316a711c174baa250dcd8abf589fc1d7b49794556d0c0a15a;
    stim[4] = 217'h02f7791d5d95374cbc3cb53af78b704fb2f172303698552195d3a2d;
    stim[5] = 217'h1e98927252d2906cb71ad40da4ab1976b942502722c91cf877a7d09;
    stim[6] = 217'h094c2bdfd4224adeb7d4c1ac6bb93331a12ccb351d0742673ceff01;
    stim[7] = 217'h1dc2adfe53d7add16c1cfaf43988f822ee1a6131ab3d936241a779d;
    stim[8] = 217'h01e4e235a9bf5c00df6410d47f0a26489cceabd3f56a7d4d5696886;
    stim[9] = 217'h0a18ab299f60f1464aef370316c8dcab0b895a5dc50a8aaf40b424b;
    stim[10] = 217'h1c7355b6c04eaa261a6f3b3e6dd3e832a61448e2533e1e5c6d5937c;
    stim[11] = 217'h16af86973603d9d229d803c29f028903b0f388610b79ecbe4408fa7;
    stim[12] = 217'h1eac5c4c5926190a84879e6e43c0fe74ecb52ef441a81a4a7dd9afb;
    stim[13] = 217'h04611e0fe4b373711a40548243ee0db3d7b664e8736e9e376e95dc7;
    stim[14] = 217'h1a65c8fb99f601d6e567756a73f701dc1a8dd27f166d2d61f6fe557;
    stim[15] = 217'h032cd6b01271efb7c027317970aaf0748d003c587a94eeaaff1ed84;
    stim[16] = 217'h0acd25a3d59754368d3bfcdfdb806da200a7e0efe80ef0bf3ea9a50;
    stim[17] = 217'h113cd1b377a8d20720b3fb264f56e10dc4a3d7e231b499aa720a29b;
    stim[18] = 217'h1de5dfe70dfc11911617217da46cf359a0ad7877592ad4700ffc927;
    stim[19] = 217'h12ecfb01d7fff12504a1d4c4f863849ae156fec760976f684fc7066;
    stim[20] = 217'h183920f3b14e59909410becdb3ce0148db6a194d6c9867a7cc8c672;
    stim[21] = 217'h1be8431a0da30b37d227bea0e5e103a1f21e2ad212d93eea95f7892;
    stim[22] = 217'h1ef6e4bb5e4a926f41accac64342625e278f8aade9275f270f4b9c9;
    stim[23] = 217'h1a709fd21796b828291c1a7bfb56ea426c1fb8e786868c8c80c64fa;
    stim[24] = 217'h1bd096099ff3ade9bbfab5ae90ca95bb110dd5adae0095800d9e7c3;
    stim[25] = 217'h1f626a6de98e30270419e66029a3a3908728e31cff20955c1309599;
    stim[26] = 217'h10f6039d2632d6de48a10c5ff50db0ee733d61104e6a91d75b60d7a;
    stim[27] = 217'h034c38e324f2a226dcc42692ce04fad3046bcd8fe21bc2bac1d14e4;
    stim[28] = 217'h0d56d3687bfc05cb08a7182c28d8f59835de5892cfd5abe55d262fc;
    stim[29] = 217'h04fe84745701fabd4ebd5e14129da60d1ed4fa7bf117d8ebe7247e5;
    stim[30] = 217'h1330768df9767a0cbc504e846d089bea68b71dee47f05435f7c8972;
    stim[31] = 217'h0f5589ed6908db766a5a5f7969352f4ca891bdfe612792d2fe8be96;
    stim[32] = 217'h0a562ae67ba8e8c1f0cb854f7c47902190896df5945b27df3023af1;
    stim[33] = 217'h14b7e7664cb8870053296122e2c6c1ef2bf1b5a21158603ff3b8663;
    stim[34] = 217'h0a722c827bb7a7e039bf11af95fa0a07739699481641d73ca06df36;
    stim[35] = 217'h168f8407beb3ce3e46f64cc67d1d910598f4cb9ac47bd4ab623d87e;
    stim[36] = 217'h0dcdcce4ff53b3327a96dadbffb2fe5ed26d04f941b139de7552d15;
    stim[37] = 217'h1499c838fdaeb381856ffc6242a7dd73ffb59be221308abb9f17672;
    stim[38] = 217'h001de469e57fed5dd506c1595fc396d84d22bb3c91cbe040476c8a1;
    stim[39] = 217'h1faf0b0b392912d29d877fe7ef81f9b9a77a08d32af0475e5a24af0;
    stim[40] = 217'h0fa0c4f6d69ad9b41d63e4822a1f0135755b17a3e84bb1be7e68f9b;
    stim[41] = 217'h14b37ff528a4a27de70960d70911bc15a009bf4631d23bb6c7314cd;
    stim[42] = 217'h0472f4ffc563e04fcec8766fadbb05fefeb1ab75e101a7d89d4ad8b;
    stim[43] = 217'h187b5f4f3fd2747842df4f5b60572b92b3f0df4b08ba4a18bbe3d5f;
    stim[44] = 217'h12cef47cb99c0b6c58100f33c9d8679bc47e86db56dbdec9e1e83e3;
    stim[45] = 217'h026a783c74e563491f68ab88b9a42b35e10e74cb67fae07a90ae345;
    stim[46] = 217'h11ff81376a317cd9f79a88eea7c23a6aea0b65787ab30f4b0d3daf0;
    stim[47] = 217'h092a4e8807579fb700089a4d522058b0f9204b137e0656b07efd96e;
    stim[48] = 217'h149ca459565327769572c0779faeb04a030e1eac2cf531e9b14a42e;
    stim[49] = 217'h173062f9aaa8de0f79e6796259c9366187d78e1e3112368270c297b;
    stim[50] = 217'h038892bb8cab3349efade75919bd715a2de85bcaaa1538d6834ac4b;
    stim[51] = 217'h1e9315213c0c4378299089ad717d9f5d97006052cebd058694936c9;
    stim[52] = 217'h0e1ddafc8ba365d9cfad8525ce18f2ca052a4080deffe70e9ca9bd5;
    stim[53] = 217'h06690d6b6ca58eed19d3b062cf4e83c2b1def2b28f28e44cd60c081;
    stim[54] = 217'h05f7bcf06498264139654a3f077976d40d32fd75d4900dff3939dc1;
    stim[55] = 217'h04eee1ca47cf8346cf38735f804cebedcc26eccf52cc06098fc7ad7;
    stim[56] = 217'h09a79680996aae7f08993ad066b5fe60e96487384901eb285a02f18;
    stim[57] = 217'h10cd8f7dff277ef252f31b657d8aa3a9d263acf3198103117f54548;
    stim[58] = 217'h0f56b11739b2b14494cb8b0c23640714d99a9817414c732a87ef889;
    stim[59] = 217'h12f7e01669e05a09a8bba1fec56c8af934e90fd57cb392f0cd0ee21;
    stim[60] = 217'h157c4932848ed9c6b0ed231377db13d5e845983416e77771aa3ea13;
    stim[61] = 217'h0283eb84002ec7c0c76bd2b13428dbf56437f9b6ce7966926c95c18;
    stim[62] = 217'h1e0ca156ff674606270ece0e5a3372ca072c213c3b7068c21974e6a;
    stim[63] = 217'h0fa6f94679d2b07ef44f58c1191cd65c3c74ca0f144283f86cd27a2;
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
      expv[0] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 104'hxxxxxxx3f6dbbba2497ac1ebdd;
      expv[2] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 104'hxxxxxxxxxxxxx469dfexxxxxxx;
      expv[18] = 104'hxxxxxxxxxxxxx469dfexxxxxxx;
      expv[19] = 104'hxxxxxxxxxxxxx469dfexxxxxxx;
      expv[20] = 104'hxxxxxxxxxxxxx469dfexxxxxxx;
      expv[21] = 104'hxxxxxxxxxxxxx469dfexxxxxxx;
      expv[22] = 104'hxxxxxxxxxxxxx469dfexxxxxxx;
      expv[23] = 104'hxxxxxxxxxxxxx469dfexxxxxxx;
      expv[24] = 104'hxxxxxxxxxxxxx469dfexxxxxxx;
      expv[25] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 104'hxxxxxxx846dbb352d2fxxxxxxx;
      expv[33] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[36] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[37] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[38] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[39] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[40] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[41] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[45] = 104'h77a3e5xxxxxxxxxxxxxxxxxxxx;
      expv[46] = 104'h77a3e5xxxxxxxxxxxxxxxxxxxx;
      expv[47] = 104'h77a3e5xxxxxxxxxxxxxxxxxxxx;
      expv[48] = 104'h77a3e5xxxxxxxxxxxxxxxxxxxx;
      expv[49] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[50] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[51] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[54] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[55] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 104'h6c7befxxxxxxxxxxxxxxxxxxxx;
      expv[59] = 104'hb588b9c846dbb4a65c58611b20;
      expv[60] = 104'hb588b9c846dbb4a65c58611b20;
      expv[61] = 104'hb588b9c846dbb4a65c58611b20;
      expv[62] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[63] = 104'hxxxxxxxxxxxxxxxxxxxxxxxxxx;
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
