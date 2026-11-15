// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 269;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ct_spsram_2048x128 dut (
    .CLK(clk),
    .A(in_vec[268:258]),
    .CEN(in_vec[257:257]),
    .D(in_vec[256:129]),
    .GWEN(in_vec[128:128]),
    .WEN(in_vec[127:0]),
    .Q(out_vec[127:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 269'h05bd8f3efc86e036f771858735d38a4be26c46f918d23cc24c18a5d709b818aa2766;
    stim[1] = 269'h003c7a117c957b8da182720263d7c08a42ec5ed1879dee8218d130a81dda60a009ee;
    stim[2] = 269'h0420c61a7e62b3da7bf2f161c8442412066abb2be8d0e5b59f17ca72d191b079c17e;
    stim[3] = 269'h00e81ddbbfd3366c93c558fea08ada2cf5e3ba502cbb96cdc9f0adb00ef79b8cb772;
    stim[4] = 269'h1c4e760063e89537c5344955114c9ee4a530f19e59d41c526c2b474fb32f5c664b01;
    stim[5] = 269'h0475163a47208294cdb0a62e9241e1d4d4b627d9e3f5885b61123be73c35e0345a80;
    stim[6] = 269'h17df53418d383fe5aeffca127d9127511d81ea1c4a86ab2ea241f893cc44a690fd44;
    stim[7] = 269'h0d1d44432d172ca5e82ffc7dbe59f2bccbddbd83382a4ca88987b0e69fb1433d8f11;
    stim[8] = 269'h0f23f30c5e7c2d42075b15123bce8f29f38bec3c3b9e31e465e86b59791f02d16b48;
    stim[9] = 269'h01b8805885f01ce8c9ac9298c1591aad65622a08640b4ff04d077d0b951b78898b1a;
    stim[10] = 269'h08a9e39e710f0dc3d958e1be184f3e22aff0f5279ef9350d8c3c320d72a1d34591ce;
    stim[11] = 269'h10f1e60ae9bc3b4158377dddb2f9d90f967fceac21529e048efb3085f80877475b1c;
    stim[12] = 269'h06a4a3b068497c1b7fa277e2fce6228682577f643accaafaf3d67b422507fbb678f5;
    stim[13] = 269'h1b2fce0545eeca539f885aa9f0644f09442ef58443cb3dfeacd1c4f51b17611ab615;
    stim[14] = 269'h1e61569628a37bbf69121cf8d63e736de228d29793efc93f1ab60048f91cf2528832;
    stim[15] = 269'h11716e6477eae738f9613a12679e373f99960b3d370993e30782ac0a4167c43ce9d6;
    stim[16] = 269'h0692586f231fb12e8d9b07095471a2fb6ab54eadb40eaebda0b4ead0995f93754a67;
    stim[17] = 269'h1a0baa7293b9d6c995216218b7c0a806eead075065a4f55d0fbb835d803c0f5456c6;
    stim[18] = 269'h0edfe222935cdc7861aaa8a528584369363129b240f1f318d9364be1c3e110e95ba8;
    stim[19] = 269'h0e435973f7041c990f0ff3afea0d2a072108871a92f5b547e0d2f4df7d797b970171;
    stim[20] = 269'h025c517b7c935fb81b81c443183793515e279d22f49e681380461a772ea5235a0c82;
    stim[21] = 269'h14d05238cf0e1b0fc7cef22ca002e8bbb208893a796c03fe01d1ac87e6b279758f87;
    stim[22] = 269'h190517ceb6d7f5e34ca4cee7dc855c6c0f719ef33710a5ff46dd3db501ff32a795f8;
    stim[23] = 269'h028d9f4e63d92265b9e329baad3872ee24dfdb87dbfc6eb02976589711c0bbf05698;
    stim[24] = 269'h1df3764bff609192f771b17511e5a03fc45c888c25a58d2e35c0b02a3654ab06b315;
    stim[25] = 269'h1efb9b3c3a9c0af5250af65675aa5c9850df5bd7d3ce6b036b095a602837fe43ad21;
    stim[26] = 269'h0050644f65a2f76ea5b6cd8097e6ea1b1fc14215e0d2fa804e8a23467ca4bb24c78d;
    stim[27] = 269'h18b6f7bf06969e705a67205a546cc1b54fd8465e50159fe317e04286e52932f9c0b4;
    stim[28] = 269'h1de1b4ec640209e005f7787c1ad76041104588fb4183307b380b0f8ea3569de39eca;
    stim[29] = 269'h08f56bdf7cd7064a4f15e7380b8154d5d1d2e2eff9b954af0544684ecbfe63e9a38e;
    stim[30] = 269'h0ea136b3116944e7da111821e88b7781fef0e9a42ea817b47292d466fcc85f701f8d;
    stim[31] = 269'h13d253db8eceb4c5eb8c13375fc7519300d444e009d60800d8452844b25662f9168b;
    stim[32] = 269'h18d86e99c99fee3e5e6da54a49491be61b658f722655489b096c63f651da21262e99;
    stim[33] = 269'h07ec7ab89d0a0cf0c8e8e7b81f459071e64374a082d248123da080bb15952f714e0f;
    stim[34] = 269'h01f8d4ef0111680eafc7a70ad3b74cc5e64a05b714ec663d67ff0a314bef7b127fa5;
    stim[35] = 269'h05c839ae02b0bf049b721368f69714ecb026632d424e980cc36d3024ccecfa472367;
    stim[36] = 269'h149bdfe252479a6e0c718399018366ecda4c0056b244846e0d76782bc5a1089eb6ea;
    stim[37] = 269'h097ff49999b74c51dade004307c8487f94f4b2aa4f1a2b69a4f2095c0ae0d5cbda90;
    stim[38] = 269'h1f11a14afe43f766c9f28195a73362f20658fa91a4955e1d56d3578ef882a8d902c2;
    stim[39] = 269'h003f2c5676dce66e343737949b80aa72ab8c75d476d335a8e761430a703200240317;
    stim[40] = 269'h022f8dbd0929a7ee63f6515312fbf80efd2143c9b68abdfa74cf7ff0c49250dce04d;
    stim[41] = 269'h0a1b0f39bf8993cf14fdd6666f6e72d3a3d99a5663c905668236deb085009cbf8fef;
    stim[42] = 269'h08ee0aef54063c54934e3d8bf235ae45b3d5c1c663c8f49317f7cbda490a2bf8c184;
    stim[43] = 269'h1bb3dfa0678585f67c0ba56fb9365c03da5ad4b83267ae0a7786e1cea4d104ee952f;
    stim[44] = 269'h167b56d8d4f0e014863f33a9b47bdef78a035ec3beca493e4c0d3762236abf63d8a5;
    stim[45] = 269'h1ef4e927430b9191f9950657200d9fe11ccf9a767c63e10872b859e3c849249cd493;
    stim[46] = 269'h0e9fc562d24391cb59413dbfd66ed541296a1fb18dd5eeb78a011c5389ca1e52babe;
    stim[47] = 269'h1dd521245e1725307e0f5d0ae073629be1b4dcba28a8f4573b6aae4f62bd1693301e;
    stim[48] = 269'h05a115a15a6e5e1af2ba16aa004f66dd4d66d7ae95afc0f9feff52f2060491bfec93;
    stim[49] = 269'h1b6b6711af72bf2a07ec2094b201309fb976aba0f1b6a6a005b26dace22bd00758a1;
    stim[50] = 269'h1e3b96aee6eba1ec1f2f2f6860999fc7b4e65d73abbd5fc0a83f0d861325b8807a74;
    stim[51] = 269'h035b808bf0dd3885046c0aabaa812fe002475d2cebfa50be358fe2dc9bcdd86132e5;
    stim[52] = 269'h16830d2fc6fef2e021fba50ed69eca46c9b57b7da559a0e0151572d868224af45bbd;
    stim[53] = 269'h14d32fe6d2b59f5deee87b3c097ce7e44b22c8c43786680943708cdbdb31fe5161f1;
    stim[54] = 269'h03feff30e6ab7d9dd9f210536ae0eb23466b584ad11606a7ed6ece4b225e3e326f61;
    stim[55] = 269'h1782322fdfa0890804200a1fc6fb936992fe3a5a9e6a498b653ee7214734602e0846;
    stim[56] = 269'h0955fe4bd22f42cb907301cd77f9db2878bd4c8497b6b3166588c3d33f0016bbd0ed;
    stim[57] = 269'h1c8b0e0162e1a1ed77f24e85f9763303ddac5e5c962756d9f6f9aaf90d435efa2ee7;
    stim[58] = 269'h079b84564c272f4719dd4aead52a792afc805c767d784a10f3ed3f589e90bfe5872f;
    stim[59] = 269'h08f551574987b63d96c023af0463e069c1002a238897f088f439fdd1b3731e76e4d9;
    stim[60] = 269'h08af0467b25fdd7c1aa57dcc405fc6ed8d92b3f25b2489b0c716a4da5568ba98d867;
    stim[61] = 269'h05e24317bd8bb5940344f6e381559a46abcc14942aa54f9cdf21943a8f6f7d9bb367;
    stim[62] = 269'h1e95ba9b03ee83f41568412921c78790381365aed1ccec0b5ffcef8baa3edc43053f;
    stim[63] = 269'h1fb1edbce742ce4706099c5eff919b670f37e070a8bba718aef7aa05e339f09be8f8;
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
      expv[0] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 128'hc79f7e43701b7bb8c2c39ae9c525f136;
      expv[2] = 128'h3d08be4abdc6d0c1390131ebe0452176;
      expv[3] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 128'h8b1d2390414a66d853174920f0ea6a5b;
      expv[7] = 128'h8b1d2390414a66d853174920f0ea6a5b;
      expv[8] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 128'h402c42f80e7464d6494c60ac8d56b2b1;
      expv[11] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 128'hb7323bf5739c7cb09d0933cf1b9fcccb;
      expv[17] = 128'hb7323bf5739c7cb09d0933cf1b9fcccb;
      expv[18] = 128'hb7323bf5739c7cb09d0933cf1b9fcccb;
      expv[19] = 128'hb7323bf5739c7cb09d0933cf1b9fcccb;
      expv[20] = 128'hb7323bf5739c7cb09d0933cf1b9fcccb;
      expv[21] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[24] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 128'h6a778088b40757e3d38569dba662f325;
      expv[36] = 128'h1cd701585f824db909b47b4b8a765813;
      expv[37] = 128'h1cd701585f824db909b47b4b8a765813;
      expv[38] = 128'h1cd701585f824db909b47b4b8a765813;
      expv[39] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[40] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[41] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[45] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[47] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[48] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[49] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[50] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[51] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[54] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[55] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[59] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 128'ha8aba4c3db1ecb6011d78231f034e080;
      expv[61] = 128'ha8aba4c3db1ecb6011d78231f034e080;
      expv[62] = 128'ha8aba4c3db1ecb6011d78231f034e080;
      expv[63] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
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
