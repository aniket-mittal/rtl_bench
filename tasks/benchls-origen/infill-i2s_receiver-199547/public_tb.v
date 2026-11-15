// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 37;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_199547 dut (
    .xclk(clk),
    .xrst(in_vec[18:18]),
    .BCLK(in_vec[17:17]),
    .LRCLK(in_vec[16:16]),
    .din(in_vec[15:0]),
    .xBrise(out_vec[36:36]),
    .xBfall(out_vec[35:35]),
    .xLRrise(out_vec[34:34]),
    .xLRfall(out_vec[33:33]),
    .xData(out_vec[32:1]),
    .xData_rdy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h55cb7;
    stim[1] = 19'h489f0;
    stim[2] = 19'h3de62;
    stim[3] = 19'h1476d;
    stim[4] = 19'h3b2b3;
    stim[5] = 19'h05593;
    stim[6] = 19'h14852;
    stim[7] = 19'h29376;
    stim[8] = 19'h4a567;
    stim[9] = 19'h7e6ad;
    stim[10] = 19'h16229;
    stim[11] = 19'h13235;
    stim[12] = 19'h13707;
    stim[13] = 19'h11c81;
    stim[14] = 19'h10dd2;
    stim[15] = 19'h18cc6;
    stim[16] = 19'h1247b;
    stim[17] = 19'h14db0;
    stim[18] = 19'h08a84;
    stim[19] = 19'h10fea;
    stim[20] = 19'h4fc9e;
    stim[21] = 19'h2833c;
    stim[22] = 19'h29bde;
    stim[23] = 19'h0b3de;
    stim[24] = 19'h21f33;
    stim[25] = 19'h35381;
    stim[26] = 19'h2624c;
    stim[27] = 19'h31d9c;
    stim[28] = 19'h31040;
    stim[29] = 19'h25048;
    stim[30] = 19'h076ce;
    stim[31] = 19'h32657;
    stim[32] = 19'h33cb9;
    stim[33] = 19'h0ddd6;
    stim[34] = 19'h01ffc;
    stim[35] = 19'h0eb90;
    stim[36] = 19'h72aff;
    stim[37] = 19'h06409;
    stim[38] = 19'h11b7c;
    stim[39] = 19'h33abe;
    stim[40] = 19'h2c617;
    stim[41] = 19'h08a27;
    stim[42] = 19'h252d8;
    stim[43] = 19'h31124;
    stim[44] = 19'h018a3;
    stim[45] = 19'h04dd0;
    stim[46] = 19'h111ed;
    stim[47] = 19'h08c64;
    stim[48] = 19'h2bc64;
    stim[49] = 19'h36d33;
    stim[50] = 19'h02ee8;
    stim[51] = 19'h234ec;
    stim[52] = 19'h1121e;
    stim[53] = 19'h2d134;
    stim[54] = 19'h12c7a;
    stim[55] = 19'h0b62d;
    stim[56] = 19'h13f4f;
    stim[57] = 19'h10e58;
    stim[58] = 19'h291c5;
    stim[59] = 19'h1bdb4;
    stim[60] = 19'h21ddf;
    stim[61] = 19'h1a663;
    stim[62] = 19'h18485;
    stim[63] = 19'h38144;
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
      expv[0] = 37'h0000000000;
      expv[1] = 37'h0000000000;
      expv[2] = 37'h0000000000;
      expv[3] = 37'h0000000000;
      expv[4] = 37'h0000000000;
      expv[5] = 37'h140003798a;
      expv[6] = 37'h0979891db6;
      expv[7] = 37'h111db6cace;
      expv[8] = 37'h0000000000;
      expv[9] = 37'h0000000000;
      expv[10] = 37'h0000000000;
      expv[11] = 37'h0000000000;
      expv[12] = 37'h0000000002;
      expv[13] = 37'h04000188a6;
      expv[14] = 37'h0188a4c8d6;
      expv[15] = 37'h00c8d4dc1e;
      expv[16] = 37'h00dc1c7204;
      expv[17] = 37'h0072043748;
      expv[18] = 37'h00374a331a;
      expv[19] = 37'h00331891ec;
      expv[20] = 37'h0000000000;
      expv[21] = 37'h0000000000;
      expv[22] = 37'h0000000000;
      expv[23] = 37'h0000000000;
      expv[24] = 37'h1000020cf0;
      expv[25] = 37'h000cf26f78;
      expv[26] = 37'h086f7acf7a;
      expv[27] = 37'h10cf787cce;
      expv[28] = 37'h047ccd4e04;
      expv[29] = 37'h034e058930;
      expv[30] = 37'h0589307670;
      expv[31] = 37'h0076704100;
      expv[32] = 37'h0241014120;
      expv[33] = 37'h094121db3a;
      expv[34] = 37'h15db38995e;
      expv[35] = 37'h00995cf2e4;
      expv[36] = 37'h0000000000;
      expv[37] = 37'h0000000000;
      expv[38] = 37'h0000000000;
      expv[39] = 37'h0000000002;
      expv[40] = 37'h0000019024;
      expv[41] = 37'h0590246df0;
      expv[42] = 37'h106df0eafa;
      expv[43] = 37'h02eafb185e;
      expv[44] = 37'h09185e289c;
      expv[45] = 37'h10289d4b60;
      expv[46] = 37'h054b604492;
      expv[47] = 37'h0a4490628c;
      expv[48] = 37'h00628d3742;
      expv[49] = 37'h05374047b4;
      expv[50] = 37'h0247b63190;
      expv[51] = 37'h103192f192;
      expv[52] = 37'h04f191b4cc;
      expv[53] = 37'h0bb4ccbba0;
      expv[54] = 37'h10bba0d3b0;
      expv[55] = 37'h0cd3b04878;
      expv[56] = 37'h12487b44d0;
      expv[57] = 37'h0d44d0b1ea;
      expv[58] = 37'h02b1ead8b6;
      expv[59] = 37'h04d8b4fd3c;
      expv[60] = 37'h00fd3c3962;
      expv[61] = 37'h1239624714;
      expv[62] = 37'h0c4716f6d2;
      expv[63] = 37'h12f6d0777e;
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
