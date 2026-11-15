// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_119730 dut (
    .clk_i(clk),
    .rst_n_i(in_vec[21:21]),
    .enb_i(in_vec[20:20]),
    .restart_flag_i(in_vec[19:19]),
    .pre_sum_flag_i(in_vec[18:18]),
    .output_flag_i(in_vec[17:17]),
    .busy_i(in_vec[16:16]),
    .dta_i(in_vec[15:8]),
    .dtb_i(in_vec[7:0]),
    .index_o(out_vec[39:32]),
    .dt_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h2523f3;
    stim[1] = 22'h3da798;
    stim[2] = 22'h15db41;
    stim[3] = 22'h1f8dc5;
    stim[4] = 22'h1dd182;
    stim[5] = 22'h122696;
    stim[6] = 22'h1e7ccf;
    stim[7] = 22'h12356a;
    stim[8] = 22'h0669f3;
    stim[9] = 22'h0039d1;
    stim[10] = 22'h18497c;
    stim[11] = 22'h03486c;
    stim[12] = 22'h14bebc;
    stim[13] = 22'h1f9a9d;
    stim[14] = 22'h156c67;
    stim[15] = 22'h1a187c;
    stim[16] = 22'h1efaa3;
    stim[17] = 22'h11b736;
    stim[18] = 22'h11483c;
    stim[19] = 22'h0f53df;
    stim[20] = 22'h1e2755;
    stim[21] = 22'h1617e9;
    stim[22] = 22'h04de4d;
    stim[23] = 22'h11134a;
    stim[24] = 22'h1a4142;
    stim[25] = 22'h13db97;
    stim[26] = 22'h35dc2f;
    stim[27] = 22'h09e6a0;
    stim[28] = 22'h05decd;
    stim[29] = 22'h12981d;
    stim[30] = 22'h098abf;
    stim[31] = 22'h18db09;
    stim[32] = 22'h02bac0;
    stim[33] = 22'h17e6f2;
    stim[34] = 22'h15da08;
    stim[35] = 22'h1683cd;
    stim[36] = 22'h09f9fa;
    stim[37] = 22'h0cb6db;
    stim[38] = 22'h1f38c4;
    stim[39] = 22'h05c186;
    stim[40] = 22'h15b67f;
    stim[41] = 22'h190c19;
    stim[42] = 22'h1f182c;
    stim[43] = 22'h1ecfbb;
    stim[44] = 22'h037b71;
    stim[45] = 22'h0baa62;
    stim[46] = 22'h1f424a;
    stim[47] = 22'h015a5d;
    stim[48] = 22'h05aedf;
    stim[49] = 22'h13348f;
    stim[50] = 22'h13e944;
    stim[51] = 22'h04f2f0;
    stim[52] = 22'h02ef5a;
    stim[53] = 22'h19afc7;
    stim[54] = 22'h16ca00;
    stim[55] = 22'h0c86f1;
    stim[56] = 22'h11b333;
    stim[57] = 22'h192ea8;
    stim[58] = 22'h043262;
    stim[59] = 22'h08c203;
    stim[60] = 22'h098c46;
    stim[61] = 22'h1b2ba9;
    stim[62] = 22'h03c601;
    stim[63] = 22'h159741;
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
      expv[1] = 40'h0100000000;
      expv[2] = 40'h0000000000;
      expv[3] = 40'h0000000000;
      expv[4] = 40'h0000000000;
      expv[5] = 40'h0000000000;
      expv[6] = 40'h0000000000;
      expv[7] = 40'h0000000000;
      expv[8] = 40'h0000000000;
      expv[9] = 40'h0000000000;
      expv[10] = 40'h0000000000;
      expv[11] = 40'h0000000000;
      expv[12] = 40'h0000000000;
      expv[13] = 40'h0000000000;
      expv[14] = 40'h0000000000;
      expv[15] = 40'h0000000000;
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
      expv[27] = 40'h0000000000;
      expv[28] = 40'h0000000000;
      expv[29] = 40'h0000000000;
      expv[30] = 40'h0000000000;
      expv[31] = 40'h0000000000;
      expv[32] = 40'h0000000000;
      expv[33] = 40'h0000000000;
      expv[34] = 40'h0000000000;
      expv[35] = 40'h0000000000;
      expv[36] = 40'h0000000000;
      expv[37] = 40'h0000000000;
      expv[38] = 40'h0000000000;
      expv[39] = 40'h0000000000;
      expv[40] = 40'h0000000000;
      expv[41] = 40'h0000000000;
      expv[42] = 40'h0000000000;
      expv[43] = 40'h0000000000;
      expv[44] = 40'h0000000000;
      expv[45] = 40'h0000000000;
      expv[46] = 40'h0000000000;
      expv[47] = 40'h0000000000;
      expv[48] = 40'h0000000000;
      expv[49] = 40'h0000000000;
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
