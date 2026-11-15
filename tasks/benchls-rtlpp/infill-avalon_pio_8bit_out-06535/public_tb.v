// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06535 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[39:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h10c4ab1081;
    stim[1] = 37'h05076f1fc7;
    stim[2] = 37'h0642deb49a;
    stim[3] = 37'h0e7c993138;
    stim[4] = 37'h1fdad0b396;
    stim[5] = 37'h17a4dbc5b6;
    stim[6] = 37'h1ede84a617;
    stim[7] = 37'h1bfbcc9a47;
    stim[8] = 37'h0b6aaf3c59;
    stim[9] = 37'h1686d8f27b;
    stim[10] = 37'h160a07986a;
    stim[11] = 37'h026f7fefd8;
    stim[12] = 37'h02f72c4e31;
    stim[13] = 37'h16b9e39baa;
    stim[14] = 37'h179dde325a;
    stim[15] = 37'h16bd64b3e8;
    stim[16] = 37'h041384ef58;
    stim[17] = 37'h1a6c00933d;
    stim[18] = 37'h122e22b9c4;
    stim[19] = 37'h0bdb620daf;
    stim[20] = 37'h1fbcb3d716;
    stim[21] = 37'h1640319c90;
    stim[22] = 37'h163d2f91bc;
    stim[23] = 37'h07dd3a9128;
    stim[24] = 37'h0bd446a91a;
    stim[25] = 37'h0f38db596b;
    stim[26] = 37'h06cac4e2f4;
    stim[27] = 37'h1ee05092b7;
    stim[28] = 37'h0a96dc8977;
    stim[29] = 37'h1a51ffaa6c;
    stim[30] = 37'h0ed3de2672;
    stim[31] = 37'h1ba28347e3;
    stim[32] = 37'h13702aff06;
    stim[33] = 37'h162f0a87f4;
    stim[34] = 37'h0ff498d037;
    stim[35] = 37'h0b7a05eb51;
    stim[36] = 37'h07ff496a95;
    stim[37] = 37'h1bae3dc255;
    stim[38] = 37'h0211007ba8;
    stim[39] = 37'h1bcaf4d186;
    stim[40] = 37'h17c59c7f48;
    stim[41] = 37'h0bc0921ba4;
    stim[42] = 37'h06d25c832c;
    stim[43] = 37'h062d6accae;
    stim[44] = 37'h1b5a99a594;
    stim[45] = 37'h0779deed7d;
    stim[46] = 37'h16c906e2dc;
    stim[47] = 37'h1a11ffe61e;
    stim[48] = 37'h1691d9e801;
    stim[49] = 37'h03df561596;
    stim[50] = 37'h1dc5737cf3;
    stim[51] = 37'h0e2d1c881d;
    stim[52] = 37'h13a4fea110;
    stim[53] = 37'h129b1b9a3b;
    stim[54] = 37'h03cbeb5f93;
    stim[55] = 37'h16b786e784;
    stim[56] = 37'h1f416780c0;
    stim[57] = 37'h0b17199e7d;
    stim[58] = 37'h0fb92a4dab;
    stim[59] = 37'h1bb407b175;
    stim[60] = 37'h0e40a8571b;
    stim[61] = 37'h0ef7bca3b0;
    stim[62] = 37'h1ba6388cfb;
    stim[63] = 37'h07a88e3c69;
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
      expv[0] = 40'h0000000000;
      expv[1] = 40'h0000000000;
      expv[2] = 40'h0000000000;
      expv[3] = 40'h9a00000000;
      expv[4] = 40'h9a00000000;
      expv[5] = 40'h9a00000000;
      expv[6] = 40'h9a00000000;
      expv[7] = 40'h9a00000000;
      expv[8] = 40'h9a00000000;
      expv[9] = 40'h9a00000000;
      expv[10] = 40'h9a00000000;
      expv[11] = 40'h9a0000009a;
      expv[12] = 40'h9a0000009a;
      expv[13] = 40'h9a00000000;
      expv[14] = 40'h9a00000000;
      expv[15] = 40'h9a00000000;
      expv[16] = 40'h0000000000;
      expv[17] = 40'h0000000000;
      expv[18] = 40'h0000000000;
      expv[19] = 40'h0000000000;
      expv[20] = 40'h0000000000;
      expv[21] = 40'h0000000000;
      expv[22] = 40'h0000000000;
      expv[23] = 40'h0000000000;
      expv[24] = 40'h0000000000;
      expv[25] = 40'h0000000000;
      expv[26] = 40'h0000000000;
      expv[27] = 40'hf400000000;
      expv[28] = 40'hf400000000;
      expv[29] = 40'hf400000000;
      expv[30] = 40'hf400000000;
      expv[31] = 40'hf400000000;
      expv[32] = 40'hf400000000;
      expv[33] = 40'hf400000000;
      expv[34] = 40'hf400000000;
      expv[35] = 40'hf400000000;
      expv[36] = 40'hf4000000f4;
      expv[37] = 40'hf400000000;
      expv[38] = 40'hf4000000f4;
      expv[39] = 40'hf400000000;
      expv[40] = 40'hf400000000;
      expv[41] = 40'hf400000000;
      expv[42] = 40'hf4000000f4;
      expv[43] = 40'h2c0000002c;
      expv[44] = 40'hae00000000;
      expv[45] = 40'hae000000ae;
      expv[46] = 40'hae00000000;
      expv[47] = 40'hae00000000;
      expv[48] = 40'hae00000000;
      expv[49] = 40'hae000000ae;
      expv[50] = 40'h0000000000;
      expv[51] = 40'h0000000000;
      expv[52] = 40'h0000000000;
      expv[53] = 40'h0000000000;
      expv[54] = 40'h0000000000;
      expv[55] = 40'h0000000000;
      expv[56] = 40'h0000000000;
      expv[57] = 40'h0000000000;
      expv[58] = 40'h0000000000;
      expv[59] = 40'h0000000000;
      expv[60] = 40'h0000000000;
      expv[61] = 40'h0000000000;
      expv[62] = 40'h0000000000;
      expv[63] = 40'h0000000000;
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
