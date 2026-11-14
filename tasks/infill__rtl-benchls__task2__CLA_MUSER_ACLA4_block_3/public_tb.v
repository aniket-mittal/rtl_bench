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

  CLA_MUSER_ACLA4 dut (
    .Ci(in_vec[8:8]),
    .G0(in_vec[7:7]),
    .G1(in_vec[6:6]),
    .G2(in_vec[5:5]),
    .G3(in_vec[4:4]),
    .P0(in_vec[3:3]),
    .P1(in_vec[2:2]),
    .P2(in_vec[1:1]),
    .P3(in_vec[0:0]),
    .C1(out_vec[4:4]),
    .C2(out_vec[3:3]),
    .C3(out_vec[2:2]),
    .GG(out_vec[1:1]),
    .GP(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h0d4;
    stim[1] = 9'h132;
    stim[2] = 9'h1f6;
    stim[3] = 9'h103;
    stim[4] = 9'h199;
    stim[5] = 9'h180;
    stim[6] = 9'h069;
    stim[7] = 9'h0ef;
    stim[8] = 9'h05c;
    stim[9] = 9'h154;
    stim[10] = 9'h098;
    stim[11] = 9'h100;
    stim[12] = 9'h093;
    stim[13] = 9'h1e6;
    stim[14] = 9'h128;
    stim[15] = 9'h1b9;
    stim[16] = 9'h16e;
    stim[17] = 9'h0f6;
    stim[18] = 9'h0a6;
    stim[19] = 9'h0cf;
    stim[20] = 9'h1a2;
    stim[21] = 9'h1ba;
    stim[22] = 9'h18d;
    stim[23] = 9'h17a;
    stim[24] = 9'h12c;
    stim[25] = 9'h069;
    stim[26] = 9'h18c;
    stim[27] = 9'h0db;
    stim[28] = 9'h0f0;
    stim[29] = 9'h093;
    stim[30] = 9'h047;
    stim[31] = 9'h0fd;
    stim[32] = 9'h002;
    stim[33] = 9'h19c;
    stim[34] = 9'h15f;
    stim[35] = 9'h1f6;
    stim[36] = 9'h0c1;
    stim[37] = 9'h00a;
    stim[38] = 9'h19b;
    stim[39] = 9'h0d1;
    stim[40] = 9'h044;
    stim[41] = 9'h06d;
    stim[42] = 9'h071;
    stim[43] = 9'h1da;
    stim[44] = 9'h1b6;
    stim[45] = 9'h193;
    stim[46] = 9'h035;
    stim[47] = 9'h017;
    stim[48] = 9'h072;
    stim[49] = 9'h012;
    stim[50] = 9'h112;
    stim[51] = 9'h1f1;
    stim[52] = 9'h0d7;
    stim[53] = 9'h0d1;
    stim[54] = 9'h0fb;
    stim[55] = 9'h149;
    stim[56] = 9'h1a8;
    stim[57] = 9'h0b5;
    stim[58] = 9'h10d;
    stim[59] = 9'h13a;
    stim[60] = 9'h040;
    stim[61] = 9'h031;
    stim[62] = 9'h1d5;
    stim[63] = 9'h1af;
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
      expv[0] = 5'h1a;
      expv[1] = 5'h06;
      expv[2] = 5'h1e;
      expv[3] = 5'h00;
      expv[4] = 5'h12;
      expv[5] = 5'h10;
      expv[6] = 5'h0e;
      expv[7] = 5'h1f;
      expv[8] = 5'h0a;
      expv[9] = 5'h0a;
      expv[10] = 5'h12;
      expv[11] = 5'h00;
      expv[12] = 5'h12;
      expv[13] = 5'h1c;
      expv[14] = 5'h14;
      expv[15] = 5'h16;
      expv[16] = 5'h1c;
      expv[17] = 5'h1e;
      expv[18] = 5'h1c;
      expv[19] = 5'h1f;
      expv[20] = 5'h14;
      expv[21] = 5'h16;
      expv[22] = 5'h18;
      expv[23] = 5'h1e;
      expv[24] = 5'h1c;
      expv[25] = 5'h0e;
      expv[26] = 5'h18;
      expv[27] = 5'h1e;
      expv[28] = 5'h1e;
      expv[29] = 5'h12;
      expv[30] = 5'h0e;
      expv[31] = 5'h1e;
      expv[32] = 5'h00;
      expv[33] = 5'h1a;
      expv[34] = 5'h1f;
      expv[35] = 5'h1e;
      expv[36] = 5'h18;
      expv[37] = 5'h00;
      expv[38] = 5'h12;
      expv[39] = 5'h1a;
      expv[40] = 5'h08;
      expv[41] = 5'h0e;
      expv[42] = 5'h0e;
      expv[43] = 5'h1e;
      expv[44] = 5'h1e;
      expv[45] = 5'h12;
      expv[46] = 5'h06;
      expv[47] = 5'h02;
      expv[48] = 5'h0e;
      expv[49] = 5'h02;
      expv[50] = 5'h02;
      expv[51] = 5'h1e;
      expv[52] = 5'h1e;
      expv[53] = 5'h1a;
      expv[54] = 5'h1e;
      expv[55] = 5'h18;
      expv[56] = 5'h14;
      expv[57] = 5'h1e;
      expv[58] = 5'h18;
      expv[59] = 5'h16;
      expv[60] = 5'h08;
      expv[61] = 5'h06;
      expv[62] = 5'h1a;
      expv[63] = 5'h1f;
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
