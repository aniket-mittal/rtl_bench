// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  zet_fulladd16 dut (
    .x(in_vec[33:18]),
    .y(in_vec[17:2]),
    .ci(in_vec[1:1]),
    .s(in_vec[0:0]),
    .co(out_vec[16:16]),
    .z(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h09bcf65f2;
    stim[1] = 34'h0db89d417;
    stim[2] = 34'h3172bdc25;
    stim[3] = 34'h3d156ee62;
    stim[4] = 34'h225a081bb;
    stim[5] = 34'h111816d08;
    stim[6] = 34'h378035150;
    stim[7] = 34'h36a77bbf3;
    stim[8] = 34'h20ff35cbe;
    stim[9] = 34'h008a47ec5;
    stim[10] = 34'h35e5e1498;
    stim[11] = 34'h2ab20abcc;
    stim[12] = 34'h2661467e1;
    stim[13] = 34'h20e33c220;
    stim[14] = 34'h2c7fb4c8d;
    stim[15] = 34'h3c35c0139;
    stim[16] = 34'h2a6cdfe37;
    stim[17] = 34'h29f617965;
    stim[18] = 34'h292986acf;
    stim[19] = 34'h34edfc66a;
    stim[20] = 34'h01bbacaf4;
    stim[21] = 34'h2c50f6c8e;
    stim[22] = 34'h31640fd3e;
    stim[23] = 34'h3c4be8f7b;
    stim[24] = 34'h09b641450;
    stim[25] = 34'h00e8c24eb;
    stim[26] = 34'h15feec6e1;
    stim[27] = 34'h2a2012389;
    stim[28] = 34'h1aad47b1e;
    stim[29] = 34'h0cd73e8c9;
    stim[30] = 34'h0c177696d;
    stim[31] = 34'h2b6dc3afe;
    stim[32] = 34'h2f1ab90a3;
    stim[33] = 34'h28870e918;
    stim[34] = 34'h067073883;
    stim[35] = 34'h06bab3a2f;
    stim[36] = 34'h339590920;
    stim[37] = 34'h1c4506fc8;
    stim[38] = 34'h3f411ca36;
    stim[39] = 34'h02aded993;
    stim[40] = 34'h12253b293;
    stim[41] = 34'h3f5a1266e;
    stim[42] = 34'h32975f3f2;
    stim[43] = 34'h20ff021e2;
    stim[44] = 34'h1dd7a15bb;
    stim[45] = 34'h24f0814f1;
    stim[46] = 34'h0fa6e6976;
    stim[47] = 34'h195611144;
    stim[48] = 34'h0c70b5508;
    stim[49] = 34'h005c143fb;
    stim[50] = 34'h13c84445e;
    stim[51] = 34'h16fbcbf87;
    stim[52] = 34'h25ec3e4ac;
    stim[53] = 34'h0b378ec2f;
    stim[54] = 34'h15e20674d;
    stim[55] = 34'h35d4804f3;
    stim[56] = 34'h3d7e0d0c8;
    stim[57] = 34'h2f7738e6e;
    stim[58] = 34'h21cd6f73e;
    stim[59] = 34'h0fc4af976;
    stim[60] = 34'h02cd493c6;
    stim[61] = 34'h2b2353ad6;
    stim[62] = 34'h3ffdaacd3;
    stim[63] = 34'h0c702706b;
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
      expv[0] = 17'h10070;
      expv[1] = 17'h1abe8;
      expv[2] = 17'h0bcd3;
      expv[3] = 17'h1afee;
      expv[4] = 17'h1a9d7;
      expv[5] = 17'h09fa2;
      expv[6] = 17'h1b254;
      expv[7] = 17'h0c99a;
      expv[8] = 17'h15b2c;
      expv[9] = 17'h121da;
      expv[10] = 17'h15cbd;
      expv[11] = 17'h0d5bb;
      expv[12] = 17'h1b37d;
      expv[13] = 17'h17414;
      expv[14] = 17'h08521;
      expv[15] = 17'h1f125;
      expv[16] = 17'h02941;
      expv[17] = 17'h00631;
      expv[18] = 17'h1bf5a;
      expv[19] = 17'h1c552;
      expv[20] = 17'h0b9ab;
      expv[21] = 17'h18c67;
      expv[22] = 17'h104e0;
      expv[23] = 17'h0950e;
      expv[24] = 17'h02bed;
      expv[25] = 17'h10cde;
      expv[26] = 17'h009b3;
      expv[27] = 17'h1f162;
      expv[28] = 17'h0897d;
      expv[29] = 17'h02d8e;
      expv[30] = 17'h00ab8;
      expv[31] = 17'h0bc77;
      expv[32] = 17'h0a093;
      expv[33] = 17'h0dc62;
      expv[34] = 17'h1e7e2;
      expv[35] = 17'h1e976;
      expv[36] = 17'h1109e;
      expv[37] = 17'h08d06;
      expv[38] = 17'h16f92;
      expv[39] = 17'h1c11c;
      expv[40] = 17'h03539;
      expv[41] = 17'h14704;
      expv[42] = 17'h1475a;
      expv[43] = 17'h08c75;
      expv[44] = 17'h1fccd;
      expv[45] = 17'h198fe;
      expv[46] = 17'h0d8f9;
      expv[47] = 17'h0a9a9;
      expv[48] = 17'h10704;
      expv[49] = 17'h1526f;
      expv[50] = 17'h06039;
      expv[51] = 17'h18bd1;
      expv[52] = 17'h190db;
      expv[53] = 17'h167ea;
      expv[54] = 17'h1715b;
      expv[55] = 17'h1d88f;
      expv[56] = 17'h12a2a;
      expv[57] = 17'h1a178;
      expv[58] = 17'h14505;
      expv[59] = 17'h0fd70;
      expv[60] = 17'h03027;
      expv[61] = 17'h0fb43;
      expv[62] = 17'h0ab2b;
      expv[63] = 17'h1cddb;
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
