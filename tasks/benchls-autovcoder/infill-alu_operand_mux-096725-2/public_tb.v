// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 99;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_096725 dut (
    .A(in_vec[98:67]),
    .B(in_vec[66:35]),
    .shift(in_vec[34:34]),
    .AluB_1(in_vec[33:33]),
    .ins(in_vec[32:1]),
    .syscall(in_vec[0:0]),
    .aluX(out_vec[63:32]),
    .aluY(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 99'h78275cca61201bb56a48c65e6;
    stim[1] = 99'h1948d1dcc24e8afd25ec80d1f;
    stim[2] = 99'h397eb1085354126a287f2d3fe;
    stim[3] = 99'h3021bcf863cb4e39fcbb52634;
    stim[4] = 99'h7652d88c8d0b04009e21001ff;
    stim[5] = 99'h794801af5a9c55fa041a6751f;
    stim[6] = 99'h70cd11e61a2ecc3ff14b6ae3d;
    stim[7] = 99'h12a63d231d7b13107ff7b3907;
    stim[8] = 99'h37f495156cc312a22544a9cc7;
    stim[9] = 99'h18e43231bd06345be9999c799;
    stim[10] = 99'h3fdf278752ca20d256c2e1393;
    stim[11] = 99'h52c8247d48dcc5dc257edea25;
    stim[12] = 99'h7fddb8018d5c7693a09ac05be;
    stim[13] = 99'h7f9a440237e789ba34796cb16;
    stim[14] = 99'h7fad6f3457d61d47e2dd25401;
    stim[15] = 99'h00937cf22328a854fa4846ddf;
    stim[16] = 99'h038c8894554a18c2acf590260;
    stim[17] = 99'h350f5b7c82158d342c886c27f;
    stim[18] = 99'h482f0c08b81bbd6934aea96c0;
    stim[19] = 99'h2ecefe8aacae582a9c5df543f;
    stim[20] = 99'h632be729e37de23366d89a4c8;
    stim[21] = 99'h692d92f43f1bbf0a8a79f5550;
    stim[22] = 99'h02b903600ac998f0f9146704a;
    stim[23] = 99'h5525af43bf089f31089ee71ab;
    stim[24] = 99'h4cc643eab57526865c1629085;
    stim[25] = 99'h105c7e2d20ef85543d7efbbdd;
    stim[26] = 99'h4112807441e49c5f6841fa8f9;
    stim[27] = 99'h2c31d8d506471e5b72c648b47;
    stim[28] = 99'h4b4b31dd6cc3b078d8a97ae6b;
    stim[29] = 99'h78e81f1a9ef11ab1b93a03337;
    stim[30] = 99'h2b1b6af56a297ca6ad2c63981;
    stim[31] = 99'h1a5359f58ce37ebbe8b531c6b;
    stim[32] = 99'h18a1e87038c3a2eda08d3d0c6;
    stim[33] = 99'h7eb05507edcd9b502413049d6;
    stim[34] = 99'h23a5d57550295dc62d82d2275;
    stim[35] = 99'h23bc4ea113888fce6b31a0725;
    stim[36] = 99'h18140e5025479285dccf4f564;
    stim[37] = 99'h59e5ceb4e531a3d2a7f224931;
    stim[38] = 99'h70a74d82fdcd6d096dd3ce7ae;
    stim[39] = 99'h66814651c8d36fa2dc2c6922b;
    stim[40] = 99'h55e306fe499b24c1208e10515;
    stim[41] = 99'h3facda1db517b48b4478059df;
    stim[42] = 99'h121e9effda05d7c11a9b2e7f0;
    stim[43] = 99'h1706fd0b7d365db2a88d66215;
    stim[44] = 99'h05a2c117ef1d600e9cb697d17;
    stim[45] = 99'h579f1dc389f02c4d617dcd915;
    stim[46] = 99'h3aa1b177d400dcb60f421c8f4;
    stim[47] = 99'h099e280ac3a6ac180c47205fa;
    stim[48] = 99'h565325aea831087555de64ca0;
    stim[49] = 99'h35aaf270cf1d9cfeafa2309a5;
    stim[50] = 99'h70ae15602e286b072cf158d66;
    stim[51] = 99'h5e1c515dfc29da2270e63e9e3;
    stim[52] = 99'h5cf60eb32cab61997356f2af1;
    stim[53] = 99'h1d8cc6f4f361d319c56c73d39;
    stim[54] = 99'h19da5c7946a6bae36f39a5dde;
    stim[55] = 99'h2595f8651505dcdd5a33c79bf;
    stim[56] = 99'h3b0be6021d2b3323ca4d270ea;
    stim[57] = 99'h6ee97d551b74eec0ac02bc3e0;
    stim[58] = 99'h02a5b3f419674deda300605ba;
    stim[59] = 99'h3122d2ccee14cae19f1b8a6aa;
    stim[60] = 99'h7ab0aa4395ddf5afbd0200905;
    stim[61] = 99'h4f83d08e7ca71f5ca29d547a2;
    stim[62] = 99'h49eb4b192e3ad4ca5d8ad3f2e;
    stim[63] = 99'h6606c1097f0b14e32fe800431;
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
      expv[0] = 64'hc240376a524632f3;
      expv[1] = 64'h3291a3b90000000a;
      expv[2] = 64'h72fd621043f969ff;
      expv[3] = 64'hc7969c73e5da931a;
      expv[4] = 64'heca5b1190000000a;
      expv[5] = 64'hf290035e0000000a;
      expv[6] = 64'h345d987f0000000a;
      expv[7] = 64'h3af626200000000a;
      expv[8] = 64'h6fe92a2a0000000a;
      expv[9] = 64'h7a0c68b70000000a;
      expv[10] = 64'ha59441a40000000a;
      expv[11] = 64'ha59048fa0000000a;
      expv[12] = 64'hffbb700304d602df;
      expv[13] = 64'hff348804a3cb658b;
      expv[14] = 64'hafac3a8f0000000a;
      expv[15] = 64'h465150a90000000a;
      expv[16] = 64'h0719112867ac8130;
      expv[17] = 64'h6a1eb6f90000000a;
      expv[18] = 64'h905e1811a5754b60;
      expv[19] = 64'h5d9dfd150000000a;
      expv[20] = 64'hc6fbc46636c4d264;
      expv[21] = 64'hd25b25e87e377e15;
      expv[22] = 64'h159331e1c8a33825;
      expv[23] = 64'haa4b5e870000000a;
      expv[24] = 64'h6aea4d0c0000000a;
      expv[25] = 64'h20b8fc5a0000000a;
      expv[26] = 64'h83c938be0000000a;
      expv[27] = 64'h0c8e3cb60000000a;
      expv[28] = 64'hd98760f10000000a;
      expv[29] = 64'hf1d03e350000000a;
      expv[30] = 64'h5636d5ea0000000a;
      expv[31] = 64'h19c6fd770000000a;
      expv[32] = 64'h3143d0e00469e863;
      expv[33] = 64'hfd60aa0f209824eb;
      expv[34] = 64'h474baaea0000000a;
      expv[35] = 64'h27111f9c0000000a;
      expv[36] = 64'h4a8f250b4a8f250b;
      expv[37] = 64'hb3cb9d690000000a;
      expv[38] = 64'hfb9ada126e9e73d7;
      expv[39] = 64'h91a6df450000000a;
      expv[40] = 64'habc60dfc0000000a;
      expv[41] = 64'h6a2f69160000000a;
      expv[42] = 64'h243d3dffb40baf82;
      expv[43] = 64'h2e0dfa160000000a;
      expv[44] = 64'h0b45822f0000000a;
      expv[45] = 64'h13e0589a0000000a;
      expv[46] = 64'h754362efa801b96c;
      expv[47] = 64'h133c5015874d5830;
      expv[48] = 64'h506210ea506210ea;
      expv[49] = 64'h6b55e4e10000000a;
      expv[50] = 64'he15c2ac0678ac6b3;
      expv[51] = 64'hf853b4440000000a;
      expv[52] = 64'h5956c3320000000a;
      expv[53] = 64'he6c3a6330000000a;
      expv[54] = 64'h8d4d75c679cd2eef;
      expv[55] = 64'h2a0bb9ba0000000a;
      expv[56] = 64'h3a5666473a566647;
      expv[57] = 64'hddd2faaa6015e1f0;
      expv[58] = 64'h054b67e8180302dd;
      expv[59] = 64'h6245a599dc2995c3;
      expv[60] = 64'hf56154870000000a;
      expv[61] = 64'h9f07a11c14eaa3d1;
      expv[62] = 64'h5c75a9945c75a994;
      expv[63] = 64'hcc0d82120000000a;
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
