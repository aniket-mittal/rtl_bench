// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 205;
  localparam OW = 203;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_010967 dut (
    .clk(clk),
    .rst(in_vec[204:204]),
    .en(in_vec[203:203]),
    .IRin(in_vec[202:171]),
    .PCin(in_vec[170:139]),
    .JRin(in_vec[138:138]),
    .JMPin(in_vec[137:137]),
    .LBUin(in_vec[136:136]),
    .BEQin(in_vec[135:135]),
    .BNEin(in_vec[134:134]),
    .BGEZin(in_vec[133:133]),
    .MemToRegin(in_vec[132:132]),
    .MemWritein(in_vec[131:131]),
    .RegWritein(in_vec[130:130]),
    .AluOpin(in_vec[129:126]),
    .R1_numin(in_vec[125:121]),
    .R2_numin(in_vec[120:116]),
    .R1in(in_vec[115:84]),
    .R2in(in_vec[83:52]),
    .W_numin(in_vec[51:47]),
    .imm16in(in_vec[46:31]),
    .imm26in(in_vec[30:5]),
    .shamtin(in_vec[4:0]),
    .IRout(out_vec[202:171]),
    .PCout(out_vec[170:139]),
    .JRout(out_vec[138:138]),
    .JMPout(out_vec[137:137]),
    .LBUout(out_vec[136:136]),
    .BEQout(out_vec[135:135]),
    .BNEout(out_vec[134:134]),
    .BGEZout(out_vec[133:133]),
    .MemToRegout(out_vec[132:132]),
    .MemWriteout(out_vec[131:131]),
    .RegWriteout(out_vec[130:130]),
    .AluOpout(out_vec[129:126]),
    .R1_numout(out_vec[125:121]),
    .R2_numout(out_vec[120:116]),
    .R1out(out_vec[115:84]),
    .R2out(out_vec[83:52]),
    .W_numout(out_vec[51:47]),
    .imm16out(out_vec[46:31]),
    .imm26out(out_vec[30:5]),
    .shamtout(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 205'h14957baae8bc861173c044726283b3548da448b705a24adfca61;
    stim[1] = 205'h1878251b3f10e537920407141e0925951c28dd08dc207e0c13f2;
    stim[2] = 205'h0d0251afcfc3d5bfc1846f7332bc66aebfc73ecb79e8d8a9eab2;
    stim[3] = 205'h0fde7e300df394f9cab48fdffeeece6a9e6646b0aaf8a149158d;
    stim[4] = 205'h09a7c9eef4c6b8c9e488260efb2c9be7ce5ee15040af2a98b572;
    stim[5] = 205'h02a3618435a577071931003502e8ae62ad5ff2ffeca1ff82b3e8;
    stim[6] = 205'h09bd5fb7d43ed4b9b8c1ec5b7923798cbd849707ff5352da65e7;
    stim[7] = 205'h07a30186bd93e1d8fc80f2bd0db22b722ee2b19fd16762ea07a0;
    stim[8] = 205'h1ed0d8adb06ff03bc77aa28e0bef377838574f51cc0634249e6f;
    stim[9] = 205'h0d31a3cda9befe97131d28557fb51f1b4bfded90f089ec55e741;
    stim[10] = 205'h03000d5706839d677843b29e0d7a345a8c69c3108c398202990f;
    stim[11] = 205'h04f7cffcd4bb36bf561a18b430b94679c6bbb830c7bb68c4dc24;
    stim[12] = 205'h059245e7c729d15f5d6e085d744d0dc0b22116991942b1628d6a;
    stim[13] = 205'h07b9ed0aacf9a9f15f02d2f23a815c00add7a05d822ea2c4da00;
    stim[14] = 205'h033deea4abc3f782be1c83e481cc7030163afecd369828f10da6;
    stim[15] = 205'h093c429a3e8e644f3d6aec422c27ff15b78bf87978ccd3f82e52;
    stim[16] = 205'h0cc0f34aa4f9495390d3e122ac11c4ed394cd1d806100cc81f0b;
    stim[17] = 205'h08e4fbb6a993d534268e90fc92093960a0a12e1bb2dc86dd7ff6;
    stim[18] = 205'h027b85a0efa03aed3135eeba38e25f00c41f91a33269ac325a46;
    stim[19] = 205'h0b2c0cbf29fe0bef8f5caaffae5d6f10f35fc195e62e2ebf1a17;
    stim[20] = 205'h030deab95ae0bc82ca304ca1fba2b20cdf73eee0198c39508160;
    stim[21] = 205'h04f750f65d053ecaddd1877b6291482f6bc84d793a203f9e5aa5;
    stim[22] = 205'h09e66a54a147c6958b4c1df4d0ba672824dcebd99f73b7a02973;
    stim[23] = 205'h081f6c5ca3e070fd4b358613e0665ddaf1119bb6be49261969ed;
    stim[24] = 205'h032665dc6c22fccaa088ca6de8ec9708ece79d85f4070f88dd42;
    stim[25] = 205'h07e149bf647b0aaf84e328abe9d1c6a9896056f289f4ce991644;
    stim[26] = 205'h08ece5242ba3e15fce2d77337161383d76ad7242739a6b59c033;
    stim[27] = 205'h07f93e276923ce8ad48f98df2262a2998e2cf67726c1c94064c7;
    stim[28] = 205'h02fe0087436920f7ef796761560542ce7eac20942513b68be7f6;
    stim[29] = 205'h0fc496019f2322d5c8cdb4434db8db4a9b396f8a23d5af3186a1;
    stim[30] = 205'h0bee74709e058487d59be37ea8d87d59917a32f9951827ab23e8;
    stim[31] = 205'h0c3c024823566fc6a55628bd37c9dcce1762ddf4820fc0684039;
    stim[32] = 205'h074330c30ca2ee57863c834baf2d4f85fe6a18a97ed5129fa04e;
    stim[33] = 205'h09546fcfd2c5030ddc05a6eddb0252d4f1cb91a077febcc2fda3;
    stim[34] = 205'h0eefa67115057c625d41b25aa2968d42713b86882ecb33c9723d;
    stim[35] = 205'h0c5080ec28103d6fa400b5a366e05ac1e272b4b52ccb3fb6ee57;
    stim[36] = 205'h01da109063e5c36f3e9f1064420a72fd3b185daf71bdc978cbbf;
    stim[37] = 205'h06eb0898c3a6242a5309dd1755e87483fde1d41b065a02f7f019;
    stim[38] = 205'h04d5b3c89ff1f5c09b6a69ab126651edca89f16c4602eb2c26b0;
    stim[39] = 205'h0b082ec564c0d8300fc2837c672d281f644f2748d0cbff2088ae;
    stim[40] = 205'h0490c232dfa74582bc6bf31699f5e7d99a60b798ae22b3a96df0;
    stim[41] = 205'h0e21ac060ffd8e10be0b089d85bf1ed5e943b8d9b7c59049b433;
    stim[42] = 205'h00991aaac554773da7b72d4b161d34842179a5c80738a5565324;
    stim[43] = 205'h072745a0fa592324a8d3bb692e81a250c005d58806a29f2ebde0;
    stim[44] = 205'h013e5ce341faaf510aeeca9667e7ea60e7d7b9d83be56ca51e5b;
    stim[45] = 205'h08d5a82200f2d08b75efc322300106596026ea30ee2a314ac2a4;
    stim[46] = 205'h02b333264b27b40173c2e8113adc23744c4b8f605db6ebe9de64;
    stim[47] = 205'h0c4fa94f09098b5007009bd39c30c3057b64f5093bc9aca13641;
    stim[48] = 205'h0a5bad965bc6cc55050ef2b561d49e3647afaee8c5027fe42bc7;
    stim[49] = 205'h0043c6e4cd8a2ece106671f6a6261e53d8dd6397f1176572e17c;
    stim[50] = 205'h0f35b06242eb16eafe8f9be93615b2f1c55b283b0ad0a9de027e;
    stim[51] = 205'h063c4e37d18ee39245aabfee66e70238e3100558dcd61e1a5f01;
    stim[52] = 205'h09c601914b34b9b9b368498b0f287b99fb2a9574c71a016c7d27;
    stim[53] = 205'h080a7d0cec8771d53bc349e465611d506fef7a6ae948ee83ad43;
    stim[54] = 205'h04b0a2b12afd06208d3abbc8148d58b7bd496ddc89074e3c9b39;
    stim[55] = 205'h06b04e90e7fb6b3371126441eae91d9489727367ed85726115b9;
    stim[56] = 205'h0a2d03e555184976eb76d114d064a66cc472da8bfa655d71689a;
    stim[57] = 205'h0a783a91fbcb0821b8a186b08b8c421cfde591321aaa437ba253;
    stim[58] = 205'h01669bf599d85e3f39fad47a9221f1b4a5bcf4656a613f140a2e;
    stim[59] = 205'h09488119384e1df47bd56e0a793abe98179225e7ff56b381fecb;
    stim[60] = 205'h0ec07fd33dc9e632fe03272157abed7f6235b506d2f5101a3550;
    stim[61] = 205'h0c9c9cf36cc86725ec7d1ca647316837b4349d80172d69df19e9;
    stim[62] = 205'h091243492a3b45e61328233d294f2315e83ead90d8d46dc8ff6f;
    stim[63] = 205'h0a819b7b3af1aac29b11b5dc6bbb89197fae57bcbcf158056cee;
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
      expv[0] = 203'h000000000000000000000000000000000000000000000000000;
      expv[1] = 203'h000000000000000000000000000000000000000000000000000;
      expv[2] = 203'h000000000000000000000000000000000000000000000000000;
      expv[3] = 203'h000000000000000000000000000000000000000000000000000;
      expv[4] = 203'h000000000000000000000000000000000000000000000000000;
      expv[5] = 203'h000000000000000000000000000000000000000000000000000;
      expv[6] = 203'h2a3618435a577071931003502e8ae62ad5ff2ffeca1ff82b3e8;
      expv[7] = 203'h2a3618435a577071931003502e8ae62ad5ff2ffeca1ff82b3e8;
      expv[8] = 203'h000000000000000000000000000000000000000000000000000;
      expv[9] = 203'h000000000000000000000000000000000000000000000000000;
      expv[10] = 203'h000000000000000000000000000000000000000000000000000;
      expv[11] = 203'h3000d5706839d677843b29e0d7a345a8c69c3108c398202990f;
      expv[12] = 203'h4f7cffcd4bb36bf561a18b430b94679c6bbb830c7bb68c4dc24;
      expv[13] = 203'h59245e7c729d15f5d6e085d744d0dc0b22116991942b1628d6a;
      expv[14] = 203'h7b9ed0aacf9a9f15f02d2f23a815c00add7a05d822ea2c4da00;
      expv[15] = 203'h33deea4abc3f782be1c83e481cc7030163afecd369828f10da6;
      expv[16] = 203'h33deea4abc3f782be1c83e481cc7030163afecd369828f10da6;
      expv[17] = 203'h33deea4abc3f782be1c83e481cc7030163afecd369828f10da6;
      expv[18] = 203'h33deea4abc3f782be1c83e481cc7030163afecd369828f10da6;
      expv[19] = 203'h27b85a0efa03aed3135eeba38e25f00c41f91a33269ac325a46;
      expv[20] = 203'h27b85a0efa03aed3135eeba38e25f00c41f91a33269ac325a46;
      expv[21] = 203'h30deab95ae0bc82ca304ca1fba2b20cdf73eee0198c39508160;
      expv[22] = 203'h4f750f65d053ecaddd1877b6291482f6bc84d793a203f9e5aa5;
      expv[23] = 203'h4f750f65d053ecaddd1877b6291482f6bc84d793a203f9e5aa5;
      expv[24] = 203'h4f750f65d053ecaddd1877b6291482f6bc84d793a203f9e5aa5;
      expv[25] = 203'h32665dc6c22fccaa088ca6de8ec9708ece79d85f4070f88dd42;
      expv[26] = 203'h7e149bf647b0aaf84e328abe9d1c6a9896056f289f4ce991644;
      expv[27] = 203'h7e149bf647b0aaf84e328abe9d1c6a9896056f289f4ce991644;
      expv[28] = 203'h7f93e276923ce8ad48f98df2262a2998e2cf67726c1c94064c7;
      expv[29] = 203'h2fe0087436920f7ef796761560542ce7eac20942513b68be7f6;
      expv[30] = 203'h2fe0087436920f7ef796761560542ce7eac20942513b68be7f6;
      expv[31] = 203'h2fe0087436920f7ef796761560542ce7eac20942513b68be7f6;
      expv[32] = 203'h2fe0087436920f7ef796761560542ce7eac20942513b68be7f6;
      expv[33] = 203'h74330c30ca2ee57863c834baf2d4f85fe6a18a97ed5129fa04e;
      expv[34] = 203'h74330c30ca2ee57863c834baf2d4f85fe6a18a97ed5129fa04e;
      expv[35] = 203'h74330c30ca2ee57863c834baf2d4f85fe6a18a97ed5129fa04e;
      expv[36] = 203'h74330c30ca2ee57863c834baf2d4f85fe6a18a97ed5129fa04e;
      expv[37] = 203'h1da109063e5c36f3e9f1064420a72fd3b185daf71bdc978cbbf;
      expv[38] = 203'h6eb0898c3a6242a5309dd1755e87483fde1d41b065a02f7f019;
      expv[39] = 203'h4d5b3c89ff1f5c09b6a69ab126651edca89f16c4602eb2c26b0;
      expv[40] = 203'h4d5b3c89ff1f5c09b6a69ab126651edca89f16c4602eb2c26b0;
      expv[41] = 203'h490c232dfa74582bc6bf31699f5e7d99a60b798ae22b3a96df0;
      expv[42] = 203'h490c232dfa74582bc6bf31699f5e7d99a60b798ae22b3a96df0;
      expv[43] = 203'h0991aaac554773da7b72d4b161d34842179a5c80738a5565324;
      expv[44] = 203'h72745a0fa592324a8d3bb692e81a250c005d58806a29f2ebde0;
      expv[45] = 203'h13e5ce341faaf510aeeca9667e7ea60e7d7b9d83be56ca51e5b;
      expv[46] = 203'h13e5ce341faaf510aeeca9667e7ea60e7d7b9d83be56ca51e5b;
      expv[47] = 203'h2b333264b27b40173c2e8113adc23744c4b8f605db6ebe9de64;
      expv[48] = 203'h2b333264b27b40173c2e8113adc23744c4b8f605db6ebe9de64;
      expv[49] = 203'h2b333264b27b40173c2e8113adc23744c4b8f605db6ebe9de64;
      expv[50] = 203'h043c6e4cd8a2ece106671f6a6261e53d8dd6397f1176572e17c;
      expv[51] = 203'h043c6e4cd8a2ece106671f6a6261e53d8dd6397f1176572e17c;
      expv[52] = 203'h63c4e37d18ee39245aabfee66e70238e3100558dcd61e1a5f01;
      expv[53] = 203'h63c4e37d18ee39245aabfee66e70238e3100558dcd61e1a5f01;
      expv[54] = 203'h63c4e37d18ee39245aabfee66e70238e3100558dcd61e1a5f01;
      expv[55] = 203'h4b0a2b12afd06208d3abbc8148d58b7bd496ddc89074e3c9b39;
      expv[56] = 203'h6b04e90e7fb6b3371126441eae91d9489727367ed85726115b9;
      expv[57] = 203'h6b04e90e7fb6b3371126441eae91d9489727367ed85726115b9;
      expv[58] = 203'h6b04e90e7fb6b3371126441eae91d9489727367ed85726115b9;
      expv[59] = 203'h1669bf599d85e3f39fad47a9221f1b4a5bcf4656a613f140a2e;
      expv[60] = 203'h1669bf599d85e3f39fad47a9221f1b4a5bcf4656a613f140a2e;
      expv[61] = 203'h1669bf599d85e3f39fad47a9221f1b4a5bcf4656a613f140a2e;
      expv[62] = 203'h1669bf599d85e3f39fad47a9221f1b4a5bcf4656a613f140a2e;
      expv[63] = 203'h1669bf599d85e3f39fad47a9221f1b4a5bcf4656a613f140a2e;
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
