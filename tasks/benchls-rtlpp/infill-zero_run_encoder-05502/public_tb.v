// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05502 dut (
    .clock(clk),
    .reset(in_vec[10:10]),
    .i_d(in_vec[9:3]),
    .state(in_vec[2:1]),
    .fire(in_vec[0:0]),
    .o_d(out_vec[10:3]),
    .f_start_i_eq_0(out_vec[2:2]),
    .f_zeros_i_eq_0(out_vec[1:1]),
    .f_zeros_cnt_eq_127(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h6fd;
    stim[1] = 11'h7af;
    stim[2] = 11'h0e4;
    stim[3] = 11'h072;
    stim[4] = 11'h0e7;
    stim[5] = 11'h215;
    stim[6] = 11'h25f;
    stim[7] = 11'h28f;
    stim[8] = 11'h063;
    stim[9] = 11'h26a;
    stim[10] = 11'h142;
    stim[11] = 11'h3b2;
    stim[12] = 11'h198;
    stim[13] = 11'h092;
    stim[14] = 11'h2ea;
    stim[15] = 11'h60d;
    stim[16] = 11'h1d6;
    stim[17] = 11'h023;
    stim[18] = 11'h1a7;
    stim[19] = 11'h09a;
    stim[20] = 11'h25a;
    stim[21] = 11'h355;
    stim[22] = 11'h3e5;
    stim[23] = 11'h2dd;
    stim[24] = 11'h36b;
    stim[25] = 11'h234;
    stim[26] = 11'h01e;
    stim[27] = 11'h228;
    stim[28] = 11'h33a;
    stim[29] = 11'h22c;
    stim[30] = 11'h0ce;
    stim[31] = 11'h3e5;
    stim[32] = 11'h15e;
    stim[33] = 11'h0b0;
    stim[34] = 11'h3a3;
    stim[35] = 11'h1b3;
    stim[36] = 11'h2bc;
    stim[37] = 11'h095;
    stim[38] = 11'h207;
    stim[39] = 11'h2b7;
    stim[40] = 11'h328;
    stim[41] = 11'h35b;
    stim[42] = 11'h004;
    stim[43] = 11'h277;
    stim[44] = 11'h309;
    stim[45] = 11'h041;
    stim[46] = 11'h6d1;
    stim[47] = 11'h2ee;
    stim[48] = 11'h244;
    stim[49] = 11'h1f1;
    stim[50] = 11'h2eb;
    stim[51] = 11'h0c2;
    stim[52] = 11'h01d;
    stim[53] = 11'h0c4;
    stim[54] = 11'h380;
    stim[55] = 11'h107;
    stim[56] = 11'h33f;
    stim[57] = 11'h2f4;
    stim[58] = 11'h081;
    stim[59] = 11'h17d;
    stim[60] = 11'h18f;
    stim[61] = 11'h272;
    stim[62] = 11'h24c;
    stim[63] = 11'h016;
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
      expv[0] = 11'hxxx;
      expv[1] = 11'hxxx;
      expv[2] = 11'hxxx;
      expv[3] = 11'hxxx;
      expv[4] = 11'hxxx;
      expv[5] = 11'hxxx;
      expv[6] = 11'hxxx;
      expv[7] = 11'hxxx;
      expv[8] = 11'hxxx;
      expv[9] = 11'hxxx;
      expv[10] = 11'hxxx;
      expv[11] = 11'hxxx;
      expv[12] = 11'hxxx;
      expv[13] = 11'hxxx;
      expv[14] = 11'hxxx;
      expv[15] = 11'hxxx;
      expv[16] = 11'hxxx;
      expv[17] = 11'hxxx;
      expv[18] = 11'hxxx;
      expv[19] = 11'hxxx;
      expv[20] = 11'hxxx;
      expv[21] = 11'hxxx;
      expv[22] = 11'hxxx;
      expv[23] = 11'hxxx;
      expv[24] = 11'hxxx;
      expv[25] = 11'hxxx;
      expv[26] = 11'hxxx;
      expv[27] = 11'hxxx;
      expv[28] = 11'hxxx;
      expv[29] = 11'hxxx;
      expv[30] = 11'hxxx;
      expv[31] = 11'hxxx;
      expv[32] = 11'hxxx;
      expv[33] = 11'hxxx;
      expv[34] = 11'hxxx;
      expv[35] = 11'hxxx;
      expv[36] = 11'hxxx;
      expv[37] = 11'hxxx;
      expv[38] = 11'hxxx;
      expv[39] = 11'hxxx;
      expv[40] = 11'hxxx;
      expv[41] = 11'hxxx;
      expv[42] = 11'hxxx;
      expv[43] = 11'hxxx;
      expv[44] = 11'h308;
      expv[45] = 11'h040;
      expv[46] = 11'h2d0;
      expv[47] = 11'hxxx;
      expv[48] = 11'hxxx;
      expv[49] = 11'h1f0;
      expv[50] = 11'hxxx;
      expv[51] = 11'hxxx;
      expv[52] = 11'hxxx;
      expv[53] = 11'hxxx;
      expv[54] = 11'hxxx;
      expv[55] = 11'hxxx;
      expv[56] = 11'hxxx;
      expv[57] = 11'hxxx;
      expv[58] = 11'h080;
      expv[59] = 11'hxxx;
      expv[60] = 11'hxxx;
      expv[61] = 11'hxxx;
      expv[62] = 11'hxxx;
      expv[63] = 11'hxxx;
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
