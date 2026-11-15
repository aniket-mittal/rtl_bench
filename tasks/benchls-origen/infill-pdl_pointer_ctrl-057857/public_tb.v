// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_057857 dut (
    .clk(clk),
    .reset(in_vec[42:42]),
    .state_alu(in_vec[41:41]),
    .state_fetch(in_vec[40:40]),
    .state_read(in_vec[39:39]),
    .state_write(in_vec[38:38]),
    .ob(in_vec[37:6]),
    .destpdlp(in_vec[5:5]),
    .destpdlx(in_vec[4:4]),
    .pdlcnt(in_vec[3:3]),
    .srcpdlidx(in_vec[2:2]),
    .srcpdlpop(in_vec[1:1]),
    .srcpdlptr(in_vec[0:0]),
    .pdlidx(out_vec[21:12]),
    .pdlptr(out_vec[11:2]),
    .pidrive(out_vec[1:1]),
    .ppdrive(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h7ef6a533275;
    stim[1] = 43'h462a05ec273;
    stim[2] = 43'h07c5a17cd98;
    stim[3] = 43'h03c1dabe754;
    stim[4] = 43'h28bb16cb512;
    stim[5] = 43'h216e1d6b140;
    stim[6] = 43'h17fcc960f4b;
    stim[7] = 43'h16159f79614;
    stim[8] = 43'h3e3250e1de6;
    stim[9] = 43'h22b4de61611;
    stim[10] = 43'h2b66abaebc8;
    stim[11] = 43'h204c60b9f9e;
    stim[12] = 43'h221e8703d24;
    stim[13] = 43'h2132b3ed157;
    stim[14] = 43'h165fd360def;
    stim[15] = 43'h1fd4604f1c5;
    stim[16] = 43'h0fd291f7d7f;
    stim[17] = 43'h2f02e12c14c;
    stim[18] = 43'h1283b1e18b1;
    stim[19] = 43'h21519c3de58;
    stim[20] = 43'h32fbe12df04;
    stim[21] = 43'h3bc01a8f1c4;
    stim[22] = 43'h262f8d111cc;
    stim[23] = 43'h11e9ddb2451;
    stim[24] = 43'h1b74f3c8c8e;
    stim[25] = 43'h09ff48b1724;
    stim[26] = 43'h0dd98de5bb9;
    stim[27] = 43'h1956a6dbc58;
    stim[28] = 43'h0f07053c51e;
    stim[29] = 43'h0bf45811abe;
    stim[30] = 43'h14427f9943a;
    stim[31] = 43'h121d3e5cbbf;
    stim[32] = 43'h171e4c27c5c;
    stim[33] = 43'h0e7f8e8b8d6;
    stim[34] = 43'h32bf109fa80;
    stim[35] = 43'h2dd3bcb6b8a;
    stim[36] = 43'h21bfd738a61;
    stim[37] = 43'h0c3ca68cd41;
    stim[38] = 43'h243bc6e806d;
    stim[39] = 43'h381a7c6c7df;
    stim[40] = 43'h2dd88d92aa6;
    stim[41] = 43'h25cfc955750;
    stim[42] = 43'h3d206531ce0;
    stim[43] = 43'h0705c978c01;
    stim[44] = 43'h24156191b53;
    stim[45] = 43'h1e4641a2d6b;
    stim[46] = 43'h0a1aa73339a;
    stim[47] = 43'h268cf9533b6;
    stim[48] = 43'h084bb214c52;
    stim[49] = 43'h3d55c00e75a;
    stim[50] = 43'h392ee11074c;
    stim[51] = 43'h250a5f70942;
    stim[52] = 43'h1c910217a38;
    stim[53] = 43'h3cec0bcbbff;
    stim[54] = 43'h0b7dd5fbc7f;
    stim[55] = 43'h09b588cd618;
    stim[56] = 43'h1bc184366e7;
    stim[57] = 43'h18b4dc8c490;
    stim[58] = 43'h19255adabe9;
    stim[59] = 43'h2f069972567;
    stim[60] = 43'h0173b6673d4;
    stim[61] = 43'h1df11d2097b;
    stim[62] = 43'h1a52c2bbb33;
    stim[63] = 43'h3d1ec843c9f;
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
      expv[0] = 22'h000003;
      expv[1] = 22'h000001;
      expv[2] = 22'h000000;
      expv[3] = 22'h336000;
      expv[4] = 22'h336000;
      expv[5] = 22'h336000;
      expv[6] = 22'h336001;
      expv[7] = 22'h336ffe;
      expv[8] = 22'h258ffe;
      expv[9] = 22'h258ffd;
      expv[10] = 22'h258ffc;
      expv[11] = 22'h258002;
      expv[12] = 22'h258002;
      expv[13] = 22'h258003;
      expv[14] = 22'h258003;
      expv[15] = 22'h2580df;
      expv[16] = 22'h2580df;
      expv[17] = 22'h1f50de;
      expv[18] = 22'h1f50e1;
      expv[19] = 22'h1f5188;
      expv[20] = 22'h1f518a;
      expv[21] = 22'h1f518a;
      expv[22] = 22'h1f518a;
      expv[23] = 22'h1f5189;
      expv[24] = 22'h1f518a;
      expv[25] = 22'h1f5188;
      expv[26] = 22'h1f5189;
      expv[27] = 22'h16e188;
      expv[28] = 22'h16e18e;
      expv[29] = 22'h31418c;
      expv[30] = 22'h31418c;
      expv[31] = 22'h250943;
      expv[32] = 22'h250cba;
      expv[33] = 22'h1f1cba;
      expv[34] = 22'h2e3cb8;
      expv[35] = 22'h2e3cb8;
      expv[36] = 22'h2e3cb9;
      expv[37] = 22'h2e3cb9;
      expv[38] = 22'h2e3cbb;
      expv[39] = 22'h2e3cbb;
      expv[40] = 22'h2e3cba;
      expv[41] = 22'h2e3cb8;
      expv[42] = 22'h15dcb8;
      expv[43] = 22'h15dcb9;
      expv[44] = 22'h15dcb9;
      expv[45] = 22'h06dcb9;
      expv[46] = 22'h06dcb8;
      expv[47] = 22'h06dcba;
      expv[48] = 22'h0cecb8;
      expv[49] = 22'h0cecb8;
      expv[50] = 22'h39dcba;
      expv[51] = 22'h39dcbc;
      expv[52] = 22'h39dcbc;
      expv[53] = 22'h1e8cbf;
      expv[54] = 22'h2efcbc;
      expv[55] = 22'h2efcbc;
      expv[56] = 22'h2efcc3;
      expv[57] = 22'h2efcc0;
      expv[58] = 22'h2efcc1;
      expv[59] = 22'h2efcc3;
      expv[60] = 22'h2efcc0;
      expv[61] = 22'h2efcc1;
      expv[62] = 22'h025cc1;
      expv[63] = 22'h025cc3;
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
