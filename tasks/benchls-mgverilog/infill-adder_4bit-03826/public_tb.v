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

  mg_03826 dut (
    .a(in_vec[8:5]),
    .b(in_vec[4:1]),
    .c_in(in_vec[0:0]),
    .sum(out_vec[4:1]),
    .c_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h024;
    stim[1] = 9'h124;
    stim[2] = 9'h069;
    stim[3] = 9'h1fd;
    stim[4] = 9'h0af;
    stim[5] = 9'h1e0;
    stim[6] = 9'h05f;
    stim[7] = 9'h043;
    stim[8] = 9'h016;
    stim[9] = 9'h13b;
    stim[10] = 9'h17a;
    stim[11] = 9'h1ab;
    stim[12] = 9'h069;
    stim[13] = 9'h076;
    stim[14] = 9'h0d4;
    stim[15] = 9'h0b9;
    stim[16] = 9'h0a8;
    stim[17] = 9'h01b;
    stim[18] = 9'h17a;
    stim[19] = 9'h026;
    stim[20] = 9'h0fd;
    stim[21] = 9'h147;
    stim[22] = 9'h1f2;
    stim[23] = 9'h08f;
    stim[24] = 9'h01d;
    stim[25] = 9'h1b3;
    stim[26] = 9'h02e;
    stim[27] = 9'h0ec;
    stim[28] = 9'h108;
    stim[29] = 9'h121;
    stim[30] = 9'h08f;
    stim[31] = 9'h0a2;
    stim[32] = 9'h0f4;
    stim[33] = 9'h066;
    stim[34] = 9'h075;
    stim[35] = 9'h08f;
    stim[36] = 9'h1d8;
    stim[37] = 9'h03f;
    stim[38] = 9'h1c1;
    stim[39] = 9'h0ca;
    stim[40] = 9'h071;
    stim[41] = 9'h018;
    stim[42] = 9'h002;
    stim[43] = 9'h1b3;
    stim[44] = 9'h1ac;
    stim[45] = 9'h111;
    stim[46] = 9'h132;
    stim[47] = 9'h001;
    stim[48] = 9'h0cc;
    stim[49] = 9'h131;
    stim[50] = 9'h03e;
    stim[51] = 9'h12e;
    stim[52] = 9'h072;
    stim[53] = 9'h0a3;
    stim[54] = 9'h18a;
    stim[55] = 9'h158;
    stim[56] = 9'h015;
    stim[57] = 9'h021;
    stim[58] = 9'h00c;
    stim[59] = 9'h0d3;
    stim[60] = 9'h0ef;
    stim[61] = 9'h171;
    stim[62] = 9'h0d3;
    stim[63] = 9'h10e;
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
      expv[0] = 5'h06;
      expv[1] = 5'h16;
      expv[2] = 5'h10;
      expv[3] = 5'h1d;
      expv[4] = 5'h1a;
      expv[5] = 5'h1e;
      expv[6] = 5'h05;
      expv[7] = 5'h08;
      expv[8] = 5'h16;
      expv[9] = 5'h0f;
      expv[10] = 5'h11;
      expv[11] = 5'h07;
      expv[12] = 5'h10;
      expv[13] = 5'h1c;
      expv[14] = 5'h01;
      expv[15] = 5'h05;
      expv[16] = 5'h12;
      expv[17] = 5'h1c;
      expv[18] = 5'h11;
      expv[19] = 5'h08;
      expv[20] = 5'h0d;
      expv[21] = 5'h1c;
      expv[22] = 5'h11;
      expv[23] = 5'h18;
      expv[24] = 5'h1e;
      expv[25] = 5'h0f;
      expv[26] = 5'h10;
      expv[27] = 5'h1a;
      expv[28] = 5'h18;
      expv[29] = 5'h14;
      expv[30] = 5'h18;
      expv[31] = 5'h0c;
      expv[32] = 5'h03;
      expv[33] = 5'h0c;
      expv[34] = 5'h1c;
      expv[35] = 5'h18;
      expv[36] = 5'h15;
      expv[37] = 5'h03;
      expv[38] = 5'h1e;
      expv[39] = 5'h16;
      expv[40] = 5'h18;
      expv[41] = 5'h18;
      expv[42] = 5'h02;
      expv[43] = 5'h0f;
      expv[44] = 5'h07;
      expv[45] = 5'h03;
      expv[46] = 5'h05;
      expv[47] = 5'h02;
      expv[48] = 5'h18;
      expv[49] = 5'h05;
      expv[50] = 5'h01;
      expv[51] = 5'h01;
      expv[52] = 5'h18;
      expv[53] = 5'h0e;
      expv[54] = 5'h03;
      expv[55] = 5'h0d;
      expv[56] = 5'h16;
      expv[57] = 5'h04;
      expv[58] = 5'h0c;
      expv[59] = 5'h01;
      expv[60] = 5'h1e;
      expv[61] = 5'h09;
      expv[62] = 5'h01;
      expv[63] = 5'h1e;
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
