// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 144;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_119493 dut (
    .din0(in_vec[143:112]),
    .din1(in_vec[111:80]),
    .din2(in_vec[79:48]),
    .din3(in_vec[47:16]),
    .din4(in_vec[15:0]),
    .dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 144'h63882c8fb66c0e1de288c3be4fa13ac26dfd;
    stim[1] = 144'h4b5891cf30701999757b2c8a14dc24f8b853;
    stim[2] = 144'hd277b5e95260fad8cf043eecd4d07f97943f;
    stim[3] = 144'h31783ea635e933e14918e2a5f374c6c79c92;
    stim[4] = 144'hf5732068a39a3ae788e58d4db599131d0547;
    stim[5] = 144'h716ddeb9e08ef56d07278f4e6c554dde3720;
    stim[6] = 144'h39a0eea5bffb0875b2c8864cdfdac5a8901a;
    stim[7] = 144'hf13036d1262139ab5e11a6e1d0e60c513b3f;
    stim[8] = 144'h9c50abe4757a48e4dc47e47fd253763fdd29;
    stim[9] = 144'h89c5b5837c50b3e0ffa73c0389405818595d;
    stim[10] = 144'hafbe37b4c22b738c73d33a9d0fd4f4ae47e5;
    stim[11] = 144'h873842577802a79efb34e6d0bd7ff541c530;
    stim[12] = 144'he52cb88928818f350e3f79601e99046e4670;
    stim[13] = 144'h2d6380623e634d24b74a4564057de3f499a9;
    stim[14] = 144'h0311fd8613638671d12b210de4f1e8ec6940;
    stim[15] = 144'h279d83360a13b288a752f1b8fa8d341d16e7;
    stim[16] = 144'hacedb4b475fa76bc76a0c745583a46253e3b;
    stim[17] = 144'hb7950c3f99657f067f5c4942bd757f986151;
    stim[18] = 144'h2abe8de01def11e115806d13b3ba7101e203;
    stim[19] = 144'hdefb371abd2713e79e60be733df36044f852;
    stim[20] = 144'hd3ecb5897d1eb0ac2177a0a1b2d29b554b69;
    stim[21] = 144'h2198f19276ca219946d5c6c98c346718fa99;
    stim[22] = 144'h66f767dba106e418731ec534d7a8bb3a56e8;
    stim[23] = 144'h8947565ae3f732f510bfb71997eaeb23263d;
    stim[24] = 144'h165e960ee312640b21028b0b705dc7f7c933;
    stim[25] = 144'h975ad88787a29833b50916310f1dbf49e6ec;
    stim[26] = 144'hebbd4ceed0ddccf805a886e0db2665ce8aea;
    stim[27] = 144'h46b1b538dfa97f66085c6b8104938a404f09;
    stim[28] = 144'h2e4671e3abbf246919eeb0284132adceab25;
    stim[29] = 144'h8c0a9ee6e5c76826b5e31db30d1ac21b1b72;
    stim[30] = 144'he1e0424e6c312e250c8a38bc805f4ceb2807;
    stim[31] = 144'h7133e402ee2bf30547e59be2aa880b01ae2e;
    stim[32] = 144'hc81db95357e168392056af572bb0b7fa542e;
    stim[33] = 144'h4be28597730b1f7f33411f4073c517b28b78;
    stim[34] = 144'hf0c121ef776689fcb370e902ddf494664452;
    stim[35] = 144'hb508104e3604ac42c5c345178e96f8a1b850;
    stim[36] = 144'hf47a0c979bbf2b7a98cf26ec3f10fc6db856;
    stim[37] = 144'h1d5a0a0a9433c7442b71ab7d140997d0a477;
    stim[38] = 144'haa5835f7f534383d0ac1967c8f627eaa9d9a;
    stim[39] = 144'h455cbbc314c51ebe0e36a64a9fc611e4519b;
    stim[40] = 144'hf1acebb99fb444348a2f3db57571c9319375;
    stim[41] = 144'hbe81bbbdfaa30b186cc883616f8aaa179518;
    stim[42] = 144'hce4a288a2ecfc935f9a1ec19a3811ada2d64;
    stim[43] = 144'hd92046dd682ffeb5f81af989c245aa5aa1a2;
    stim[44] = 144'h87b7bb2d939553de30e5e12983eac2f8eff7;
    stim[45] = 144'h25916f7c5a7a5ed974df51ca7ac3bd7b24f2;
    stim[46] = 144'h7d41b334a520d15eddfde10ad7804e6013b2;
    stim[47] = 144'h75dc65b876c24502212bb2db88fad6a05b93;
    stim[48] = 144'h0c4fe34d7a6312d27e680a8cac237448838f;
    stim[49] = 144'hf6cc8a9e34a3814da868f444a65850a6f017;
    stim[50] = 144'h2e1ab7456bf0c236e02133015f208894fc7c;
    stim[51] = 144'hd63019c581042fd96fa289a56e94fe8c894a;
    stim[52] = 144'hed2e9530cf3522d5de5503bcdd0f7de3225d;
    stim[53] = 144'h7cef19052e6d96e63278bb6255b28b11fa18;
    stim[54] = 144'h0ef1fd1a55fbd13ed27c32daae2b88889342;
    stim[55] = 144'h955edbb22ada57bb7f9f552dc50682c775db;
    stim[56] = 144'h7c1f26fb352b576d5599a0827c32254bd68e;
    stim[57] = 144'h936f5b0cd1fcc920b566471ffb296f950488;
    stim[58] = 144'h146a45d9be6a5359ab5481816d1128a40611;
    stim[59] = 144'hc26a703f5b0776389d51d57578f25c049d70;
    stim[60] = 144'h8a17ffff2736d598a429e17c0a33fa3cd590;
    stim[61] = 144'h3b7266a0d07ef4a93a13b87fa9a30023cb28;
    stim[62] = 144'hd83425afb72756929f99148e0edfbccd0b3a;
    stim[63] = 144'hf5dc9dc4eeac0e26c4d427c66608b5d4dc95;
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
      expv[0] = 32'hb66c0e1d;
      expv[1] = 32'h14dc24f8;
      expv[2] = 32'hd4d07f97;
      expv[3] = 32'h4918e2a5;
      expv[4] = 32'hb599131d;
      expv[5] = 32'h716ddeb9;
      expv[6] = 32'hb2c8864c;
      expv[7] = 32'hd0e60c51;
      expv[8] = 32'h757a48e4;
      expv[9] = 32'h7c50b3e0;
      expv[10] = 32'hc22b738c;
      expv[11] = 32'h87384257;
      expv[12] = 32'he52cb889;
      expv[13] = 32'h3e634d24;
      expv[14] = 32'h0311fd86;
      expv[15] = 32'hfa8d341d;
      expv[16] = 32'h583a4625;
      expv[17] = 32'h99657f06;
      expv[18] = 32'hb3ba7101;
      expv[19] = 32'h9e60be73;
      expv[20] = 32'h7d1eb0ac;
      expv[21] = 32'h76ca2199;
      expv[22] = 32'h66f767db;
      expv[23] = 32'he3f732f5;
      expv[24] = 32'h705dc7f7;
      expv[25] = 32'h975ad887;
      expv[26] = 32'h05a886e0;
      expv[27] = 32'hdfa97f66;
      expv[28] = 32'habbf2469;
      expv[29] = 32'hb5e31db3;
      expv[30] = 32'h805f4ceb;
      expv[31] = 32'h47e59be2;
      expv[32] = 32'h2056af57;
      expv[33] = 32'h4be28597;
      expv[34] = 32'hb370e902;
      expv[35] = 32'hb508104e;
      expv[36] = 32'h98cf26ec;
      expv[37] = 32'h140997d0;
      expv[38] = 32'h0ac1967c;
      expv[39] = 32'h9fc611e4;
      expv[40] = 32'h9fb44434;
      expv[41] = 32'hbe81bbbd;
      expv[42] = 32'hce4a288a;
      expv[43] = 32'hf81af989;
      expv[44] = 32'h83eac2f8;
      expv[45] = 32'h74df51ca;
      expv[46] = 32'hddfde10a;
      expv[47] = 32'h88fad6a0;
      expv[48] = 32'hac237448;
      expv[49] = 32'ha65850a6;
      expv[50] = 32'h2e1ab745;
      expv[51] = 32'h6fa289a5;
      expv[52] = 32'hcf3522d5;
      expv[53] = 32'h7cef1905;
      expv[54] = 32'hd27c32da;
      expv[55] = 32'hc50682c7;
      expv[56] = 32'h5599a082;
      expv[57] = 32'h936f5b0c;
      expv[58] = 32'hbe6a5359;
      expv[59] = 32'hc26a703f;
      expv[60] = 32'h8a17ffff;
      expv[61] = 32'h3b7266a0;
      expv[62] = 32'h9f99148e;
      expv[63] = 32'heeac0e26;
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
