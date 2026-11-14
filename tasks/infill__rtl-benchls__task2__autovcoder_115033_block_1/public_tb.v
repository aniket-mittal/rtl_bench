// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_115033 dut (
    .clk(clk),
    .reset(in_vec[37:37]),
    .sclk_en(in_vec[36:36]),
    .if_write_ce(in_vec[35:35]),
    .if_write(in_vec[34:34]),
    .if_din(in_vec[33:2]),
    .if_read_ce(in_vec[1:1]),
    .if_read(in_vec[0:0]),
    .if_full_n(out_vec[33:33]),
    .if_empty_n(out_vec[32:32]),
    .if_dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h240b2920be;
    stim[1] = 38'h3e66f60c4b;
    stim[2] = 38'h098e66d41b;
    stim[3] = 38'h09edf400f3;
    stim[4] = 38'h059fdc40e2;
    stim[5] = 38'h01751c9c52;
    stim[6] = 38'h0963f62db7;
    stim[7] = 38'h1a786a1e71;
    stim[8] = 38'h1367801791;
    stim[9] = 38'h0ea0d492a5;
    stim[10] = 38'h1da76291a0;
    stim[11] = 38'h0d6b23a1da;
    stim[12] = 38'h0f7f1d9f6f;
    stim[13] = 38'h0d736efe63;
    stim[14] = 38'h10098a7475;
    stim[15] = 38'h0cad9d58f6;
    stim[16] = 38'h0fa662a0ae;
    stim[17] = 38'h11943ba0d6;
    stim[18] = 38'h0b44851111;
    stim[19] = 38'h07dd13f751;
    stim[20] = 38'h0d3e9adccf;
    stim[21] = 38'h13498353e6;
    stim[22] = 38'h1daebdc4a7;
    stim[23] = 38'h19ba59e7ad;
    stim[24] = 38'h12db8911da;
    stim[25] = 38'h1d98299347;
    stim[26] = 38'h0bc2f19513;
    stim[27] = 38'h0cc31d9a10;
    stim[28] = 38'h1c4c013de2;
    stim[29] = 38'h13d3f47ef6;
    stim[30] = 38'h23ed11df91;
    stim[31] = 38'h0fe3c0413a;
    stim[32] = 38'h0e0ac27bec;
    stim[33] = 38'h1c1520293b;
    stim[34] = 38'h18ed83c38a;
    stim[35] = 38'h09389c9d84;
    stim[36] = 38'h084c5d7cf6;
    stim[37] = 38'h1da0822a07;
    stim[38] = 38'h1c11652b4c;
    stim[39] = 38'h196f4a37f8;
    stim[40] = 38'h1edeab3035;
    stim[41] = 38'h0f2daee720;
    stim[42] = 38'h08324daef4;
    stim[43] = 38'h0c43b6ca8c;
    stim[44] = 38'h07820dea67;
    stim[45] = 38'h0caa6300ea;
    stim[46] = 38'h04813b10fd;
    stim[47] = 38'h0ad99450d4;
    stim[48] = 38'h192c8b4324;
    stim[49] = 38'h0e916ed942;
    stim[50] = 38'h062c3dc705;
    stim[51] = 38'h145f2930ce;
    stim[52] = 38'h0147968dd4;
    stim[53] = 38'h0fc8ab0b89;
    stim[54] = 38'h10c5c38fb4;
    stim[55] = 38'h1692d24fe0;
    stim[56] = 38'h10bb0db4ea;
    stim[57] = 38'h06a02f22b9;
    stim[58] = 38'h1ab779c742;
    stim[59] = 38'h01e7e613b6;
    stim[60] = 38'h05925557d3;
    stim[61] = 38'h11a968f909;
    stim[62] = 38'h1abf84ef43;
    stim[63] = 38'h1ec98e82b8;
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
      expv[0] = 34'h200000000;
      expv[1] = 34'h200000000;
      expv[2] = 34'h200000000;
      expv[3] = 34'h200000000;
      expv[4] = 34'h200000000;
      expv[5] = 34'h200000000;
      expv[6] = 34'h200000000;
      expv[7] = 34'h200000000;
      expv[8] = 34'h200000000;
      expv[9] = 34'h200000000;
      expv[10] = 34'h200000000;
      expv[11] = 34'h200000000;
      expv[12] = 34'h200000000;
      expv[13] = 34'h200000000;
      expv[14] = 34'h200000000;
      expv[15] = 34'h200000000;
      expv[16] = 34'h200000000;
      expv[17] = 34'h200000000;
      expv[18] = 34'h32b67563d;
      expv[19] = 34'h32b67563d;
      expv[20] = 34'h32b67563d;
      expv[21] = 34'h32b67563d;
      expv[22] = 34'h32b67563d;
      expv[23] = 34'h22b67563d;
      expv[24] = 34'h22b67563d;
      expv[25] = 34'h36baf7129;
      expv[26] = 34'h26baf7129;
      expv[27] = 34'h26baf7129;
      expv[28] = 34'h26baf7129;
      expv[29] = 34'h3660a64d1;
      expv[30] = 34'h3660a64d1;
      expv[31] = 34'h200000000;
      expv[32] = 34'h200000000;
      expv[33] = 34'h200000000;
      expv[34] = 34'h200000000;
      expv[35] = 34'h305480a4e;
      expv[36] = 34'h305480a4e;
      expv[37] = 34'h305480a4e;
      expv[38] = 34'h205480a4e;
      expv[39] = 34'h205480a4e;
      expv[40] = 34'h205480a4e;
      expv[41] = 34'h205480a4e;
      expv[42] = 34'h205480a4e;
      expv[43] = 34'h205480a4e;
      expv[44] = 34'h205480a4e;
      expv[45] = 34'h205480a4e;
      expv[46] = 34'h205480a4e;
      expv[47] = 34'h205480a4e;
      expv[48] = 34'h205480a4e;
      expv[49] = 34'h205480a4e;
      expv[50] = 34'h205480a4e;
      expv[51] = 34'h205480a4e;
      expv[52] = 34'h368208a81;
      expv[53] = 34'h368208a81;
      expv[54] = 34'h368208a81;
      expv[55] = 34'h368208a81;
      expv[56] = 34'h368208a81;
      expv[57] = 34'h368208a81;
      expv[58] = 34'h368208a81;
      expv[59] = 34'h368208a81;
      expv[60] = 34'h368208a81;
      expv[61] = 34'h368208a81;
      expv[62] = 34'h368208a81;
      expv[63] = 34'h304594ad3;
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
