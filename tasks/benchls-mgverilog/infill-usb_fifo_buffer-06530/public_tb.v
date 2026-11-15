// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06530 dut (
    .ifclk(clk),
    .fifoadr(in_vec[12:11]),
    .rd(in_vec[10:10]),
    .data_in(in_vec[9:2]),
    .data_wr(in_vec[1:1]),
    .data_commit(in_vec[0:0]),
    .data(out_vec[9:2]),
    .empty(out_vec[1:1]),
    .send_done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h1767;
    stim[1] = 13'h0312;
    stim[2] = 13'h199b;
    stim[3] = 13'h1262;
    stim[4] = 13'h1116;
    stim[5] = 13'h1bed;
    stim[6] = 13'h1b4d;
    stim[7] = 13'h0f38;
    stim[8] = 13'h19e7;
    stim[9] = 13'h1f6b;
    stim[10] = 13'h1845;
    stim[11] = 13'h13f6;
    stim[12] = 13'h1bfc;
    stim[13] = 13'h1593;
    stim[14] = 13'h097b;
    stim[15] = 13'h063a;
    stim[16] = 13'h05ac;
    stim[17] = 13'h057b;
    stim[18] = 13'h028c;
    stim[19] = 13'h0c99;
    stim[20] = 13'h1613;
    stim[21] = 13'h08fb;
    stim[22] = 13'h0ed3;
    stim[23] = 13'h1ce1;
    stim[24] = 13'h11e1;
    stim[25] = 13'h09f3;
    stim[26] = 13'h0608;
    stim[27] = 13'h1b86;
    stim[28] = 13'h0a6f;
    stim[29] = 13'h1a0f;
    stim[30] = 13'h0e11;
    stim[31] = 13'h0857;
    stim[32] = 13'h1191;
    stim[33] = 13'h1c06;
    stim[34] = 13'h0dd3;
    stim[35] = 13'h1005;
    stim[36] = 13'h01e1;
    stim[37] = 13'h1cb4;
    stim[38] = 13'h0811;
    stim[39] = 13'h1ce0;
    stim[40] = 13'h1179;
    stim[41] = 13'h065e;
    stim[42] = 13'h0393;
    stim[43] = 13'h0f1a;
    stim[44] = 13'h16c8;
    stim[45] = 13'h1403;
    stim[46] = 13'h1c88;
    stim[47] = 13'h1726;
    stim[48] = 13'h1f3b;
    stim[49] = 13'h10d1;
    stim[50] = 13'h00ec;
    stim[51] = 13'h17fa;
    stim[52] = 13'h1328;
    stim[53] = 13'h0720;
    stim[54] = 13'h1175;
    stim[55] = 13'h1ac6;
    stim[56] = 13'h1d9e;
    stim[57] = 13'h0a16;
    stim[58] = 13'h1126;
    stim[59] = 13'h0120;
    stim[60] = 13'h1f6b;
    stim[61] = 13'h13fb;
    stim[62] = 13'h11ea;
    stim[63] = 13'h0ad3;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'hxxx;
      expv[2] = 10'hxxx;
      expv[3] = 10'h312;
      expv[4] = 10'h262;
      expv[5] = 10'h262;
      expv[6] = 10'h260;
      expv[7] = 10'hxxx;
      expv[8] = 10'hxxx;
      expv[9] = 10'hxxx;
      expv[10] = 10'hxxx;
      expv[11] = 10'hxxx;
      expv[12] = 10'hxxx;
      expv[13] = 10'hxxx;
      expv[14] = 10'h3f6;
      expv[15] = 10'hxxx;
      expv[16] = 10'hxxx;
      expv[17] = 10'hxxx;
      expv[18] = 10'h23a;
      expv[19] = 10'h23a;
      expv[20] = 10'hxxx;
      expv[21] = 10'hxxx;
      expv[22] = 10'hxxx;
      expv[23] = 10'hxxx;
      expv[24] = 10'hxxx;
      expv[25] = 10'hxxx;
      expv[26] = 10'hxxx;
      expv[27] = 10'hxxx;
      expv[28] = 10'hxxx;
      expv[29] = 10'h386;
      expv[30] = 10'hxxx;
      expv[31] = 10'hxxx;
      expv[32] = 10'hxxx;
      expv[33] = 10'hxxx;
      expv[34] = 10'hxxx;
      expv[35] = 10'h006;
      expv[36] = 10'hxxx;
      expv[37] = 10'hxxx;
      expv[38] = 10'hxxx;
      expv[39] = 10'hxxx;
      expv[40] = 10'hxxx;
      expv[41] = 10'hxxx;
      expv[42] = 10'hxxx;
      expv[43] = 10'h25e;
      expv[44] = 10'h31a;
      expv[45] = 10'h393;
      expv[46] = 10'h31a;
      expv[47] = 10'h31a;
      expv[48] = 10'h003;
      expv[49] = 10'hxxx;
      expv[50] = 10'hxxx;
      expv[51] = 10'hxxx;
      expv[52] = 10'hxxx;
      expv[53] = 10'hxxx;
      expv[54] = 10'hxxx;
      expv[55] = 10'h3fa;
      expv[56] = 10'h2c6;
      expv[57] = 10'h2c6;
      expv[58] = 10'h2c6;
      expv[59] = 10'h2c6;
      expv[60] = 10'h2c6;
      expv[61] = 10'h2c4;
      expv[62] = 10'hxxx;
      expv[63] = 10'hxxx;
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
