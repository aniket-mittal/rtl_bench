// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 97;
  localparam OW = 72;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_025695 dut (
    .clk(clk),
    .rst(in_vec[96:96]),
    .readA_clkEn(in_vec[95:95]),
    .readA_addr(in_vec[94:90]),
    .readB_clkEn(in_vec[89:89]),
    .readB_addr(in_vec[88:84]),
    .writeA_clkEn(in_vec[83:83]),
    .writeA_addr(in_vec[82:78]),
    .writeA_data(in_vec[77:42]),
    .writeB_clkEn(in_vec[41:41]),
    .writeB_addr(in_vec[40:36]),
    .writeB_data(in_vec[35:0]),
    .readA_data(out_vec[71:36]),
    .readB_data(out_vec[35:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 97'h106d98553dc972e6be053c091;
    stim[1] = 97'h1a3df35f1000d77e8265cf45c;
    stim[2] = 97'h0388b10b8e0a019cda1343228;
    stim[3] = 97'h0f560b1190241275d5103f7e0;
    stim[4] = 97'h01866f4cb1a6e9c4fd708770c;
    stim[5] = 97'h0cc8db7af1ba663ce66a2c3d2;
    stim[6] = 97'h0e6c01ee248cc9c700a24de1d;
    stim[7] = 97'h0046b81e27fde39d52a53704b;
    stim[8] = 97'h0a07600307a2800145f1635f2;
    stim[9] = 97'h08c88102089c2ea66eee86203;
    stim[10] = 97'h04b7e06b2366ca2fbe6a4af36;
    stim[11] = 97'h0fe384de67be06cad924fe53a;
    stim[12] = 97'h0860534ec648aa4ebc3ecd54b;
    stim[13] = 97'h0108d9dc9445d02517e96fe2e;
    stim[14] = 97'h024ef6915b39cd424ab46b497;
    stim[15] = 97'h039328cd2bbf7592c3cb046f0;
    stim[16] = 97'h0a9f3281cab332f1cebfbb5fc;
    stim[17] = 97'h08efab952c47eb666f24b9a20;
    stim[18] = 97'h06bd1417806cba4cde84612c1;
    stim[19] = 97'h0f2e304a12cb7888e644f2623;
    stim[20] = 97'h00a26ba5bd7ed6dc654d66d3f;
    stim[21] = 97'h06dc23545c97912dd640b18d1;
    stim[22] = 97'h060632f0155fae130621e42bc;
    stim[23] = 97'h02e445f845c4ba4a71a2fbf24;
    stim[24] = 97'h080fcf1e0328956059674f93b;
    stim[25] = 97'h0e47f072d3bfe5f2cd1e1f2ea;
    stim[26] = 97'h0f64a045cfdc5378a8040eb95;
    stim[27] = 97'h076fb551acd21f8b3e2e59a03;
    stim[28] = 97'h01996e4ee319cc44382f8f396;
    stim[29] = 97'h087bebbb6e6417ea0d1da56bb;
    stim[30] = 97'h00ce84a4d770fdc24fa813426;
    stim[31] = 97'h0ada3299144d8f041f63b0ede;
    stim[32] = 97'h0c7727eaf456a154dcfcb2608;
    stim[33] = 97'h0de664c0bfc139b6cee2efa58;
    stim[34] = 97'h00d7fb0ea9eb5a756c5ff6d54;
    stim[35] = 97'h00728e07d217b6afbc395ff34;
    stim[36] = 97'h033c73822467243679cb378d9;
    stim[37] = 97'h038cbc5b4e2cf6a27cc825a00;
    stim[38] = 97'h0ef05f4a1f8ada8deb5723a7e;
    stim[39] = 97'h1c7bde16365d8dac988445ecc;
    stim[40] = 97'h0db1db629e37858cb8cd40a5a;
    stim[41] = 97'h082045635a49606f627676581;
    stim[42] = 97'h0b4a0dfd3349840b02b805e3e;
    stim[43] = 97'h028dfaac68c15c65766d96a22;
    stim[44] = 97'h085afc7a43dbb9c07777fe906;
    stim[45] = 97'h052c7251393aa1d28ea208d83;
    stim[46] = 97'h0b61c5d4b42050dcb4e0137cd;
    stim[47] = 97'h00022b8eff3ee418b70e1067f;
    stim[48] = 97'h06f62b2fb0ed6969eb92c4990;
    stim[49] = 97'h0a432f15c5bc0f29eeb28644d;
    stim[50] = 97'h04bc1699a9c13f29272a7ffc5;
    stim[51] = 97'h0893942c4daab82538df00441;
    stim[52] = 97'h04bf3e7f7933496317aa6e521;
    stim[53] = 97'h03ca7c21c6b5812c0872a7c76;
    stim[54] = 97'h0acff035b81415865227bcd93;
    stim[55] = 97'h06048aa5b65819fdd7466d23a;
    stim[56] = 97'h00c391b464dac2de906f2eea2;
    stim[57] = 97'h0ff9feef0859b815b91a743a6;
    stim[58] = 97'h05b831ece9cbd54d430ef5511;
    stim[59] = 97'h0fc66a529c639ff64c5a0340c;
    stim[60] = 97'h05a8302e94764f45a24c4b242;
    stim[61] = 97'h049c36f22c272b6f95c6547e7;
    stim[62] = 97'h042b30382a710d8cf95257c01;
    stim[63] = 97'h08e40971aa58e83d12a0f7b67;
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
      expv[0] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[1] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[2] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[3] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[4] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[5] = 72'hbe053c091be053c091;
      expv[6] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[7] = 72'hxxxxxxxxx42e382806;
      expv[8] = 72'hxxxxxxxxxbe053c091;
      expv[9] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[10] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[11] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[12] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[13] = 72'h3799ef81b4082270ba;
      expv[14] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[15] = 72'hxxxxxxxxx0789ff78e;
      expv[16] = 72'h0789ff78exxxxxxxxx;
      expv[17] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[18] = 72'hxxxxxxxxxbe6a4af36;
      expv[19] = 72'hxxxxxxxxxa456ce735;
      expv[20] = 72'he66a2c3d20789ff78e;
      expv[21] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[22] = 72'hxxxxxxxxxe66a2c3d2;
      expv[23] = 72'h1ac8d9b286f24b9a20;
      expv[24] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[25] = 72'h59674f93bbe6a4af36;
      expv[26] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[27] = 72'ha456ce735xxxxxxxxx;
      expv[28] = 72'ha456ce735be6a4af36;
      expv[29] = 72'h6f24b9a20xxxxxxxxx;
      expv[30] = 72'h3799ef81bxxxxxxxxx;
      expv[31] = 72'hxxxxxxxxx0789ff78e;
      expv[32] = 72'hxxxxxxxxxeedb9905f;
      expv[33] = 72'hcebfbb5fcxxxxxxxxx;
      expv[34] = 72'hxxxxxxxxx6f24b9a20;
      expv[35] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[36] = 72'h2935dc3f7cd1e1f2ea;
      expv[37] = 72'h42e3828061cb4eff97;
      expv[38] = 72'h0789ff78e42e382806;
      expv[39] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[40] = 72'hcebfbb5fcxxxxxxxxx;
      expv[41] = 72'hd8a78de16cebfbb5fc;
      expv[42] = 72'h59674f93b59674f93b;
      expv[43] = 72'h546b3487e0d1da56bb;
      expv[44] = 72'h0d1da56bb546b3487e;
      expv[45] = 72'h2935dc3f7eedb9905f;
      expv[46] = 72'hxxxxxxxxx988445ecc;
      expv[47] = 72'h546b3487e2935dc3f7;
      expv[48] = 72'h59674f93b7cc825a00;
      expv[49] = 72'hxxxxxxxxxd8a78de16;
      expv[50] = 72'heeb28644d81f485eda;
      expv[51] = 72'hcd1e1f2ea1cb4eff97;
      expv[52] = 72'h7cc825a00c780ca255;
      expv[53] = 72'hcd1e1f2ea1e90f6ee7;
      expv[54] = 72'h6276765810d1da56bb;
      expv[55] = 72'hxxxxxxxxx627676581;
      expv[56] = 72'ha8040eb95xxxxxxxxx;
      expv[57] = 72'h17aa6e52117aa6e521;
      expv[58] = 72'hbbc2166e0xxxxxxxxx;
      expv[59] = 72'hd8a78de16a8040eb95;
      expv[60] = 72'hbbc2166e06f24b9a20;
      expv[61] = 72'h4c5a0340c1173f714d;
      expv[62] = 72'hcd1e1f2ea0d6e05056;
      expv[63] = 72'hxxxxxxxxxxxxxxxxxx;
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
