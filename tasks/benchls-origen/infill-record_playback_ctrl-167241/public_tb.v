// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_167241 dut (
    .Sys_CLK(clk),
    .Sys_RST(in_vec[9:9]),
    .Recording(in_vec[8:8]),
    .Key_In(in_vec[7:7]),
    .Length(in_vec[6:2]),
    .Light(in_vec[1:0]),
    .Index(out_vec[12:8]),
    .opList(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h30a;
    stim[1] = 10'h3bd;
    stim[2] = 10'h140;
    stim[3] = 10'h132;
    stim[4] = 10'h100;
    stim[5] = 10'h00f;
    stim[6] = 10'h070;
    stim[7] = 10'h08b;
    stim[8] = 10'h169;
    stim[9] = 10'h0a3;
    stim[10] = 10'h0bc;
    stim[11] = 10'h0f7;
    stim[12] = 10'h1b4;
    stim[13] = 10'h070;
    stim[14] = 10'h18b;
    stim[15] = 10'h06b;
    stim[16] = 10'h03a;
    stim[17] = 10'h08c;
    stim[18] = 10'h13e;
    stim[19] = 10'h09d;
    stim[20] = 10'h0c3;
    stim[21] = 10'h0ae;
    stim[22] = 10'h0bd;
    stim[23] = 10'h1bf;
    stim[24] = 10'h023;
    stim[25] = 10'h139;
    stim[26] = 10'h18f;
    stim[27] = 10'h0a0;
    stim[28] = 10'h07d;
    stim[29] = 10'h1c2;
    stim[30] = 10'h18b;
    stim[31] = 10'h05f;
    stim[32] = 10'h0c4;
    stim[33] = 10'h176;
    stim[34] = 10'h144;
    stim[35] = 10'h076;
    stim[36] = 10'h00b;
    stim[37] = 10'h093;
    stim[38] = 10'h030;
    stim[39] = 10'h105;
    stim[40] = 10'h1b0;
    stim[41] = 10'h17d;
    stim[42] = 10'h06c;
    stim[43] = 10'h1a1;
    stim[44] = 10'h02c;
    stim[45] = 10'h12f;
    stim[46] = 10'h1b9;
    stim[47] = 10'h159;
    stim[48] = 10'h07f;
    stim[49] = 10'h1f7;
    stim[50] = 10'h1c9;
    stim[51] = 10'h000;
    stim[52] = 10'h0f6;
    stim[53] = 10'h124;
    stim[54] = 10'h02a;
    stim[55] = 10'h0b4;
    stim[56] = 10'h1b9;
    stim[57] = 10'h120;
    stim[58] = 10'h129;
    stim[59] = 10'h1f7;
    stim[60] = 10'h0cd;
    stim[61] = 10'h159;
    stim[62] = 10'h1c0;
    stim[63] = 10'h093;
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
      expv[0] = 13'h0000;
      expv[1] = 13'h0000;
      expv[2] = 13'h0000;
      expv[3] = 13'h0000;
      expv[4] = 13'h0000;
      expv[5] = 13'h0000;
      expv[6] = 13'h0000;
      expv[7] = 13'h0000;
      expv[8] = 13'h0000;
      expv[9] = 13'h0000;
      expv[10] = 13'h0000;
      expv[11] = 13'h0000;
      expv[12] = 13'h0000;
      expv[13] = 13'h0000;
      expv[14] = 13'h0000;
      expv[15] = 13'h0000;
      expv[16] = 13'h0000;
      expv[17] = 13'h0000;
      expv[18] = 13'h0000;
      expv[19] = 13'h0000;
      expv[20] = 13'h0000;
      expv[21] = 13'h0000;
      expv[22] = 13'h0000;
      expv[23] = 13'h0000;
      expv[24] = 13'h0000;
      expv[25] = 13'h0000;
      expv[26] = 13'h0000;
      expv[27] = 13'h0000;
      expv[28] = 13'h0000;
      expv[29] = 13'h0000;
      expv[30] = 13'h0000;
      expv[31] = 13'h0000;
      expv[32] = 13'h0000;
      expv[33] = 13'h0000;
      expv[34] = 13'h0000;
      expv[35] = 13'h0000;
      expv[36] = 13'h0000;
      expv[37] = 13'h0000;
      expv[38] = 13'h0000;
      expv[39] = 13'h0000;
      expv[40] = 13'h0000;
      expv[41] = 13'h0000;
      expv[42] = 13'h0000;
      expv[43] = 13'h0000;
      expv[44] = 13'h0000;
      expv[45] = 13'h0000;
      expv[46] = 13'h0000;
      expv[47] = 13'h0000;
      expv[48] = 13'h0000;
      expv[49] = 13'h0000;
      expv[50] = 13'h0000;
      expv[51] = 13'h0000;
      expv[52] = 13'h0000;
      expv[53] = 13'h0000;
      expv[54] = 13'h0000;
      expv[55] = 13'h0000;
      expv[56] = 13'h0000;
      expv[57] = 13'h0000;
      expv[58] = 13'h0000;
      expv[59] = 13'h0000;
      expv[60] = 13'h0000;
      expv[61] = 13'h0000;
      expv[62] = 13'h0000;
      expv[63] = 13'h0000;
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
