// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_104119 dut (
    .a(in_vec[37:6]),
    .flagc(in_vec[5:5]),
    .shift(in_vec[4:0]),
    .q(out_vec[32:1]),
    .c(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h07dacf2255;
    stim[1] = 38'h22d712d796;
    stim[2] = 38'h3f48172ce2;
    stim[3] = 38'h3c521552a5;
    stim[4] = 38'h311f5f1069;
    stim[5] = 38'h2ac338f5f5;
    stim[6] = 38'h3ed3c3f807;
    stim[7] = 38'h25119c56fa;
    stim[8] = 38'h272054974c;
    stim[9] = 38'h2834942780;
    stim[10] = 38'h1ba5fc8a4d;
    stim[11] = 38'h2931afd5ca;
    stim[12] = 38'h12332e3f62;
    stim[13] = 38'h3cdfecde99;
    stim[14] = 38'h1a29bdcda4;
    stim[15] = 38'h1817aa0f0d;
    stim[16] = 38'h0cc804fda6;
    stim[17] = 38'h0de26e4f68;
    stim[18] = 38'h3f775db972;
    stim[19] = 38'h0824b1716b;
    stim[20] = 38'h161db4b179;
    stim[21] = 38'h3c38da799f;
    stim[22] = 38'h25c64c7bd4;
    stim[23] = 38'h0bb6a841e2;
    stim[24] = 38'h19f906a78b;
    stim[25] = 38'h083af12aff;
    stim[26] = 38'h3d4f0dacaa;
    stim[27] = 38'h1f3a21ed49;
    stim[28] = 38'h2ce379de9e;
    stim[29] = 38'h287f9edb9f;
    stim[30] = 38'h291623633f;
    stim[31] = 38'h1c855aa454;
    stim[32] = 38'h238163bf0c;
    stim[33] = 38'h22b125e982;
    stim[34] = 38'h3fa2007972;
    stim[35] = 38'h3bcff3cc2f;
    stim[36] = 38'h32715e1856;
    stim[37] = 38'h08661fbb79;
    stim[38] = 38'h06df9279d1;
    stim[39] = 38'h31892ffc9b;
    stim[40] = 38'h1281b5774a;
    stim[41] = 38'h00c6b59105;
    stim[42] = 38'h09148e7667;
    stim[43] = 38'h26521895bc;
    stim[44] = 38'h1c5b8b2919;
    stim[45] = 38'h2d3238a3ef;
    stim[46] = 38'h20e3b86f93;
    stim[47] = 38'h1c52010277;
    stim[48] = 38'h25bc927096;
    stim[49] = 38'h3c8cc9c590;
    stim[50] = 38'h370cf0891a;
    stim[51] = 38'h2c3c46a63f;
    stim[52] = 38'h2138e6f989;
    stim[53] = 38'h16bf69d589;
    stim[54] = 38'h2fcc944cee;
    stim[55] = 38'h2d4cf638c8;
    stim[56] = 38'h22c22335b7;
    stim[57] = 38'h1bee95d886;
    stim[58] = 38'h2a284c4a86;
    stim[59] = 38'h3d849d2e41;
    stim[60] = 38'h2b78d46081;
    stim[61] = 38'h039764f09e;
    stim[62] = 38'h27b52c4246;
    stim[63] = 38'h292b1ec4c7;
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
      expv[0] = 33'h1679121f6;
      expv[1] = 33'h1c4b5e45a;
      expv[2] = 33'h1fe902e59;
      expv[3] = 33'h15f148554;
      expv[4] = 33'h083c47d7c;
      expv[5] = 33'h19c7afab0;
      expv[6] = 33'h103ed3c3f;
      expv[7] = 33'h046715bca;
      expv[8] = 33'h09753902a;
      expv[9] = 33'h141a4a13c;
      expv[10] = 33'h04526e97f;
      expv[11] = 33'h15752635f;
      expv[12] = 33'h1a4665c7e;
      expv[13] = 33'h0ff66f4f3;
      expv[14] = 33'h1ad14dee6;
      expv[15] = 33'h1078605ea;
      expv[16] = 33'h16999009f;
      expv[17] = 33'h0f66f1372;
      expv[18] = 33'h176e5feee;
      expv[19] = 33'h0e2c824b1;
      expv[20] = 33'h0eda58b58;
      expv[21] = 33'h1871b4f33;
      expv[22] = 33'h04c7bd2e3;
      expv[23] = 33'h1976d5083;
      expv[24] = 33'h14f19f906;
      expv[25] = 33'h1075e255c;
      expv[26] = 33'h0b2fa9e1b;
      expv[27] = 33'h16a7ce887;
      expv[28] = 33'h138de77a5;
      expv[29] = 33'h10ff3db72;
      expv[30] = 33'h122c46c66;
      expv[31] = 33'h15aa44e42;
      expv[32] = 33'h1bf11c0b1;
      expv[33] = 33'h045624bd3;
      expv[34] = 33'h001e5ff44;
      expv[35] = 33'h07987bcff;
      expv[36] = 33'h05786164e;
      expv[37] = 33'h130fddb21;
      expv[38] = 33'h093ce1b7e;
      expv[39] = 33'h1125ff931;
      expv[40] = 33'h1dd25036a;
      expv[41] = 33'h08031ad64;
      expv[42] = 33'h0cc9148e7;
      expv[43] = 33'h0521895b3;
      expv[44] = 33'h0dc594871;
      expv[45] = 33'h1147ed323;
      expv[46] = 33'h170df20e3;
      expv[47] = 33'h040204dc5;
      expv[48] = 33'h1249c24b7;
      expv[49] = 33'h09c59e466;
      expv[50] = 33'h033c2246e;
      expv[51] = 33'h18788d4c6;
      expv[52] = 33'h1cc84e39b;
      expv[53] = 33'h0ac5afda7;
      expv[54] = 33'h1133df992;
      expv[55] = 33'h18d6a67b1;
      expv[56] = 33'h04466b62c;
      expv[57] = 33'h0237dd2bb;
      expv[58] = 33'h0a5450989;
      expv[59] = 33'h0f61274b9;
      expv[60] = 33'h0ade35182;
      expv[61] = 33'h0e5d93c20;
      expv[62] = 33'h094f6a588;
      expv[63] = 33'h09a92b1ec;
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
