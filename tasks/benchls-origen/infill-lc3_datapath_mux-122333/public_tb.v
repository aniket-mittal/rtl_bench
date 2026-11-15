// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 50;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_122333 dut (
    .ADDER(in_vec[49:34]),
    .BUS(in_vec[33:18]),
    .PC1(in_vec[17:2]),
    .Select(in_vec[1:0]),
    .Output(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 50'h370b59a33b4d4;
    stim[1] = 50'h0f9d1ce24882b;
    stim[2] = 50'h289a17d096e95;
    stim[3] = 50'h25193cec497ca;
    stim[4] = 50'h2e6bf940979dd;
    stim[5] = 50'h0542d18c5ff22;
    stim[6] = 50'h176f3d7ca65d9;
    stim[7] = 50'h398a47428930b;
    stim[8] = 50'h1c2f624e93cbe;
    stim[9] = 50'h0247d2825636e;
    stim[10] = 50'h2538a25d98f5e;
    stim[11] = 50'h05005ecec46df;
    stim[12] = 50'h323d7a4e6bb2a;
    stim[13] = 50'h1946c1f3784e8;
    stim[14] = 50'h31d0f2bd020b6;
    stim[15] = 50'h376a77292cb4b;
    stim[16] = 50'h02fce57f49cda;
    stim[17] = 50'h153730c8b5cb0;
    stim[18] = 50'h0089c5f08aedc;
    stim[19] = 50'h39f3374fbaa7b;
    stim[20] = 50'h388bc3da0b9fe;
    stim[21] = 50'h22157af4576cc;
    stim[22] = 50'h2f6aab9492e57;
    stim[23] = 50'h29b3e90e86721;
    stim[24] = 50'h1b6b8e998f9dc;
    stim[25] = 50'h13fac99e14b6d;
    stim[26] = 50'h0b2d09e9d8781;
    stim[27] = 50'h3d4fea82b5367;
    stim[28] = 50'h085ef24731dde;
    stim[29] = 50'h2e9fbbe099015;
    stim[30] = 50'h2369ff795c02e;
    stim[31] = 50'h30cf1b7ae7109;
    stim[32] = 50'h2b62a0ed78de6;
    stim[33] = 50'h074a848c9a4b8;
    stim[34] = 50'h2898e3a19f25d;
    stim[35] = 50'h0bc27db35b8a0;
    stim[36] = 50'h3e45460e24e68;
    stim[37] = 50'h311cdb9414a8e;
    stim[38] = 50'h20ac6477d5f65;
    stim[39] = 50'h38c54a4290597;
    stim[40] = 50'h0a3afcbfcb0e1;
    stim[41] = 50'h2b57adfe449ed;
    stim[42] = 50'h1a29090a8bea6;
    stim[43] = 50'h2d1a57ecafbc0;
    stim[44] = 50'h1a9d2021356c9;
    stim[45] = 50'h3da68bcb4d07f;
    stim[46] = 50'h2d05a4d9cda17;
    stim[47] = 50'h21d27186d26b1;
    stim[48] = 50'h2536706028d41;
    stim[49] = 50'h38050a8c225ec;
    stim[50] = 50'h2623f7b063560;
    stim[51] = 50'h073b1f11a8d61;
    stim[52] = 50'h0cf64c9c24ad6;
    stim[53] = 50'h0d8779f870772;
    stim[54] = 50'h1e8406f597ea1;
    stim[55] = 50'h3e120eeb3968e;
    stim[56] = 50'h0b258fe94fe0a;
    stim[57] = 50'h1354521d1d5b0;
    stim[58] = 50'h3f682235553b6;
    stim[59] = 50'h0ec55ddbf3c72;
    stim[60] = 50'h1d4f622a090c0;
    stim[61] = 50'h2a830b050a561;
    stim[62] = 50'h19b2a703053bf;
    stim[63] = 50'h39ff4d2071ee6;
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
      expv[0] = 16'hed35;
      expv[1] = 16'h0000;
      expv[2] = 16'h5f42;
      expv[3] = 16'h9464;
      expv[4] = 16'he502;
      expv[5] = 16'h150b;
      expv[6] = 16'hf5f2;
      expv[7] = 16'h0000;
      expv[8] = 16'h70bd;
      expv[9] = 16'h091f;
      expv[10] = 16'h94e2;
      expv[11] = 16'h0000;
      expv[12] = 16'hc8f5;
      expv[13] = 16'he13a;
      expv[14] = 16'hc743;
      expv[15] = 16'h0000;
      expv[16] = 16'h0bf3;
      expv[17] = 16'hd72c;
      expv[18] = 16'h2bb7;
      expv[19] = 16'h0000;
      expv[20] = 16'he22f;
      expv[21] = 16'h5db3;
      expv[22] = 16'h0000;
      expv[23] = 16'ha43a;
      expv[24] = 16'h3e77;
      expv[25] = 16'h2678;
      expv[26] = 16'h27a7;
      expv[27] = 16'h0000;
      expv[28] = 16'h217b;
      expv[29] = 16'hef82;
      expv[30] = 16'h8da7;
      expv[31] = 16'h6deb;
      expv[32] = 16'had8a;
      expv[33] = 16'h692e;
      expv[34] = 16'h8e86;
      expv[35] = 16'h6e28;
      expv[36] = 16'h939a;
      expv[37] = 16'hc473;
      expv[38] = 16'h91df;
      expv[39] = 16'h0000;
      expv[40] = 16'hf2ff;
      expv[41] = 16'hb7f9;
      expv[42] = 16'h68a4;
      expv[43] = 16'hbef0;
      expv[44] = 16'h8084;
      expv[45] = 16'h0000;
      expv[46] = 16'h0000;
      expv[47] = 16'hc61b;
      expv[48] = 16'hc180;
      expv[49] = 16'h897b;
      expv[50] = 16'h8d58;
      expv[51] = 16'h7c46;
      expv[52] = 16'h33d9;
      expv[53] = 16'h361d;
      expv[54] = 16'h1bd6;
      expv[55] = 16'hf848;
      expv[56] = 16'h2c96;
      expv[57] = 16'h756c;
      expv[58] = 16'hfda0;
      expv[59] = 16'h3b15;
      expv[60] = 16'h2430;
      expv[61] = 16'h2c14;
      expv[62] = 16'h0000;
      expv[63] = 16'he7fd;
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
