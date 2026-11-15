// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_028660 dut (
    .A(in_vec[67:36]),
    .B(in_vec[35:4]),
    .ALUctrl(in_vec[3:0]),
    .ALUout(out_vec[35:4]),
    .N(out_vec[3:3]),
    .C(out_vec[2:2]),
    .V(out_vec[1:1]),
    .Z(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'h4ba6afd2ec11e748c;
    stim[1] = 68'h0e847c24f1604d126;
    stim[2] = 68'h6d0b184a7ab572ed1;
    stim[3] = 68'h4f27cc64b6b44322f;
    stim[4] = 68'hb44dbb0c08807c4b6;
    stim[5] = 68'haf9aae2efdb8a0fbd;
    stim[6] = 68'heb966f3c706d28d7e;
    stim[7] = 68'hf69baee09056d4483;
    stim[8] = 68'haa2113f706d5ca2dc;
    stim[9] = 68'h1d3e7e2ff282ee339;
    stim[10] = 68'h1a0dcb4a2b85e72f0;
    stim[11] = 68'h2bd8335d4114baa04;
    stim[12] = 68'h7d6f31346e4e32f7d;
    stim[13] = 68'h68e28d43dcfa5b0f2;
    stim[14] = 68'he9ef05e923aa344b7;
    stim[15] = 68'h268795d7549bfab9b;
    stim[16] = 68'h200db07f72cb6536b;
    stim[17] = 68'h5fe057731fd82b129;
    stim[18] = 68'hd5d163755af2394b7;
    stim[19] = 68'h571fe060f2d5a07e9;
    stim[20] = 68'h5b9f3f5caec242827;
    stim[21] = 68'h955d3fa1aeeafe51f;
    stim[22] = 68'hbfc13176daadc90b5;
    stim[23] = 68'h4e6ee3c1ca322d932;
    stim[24] = 68'h9195dba6cb28b4732;
    stim[25] = 68'h89cdd9ab3b52c08fc;
    stim[26] = 68'h22d58d455a53b5c93;
    stim[27] = 68'h89e5922f37a6c1659;
    stim[28] = 68'h82e836fc222a30863;
    stim[29] = 68'h088b6e43a0680573c;
    stim[30] = 68'h46652090ad4411dd5;
    stim[31] = 68'h18a4387dcabad1d48;
    stim[32] = 68'h9695f1797f63ea61b;
    stim[33] = 68'h011e741729a5fc2fd;
    stim[34] = 68'h87ae7c86b3bae5ca9;
    stim[35] = 68'hcec32e2550beb345e;
    stim[36] = 68'h19cd700075ec71b8e;
    stim[37] = 68'hee11b6d18a4d72592;
    stim[38] = 68'h05bf781295dcac5b6;
    stim[39] = 68'h43a6c2209b226b7f8;
    stim[40] = 68'h1cdd1f8099928c683;
    stim[41] = 68'hd60871aca72513071;
    stim[42] = 68'hbc63a7e944789a542;
    stim[43] = 68'hbf18f3a6e4aa71729;
    stim[44] = 68'h8d94481a12635b1c3;
    stim[45] = 68'h68bb81d8daea2004d;
    stim[46] = 68'h2a21f7609fb70feb6;
    stim[47] = 68'h3bd5860b3b5c64c50;
    stim[48] = 68'h54854c9ff4c6eb40c;
    stim[49] = 68'h17e35437ee87eb74d;
    stim[50] = 68'hc7d521e7c9592cf70;
    stim[51] = 68'hed9606539bccb4cae;
    stim[52] = 68'h96f0d45df61b56640;
    stim[53] = 68'h6c764f5840d4c8588;
    stim[54] = 68'hb9bcd7afe3a630ee1;
    stim[55] = 68'h30dd2c1184e3b0768;
    stim[56] = 68'h57db8ca19f53bda70;
    stim[57] = 68'h346786aae2f2013e2;
    stim[58] = 68'h773af155f4e3bf861;
    stim[59] = 68'h55c316af06ffb8533;
    stim[60] = 68'h8a54df7c1fd167ae7;
    stim[61] = 68'hd1b0125034313d776;
    stim[62] = 68'h880ad4801844275b8;
    stim[63] = 68'h2e59cb7c61ecdfafd;
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
      expv[0] = 36'h10481025x;
      expv[1] = 36'h1d242f12x;
      expv[2] = 36'h7fbf7aefx;
      expv[3] = 36'h00000000x;
      expv[4] = 36'habcd3ec1x;
      expv[5] = 36'h5f355c5cx;
      expv[6] = 36'h7b2946652;
      expv[7] = 36'h66cd7aa8x;
      expv[8] = 36'h510a2400x;
      expv[9] = 36'hxxxxxxxxx;
      expv[10] = 36'h0a05c30ax;
      expv[11] = 36'h00000001x;
      expv[12] = 36'hfade6268x;
      expv[13] = 36'h45dce852x;
      expv[14] = 36'h1610fa16x;
      expv[15] = 36'hxxxxxxxxx;
      expv[16] = 36'hxxxxxxxxx;
      expv[17] = 36'hxxxxxxxxx;
      expv[18] = 36'h2a2e9c8ax;
      expv[19] = 36'hxxxxxxxxx;
      expv[20] = 36'ha460c0a3x;
      expv[21] = 36'h00000001x;
      expv[22] = 36'hxxxxxxxxx;
      expv[23] = 36'h18a11154x;
      expv[24] = 36'h5cbe9019x;
      expv[25] = 36'h44202650x;
      expv[26] = 36'h7886388cx;
      expv[27] = 36'hxxxxxxxxx;
      expv[28] = 36'ha0c2067ax;
      expv[29] = 36'h5714908cx;
      expv[30] = 36'hxxxxxxxxx;
      expv[31] = 36'hxxxxxxxxx;
      expv[32] = 36'hxxxxxxxxx;
      expv[33] = 36'h023ce82ex;
      expv[34] = 36'hxxxxxxxxx;
      expv[35] = 36'h7e047ae02;
      expv[36] = 36'ha3e0fe48c;
      expv[37] = 36'h785f292ax;
      expv[38] = 36'h6fe2cbb7x;
      expv[39] = 36'hxxxxxxxxx;
      expv[40] = 36'h854f93e8x;
      expv[41] = 36'hf72d73afx;
      expv[42] = 36'h00dc423dx;
      expv[43] = 36'hxxxxxxxxx;
      expv[44] = 36'h9ff71306x;
      expv[45] = 36'hd17703b0x;
      expv[46] = 36'h8a6ae775x;
      expv[47] = 36'h3b540401x;
      expv[48] = 36'h0b381020x;
      expv[49] = 36'h2fc6a86ex;
      expv[50] = 36'hc15120e7x;
      expv[51] = 36'h51c951890;
      expv[52] = 36'h96105444x;
      expv[53] = 36'hxxxxxxxxx;
      expv[54] = 36'hfbbef7efx;
      expv[55] = 36'hxxxxxxxxx;
      expv[56] = 36'h17538ca1x;
      expv[57] = 36'h175987e8x;
      expv[58] = 36'hf7fbffd7x;
      expv[59] = 36'h533caefcx;
      expv[60] = 36'h75ab2083x;
      expv[61] = 36'h9d7ed4d9x;
      expv[62] = 36'hxxxxxxxxx;
      expv[63] = 36'h5cb396f8x;
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
