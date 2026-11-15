// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 86;
  localparam OW = 39;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10942 dut (
    .clk(clk),
    .reset(in_vec[85:85]),
    .sw_reset(in_vec[84:84]),
    .sw_stop(in_vec[83:83]),
    .length(in_vec[82:51]),
    .eop_enabled(in_vec[50:50]),
    .eop(in_vec[49:49]),
    .ready(in_vec[48:48]),
    .valid(in_vec[47:47]),
    .early_termination(in_vec[46:46]),
    .address_in(in_vec[45:14]),
    .write_in(in_vec[13:13]),
    .max_burst_count(in_vec[12:10]),
    .write_fifo_used(in_vec[9:4]),
    .waitrequest(in_vec[3:3]),
    .short_first_access_enable(in_vec[2:2]),
    .short_last_access_enable(in_vec[1:1]),
    .short_first_and_last_access_enable(in_vec[0:0]),
    .address_out(out_vec[38:7]),
    .write_out(out_vec[6:6]),
    .burst_count(out_vec[5:3]),
    .stall(out_vec[2:2]),
    .reset_taken(out_vec[1:1]),
    .stopped(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 86'h2a328dc07ed66874229299;
    stim[1] = 86'h2e541cc7372b79a7d177ab;
    stim[2] = 86'h282582e03b1a6ec310e026;
    stim[3] = 86'h0c133ba09387765e2d638f;
    stim[4] = 86'h16fe16b01d58036bef96b8;
    stim[5] = 86'h1f651411c4fe807e7894b8;
    stim[6] = 86'h15b1f4de5dc17cc862ae4e;
    stim[7] = 86'h1fad84d8845067f474a952;
    stim[8] = 86'h1d82c040dfaeb937958657;
    stim[9] = 86'h1d4ab7907ef0382464fa78;
    stim[10] = 86'h1905bb4e4e815c904a30f9;
    stim[11] = 86'h0909190b7de76786a3d5c7;
    stim[12] = 86'h1dc0650f6da1f1026bed77;
    stim[13] = 86'h059277b13f9c2a7420914e;
    stim[14] = 86'h0c0d29358ef3b8dcf08fc5;
    stim[15] = 86'h1d717d6565e40f0295e7a4;
    stim[16] = 86'h1ab5363cca61b2fb7d9449;
    stim[17] = 86'h1fce5d615ca9fdb173cbcf;
    stim[18] = 86'h142636a5fdc3fc44a8ab27;
    stim[19] = 86'h052bd8ce761318a0a6c741;
    stim[20] = 86'h079bd8d12f754043e04d65;
    stim[21] = 86'h06e3841990c974499b6830;
    stim[22] = 86'h10c81fb5d4a9db43493b9c;
    stim[23] = 86'h161e6022aebd751a25b4d6;
    stim[24] = 86'h034937b71bbb2248c9a1dc;
    stim[25] = 86'h0c92ba07e9c49a2cdc0888;
    stim[26] = 86'h1b184d07435d8faf871537;
    stim[27] = 86'h0c192a72dad053b1b42475;
    stim[28] = 86'h1b7d3361a61b635f14494c;
    stim[29] = 86'h17f8952b8c4044b691bd87;
    stim[30] = 86'h17498b28b995e1af3ea5a2;
    stim[31] = 86'h1093e3ce87834806f2ea37;
    stim[32] = 86'h1c58aa49085101816b1ede;
    stim[33] = 86'h05c0e7a3ae5644423e7c1f;
    stim[34] = 86'h0eaf62df9f948da8b171e3;
    stim[35] = 86'h05b3a5258fc4663ca7066c;
    stim[36] = 86'h0c878fc476309abfdee56d;
    stim[37] = 86'h1a8ec91c5bacc3d5964e3d;
    stim[38] = 86'h1ac91f40173e419063b58d;
    stim[39] = 86'h131dac20dd491f4a4584de;
    stim[40] = 86'h17350e6f31a924efe96953;
    stim[41] = 86'h0110d2b785b02467afd186;
    stim[42] = 86'h13493d7a3772cdbc486a4d;
    stim[43] = 86'h0c6a2bf5a391a2cd4b2765;
    stim[44] = 86'h0a8b0ca4b4e190d05f4298;
    stim[45] = 86'h1cad5385bfd72218aa45e7;
    stim[46] = 86'h0013690baacb6ce4e37594;
    stim[47] = 86'h00a857db59102be1eb1946;
    stim[48] = 86'h180c505d7a580bdf5d8c0f;
    stim[49] = 86'h076feb2a08ae97f8bbfb5f;
    stim[50] = 86'h19df30082e77dc13f1b55a;
    stim[51] = 86'h0f75125fb368eefb284c55;
    stim[52] = 86'h18a1fb2f84a8dd27ccfad1;
    stim[53] = 86'h0372bc2984c633718718bc;
    stim[54] = 86'h1a907d5ef637570d662d72;
    stim[55] = 86'h017c0e2163572d12ee1f18;
    stim[56] = 86'h170cb104a0013d15b8e518;
    stim[57] = 86'h09a2d099601c9666f26fc2;
    stim[58] = 86'h076d646a57bdfd558df15a;
    stim[59] = 86'h127c47b462f905520f8d49;
    stim[60] = 86'h30ec5df48a4b9a99d86513;
    stim[61] = 86'h1439569f3afcbe7f5089df;
    stim[62] = 86'h03910a83124eaf7f017fda;
    stim[63] = 86'h06e577376568cc6620d91d;
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
      expv[0] = 39'h0000000005;
      expv[1] = 39'h0000000005;
      expv[2] = 39'h0000000005;
      expv[3] = 39'h0000000005;
      expv[4] = 39'h0eecbc5a8e;
      expv[5] = 39'h0eecbc5a8f;
      expv[6] = 39'h0eecbc5a8e;
      expv[7] = 39'h02f990c50f;
      expv[8] = 39'h20cfe8e90f;
      expv[9] = 39'h20cfe8e90f;
      expv[10] = 39'h607048c98f;
      expv[11] = 39'h02b920940d;
      expv[12] = 39'h02b920940f;
      expv[13] = 39'h43e204d78c;
      expv[14] = 39'h43e204d78d;
      expv[15] = 39'h43e204d78f;
      expv[16] = 39'h481e052b8f;
      expv[17] = 39'h481e052b8f;
      expv[18] = 39'h481e052b8e;
      expv[19] = 39'h07f889510c;
      expv[20] = 39'h07f889510c;
      expv[21] = 39'h07f889510c;
      expv[22] = 39'h12e89336c8;
      expv[23] = 39'h12e89336c8;
      expv[24] = 39'h12e893368c;
      expv[25] = 39'h7644919348;
      expv[26] = 39'h7644919348;
      expv[27] = 39'h764491930d;
      expv[28] = 39'h20a763680f;
      expv[29] = 39'h20a763680e;
      expv[30] = 39'h00896d230e;
      expv[31] = 39'h2bc35e7d0e;
      expv[32] = 39'h06900de58f;
      expv[33] = 39'h06900de58c;
      expv[34] = 39'h2c88847cc8;
      expv[35] = 39'h2c88847c8c;
      expv[36] = 39'h2c88847c8d;
      expv[37] = 39'h61357fbd8f;
      expv[38] = 39'h61357fbd8f;
      expv[39] = 39'h7c8320c70e;
      expv[40] = 39'h7c8320c70e;
      expv[41] = 39'h5249dfd28c;
      expv[42] = 39'h5249dfd28e;
      expv[43] = 39'h659b78908d;
      expv[44] = 39'h23459a960d;
      expv[45] = 39'h23459a960f;
      expv[46] = 39'h23459a960c;
      expv[47] = 39'h16d9c9c6c8;
      expv[48] = 39'h16d9c9c68f;
      expv[49] = 39'h16d9c9c68c;
      expv[50] = 39'h5d2ff177c8;
      expv[51] = 39'h5d2ff177c8;
      expv[52] = 39'h5d2ff1778f;
      expv[53] = 39'h51ba4f998c;
      expv[54] = 39'h51ba4f998f;
      expv[55] = 39'h6eae1acc0c;
      expv[56] = 39'h6eae1acc0e;
      expv[57] = 39'h027a2b718d;
      expv[58] = 39'h392ccde48c;
      expv[59] = 39'h7bfaab1bc8;
      expv[60] = 39'h0000000006;
      expv[61] = 39'h0000000006;
      expv[62] = 39'h0000000004;
      expv[63] = 39'h1d5efe02c8;
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
