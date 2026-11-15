// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_076729 dut (
    .a(in_vec[18:3]),
    .one_j(in_vec[2:2]),
    .two_j(in_vec[1:1]),
    .sign_j(in_vec[0:0]),
    .results(out_vec[16:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h221f6;
    stim[1] = 19'h59d32;
    stim[2] = 19'h4c056;
    stim[3] = 19'h308aa;
    stim[4] = 19'h3acc4;
    stim[5] = 19'h3589e;
    stim[6] = 19'h19642;
    stim[7] = 19'h5e3d9;
    stim[8] = 19'h3816d;
    stim[9] = 19'h7a860;
    stim[10] = 19'h13368;
    stim[11] = 19'h580cb;
    stim[12] = 19'h5626b;
    stim[13] = 19'h26f5b;
    stim[14] = 19'h68aba;
    stim[15] = 19'h69f78;
    stim[16] = 19'h29279;
    stim[17] = 19'h4c598;
    stim[18] = 19'h22d04;
    stim[19] = 19'h6e39d;
    stim[20] = 19'h48837;
    stim[21] = 19'h09a26;
    stim[22] = 19'h62100;
    stim[23] = 19'h0b534;
    stim[24] = 19'h72e41;
    stim[25] = 19'h4a0ca;
    stim[26] = 19'h577bb;
    stim[27] = 19'h61cf9;
    stim[28] = 19'h51399;
    stim[29] = 19'h6ee16;
    stim[30] = 19'h0c5ad;
    stim[31] = 19'h538a7;
    stim[32] = 19'h3246e;
    stim[33] = 19'h59489;
    stim[34] = 19'h37f9b;
    stim[35] = 19'h3edf2;
    stim[36] = 19'h01283;
    stim[37] = 19'h61e9d;
    stim[38] = 19'h1c6fe;
    stim[39] = 19'h556b3;
    stim[40] = 19'h33e9a;
    stim[41] = 19'h375ea;
    stim[42] = 19'h34bdd;
    stim[43] = 19'h053ad;
    stim[44] = 19'h5798a;
    stim[45] = 19'h71070;
    stim[46] = 19'h61691;
    stim[47] = 19'h5c7f7;
    stim[48] = 19'h3d54a;
    stim[49] = 19'h232a4;
    stim[50] = 19'h2054f;
    stim[51] = 19'h31906;
    stim[52] = 19'h214a2;
    stim[53] = 19'h46e31;
    stim[54] = 19'h1677f;
    stim[55] = 19'h367b7;
    stim[56] = 19'h7ef47;
    stim[57] = 19'h6feaa;
    stim[58] = 19'h3a7af;
    stim[59] = 19'h6e314;
    stim[60] = 19'h56f38;
    stim[61] = 19'h372af;
    stim[62] = 19'h699ce;
    stim[63] = 19'h7f644;
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
      expv[0] = 17'h0cc7e;
      expv[1] = 17'h1674c;
      expv[2] = 17'h0b81e;
      expv[3] = 17'h0c22a;
      expv[4] = 17'h17598;
      expv[5] = 17'h0ff37;
      expv[6] = 17'h16590;
      expv[7] = 17'h0ffff;
      expv[8] = 17'h08fd2;
      expv[9] = 17'h10000;
      expv[10] = 17'h10000;
      expv[11] = 17'h09fcd;
      expv[12] = 17'h0a765;
      expv[13] = 17'h16429;
      expv[14] = 17'h0a2ae;
      expv[15] = 17'h10000;
      expv[16] = 17'h0ffff;
      expv[17] = 17'h10000;
      expv[18] = 17'h145a0;
      expv[19] = 17'h1238c;
      expv[20] = 17'h14cf1;
      expv[21] = 17'h137cc;
      expv[22] = 17'h10000;
      expv[23] = 17'h116a6;
      expv[24] = 17'h0ffff;
      expv[25] = 17'h12832;
      expv[26] = 17'h0a211;
      expv[27] = 17'h0ffff;
      expv[28] = 17'h0ffff;
      expv[29] = 17'h0ffc6;
      expv[30] = 17'h0e74a;
      expv[31] = 17'h110c3;
      expv[32] = 17'h0ed9f;
      expv[33] = 17'h0ffff;
      expv[34] = 17'h12019;
      expv[35] = 17'h0fb7c;
      expv[36] = 17'h0fb5f;
      expv[37] = 17'h13c2c;
      expv[38] = 17'h179ff;
      expv[39] = 17'h0aa53;
      expv[40] = 17'h0cfa6;
      expv[41] = 17'h0dd7a;
      expv[42] = 17'h09684;
      expv[43] = 17'h0f58a;
      expv[44] = 17'h15e62;
      expv[45] = 17'h10000;
      expv[46] = 17'h0ffff;
      expv[47] = 17'h10601;
      expv[48] = 17'h0f552;
      expv[49] = 17'h14654;
      expv[50] = 17'h13e04;
      expv[51] = 17'h0e760;
      expv[52] = 17'h08528;
      expv[53] = 17'h0ffff;
      expv[54] = 17'h08200;
      expv[55] = 17'h10201;
      expv[56] = 17'h10007;
      expv[57] = 17'h0bfaa;
      expv[58] = 17'h10200;
      expv[59] = 17'h0dc62;
      expv[60] = 17'h10000;
      expv[61] = 17'h10100;
      expv[62] = 17'h0f77b;
      expv[63] = 17'h0fec8;
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
