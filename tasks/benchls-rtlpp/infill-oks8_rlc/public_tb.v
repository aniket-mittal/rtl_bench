// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  oks8_rlc dut (
    .a_i(in_vec[8:0]),
    .c_o(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h122;
    stim[1] = 9'h163;
    stim[2] = 9'h03b;
    stim[3] = 9'h1b7;
    stim[4] = 9'h09c;
    stim[5] = 9'h141;
    stim[6] = 9'h01f;
    stim[7] = 9'h094;
    stim[8] = 9'h1fb;
    stim[9] = 9'h136;
    stim[10] = 9'h02c;
    stim[11] = 9'h0fc;
    stim[12] = 9'h041;
    stim[13] = 9'h18d;
    stim[14] = 9'h1c4;
    stim[15] = 9'h152;
    stim[16] = 9'h034;
    stim[17] = 9'h10e;
    stim[18] = 9'h0a1;
    stim[19] = 9'h184;
    stim[20] = 9'h196;
    stim[21] = 9'h160;
    stim[22] = 9'h043;
    stim[23] = 9'h16a;
    stim[24] = 9'h1f9;
    stim[25] = 9'h1fe;
    stim[26] = 9'h1f9;
    stim[27] = 9'h063;
    stim[28] = 9'h14a;
    stim[29] = 9'h034;
    stim[30] = 9'h157;
    stim[31] = 9'h0f8;
    stim[32] = 9'h023;
    stim[33] = 9'h081;
    stim[34] = 9'h104;
    stim[35] = 9'h172;
    stim[36] = 9'h183;
    stim[37] = 9'h1be;
    stim[38] = 9'h16d;
    stim[39] = 9'h172;
    stim[40] = 9'h053;
    stim[41] = 9'h096;
    stim[42] = 9'h10b;
    stim[43] = 9'h0ce;
    stim[44] = 9'h0bf;
    stim[45] = 9'h03b;
    stim[46] = 9'h127;
    stim[47] = 9'h1b9;
    stim[48] = 9'h0f9;
    stim[49] = 9'h12d;
    stim[50] = 9'h0a8;
    stim[51] = 9'h1b2;
    stim[52] = 9'h19a;
    stim[53] = 9'h1a3;
    stim[54] = 9'h12b;
    stim[55] = 9'h195;
    stim[56] = 9'h0c0;
    stim[57] = 9'h02a;
    stim[58] = 9'h115;
    stim[59] = 9'h130;
    stim[60] = 9'h1d1;
    stim[61] = 9'h16a;
    stim[62] = 9'h10c;
    stim[63] = 9'h0ad;
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
      expv[0] = 9'h045;
      expv[1] = 9'h0c7;
      expv[2] = 9'h076;
      expv[3] = 9'h16f;
      expv[4] = 9'h138;
      expv[5] = 9'h083;
      expv[6] = 9'h03e;
      expv[7] = 9'h128;
      expv[8] = 9'h1f7;
      expv[9] = 9'h06d;
      expv[10] = 9'h058;
      expv[11] = 9'h1f8;
      expv[12] = 9'h082;
      expv[13] = 9'h11b;
      expv[14] = 9'h189;
      expv[15] = 9'h0a5;
      expv[16] = 9'h068;
      expv[17] = 9'h01d;
      expv[18] = 9'h142;
      expv[19] = 9'h109;
      expv[20] = 9'h12d;
      expv[21] = 9'h0c1;
      expv[22] = 9'h086;
      expv[23] = 9'h0d5;
      expv[24] = 9'h1f3;
      expv[25] = 9'h1fd;
      expv[26] = 9'h1f3;
      expv[27] = 9'h0c6;
      expv[28] = 9'h095;
      expv[29] = 9'h068;
      expv[30] = 9'h0af;
      expv[31] = 9'h1f0;
      expv[32] = 9'h046;
      expv[33] = 9'h102;
      expv[34] = 9'h009;
      expv[35] = 9'h0e5;
      expv[36] = 9'h107;
      expv[37] = 9'h17d;
      expv[38] = 9'h0db;
      expv[39] = 9'h0e5;
      expv[40] = 9'h0a6;
      expv[41] = 9'h12c;
      expv[42] = 9'h017;
      expv[43] = 9'h19c;
      expv[44] = 9'h17e;
      expv[45] = 9'h076;
      expv[46] = 9'h04f;
      expv[47] = 9'h173;
      expv[48] = 9'h1f2;
      expv[49] = 9'h05b;
      expv[50] = 9'h150;
      expv[51] = 9'h165;
      expv[52] = 9'h135;
      expv[53] = 9'h147;
      expv[54] = 9'h057;
      expv[55] = 9'h12b;
      expv[56] = 9'h180;
      expv[57] = 9'h054;
      expv[58] = 9'h02b;
      expv[59] = 9'h061;
      expv[60] = 9'h1a3;
      expv[61] = 9'h0d5;
      expv[62] = 9'h019;
      expv[63] = 9'h15a;
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
