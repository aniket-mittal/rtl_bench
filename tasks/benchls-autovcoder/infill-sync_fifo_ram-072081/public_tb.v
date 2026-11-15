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

  autovcoder_072081 dut (
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
    stim[0] = 38'h36db76f8bf;
    stim[1] = 38'h28d33af2c2;
    stim[2] = 38'h092a3de64a;
    stim[3] = 38'h1d050118c3;
    stim[4] = 38'h115ee19837;
    stim[5] = 38'h1c0687d9ca;
    stim[6] = 38'h04d9402fd8;
    stim[7] = 38'h0b48b387b7;
    stim[8] = 38'h198d5310be;
    stim[9] = 38'h0bce8d901d;
    stim[10] = 38'h19640da335;
    stim[11] = 38'h1bb61c6160;
    stim[12] = 38'h0e6b57e35f;
    stim[13] = 38'h13ec7af532;
    stim[14] = 38'h152cc092b4;
    stim[15] = 38'h01b0f50a0b;
    stim[16] = 38'h06fb3166e4;
    stim[17] = 38'h0da63c3c57;
    stim[18] = 38'h17c8b0ce4d;
    stim[19] = 38'h193756c6f1;
    stim[20] = 38'h168498c947;
    stim[21] = 38'h120f95eafb;
    stim[22] = 38'h1b1c61b138;
    stim[23] = 38'h1504b39598;
    stim[24] = 38'h0b64f3ae31;
    stim[25] = 38'h191adc3b7e;
    stim[26] = 38'h07404b911d;
    stim[27] = 38'h0255af72d6;
    stim[28] = 38'h1ed32e1601;
    stim[29] = 38'h0eb20ff1fb;
    stim[30] = 38'h036fff08b3;
    stim[31] = 38'h1f6d57a11c;
    stim[32] = 38'h1d909396fb;
    stim[33] = 38'h1e186fb071;
    stim[34] = 38'h1fbaf61370;
    stim[35] = 38'h0426fc6866;
    stim[36] = 38'h0b7cabd4d2;
    stim[37] = 38'h0f7f15eb44;
    stim[38] = 38'h397eb44d67;
    stim[39] = 38'h0c9d8a14fe;
    stim[40] = 38'h198d513110;
    stim[41] = 38'h0f4a70b658;
    stim[42] = 38'h1785d8b11d;
    stim[43] = 38'h05d024f02e;
    stim[44] = 38'h086871a8e2;
    stim[45] = 38'h10453ce7ef;
    stim[46] = 38'h04127e5bb0;
    stim[47] = 38'h1b60ba3826;
    stim[48] = 38'h0f088ff52f;
    stim[49] = 38'h08cec31946;
    stim[50] = 38'h0cd263f881;
    stim[51] = 38'h11ba3a5d60;
    stim[52] = 38'h118efa23f9;
    stim[53] = 38'h0a56307287;
    stim[54] = 38'h086f9ddf40;
    stim[55] = 38'h134e41a690;
    stim[56] = 38'h074fc5b597;
    stim[57] = 38'h2fba01144c;
    stim[58] = 38'h17c90a2210;
    stim[59] = 38'h0e53674609;
    stim[60] = 38'h060e6ed193;
    stim[61] = 38'h173f8f7f45;
    stim[62] = 38'h2076e5a560;
    stim[63] = 38'h107af6872f;
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
      expv[5] = 34'h341404630;
      expv[6] = 34'h341404630;
      expv[7] = 34'h341404630;
      expv[8] = 34'h341404630;
      expv[9] = 34'h341404630;
      expv[10] = 34'h341404630;
      expv[11] = 34'h341404630;
      expv[12] = 34'h341404630;
      expv[13] = 34'h341404630;
      expv[14] = 34'h341404630;
      expv[15] = 34'h341404630;
      expv[16] = 34'h341404630;
      expv[17] = 34'h341404630;
      expv[18] = 34'h341404630;
      expv[19] = 34'h341404630;
      expv[20] = 34'h341404630;
      expv[21] = 34'h301a1f672;
      expv[22] = 34'h201a1f672;
      expv[23] = 34'h201a1f672;
      expv[24] = 34'h201a1f672;
      expv[25] = 34'h201a1f672;
      expv[26] = 34'h201a1f672;
      expv[27] = 34'h201a1f672;
      expv[28] = 34'h201a1f672;
      expv[29] = 34'h201a1f672;
      expv[30] = 34'h201a1f672;
      expv[31] = 34'h201a1f672;
      expv[32] = 34'h201a1f672;
      expv[33] = 34'h3b4cb8580;
      expv[34] = 34'h3b4cb8580;
      expv[35] = 34'h3b4cb8580;
      expv[36] = 34'h3b4cb8580;
      expv[37] = 34'h3b4cb8580;
      expv[38] = 34'h3b4cb8580;
      expv[39] = 34'h200000000;
      expv[40] = 34'h200000000;
      expv[41] = 34'h200000000;
      expv[42] = 34'h200000000;
      expv[43] = 34'h200000000;
      expv[44] = 34'h200000000;
      expv[45] = 34'h200000000;
      expv[46] = 34'h200000000;
      expv[47] = 34'h200000000;
      expv[48] = 34'h200000000;
      expv[49] = 34'h200000000;
      expv[50] = 34'h200000000;
      expv[51] = 34'h200000000;
      expv[52] = 34'h200000000;
      expv[53] = 34'h200000000;
      expv[54] = 34'h200000000;
      expv[55] = 34'h200000000;
      expv[56] = 34'h200000000;
      expv[57] = 34'h200000000;
      expv[58] = 34'h200000000;
      expv[59] = 34'h200000000;
      expv[60] = 34'h200000000;
      expv[61] = 34'h200000000;
      expv[62] = 34'h200000000;
      expv[63] = 34'h200000000;
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
