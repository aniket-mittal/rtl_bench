// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 169;
  localparam OW = 169;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_040542 dut (
    .clk(clk),
    .RegWriteM(in_vec[168:168]),
    .MemtoRegM(in_vec[167:167]),
    .JalM(in_vec[166:166]),
    .sysM(in_vec[165:165]),
    .ReadDataM(in_vec[164:133]),
    .ALUOutM(in_vec[132:101]),
    .WriteRegM(in_vec[100:96]),
    .PCPlus4M(in_vec[95:64]),
    .regvM(in_vec[63:32]),
    .regaM(in_vec[31:0]),
    .RegWriteW(out_vec[168:168]),
    .MemtoRegW(out_vec[167:167]),
    .JalW(out_vec[166:166]),
    .sysW(out_vec[165:165]),
    .ReadDataW(out_vec[164:133]),
    .ALUOutW(out_vec[132:101]),
    .WriteRegW(out_vec[100:96]),
    .PCPlus4W(out_vec[95:64]),
    .regvW(out_vec[63:32]),
    .regaW(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 169'h075c8acfcc298dc266409a0fcae4b8d3089221748a9;
    stim[1] = 169'h098a1339d724881265083d917f0e1656c473e380584;
    stim[2] = 169'h1507693a8c631bdfc811609486ae09b88fba67f80e1;
    stim[3] = 169'h06a3e3c1734f1a867797912877819f633a867168fb4;
    stim[4] = 169'h010bfedb0e72ff89b5d1e8c188b9d3915a7c3031a5d;
    stim[5] = 169'h18894e52da3346376391a5fac6fcccd48786e0f1ed2;
    stim[6] = 169'h0a55241c26306ff0908b1d89b1ea043d8e729dce2b3;
    stim[7] = 169'h1e37e5cc3cac0d2673d0b32262dd153a9dc80a9a649;
    stim[8] = 169'h071893a7a32f2b9cfb9953f5360b13e3e9ba2522c6d;
    stim[9] = 169'h119cb3bae0eef3cf73b38dac5f7d8d03908d2a2852c;
    stim[10] = 169'h1f6aa2f51b666376de3bfc2dbc34464e50cdfb62b41;
    stim[11] = 169'h0139769d4a96b630f66aa821e428514e80e2f72c16f;
    stim[12] = 169'h01bcc2eacca51e86291a948b0a5599142638547bd11;
    stim[13] = 169'h02b1e2e7aab87b3ac278d1209c304c54a7228bf610e;
    stim[14] = 169'h08650164e0f496fc1d3d9a566eb31b14038483e6c71;
    stim[15] = 169'h170d4dbdb4174a61b653db0088be674431a9071691a;
    stim[16] = 169'h1ad03e272eb92bce9999957e42948f1d0dea7183939;
    stim[17] = 169'h082ee6735665726dbe6499413102c8eba6cc3bc0811;
    stim[18] = 169'h1f3eb4ff3ecf14302718a423d95680bedbc77386010;
    stim[19] = 169'h015706334e8174c5218af78ee7b87b3d0b673ba2382;
    stim[20] = 169'h0b291bf490bbbe568724795b9d0ad4ff342846a46d3;
    stim[21] = 169'h0d6458b383e25dda99e2b1198032f178c439c6369eb;
    stim[22] = 169'h01a7f0dc45ee90f96e5c7d5dbcec5d72dc61b493603;
    stim[23] = 169'h17e4fbc84d18c490b173d5a5db3a3ab2464f59a648a;
    stim[24] = 169'h0841dac8401852f5618773a7131ef3cc2c233b3e04f;
    stim[25] = 169'h154dd2c3e33906d25a83ebbdb075cc9e8dd9c5416a9;
    stim[26] = 169'h10a5cbae95018ed927a13388cc4f80fdb76f77f7c1c;
    stim[27] = 169'h0517cf43dac68e0944aed01cb383f2d323354617891;
    stim[28] = 169'h0c10630fc47ba16b91a680059bca71b7be4febcc6e8;
    stim[29] = 169'h00bf9a7fd4f23925e9caffc940910ec0af02c48c547;
    stim[30] = 169'h1a9384e3d7132719b3ee6f018416ba47630203c8afa;
    stim[31] = 169'h19cf8e61d4b2e6feae1672ad44da4c37781aec007ec;
    stim[32] = 169'h1f0d736689b97175e574aabcf12f7aeeee003d185dd;
    stim[33] = 169'h037a19f7c0560eb62c8a0ab81ad3047813690b2c4d0;
    stim[34] = 169'h02222d0bcfe92f26c0345b93e92700c5bcf6f5da686;
    stim[35] = 169'h175946c07caf4e8d796dc5239e664ddd5403ed6bd4a;
    stim[36] = 169'h1613e2d29613eae28efe7b236856bf2acbaa89fdc51;
    stim[37] = 169'h1307d27b0bd44571ddb0e74163e2c9ae62fcd009918;
    stim[38] = 169'h1dc025117b7c6f9260f9d808b071c0841bc2cc3f5de;
    stim[39] = 169'h0d0e861566492c1ba1f66cb2cee9897cd7cbf2afc19;
    stim[40] = 169'h0b2bcf55f3d227c793abf48eebef8be95fc3b131954;
    stim[41] = 169'h1efc4c11972195c2fe418b89b97ea388e9254cb80dc;
    stim[42] = 169'h0c0569a382c38aa386f972fcceb4366ef44aa685a6f;
    stim[43] = 169'h0dcfef09d0d121444606d6276956f4b2c560cb71d92;
    stim[44] = 169'h0108338b3880fc5db22c972984532228b0e8d5072f7;
    stim[45] = 169'h05419a7f60e7aace04b33042967b18451f562886b09;
    stim[46] = 169'h183bbfc7ac2f87e93e5ae71daf42fc0b27f9a091660;
    stim[47] = 169'h0339fccd796a13d35b8ebd146af7e10da15f3821527;
    stim[48] = 169'h199231e0e8eebfeaea0ea80987aa8861de23795317a;
    stim[49] = 169'h11477f3baa84c0761e2c53931220f868437ca135579;
    stim[50] = 169'h0755ecb0fbf86d3bc5b060995eadb74fb56f9e342f3;
    stim[51] = 169'h1d82bb5c84c36c97dc21fb542df8ff9925f24f431b2;
    stim[52] = 169'h08601aa5ca7f1ce33df51667b0e99bbf32171508db8;
    stim[53] = 169'h00577739f1c13da04d45a92b8ddaac1c87890fd6fe6;
    stim[54] = 169'h1640993263e80e7d1b72fe1abcff431d057a4b2e836;
    stim[55] = 169'h0cbdafb4c518dceb2dac978e1cdb0541dbafc25f59d;
    stim[56] = 169'h028cd3bf834f4cd1cca0339278f01969aad056ad4e9;
    stim[57] = 169'h027b0e5f24d7b0f5bfd069e0d0af9ac443a530a576e;
    stim[58] = 169'h1cd407e5d85aa2f4c9f47344c22d5dcc5aeff2914e4;
    stim[59] = 169'h1028f271be14edce2a16a24ed09e357b9d97da0ecdb;
    stim[60] = 169'h08b6bf220699c604742fa8657a253add3fd29fe585f;
    stim[61] = 169'h196780a3c4dd9dc8e1519a3fee4386b34f0f268c1ec;
    stim[62] = 169'h01642895bb5f908346635286b3d15fa73e8069156a1;
    stim[63] = 169'h1138c499340c9c66767c2441621d26bfd063ec16746;
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
      expv[0] = 169'h0000000000000000000000000000000000000000000;
      expv[1] = 169'h075c8acfcc298dc266409a0fcae4b8d3089221748a9;
      expv[2] = 169'h098a1339d724881265083d917f0e1656c473e380584;
      expv[3] = 169'h1507693a8c631bdfc811609486ae09b88fba67f80e1;
      expv[4] = 169'h06a3e3c1734f1a867797912877819f633a867168fb4;
      expv[5] = 169'h010bfedb0e72ff89b5d1e8c188b9d3915a7c3031a5d;
      expv[6] = 169'h18894e52da3346376391a5fac6fcccd48786e0f1ed2;
      expv[7] = 169'h0a55241c26306ff0908b1d89b1ea043d8e729dce2b3;
      expv[8] = 169'h1e37e5cc3cac0d2673d0b32262dd153a9dc80a9a649;
      expv[9] = 169'h071893a7a32f2b9cfb9953f5360b13e3e9ba2522c6d;
      expv[10] = 169'h119cb3bae0eef3cf73b38dac5f7d8d03908d2a2852c;
      expv[11] = 169'h1f6aa2f51b666376de3bfc2dbc34464e50cdfb62b41;
      expv[12] = 169'h0139769d4a96b630f66aa821e428514e80e2f72c16f;
      expv[13] = 169'h01bcc2eacca51e86291a948b0a5599142638547bd11;
      expv[14] = 169'h02b1e2e7aab87b3ac278d1209c304c54a7228bf610e;
      expv[15] = 169'h08650164e0f496fc1d3d9a566eb31b14038483e6c71;
      expv[16] = 169'h170d4dbdb4174a61b653db0088be674431a9071691a;
      expv[17] = 169'h1ad03e272eb92bce9999957e42948f1d0dea7183939;
      expv[18] = 169'h082ee6735665726dbe6499413102c8eba6cc3bc0811;
      expv[19] = 169'h1f3eb4ff3ecf14302718a423d95680bedbc77386010;
      expv[20] = 169'h015706334e8174c5218af78ee7b87b3d0b673ba2382;
      expv[21] = 169'h0b291bf490bbbe568724795b9d0ad4ff342846a46d3;
      expv[22] = 169'h0d6458b383e25dda99e2b1198032f178c439c6369eb;
      expv[23] = 169'h01a7f0dc45ee90f96e5c7d5dbcec5d72dc61b493603;
      expv[24] = 169'h17e4fbc84d18c490b173d5a5db3a3ab2464f59a648a;
      expv[25] = 169'h0841dac8401852f5618773a7131ef3cc2c233b3e04f;
      expv[26] = 169'h154dd2c3e33906d25a83ebbdb075cc9e8dd9c5416a9;
      expv[27] = 169'h10a5cbae95018ed927a13388cc4f80fdb76f77f7c1c;
      expv[28] = 169'h0517cf43dac68e0944aed01cb383f2d323354617891;
      expv[29] = 169'h0c10630fc47ba16b91a680059bca71b7be4febcc6e8;
      expv[30] = 169'h00bf9a7fd4f23925e9caffc940910ec0af02c48c547;
      expv[31] = 169'h1a9384e3d7132719b3ee6f018416ba47630203c8afa;
      expv[32] = 169'h19cf8e61d4b2e6feae1672ad44da4c37781aec007ec;
      expv[33] = 169'h1f0d736689b97175e574aabcf12f7aeeee003d185dd;
      expv[34] = 169'h037a19f7c0560eb62c8a0ab81ad3047813690b2c4d0;
      expv[35] = 169'h02222d0bcfe92f26c0345b93e92700c5bcf6f5da686;
      expv[36] = 169'h175946c07caf4e8d796dc5239e664ddd5403ed6bd4a;
      expv[37] = 169'h1613e2d29613eae28efe7b236856bf2acbaa89fdc51;
      expv[38] = 169'h1307d27b0bd44571ddb0e74163e2c9ae62fcd009918;
      expv[39] = 169'h1dc025117b7c6f9260f9d808b071c0841bc2cc3f5de;
      expv[40] = 169'h0d0e861566492c1ba1f66cb2cee9897cd7cbf2afc19;
      expv[41] = 169'h0b2bcf55f3d227c793abf48eebef8be95fc3b131954;
      expv[42] = 169'h1efc4c11972195c2fe418b89b97ea388e9254cb80dc;
      expv[43] = 169'h0c0569a382c38aa386f972fcceb4366ef44aa685a6f;
      expv[44] = 169'h0dcfef09d0d121444606d6276956f4b2c560cb71d92;
      expv[45] = 169'h0108338b3880fc5db22c972984532228b0e8d5072f7;
      expv[46] = 169'h05419a7f60e7aace04b33042967b18451f562886b09;
      expv[47] = 169'h183bbfc7ac2f87e93e5ae71daf42fc0b27f9a091660;
      expv[48] = 169'h0339fccd796a13d35b8ebd146af7e10da15f3821527;
      expv[49] = 169'h199231e0e8eebfeaea0ea80987aa8861de23795317a;
      expv[50] = 169'h11477f3baa84c0761e2c53931220f868437ca135579;
      expv[51] = 169'h0755ecb0fbf86d3bc5b060995eadb74fb56f9e342f3;
      expv[52] = 169'h1d82bb5c84c36c97dc21fb542df8ff9925f24f431b2;
      expv[53] = 169'h08601aa5ca7f1ce33df51667b0e99bbf32171508db8;
      expv[54] = 169'h00577739f1c13da04d45a92b8ddaac1c87890fd6fe6;
      expv[55] = 169'h1640993263e80e7d1b72fe1abcff431d057a4b2e836;
      expv[56] = 169'h0cbdafb4c518dceb2dac978e1cdb0541dbafc25f59d;
      expv[57] = 169'h028cd3bf834f4cd1cca0339278f01969aad056ad4e9;
      expv[58] = 169'h027b0e5f24d7b0f5bfd069e0d0af9ac443a530a576e;
      expv[59] = 169'h1cd407e5d85aa2f4c9f47344c22d5dcc5aeff2914e4;
      expv[60] = 169'h1028f271be14edce2a16a24ed09e357b9d97da0ecdb;
      expv[61] = 169'h08b6bf220699c604742fa8657a253add3fd29fe585f;
      expv[62] = 169'h196780a3c4dd9dc8e1519a3fee4386b34f0f268c1ec;
      expv[63] = 169'h01642895bb5f908346635286b3d15fa73e8069156a1;
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
