// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 130;
  localparam OW = 129;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_139492 dut (
    .clk(clk),
    .rst(in_vec[129:129]),
    .start(in_vec[128:128]),
    .in1(in_vec[127:112]),
    .in2(in_vec[111:96]),
    .in3(in_vec[95:80]),
    .in4(in_vec[79:64]),
    .in5(in_vec[63:48]),
    .in6(in_vec[47:32]),
    .in7(in_vec[31:16]),
    .in8(in_vec[15:0]),
    .out1(out_vec[128:113]),
    .out2(out_vec[112:97]),
    .out3(out_vec[96:81]),
    .out4(out_vec[80:65]),
    .out5(out_vec[64:49]),
    .out6(out_vec[48:33]),
    .out7(out_vec[32:17]),
    .out8(out_vec[16:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 130'h39da95b1507102c4225fb3fec286fb072;
    stim[1] = 130'h30c53065c824b09e67d44778d7d8c89dd;
    stim[2] = 130'h0df26d8ab0a7f7325430b8cfd2cd71761;
    stim[3] = 130'h10fffddbf51ddfed03266fc83599e53cd;
    stim[4] = 130'h1d44106c624742752fbb5b41af8ccb2af;
    stim[5] = 130'h0866bb3a8327516590de6dd74d9b88b90;
    stim[6] = 130'h131004a4a02167bf62942d8a485047718;
    stim[7] = 130'h0efba6be558f3ea61588487db8b455f91;
    stim[8] = 130'h0b9d841f245d756c41cdcba8d4f8354b3;
    stim[9] = 130'h114f248b431e92007f240d83cdb7e669f;
    stim[10] = 130'h089d91a6c322fbb6256be75985db51196;
    stim[11] = 130'h0dd99496ae82ceb90682b9cdaf9accd1f;
    stim[12] = 130'h0b5fe14e257a3ca194639cecf78d6ecb9;
    stim[13] = 130'h1b8f4bf61bc2906fd16b28e8e594803a6;
    stim[14] = 130'h0093695d9a9871bcef1bd6b408de434e2;
    stim[15] = 130'h1d96c79fcb9ab27a166dbd97763329f65;
    stim[16] = 130'h12b1ea0d8d56f9eaeaf8a0c38b95cd2fb;
    stim[17] = 130'h1bdc1906278cba97d6d394b84b524fc3a;
    stim[18] = 130'h1377414c6b905e8f319b8f6e9b0ff56c4;
    stim[19] = 130'h0a8e5d5da7087ba09937f274dfc9b3363;
    stim[20] = 130'h1dd71da0d2ad7687fce99739e684a6fa5;
    stim[21] = 130'h0d354faf7a0a49ddd72228309f97889c9;
    stim[22] = 130'h07a153c52e95deeac225419fa8df5509e;
    stim[23] = 130'h0ed5227a61a5ad751305b2b3a3743b7af;
    stim[24] = 130'h007ffd4a76092f3e012f3f9e28a4548d9;
    stim[25] = 130'h0bfda9bda00cbc9d7466f732f6f808c2e;
    stim[26] = 130'h1bb0b387e78ce1ef0596d9c3cdbf25f5e;
    stim[27] = 130'h145681d9786916a0e955ef64c997b47f6;
    stim[28] = 130'h1a1e19a76206222858b9e51309774b39e;
    stim[29] = 130'h133b888aaa60e3c8571892bf014c42838;
    stim[30] = 130'h0343714643cb3bb91bef00c9b889faafa;
    stim[31] = 130'h1f0f70e47854c6695595ea26af71ee5f2;
    stim[32] = 130'h13195d74be4a13d51e34567c6c23be781;
    stim[33] = 130'h1fced4fcd67ef954e99108a49fbe55cc7;
    stim[34] = 130'h19eddbb423f5b92874688dedf81439bca;
    stim[35] = 130'h0d71ca06526eeca3ce5fcb0066a71583e;
    stim[36] = 130'h1f0d926d3276620f098db9d29053c57df;
    stim[37] = 130'h09a2dd9a55d5d5e25212db2e02d5ef4e0;
    stim[38] = 130'h04bac5d6158568bc7c3c2309c601ed405;
    stim[39] = 130'h1c435fdd6fa29eca3ec1fb934d05dc183;
    stim[40] = 130'h08096f3cfe1980d061509c4392326da2e;
    stim[41] = 130'h15089b269c166674a9e3cb37a56a4424d;
    stim[42] = 130'h0e2496adc03dc27f422871c37f16eb418;
    stim[43] = 130'h19e45f9dde4d0f54e323c64382edb39d1;
    stim[44] = 130'h1a8e122cd4ba3345375a473303b180319;
    stim[45] = 130'h17cbc58892ee1bf71092b6d36e197e4e5;
    stim[46] = 130'h1258456a976318949f288801b7da82a5c;
    stim[47] = 130'h0551c81f40ae1ce651cb30cf5545ad6fd;
    stim[48] = 130'h1fe5ee0df0c6fbf61558d084ac4ee6503;
    stim[49] = 130'h1c89ef9a155769c9bb6cde938cda7e801;
    stim[50] = 130'h16e7c63bd53105e74663d800e3638a3bf;
    stim[51] = 130'h14252686ac6016e3549b38c98b0124a32;
    stim[52] = 130'h00153c47db216a2fbc51254767155ecc1;
    stim[53] = 130'h156a2736b938eddd8363fed7f066f8320;
    stim[54] = 130'h0e88d4fb2a67c9cdbf9e658a370a5b3c9;
    stim[55] = 130'h1915cc0e841de1680d3a072473a64d47b;
    stim[56] = 130'h1ccb9a2c14a3cd9023bd6bf642b20185b;
    stim[57] = 130'h017ad0fd2acfa471d0d67e1cd7bbe7e99;
    stim[58] = 130'h14346a833abb96ce2a9425d335b19dd47;
    stim[59] = 130'h334ffb97bcbce2107bba352822261fa99;
    stim[60] = 130'h13cdddc8ecf2ba71af54f359a203bc5f6;
    stim[61] = 130'h1147b2516e63286b9499bdce85023fc16;
    stim[62] = 130'h0e27c158bfa9462ef43b74c64ff5136ca;
    stim[63] = 130'h04790c5e741a0e6b1d82611a1bd53ee9f;
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
      expv[0] = 129'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 129'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 129'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 129'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 129'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 129'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 129'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 129'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 129'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 129'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 129'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 129'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 129'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 129'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 129'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 129'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 129'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 129'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 129'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 129'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 129'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 129'h000060006000600060006000600060007;
      expv[22] = 129'h000060006000600060006000600060007;
      expv[23] = 129'h000060006000600060006000600060007;
      expv[24] = 129'h000060006000600060006000600060007;
      expv[25] = 129'h000060006000600060006000600060007;
      expv[26] = 129'h000060006000600060006000600060007;
      expv[27] = 129'h000060006000600060006000600060007;
      expv[28] = 129'h000060006000600060006000600060007;
      expv[29] = 129'h000060006000600060006000600060007;
      expv[30] = 129'h000060006000600060006000600060007;
      expv[31] = 129'h000060006000600060006000600060007;
      expv[32] = 129'h000060006000600060006000600060007;
      expv[33] = 129'h000060006000600060006000600060007;
      expv[34] = 129'h000060006000600060006000600060007;
      expv[35] = 129'h000060006000600060006000600060007;
      expv[36] = 129'h000060006000600060006000600060007;
      expv[37] = 129'h000060006000600060006000600060007;
      expv[38] = 129'h000060006000600060006000600060007;
      expv[39] = 129'h000060006000600060006000600060007;
      expv[40] = 129'h000060006000600060006000600060007;
      expv[41] = 129'h000060006000600060006000600060007;
      expv[42] = 129'h000060006000600060006000600060007;
      expv[43] = 129'h000060006000600060006000600060007;
      expv[44] = 129'h000040004000400040004000400040005;
      expv[45] = 129'h000040004000400040004000400040005;
      expv[46] = 129'h000040004000400040004000400040005;
      expv[47] = 129'h000040004000400040004000400040005;
      expv[48] = 129'h000040004000400040004000400040005;
      expv[49] = 129'h000040004000400040004000400040005;
      expv[50] = 129'h000040004000400040004000400040005;
      expv[51] = 129'h000040004000400040004000400040005;
      expv[52] = 129'h000040004000400040004000400040005;
      expv[53] = 129'h000040004000400040004000400040005;
      expv[54] = 129'h000040004000400040004000400040005;
      expv[55] = 129'h000040004000400040004000400040005;
      expv[56] = 129'h000040004000400040004000400040005;
      expv[57] = 129'h000040004000400040004000400040005;
      expv[58] = 129'h000040004000400040004000400040005;
      expv[59] = 129'h000040004000400040004000400040004;
      expv[60] = 129'h000040004000400040004000400040004;
      expv[61] = 129'h000040004000400040004000400040004;
      expv[62] = 129'h000040004000400040004000400040004;
      expv[63] = 129'h000040004000400040004000400040004;
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
