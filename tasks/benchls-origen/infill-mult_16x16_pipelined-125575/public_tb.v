// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_125575 dut (
    .clk(clk),
    .reset(in_vec[33:33]),
    .enable(in_vec[32:32]),
    .a(in_vec[31:16]),
    .b(in_vec[15:0]),
    .product(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h31541b650;
    stim[1] = 34'h2f82710fa;
    stim[2] = 34'h0b9014e3d;
    stim[3] = 34'h09a435f5e;
    stim[4] = 34'h0dbfd276b;
    stim[5] = 34'h145f0c59c;
    stim[6] = 34'h0d5bc4094;
    stim[7] = 34'h072cc0777;
    stim[8] = 34'h14fad64ed;
    stim[9] = 34'h1747d020c;
    stim[10] = 34'h19876faf2;
    stim[11] = 34'h159c41c06;
    stim[12] = 34'h11b0b6220;
    stim[13] = 34'h041fb4704;
    stim[14] = 34'h01053cd0f;
    stim[15] = 34'h0296e9609;
    stim[16] = 34'h0eac643cd;
    stim[17] = 34'h02db2b0c2;
    stim[18] = 34'h198f2e480;
    stim[19] = 34'h13863b4ee;
    stim[20] = 34'h10b4a0a7a;
    stim[21] = 34'h05f051daf;
    stim[22] = 34'h03b0fbe69;
    stim[23] = 34'h0c3c3871c;
    stim[24] = 34'h0d0abcb34;
    stim[25] = 34'h151749d9b;
    stim[26] = 34'h10391951c;
    stim[27] = 34'h025531a88;
    stim[28] = 34'h1506fd180;
    stim[29] = 34'h10f029816;
    stim[30] = 34'h12e2aeb69;
    stim[31] = 34'h05b50749a;
    stim[32] = 34'h026083e7b;
    stim[33] = 34'h0e7cd91d0;
    stim[34] = 34'h0142ed9d9;
    stim[35] = 34'h1fba5c1ee;
    stim[36] = 34'h179b2045f;
    stim[37] = 34'h02dc5d457;
    stim[38] = 34'h0f118624a;
    stim[39] = 34'h08214841b;
    stim[40] = 34'h1adca8119;
    stim[41] = 34'h1192067b9;
    stim[42] = 34'h121c832fa;
    stim[43] = 34'h274d7944e;
    stim[44] = 34'h1506ae8c8;
    stim[45] = 34'h17551c342;
    stim[46] = 34'h088fe1983;
    stim[47] = 34'h10a61b5cb;
    stim[48] = 34'h0e1894587;
    stim[49] = 34'h169a47cdb;
    stim[50] = 34'h141e0f2ad;
    stim[51] = 34'h1c2725acb;
    stim[52] = 34'h13a3aa94e;
    stim[53] = 34'h08b8f67a2;
    stim[54] = 34'h16bca3477;
    stim[55] = 34'h144f19049;
    stim[56] = 34'h12decd185;
    stim[57] = 34'h0b6e06b92;
    stim[58] = 34'h173dab7e1;
    stim[59] = 34'h009736d6d;
    stim[60] = 34'h1484a9631;
    stim[61] = 34'h00a82e765;
    stim[62] = 34'h058b2d808;
    stim[63] = 34'h04435b8b4;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'he519924c;
      expv[7] = 32'he519924c;
      expv[8] = 32'he519924c;
      expv[9] = 32'hb2dca04c;
      expv[10] = 32'hfae8064c;
      expv[11] = 32'hd070703c;
      expv[12] = 32'h79bc04ae;
      expv[13] = 32'h405601c0;
      expv[14] = 32'h405601c0;
      expv[15] = 32'h405601c0;
      expv[16] = 32'h405601c0;
      expv[17] = 32'h405601c0;
      expv[18] = 32'h405601c0;
      expv[19] = 32'h0f607900;
      expv[20] = 32'hc3605c1a;
      expv[21] = 32'he46e2382;
      expv[22] = 32'he46e2382;
      expv[23] = 32'he46e2382;
      expv[24] = 32'he46e2382;
      expv[25] = 32'he46e2382;
      expv[26] = 32'h55ad4647;
      expv[27] = 32'h66bf1030;
      expv[28] = 32'h66bf1030;
      expv[29] = 32'he0503780;
      expv[30] = 32'h38e80076;
      expv[31] = 32'hb83a1218;
      expv[32] = 32'hb83a1218;
      expv[33] = 32'hb83a1218;
      expv[34] = 32'hb83a1218;
      expv[35] = 32'hb83a1218;
      expv[36] = 32'h223b99c0;
      expv[37] = 32'hc9e442f5;
      expv[38] = 32'hc9e442f5;
      expv[39] = 32'hc9e442f5;
      expv[40] = 32'hc9e442f5;
      expv[41] = 32'h212d149f;
      expv[42] = 32'hea0f1731;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h58805350;
      expv[46] = 32'h0c1f150c;
      expv[47] = 32'h0c1f150c;
      expv[48] = 32'h9c124dd9;
      expv[49] = 32'h9c124dd9;
      expv[50] = 32'ha2dc8d1f;
      expv[51] = 32'hfd72984d;
      expv[52] = 32'h58345b3c;
      expv[53] = 32'h704a1258;
      expv[54] = 32'h704a1258;
      expv[55] = 32'h1dbc5ea3;
      expv[56] = 32'hb640451d;
      expv[57] = 32'hd0bd7afd;
      expv[58] = 32'hd0bd7afd;
      expv[59] = 32'h2835bfad;
      expv[60] = 32'h2835bfad;
      expv[61] = 32'h86300ef2;
      expv[62] = 32'h86300ef2;
      expv[63] = 32'h86300ef2;
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
