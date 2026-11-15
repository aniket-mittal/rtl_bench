// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 123;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03680 dut (
    .clk(clk),
    .ena(in_vec[122:122]),
    .sel_acc(in_vec[121:121]),
    .is_cssu(in_vec[120:120]),
    .a(in_vec[119:80]),
    .b(in_vec[79:40]),
    .s(in_vec[39:0]),
    .tco(out_vec[32:32]),
    .trn(out_vec[31:16]),
    .result(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 123'h6bbf88ea43b9e1a7464793c26b4b699;
    stim[1] = 123'h74ca39ccd31d4c23cacecec166e3267;
    stim[2] = 123'h05cfc686bfddcde9277269a292a4f37;
    stim[3] = 123'h44b27c73ca70972bba98c137a6bdfa3;
    stim[4] = 123'h10fca1710c1da878d63322ad178b162;
    stim[5] = 123'h68980791f366add5e46550c23ce9aa0;
    stim[6] = 123'h3abe64ed0d72450ffe059d848d3f1d5;
    stim[7] = 123'h7a614d95f8d290b8937095d8226aacf;
    stim[8] = 123'h7aaad23fa0c98e0446c148be7fb9896;
    stim[9] = 123'h5e28adf18d55a401db3e4fb72910178;
    stim[10] = 123'h647f84fd489e86458e01710a1013c62;
    stim[11] = 123'h43a67918b4416cc4f1b6e035cd806bc;
    stim[12] = 123'h3e673ed2826375f4fcde66952d4c293;
    stim[13] = 123'h17e50df28ec24adf700c75e78fc59ea;
    stim[14] = 123'h74430628280a57ac0391b395842a764;
    stim[15] = 123'h54bcae1729277e772f180d8793b563b;
    stim[16] = 123'h2c2e1422833dfbb6bfda14732a680c7;
    stim[17] = 123'h433236362a695c1d13a5426f2849067;
    stim[18] = 123'h2945c8586aad1184aaa7f153c5e4007;
    stim[19] = 123'h7d6ba275f1cdaedfccb0c5c5b982ef1;
    stim[20] = 123'h334cceb0fcc7d2e6b091064c6750940;
    stim[21] = 123'h74b22ac02b97c0baa66a0a02d8f0f4c;
    stim[22] = 123'h4fd8723ff23d60e04bb52be737b4275;
    stim[23] = 123'h74ff60b04080b8840df6c31f1e3a0c4;
    stim[24] = 123'h7e4abce5af8bb22cff8947b35ca4cb6;
    stim[25] = 123'h674a82bdb812db8169601262806ac4b;
    stim[26] = 123'h3e3b430f08979e2ff45c56eb1afd62c;
    stim[27] = 123'h369ccbef74ae29ce7abab81181aed02;
    stim[28] = 123'h1d79d263b8fc268ced5977a86f0d1fd;
    stim[29] = 123'h1cfae6a32f61d1d3b85faf8dc97aaa5;
    stim[30] = 123'h1c37be6272b23a59cb87e9f9afc2eb6;
    stim[31] = 123'h2aa51004ec8afd99200dc3c84865316;
    stim[32] = 123'h3a61a7c74e6f6d35b3d3f911aabb706;
    stim[33] = 123'h64f1e62c52d221622f42a087d2be684;
    stim[34] = 123'h48c92250337565126ca861dd32f2dfc;
    stim[35] = 123'h5e1585cc79a51a6736f6767a7c9ed5f;
    stim[36] = 123'h4d2e7a41c468da708512903100254f3;
    stim[37] = 123'h2d57526657e68399c3a538a3b3e789d;
    stim[38] = 123'h54b428aee0f3e60f4700a61dd800fed;
    stim[39] = 123'h36ae5c4b720d51b7879982cf6cf32f3;
    stim[40] = 123'h765dc23980262a97a13b95f2f1330c7;
    stim[41] = 123'h1ea97c15e8dd09ddee056ea4956f764;
    stim[42] = 123'h1dfd3006e0480c7cded2633f4cdfccd;
    stim[43] = 123'h6a88ac7d3bca275f5da8f5727f2ff9b;
    stim[44] = 123'h599cf166c5ef8b65127a1b9b5b90320;
    stim[45] = 123'h50f77a91cf9371ed65c40f23f3377a3;
    stim[46] = 123'h05bef6e40ae2c8ce0fea2b5b72525d7;
    stim[47] = 123'h05e3fc1b76ed298547a38e75db818ed;
    stim[48] = 123'h1c4e147f22c706991865a986d311815;
    stim[49] = 123'h22401f1b7a6460b81937c693904bc0b;
    stim[50] = 123'h3c454adfd70e650ef88f5eae8ce2323;
    stim[51] = 123'h29cd5a60a87736712a02f318c235c60;
    stim[52] = 123'h0596db35047925fc4176db15e8b45cd;
    stim[53] = 123'h73665b6678af4af38846341a500b72a;
    stim[54] = 123'h040fb7c7ee193d43f6fd39999817a5c;
    stim[55] = 123'h7b48df4edd30eeca7e15479637a04f6;
    stim[56] = 123'h7afbd3e6ae4290eebafd70dbc45534b;
    stim[57] = 123'h1c00b5b09601c0124922f0b15e8ea8c;
    stim[58] = 123'h13c7564a77515cb2f0fa4a95f419b91;
    stim[59] = 123'h09d10b3043932c910626b8b5d158209;
    stim[60] = 123'h2b1dda5ca854802484792c4071f4676;
    stim[61] = 123'h20eb5bedef864ab3b0d376a6f7267d2;
    stim[62] = 123'h45c5d6d172b00b827dd5b94e0122cdb;
    stim[63] = 123'h7fca733159005802873bcae90892880;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'h1xxxxb699;
      expv[2] = 33'h0xxxxc23c;
      expv[3] = 33'h0xxxxc23c;
      expv[4] = 33'h1xxxxdfa3;
      expv[5] = 33'h1xxxxdfa3;
      expv[6] = 33'h0xxxx9aa0;
      expv[7] = 33'h0xxxx9aa0;
      expv[8] = 33'h1xxxx3709;
      expv[9] = 33'h0xxxxe044;
      expv[10] = 33'h0xxx48adf;
      expv[11] = 33'h1xxx43c62;
      expv[12] = 33'h1xxx406bc;
      expv[13] = 33'h1xxx406bc;
      expv[14] = 33'h1xxx406bc;
      expv[15] = 33'h0xxx87ac0;
      expv[16] = 33'h0xxx0cae1;
      expv[17] = 33'h0xxx0cae1;
      expv[18] = 33'h1xxx09067;
      expv[19] = 33'h1xxx09067;
      expv[20] = 33'h0xxx0edfc;
      expv[21] = 33'h0xxx0edfc;
      expv[22] = 33'h1xx4166a0;
      expv[23] = 33'h1xx414275;
      expv[24] = 33'h1xx83df6c;
      expv[25] = 33'h1xx07f894;
      expv[26] = 33'h0xx07ac4b;
      expv[27] = 33'h0xx07ac4b;
      expv[28] = 33'h0xx07ac4b;
      expv[29] = 33'h0xx07ac4b;
      expv[30] = 33'h0xx07ac4b;
      expv[31] = 33'h0xx07ac4b;
      expv[32] = 33'h0xx07ac4b;
      expv[33] = 33'h0xx07ac4b;
      expv[34] = 33'h1xx07e684;
      expv[35] = 33'h0xx072dfc;
      expv[36] = 33'h1xx0fc79a;
      expv[37] = 33'h0xx0f54f3;
      expv[38] = 33'h0xx0f54f3;
      expv[39] = 33'h1x41fee0f;
      expv[40] = 33'h1x41fee0f;
      expv[41] = 33'h0x83ea97a;
      expv[42] = 33'h0x83ea97a;
      expv[43] = 33'h0x83ea97a;
      expv[44] = 33'h1x83eff9b;
      expv[45] = 33'h0x07ccf16;
      expv[46] = 33'h0x0f877a9;
      expv[47] = 33'h0x0f877a9;
      expv[48] = 33'h0x0f877a9;
      expv[49] = 33'h0x0f877a9;
      expv[50] = 33'h0x0f877a9;
      expv[51] = 33'h0x0f877a9;
      expv[52] = 33'h0x0f877a9;
      expv[53] = 33'h0x0f877a9;
      expv[54] = 33'h041f0af38;
      expv[55] = 33'h041f0af38;
      expv[56] = 33'h083e0eca7;
      expv[57] = 33'h107c1afd7;
      expv[58] = 33'h107c1afd7;
      expv[59] = 33'h107c1afd7;
      expv[60] = 33'h107c1afd7;
      expv[61] = 33'h107c1afd7;
      expv[62] = 33'h107c1afd7;
      expv[63] = 33'h007c12cdb;
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
