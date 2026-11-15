// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 29;
  localparam OW = 26;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00365 dut (
    .clk(clk),
    .resetn(in_vec[28:28]),
    .d(in_vec[27:2]),
    .squashn(in_vec[1:1]),
    .en(in_vec[0:0]),
    .q(out_vec[25:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 29'h060bed90;
    stim[1] = 29'h0032ef32;
    stim[2] = 29'h18a6d8f6;
    stim[3] = 29'h18e47872;
    stim[4] = 29'h113b9473;
    stim[5] = 29'h19f31e3b;
    stim[6] = 29'h0ca5fc39;
    stim[7] = 29'h1b4aa2d9;
    stim[8] = 29'h147e6c23;
    stim[9] = 29'h12d8db69;
    stim[10] = 29'h1b46354f;
    stim[11] = 29'h14fc2375;
    stim[12] = 29'h142cd70f;
    stim[13] = 29'h143eae7f;
    stim[14] = 29'h15c9e458;
    stim[15] = 29'h10f8b9fb;
    stim[16] = 29'h1d810846;
    stim[17] = 29'h0f5dbecb;
    stim[18] = 29'h1fc05090;
    stim[19] = 29'h1aab0878;
    stim[20] = 29'h1b41b477;
    stim[21] = 29'h176564f9;
    stim[22] = 29'h1d793218;
    stim[23] = 29'h163bb2ec;
    stim[24] = 29'h12139534;
    stim[25] = 29'h134fd4e1;
    stim[26] = 29'h132b4bbd;
    stim[27] = 29'h142ae3a7;
    stim[28] = 29'h1baafb62;
    stim[29] = 29'h1b06b81b;
    stim[30] = 29'h19115c9b;
    stim[31] = 29'h16df65f6;
    stim[32] = 29'h1ab8d17a;
    stim[33] = 29'h127b0e86;
    stim[34] = 29'h1087857c;
    stim[35] = 29'h185e0163;
    stim[36] = 29'h1c03c358;
    stim[37] = 29'h1807ad97;
    stim[38] = 29'h127aaa86;
    stim[39] = 29'h13c9221e;
    stim[40] = 29'h1c8a80aa;
    stim[41] = 29'h17ac8b12;
    stim[42] = 29'h17321ce4;
    stim[43] = 29'h1afea1f6;
    stim[44] = 29'h1032b67a;
    stim[45] = 29'h1a2a1bdb;
    stim[46] = 29'h10406af2;
    stim[47] = 29'h1b8511f8;
    stim[48] = 29'h11dcbf7d;
    stim[49] = 29'h1cc70610;
    stim[50] = 29'h12542c3e;
    stim[51] = 29'h12f0d796;
    stim[52] = 29'h1107b834;
    stim[53] = 29'h1c178695;
    stim[54] = 29'h19e09ad9;
    stim[55] = 29'h18564c20;
    stim[56] = 29'h184dffbc;
    stim[57] = 29'h14b89643;
    stim[58] = 29'h1df021bf;
    stim[59] = 29'h19a62fdd;
    stim[60] = 29'h0a375eda;
    stim[61] = 29'h124487bf;
    stim[62] = 29'h19b40676;
    stim[63] = 29'h11f432b4;
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
      expv[0] = 26'hxxxxxxx;
      expv[1] = 26'h0000000;
      expv[2] = 26'h0000000;
      expv[3] = 26'h0000000;
      expv[4] = 26'h0000000;
      expv[5] = 26'h04ee51c;
      expv[6] = 26'h27cc78e;
      expv[7] = 26'h0000000;
      expv[8] = 26'h0000000;
      expv[9] = 26'h11f9b08;
      expv[10] = 26'h0000000;
      expv[11] = 26'h2d18d53;
      expv[12] = 26'h0000000;
      expv[13] = 26'h10b35c3;
      expv[14] = 26'h10fab9f;
      expv[15] = 26'h0000000;
      expv[16] = 26'h03e2e7e;
      expv[17] = 26'h03e2e7e;
      expv[18] = 26'h0000000;
      expv[19] = 26'h0000000;
      expv[20] = 26'h0000000;
      expv[21] = 26'h2d06d1d;
      expv[22] = 26'h0000000;
      expv[23] = 26'h0000000;
      expv[24] = 26'h0000000;
      expv[25] = 26'h0000000;
      expv[26] = 26'h0000000;
      expv[27] = 26'h0000000;
      expv[28] = 26'h10ab8e9;
      expv[29] = 26'h10ab8e9;
      expv[30] = 26'h2c1ae06;
      expv[31] = 26'h2445726;
      expv[32] = 26'h2445726;
      expv[33] = 26'h2445726;
      expv[34] = 26'h2445726;
      expv[35] = 26'h0000000;
      expv[36] = 26'h2178058;
      expv[37] = 26'h0000000;
      expv[38] = 26'h201eb65;
      expv[39] = 26'h201eb65;
      expv[40] = 26'h201eb65;
      expv[41] = 26'h201eb65;
      expv[42] = 26'h201eb65;
      expv[43] = 26'h0000000;
      expv[44] = 26'h0000000;
      expv[45] = 26'h0000000;
      expv[46] = 26'h28a86f6;
      expv[47] = 26'h28a86f6;
      expv[48] = 26'h0000000;
      expv[49] = 26'h0000000;
      expv[50] = 26'h0000000;
      expv[51] = 26'h0000000;
      expv[52] = 26'h0000000;
      expv[53] = 26'h0000000;
      expv[54] = 26'h0000000;
      expv[55] = 26'h0000000;
      expv[56] = 26'h0000000;
      expv[57] = 26'h0000000;
      expv[58] = 26'h12e2590;
      expv[59] = 26'h37c086f;
      expv[60] = 26'h0000000;
      expv[61] = 26'h0000000;
      expv[62] = 26'h09121ef;
      expv[63] = 26'h09121ef;
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
