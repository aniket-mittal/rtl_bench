// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 150;
  localparam OW = 74;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_021350 dut (
    .clk(clk),
    .reset_x(in_vec[149:149]),
    .enb(in_vec[148:148]),
    .In1_re(in_vec[147:111]),
    .In1_im(in_vec[110:74]),
    .In2_re(in_vec[73:37]),
    .In2_im(in_vec[36:0]),
    .Out1_re(out_vec[73:37]),
    .Out1_im(out_vec[36:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 150'h31abb7df6503ece3f7865757a5be50e15d0d22;
    stim[1] = 150'h34deaf699191eda8e0d98dfb27fe6be973c37b;
    stim[2] = 150'h02451357d43be5d2afdef7e43e98e903109c81;
    stim[3] = 150'h1a17ab493122e36d0b468aa720b352e3ac657d;
    stim[4] = 150'h2580ea2c89b9c42d25f40971f3b0c70ae2f947;
    stim[5] = 150'h0a9b88285994d17df0832362a0c4c6bc471cba;
    stim[6] = 150'h08edc986b021157242a67477b3bfd872952791;
    stim[7] = 150'h0e410400cffa2e630e80fa122f00019bff5469;
    stim[8] = 150'h0eef4d55233fe9e1e2421398f9a9e20f1a912c;
    stim[9] = 150'h09e37283674776f4882df7276cda710fa72d36;
    stim[10] = 150'h15cacfa0b4bccf6ead81514b31f0cb84a99741;
    stim[11] = 150'h10d31a8b3a28153ca9e17adb951503b5b942ee;
    stim[12] = 150'h05c262ea449a00c0c7d1189f02e2c4c3ccca0a;
    stim[13] = 150'h1d62f5880d7455c5f446d586ea48ca42ae034e;
    stim[14] = 150'h0ff3ff27c619ccb10cb33f74f25c172da0e979;
    stim[15] = 150'h179547341cf3bd48f4a4b17cd6000882afd132;
    stim[16] = 150'h1389457fc7b1be87f345c070091688ee6a8a1a;
    stim[17] = 150'h1cb726578d6261d421112502d35ede0a1034dc;
    stim[18] = 150'h1a6f3e939524b6b3f3593a081c1e5becc3e994;
    stim[19] = 150'h0a91a80d12352a7f309ccaeca0162d2dfa8f07;
    stim[20] = 150'h1431de288ea55eb590630ff641b08f5aa4d4b0;
    stim[21] = 150'h02df528781999e393f3562dad1c194214082aa;
    stim[22] = 150'h0b0069b3b2200dc8634ca3bfc20c6155b896d6;
    stim[23] = 150'h11cc221153d023463ebade4ca0fc6f9797f9c9;
    stim[24] = 150'h0707536b81b585fbcd240124c6cec7f9174791;
    stim[25] = 150'h1f19bb521a2037584c8b97b74b8c42e653d34e;
    stim[26] = 150'h133c215c92feddee76b994c39ba2a1ba55a40e;
    stim[27] = 150'h15c4f44f8378d822349f85131d543058cc0868;
    stim[28] = 150'h0c95fdc605f02fea0da1c8c76aa8f556bd8012;
    stim[29] = 150'h123a4e80b9329131112fbb861e24d001f89be1;
    stim[30] = 150'h105eb11430f56ae007c33813fc8a410e79fe2e;
    stim[31] = 150'h08e81f43ff3a42023611d497afe19bb2127074;
    stim[32] = 150'h18fbc91d81a6b71b6c31301b5e4f22ea140009;
    stim[33] = 150'h0cc6170f2a4647d7eb9faf977c18ab0070992d;
    stim[34] = 150'h0513e39f1fb5c1de6f5315d16c330931b2bb55;
    stim[35] = 150'h04032bafe3247c5ec2c4ccde13430cda28390f;
    stim[36] = 150'h09c476387de712c863cc974889d57a65166069;
    stim[37] = 150'h1aff24c7e277fad8d9a994ea0d27d463095e66;
    stim[38] = 150'h1cccc1a81b2805046702e98df3923ac68b1821;
    stim[39] = 150'h1b8053b72b445fe4ff67a614209d7b3d70156f;
    stim[40] = 150'h0e601be934b246dd294818c98b531fabc7ef8b;
    stim[41] = 150'h0ffae0117fa8e066ce6cb7e723c7a04370d45a;
    stim[42] = 150'h01f9b4b974ebc7ae169b6121dafe85825ede93;
    stim[43] = 150'h07c8fad9719dbfa9a4c49807a35fc3f2c7a878;
    stim[44] = 150'h09ee9d27ab27288c2041ff21eb98e3dfffbedd;
    stim[45] = 150'h0c32954179b275656a7f5fdcbf7c520ed11879;
    stim[46] = 150'h0f83e5a8feecbd8755121bdea6bae50b512852;
    stim[47] = 150'h05220392bee235e77d1dcbf9c70c7c9e293e93;
    stim[48] = 150'h11379b1e4e77762f5612e86c8c99988e68577e;
    stim[49] = 150'h1a35e94d74c2bba2d02c085923d16be85bbf4e;
    stim[50] = 150'h1b1469d4bc2ee02ec0e806690d6631c0386559;
    stim[51] = 150'h163b9ca7c2fdd25fe1f855fea66bc69b5bcfd2;
    stim[52] = 150'h0a4dae6235dc800a5b987a1dc693753d5985df;
    stim[53] = 150'h0ae08c16d8ed9077b85ba5ed318d5e58f8d32d;
    stim[54] = 150'h1c50f3a587136f5ab1edd726d10951128868b9;
    stim[55] = 150'h10d1f07e78f4dbe2c220d82f6146107799561c;
    stim[56] = 150'h0492165a2e5d84d0106b0a07fe7f4805b69d99;
    stim[57] = 150'h1f84135f968fbb298ce5fa575a1284b6bbb488;
    stim[58] = 150'h090552f880a613309e37c1c021876fea885e2c;
    stim[59] = 150'h0092ca05545d30c117b57dc998a01e04d550b0;
    stim[60] = 150'h101d4bb722a3bb05ab22c2f9cea26dccb1982b;
    stim[61] = 150'h1945987b9af561a7cd7e5d23858022e5c6d6e2;
    stim[62] = 150'h1614edd19a153cb34c45f16e0ecf04ce458e55;
    stim[63] = 150'h1fe6bdc6b438be13c0d9bcf82a0f007efca0ca;
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
      expv[0] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[1] = 74'h18dfb27fe6be973c37b;
      expv[2] = 74'h2f7e43e98e903109c81;
      expv[3] = 74'h28aa720b352e3ac657d;
      expv[4] = 74'h00971f3b0c70ae2f947;
      expv[5] = 74'h32362a0c4c6bc471cba;
      expv[6] = 74'h27477b3bfd872952791;
      expv[7] = 74'h0fa122f00019bff5469;
      expv[8] = 74'h21398f9a9e20f1a912c;
      expv[9] = 74'h1f7276cda710fa72d36;
      expv[10] = 74'h1514b31f0cb84a99741;
      expv[11] = 74'h17adb951503b5b942ee;
      expv[12] = 74'h1189f02e2c4c3ccca0a;
      expv[13] = 74'h2d586ea48ca42ae034e;
      expv[14] = 74'h33f74f25c172da0e979;
      expv[15] = 74'h0b17cd6000882afd132;
      expv[16] = 74'h1c070091688ee6a8a1a;
      expv[17] = 74'h12502d35ede0a1034dc;
      expv[18] = 74'h2acbc044b6b209f94f4;
      expv[19] = 74'h0ffb342e4b73349b97f;
      expv[20] = 74'h344bce47f195ff3ff28;
      expv[21] = 74'h0bb9833c4d136b1ffbb;
      expv[22] = 74'h3fc7d240fbe6b2a13e7;
      expv[23] = 74'h2370a02ffacad0976da;
      expv[24] = 74'h1e67693d5e4e86984ba;
      expv[25] = 74'h17d0918937fd5a61077;
      expv[26] = 74'h27714fb948e29f7a0df;
      expv[27] = 74'h2b2dcb33768f14110ac;
      expv[28] = 74'h064970f8e3e846a7ce8;
      expv[29] = 74'h25755c30a192fa598b7;
      expv[30] = 74'h0448b86adea66276246;
      expv[31] = 74'h247a034366fbae40022;
      expv[32] = 74'h1a323e2a416f2e58fb7;
      expv[33] = 74'h37606509f330e46ac4f;
      expv[34] = 74'h2dc4040b9913f88ce77;
      expv[35] = 74'h0934ce7c994e7fe4c31;
      expv[36] = 74'h05db75e5be272ec738b;
      expv[37] = 74'h15b58e1ae5c70df7188;
      expv[38] = 74'h3b8964ab6da7e06b5cf;
      expv[39] = 74'h11751347e397378a296;
      expv[40] = 74'h0a75d2b814c501433d6;
      expv[41] = 74'h1467ac3f5ece7bd18a5;
      expv[42] = 74'h3efb57b2cd226ab22de;
      expv[43] = 74'h1269b438e109713ecc3;
      expv[44] = 74'h28db58bc730844c0328;
      expv[45] = 74'h3ee705faa9eb31d5cc4;
      expv[46] = 74'h2aa7246e931af9d6c9d;
      expv[47] = 74'h25a8d673aa9427582de;
      expv[48] = 74'h377002cc7c532b49bc9;
      expv[49] = 74'h0200568dd894313c13e;
      expv[50] = 74'h2455b54c69b6dff4065;
      expv[51] = 74'h315c7d864449a12063c;
      expv[52] = 74'h3ad4e309a3f3e9a9f9f;
      expv[53] = 74'h2d91d9b94085a39eced;
      expv[54] = 74'h10a573b101b13c98279;
      expv[55] = 74'h3b8444f10c18f9295f5;
      expv[56] = 74'h357eec612c5e342731d;
      expv[57] = 74'h2483e21a60294478a0c;
      expv[58] = 74'h24f3a74e48099711237;
      expv[59] = 74'h00b43ebfd2eb3be04bb;
      expv[60] = 74'h1507421ff9e7b9a4c36;
      expv[61] = 74'h1223dfaaf2e9dd2871c;
      expv[62] = 74'h3805538bfa442dd86d3;
      expv[63] = 74'h0d1351370c55ad34d45;
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
