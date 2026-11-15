// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_118956 dut (
    .A(in_vec[31:16]),
    .B(in_vec[15:0]),
    .Sum(out_vec[16:1]),
    .CO(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hde021336;
    stim[1] = 32'h89cd67d9;
    stim[2] = 32'hc16b11c9;
    stim[3] = 32'h031017ce;
    stim[4] = 32'h84624e04;
    stim[5] = 32'hfb95eb99;
    stim[6] = 32'h4dca4f9a;
    stim[7] = 32'haa29670c;
    stim[8] = 32'hfb494cba;
    stim[9] = 32'h0677afa5;
    stim[10] = 32'h6633571d;
    stim[11] = 32'hc8c03ecb;
    stim[12] = 32'hdbe3a194;
    stim[13] = 32'hf4ef93fd;
    stim[14] = 32'hb657d8ad;
    stim[15] = 32'he085b66d;
    stim[16] = 32'h8f7d5d30;
    stim[17] = 32'hb028797d;
    stim[18] = 32'h3437a2d4;
    stim[19] = 32'hd2b2eddf;
    stim[20] = 32'h96bc4e79;
    stim[21] = 32'hae425d81;
    stim[22] = 32'h6feea6d0;
    stim[23] = 32'h774216ba;
    stim[24] = 32'hb245e408;
    stim[25] = 32'h5a1d52f2;
    stim[26] = 32'ha123a7ae;
    stim[27] = 32'h59790015;
    stim[28] = 32'h079c3f17;
    stim[29] = 32'hd2835c47;
    stim[30] = 32'h1f5de6ad;
    stim[31] = 32'hdfc04c5f;
    stim[32] = 32'haedb8453;
    stim[33] = 32'had87d217;
    stim[34] = 32'h166a315f;
    stim[35] = 32'h5c61f084;
    stim[36] = 32'h40f7f52e;
    stim[37] = 32'ha7a7dc8d;
    stim[38] = 32'h55c86dca;
    stim[39] = 32'hdeee6f69;
    stim[40] = 32'h7e287c64;
    stim[41] = 32'h0dca2108;
    stim[42] = 32'ha96eaafe;
    stim[43] = 32'h8ae0a2bc;
    stim[44] = 32'h17bb8dcc;
    stim[45] = 32'hb7175377;
    stim[46] = 32'h718fc78a;
    stim[47] = 32'h1530f960;
    stim[48] = 32'ha8ac1453;
    stim[49] = 32'hf09c9c18;
    stim[50] = 32'hcceeb078;
    stim[51] = 32'h56094cf5;
    stim[52] = 32'h825d4354;
    stim[53] = 32'h7b28095e;
    stim[54] = 32'h9335820d;
    stim[55] = 32'h8e6740b1;
    stim[56] = 32'haf863eb9;
    stim[57] = 32'h3cea7d34;
    stim[58] = 32'h77071498;
    stim[59] = 32'h06313aa0;
    stim[60] = 32'h1f9560fc;
    stim[61] = 32'h6bacfcf9;
    stim[62] = 32'h03672ad9;
    stim[63] = 32'h4a58eeb1;
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
      expv[0] = 17'h1e270;
      expv[1] = 17'h1e34c;
      expv[2] = 17'h1a668;
      expv[3] = 17'h035bc;
      expv[4] = 17'h1a4cc;
      expv[5] = 17'h1ce5d;
      expv[6] = 17'h13ac8;
      expv[7] = 17'h0226b;
      expv[8] = 17'h09007;
      expv[9] = 17'h16c38;
      expv[10] = 17'h17aa0;
      expv[11] = 17'h00f17;
      expv[12] = 17'h0faef;
      expv[13] = 17'h111d9;
      expv[14] = 17'h11e09;
      expv[15] = 17'h12de5;
      expv[16] = 17'h1d95a;
      expv[17] = 17'h0534b;
      expv[18] = 17'h1ae16;
      expv[19] = 17'h18123;
      expv[20] = 17'h1ca6a;
      expv[21] = 17'h01787;
      expv[22] = 17'h02d7d;
      expv[23] = 17'h11bf8;
      expv[24] = 17'h12c9b;
      expv[25] = 17'h15a1e;
      expv[26] = 17'h091a3;
      expv[27] = 17'h0b31c;
      expv[28] = 17'h08d66;
      expv[29] = 17'h05d95;
      expv[30] = 17'h00c15;
      expv[31] = 17'h0583f;
      expv[32] = 17'h0665d;
      expv[33] = 17'h0ff3d;
      expv[34] = 17'h08f92;
      expv[35] = 17'h099cb;
      expv[36] = 17'h06c4b;
      expv[37] = 17'h10869;
      expv[38] = 17'h18724;
      expv[39] = 17'h09caf;
      expv[40] = 17'h1f518;
      expv[41] = 17'h05da4;
      expv[42] = 17'h0a8d9;
      expv[43] = 17'h05b39;
      expv[44] = 17'h14b0e;
      expv[45] = 17'h0151d;
      expv[46] = 17'h07233;
      expv[47] = 17'h01d21;
      expv[48] = 17'h179fe;
      expv[49] = 17'h11969;
      expv[50] = 17'h0facd;
      expv[51] = 17'h145fc;
      expv[52] = 17'h18b62;
      expv[53] = 17'h1090c;
      expv[54] = 17'h02a85;
      expv[55] = 17'h19e30;
      expv[56] = 17'h1dc7e;
      expv[57] = 17'h1743c;
      expv[58] = 17'h1173e;
      expv[59] = 17'h081a2;
      expv[60] = 17'h10122;
      expv[61] = 17'h0d14b;
      expv[62] = 17'h05c80;
      expv[63] = 17'h07213;
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
