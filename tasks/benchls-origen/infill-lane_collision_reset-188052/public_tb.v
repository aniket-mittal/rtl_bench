// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 91;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_188052 dut (
    .CLK(clk),
    .go(in_vec[90:90]),
    .x_lane0(in_vec[89:82]),
    .x_lane1(in_vec[81:74]),
    .x_lane2(in_vec[73:66]),
    .x_lane3(in_vec[65:58]),
    .x_lane4(in_vec[57:50]),
    .y_lane0(in_vec[49:43]),
    .y_lane1(in_vec[42:36]),
    .y_lane2(in_vec[35:29]),
    .y_lane3(in_vec[28:22]),
    .y_lane4(in_vec[21:15]),
    .x_dot(in_vec[14:7]),
    .y_dot(in_vec[6:0]),
    .resetn(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 91'h4bea47682daaf91140deab4;
    stim[1] = 91'h0256703fdd8327aa9e9a295;
    stim[2] = 91'h21c9a43b9b3103f9bd19579;
    stim[3] = 91'h44c6bb4f39bb6e327c586b6;
    stim[4] = 91'h3de241388c0a7962a7f3ce1;
    stim[5] = 91'h094f60d6cd976ebd0307975;
    stim[6] = 91'h5a30923e1395d9e8d419131;
    stim[7] = 91'h3f4b05b7ed4dbc47cf60718;
    stim[8] = 91'h2fb3953496b07f4afabcff4;
    stim[9] = 91'h75dfb4d962c232fa16bfd09;
    stim[10] = 91'h790dbe7ba926744e4297c50;
    stim[11] = 91'h05cbaf0d87f99d2a17d146a;
    stim[12] = 91'h60319c1b2cbb84415be1bcd;
    stim[13] = 91'h337a798005e8c341fd6d798;
    stim[14] = 91'h4824350d56711b46f3f6c0d;
    stim[15] = 91'h19d84f6a773ac753a2d1631;
    stim[16] = 91'h592268a8893533d29a339cc;
    stim[17] = 91'h56b7057d8306b775e4b3b57;
    stim[18] = 91'h64060e29548b29118223b13;
    stim[19] = 91'h34aaa20abcae3882a0b6b44;
    stim[20] = 91'h1252e78e7e24d4873fab995;
    stim[21] = 91'h67a3c82f5696832a89ee497;
    stim[22] = 91'h21118a2dca83465aec29e7d;
    stim[23] = 91'h555f64ff124c858df1f18b9;
    stim[24] = 91'h0b86ba1915e3137a260edb3;
    stim[25] = 91'h3f9fc19c2078f8532bca0ea;
    stim[26] = 91'h064a3fb464e4056eff68f6f;
    stim[27] = 91'h7ce898d163fc7c4640ce091;
    stim[28] = 91'h4ca6fd7f8291480c3899218;
    stim[29] = 91'h0e836c316e4585bd12c9eb1;
    stim[30] = 91'h0dc201578182d63c1f2c6f7;
    stim[31] = 91'h08139a758d6565bec01f132;
    stim[32] = 91'h78a873477a2443c134d27a1;
    stim[33] = 91'h2abc29955ea659e27649f72;
    stim[34] = 91'h2886a542c5733b8e69330ce;
    stim[35] = 91'h58e4b63baee45a9054bd3ea;
    stim[36] = 91'h313b6b04e4ff4416c1fdea4;
    stim[37] = 91'h2a0eae060664a47a1c62c4d;
    stim[38] = 91'h4d0822c25aafd86a99b4a14;
    stim[39] = 91'h019ba67df2ea294f0fca28c;
    stim[40] = 91'h60c254760e7cdda168fd6a9;
    stim[41] = 91'h227f5ddf1efdf8745e25399;
    stim[42] = 91'h14f5629b2026b9303f673dd;
    stim[43] = 91'h13657816dccafd3ca66bd3b;
    stim[44] = 91'h3835d652c17b5996d0c4f83;
    stim[45] = 91'h1ab3c4e55b2ae599cd8d4c7;
    stim[46] = 91'h137e3f200b750b66c505422;
    stim[47] = 91'h12318b059e2db6be267d7e6;
    stim[48] = 91'h76c6a7c0cce46eb279b5b41;
    stim[49] = 91'h69f703c7e204655fed26294;
    stim[50] = 91'h6ce98837bf1d38413cb656c;
    stim[51] = 91'h63e1c4988edf276752f2764;
    stim[52] = 91'h3576ed2d904b5278d2692a2;
    stim[53] = 91'h776fc36330617acb87dceca;
    stim[54] = 91'h32821fef07ed21f0d8f85c0;
    stim[55] = 91'h40ea4cf7335dc54232d0d47;
    stim[56] = 91'h340520d71122bde8c39f9a3;
    stim[57] = 91'h5b5be002ce1a4eedf8694bc;
    stim[58] = 91'h54602723932e9a9dc67d8a1;
    stim[59] = 91'h4ee207abdd1e7b9aa097e4f;
    stim[60] = 91'h02b6d0c3c2a811411aef324;
    stim[61] = 91'h3106602696d958be0e89cc0;
    stim[62] = 91'h3284ce2ba354fe4597f42ba;
    stim[63] = 91'h16cf792002910b92824a50e;
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
      expv[0] = 1'h1;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
