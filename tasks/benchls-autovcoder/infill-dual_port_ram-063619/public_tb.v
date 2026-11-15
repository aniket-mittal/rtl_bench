// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 91;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_063619 dut (
    .clk0(clk),
    .clk1(in_vec[90:90]),
    .n_cs0(in_vec[89:89]),
    .n_cs1(in_vec[88:88]),
    .n_we0(in_vec[87:87]),
    .n_we1(in_vec[86:86]),
    .n_oe0(in_vec[85:85]),
    .n_oe1(in_vec[84:84]),
    .ad0(in_vec[83:74]),
    .ad1(in_vec[73:64]),
    .di0(in_vec[63:32]),
    .di1(in_vec[31:0]),
    .do0(out_vec[63:32]),
    .do1(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 91'h0110e823575b9912855de64;
    stim[1] = 91'h7b003ecd36b0fe44b9b7d6b;
    stim[2] = 91'h084c652c75ddf3e25d42679;
    stim[3] = 91'h2d0f46ba6ae88df8563e7cb;
    stim[4] = 91'h0ee707d754635e54aadfef2;
    stim[5] = 91'h4371174516355b3b1a04928;
    stim[6] = 91'h52b69836e213eb97ff714ac;
    stim[7] = 91'h2c017062c43fb779a581dea;
    stim[8] = 91'h4dcf7269bc7ee3081090955;
    stim[9] = 91'h0c378b9472d028c0ad6a47c;
    stim[10] = 91'h35c341f6ed6d5d7e299161d;
    stim[11] = 91'h0a7035115b8da5dee992cd8;
    stim[12] = 91'h2821bfcbab8309e71be0c93;
    stim[13] = 91'h678b090eb2d2358b97abf58;
    stim[14] = 91'h5865d6f9af08db740fb633f;
    stim[15] = 91'h1e26fd7db6a636979580d6f;
    stim[16] = 91'h18811027023ccfcb0701800;
    stim[17] = 91'h4ca4ebec3245ea4952f7013;
    stim[18] = 91'h16f5c9433b4ac01ab662308;
    stim[19] = 91'h101d6d622df20c7fc3f0980;
    stim[20] = 91'h4e3a31a5b46bb67fa6826fe;
    stim[21] = 91'h11a6cf6a041aecbf5cb40c0;
    stim[22] = 91'h25d9fdeecf104ed81bd9af6;
    stim[23] = 91'h5e9f24ed41b65b97ce2ec80;
    stim[24] = 91'h19388bf9148068cbfc59cdc;
    stim[25] = 91'h7fe34ff46750f7ab2c0e523;
    stim[26] = 91'h3c3bf5834757c11b7963229;
    stim[27] = 91'h79c3d019dbb58d8a2b0ddd5;
    stim[28] = 91'h06dae839c3627d2ea8b31a4;
    stim[29] = 91'h6e216532ffabff0f7f2609f;
    stim[30] = 91'h13aef5cb9322c7a6efc7eb3;
    stim[31] = 91'h0cc3e4be4247949bb2674c8;
    stim[32] = 91'h18fba565ed639124ee01602;
    stim[33] = 91'h4ed22901af107214021f458;
    stim[34] = 91'h5f7f019a5b5c28066609a59;
    stim[35] = 91'h57bf441204a71c386d3bc56;
    stim[36] = 91'h64db4892d9d110dc89da414;
    stim[37] = 91'h70d4e71ae14f54b09121497;
    stim[38] = 91'h482a06cbd3ad11dd51e0eb7;
    stim[39] = 91'h7e94ddd3eb69c287b5bf12d;
    stim[40] = 91'h39d292d72ae7e0eed5cf15c;
    stim[41] = 91'h4846f894177755f7d2bf964;
    stim[42] = 91'h1305dd61d8f43b034663f29;
    stim[43] = 91'h34b002cc54bb7f73f4867d4;
    stim[44] = 91'h297c8cf050c32fb0ce29499;
    stim[45] = 91'h75ea8f763fea7665466356b;
    stim[46] = 91'h0f1bae04b16a9aa2b5a6c33;
    stim[47] = 91'h3f0f13e8df1c91989b9d7b6;
    stim[48] = 91'h33b6fa62bacfdbfb267d723;
    stim[49] = 91'h01961356ef57965ad33cd8c;
    stim[50] = 91'h0b305ccd35ed43178c17907;
    stim[51] = 91'h49febef8ca94b21bd84bd70;
    stim[52] = 91'h07a22e0a1d5794450ebdba4;
    stim[53] = 91'h3fa9720bd4f43bce7ec21ac;
    stim[54] = 91'h405a8ac49e6b82cb72d7e12;
    stim[55] = 91'h4c00688065f62c04d8bb575;
    stim[56] = 91'h69b16983cd7fec5956e0b7b;
    stim[57] = 91'h541aaf36a0e97575d9c5d92;
    stim[58] = 91'h41817fd74fb7b8441f38d8e;
    stim[59] = 91'h3336af8a2604d7677648bf1;
    stim[60] = 91'h5737b810e3dd93a654058a4;
    stim[61] = 91'h3b1fa89c463b2c0365ca9e8;
    stim[62] = 91'h4d2befe781c410c6c4ffa14;
    stim[63] = 91'h77945b00787f4606f9ff8c9;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'h3575b991xxxxxxxx;
      expv[2] = 64'h3575b991xxxxxxxx;
      expv[3] = 64'hxxxxxxxxxxxxxxxx;
      expv[4] = 64'hxxxxxxxxxxxxxxxx;
      expv[5] = 64'hxxxxxxxxb1a04928;
      expv[6] = 64'h516355b3b1a04928;
      expv[7] = 64'h6e213eb9b1a04928;
      expv[8] = 64'h6e213eb9xxxxxxxx;
      expv[9] = 64'hxxxxxxxxxxxxxxxx;
      expv[10] = 64'hxxxxxxxxxxxxxxxx;
      expv[11] = 64'hxxxxxxxxxxxxxxxx;
      expv[12] = 64'hxxxxxxxxxxxxxxxx;
      expv[13] = 64'hxxxxxxxxxxxxxxxx;
      expv[14] = 64'hxxxxxxxxxxxxxxxx;
      expv[15] = 64'hxxxxxxxxxxxxxxxx;
      expv[16] = 64'hxxxxxxxxxxxxxxxx;
      expv[17] = 64'hxxxxxxxxxxxxxxxx;
      expv[18] = 64'hxxxxxxxxxxxxxxxx;
      expv[19] = 64'h33b4ac01xxxxxxxx;
      expv[20] = 64'h22df20c7xxxxxxxx;
      expv[21] = 64'hxxxxxxxxxxxxxxxx;
      expv[22] = 64'ha041aecbxxxxxxxx;
      expv[23] = 64'ha041aecbxxxxxxxx;
      expv[24] = 64'hxxxxxxxxxxxxxxxx;
      expv[25] = 64'hxxxxxxxxxxxxxxxx;
      expv[26] = 64'hxxxxxxxxxxxxxxxx;
      expv[27] = 64'hxxxxxxxxxxxxxxxx;
      expv[28] = 64'hxxxxxxxxxxxxxxxx;
      expv[29] = 64'h9c3627d2xxxxxxxx;
      expv[30] = 64'h9c3627d2xxxxxxxx;
      expv[31] = 64'hb9322c7axxxxxxxx;
      expv[32] = 64'hxxxxxxxxxxxxxxxx;
      expv[33] = 64'hxxxxxxxxxxxxxxxx;
      expv[34] = 64'hxxxxxxxxxxxxxxxx;
      expv[35] = 64'hxxxxxxxxxxxxxxxx;
      expv[36] = 64'h204a71c3xxxxxxxx;
      expv[37] = 64'h204a71c3xxxxxxxx;
      expv[38] = 64'h204a71c3xxxxxxxx;
      expv[39] = 64'hxxxxxxxxxxxxxxxx;
      expv[40] = 64'hxxxxxxxxxxxxxxxx;
      expv[41] = 64'hxxxxxxxx7d2bf964;
      expv[42] = 64'hxxxxxxxx7d2bf964;
      expv[43] = 64'h1d8f43b07d2bf964;
      expv[44] = 64'h1d8f43b07d2bf964;
      expv[45] = 64'h1d8f43b07d2bf964;
      expv[46] = 64'h1d8f43b07d2bf964;
      expv[47] = 64'hxxxxxxxx7d2bf964;
      expv[48] = 64'hxxxxxxxx7d2bf964;
      expv[49] = 64'hxxxxxxxx7d2bf964;
      expv[50] = 64'h6ef579657d2bf964;
      expv[51] = 64'hxxxxxxxxbd84bd70;
      expv[52] = 64'hxxxxxxxxbd84bd70;
      expv[53] = 64'ha1d57944bd84bd70;
      expv[54] = 64'ha1d57944b72d7e12;
      expv[55] = 64'h49e6b82cb72d7e12;
      expv[56] = 64'hxxxxxxxxb72d7e12;
      expv[57] = 64'hxxxxxxxxb72d7e12;
      expv[58] = 64'h6a0e9757b72d7e12;
      expv[59] = 64'h74fb7b84b72d7e12;
      expv[60] = 64'h74fb7b84b72d7e12;
      expv[61] = 64'h0e3dd93ab72d7e12;
      expv[62] = 64'h0e3dd93axxxxxxxx;
      expv[63] = 64'hxxxxxxxxxxxxxxxx;
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
