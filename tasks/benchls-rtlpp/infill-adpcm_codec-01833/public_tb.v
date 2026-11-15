// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01833 dut (
    .clk(clk),
    .reset(in_vec[16:16]),
    .x_in(in_vec[15:0]),
    .y_out(out_vec[63:60]),
    .p_out(out_vec[59:44]),
    .p_underflow(out_vec[43:43]),
    .p_overflow(out_vec[42:42]),
    .i_out(out_vec[41:34]),
    .i_underflow(out_vec[33:33]),
    .i_overflow(out_vec[32:32]),
    .err(out_vec[31:16]),
    .sz_out(out_vec[15:1]),
    .s_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1b29d;
    stim[1] = 17'h1caf2;
    stim[2] = 17'h0de78;
    stim[3] = 17'h0ea7c;
    stim[4] = 17'h01a24;
    stim[5] = 17'h019ef;
    stim[6] = 17'h04231;
    stim[7] = 17'h04b69;
    stim[8] = 17'h0f016;
    stim[9] = 17'h04190;
    stim[10] = 17'h08c4b;
    stim[11] = 17'h0842c;
    stim[12] = 17'h00b15;
    stim[13] = 17'h0433e;
    stim[14] = 17'h00b40;
    stim[15] = 17'h002df;
    stim[16] = 17'h0e193;
    stim[17] = 17'h0b1d9;
    stim[18] = 17'h0c768;
    stim[19] = 17'h060b2;
    stim[20] = 17'h0e149;
    stim[21] = 17'h005b1;
    stim[22] = 17'h09d03;
    stim[23] = 17'h05a1d;
    stim[24] = 17'h039f8;
    stim[25] = 17'h02710;
    stim[26] = 17'h0ac27;
    stim[27] = 17'h004eb;
    stim[28] = 17'h05166;
    stim[29] = 17'h0fce6;
    stim[30] = 17'h02a88;
    stim[31] = 17'h03c7a;
    stim[32] = 17'h06c3a;
    stim[33] = 17'h0a35f;
    stim[34] = 17'h0f297;
    stim[35] = 17'h0b9cd;
    stim[36] = 17'h04c22;
    stim[37] = 17'h0f638;
    stim[38] = 17'h0dcc6;
    stim[39] = 17'h0c507;
    stim[40] = 17'h09dd2;
    stim[41] = 17'h06566;
    stim[42] = 17'h05314;
    stim[43] = 17'h0c5f8;
    stim[44] = 17'h0704e;
    stim[45] = 17'h07661;
    stim[46] = 17'h12fb4;
    stim[47] = 17'h0e893;
    stim[48] = 17'h08efa;
    stim[49] = 17'h02341;
    stim[50] = 17'h076fd;
    stim[51] = 17'h0de06;
    stim[52] = 17'h01499;
    stim[53] = 17'h08ec6;
    stim[54] = 17'h04bd3;
    stim[55] = 17'h0ebf7;
    stim[56] = 17'h0cd0a;
    stim[57] = 17'h037ed;
    stim[58] = 17'h07322;
    stim[59] = 17'h04725;
    stim[60] = 17'h0de88;
    stim[61] = 17'h0bd80;
    stim[62] = 17'h07668;
    stim[63] = 17'h128b8;
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
      expv[0] = 64'h7000000000000000;
      expv[1] = 64'h7000000000000000;
      expv[2] = 64'h7000000000000000;
      expv[3] = 64'hf000002000000021;
      expv[4] = 64'hfffe2040de960045;
      expv[5] = 64'h7ffa3060ead90092;
      expv[6] = 64'h7002b08019f9013a;
      expv[7] = 64'h701500a0189f02a2;
      expv[8] = 64'h703c70c03e6a05a8;
      expv[9] = 64'hf09140e042550c21;
      expv[10] = 64'h7fdb6100f26019fe;
      expv[11] = 64'hf16121202b7e37b9;
      expv[12] = 64'hee1d6140aa757773;
      expv[13] = 64'h580ca9590362d39c;
      expv[14] = 64'h680009618b15fffe;
      expv[15] = 64'h48000961c33efffe;
      expv[16] = 64'h480009618b40fffe;
      expv[17] = 64'h3800016082dffffe;
      expv[18] = 64'haeffd15cf196e8c5;
      expv[19] = 64'h1a7401580a99d39c;
      expv[20] = 64'h6ceec955f87cc05e;
      expv[21] = 64'h38000160e0b2fffe;
      expv[22] = 64'h0effd15cf14ce8c4;
      expv[23] = 64'hbfe891580728d39d;
      expv[24] = 64'h7a1f6955fb0dc05e;
      expv[25] = 64'h58000961da1dfffe;
      expv[26] = 64'h58000961b9f8fffe;
      expv[27] = 64'h18000160a710fffe;
      expv[28] = 64'h2affe15cfc29e8c4;
      expv[29] = 64'h3f8bb1580c30d39c;
      expv[30] = 64'hb554e154fc18c05f;
      expv[31] = 64'h10127150fbbfaee2;
      expv[32] = 64'h121f114c08979efc;
      expv[33] = 64'h23fbf148fcbb9088;
      expv[34] = 64'hf6ce9145ff518365;
      expv[35] = 64'h0f1bc160b1a3fffe;
      expv[36] = 64'ha01bb15cf0dce8c5;
      expv[37] = 64'h5b8fe95900cfd39c;
      expv[38] = 64'h38000160cc22fffe;
      expv[39] = 64'h8effd15c063be8c5;
      expv[40] = 64'h9e171158fb55d39d;
      expv[41] = 64'h9b9c51540b42c05f;
      expv[42] = 64'h795b5951081daee2;
      expv[43] = 64'h68000961e566fffe;
      expv[44] = 64'h28000160d314fffe;
      expv[45] = 64'h5cffe95df5fae8c4;
      expv[46] = 64'h7000000000000000;
      expv[47] = 64'h7000000000000000;
      expv[48] = 64'hf000002000000021;
      expv[49] = 64'hfffe2040e8b10045;
      expv[50] = 64'h7ffa30608f570092;
      expv[51] = 64'h7002b0802316013a;
      expv[52] = 64'hf01500a075ad02a3;
      expv[53] = 64'h7fed90c0df2d05a8;
      expv[54] = 64'hf04260e010730c21;
      expv[55] = 64'h7f8c810095fe19fe;
      expv[56] = 64'hd11241203aaf37b9;
      expv[57] = 64'haead613001215195;
      expv[58] = 64'h7d15812cfbb24a2a;
      expv[59] = 64'h416de14c210f9efc;
      expv[60] = 64'h9704b15402d7c05f;
      expv[61] = 64'hd4c3b150faeaaee3;
      expv[62] = 64'h8d4001600a88ffff;
      expv[63] = 64'h7000000000000000;
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
