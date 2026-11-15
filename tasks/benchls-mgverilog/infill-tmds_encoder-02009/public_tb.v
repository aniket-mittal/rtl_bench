// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02009 dut (
    .clk(clk),
    .VD(in_vec[10:3]),
    .CD(in_vec[2:1]),
    .VDE(in_vec[0:0]),
    .TMDS(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h788;
    stim[1] = 11'h5f1;
    stim[2] = 11'h6dc;
    stim[3] = 11'h4b5;
    stim[4] = 11'h0cb;
    stim[5] = 11'h009;
    stim[6] = 11'h69e;
    stim[7] = 11'h5e1;
    stim[8] = 11'h7bf;
    stim[9] = 11'h2a6;
    stim[10] = 11'h3a5;
    stim[11] = 11'h134;
    stim[12] = 11'h64e;
    stim[13] = 11'h01c;
    stim[14] = 11'h2d4;
    stim[15] = 11'h7ad;
    stim[16] = 11'h16a;
    stim[17] = 11'h1c6;
    stim[18] = 11'h726;
    stim[19] = 11'h26a;
    stim[20] = 11'h7d8;
    stim[21] = 11'h088;
    stim[22] = 11'h1f4;
    stim[23] = 11'h643;
    stim[24] = 11'h46b;
    stim[25] = 11'h67b;
    stim[26] = 11'h038;
    stim[27] = 11'h224;
    stim[28] = 11'h5eb;
    stim[29] = 11'h752;
    stim[30] = 11'h3a2;
    stim[31] = 11'h107;
    stim[32] = 11'h269;
    stim[33] = 11'h07f;
    stim[34] = 11'h70b;
    stim[35] = 11'h4d8;
    stim[36] = 11'h565;
    stim[37] = 11'h674;
    stim[38] = 11'h502;
    stim[39] = 11'h4c9;
    stim[40] = 11'h0e0;
    stim[41] = 11'h197;
    stim[42] = 11'h09b;
    stim[43] = 11'h7d0;
    stim[44] = 11'h59f;
    stim[45] = 11'h5bc;
    stim[46] = 11'h2fc;
    stim[47] = 11'h142;
    stim[48] = 11'h1c4;
    stim[49] = 11'h4a1;
    stim[50] = 11'h598;
    stim[51] = 11'h25a;
    stim[52] = 11'h3ed;
    stim[53] = 11'h646;
    stim[54] = 11'h0ff;
    stim[55] = 11'h1b0;
    stim[56] = 11'h51d;
    stim[57] = 11'h7db;
    stim[58] = 11'h20d;
    stim[59] = 11'h069;
    stim[60] = 11'h146;
    stim[61] = 11'h08a;
    stim[62] = 11'h2c3;
    stim[63] = 11'h236;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h354;
      expv[2] = 10'h354;
      expv[3] = 10'h23f;
      expv[4] = 10'h154;
      expv[5] = 10'h227;
      expv[6] = 10'h1f7;
      expv[7] = 10'h300;
      expv[8] = 10'h2ab;
      expv[9] = 10'h2c1;
      expv[10] = 10'h2f8;
      expv[11] = 10'h2ab;
      expv[12] = 10'h279;
      expv[13] = 10'h154;
      expv[14] = 10'h2ab;
      expv[15] = 10'h154;
      expv[16] = 10'h154;
      expv[17] = 10'h206;
      expv[18] = 10'h0ab;
      expv[19] = 10'h2ab;
      expv[20] = 10'h2ab;
      expv[21] = 10'h0ab;
      expv[22] = 10'h354;
      expv[23] = 10'h354;
      expv[24] = 10'h154;
      expv[25] = 10'h1b8;
      expv[26] = 10'h17b;
      expv[27] = 10'h210;
      expv[28] = 10'h354;
      expv[29] = 10'h154;
      expv[30] = 10'h23e;
      expv[31] = 10'h0ab;
      expv[32] = 10'h0ab;
      expv[33] = 10'h1e0;
      expv[34] = 10'h13b;
      expv[35] = 10'h105;
      expv[36] = 10'h3a0;
      expv[37] = 10'h354;
      expv[38] = 10'h231;
      expv[39] = 10'h154;
      expv[40] = 10'h0ab;
      expv[41] = 10'h177;
      expv[42] = 10'h354;
      expv[43] = 10'h1ee;
      expv[44] = 10'h30e;
      expv[45] = 10'h354;
      expv[46] = 10'h2c4;
      expv[47] = 10'h154;
      expv[48] = 10'h154;
      expv[49] = 10'h0ab;
      expv[50] = 10'h154;
      expv[51] = 10'h18c;
      expv[52] = 10'h354;
      expv[53] = 10'h0ab;
      expv[54] = 10'h27e;
      expv[55] = 10'h2ab;
      expv[56] = 10'h2a0;
      expv[57] = 10'h354;
      expv[58] = 10'h161;
      expv[59] = 10'h2fc;
      expv[60] = 10'h3c0;
      expv[61] = 10'h1fb;
      expv[62] = 10'h2ab;
      expv[63] = 10'h0ab;
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
