// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 58;
  localparam OW = 58;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05847 dut (
    .wb_clk_i(clk),
    .cpu_byte_o(in_vec[57:57]),
    .cpu_memop(in_vec[56:56]),
    .cpu_m_io(in_vec[55:55]),
    .cpu_adr_o(in_vec[54:35]),
    .cpu_dat_o(in_vec[34:19]),
    .cpu_we_o(in_vec[18:18]),
    .wb_rst_i(in_vec[17:17]),
    .wb_dat_i(in_vec[16:1]),
    .wb_ack_i(in_vec[0:0]),
    .cpu_block(out_vec[57:57]),
    .cpu_dat_i(out_vec[56:41]),
    .wb_dat_o(out_vec[40:25]),
    .wb_adr_o(out_vec[24:6]),
    .wb_we_o(out_vec[5:5]),
    .wb_tga_o(out_vec[4:4]),
    .wb_sel_o(out_vec[3:2]),
    .wb_stb_o(out_vec[1:1]),
    .wb_cyc_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 58'h18a6e8a52caa0b8;
    stim[1] = 58'h1b12ce79d2eaa00;
    stim[2] = 58'h2caf650da91bb7b;
    stim[3] = 58'h3503157d3013bde;
    stim[4] = 58'h224f70487853607;
    stim[5] = 58'h3ed0e513b04e8ca;
    stim[6] = 58'h31363f55f383016;
    stim[7] = 58'h13961142935789b;
    stim[8] = 58'h0f001c2b2194a00;
    stim[9] = 58'h08e53df26554209;
    stim[10] = 58'h1e591118d4cba65;
    stim[11] = 58'h326edfabdfdbc8d;
    stim[12] = 58'h3f2ed00809d4c3b;
    stim[13] = 58'h2501767a76df446;
    stim[14] = 58'h3d2c15aa0611fcb;
    stim[15] = 58'h3be75bdd790f4eb;
    stim[16] = 58'h2fc7571e5d0b5e1;
    stim[17] = 58'h2cae8db9f54c1a8;
    stim[18] = 58'h0f18e772210e600;
    stim[19] = 58'h3f70d2584b4b84d;
    stim[20] = 58'h0370395148c2d42;
    stim[21] = 58'h308a1f047b08264;
    stim[22] = 58'h39739374ed5e7a2;
    stim[23] = 58'h2168cc4790999b3;
    stim[24] = 58'h39508d6b109bf03;
    stim[25] = 58'h08e986954a5e83f;
    stim[26] = 58'h25a50344d258968;
    stim[27] = 58'h00802f29c4436a3;
    stim[28] = 58'h31295ae0bc8fc1f;
    stim[29] = 58'h322a84055e8633a;
    stim[30] = 58'h29b458a5ec5dc55;
    stim[31] = 58'h3f2ba2e8f84577c;
    stim[32] = 58'h2cf97c8776da2ca;
    stim[33] = 58'h2f5b281919cf85f;
    stim[34] = 58'h01d2fa89220bbc4;
    stim[35] = 58'h0bb7661e7a847d1;
    stim[36] = 58'h39aeb8b45d52ad7;
    stim[37] = 58'h38a1459ae408e91;
    stim[38] = 58'h23774ad5fb496b9;
    stim[39] = 58'h3547386b7d4d478;
    stim[40] = 58'h07bc327fe741bca;
    stim[41] = 58'h13a9cc2542580ba;
    stim[42] = 58'h275ec9c1f5caa00;
    stim[43] = 58'h034106fa690b60b;
    stim[44] = 58'h31f93f26ff8a01a;
    stim[45] = 58'h13713ec1838047c;
    stim[46] = 58'h195bcb923205d94;
    stim[47] = 58'h13b54a5ba4868de;
    stim[48] = 58'h122ccad61b016ae;
    stim[49] = 58'h1ce8aa7290d2440;
    stim[50] = 58'h29d11cb789475be;
    stim[51] = 58'h2bba03b6b6d3d34;
    stim[52] = 58'h37092b0cedd162e;
    stim[53] = 58'h13e02909470852a;
    stim[54] = 58'h3cc6609ab21fa19;
    stim[55] = 58'h1db53172bd0d8e5;
    stim[56] = 58'h194cbab5a6560d8;
    stim[57] = 58'h2da2a155d9d53f5;
    stim[58] = 58'h3748c97cd15c4df;
    stim[59] = 58'h31c83797e9dd2f4;
    stim[60] = 58'h38087f1bfb8595c;
    stim[61] = 58'h13276aed9e9064d;
    stim[62] = 58'h134fa3d878d3122;
    stim[63] = 58'h1dbdc8a17e8a24e;
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
      expv[0] = 58'hxxxxxb29429ba1b;
      expv[1] = 58'hxxxxxe74ac4b3bf;
      expv[2] = 58'hxxxxx36a52bd957;
      expv[3] = 58'h1ff7bf4c140c544;
      expv[4] = 58'h1ff7b21e093dc24;
      expv[5] = 58'h200064ec1b43977;
      expv[6] = 58'h2000757ce4d8fc7;
      expv[7] = 58'h200070a4ce5846f;
      expv[8] = 58'h1789aac87c0071c;
      expv[9] = 58'h3789b95c8394f7b;
      expv[10] = 58'h3ff42635396447c;
      expv[11] = 58'h3ff437eae9bb7e8;
      expv[12] = 58'h3ff422027cbb434;
      expv[13] = 58'h1ff43e9db405da4;
      expv[14] = 58'h3ff4218a94b055b;
      expv[15] = 58'h3ff1fe574f9d6d8;
      expv[16] = 58'h3ff1e7975f1d5d4;
      expv[17] = 58'h1ff1fd4e72ba378;
      expv[18] = 58'h3ff1fc885c639df;
      expv[19] = 58'h3ff1f612ddc34b7;
      expv[20] = 58'h0004d4522dc0e6c;
      expv[21] = 58'h2004c11ec2287c7;
      expv[22] = 58'h2004dd3b45ce4f7;
      expv[23] = 58'h0004d1e425a3304;
      expv[24] = 58'h3ffb3ac42542357;
      expv[25] = 58'h3ff0328543a61b9;
      expv[26] = 58'h1ff0313496940e4;
      expv[27] = 58'h1ff02a710200bec;
      expv[28] = 58'h236a2f3824a568b;
      expv[29] = 58'h000fc157a8aa104;
      expv[30] = 58'h200fdb0966d163b;
      expv[31] = 58'h1ffdde1a3cae8b8;
      expv[32] = 58'h3ffddda1d3e5f3b;
      expv[33] = 58'h3ffdc6467d6ca37;
      expv[34] = 58'h2005e882474be89;
      expv[35] = 58'h2005e79eaedd997;
      expv[36] = 58'h3d05f74d06bae74;
      expv[37] = 58'h3d05f906a285194;
      expv[38] = 58'h3d05fed56ddd2e4;
      expv[39] = 58'h1d05fadf551ce24;
      expv[40] = 58'h1d05fff9def0cac;
      expv[41] = 58'h3d05e9508ea732f;
      expv[42] = 58'h1d05fd707d7b268;
      expv[43] = 58'h1d05fa5e8d04188;
      expv[44] = 58'h200b69bfe7e4fc7;
      expv[45] = 58'h200b60f06dc4f8b;
      expv[46] = 58'h200b6c84856f2db;
      expv[47] = 58'h200b76e92ed528f;
      expv[48] = 58'h200b66d588b328b;
      expv[49] = 58'h200b7ca433a2abf;
      expv[50] = 58'h200b624de74473b;
      expv[51] = 58'h200b6dadaee80fb;
      expv[52] = 58'h200b633b7c24ae7;
      expv[53] = 58'h200b6251cf80a4f;
      expv[54] = 58'h200b6c86b31981b;
      expv[55] = 58'h3fffbcaf56d4c5c;
      expv[56] = 58'h3fffa98d6532eb9;
      expv[57] = 58'h3fffb576768a877;
      expv[58] = 58'h3f5fbf345d23264;
      expv[59] = 58'h1f5fba65e720e24;
      expv[60] = 58'h3f5fa6fee021fd7;
      expv[61] = 58'h3f5fa7bb6c9da8b;
      expv[62] = 58'h3ff07e360d3e8e9;
      expv[63] = 58'h3ff07fa856f7257;
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
