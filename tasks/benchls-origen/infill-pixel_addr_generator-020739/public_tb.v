// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_020739 dut (
    .CLK(clk),
    .RSTn(in_vec[12:12]),
    .start_sig(in_vec[11:11]),
    .nxt_pix_sig(in_vec[10:10]),
    .cols(in_vec[9:0]),
    .pix_done_sig(out_vec[20:20]),
    .column_addr_sig(out_vec[19:10]),
    .row_addr_sig(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h01de;
    stim[1] = 13'h0491;
    stim[2] = 13'h1251;
    stim[3] = 13'h1221;
    stim[4] = 13'h1c31;
    stim[5] = 13'h1977;
    stim[6] = 13'h1458;
    stim[7] = 13'h1ffa;
    stim[8] = 13'h19df;
    stim[9] = 13'h1508;
    stim[10] = 13'h19b5;
    stim[11] = 13'h14c7;
    stim[12] = 13'h1eb9;
    stim[13] = 13'h1491;
    stim[14] = 13'h1782;
    stim[15] = 13'h1ca1;
    stim[16] = 13'h1d6d;
    stim[17] = 13'h181f;
    stim[18] = 13'h1ddf;
    stim[19] = 13'h17b0;
    stim[20] = 13'h1ef9;
    stim[21] = 13'h1c45;
    stim[22] = 13'h1981;
    stim[23] = 13'h1e31;
    stim[24] = 13'h1a75;
    stim[25] = 13'h1bab;
    stim[26] = 13'h1889;
    stim[27] = 13'h1afc;
    stim[28] = 13'h109e;
    stim[29] = 13'h18c1;
    stim[30] = 13'h1d75;
    stim[31] = 13'h1d73;
    stim[32] = 13'h1b21;
    stim[33] = 13'h1ea7;
    stim[34] = 13'h1b6e;
    stim[35] = 13'h12df;
    stim[36] = 13'h1734;
    stim[37] = 13'h1986;
    stim[38] = 13'h1120;
    stim[39] = 13'h18c6;
    stim[40] = 13'h19e9;
    stim[41] = 13'h1947;
    stim[42] = 13'h17db;
    stim[43] = 13'h1715;
    stim[44] = 13'h1012;
    stim[45] = 13'h1694;
    stim[46] = 13'h1797;
    stim[47] = 13'h18bd;
    stim[48] = 13'h1516;
    stim[49] = 13'h1582;
    stim[50] = 13'h15c1;
    stim[51] = 13'h1a3f;
    stim[52] = 13'h1c22;
    stim[53] = 13'h1629;
    stim[54] = 13'h1a0a;
    stim[55] = 13'h1be5;
    stim[56] = 13'h13c7;
    stim[57] = 13'h1d06;
    stim[58] = 13'h164f;
    stim[59] = 13'h10fe;
    stim[60] = 13'h0bf2;
    stim[61] = 13'h1288;
    stim[62] = 13'h1d5d;
    stim[63] = 13'h1c67;
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
      expv[0] = 21'h100401;
      expv[1] = 21'h100401;
      expv[2] = 21'h100401;
      expv[3] = 21'h000401;
      expv[4] = 21'h000401;
      expv[5] = 21'h100401;
      expv[6] = 21'h000401;
      expv[7] = 21'h100801;
      expv[8] = 21'h100401;
      expv[9] = 21'h000401;
      expv[10] = 21'h100801;
      expv[11] = 21'h100401;
      expv[12] = 21'h100801;
      expv[13] = 21'h100401;
      expv[14] = 21'h100801;
      expv[15] = 21'h100c01;
      expv[16] = 21'h100401;
      expv[17] = 21'h100801;
      expv[18] = 21'h000801;
      expv[19] = 21'h100c01;
      expv[20] = 21'h101001;
      expv[21] = 21'h100401;
      expv[22] = 21'h100801;
      expv[23] = 21'h000801;
      expv[24] = 21'h100c01;
      expv[25] = 21'h000c01;
      expv[26] = 21'h000c01;
      expv[27] = 21'h000c01;
      expv[28] = 21'h000c01;
      expv[29] = 21'h000c01;
      expv[30] = 21'h100401;
      expv[31] = 21'h100801;
      expv[32] = 21'h100c01;
      expv[33] = 21'h000c01;
      expv[34] = 21'h101001;
      expv[35] = 21'h001001;
      expv[36] = 21'h001001;
      expv[37] = 21'h101401;
      expv[38] = 21'h100401;
      expv[39] = 21'h000401;
      expv[40] = 21'h100401;
      expv[41] = 21'h000401;
      expv[42] = 21'h000401;
      expv[43] = 21'h100801;
      expv[44] = 21'h100c01;
      expv[45] = 21'h000c01;
      expv[46] = 21'h101001;
      expv[47] = 21'h101401;
      expv[48] = 21'h100401;
      expv[49] = 21'h100801;
      expv[50] = 21'h100c01;
      expv[51] = 21'h101001;
      expv[52] = 21'h100401;
      expv[53] = 21'h100801;
      expv[54] = 21'h100c01;
      expv[55] = 21'h100401;
      expv[56] = 21'h000401;
      expv[57] = 21'h000401;
      expv[58] = 21'h100401;
      expv[59] = 21'h100801;
      expv[60] = 21'h100401;
      expv[61] = 21'h100401;
      expv[62] = 21'h000401;
      expv[63] = 21'h100401;
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
