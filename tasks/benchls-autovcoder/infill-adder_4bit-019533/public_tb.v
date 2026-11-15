// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_019533 dut (
    .a(in_vec[8:5]),
    .b(in_vec[4:1]),
    .cin(in_vec[0:0]),
    .sum(out_vec[4:1]),
    .cout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h032;
    stim[1] = 9'h0c2;
    stim[2] = 9'h147;
    stim[3] = 9'h1bf;
    stim[4] = 9'h11f;
    stim[5] = 9'h0da;
    stim[6] = 9'h13e;
    stim[7] = 9'h0d3;
    stim[8] = 9'h027;
    stim[9] = 9'h0fa;
    stim[10] = 9'h0cd;
    stim[11] = 9'h1ae;
    stim[12] = 9'h189;
    stim[13] = 9'h012;
    stim[14] = 9'h030;
    stim[15] = 9'h0f3;
    stim[16] = 9'h1ee;
    stim[17] = 9'h1ce;
    stim[18] = 9'h1b8;
    stim[19] = 9'h1e3;
    stim[20] = 9'h0e4;
    stim[21] = 9'h17e;
    stim[22] = 9'h080;
    stim[23] = 9'h1bd;
    stim[24] = 9'h146;
    stim[25] = 9'h12b;
    stim[26] = 9'h094;
    stim[27] = 9'h0a5;
    stim[28] = 9'h09d;
    stim[29] = 9'h145;
    stim[30] = 9'h0ab;
    stim[31] = 9'h0d4;
    stim[32] = 9'h19a;
    stim[33] = 9'h07c;
    stim[34] = 9'h0e8;
    stim[35] = 9'h0df;
    stim[36] = 9'h047;
    stim[37] = 9'h105;
    stim[38] = 9'h146;
    stim[39] = 9'h09b;
    stim[40] = 9'h13f;
    stim[41] = 9'h05a;
    stim[42] = 9'h14a;
    stim[43] = 9'h086;
    stim[44] = 9'h1de;
    stim[45] = 9'h084;
    stim[46] = 9'h193;
    stim[47] = 9'h0a7;
    stim[48] = 9'h0ac;
    stim[49] = 9'h062;
    stim[50] = 9'h0aa;
    stim[51] = 9'h0ef;
    stim[52] = 9'h0ff;
    stim[53] = 9'h1a0;
    stim[54] = 9'h0b3;
    stim[55] = 9'h1bd;
    stim[56] = 9'h03f;
    stim[57] = 9'h111;
    stim[58] = 9'h038;
    stim[59] = 9'h18e;
    stim[60] = 9'h0ce;
    stim[61] = 9'h100;
    stim[62] = 9'h0a8;
    stim[63] = 9'h1d3;
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
      expv[0] = 5'h14;
      expv[1] = 5'h0e;
      expv[2] = 5'h1c;
      expv[3] = 5'h1b;
      expv[4] = 5'h11;
      expv[5] = 5'h07;
      expv[6] = 5'h11;
      expv[7] = 5'h01;
      expv[8] = 5'h0a;
      expv[9] = 5'h09;
      expv[10] = 5'h1a;
      expv[11] = 5'h09;
      expv[12] = 5'h03;
      expv[13] = 5'h12;
      expv[14] = 5'h12;
      expv[15] = 5'h03;
      expv[16] = 5'h0d;
      expv[17] = 5'h0b;
      expv[18] = 5'h13;
      expv[19] = 5'h03;
      expv[20] = 5'h12;
      expv[21] = 5'h15;
      expv[22] = 5'h08;
      expv[23] = 5'h19;
      expv[24] = 5'h1a;
      expv[25] = 5'h1e;
      expv[26] = 5'h1c;
      expv[27] = 5'h10;
      expv[28] = 5'h07;
      expv[29] = 5'h1a;
      expv[30] = 5'h16;
      expv[31] = 5'h01;
      expv[32] = 5'h13;
      expv[33] = 5'h03;
      expv[34] = 5'h16;
      expv[35] = 5'h0d;
      expv[36] = 5'h0c;
      expv[37] = 5'h16;
      expv[38] = 5'h1a;
      expv[39] = 5'h05;
      expv[40] = 5'h13;
      expv[41] = 5'h1e;
      expv[42] = 5'h1e;
      expv[43] = 5'h0e;
      expv[44] = 5'h1b;
      expv[45] = 5'h0c;
      expv[46] = 5'h0d;
      expv[47] = 5'h12;
      expv[48] = 5'h16;
      expv[49] = 5'h08;
      expv[50] = 5'h14;
      expv[51] = 5'h1e;
      expv[52] = 5'h0f;
      expv[53] = 5'h1a;
      expv[54] = 5'h1e;
      expv[55] = 5'h19;
      expv[56] = 5'h03;
      expv[57] = 5'h03;
      expv[58] = 5'h1a;
      expv[59] = 5'h07;
      expv[60] = 5'h1a;
      expv[61] = 5'h10;
      expv[62] = 5'h12;
      expv[63] = 5'h11;
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
