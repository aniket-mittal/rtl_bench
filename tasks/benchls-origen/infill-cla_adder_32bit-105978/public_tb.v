// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_105978 dut (
    .A(in_vec[63:32]),
    .B(in_vec[31:0]),
    .Sum(out_vec[32:1]),
    .C(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'hf3850ef123eb3bd6;
    stim[1] = 64'h4bb6184fa117a08b;
    stim[2] = 64'h041ccb0f9814d6bc;
    stim[3] = 64'hbf94ded03d049158;
    stim[4] = 64'h267ee0cbad4eda39;
    stim[5] = 64'h3bbd3f2a1816285f;
    stim[6] = 64'h477a87a6baed4834;
    stim[7] = 64'h23109fd786f239d6;
    stim[8] = 64'h5cca73227a50dd34;
    stim[9] = 64'hf8a6d216e59462e6;
    stim[10] = 64'h432ef98aaf3e9fec;
    stim[11] = 64'hbb2ea8ebe3a7cabd;
    stim[12] = 64'h26bc263818781f6b;
    stim[13] = 64'h54a6cac1a5382013;
    stim[14] = 64'hb99ae90a12b26583;
    stim[15] = 64'hb6cb05abdaf489ba;
    stim[16] = 64'h7c63216500336380;
    stim[17] = 64'ha590d496f3553010;
    stim[18] = 64'hb6a403e2a3a1d3f9;
    stim[19] = 64'hb4ea7508844553a5;
    stim[20] = 64'hdfc4407b15fb283d;
    stim[21] = 64'haa04e4523012a65f;
    stim[22] = 64'h4e7e73fd8cb4654b;
    stim[23] = 64'hf25d079fb9f479a0;
    stim[24] = 64'hb4eaf642d5ce2481;
    stim[25] = 64'ha21814433a54145e;
    stim[26] = 64'h42fd999ed315b916;
    stim[27] = 64'h93da994790a44bb1;
    stim[28] = 64'h606c51fc7012d801;
    stim[29] = 64'hcaec47f6a0fb767c;
    stim[30] = 64'h492cc702ab0e093f;
    stim[31] = 64'h966f212564007070;
    stim[32] = 64'h4c8a158ce3d3fd3b;
    stim[33] = 64'hb1ab1950c67dbcaa;
    stim[34] = 64'h771a0381532d0edf;
    stim[35] = 64'hcb3ffca83554f260;
    stim[36] = 64'hf645b68618f47e4f;
    stim[37] = 64'hbaaa9e7d5e32941f;
    stim[38] = 64'h89193d35db641335;
    stim[39] = 64'hace5b1aaa5bea2cd;
    stim[40] = 64'h28761759fadde41f;
    stim[41] = 64'he0f9efb0f9420fa8;
    stim[42] = 64'h2a95e9abd7c3c3de;
    stim[43] = 64'h783b129e05cf77c7;
    stim[44] = 64'h79033cc8e4d1c579;
    stim[45] = 64'hc8021d4a608c6b17;
    stim[46] = 64'h190ff5871ab2eb78;
    stim[47] = 64'hc29c4e1c5aa1738f;
    stim[48] = 64'ha7058377ee7b612e;
    stim[49] = 64'hb2edc61dd0cc1175;
    stim[50] = 64'h1657d06b7ab760b6;
    stim[51] = 64'h6561c7ea47a1f89d;
    stim[52] = 64'hcc5207d3ac9ff74a;
    stim[53] = 64'h8e94b1b1436c6917;
    stim[54] = 64'h039afc6d2f21a13c;
    stim[55] = 64'hca77ffd5cdd5f10d;
    stim[56] = 64'h16af4b4633de61d3;
    stim[57] = 64'h159c0e12d03e0073;
    stim[58] = 64'h33ceb2ea58b5bd5b;
    stim[59] = 64'hafa80f418ff66bdb;
    stim[60] = 64'h62b0ac09383d3db8;
    stim[61] = 64'ha55fd0e0a16fcf8e;
    stim[62] = 64'h9643976880328a00;
    stim[63] = 64'h9f83a34c2d137371;
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
      expv[0] = 33'h02ee0958f;
      expv[1] = 33'h1d99b71b4;
      expv[2] = 33'h138634396;
      expv[3] = 33'h1f932e050;
      expv[4] = 33'h1a79b7608;
      expv[5] = 33'h0a7a6cf12;
      expv[6] = 33'h004cf9fb5;
      expv[7] = 33'h15405b35a;
      expv[8] = 33'h1ae36a0ac;
      expv[9] = 33'h1bc7669f9;
      expv[10] = 33'h1e4db32ec;
      expv[11] = 33'h13dace751;
      expv[12] = 33'h07e688b46;
      expv[13] = 33'h1f3bdd5a8;
      expv[14] = 33'h1989a9d1a;
      expv[15] = 33'h1237f1ecb;
      expv[16] = 33'h0f92d09ca;
      expv[17] = 33'h131cc094d;
      expv[18] = 33'h0b48bafb7;
      expv[19] = 33'h0725f915b;
      expv[20] = 33'h1eb7ed170;
      expv[21] = 33'h1b42f1562;
      expv[22] = 33'h1b665b290;
      expv[23] = 33'h158a3027f;
      expv[24] = 33'h115723587;
      expv[25] = 33'h1b8d85142;
      expv[26] = 33'h02c26a569;
      expv[27] = 33'h048fdc9f1;
      expv[28] = 33'h1a0fe53fa;
      expv[29] = 33'h0d7cf7ce5;
      expv[30] = 33'h1e875a082;
      expv[31] = 33'h1f4df232a;
      expv[32] = 33'h060bc258f;
      expv[33] = 33'h0f051abf5;
      expv[34] = 33'h1948e24c0;
      expv[35] = 33'h00129de11;
      expv[36] = 33'h01e7469ab;
      expv[37] = 33'h031ba6539;
      expv[38] = 33'h0c8faa0d5;
      expv[39] = 33'h0a548a8ef;
      expv[40] = 33'h046a7f6f1;
      expv[41] = 33'h1b477feb1;
      expv[42] = 33'h004b35b13;
      expv[43] = 33'h0fc1514ca;
      expv[44] = 33'h0bbaa0483;
      expv[45] = 33'h0511d10c3;
      expv[46] = 33'h06785c1fe;
      expv[47] = 33'h03a7b8357;
      expv[48] = 33'h12b01c94b;
      expv[49] = 33'h10773af25;
      expv[50] = 33'h1221e6242;
      expv[51] = 33'h15a07810e;
      expv[52] = 33'h0f1e3fe3b;
      expv[53] = 33'h1a4023590;
      expv[54] = 33'h065793b52;
      expv[55] = 33'h1309be1c5;
      expv[56] = 33'h0951b5a32;
      expv[57] = 33'h1cbb41d0a;
      expv[58] = 33'h11908e08a;
      expv[59] = 33'h07f3cf639;
      expv[60] = 33'h135dbd382;
      expv[61] = 33'h08d9f40dd;
      expv[62] = 33'h02cec42d1;
      expv[63] = 33'h1992e2d7a;
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
