// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 137;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01373 dut (
    .clk(clk),
    .data(in_vec[136:9]),
    .we(in_vec[8:8]),
    .addr(in_vec[7:0]),
    .out(out_vec[127:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 137'h18e666ae4a4f40eb9b36457ea94d72e8cf0;
    stim[1] = 137'h00f8e8507c0f86caa43d38223937c1c9e4e;
    stim[2] = 137'h0ec14edf7b76d53371cb9634f7c9f59cd24;
    stim[3] = 137'h0de537abb46ea140a1634a7cb9f5ba4d0f8;
    stim[4] = 137'h1428adf81d4ec667017426a4fbe95412e45;
    stim[5] = 137'h07bc3a172152cde81f709c2f973ea64f92c;
    stim[6] = 137'h1f3b5584aff5ec071c4d065aca06f249fb2;
    stim[7] = 137'h1914fe8bbaf493d563af9dbcde124e30543;
    stim[8] = 137'h09c68b09ef34a74b4508de2b8c0dc2bb31b;
    stim[9] = 137'h10e1f023dc5c3a6f2d8e03a5ed4e6c4a6a7;
    stim[10] = 137'h175d9fc262496ef8240f4a97e55465cdee2;
    stim[11] = 137'h15b55ccc3acf89f85592ab068a1bec7a24b;
    stim[12] = 137'h00b1977e4d164389b186a04189d13a6d5f8;
    stim[13] = 137'h1d4082a4d59307b6910d0002fcf9379175a;
    stim[14] = 137'h1eb88dce2d020c48d834eb18fac54b5ea6b;
    stim[15] = 137'h0874d99ac8d6bee16808b667b63dad85df9;
    stim[16] = 137'h04bcbd969c7c692f047a1c9512a3ffea1ba;
    stim[17] = 137'h115edf058779d2221c11ed4ee25f26e1697;
    stim[18] = 137'h10ec09ecfe753a5b0ccb22c16bd541acba0;
    stim[19] = 137'h062f1459ab53d5018db33c6c99632206014;
    stim[20] = 137'h1855c51694ae104a2dfd68127e76039c144;
    stim[21] = 137'h05d1d88cbfcb0c02d3d76c2eae91389f18d;
    stim[22] = 137'h03d916c204e520a28758b107d9e5a5ef31d;
    stim[23] = 137'h1423e03bb56e91abc95cc6c13a7d4a11bda;
    stim[24] = 137'h089df254db11d88b7158fc2fbbfa4744d38;
    stim[25] = 137'h0315e8c66f48e5aefcba9fc50cd490a9f0a;
    stim[26] = 137'h04e1f11184537dabf3e2a9e92407a1fa0c6;
    stim[27] = 137'h0f6e613b8948dbc8f6f6a56733de305ec08;
    stim[28] = 137'h170762c322bc02ba5d651a044695b9b6965;
    stim[29] = 137'h1229178aca3d9444d82a72e13fa4c21896b;
    stim[30] = 137'h198579348c629ff76451a038ec3cd441b45;
    stim[31] = 137'h1f726444e824d674b42f580da99b4cf62ce;
    stim[32] = 137'h1ddd1ae9ee3a4cf78640dd8817f26627530;
    stim[33] = 137'h111b992b51fbf1514b028289cc4cc2e9ae7;
    stim[34] = 137'h15d2ee9a19e4e37aa2f11b337a6c3c41517;
    stim[35] = 137'h16cc87c2e3b6f727939db331e8d94af646c;
    stim[36] = 137'h06eaab2305374fb73e188841d60858c5e53;
    stim[37] = 137'h0abe5b4543535df103b8861d50c45f167c3;
    stim[38] = 137'h0c507f39299aaa677e2e6218ed718decd4c;
    stim[39] = 137'h19636121045a146f5ac0f3891129331da6b;
    stim[40] = 137'h07d00bba2f47b4ea71b62a4baddf86570b8;
    stim[41] = 137'h0d73ec53cb17c23dfdb8330f173d7558be9;
    stim[42] = 137'h1860d318299ea23f738e001f88ff405c0c4;
    stim[43] = 137'h1160dd3a9ad122a59ca22e8bbc6e62e9c0d;
    stim[44] = 137'h16490db61590212d7bdaeec04f5812f18e0;
    stim[45] = 137'h026cf2e799dee5243d9e0ec09a6571cd029;
    stim[46] = 137'h13acbd7d87cfd31ab4bc021034cc1005754;
    stim[47] = 137'h125913a18e35edd414206199911de8d9834;
    stim[48] = 137'h1e6825165e5764d96dd9720a51e5a13de6f;
    stim[49] = 137'h0ddac3832379b11d6f374221dd992b59def;
    stim[50] = 137'h1b91642db934aa5981d98e75df0fa765d3e;
    stim[51] = 137'h0f1220ee2ce91f2add1065ee70037ca7c1c;
    stim[52] = 137'h021d15af930d9557a65b885b5f2e70224ff;
    stim[53] = 137'h09b43e19242bb400e69e1d5cd29a0f6ce6a;
    stim[54] = 137'h170189511f0e895998e64fdf034f710fb98;
    stim[55] = 137'h179929f7ad3c0f6412deb501aa8fe95f5f3;
    stim[56] = 137'h1f1f6aa3040e2d928bc2d1fc4109fd74227;
    stim[57] = 137'h02c0f7b94aed54a97d646eeb24a981843a0;
    stim[58] = 137'h0dbaceb57b47bd8c13154e3c52ae1a38dd5;
    stim[59] = 137'h0aec4861a17d245197f7e9ead6c6f496dad;
    stim[60] = 137'h177bb3f808315421f754a6d12e6b16764c6;
    stim[61] = 137'h0d603950c60ed7b0e76418fa0db4b55a67c;
    stim[62] = 137'h0002d335a4d6284e73a23edfdece379bac3;
    stim[63] = 137'h0335e21a790358e940f7eff98ccd59ad200;
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
      expv[0] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[24] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[36] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[37] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[38] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[39] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[40] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[41] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[45] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[47] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[48] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[49] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[50] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[51] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[54] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[55] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 128'h87604f67f3a9d2d86659160b5eaa0d65;
      expv[59] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[62] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[63] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
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
