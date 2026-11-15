// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_135532 dut (
    .A(in_vec[35:20]),
    .B(in_vec[19:4]),
    .CTRL(in_vec[3:0]),
    .Result(out_vec[16:1]),
    .Overflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'he837466c8;
    stim[1] = 36'h76aa1d132;
    stim[2] = 36'hfa5977292;
    stim[3] = 36'h134573e7d;
    stim[4] = 36'h6cfc6aacb;
    stim[5] = 36'h51f3f12a1;
    stim[6] = 36'h938750522;
    stim[7] = 36'hf645fc0bf;
    stim[8] = 36'h66ef29857;
    stim[9] = 36'ha457beae1;
    stim[10] = 36'h9cb375a4f;
    stim[11] = 36'h6cf93ffd7;
    stim[12] = 36'h3134f27d0;
    stim[13] = 36'hb2576b9ff;
    stim[14] = 36'h078d1b419;
    stim[15] = 36'haf2ed22b6;
    stim[16] = 36'h4eb6309a3;
    stim[17] = 36'hd90d0a135;
    stim[18] = 36'h483724829;
    stim[19] = 36'ha1e02c1b0;
    stim[20] = 36'h5df0f3820;
    stim[21] = 36'h3b8edc64e;
    stim[22] = 36'h2d7823d83;
    stim[23] = 36'h9c4b2fcc1;
    stim[24] = 36'h835dd2df7;
    stim[25] = 36'h05f761270;
    stim[26] = 36'h17365f762;
    stim[27] = 36'hc49cd3df5;
    stim[28] = 36'hd614c248e;
    stim[29] = 36'h3544d4937;
    stim[30] = 36'hbf1c17a3c;
    stim[31] = 36'h839489a1c;
    stim[32] = 36'hd777066f4;
    stim[33] = 36'h140b0ad44;
    stim[34] = 36'hb369362f0;
    stim[35] = 36'h14929a2c5;
    stim[36] = 36'hd778db51f;
    stim[37] = 36'h59302da45;
    stim[38] = 36'h4fb6d728a;
    stim[39] = 36'he5d9ddf9a;
    stim[40] = 36'hdf2c8cfef;
    stim[41] = 36'h6c9ef3e5b;
    stim[42] = 36'he90526ae8;
    stim[43] = 36'h7b5ca5464;
    stim[44] = 36'hdd7c6bad6;
    stim[45] = 36'h54dde0f2b;
    stim[46] = 36'hc0481102b;
    stim[47] = 36'h1bf3271ff;
    stim[48] = 36'h382a7fb31;
    stim[49] = 36'h68b9ff09f;
    stim[50] = 36'h77d6658ab;
    stim[51] = 36'hc53dfb6c4;
    stim[52] = 36'hbb4066e26;
    stim[53] = 36'h46c371392;
    stim[54] = 36'h1ce9de2f2;
    stim[55] = 36'h6a5ff06a2;
    stim[56] = 36'h409a80087;
    stim[57] = 36'h3abed63ec;
    stim[58] = 36'hc669562f5;
    stim[59] = 36'h348f5f534;
    stim[60] = 36'hd6cfd1d4b;
    stim[61] = 36'h9a58b1663;
    stim[62] = 36'h069438208;
    stim[63] = 36'h105a12c6a;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h16aa0;
      expv[2] = 17'h16400;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h0c192;
      expv[6] = 17'h09c38;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h1cb52;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h04763;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00026;
      expv[17] = 17'h17642;
      expv[18] = 17'h00000;
      expv[19] = 17'h19bf6;
      expv[20] = 17'h0a2e5;
      expv[21] = 17'h00000;
      expv[22] = 17'h0005a;
      expv[23] = 17'h0d8ff;
      expv[24] = 17'h00000;
      expv[25] = 17'h0ce3c;
      expv[26] = 17'h19b00;
      expv[27] = 17'h11272;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h1fffe;
      expv[33] = 17'h00280;
      expv[34] = 17'h1d330;
      expv[35] = 17'h09242;
      expv[36] = 17'h00000;
      expv[37] = 17'h00b26;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h003da;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h170ee;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h1fff8;
      expv[52] = 17'h00000;
      expv[53] = 17'h10c00;
      expv[54] = 17'h10000;
      expv[55] = 17'h0f800;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h119a6;
      expv[59] = 17'h00d22;
      expv[60] = 17'h00000;
      expv[61] = 17'h004d2;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
