// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06807 dut (
    .CLK_IN(clk),
    .reset(in_vec[19:19]),
    .enb_1_2000_0(in_vec[18:18]),
    .x(in_vec[17:0]),
    .y(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'hd9d18;
    stim[1] = 20'ha5633;
    stim[2] = 20'h07235;
    stim[3] = 20'h33946;
    stim[4] = 20'h2a187;
    stim[5] = 20'h18fe5;
    stim[6] = 20'h0a36b;
    stim[7] = 20'h59c96;
    stim[8] = 20'h1ee83;
    stim[9] = 20'h12d52;
    stim[10] = 20'h36aa3;
    stim[11] = 20'h145de;
    stim[12] = 20'h2db7b;
    stim[13] = 20'h36a2a;
    stim[14] = 20'h2e20a;
    stim[15] = 20'hdae0b;
    stim[16] = 20'h5a6ee;
    stim[17] = 20'h3ecc1;
    stim[18] = 20'h029c8;
    stim[19] = 20'h27328;
    stim[20] = 20'h6b949;
    stim[21] = 20'h18703;
    stim[22] = 20'h3174b;
    stim[23] = 20'h06a52;
    stim[24] = 20'h29ded;
    stim[25] = 20'h0dd7e;
    stim[26] = 20'h7c5de;
    stim[27] = 20'h3b4b3;
    stim[28] = 20'h28ec3;
    stim[29] = 20'h3c0cb;
    stim[30] = 20'h05f68;
    stim[31] = 20'h237aa;
    stim[32] = 20'h4baef;
    stim[33] = 20'h3491b;
    stim[34] = 20'h40269;
    stim[35] = 20'h5991f;
    stim[36] = 20'h097bf;
    stim[37] = 20'h6b321;
    stim[38] = 20'h08f45;
    stim[39] = 20'h389d4;
    stim[40] = 20'h7e3b8;
    stim[41] = 20'h24df0;
    stim[42] = 20'h1679e;
    stim[43] = 20'h17c95;
    stim[44] = 20'h07158;
    stim[45] = 20'h58a21;
    stim[46] = 20'h65ac2;
    stim[47] = 20'h765aa;
    stim[48] = 20'h4f000;
    stim[49] = 20'h2c45f;
    stim[50] = 20'h22ece;
    stim[51] = 20'h7cf9c;
    stim[52] = 20'h371e0;
    stim[53] = 20'h6e5e2;
    stim[54] = 20'h46275;
    stim[55] = 20'h30c55;
    stim[56] = 20'h0b871;
    stim[57] = 20'h56f17;
    stim[58] = 20'h2ac34;
    stim[59] = 20'h16c70;
    stim[60] = 20'h53fb1;
    stim[61] = 20'h4de39;
    stim[62] = 20'h9520a;
    stim[63] = 20'h51f5f;
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
      expv[0] = 1'hx;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
