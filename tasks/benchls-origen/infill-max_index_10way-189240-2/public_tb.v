// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 260;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_189240 dut (
    .out1(in_vec[259:234]),
    .out2(in_vec[233:208]),
    .out3(in_vec[207:182]),
    .out4(in_vec[181:156]),
    .out5(in_vec[155:130]),
    .out6(in_vec[129:104]),
    .out7(in_vec[103:78]),
    .out8(in_vec[77:52]),
    .out9(in_vec[51:26]),
    .out10(in_vec[25:0]),
    .max(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 260'h13c495d86c2d9cf8cfc00e428e5f69ac6dae3d818f0cfde446b1dc1482926f989;
    stim[1] = 260'ha3d35bc566ae1f4a6509ec4adbeca471696efc66d27966696d6649e1781a33c37;
    stim[2] = 260'h1711949a463b088a35cf7d9c658310837682c32b849cf1e843ca81c505be300a5;
    stim[3] = 260'h2d9910abc43c711caebdb4b750518158f7e2c365430971981255c3d98d774df8f;
    stim[4] = 260'he9da04cf497efde750c9ff14124828bd0a70c8770a45004980dcd58adfb49838c;
    stim[5] = 260'h022f36fea9749dc1ddcbfe36a50fb60b71bf0ba79b7eed793c4607a946465d8c5;
    stim[6] = 260'h180e81d4314c8fe19634c506d29c5f13898cb71ff5b9daea14ee006ed594c7483;
    stim[7] = 260'h28d15e11706d33648d8f20f79ba87a1c4fde1e135e7d2de785137565fbeda6ff0;
    stim[8] = 260'h4ecf557a0663e8a70790e6f41e54f2fe189a75ac2ad825e34c97962974f860f26;
    stim[9] = 260'h4fc8f54b29b28a4b9a2298bb446da844d8fcb5e0d87ab9e19cc127c8b6fe1f422;
    stim[10] = 260'hc22f6b79560bf05b2998dd025c0544631ab17ae484ebb0eaf03900235ff1dcd6e;
    stim[11] = 260'h535b2a781941581b70c71b5c701dfea16b7fdc7e764d90598c4c3e3977c138327;
    stim[12] = 260'hf9629ddd9dde2dd6becf95c13e6e6cb440859526265ee8b541e9eaac106b172cd;
    stim[13] = 260'h1cf15cff7f42cc217e8443e291e69ae71b84f71f803f6cbdef6171b052bbdf853;
    stim[14] = 260'hfa5bc896e575d0c843d92e65406d95fd900cae66c0784418dc1d12347d3577822;
    stim[15] = 260'h13d1c56e7568fea625529484b9386974c893985197cc4a0729dc68f591f38ae88;
    stim[16] = 260'hdfe795a89c69c88f28e0374711de278ae4f218d1245eba8749cd4cb40857bf809;
    stim[17] = 260'haff75ab4c88fd7030d588972c7c32cb72406c192f1e400d8d78474b936059bd3e;
    stim[18] = 260'hf43aaaaafc97ebc96b768d64d214ce514ced8f6ec219fb1c2fbb98652f01683b5;
    stim[19] = 260'h82fb7944c595cf05905b37fff4e166f32b5539eaea303d5f00b80a44a9a9ff761;
    stim[20] = 260'h3a5bce4ba12e79ecf82e662c8754fa4dca048ac77e176921b2d34572578bf4cd0;
    stim[21] = 260'hafc9cb01617383dad7d7995f13e06bf2170daf1fbde7cda4119f758120c6b8a1b;
    stim[22] = 260'hdd2349749742c2ae40e684192e177d0b4689d28709dd433cd0addb1fc611f5c20;
    stim[23] = 260'h47be6c8be57fc2992c488617d84efb4e4572ffe2caf0a19e22e81039ef663ae58;
    stim[24] = 260'hc22a2f2d374f3c9d5a37c38f42d81e4ab9a13fe1bb02bc6b2828342d0875ae6b8;
    stim[25] = 260'hfd8cfd965e96dd499193298bf70bba1f2dd611b7d3e7dd6d8b9e59028655a6b43;
    stim[26] = 260'hc50e27a6ffdd0e59bc8e1c99907b7b452ff0c4b146ba3163458e8aad6bb3e15c3;
    stim[27] = 260'hc0f7f2e2c1a1c720cbfc19bc95644ff7a201ecd2c0c6561b80845c7af4b7b69bc;
    stim[28] = 260'h17741e8fb8859884ce731a50754de50e1d4ab6e7a7046aa6f67b0ff7939177207;
    stim[29] = 260'hfa8bba3df7622ec13c0a67420d430dd8d99dd4a6bdb46969c5df092b562c6de9c;
    stim[30] = 260'hf61988f002f468c775c736f33ae995aa68ef7c27b5ad6417557f2917fe8a31f5d;
    stim[31] = 260'h2f4427dfc8a902f133d7c7c780650889087ae714a072564f26ff09bcf58efc5ff;
    stim[32] = 260'ha98350354289f2e7a2bfc17f77aa6aced26e8b0c205badb7c5bcb1b6d31d74a56;
    stim[33] = 260'h07e0b6a1c8871e15ab08ceddaa57db71a1394508fc932f0b2df7c69006cb97045;
    stim[34] = 260'h7f370201fa7e546d072acdd770db701eeab0092af185263008bd920242c55d407;
    stim[35] = 260'hbb92c1e537cd5b6cba27bfb43684a9ede15eca111acab65620bc74b11e4e6d829;
    stim[36] = 260'h3bcfa4350b8ef0913eba001e21d5202d0261fe56c92868441d0a942795cb2d165;
    stim[37] = 260'h3607235d75aa37b3d61c58f245e4cdf249667e897cb965f7d89cbf0c74879fc1f;
    stim[38] = 260'h7028e96bf013b07933e9b57f6ae35a8d4ecb921601a73627c90ae765a271c73e6;
    stim[39] = 260'hae8ac23eddd2fa03233cde17a911b295d4c60082fca7fda6760e476bc9cf2d899;
    stim[40] = 260'ha11d705d001ffdea492ffd21beb24398e59e4a1711921b18dbd3f1f80ad2520fd;
    stim[41] = 260'h91898488714986baf5e5c7eaa29987e3609009b9a6a90e7be510eaaed03b2441f;
    stim[42] = 260'h0cee0eb91ca9a3aebae9a00a6ea433d5906d8e2fb2dcfefc724dc82f67aa9cdc0;
    stim[43] = 260'hd724d6bcfd0c354fbc12b7e8b7714db4ead43a101afb6a9080596b550b32ff175;
    stim[44] = 260'h5d10419530b380c9bc32d7618cbe4c3b2ece57fbe4e644d02ecf0e5356a5a2cac;
    stim[45] = 260'h4818232c08e57ff23fe56c1747cd318593b0a4ecc18a9fa94132c28e5b9e59927;
    stim[46] = 260'hfa1404a08d8d4ccc459656e19a899c5c2f30781ecef8a4cdcc770e70a4cfbffc5;
    stim[47] = 260'h6dc40cca156281ad9a18259169db0fd311136be9b1ee376c7da5c174c3389f812;
    stim[48] = 260'h0dd8303d9fbda46972f69031ee4b8da8a002985e4dc55e04226185b17ca63bde4;
    stim[49] = 260'h6aac9bc77c9653b353f14a4888107be65c9871cacc84d9e9ed56a868383f8b17d;
    stim[50] = 260'haa83a091093932af7acaab7025389b2cba3ed10c88b088c716baef34648bdcd99;
    stim[51] = 260'h75ea80c40b7d81de9d30ec2efb83496b53108797a53e79b8874eac51a33892ae7;
    stim[52] = 260'h084ff966a0221a156039c5b6d4a85aff48433029b2fab5c56b3b2596857f8c6c2;
    stim[53] = 260'ha40a96bd47205e3c4e73d5b04d42b8776c5af7ebb3b85db807511f92141a8ad0b;
    stim[54] = 260'he836d582fb1d0285f230784f74e8f30f40d8196b3fb6bc4a17efd93b8a9529dda;
    stim[55] = 260'hf0cf5b6d3a6c1a71fc21fdb7856f000e18b9a585c40ce303124002d1905771c11;
    stim[56] = 260'hfe88ab059aedae8b5ee360cfb05070059327e29111f963d53a332f49e9a7d78fc;
    stim[57] = 260'hd69ca4064b08497a9620dd499f0e14f8b11eac762f99127e21973a9ccbdbb1000;
    stim[58] = 260'h317bf460443ef39ef1d7a48f825c55d4a9cba237cb914945d7d0666326928e756;
    stim[59] = 260'h57d377b6be7bc1f2c3fccbb4c13a81ad7d67de279bf501ce9fefad76ae39e0afa;
    stim[60] = 260'hfd7f3708d0ff24e2d121f56543d0fa1a90925f3ff21508f4addbb5d468a6516d5;
    stim[61] = 260'h094c32e52b0e9cbdf4f895d2bfa73c063ede5d44a0961fab61b937275c0ba56aa;
    stim[62] = 260'h53d483c8e8d85a0125aeb24a1f28b8192c9904b21d9dda69b07a70958aa440104;
    stim[63] = 260'h376f71a7f19d097b1ed3c6dcb72500f37771e8eb87e7a5f372bebbd6d0718049b;
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
      expv[0] = 4'h7;
      expv[1] = 4'h3;
      expv[2] = 4'h7;
      expv[3] = 4'h3;
      expv[4] = 4'h3;
      expv[5] = 4'h6;
      expv[6] = 4'h9;
      expv[7] = 4'h7;
      expv[8] = 4'h7;
      expv[9] = 4'h7;
      expv[10] = 4'h5;
      expv[11] = 4'h0;
      expv[12] = 4'h1;
      expv[13] = 4'h8;
      expv[14] = 4'h4;
      expv[15] = 4'h8;
      expv[16] = 4'h9;
      expv[17] = 4'h8;
      expv[18] = 4'h5;
      expv[19] = 4'h7;
      expv[20] = 4'h6;
      expv[21] = 4'h8;
      expv[22] = 4'h6;
      expv[23] = 4'h7;
      expv[24] = 4'h8;
      expv[25] = 4'h6;
      expv[26] = 4'h4;
      expv[27] = 4'h2;
      expv[28] = 4'h6;
      expv[29] = 4'h6;
      expv[30] = 4'h6;
      expv[31] = 4'h1;
      expv[32] = 4'h9;
      expv[33] = 4'h4;
      expv[34] = 4'h0;
      expv[35] = 4'h8;
      expv[36] = 4'h6;
      expv[37] = 4'h7;
      expv[38] = 4'h0;
      expv[39] = 4'h7;
      expv[40] = 4'h1;
      expv[41] = 4'h3;
      expv[42] = 4'h3;
      expv[43] = 4'h4;
      expv[44] = 4'h0;
      expv[45] = 4'h9;
      expv[46] = 4'h9;
      expv[47] = 4'h0;
      expv[48] = 4'h4;
      expv[49] = 4'h7;
      expv[50] = 4'h1;
      expv[51] = 4'h6;
      expv[52] = 4'h3;
      expv[53] = 4'h7;
      expv[54] = 4'h9;
      expv[55] = 4'h3;
      expv[56] = 4'h4;
      expv[57] = 4'h9;
      expv[58] = 4'h6;
      expv[59] = 4'h6;
      expv[60] = 4'h3;
      expv[61] = 4'h6;
      expv[62] = 4'h8;
      expv[63] = 4'h7;
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
