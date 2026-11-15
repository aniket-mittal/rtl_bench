// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00526 dut (
    .ain(in_vec[20:5]),
    .bin(in_vec[4:0]),
    .yout(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h02c4bf;
    stim[1] = 21'h088456;
    stim[2] = 21'h01e76d;
    stim[3] = 21'h04037d;
    stim[4] = 21'h0eed67;
    stim[5] = 21'h16820e;
    stim[6] = 21'h1eb063;
    stim[7] = 21'h1a36ef;
    stim[8] = 21'h1b0014;
    stim[9] = 21'h1ab1cb;
    stim[10] = 21'h0a28e7;
    stim[11] = 21'h1956ed;
    stim[12] = 21'h0f1a18;
    stim[13] = 21'h1ea449;
    stim[14] = 21'h02d958;
    stim[15] = 21'h172a12;
    stim[16] = 21'h1dde97;
    stim[17] = 21'h024c83;
    stim[18] = 21'h04048f;
    stim[19] = 21'h0611c2;
    stim[20] = 21'h0908b9;
    stim[21] = 21'h1eaebf;
    stim[22] = 21'h1d0b4e;
    stim[23] = 21'h04fb9d;
    stim[24] = 21'h0d8e69;
    stim[25] = 21'h13f8c3;
    stim[26] = 21'h174ed4;
    stim[27] = 21'h1ada9c;
    stim[28] = 21'h0fbc7b;
    stim[29] = 21'h02b855;
    stim[30] = 21'h00856d;
    stim[31] = 21'h00da80;
    stim[32] = 21'h14a286;
    stim[33] = 21'h00464f;
    stim[34] = 21'h0e9023;
    stim[35] = 21'h14332c;
    stim[36] = 21'h13c58d;
    stim[37] = 21'h0a7dd9;
    stim[38] = 21'h0aaa03;
    stim[39] = 21'h131c0c;
    stim[40] = 21'h0a89db;
    stim[41] = 21'h1c2f95;
    stim[42] = 21'h1f3eaf;
    stim[43] = 21'h124a0d;
    stim[44] = 21'h101ee3;
    stim[45] = 21'h105bf0;
    stim[46] = 21'h0b2f64;
    stim[47] = 21'h1ab4b1;
    stim[48] = 21'h08d597;
    stim[49] = 21'h0ecb4b;
    stim[50] = 21'h05397f;
    stim[51] = 21'h11bea9;
    stim[52] = 21'h11a275;
    stim[53] = 21'h0b27d9;
    stim[54] = 21'h046588;
    stim[55] = 21'h112549;
    stim[56] = 21'h1bd896;
    stim[57] = 21'h167457;
    stim[58] = 21'h1f6903;
    stim[59] = 21'h1d976e;
    stim[60] = 21'h119a53;
    stim[61] = 21'h13f67c;
    stim[62] = 21'h1038ad;
    stim[63] = 21'h114388;
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
      expv[0] = 16'h0b12;
      expv[1] = 16'h0011;
      expv[2] = 16'h6000;
      expv[3] = 16'h0403;
      expv[4] = 16'hb580;
      expv[5] = 16'h0000;
      expv[6] = 16'hac18;
      expv[7] = 16'h8000;
      expv[8] = 16'h000d;
      expv[9] = 16'h7000;
      expv[10] = 16'ha380;
      expv[11] = 16'he000;
      expv[12] = 16'h0078;
      expv[13] = 16'h4400;
      expv[14] = 16'h0016;
      expv[15] = 16'h0002;
      expv[16] = 16'h0077;
      expv[17] = 16'h9320;
      expv[18] = 16'h0000;
      expv[19] = 16'hc238;
      expv[20] = 16'h0090;
      expv[21] = 16'h7aba;
      expv[22] = 16'h8000;
      expv[23] = 16'h04fb;
      expv[24] = 16'he600;
      expv[25] = 16'hfe30;
      expv[26] = 16'h000b;
      expv[27] = 16'h0d6d;
      expv[28] = 16'h03ef;
      expv[29] = 16'h0002;
      expv[30] = 16'h6000;
      expv[31] = 16'h06d4;
      expv[32] = 16'h4500;
      expv[33] = 16'h0000;
      expv[34] = 16'ha408;
      expv[35] = 16'h9000;
      expv[36] = 16'h8000;
      expv[37] = 16'h00a7;
      expv[38] = 16'haa80;
      expv[39] = 16'h0000;
      expv[40] = 16'h02a2;
      expv[41] = 16'h001c;
      expv[42] = 16'h8000;
      expv[43] = 16'h0000;
      expv[44] = 16'h07b8;
      expv[45] = 16'h0000;
      expv[46] = 16'h97b0;
      expv[47] = 16'h0001;
      expv[48] = 16'h0023;
      expv[49] = 16'hd000;
      expv[50] = 16'h14e5;
      expv[51] = 16'hea00;
      expv[52] = 16'h0011;
      expv[53] = 16'h00b2;
      expv[54] = 16'h2c00;
      expv[55] = 16'h5400;
      expv[56] = 16'h0037;
      expv[57] = 16'h0059;
      expv[58] = 16'hda40;
      expv[59] = 16'hc000;
      expv[60] = 16'h0004;
      expv[61] = 16'h09fb;
      expv[62] = 16'ha000;
      expv[63] = 16'h1c00;
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
