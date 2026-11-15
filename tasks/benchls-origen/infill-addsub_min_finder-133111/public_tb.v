// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 97;
  localparam OW = 72;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_133111 dut (
    .a(in_vec[96:65]),
    .b(in_vec[64:33]),
    .sub(in_vec[32:32]),
    .num1(in_vec[31:24]),
    .num2(in_vec[23:16]),
    .num3(in_vec[15:8]),
    .num4(in_vec[7:0]),
    .addsub_result(out_vec[71:40]),
    .min_value(out_vec[39:32]),
    .final_sum(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 97'h1b89037f80d3e699bcbc60002;
    stim[1] = 97'h1340bf025351a023d1a87f8cf;
    stim[2] = 97'h12d3e9b48fd39e39d551be0d0;
    stim[3] = 97'h1aa6fcd117c0643d344926863;
    stim[4] = 97'h1dbf7fa831e3bd6f62341b0da;
    stim[5] = 97'h11c1b8fbe2b84f7fa6d348dc7;
    stim[6] = 97'h13b44817152961beb3103f9dd;
    stim[7] = 97'h010dd1af72023751c7645e963;
    stim[8] = 97'h09d6a12650509d6b7006b86e3;
    stim[9] = 97'h13db9984f8d5992ace63cbf8c;
    stim[10] = 97'h0db0e9d820691bd2ca922586f;
    stim[11] = 97'h15cb18bac3c1dbd4bf6adf5e1;
    stim[12] = 97'h1f73ef87cafa750234a7707e4;
    stim[13] = 97'h097e812b33ceb4ea4fa2315a7;
    stim[14] = 97'h00be789499163c66a49ed3a4d;
    stim[15] = 97'h16394607540ccac1f3b2741db;
    stim[16] = 97'h139654a58f66781c4630b5a15;
    stim[17] = 97'h00bb1e6ace5bf09d809a9c31d;
    stim[18] = 97'h1f8fd71af1a967b602938b724;
    stim[19] = 97'h1e17d1612352d2a85bd287e42;
    stim[20] = 97'h1d8fab319c52691925901de79;
    stim[21] = 97'h0ff44e964d675084860563429;
    stim[22] = 97'h091ad37696ebab76c52c6964f;
    stim[23] = 97'h1696901591c74b7d34f28861d;
    stim[24] = 97'h016acf7c5878b01f9f5d4729c;
    stim[25] = 97'h0a1057f54c5091c374cba4aef;
    stim[26] = 97'h0551beaf92eae091f8e9e36b0;
    stim[27] = 97'h0faccc2c484fa98e8d31e3ea1;
    stim[28] = 97'h1755a87d9d587dcf84f1a5569;
    stim[29] = 97'h1c9e44493fb6b4efb62aa4e3e;
    stim[30] = 97'h12cc40e6d836dd4cb9bf6b51c;
    stim[31] = 97'h1b4e8b63cf9a0299d4f1e5c5f;
    stim[32] = 97'h0815754272d993a588523f47c;
    stim[33] = 97'h1e55eb03ae79ff28acf77619c;
    stim[34] = 97'h176f9be06442401c76e176b48;
    stim[35] = 97'h051b23160beb9034f072e7180;
    stim[36] = 97'h06e1a687db4803c5614a25894;
    stim[37] = 97'h043f6118418df97483b9c14cc;
    stim[38] = 97'h1b93a2c1722718480bc6baf9b;
    stim[39] = 97'h1745a0ed87985d9794883507b;
    stim[40] = 97'h02598cc17ece298f131a4b3db;
    stim[41] = 97'h114e21bbd62c9dfa3473ab03b;
    stim[42] = 97'h10be0be0c322057e808a6fae8;
    stim[43] = 97'h0007f2e433073f891d85b62bd;
    stim[44] = 97'h0c2166c7dbc6b2577a6edf23a;
    stim[45] = 97'h0fdcdd8e7242515c5bb324999;
    stim[46] = 97'h197b24fc155763a29458acbf1;
    stim[47] = 97'h08877734d747a0d3f60d16a99;
    stim[48] = 97'h0f305797a8bbecb0dca4999c9;
    stim[49] = 97'h1e78687c6831952a8ac463b77;
    stim[50] = 97'h06faa57d0e52ff89dab06618d;
    stim[51] = 97'h15e5c913cad0c87f32978ca0d;
    stim[52] = 97'h15a0e3d028f232892203ec97b;
    stim[53] = 97'h093d9817a7b1aeb37debe492a;
    stim[54] = 97'h1257bcda9070780ca3d99f74a;
    stim[55] = 97'h1a28ad4cd94c94d857ab5e991;
    stim[56] = 97'h164fb18426d88473b2e186b35;
    stim[57] = 97'h1570498377f92b90585a0960c;
    stim[58] = 97'h107cf62fe5b554a63bd0af90c;
    stim[59] = 97'h0385f70794543719e1a5e11cb;
    stim[60] = 97'h19c44613f5d0dbae7f22de8a2;
    stim[61] = 97'h1a065c7873cd7e39fa0fee63f;
    stim[62] = 97'h1159823da70b29d79423dede0;
    stim[63] = 97'h12312fa8231228873d04c4c35;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 72'hd5a9e72f00d5a9e72f;
      expv[1] = 72'hff78f6f41aff78f70e;
      expv[2] = 72'h18025bd61b18025bf1;
      expv[3] = 72'h1734c49f441734c4e3;
      expv[4] = 72'h7d19e8bc237d19e8df;
      expv[5] = 72'ha3cf43dc34a3cf4410;
      expv[6] = 72'hf45632c303f45632c6;
      expv[7] = 72'h987f480945987f484e;
      expv[8] = 72'hcc301dd700cc301dd7;
      expv[9] = 72'h6589957d3c658995b9;
      expv[10] = 72'h70cf2d572270cf2d79;
      expv[11] = 72'h904ae731ad904ae7de;
      expv[12] = 72'ha3ccd42d07a3ccd434;
      expv[13] = 72'hea6ab0ab15ea6ab0c0;
      expv[14] = 72'hcea5a7d93acea5a813;
      expv[15] = 72'h1164da2b271164da52;
      expv[16] = 72'h17e5660e0b17e56619;
      expv[17] = 72'h78b778420978b7784b;
      expv[18] = 72'h89caf6872489caf6ab;
      expv[19] = 72'hd628f5c728d628f5ef;
      expv[20] = 72'hcf11a25501cf11a256;
      expv[21] = 72'headdf8d629eaddf8ff;
      expv[22] = 72'h0034f76a4f0034f7b9;
      expv[23] = 72'h267924c31d267924e0;
      expv[24] = 72'h4791fae6724791fb58;
      expv[25] = 72'hedfd318f4aedfd31d9;
      expv[26] = 72'h9336f0ed369336f123;
      expv[27] = 72'hbfe4add61ebfe4adf4;
      expv[28] = 72'ha57032681aa5703282;
      expv[29] = 72'he73c7acc3ee73c7b0a;
      expv[30] = 72'hd4ab1cd11cd4ab1ced;
      expv[31] = 72'h5da346501e5da3466e;
      expv[32] = 72'hd777473f23d7774762;
      expv[33] = 72'h667e516261667e51c3;
      expv[34] = 72'h996ade2017996ade37;
      expv[35] = 72'hc97d970907c97d9710;
      expv[36] = 72'h114d526914114d527d;
      expv[37] = 72'h2e6bd466142e6bd47a;
      expv[38] = 72'h6dd6d84b6b6dd6d8b6;
      expv[39] = 72'h7d6a1ab0487d6a1af8;
      expv[40] = 72'h1c5a1993311c5a19c4;
      expv[41] = 72'hd90c1e0d3ad90c1e47;
      expv[42] = 72'h9f018afa089f018b02;
      expv[43] = 72'h68069ad95b68069b34;
      expv[44] = 72'h82d6a3833a82d6a3bd;
      expv[45] = 72'hecd3619132ecd361c3;
      expv[46] = 72'h211d0acc45211d0b11;
      expv[47] = 72'h89feb3076089feb367;
      expv[48] = 72'h33a257374933a25780;
      expv[49] = 72'h3550ed373b3550ed72;
      expv[50] = 72'hc53d2f9a06c53d2fa0;
      expv[51] = 72'h58a704a50d58a704b2;
      expv[52] = 72'hf499b2ca20f499b2ea;
      expv[53] = 72'h0c5e4b222a0c5e4b4c;
      expv[54] = 72'h1641a7393d1641a776;
      expv[55] = 72'h06e1c3a47a06e1c41e;
      expv[56] = 72'h7bb86884187bb8689c;
      expv[57] = 72'hebb9ef990cebb9efa5;
      expv[58] = 72'h563c0c4e0a563c0c58;
      expv[59] = 72'hbed0710b11bed0711c;
      expv[60] = 72'h1f9b532c2d1f9b5359;
      expv[61] = 72'h31c7f1f43f31c7f233;
      expv[62] = 72'h5273c3313d5273c36e;
      expv[63] = 72'h78f739083578f7393d;
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
