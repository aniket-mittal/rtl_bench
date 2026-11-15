// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 129;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07172 dut (
    .clk(clk),
    .GATE(in_vec[128:128]),
    .A(in_vec[127:96]),
    .D(in_vec[95:64]),
    .S(in_vec[63:32]),
    .R(in_vec[31:0]),
    .sout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 129'h1367af5d060b7d66c1a27c2030ffbb572;
    stim[1] = 129'h1423a25e8a3221f92f41e01bba469ded8;
    stim[2] = 129'h17bf6dcebfbf942de722dbce3d0d87d58;
    stim[3] = 129'h099cf4f73decd54e4a1042b55ab1c0155;
    stim[4] = 129'h1ab9d106f99621858dedcf95e0a8cf620;
    stim[5] = 129'h0afdfe86bfd6ea118df27713a31fc7c84;
    stim[6] = 129'h167287583df50945fe7f9749ba095cb62;
    stim[7] = 129'h1a247643c08039c70811a52e23ef4a0e2;
    stim[8] = 129'h07d37c3da61ffb99b11f53858f57b6376;
    stim[9] = 129'h1c46329f7c45fb45a36f44f07c7d70a40;
    stim[10] = 129'h18d6a3d5eff44d4e93a8c74f4033f0aa2;
    stim[11] = 129'h0622d336fd34e11b355d03f1aa25e799e;
    stim[12] = 129'h0bcb552c49d6e6280e5da55c001800106;
    stim[13] = 129'h0de21d6ef1b19ca66721a1702d30a4024;
    stim[14] = 129'h012f47e36a640c98e103d28d1f182b04e;
    stim[15] = 129'h1a345d5fba49580115e4c21bde2c7e2b5;
    stim[16] = 129'h0f5549cff1afcb053c4ac56ba200d17c8;
    stim[17] = 129'h16f8e983df4358eceabaf16249acb1648;
    stim[18] = 129'h1a1369a22f5b66cadeb472efdbd580e41;
    stim[19] = 129'h1a5e212d3eba1304a9461519eeb129e4e;
    stim[20] = 129'h00baeb941aca21914e2f86f8183fb529b;
    stim[21] = 129'h1af0a9044e58a4b14ab369a254215daa2;
    stim[22] = 129'h0d6d2ab462efd3b7efe83b0a1aa23c5e6;
    stim[23] = 129'h144cb009be4505a2cbe7766cf56be305f;
    stim[24] = 129'h1d81101bce0aaa8cb63ab298fe2ace5b6;
    stim[25] = 129'h12598228c4c67c4565b7ffac9f68059d4;
    stim[26] = 129'h1013f62fd0a8f50d6b047ffa8320ced4c;
    stim[27] = 129'h1f005719d609f47b426ad55ef4b32c4b5;
    stim[28] = 129'h1348fc927471430420c96538de5f31ce3;
    stim[29] = 129'h1b654314e142e5a76c3a4dcbaadc14fea;
    stim[30] = 129'h00cf43f4b295721edfca5e7fe56c74971;
    stim[31] = 129'h0c48f151c7f71a36fcb862bd928d76643;
    stim[32] = 129'h1697eed9019f9f80ca5055ac849444628;
    stim[33] = 129'h123758913d37908144fc162c07600e251;
    stim[34] = 129'h07ee97d888ef3a81d7fdf59eca9be4990;
    stim[35] = 129'h094b975bc2eabd8dba5395f65eb147f03;
    stim[36] = 129'h1d55dde81f3b0b17f8702ce549841ba4d;
    stim[37] = 129'h15d3c5401099b6fe4b37d00a6d00f4dd2;
    stim[38] = 129'h14870091da21c69504ae852e2b0a7cea9;
    stim[39] = 129'h159829934be13f2023c15cc40fb561603;
    stim[40] = 129'h14bf6fde628c63250a3a259e0764b2ada;
    stim[41] = 129'h0a2258513875ada69b15f36fd12bf65cb;
    stim[42] = 129'h1160a1dfc2a0fb54e2f2a202460e6438c;
    stim[43] = 129'h1dda896fb1b8786c32636dcb3c7c22380;
    stim[44] = 129'h0987c63e4ceca05abc65006e185f3f343;
    stim[45] = 129'h1857c5add379808702ca066054a286a58;
    stim[46] = 129'h1c760a4d884e39cb091704511236189ad;
    stim[47] = 129'h027005d7b3f413871557cc8333540a8b3;
    stim[48] = 129'h1eadc348287da014f548e4797f4b04e76;
    stim[49] = 129'h0158cbb1108f8bb5b93e9ebbb1b6752e0;
    stim[50] = 129'h16dfa57d7a47ca39a0bb731215829ad85;
    stim[51] = 129'h0f004a28aac1a37b78423d4d585953ead;
    stim[52] = 129'h00502c35e0cc3aec6a0c81bd91d8292e0;
    stim[53] = 129'h123be969b29698ad5a47c5e6fc0833f49;
    stim[54] = 129'h074ec07a83e4d6490c210b0e8a1357d40;
    stim[55] = 129'h1ebb94b96643ffbef05b09d735b6ada68;
    stim[56] = 129'h0d89c948ea2faf0dd5b50cba269590e04;
    stim[57] = 129'h19bf557e56a068428959b848bc99d4a00;
    stim[58] = 129'h1c93381926cfe967ec233622785329fe8;
    stim[59] = 129'h1379eacfe6d4b28b4858bcfefb3d136f1;
    stim[60] = 129'h12d82679d43a4c4264f82694a8a34c6e7;
    stim[61] = 129'h1457faacba13bec38e9b1dc23bd0cb4a2;
    stim[62] = 129'h1ba55c32cd838704f55e72ea662dc00e1;
    stim[63] = 129'h188de2e5e6640d3db21fe494079c7bf86;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h423a25e8;
      expv[3] = 32'hbe3102d3;
      expv[4] = 32'hbe3102d3;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'ha247643c;
      expv[9] = 32'ha247643c;
      expv[10] = 32'h00000000;
      expv[11] = 32'h8d6a3d5e;
      expv[12] = 32'h8d6a3d5e;
      expv[13] = 32'h8bea3c58;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'ha1369a22;
      expv[20] = 32'hffffffff;
      expv[21] = 32'hffffffff;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'hd81101bc;
      expv[26] = 32'hfda92448;
      expv[27] = 32'hfee88745;
      expv[28] = 32'hffffffff;
      expv[29] = 32'hb8ebcfbd;
      expv[30] = 32'hc3a4dcba;
      expv[31] = 32'hc3a4dcba;
      expv[32] = 32'h9acd7677;
      expv[33] = 32'h00000000;
      expv[34] = 32'h23758913;
      expv[35] = 32'h23758913;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h5d3c5401;
      expv[39] = 32'ha5ac5d1e;
      expv[40] = 32'hff2ef652;
      expv[41] = 32'hffffffff;
      expv[42] = 32'hffffffff;
      expv[43] = 32'h00000000;
      expv[44] = 32'hdda896fb;
      expv[45] = 32'hdda896fb;
      expv[46] = 32'h00000000;
      expv[47] = 32'hc760a4d8;
      expv[48] = 32'hc760a4d8;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'hc9338192;
      expv[60] = 32'hffffffff;
      expv[61] = 32'hbc5b3bd9;
      expv[62] = 32'he9b1dc23;
      expv[63] = 32'h55e72ea6;
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
