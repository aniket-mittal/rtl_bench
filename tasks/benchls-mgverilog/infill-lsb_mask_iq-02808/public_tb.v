// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02808 dut (
    .clock(clk),
    .reset(in_vec[33:33]),
    .enable(in_vec[32:32]),
    .i_in(in_vec[31:16]),
    .q_in(in_vec[15:0]),
    .i_out_ana(out_vec[33:18]),
    .q_out_ana(out_vec[17:2]),
    .i_out_dig(out_vec[1:1]),
    .q_out_dig(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h34d4eaf5c;
    stim[1] = 34'h28b8a22f7;
    stim[2] = 34'h05c2cdeeb;
    stim[3] = 34'h14f97997d;
    stim[4] = 34'h1d5055a98;
    stim[5] = 34'h0708e5c2f;
    stim[6] = 34'h03cdc2bf2;
    stim[7] = 34'h03dee9a57;
    stim[8] = 34'h192b27607;
    stim[9] = 34'h17df53c2d;
    stim[10] = 34'h1a5f462fd;
    stim[11] = 34'h1fa23da17;
    stim[12] = 34'h12fc6ccc8;
    stim[13] = 34'h0fe33b1df;
    stim[14] = 34'h1c63a46dd;
    stim[15] = 34'h1c65c1e44;
    stim[16] = 34'h0c0aaa991;
    stim[17] = 34'h13ec020ba;
    stim[18] = 34'h12e054b22;
    stim[19] = 34'h1b7eedddb;
    stim[20] = 34'h074393cbd;
    stim[21] = 34'h04e21720d;
    stim[22] = 34'h19e9e10ab;
    stim[23] = 34'h169fcc692;
    stim[24] = 34'h13171c52f;
    stim[25] = 34'h0cd1f503d;
    stim[26] = 34'h1916dc6b2;
    stim[27] = 34'h0d9da9e70;
    stim[28] = 34'h1f1e9011d;
    stim[29] = 34'h065e36a3a;
    stim[30] = 34'h168425c1a;
    stim[31] = 34'h054853e83;
    stim[32] = 34'h0759c1ecb;
    stim[33] = 34'h09a41320c;
    stim[34] = 34'h170d4758b;
    stim[35] = 34'h1095b92b0;
    stim[36] = 34'h1c5b4f70c;
    stim[37] = 34'h00dfeac80;
    stim[38] = 34'h137d8224b;
    stim[39] = 34'h085e34c6b;
    stim[40] = 34'h1c2775fef;
    stim[41] = 34'h063f91873;
    stim[42] = 34'h0d5cdb84c;
    stim[43] = 34'h1a67e5d9e;
    stim[44] = 34'h0283e81ce;
    stim[45] = 34'h0702751eb;
    stim[46] = 34'h1cd0c0c9b;
    stim[47] = 34'h078e4bdac;
    stim[48] = 34'h075e17d38;
    stim[49] = 34'h00e241df8;
    stim[50] = 34'h0ae1a18a6;
    stim[51] = 34'h1a62091fc;
    stim[52] = 34'h03cb2090c;
    stim[53] = 34'h06448d216;
    stim[54] = 34'h07b40c12b;
    stim[55] = 34'h1628891df;
    stim[56] = 34'h10d4c4f29;
    stim[57] = 34'h005f41293;
    stim[58] = 34'h085121c5b;
    stim[59] = 34'h11f5574c0;
    stim[60] = 34'h1d380ce0a;
    stim[61] = 34'h037b8a495;
    stim[62] = 34'h19e760b65;
    stim[63] = 34'h17b3a1842;
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
      expv[0] = 34'h1353abd70;
      expv[1] = 34'h22e288bdc;
      expv[2] = 34'h170b37bac;
      expv[3] = 34'h13e5a65f3;
      expv[4] = 34'h354116a62;
      expv[5] = 34'h1c23970bc;
      expv[6] = 34'h0f370afc8;
      expv[7] = 34'h0f7ba695c;
      expv[8] = 34'h24ac9d819;
      expv[9] = 34'h1f7d0f0b3;
      expv[10] = 34'h297d18bf1;
      expv[11] = 34'h3e88b685b;
      expv[12] = 34'h0bf1b3320;
      expv[13] = 34'h3f8cec77c;
      expv[14] = 34'h318e91b71;
      expv[15] = 34'h319707910;
      expv[16] = 34'h302aaa644;
      expv[17] = 34'h0fb0082e8;
      expv[18] = 34'h0b8112c8a;
      expv[19] = 34'h2dfbb7769;
      expv[20] = 34'h1d0e4f2f4;
      expv[21] = 34'h13885c834;
      expv[22] = 34'h27a7842a9;
      expv[23] = 34'h1a7f31a48;
      expv[24] = 34'h0c5c314bb;
      expv[25] = 34'h3347d40f4;
      expv[26] = 34'h245b31aca;
      expv[27] = 34'h3676a79c0;
      expv[28] = 34'h3c7a00473;
      expv[29] = 34'h1978da8e8;
      expv[30] = 34'h1a1097068;
      expv[31] = 34'h15214fa0c;
      expv[32] = 34'h1d6707b2c;
      expv[33] = 34'h26904c830;
      expv[34] = 34'h1c351d629;
      expv[35] = 34'h0256a4ac2;
      expv[36] = 34'h316d3dc30;
      expv[37] = 34'h037fab200;
      expv[38] = 34'h0df608929;
      expv[39] = 34'h2178d31ac;
      expv[40] = 34'h309d97fbb;
      expv[41] = 34'h18fe461cc;
      expv[42] = 34'h35736e130;
      expv[43] = 34'h299f97678;
      expv[44] = 34'h0a0fa0738;
      expv[45] = 34'h1c09d47ac;
      expv[46] = 34'h334303269;
      expv[47] = 34'h1e392f6b0;
      expv[48] = 34'h1d785f4e0;
      expv[49] = 34'h0389077e0;
      expv[50] = 34'h2b8686298;
      expv[51] = 34'h2988247f0;
      expv[52] = 34'h0f2c82430;
      expv[53] = 34'h191234858;
      expv[54] = 34'h1ed0304ac;
      expv[55] = 34'h18a224779;
      expv[56] = 34'h035313ca1;
      expv[57] = 34'h017d04a4c;
      expv[58] = 34'h21448716c;
      expv[59] = 34'h07d51d302;
      expv[60] = 34'h34e033828;
      expv[61] = 34'h0dee29254;
      expv[62] = 34'h279d82d91;
      expv[63] = 34'h1ece86108;
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
