// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09588 dut (
    .clk(clk),
    .reset(in_vec[69:69]),
    .enable(in_vec[68:68]),
    .address(in_vec[67:36]),
    .start(in_vec[35:35]),
    .waitrequest(in_vec[34:34]),
    .stall(in_vec[33:33]),
    .fifo_data(in_vec[32:1]),
    .fifo_empty(in_vec[0:0]),
    .write_data(out_vec[32:1]),
    .fifo_readack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h3a3b760df18acbd18b;
    stim[1] = 70'h34ebf1c8958fb5e283;
    stim[2] = 70'h0f7f50d0222609471b;
    stim[3] = 70'h15f62fc6df153f9163;
    stim[4] = 70'h0176160cd8838cf385;
    stim[5] = 70'h12b75e003e59001e05;
    stim[6] = 70'h1ba1a0cbec313fbd7d;
    stim[7] = 70'h0d8f86fcc64f2e1693;
    stim[8] = 70'h10d6b980ab42d7ca65;
    stim[9] = 70'h14cb56fdd332c3b2f1;
    stim[10] = 70'h1f17454e6700128cac;
    stim[11] = 70'h0a86d67d588e404590;
    stim[12] = 70'h0efd19af5da7221f12;
    stim[13] = 70'h0a90bfaacafb66cbf6;
    stim[14] = 70'h0294c1ad4a4c3215ee;
    stim[15] = 70'h10af3493c3a05be0c7;
    stim[16] = 70'h1e272d0a2f7d97cae6;
    stim[17] = 70'h1df3d85307afda6822;
    stim[18] = 70'h076533d7087a43a844;
    stim[19] = 70'h1eb9ce54a480b99119;
    stim[20] = 70'h17f291c120337eded9;
    stim[21] = 70'h1dd9acc6797307e8ac;
    stim[22] = 70'h1c9a6cd764692cfc7a;
    stim[23] = 70'h0b6ff59383f71ad8f2;
    stim[24] = 70'h1dfd2f8e1141982ad0;
    stim[25] = 70'h098c100a95b47a7e21;
    stim[26] = 70'h0b74942a7a1a2b36a4;
    stim[27] = 70'h1df6ac1aff82218128;
    stim[28] = 70'h19b4293c025756a2b2;
    stim[29] = 70'h19da87cbca35accb78;
    stim[30] = 70'h12a72011183ac98b7d;
    stim[31] = 70'h0cbaf95f064ba9be76;
    stim[32] = 70'h1502973bfeceec3ca4;
    stim[33] = 70'h18361fa7176f37966e;
    stim[34] = 70'h10d59f4daef2c55d22;
    stim[35] = 70'h1f1909017634d18006;
    stim[36] = 70'h044a0c50f26a7a9e0f;
    stim[37] = 70'h01d1eeb9970a0c73c7;
    stim[38] = 70'h07c34bb3bd41c5a17c;
    stim[39] = 70'h1c8bb6ca5f28b6ad73;
    stim[40] = 70'h1a7d6aca170302467f;
    stim[41] = 70'h01536a64ad3f90b977;
    stim[42] = 70'h0207bae42c74a4cea1;
    stim[43] = 70'h1e0f27c76442986c6d;
    stim[44] = 70'h0aeb597930a4d61975;
    stim[45] = 70'h070985f7b2055c3f67;
    stim[46] = 70'h035c9a98883470ecaf;
    stim[47] = 70'h13cc02ffd716826cfc;
    stim[48] = 70'h14e7f5544c70c76c1e;
    stim[49] = 70'h071d5ae03faaed4fd0;
    stim[50] = 70'h14453000b0817d2c0f;
    stim[51] = 70'h0b69cad5e31dacc2ac;
    stim[52] = 70'h0d1845ad07848ee0dd;
    stim[53] = 70'h13b93734198051e939;
    stim[54] = 70'h1398ca2101a244cd10;
    stim[55] = 70'h079f5383ec9088138c;
    stim[56] = 70'h1ec748159899249174;
    stim[57] = 70'h093316707bbbdfd8c2;
    stim[58] = 70'h14d1eae2075c53a94a;
    stim[59] = 70'h1b947870218f0bebc8;
    stim[60] = 70'h08fadc58285c043aa2;
    stim[61] = 70'h191293000aca140d97;
    stim[62] = 70'h1d84388112852dbfb6;
    stim[63] = 70'h07812fc8609bdffcee;
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
      expv[0] = 33'h18acbd18a;
      expv[1] = 33'h18fb5e282;
      expv[2] = 33'h02609471a;
      expv[3] = 33'h1153f9162;
      expv[4] = 33'h0838cf384;
      expv[5] = 33'h059001e04;
      expv[6] = 33'h0313fbd7c;
      expv[7] = 33'h04f2e1692;
      expv[8] = 33'h142d7ca64;
      expv[9] = 33'h132c3b2f0;
      expv[10] = 33'h100128cac;
      expv[11] = 33'h08e404590;
      expv[12] = 33'h1a7221f12;
      expv[13] = 33'h0fb66cbf6;
      expv[14] = 33'h04c3215ee;
      expv[15] = 33'h1a05be0c6;
      expv[16] = 33'h17d97cae6;
      expv[17] = 33'h1afda6822;
      expv[18] = 33'h07a43a844;
      expv[19] = 33'h080b99118;
      expv[20] = 33'h0337eded8;
      expv[21] = 33'h17307e8ad;
      expv[22] = 33'h0692cfc7a;
      expv[23] = 33'h1f71ad8f2;
      expv[24] = 33'h141982ad1;
      expv[25] = 33'h1b47a7e20;
      expv[26] = 33'h01a2b36a4;
      expv[27] = 33'h182218128;
      expv[28] = 33'h05756a2b2;
      expv[29] = 33'h035accb78;
      expv[30] = 33'h03ac98b7c;
      expv[31] = 33'h04ba9be76;
      expv[32] = 33'h0ceec3ca4;
      expv[33] = 33'h16f37966e;
      expv[34] = 33'h0f2c55d22;
      expv[35] = 33'h034d18006;
      expv[36] = 33'h06a7a9e0e;
      expv[37] = 33'h10a0c73c6;
      expv[38] = 33'h141c5a17c;
      expv[39] = 33'h128b6ad72;
      expv[40] = 33'h10302467e;
      expv[41] = 33'h13f90b976;
      expv[42] = 33'h074a4cea0;
      expv[43] = 33'h042986c6c;
      expv[44] = 33'h0a4d61974;
      expv[45] = 33'h0055c3f66;
      expv[46] = 33'h03470ecae;
      expv[47] = 33'h116826cfc;
      expv[48] = 33'h070c76c1e;
      expv[49] = 33'h1aaed4fd0;
      expv[50] = 33'h0817d2c0e;
      expv[51] = 33'h11dacc2ac;
      expv[52] = 33'h1848ee0dc;
      expv[53] = 33'h18051e938;
      expv[54] = 33'h1a244cd11;
      expv[55] = 33'h09088138c;
      expv[56] = 33'h099249175;
      expv[57] = 33'h1bbdfd8c2;
      expv[58] = 33'h15c53a94a;
      expv[59] = 33'h18f0bebc9;
      expv[60] = 33'h05c043aa2;
      expv[61] = 33'h0ca140d96;
      expv[62] = 33'h0852dbfb6;
      expv[63] = 33'h09bdffcee;
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
