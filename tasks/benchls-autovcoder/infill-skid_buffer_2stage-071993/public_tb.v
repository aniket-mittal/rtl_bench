// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_071993 dut (
    .sclk(clk),
    .reset(in_vec[10:10]),
    .s_data(in_vec[9:2]),
    .s_valid(in_vec[1:1]),
    .m_ready(in_vec[0:0]),
    .s_ready(out_vec[11:11]),
    .m_data(out_vec[10:3]),
    .m_valid(out_vec[2:2]),
    .num_data_valid(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h438;
    stim[1] = 11'h789;
    stim[2] = 11'h27d;
    stim[3] = 11'h069;
    stim[4] = 11'h2ec;
    stim[5] = 11'h149;
    stim[6] = 11'h100;
    stim[7] = 11'h0c4;
    stim[8] = 11'h3ad;
    stim[9] = 11'h130;
    stim[10] = 11'h303;
    stim[11] = 11'h30c;
    stim[12] = 11'h2ca;
    stim[13] = 11'h044;
    stim[14] = 11'h3dd;
    stim[15] = 11'h17d;
    stim[16] = 11'h29d;
    stim[17] = 11'h0de;
    stim[18] = 11'h37a;
    stim[19] = 11'h006;
    stim[20] = 11'h1c0;
    stim[21] = 11'h0b2;
    stim[22] = 11'h203;
    stim[23] = 11'h1f8;
    stim[24] = 11'h0e8;
    stim[25] = 11'h243;
    stim[26] = 11'h178;
    stim[27] = 11'h142;
    stim[28] = 11'h2f7;
    stim[29] = 11'h062;
    stim[30] = 11'h7c0;
    stim[31] = 11'h084;
    stim[32] = 11'h0ad;
    stim[33] = 11'h056;
    stim[34] = 11'h081;
    stim[35] = 11'h013;
    stim[36] = 11'h0e0;
    stim[37] = 11'h1d7;
    stim[38] = 11'h3d2;
    stim[39] = 11'h02a;
    stim[40] = 11'h1b9;
    stim[41] = 11'h166;
    stim[42] = 11'h15b;
    stim[43] = 11'h1fb;
    stim[44] = 11'h1f4;
    stim[45] = 11'h2a9;
    stim[46] = 11'h0d3;
    stim[47] = 11'h0c7;
    stim[48] = 11'h06d;
    stim[49] = 11'h182;
    stim[50] = 11'h3cd;
    stim[51] = 11'h2f0;
    stim[52] = 11'h71f;
    stim[53] = 11'h18c;
    stim[54] = 11'h241;
    stim[55] = 11'h0bb;
    stim[56] = 11'h141;
    stim[57] = 11'h295;
    stim[58] = 11'h016;
    stim[59] = 11'h0e5;
    stim[60] = 11'h133;
    stim[61] = 11'h3cd;
    stim[62] = 11'h1bd;
    stim[63] = 11'h279;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'hxxx;
      expv[2] = 12'hxxx;
      expv[3] = 12'hxxx;
      expv[4] = 12'hxxx;
      expv[5] = 12'hxxx;
      expv[6] = 12'hxxx;
      expv[7] = 12'hxxx;
      expv[8] = 12'hxxx;
      expv[9] = 12'hxxx;
      expv[10] = 12'hxxx;
      expv[11] = 12'he05;
      expv[12] = 12'he05;
      expv[13] = 12'h606;
      expv[14] = 12'h606;
      expv[15] = 12'hd95;
      expv[16] = 12'hd90;
      expv[17] = 12'hd90;
      expv[18] = 12'h9bd;
      expv[19] = 12'h1be;
      expv[20] = 12'h1be;
      expv[21] = 12'h1be;
      expv[22] = 12'h1be;
      expv[23] = 12'hef5;
      expv[24] = 12'hef5;
      expv[25] = 12'hef5;
      expv[26] = 12'hc85;
      expv[27] = 12'hc85;
      expv[28] = 12'h486;
      expv[29] = 12'ha85;
      expv[30] = 12'h286;
      expv[31] = 12'h280;
      expv[32] = 12'ha80;
      expv[33] = 12'ha80;
      expv[34] = 12'h8ad;
      expv[35] = 12'h8a8;
      expv[36] = 12'h825;
      expv[37] = 12'h825;
      expv[38] = 12'hbad;
      expv[39] = 12'h3ae;
      expv[40] = 12'h3ae;
      expv[41] = 12'hfa5;
      expv[42] = 12'h7a6;
      expv[43] = 12'hacd;
      expv[44] = 12'hbf5;
      expv[45] = 12'hbf5;
      expv[46] = 12'hbf0;
      expv[47] = 12'h9a5;
      expv[48] = 12'h98d;
      expv[49] = 12'h988;
      expv[50] = 12'hb05;
      expv[51] = 12'hb00;
      expv[52] = 12'hb00;
      expv[53] = 12'h638;
      expv[54] = 12'he38;
      expv[55] = 12'he38;
      expv[56] = 12'h975;
      expv[57] = 12'h970;
      expv[58] = 12'h970;
      expv[59] = 12'h82d;
      expv[60] = 12'h828;
      expv[61] = 12'ha65;
      expv[62] = 12'ha60;
      expv[63] = 12'ha60;
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
