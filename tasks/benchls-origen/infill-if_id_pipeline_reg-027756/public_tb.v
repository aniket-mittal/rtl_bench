// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 134;
  localparam OW = 133;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_027756 dut (
    .clk(clk),
    .stall(in_vec[133:133]),
    .OPin(in_vec[132:127]),
    .FUNCTin(in_vec[126:121]),
    .A1in(in_vec[120:116]),
    .A2in(in_vec[115:111]),
    .RDin(in_vec[110:106]),
    .IMMin(in_vec[105:90]),
    .ADin(in_vec[89:64]),
    .PCADD4in(in_vec[63:32]),
    .PCin(in_vec[31:0]),
    .OPout(out_vec[132:127]),
    .FUNCTout(out_vec[126:121]),
    .A1out(out_vec[120:116]),
    .A2out(out_vec[115:111]),
    .RDout(out_vec[110:106]),
    .IMMout(out_vec[105:90]),
    .ADout(out_vec[89:64]),
    .PCADD4out(out_vec[63:32]),
    .PCout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 134'h368a9cbc969881d8ec8651e000a032f42b;
    stim[1] = 134'h038aa398646f042c05bb17b15ce95c712b;
    stim[2] = 134'h0e54b4d61ab1fdf493663d4b33953cd1c8;
    stim[3] = 134'h0f045dcbcca65c78e0b645824e1dc0c0c6;
    stim[4] = 134'h27acdd20fa63fa5f1415a8e06a94d90690;
    stim[5] = 134'h04dd9e085007977b345b813c209855d8a0;
    stim[6] = 134'h0ac90d5c02dd6bce3c21a82426b3e98497;
    stim[7] = 134'h3035c46cc2968c3367144d70269accab0a;
    stim[8] = 134'h3243f362262dea1dcf7c5a8168b23962b6;
    stim[9] = 134'h2e553ca7d8f5786ffa50066026c0811cd4;
    stim[10] = 134'h103f886fb98c1f166ed782520027063c78;
    stim[11] = 134'h3495068f2a6a3682ab4727c416f0392805;
    stim[12] = 134'h1049fdb3bd691fd8208e21574831b4777d;
    stim[13] = 134'h263474aa6be1f8895c21ea759338c84dff;
    stim[14] = 134'h2bce09ab75da1c67718e28c54dbd547958;
    stim[15] = 134'h317985c30e84aad22dd90eba62a48acde1;
    stim[16] = 134'h29e377b4c10136776c6d15d154fbf73c87;
    stim[17] = 134'h332b5a463120241f89ea2764ebe9de0005;
    stim[18] = 134'h0dab8130a9a6a41b519ccdfaa8a1e7a25f;
    stim[19] = 134'h1724b0daf7637ec877b14c314c12b61264;
    stim[20] = 134'h159f0e8e133a75a11fdeff20a36e1dec9e;
    stim[21] = 134'h37b72538b35a292284c621ae96d9cf30f0;
    stim[22] = 134'h1c5524cc4885b02159df819b04075460a2;
    stim[23] = 134'h26b2726a666b4f2d3d781d333ab550f383;
    stim[24] = 134'h05951c8c8ca9db60a168758d51550caaab;
    stim[25] = 134'h01cb51600df9299bd474d653c36ff54eea;
    stim[26] = 134'h2911c9a1042f86c83addc5f0ab1d77448c;
    stim[27] = 134'h20525c1ecad858ec9cbf6d9f344085a57c;
    stim[28] = 134'h1bede89c7980982980dcf50dabc29f6f47;
    stim[29] = 134'h0fafeb14f92a486286b49c2c8104968eaf;
    stim[30] = 134'h2acad4352b67d424cb443168de996b48f7;
    stim[31] = 134'h180bbde5cd58a8d32277fc82fbf6ae813b;
    stim[32] = 134'h00786529584d8efa315426085772a1cfc8;
    stim[33] = 134'h0703adf7dcb563c3a0caf1610cc52456ec;
    stim[34] = 134'h2346d6fb83f037a1333f1d6e3bdf190ccf;
    stim[35] = 134'h31b003fe03d4e254b6505a2e3819e52f75;
    stim[36] = 134'h229833c6e1b015f647da220ee32f5aa34e;
    stim[37] = 134'h2292dec889ec86074e620a1c456c9ba019;
    stim[38] = 134'h29f5d8eca9a23bf2f9af8cea13a4bdf0c6;
    stim[39] = 134'h09ebe411dfbdac7b351104fe8c7b6b83ed;
    stim[40] = 134'h381340ea837af1f33723b80841e9983e89;
    stim[41] = 134'h005552c5a9f81e6e7d541b13ff0d8759ac;
    stim[42] = 134'h17d6d603afe40d92d6782dfa577ced0527;
    stim[43] = 134'h348f1996fe07e1c6029c5b83b9b831d6dc;
    stim[44] = 134'h0619c948f5ae3127bf139ef2a9aa5398ca;
    stim[45] = 134'h149892502ea10dc7316097a186d8fa60ac;
    stim[46] = 134'h2e74fdab70aee3cabca5f27ac36acee046;
    stim[47] = 134'h32306eb193782ac5903ba5a751ab2a6ba4;
    stim[48] = 134'h253771db902df5ab96b4e6c35070f2a2e5;
    stim[49] = 134'h1944cb451c742b4abe59bd4584ef9103ed;
    stim[50] = 134'h2b11e7d31d3c28be1a36c511693edc9439;
    stim[51] = 134'h37cbb3bbe5ab871a1e84262e09513eea33;
    stim[52] = 134'h1c1d201e6f6525982c31d1f99350bcbfdb;
    stim[53] = 134'h2f0bc44d367f336453bf98b510bff66c04;
    stim[54] = 134'h207203ce92b778d3a112d9f090096d8a97;
    stim[55] = 134'h31ee097439812297ca28574b93e29e41ba;
    stim[56] = 134'h3420a3ff48c6e15d7d7b0ceddb8d7c99ff;
    stim[57] = 134'h3a4462cb488564d77537284e9842e04401;
    stim[58] = 134'h04f6bb8401cb83bf6924928007aaf04228;
    stim[59] = 134'h23799f7950e5fdf04152cfea4e31980d0b;
    stim[60] = 134'h118dc476ced437c87d0976019ecca23ce3;
    stim[61] = 134'h341d066db4c4463f4a0be098da68f07e05;
    stim[62] = 134'h1f1916332fbcf7150de1d1f5176dfef564;
    stim[63] = 134'h0f099207bf40bb4a203f668e840257b929;
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
      expv[0] = 133'h0000000000000000000000000000000000;
      expv[1] = 133'h0000000000000000000000000000000000;
      expv[2] = 133'h038aa398646f042c05bb17b15ce95c712b;
      expv[3] = 133'h0e54b4d61ab1fdf493663d4b33953cd1c8;
      expv[4] = 133'h0f045dcbcca65c78e0b645824e1dc0c0c6;
      expv[5] = 133'h0f045dcbcca65c78e0b645824e1dc0c0c6;
      expv[6] = 133'h04dd9e085007977b345b813c209855d8a0;
      expv[7] = 133'h0ac90d5c02dd6bce3c21a82426b3e98497;
      expv[8] = 133'h0ac90d5c02dd6bce3c21a82426b3e98497;
      expv[9] = 133'h0ac90d5c02dd6bce3c21a82426b3e98497;
      expv[10] = 133'h0ac90d5c02dd6bce3c21a82426b3e98497;
      expv[11] = 133'h103f886fb98c1f166ed782520027063c78;
      expv[12] = 133'h103f886fb98c1f166ed782520027063c78;
      expv[13] = 133'h1049fdb3bd691fd8208e21574831b4777d;
      expv[14] = 133'h1049fdb3bd691fd8208e21574831b4777d;
      expv[15] = 133'h1049fdb3bd691fd8208e21574831b4777d;
      expv[16] = 133'h1049fdb3bd691fd8208e21574831b4777d;
      expv[17] = 133'h1049fdb3bd691fd8208e21574831b4777d;
      expv[18] = 133'h1049fdb3bd691fd8208e21574831b4777d;
      expv[19] = 133'h0dab8130a9a6a41b519ccdfaa8a1e7a25f;
      expv[20] = 133'h1724b0daf7637ec877b14c314c12b61264;
      expv[21] = 133'h159f0e8e133a75a11fdeff20a36e1dec9e;
      expv[22] = 133'h159f0e8e133a75a11fdeff20a36e1dec9e;
      expv[23] = 133'h1c5524cc4885b02159df819b04075460a2;
      expv[24] = 133'h1c5524cc4885b02159df819b04075460a2;
      expv[25] = 133'h05951c8c8ca9db60a168758d51550caaab;
      expv[26] = 133'h01cb51600df9299bd474d653c36ff54eea;
      expv[27] = 133'h01cb51600df9299bd474d653c36ff54eea;
      expv[28] = 133'h01cb51600df9299bd474d653c36ff54eea;
      expv[29] = 133'h1bede89c7980982980dcf50dabc29f6f47;
      expv[30] = 133'h0fafeb14f92a486286b49c2c8104968eaf;
      expv[31] = 133'h0fafeb14f92a486286b49c2c8104968eaf;
      expv[32] = 133'h180bbde5cd58a8d32277fc82fbf6ae813b;
      expv[33] = 133'h00786529584d8efa315426085772a1cfc8;
      expv[34] = 133'h0703adf7dcb563c3a0caf1610cc52456ec;
      expv[35] = 133'h0703adf7dcb563c3a0caf1610cc52456ec;
      expv[36] = 133'h0703adf7dcb563c3a0caf1610cc52456ec;
      expv[37] = 133'h0703adf7dcb563c3a0caf1610cc52456ec;
      expv[38] = 133'h0703adf7dcb563c3a0caf1610cc52456ec;
      expv[39] = 133'h0703adf7dcb563c3a0caf1610cc52456ec;
      expv[40] = 133'h09ebe411dfbdac7b351104fe8c7b6b83ed;
      expv[41] = 133'h09ebe411dfbdac7b351104fe8c7b6b83ed;
      expv[42] = 133'h005552c5a9f81e6e7d541b13ff0d8759ac;
      expv[43] = 133'h17d6d603afe40d92d6782dfa577ced0527;
      expv[44] = 133'h17d6d603afe40d92d6782dfa577ced0527;
      expv[45] = 133'h0619c948f5ae3127bf139ef2a9aa5398ca;
      expv[46] = 133'h149892502ea10dc7316097a186d8fa60ac;
      expv[47] = 133'h149892502ea10dc7316097a186d8fa60ac;
      expv[48] = 133'h149892502ea10dc7316097a186d8fa60ac;
      expv[49] = 133'h149892502ea10dc7316097a186d8fa60ac;
      expv[50] = 133'h1944cb451c742b4abe59bd4584ef9103ed;
      expv[51] = 133'h1944cb451c742b4abe59bd4584ef9103ed;
      expv[52] = 133'h1944cb451c742b4abe59bd4584ef9103ed;
      expv[53] = 133'h1c1d201e6f6525982c31d1f99350bcbfdb;
      expv[54] = 133'h1c1d201e6f6525982c31d1f99350bcbfdb;
      expv[55] = 133'h1c1d201e6f6525982c31d1f99350bcbfdb;
      expv[56] = 133'h1c1d201e6f6525982c31d1f99350bcbfdb;
      expv[57] = 133'h1c1d201e6f6525982c31d1f99350bcbfdb;
      expv[58] = 133'h1c1d201e6f6525982c31d1f99350bcbfdb;
      expv[59] = 133'h04f6bb8401cb83bf6924928007aaf04228;
      expv[60] = 133'h04f6bb8401cb83bf6924928007aaf04228;
      expv[61] = 133'h118dc476ced437c87d0976019ecca23ce3;
      expv[62] = 133'h118dc476ced437c87d0976019ecca23ce3;
      expv[63] = 133'h1f1916332fbcf7150de1d1f5176dfef564;
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
