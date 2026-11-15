// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 56;
  localparam OW = 59;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06503 dut (
    .clk(clk),
    .rst(in_vec[55:55]),
    .hcount_in(in_vec[54:45]),
    .hsync_in(in_vec[44:44]),
    .vcount_in(in_vec[43:34]),
    .vsync_in(in_vec[33:33]),
    .rgb_in(in_vec[32:9]),
    .blnk_in(in_vec[8:8]),
    .char_pixels(in_vec[7:0]),
    .hcount_out(out_vec[58:49]),
    .hsync_out(out_vec[48:48]),
    .vcount_out(out_vec[47:38]),
    .vsync_out(out_vec[37:37]),
    .rgb_out(out_vec[36:13]),
    .blnk_out(out_vec[12:12]),
    .char_xy(out_vec[11:4]),
    .char_line(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 56'h829a256edf05ff;
    stim[1] = 56'h98a86c7dfca55c;
    stim[2] = 56'h504c252ecd65d5;
    stim[3] = 56'h0b9bfedf9f537a;
    stim[4] = 56'hbfeafcff5956ec;
    stim[5] = 56'h1e80d6cba70158;
    stim[6] = 56'h4df864d55d3893;
    stim[7] = 56'h628438bcd73c06;
    stim[8] = 56'h2a64eb59e99a4d;
    stim[9] = 56'h20c7380cafd0b8;
    stim[10] = 56'h15069e94c9882e;
    stim[11] = 56'h0b73280524986d;
    stim[12] = 56'h6ed93143f5d7e5;
    stim[13] = 56'h07bdddea1c7bbd;
    stim[14] = 56'h4461a71d3def77;
    stim[15] = 56'h0950592f9a8c71;
    stim[16] = 56'h5d31c28a9cb5cc;
    stim[17] = 56'h3f8bd41e170e75;
    stim[18] = 56'h1eaf58e2367796;
    stim[19] = 56'h6445e069c03ed9;
    stim[20] = 56'h5d8e53061933a8;
    stim[21] = 56'h4a00977d465966;
    stim[22] = 56'h559ebaf74c2636;
    stim[23] = 56'h77aebc54e597fc;
    stim[24] = 56'h7c19841ac5f828;
    stim[25] = 56'h48b4d7b39a8788;
    stim[26] = 56'h515ce33c2cbbbc;
    stim[27] = 56'h2612c999c3b046;
    stim[28] = 56'h571f678c08d429;
    stim[29] = 56'h4e666e6d62be1c;
    stim[30] = 56'h4f34245965f65d;
    stim[31] = 56'h375ce37273a8d6;
    stim[32] = 56'h4a15d2ecab2bd3;
    stim[33] = 56'h23b429379f8eca;
    stim[34] = 56'h51d2b5f397780e;
    stim[35] = 56'h53b4c6ada65674;
    stim[36] = 56'h0e3f70a58aa280;
    stim[37] = 56'h6cdda0d40e8cc9;
    stim[38] = 56'h4542c9de22c191;
    stim[39] = 56'h2221d470d0bad7;
    stim[40] = 56'h4a0ca72547b70d;
    stim[41] = 56'h3823b46de4d5c4;
    stim[42] = 56'h05f20137765849;
    stim[43] = 56'h08a075c23810ce;
    stim[44] = 56'h62a98e0757e9bf;
    stim[45] = 56'h52fddc0fc70f82;
    stim[46] = 56'h27ca764a0cd9d9;
    stim[47] = 56'h32b48c5bf5366a;
    stim[48] = 56'h17211db7aa53cc;
    stim[49] = 56'h3bbfbe5ba9b82d;
    stim[50] = 56'h198f54a980ef21;
    stim[51] = 56'h5300d536993f3f;
    stim[52] = 56'h0275880d0739b5;
    stim[53] = 56'h3e360b89f38e3e;
    stim[54] = 56'h8d4d3e116ff4c8;
    stim[55] = 56'h54bb6e9acc0f51;
    stim[56] = 56'h29483eb4ee9b44;
    stim[57] = 56'h12702b4b099a6e;
    stim[58] = 56'h6f69ec58e7fe7d;
    stim[59] = 56'h5e12631e6fc36a;
    stim[60] = 56'h3a2a7655207755;
    stim[61] = 56'h1a749127514568;
    stim[62] = 56'h2954d544d91b5d;
    stim[63] = 56'h3373aac82a14d7;
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
      expv[0] = 59'h000000000000fd7;
      expv[1] = 59'h000000000000139;
      expv[2] = 59'h0000000000004b7;
      expv[3] = 59'h504c252ecd6506d;
      expv[4] = 59'h0000000000003ad;
      expv[5] = 59'h000000000000193;
      expv[6] = 59'h1e80d6cba701487;
      expv[7] = 59'h4df864d55d385dc;
      expv[8] = 59'h628438bcd73c258;
      expv[9] = 59'h2a64eb59e99a1bc;
      expv[10] = 59'h20c7380cafd00f5;
      expv[11] = 59'h15069e94c988068;
      expv[12] = 59'h0b732805249869a;
      expv[13] = 59'h6ed93143f5d7025;
      expv[14] = 59'h07bdddea1c7b3f7;
      expv[15] = 59'h4461a71d3def044;
      expv[16] = 59'h0950592f9a8c58e;
      expv[17] = 59'h5d31c28a9cb53a3;
      expv[18] = 59'h3f8bd41e170e194;
      expv[19] = 59'h1eaf58e236775f6;
      expv[20] = 59'h6445e069c03e582;
      expv[21] = 59'h5d8e53061933443;
      expv[22] = 59'h4a00977d465950c;
      expv[23] = 59'h559ebaf74c2672d;
      expv[24] = 59'h77aebc54e59776f;
      expv[25] = 59'h7c19841ac5f8433;
      expv[26] = 59'h48b4d7b39a874c6;
      expv[27] = 59'h515ce33c2cbb200;
      expv[28] = 59'h2612c999c3b0517;
      expv[29] = 59'h571f678c08d4499;
      expv[30] = 59'h4e666e6d62be4a7;
      expv[31] = 59'h4f34245965f6326;
      expv[32] = 59'h375ce37273a8442;
      expv[33] = 59'h4a15d2ecab2b1e8;
      expv[34] = 59'h23b429379f8e4cb;
      expv[35] = 59'h51d2b5f397784ef;
      expv[36] = 59'h53b4c6ada65609a;
      expv[37] = 59'h0e3f70a58aa2676;
      expv[38] = 59'h6cdda0d40e8c400;
      expv[39] = 59'h4542c9de22c11d3;
      expv[40] = 59'h2221d470d0ba447;
      expv[41] = 59'h4a0ca72547b733b;
      expv[42] = 59'h3823b46de4d500e;
      expv[43] = 59'h05f20137765803b;
      expv[44] = 59'h08a075c238105d1;
      expv[45] = 59'h62a98e0757e94d5;
      expv[46] = 59'h52fddc0fc70f22b;
      expv[47] = 59'h27ca764a0cd92d1;
      expv[48] = 59'h32b48c5bf536125;
      expv[49] = 59'h17211db7aa5336d;
      expv[50] = 59'h3bbfbe5ba9b8143;
      expv[51] = 59'h198f54a980ef4d3;
      expv[52] = 59'h5300d536993ffd0;
      expv[53] = 59'h0275880d0739390;
      expv[54] = 59'h00000000000008d;
      expv[55] = 59'h0000000000004f9;
      expv[56] = 59'h54bb6e9acc0f24d;
      expv[57] = 59'h29483eb4ee9b0d8;
      expv[58] = 59'h12702b4b099a6a9;
      expv[59] = 59'h6f69ec58e7fe586;
      expv[60] = 59'h5e12631e6fc335b;
      expv[61] = 59'h3a2a76552077152;
      expv[62] = 59'h1a7491275145243;
      expv[63] = 59'h2954d544d91b2e8;
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
