// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 210;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_175589 dut (
    .i_clk(clk),
    .i_rst(in_vec[209:209]),
    .i_start_en(in_vec[208:208]),
    .iic_data_bus(in_vec[207:24]),
    .iic_done(in_vec[23:1]),
    .usb_done(in_vec[0:0]),
    .o_iic_en(out_vec[10:10]),
    .usb_en(out_vec[9:9]),
    .usb_data(out_vec[8:1]),
    .o_led(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 210'h21d89c0fef2da910455b124716da0d392f522672270c379483835;
    stim[1] = 210'h3fda932a3dcc6aa0348ceab21baf83bb8c42aa5c154a9d810a5d1;
    stim[2] = 210'h18c7b6ae5b769a1627aaae4d9e8f2d860978f3760d1815c380220;
    stim[3] = 210'h094cc865ddaab715a15991480352fd5c175cc11f198235da645f0;
    stim[4] = 210'h05667aeaab7d00fa16be744563297458cf3b1de3657ff84a5a9db;
    stim[5] = 210'h0c4dd51267a32f12124a39a514446a364206c91628d737444e289;
    stim[6] = 210'h106c964d0573ef3aaa25a3428b89ec6ef1c793f9b98c8a38623f5;
    stim[7] = 210'h0ff047266c78f505ced424b6aca275a6e9af7ca8f600da6592832;
    stim[8] = 210'h0010fd01b491618ab479f6edd458dfbe5ffa202d5145c27bdd232;
    stim[9] = 210'h0756ecb8a72669600a408667ef1242bc80a95e278299adf297472;
    stim[10] = 210'h184ed6cec884cabe6d4177429481fbba5f59c2f7200d493571dea;
    stim[11] = 210'h07ca11664afa79a12ed672a9b18119acc90657e36e46b5a2802f7;
    stim[12] = 210'h03cf9bd6309acf21774c525f02b2dbaba29c482536f6f36b12a79;
    stim[13] = 210'h03e9885b1a2560cf6a8f92c34439799c6ec98dab31dd5d09a9235;
    stim[14] = 210'h1082d556790d78b0e3bc1f8cb6e5e99de5c5d354661b8d75f6a9e;
    stim[15] = 210'h042ac0b9f13e136c9cacac93e25762a79b8c5b518012da499e424;
    stim[16] = 210'h05a9f09592a3db7f0d22eb291a5234b8290684320966323288699;
    stim[17] = 210'h1c15f40626b4137a2fcc99690077b597da1022653c70605c27a1d;
    stim[18] = 210'h0708b4a5a1382447f76c03aaf406f50d6008591c86a25460f8714;
    stim[19] = 210'h101810b61bd9d2afbfe7f7ab70267f3e9bfb59bd05ae25154603a;
    stim[20] = 210'h19cb42df9e4b5b5ec4219f346c5f19b5e3c1ea506127ecef8c50d;
    stim[21] = 210'h0e4c64a370fa0ddaecced9f695fb2e2e9dce7dd3c9bfa06f45292;
    stim[22] = 210'h00e0ce1296eee3a75670ad369c2d51cf0ffb98cf53e2b7cd978eb;
    stim[23] = 210'h1e04afce318addd566595b03c2ecfc21b48885c01566a328d12b0;
    stim[24] = 210'h0e7cbbe74468897aaa539b12120e2455bdefceb7263a861f361d1;
    stim[25] = 210'h1e2e2c0c56683a8f6b09cd3ab0bb91982cf8a5a256278f4fa2c3a;
    stim[26] = 210'h1e9346bbaed59e560d2ad06f950953ef83e68d21a6debdddd51c8;
    stim[27] = 210'h02203f729a8f1aba130ccd0aa7f326499b03378ec1cfc2b862e5a;
    stim[28] = 210'h09d10ea71256af357f8276474540500af59800f2e92d620e2663c;
    stim[29] = 210'h0f1fa95d718675068ab4aac1a564b843a32d3d4aa90c5cc421afe;
    stim[30] = 210'h1048f69de48f2ddd2a85a28aeb75ff94ce27d8e586b89c7fd42c1;
    stim[31] = 210'h1eca6e9ee7044c470de045515636129cacc89507a374a93c8bca5;
    stim[32] = 210'h1c2e126d71b4ec51abb39742b2f220fd0d01426cb54f963eda909;
    stim[33] = 210'h18a586df55086067829588ecedd5e287a59d14f9c3aa8662f1d2e;
    stim[34] = 210'h0a9f0b7286d9b9bfdbdb7a0f1da5cbdb3b1d3406ab12360d2bcd3;
    stim[35] = 210'h110fffc86bc7bba2bb28d5cb3733d487e4defe19c8f0651f70d47;
    stim[36] = 210'h14454044a5e7a2754c59052e1a760609081bc540daf6393980ce1;
    stim[37] = 210'h186f662cd87dcc44ed38534da16003a69501a3328ac91a916d840;
    stim[38] = 210'h04701f00fcd83226a4cf8b8fe9f6d6d5af91fc3d76cb56602badd;
    stim[39] = 210'h060844ffc76fdc9973935c8c6b419e5c8fd63f0af76a05d2e82e7;
    stim[40] = 210'h1eb60ebd0ec51c444ab7d67a0a724c9e853acc606ac78bca44b96;
    stim[41] = 210'h136690db813a6ef972b15718440380c9a46da9a45ec84e3a178ce;
    stim[42] = 210'h0490bf873dceccd5337737833b2da84b5451f18ccacbfc5b6c958;
    stim[43] = 210'h1d3f12203f37c171fa22803f1c30e8b78b0a00db018123f9caa89;
    stim[44] = 210'h180c66a9dd56ff9644fe902753bc7d0d417d34968950fde3c9890;
    stim[45] = 210'h0ca6e7773601bf26e7d182c6cfe407a6d94242f8e0efff7720ec6;
    stim[46] = 210'h10dd159f1c9424e9293d5511ec405cefffec3ae479bf1e63066e6;
    stim[47] = 210'h1e65d5b318ae7a9d3e9422aaf211f9600462b330b6cc7dd2f1848;
    stim[48] = 210'h1afc66017d8f69527542c777e59f11f35416aa1bc9d2f05dec287;
    stim[49] = 210'h1804480d9fe94e2210556500dc9e7f4550cb20204c1684b674bd6;
    stim[50] = 210'h1a414dec79c171f85e3efa1890cc53c60b3b7e22a4a3f38119368;
    stim[51] = 210'h0cb20af69bb7a24f17805688687cec1b80d0a44228bd89b4d90bf;
    stim[52] = 210'h1f9dfecf38592746f92550bf8e188a7915cbd32413793b1c2dbef;
    stim[53] = 210'h1db48aa5fe62416a31bbe506cfb27565575d8dd263b8386084c20;
    stim[54] = 210'h0e857fe6e38fa7d0f6c0c86a99e5a30f445c718258bf892a807d4;
    stim[55] = 210'h1911cc57872768a66a47d1ee2ebb7fdf85a94215d8a4c7c66ca47;
    stim[56] = 210'h0bc2d1eeb740909e82e63f8e03fc1bf27cbc1c15b173b0c33a717;
    stim[57] = 210'h0fbc08c595c34f095a547b4c8dcee8c1d4ae65a016d43e6aa2edb;
    stim[58] = 210'h189befdd4f139cb1982fb673cd7ec20bd9b6381a3d15076a178ef;
    stim[59] = 210'h11ab03b652aeacfc6091de8c8a66cab9524c8fd8d28efb4739ecc;
    stim[60] = 210'h08f8827af72ee9efdc2eefb19934e97783c8499b1ff442121d154;
    stim[61] = 210'h1dded09ce05f07f774ade2e2544f6ae24d85cae897d9271096b11;
    stim[62] = 210'h0a0d316252f6c9f74e9413998ea9cc8fae04328e76a000ffd8834;
    stim[63] = 210'h0b061331dc26a594da2e0a96bc6385c7b033299ab93b364f15dba;
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
      expv[0] = 11'hxxx;
      expv[1] = 11'hxxx;
      expv[2] = 11'hxxx;
      expv[3] = 11'hxxx;
      expv[4] = 11'hxxx;
      expv[5] = 11'hxxx;
      expv[6] = 11'hxxx;
      expv[7] = 11'h347;
      expv[8] = 11'h21b;
      expv[9] = 11'h229;
      expv[10] = 11'h2f1;
      expv[11] = 11'h25f;
      expv[12] = 11'h25f;
      expv[13] = 11'h25f;
      expv[14] = 11'h25f;
      expv[15] = 11'h25f;
      expv[16] = 11'h65f;
      expv[17] = 11'h25f;
      expv[18] = 11'h25f;
      expv[19] = 11'h28d;
      expv[20] = 11'h3c5;
      expv[21] = 11'h225;
      expv[22] = 11'h279;
      expv[23] = 11'h319;
      expv[24] = 11'h319;
      expv[25] = 11'h719;
      expv[26] = 11'h319;
      expv[27] = 11'h319;
      expv[28] = 11'h257;
      expv[29] = 11'h3ad;
      expv[30] = 11'h321;
      expv[31] = 11'h2b1;
      expv[32] = 11'h2a1;
      expv[33] = 11'h2a1;
      expv[34] = 11'h6a1;
      expv[35] = 11'h2a1;
      expv[36] = 11'h2a1;
      expv[37] = 11'h327;
      expv[38] = 11'h323;
      expv[39] = 11'h2d9;
      expv[40] = 11'h35f;
      expv[41] = 11'h38d;
      expv[42] = 11'h38d;
      expv[43] = 11'h78d;
      expv[44] = 11'h38d;
      expv[45] = 11'h38d;
      expv[46] = 11'h3ef;
      expv[47] = 11'h3e3;
      expv[48] = 11'h2d9;
      expv[49] = 11'h379;
      expv[50] = 11'h205;
      expv[51] = 11'h205;
      expv[52] = 11'h605;
      expv[53] = 11'h205;
      expv[54] = 11'h205;
      expv[55] = 11'h325;
      expv[56] = 11'h299;
      expv[57] = 11'h22f;
      expv[58] = 11'h203;
      expv[59] = 11'h303;
      expv[60] = 11'h303;
      expv[61] = 11'h703;
      expv[62] = 11'h303;
      expv[63] = 11'h303;
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
