// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02769 dut (
    .pixel_clk_i(clk),
    .pixel_x_i(in_vec[24:13]),
    .pixel_y_i(in_vec[12:1]),
    .pixel_valid_i(in_vec[0:0]),
    .led_strip_address_o(out_vec[10:1]),
    .led_strip_address_valid_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h17970d8;
    stim[1] = 25'h16aa83f;
    stim[2] = 25'h15de5bc;
    stim[3] = 25'h1d3d673;
    stim[4] = 25'h10fe71c;
    stim[5] = 25'h11fdb86;
    stim[6] = 25'h0504ac0;
    stim[7] = 25'h04f6395;
    stim[8] = 25'h0053da8;
    stim[9] = 25'h1cdc9b8;
    stim[10] = 25'h133c1fc;
    stim[11] = 25'h15f062b;
    stim[12] = 25'h1314c1d;
    stim[13] = 25'h0980a86;
    stim[14] = 25'h144c750;
    stim[15] = 25'h02aec6d;
    stim[16] = 25'h11ab2af;
    stim[17] = 25'h098d82b;
    stim[18] = 25'h1717162;
    stim[19] = 25'h041bc73;
    stim[20] = 25'h14f6e83;
    stim[21] = 25'h1556145;
    stim[22] = 25'h18b6083;
    stim[23] = 25'h0e3ebdc;
    stim[24] = 25'h11bfd8b;
    stim[25] = 25'h122ebf6;
    stim[26] = 25'h15e6ceb;
    stim[27] = 25'h093dc2e;
    stim[28] = 25'h16802b0;
    stim[29] = 25'h1f809e7;
    stim[30] = 25'h1733b19;
    stim[31] = 25'h19f02cd;
    stim[32] = 25'h0702369;
    stim[33] = 25'h01ebc66;
    stim[34] = 25'h0bb80f2;
    stim[35] = 25'h0a6519b;
    stim[36] = 25'h1ea2d4f;
    stim[37] = 25'h17d135e;
    stim[38] = 25'h18c636d;
    stim[39] = 25'h17da442;
    stim[40] = 25'h046d07c;
    stim[41] = 25'h0ddfe4a;
    stim[42] = 25'h174fd98;
    stim[43] = 25'h0799806;
    stim[44] = 25'h0814bcf;
    stim[45] = 25'h148ba2f;
    stim[46] = 25'h13cd16f;
    stim[47] = 25'h0226973;
    stim[48] = 25'h1dc139d;
    stim[49] = 25'h0a137a8;
    stim[50] = 25'h1791a76;
    stim[51] = 25'h004bc6c;
    stim[52] = 25'h10d6062;
    stim[53] = 25'h0f55645;
    stim[54] = 25'h1f20ed4;
    stim[55] = 25'h014acf1;
    stim[56] = 25'h0be1a84;
    stim[57] = 25'h0b05103;
    stim[58] = 25'h1f7f59a;
    stim[59] = 25'h04db17c;
    stim[60] = 25'h10a713c;
    stim[61] = 25'h1b66586;
    stim[62] = 25'h121ddab;
    stim[63] = 25'h0fbfe3e;
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
      expv[0] = 11'h0b4;
      expv[1] = 11'h01a;
      expv[2] = 11'h598;
      expv[3] = 11'h64e;
      expv[4] = 11'h6f8;
      expv[5] = 11'h362;
      expv[6] = 11'h29c;
      expv[7] = 11'h370;
      expv[8] = 11'h584;
      expv[9] = 11'h194;
      expv[10] = 11'h1d8;
      expv[11] = 11'h606;
      expv[12] = 11'h3f8;
      expv[13] = 11'h262;
      expv[14] = 11'h72c;
      expv[15] = 11'h448;
      expv[16] = 11'h28a;
      expv[17] = 11'h006;
      expv[18] = 11'h13e;
      expv[19] = 11'h44e;
      expv[20] = 11'h65e;
      expv[21] = 11'h120;
      expv[22] = 11'h05e;
      expv[23] = 11'h3b8;
      expv[24] = 11'h566;
      expv[25] = 11'h3d2;
      expv[26] = 11'h4c6;
      expv[27] = 11'h40a;
      expv[28] = 11'h28c;
      expv[29] = 11'h1c2;
      expv[30] = 11'h2f4;
      expv[31] = 11'h2a8;
      expv[32] = 11'h344;
      expv[33] = 11'h442;
      expv[34] = 11'h0ce;
      expv[35] = 11'h176;
      expv[36] = 11'h52a;
      expv[37] = 11'h33a;
      expv[38] = 11'h348;
      expv[39] = 11'h41e;
      expv[40] = 11'h058;
      expv[41] = 11'h626;
      expv[42] = 11'h574;
      expv[43] = 11'h7e2;
      expv[44] = 11'h3aa;
      expv[45] = 11'h20a;
      expv[46] = 11'h14a;
      expv[47] = 11'h14e;
      expv[48] = 11'h378;
      expv[49] = 11'h784;
      expv[50] = 11'h252;
      expv[51] = 11'h448;
      expv[52] = 11'h03e;
      expv[53] = 11'h620;
      expv[54] = 11'h6b0;
      expv[55] = 11'h4cc;
      expv[56] = 11'h260;
      expv[57] = 11'h0de;
      expv[58] = 11'h576;
      expv[59] = 11'h158;
      expv[60] = 11'h118;
      expv[61] = 11'h562;
      expv[62] = 11'h586;
      expv[63] = 11'h61a;
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
