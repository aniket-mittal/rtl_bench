// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_022275 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[34:34]),
    .data_in(in_vec[33:2]),
    .vld_in(in_vec[1:1]),
    .ack_out(in_vec[0:0]),
    .ack_in(out_vec[34:34]),
    .data_out(out_vec[33:2]),
    .vld_out(out_vec[1:1]),
    .apdone_blk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h65eab3cba;
    stim[1] = 35'h511845aeb;
    stim[2] = 35'h1907c5dae;
    stim[3] = 35'h2e1a5638b;
    stim[4] = 35'h2ecb26d4b;
    stim[5] = 35'h1c2bb9902;
    stim[6] = 35'h05e844253;
    stim[7] = 35'h3815c7d0d;
    stim[8] = 35'h136a2935e;
    stim[9] = 35'h314385247;
    stim[10] = 35'h050ca8b65;
    stim[11] = 35'h0f6887c8a;
    stim[12] = 35'h22f574b4c;
    stim[13] = 35'h3b8f70b37;
    stim[14] = 35'h368091d78;
    stim[15] = 35'h0ce6cb0ae;
    stim[16] = 35'h2a186ab30;
    stim[17] = 35'h1606b4e79;
    stim[18] = 35'h06c669335;
    stim[19] = 35'h249503ec7;
    stim[20] = 35'h2e8d7ec54;
    stim[21] = 35'h25165a668;
    stim[22] = 35'h20f07ad9c;
    stim[23] = 35'h31a075d27;
    stim[24] = 35'h2a94f1138;
    stim[25] = 35'h3accf26f2;
    stim[26] = 35'h06647fbbe;
    stim[27] = 35'h1d434544d;
    stim[28] = 35'h1bf85bf54;
    stim[29] = 35'h0e7419452;
    stim[30] = 35'h2a38ad043;
    stim[31] = 35'h3f89fd9ab;
    stim[32] = 35'h29b25cf2c;
    stim[33] = 35'h31ad6d4b0;
    stim[34] = 35'h25065efc5;
    stim[35] = 35'h1a3c94b15;
    stim[36] = 35'h1212de969;
    stim[37] = 35'h01c827006;
    stim[38] = 35'h1adbd0c6c;
    stim[39] = 35'h1d6e36f12;
    stim[40] = 35'h1b97430ac;
    stim[41] = 35'h22b3d343e;
    stim[42] = 35'h04a719520;
    stim[43] = 35'h075008afa;
    stim[44] = 35'h0b2eec569;
    stim[45] = 35'h084fef638;
    stim[46] = 35'h19c48f905;
    stim[47] = 35'h0b34d8f5d;
    stim[48] = 35'h047c7b1d0;
    stim[49] = 35'h1210f37e2;
    stim[50] = 35'h19a0b3076;
    stim[51] = 35'h6eccf1417;
    stim[52] = 35'h0e1e37445;
    stim[53] = 35'h0dadec167;
    stim[54] = 35'h6f73b9419;
    stim[55] = 35'h0c238552a;
    stim[56] = 35'h222a8539b;
    stim[57] = 35'h16ae95c81;
    stim[58] = 35'h3f6293f39;
    stim[59] = 35'h1d287c9f7;
    stim[60] = 35'h17e408a64;
    stim[61] = 35'h199c4a701;
    stim[62] = 35'h5f2b1bff1;
    stim[63] = 35'h3f06d0e8a;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'h111845ae8;
      expv[3] = 35'h5907c5dac;
      expv[4] = 35'h6e1a5638a;
      expv[5] = 35'h6ecb26d4b;
      expv[6] = 35'h2ecb26d4b;
      expv[7] = 35'h5c2bb9902;
      expv[8] = 35'h7815c7d0c;
      expv[9] = 35'h536a2935e;
      expv[10] = 35'h714385246;
      expv[11] = 35'h450ca8b64;
      expv[12] = 35'h4f6887c8b;
      expv[13] = 35'h4f6887c8a;
      expv[14] = 35'h7b8f70b37;
      expv[15] = 35'h7b8f70b37;
      expv[16] = 35'h3b8f70b37;
      expv[17] = 35'h3b8f70b37;
      expv[18] = 35'h4ce6cb0ae;
      expv[19] = 35'h46c669334;
      expv[20] = 35'h649503ec7;
      expv[21] = 35'h649503ec7;
      expv[22] = 35'h649503ec7;
      expv[23] = 35'h649503ec6;
      expv[24] = 35'h71a075d27;
      expv[25] = 35'h71a075d27;
      expv[26] = 35'h31a075d27;
      expv[27] = 35'h31a075d27;
      expv[28] = 35'h7accf26f3;
      expv[29] = 35'h7accf26f3;
      expv[30] = 35'h3accf26f3;
      expv[31] = 35'h4e7419452;
      expv[32] = 35'h7f89fd9ab;
      expv[33] = 35'h7f89fd9ab;
      expv[34] = 35'h7f89fd9aa;
      expv[35] = 35'h65065efc4;
      expv[36] = 35'h5a3c94b14;
      expv[37] = 35'h5212de968;
      expv[38] = 35'h41c827007;
      expv[39] = 35'h41c827007;
      expv[40] = 35'h01c827007;
      expv[41] = 35'h01c827007;
      expv[42] = 35'h01c827007;
      expv[43] = 35'h01c827007;
      expv[44] = 35'h01c827007;
      expv[45] = 35'h5d6e36f13;
      expv[46] = 35'h5d6e36f12;
      expv[47] = 35'h59c48f904;
      expv[48] = 35'h4b34d8f5c;
      expv[49] = 35'h447c7b1d0;
      expv[50] = 35'h5210f37e3;
      expv[51] = 35'h1210f37e3;
      expv[52] = 35'h19a0b3074;
      expv[53] = 35'h4e1e37444;
      expv[54] = 35'h4dadec166;
      expv[55] = 35'h0dadec164;
      expv[56] = 35'h4c2385528;
      expv[57] = 35'h622a8539a;
      expv[58] = 35'h56ae95c80;
      expv[59] = 35'h7f6293f38;
      expv[60] = 35'h5d287c9f7;
      expv[61] = 35'h5d287c9f6;
      expv[62] = 35'h599c4a700;
      expv[63] = 35'h1f2b1bff0;
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
