// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06643 dut (
    .iClock(clk),
    .iReset(in_vec[35:35]),
    .iOsc64(in_vec[34:34]),
    .iOsc256(in_vec[33:33]),
    .iOsc262k(in_vec[32:32]),
    .iNR21(in_vec[31:24]),
    .iNR22(in_vec[23:16]),
    .iNR23(in_vec[15:8]),
    .iNR24(in_vec[7:0]),
    .oOut(out_vec[5:1]),
    .oOnFlag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'ha78886f06;
    stim[1] = 36'he7385587e;
    stim[2] = 36'h6a607d589;
    stim[3] = 36'h70315ff1c;
    stim[4] = 36'h7a8498149;
    stim[5] = 36'h5e47a8f37;
    stim[6] = 36'h1b277b989;
    stim[7] = 36'h4ad293349;
    stim[8] = 36'h57fc622dd;
    stim[9] = 36'h1706a62a1;
    stim[10] = 36'h7a1a65fdf;
    stim[11] = 36'h51f71f1f1;
    stim[12] = 36'h2147af952;
    stim[13] = 36'h5b716c47a;
    stim[14] = 36'h0652872aa;
    stim[15] = 36'h4ff0e76e5;
    stim[16] = 36'h1dd228370;
    stim[17] = 36'h17d2719ab;
    stim[18] = 36'h4c629bae5;
    stim[19] = 36'h056a75f57;
    stim[20] = 36'h5f2da8521;
    stim[21] = 36'h047ad80b6;
    stim[22] = 36'h1183197f9;
    stim[23] = 36'h45928ae88;
    stim[24] = 36'h7f4548a5d;
    stim[25] = 36'h31997b7c5;
    stim[26] = 36'h671b8460a;
    stim[27] = 36'h994d76f7c;
    stim[28] = 36'h31b1bfcf4;
    stim[29] = 36'h94ef0cfd1;
    stim[30] = 36'h2fa324703;
    stim[31] = 36'h438cb58b6;
    stim[32] = 36'h3781bfa36;
    stim[33] = 36'h6b4bd01b0;
    stim[34] = 36'h7c3df128f;
    stim[35] = 36'h11a7904cf;
    stim[36] = 36'h3bb359c9c;
    stim[37] = 36'h2ec11199d;
    stim[38] = 36'h1bffd4359;
    stim[39] = 36'h4378bcb0f;
    stim[40] = 36'h06f85482a;
    stim[41] = 36'h22a7becb9;
    stim[42] = 36'h7dcd38c0b;
    stim[43] = 36'h4ca94040b;
    stim[44] = 36'h6f944f95d;
    stim[45] = 36'h638e433e4;
    stim[46] = 36'h421bad61b;
    stim[47] = 36'h35737bcda;
    stim[48] = 36'h321b1bd42;
    stim[49] = 36'h483e43e05;
    stim[50] = 36'h45169c965;
    stim[51] = 36'h27d442601;
    stim[52] = 36'h1f12e5c40;
    stim[53] = 36'h5acfd1ee0;
    stim[54] = 36'h25aded220;
    stim[55] = 36'h33ab40fab;
    stim[56] = 36'h023166de4;
    stim[57] = 36'h65fe6650b;
    stim[58] = 36'h749244d3b;
    stim[59] = 36'h0cb21d060;
    stim[60] = 36'h0615f3083;
    stim[61] = 36'h043ecf68d;
    stim[62] = 36'h3ccb20095;
    stim[63] = 36'h11bfee903;
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
      expv[0] = 6'hxx;
      expv[1] = 6'hxx;
      expv[2] = 6'h0e;
      expv[3] = 6'h0e;
      expv[4] = 6'h1e;
      expv[5] = 6'h1e;
      expv[6] = 6'h1e;
      expv[7] = 6'h1e;
      expv[8] = 6'h10;
      expv[9] = 6'h10;
      expv[10] = 6'h06;
      expv[11] = 6'h12;
      expv[12] = 6'h0a;
      expv[13] = 6'h10;
      expv[14] = 6'h12;
      expv[15] = 6'h12;
      expv[16] = 6'h1a;
      expv[17] = 6'h1e;
      expv[18] = 6'h1e;
      expv[19] = 6'h1a;
      expv[20] = 6'h1a;
      expv[21] = 6'h18;
      expv[22] = 6'h18;
      expv[23] = 6'h0a;
      expv[24] = 6'h1a;
      expv[25] = 6'h1a;
      expv[26] = 6'h1a;
      expv[27] = 6'h0c;
      expv[28] = 6'h0c;
      expv[29] = 6'h04;
      expv[30] = 6'h1c;
      expv[31] = 6'h00;
      expv[32] = 6'h00;
      expv[33] = 6'h06;
      expv[34] = 6'h06;
      expv[35] = 6'h08;
      expv[36] = 6'h04;
      expv[37] = 6'h10;
      expv[38] = 6'h18;
      expv[39] = 6'h1c;
      expv[40] = 6'h1e;
      expv[41] = 6'h1e;
      expv[42] = 6'h1e;
      expv[43] = 6'h10;
      expv[44] = 6'h10;
      expv[45] = 6'h10;
      expv[46] = 6'h10;
      expv[47] = 6'h02;
      expv[48] = 6'h02;
      expv[49] = 6'h18;
      expv[50] = 6'h18;
      expv[51] = 6'h18;
      expv[52] = 6'h18;
      expv[53] = 6'h18;
      expv[54] = 6'h18;
      expv[55] = 6'h00;
      expv[56] = 6'h00;
      expv[57] = 6'h08;
      expv[58] = 6'h1c;
      expv[59] = 6'h1c;
      expv[60] = 6'h1c;
      expv[61] = 6'h1c;
      expv[62] = 6'h14;
      expv[63] = 6'h02;
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
