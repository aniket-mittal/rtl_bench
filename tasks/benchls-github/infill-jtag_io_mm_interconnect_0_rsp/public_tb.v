// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 113;
  localparam OW = 112;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  jtag_io_mm_interconnect_0_rsp_demux dut (
    .clk(clk),
    .sink_valid(in_vec[112:112]),
    .sink_data(in_vec[111:8]),
    .sink_channel(in_vec[7:4]),
    .sink_startofpacket(in_vec[3:3]),
    .sink_endofpacket(in_vec[2:2]),
    .src0_ready(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .sink_ready(out_vec[111:111]),
    .src0_valid(out_vec[110:110]),
    .src0_data(out_vec[109:6]),
    .src0_channel(out_vec[5:2]),
    .src0_startofpacket(out_vec[1:1]),
    .src0_endofpacket(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 113'h09c918509dd7fbe496e4269a1e139;
    stim[1] = 113'h171d2bf08b22eade29a727fcf695b;
    stim[2] = 113'h055e776670f81c9bbfc658fbed4b8;
    stim[3] = 113'h1475c28e83a9e7981432f52ad6be4;
    stim[4] = 113'h146618c0029c0a57a2f2851724f0a;
    stim[5] = 113'h1dabb8572031998935a2fd508f3be;
    stim[6] = 113'h17e9560fb3534fe3d356ee3b8e032;
    stim[7] = 113'h1a6e66d9c382041442251358a2144;
    stim[8] = 113'h0196e80e177214d0a4edef2c4466a;
    stim[9] = 113'h152c46c4e12a44339709faaf2dd0e;
    stim[10] = 113'h1759b2910701d5f286b1482287502;
    stim[11] = 113'h03bd7d2cd1fbb5415dac27f0dcd16;
    stim[12] = 113'h1679e7a8a41845728fea84ae22ec2;
    stim[13] = 113'h183aad1c0a2ff57f35e3f8a7e8356;
    stim[14] = 113'h10a27fdf942935e50c13fa4900e66;
    stim[15] = 113'h18983f3a2551bab0f9b080458a9b6;
    stim[16] = 113'h0dee0e5c3a52d1dab7e453d27457c;
    stim[17] = 113'h16cacbef95b53199b04dbaeee9770;
    stim[18] = 113'h01f81efe1ccf2d8d398265488983a;
    stim[19] = 113'h1097e3905994d308e7fa9908fd134;
    stim[20] = 113'h1b49f1b21f34b4e3d724ee240c8dc;
    stim[21] = 113'h14ee27885d507defec2cb2dc9f7b0;
    stim[22] = 113'h1be06e20884a10e8b376fd7438e80;
    stim[23] = 113'h19967b8df1e0f6344969d9cd450c4;
    stim[24] = 113'h072c675be16947704ea676c48602e;
    stim[25] = 113'h157242ab8a0e2a9d83696b02fad32;
    stim[26] = 113'h05aebdbc3669bf6be608ece2836ce;
    stim[27] = 113'h02d444a96b97cde7c0a72a620ff4c;
    stim[28] = 113'h1e59a472779b8e15b900ceb446b48;
    stim[29] = 113'h0d14e55c3123dd0ff08cdb882bfb0;
    stim[30] = 113'h1899f4610ee92f7a30f29e80e0c5e;
    stim[31] = 113'h184b6a441f89b3630d6f185fcc3e2;
    stim[32] = 113'h1d7521fe1c775ffba27d42eb882e2;
    stim[33] = 113'h14509e69a7d375c523b213f6b14e0;
    stim[34] = 113'h07058202eb46e835bb61f01eac6f0;
    stim[35] = 113'h16b79734a9d810e673d5adf5212a2;
    stim[36] = 113'h112a4f21ba83a6c9b14929daa870c;
    stim[37] = 113'h1543628602109ae825cdd10ff2dce;
    stim[38] = 113'h0521e597c1cd0951d0e41b1989be6;
    stim[39] = 113'h17f917c0fc4e4d2f15fb170e10010;
    stim[40] = 113'h059e301a8713c44e2d988c8bae806;
    stim[41] = 113'h0bae4c91f870f9c65da350ec0e34e;
    stim[42] = 113'h1c4f4816a25f2151da2516cae2ed2;
    stim[43] = 113'h0826c7d3bdee88833bbe39a783a56;
    stim[44] = 113'h17601b8b0ddf5d926a05bce687e8a;
    stim[45] = 113'h0e7d7d0d11de6dcd69bf9a82dbf88;
    stim[46] = 113'h11fb6559f2b1721df31497d3da764;
    stim[47] = 113'h129f25682c548d859cb44c905a5e8;
    stim[48] = 113'h1599277d9618fecf4f4f617edbc4a;
    stim[49] = 113'h15574be3c787f8f6ac869ecb52ec0;
    stim[50] = 113'h097b8c53dcae77c263e48e34198e8;
    stim[51] = 113'h0888de174cdcd0f2025710d5b2310;
    stim[52] = 113'h188ba8e067d947753a2eb577f8e98;
    stim[53] = 113'h11b37419f961f0744eb906ff9d448;
    stim[54] = 113'h131cca63710a4d298aadc0b64a8ca;
    stim[55] = 113'h044e65df78a56c42be39150268dc4;
    stim[56] = 113'h1c868ff293af7312678cc6646f00a;
    stim[57] = 113'h18a63191414366bffd432c4c37d8c;
    stim[58] = 113'h0f30770c249910c408c16959f4026;
    stim[59] = 113'h04851ba216ca684f531e75f4f7d68;
    stim[60] = 113'h03afe03e2e94bbfdab933fec74db0;
    stim[61] = 113'h13b3af09c0d72dc8f44f033e08b5a;
    stim[62] = 113'h10b4bc4e4eaf09f92f217341564f6;
    stim[63] = 113'h15efc8546a54073a785e2e93f2f54;
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
      expv[0] = 112'h27246142775fef925b909a687846;
      expv[1] = 112'hdc74afc22c8bab78a69c9ff3da4a;
      expv[2] = 112'h1579dd99c3e0726eff1963efb516;
      expv[3] = 112'h11d70a3a0ea79e6050cbd4ab5add;
      expv[4] = 112'h119863000a70295e8bca145c93c2;
      expv[5] = 112'hf6aee15c80c66624d68bf5423cd7;
      expv[6] = 112'hdfa5583ecd4d3f8f4d5bb8ee3804;
      expv[7] = 112'h29b99b670e08105108944d628849;
      expv[8] = 112'h065ba0385dc8534293b7bcb1118e;
      expv[9] = 112'h14b11b1384a910ce5c27eabcb743;
      expv[10] = 112'h1d66ca441c0757ca1ac5208a1d40;
      expv[11] = 112'h8ef5f4b347eed50576b09fc37341;
      expv[12] = 112'h19e79ea2906115ca3faa12b88b98;
      expv[13] = 112'he0eab47028bfd5fcd78fe29fa0c9;
      expv[14] = 112'h0289ff7e50a4d794304fe924038d;
      expv[15] = 112'he260fce89546eac3e6c201162a55;
      expv[16] = 112'h37b83970e94b476adf914f49d14f;
      expv[17] = 112'h5b2b2fbe56d4c666c136ebbba5cc;
      expv[18] = 112'h87e07bf8733cb634e60995222606;
      expv[19] = 112'h425f8e4166534c239fea6423f445;
      expv[20] = 112'h6d27c6c87cd2d38f5c93b890321b;
      expv[21] = 112'h53b89e217541f7bfb0b2cb727dd4;
      expv[22] = 112'h2f81b882212843a2cddbf5d0e390;
      expv[23] = 112'h2659ee37c783d8d125a767351419;
      expv[24] = 112'h1cb19d6f85a51dc13a99db121807;
      expv[25] = 112'hd5c90aae2838aa760da5ac0beb44;
      expv[26] = 112'h16baf6f0d9a6fdaf9823b38a0d9b;
      expv[27] = 112'h0b5112a5ae5f379f029ca9883fcb;
      expv[28] = 112'h396691c9de6e3856e4033ad11aca;
      expv[29] = 112'h34539570c48f743fc2336e20afd4;
      expv[30] = 112'he267d1843ba4bde8c3ca7a03830b;
      expv[31] = 112'h212da9107e26cd8c35bc617f30dc;
      expv[32] = 112'h35d487f871dd7fee89f50bae209c;
      expv[33] = 112'h114279a69f4dd7148ec84fdac51c;
      expv[34] = 112'h1c16080bad1ba0d6ed87c07ab19c;
      expv[35] = 112'h1ade5cd2a7604399cf56b7d48494;
      expv[36] = 112'h04a93c86ea0e9b26c524a76aa1c3;
      expv[37] = 112'h150d8a1808426ba09737443fcb5b;
      expv[38] = 112'h1487965f0734254743906c6626dd;
      expv[39] = 112'h5fe45f03f13934bc57ec5c384000;
      expv[40] = 112'h1678c06a1c4f1138b662322eba01;
      expv[41] = 112'h2eb93247e1c3e719768d43b038cb;
      expv[42] = 112'hf13d205a897c854768945b2b8b98;
      expv[43] = 112'ha09b1f4ef7ba220ceef8e69e0e89;
      expv[44] = 112'h1d806e2c377d7649a816f39a1f92;
      expv[45] = 112'h39f5f4344779b735a6fe6a0b6fd2;
      expv[46] = 112'h07ed9567cac5c877cc525f4f69cd;
      expv[47] = 112'h0a7c95a0b152361672d13241695e;
      expv[48] = 112'h16649df65863fb3d3d3d85fb6f0a;
      expv[49] = 112'h155d2f8f1e1fe3dab21a7b2d4b98;
      expv[50] = 112'h25ee314f72b9df098f9238d0661e;
      expv[51] = 112'h2223785d337343c8095c4356c8c0;
      expv[52] = 112'h622ea3819f651dd4e8bad5dfe392;
      expv[53] = 112'h06cdd067e587c1d13ae41bfe750a;
      expv[54] = 112'h0c73298dc42934a62ab702d92a1a;
      expv[55] = 112'h1139977de295b10af8e45409a359;
      expv[56] = 112'h321a3fca4ebdcc499e331991bc02;
      expv[57] = 112'h2298c645050d9afff50cb130df53;
      expv[58] = 112'h3cc1dc30926443102305a567d005;
      expv[59] = 112'h12146e885b29a13d4c79d7d3df4e;
      expv[60] = 112'h0ebf80f8ba52eff6ae4cffb1d354;
      expv[61] = 112'hcecebc27035cb723d13c0cf822ca;
      expv[62] = 112'hc2d2f1393abc27e4bc85cd05591d;
      expv[63] = 112'h57bf2151a9501ce9e178ba4fcbc9;
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
