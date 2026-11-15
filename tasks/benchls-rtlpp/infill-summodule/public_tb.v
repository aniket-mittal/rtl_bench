// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  Summodule dut (
    .E(in_vec[12:9]),
    .D(in_vec[8:5]),
    .C(in_vec[4:1]),
    .M(in_vec[0:0]),
    .F(out_vec[4:1]),
    .AEB(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h1abe;
    stim[1] = 13'h0a1e;
    stim[2] = 13'h0c2a;
    stim[3] = 13'h0924;
    stim[4] = 13'h02a5;
    stim[5] = 13'h1a39;
    stim[6] = 13'h199b;
    stim[7] = 13'h0edc;
    stim[8] = 13'h01b1;
    stim[9] = 13'h095a;
    stim[10] = 13'h06a4;
    stim[11] = 13'h04ec;
    stim[12] = 13'h063e;
    stim[13] = 13'h048b;
    stim[14] = 13'h03ca;
    stim[15] = 13'h0445;
    stim[16] = 13'h05c2;
    stim[17] = 13'h0743;
    stim[18] = 13'h02d2;
    stim[19] = 13'h02e0;
    stim[20] = 13'h0a8e;
    stim[21] = 13'h046a;
    stim[22] = 13'h138a;
    stim[23] = 13'h0b7a;
    stim[24] = 13'h0142;
    stim[25] = 13'h1183;
    stim[26] = 13'h00e0;
    stim[27] = 13'h034e;
    stim[28] = 13'h10e4;
    stim[29] = 13'h01db;
    stim[30] = 13'h0bc9;
    stim[31] = 13'h038b;
    stim[32] = 13'h1f67;
    stim[33] = 13'h080e;
    stim[34] = 13'h0bd9;
    stim[35] = 13'h0139;
    stim[36] = 13'h0758;
    stim[37] = 13'h0eed;
    stim[38] = 13'h00c6;
    stim[39] = 13'h01af;
    stim[40] = 13'h0f6e;
    stim[41] = 13'h02d7;
    stim[42] = 13'h1647;
    stim[43] = 13'h0e71;
    stim[44] = 13'h070a;
    stim[45] = 13'h0347;
    stim[46] = 13'h1cf5;
    stim[47] = 13'h06e0;
    stim[48] = 13'h02a9;
    stim[49] = 13'h1128;
    stim[50] = 13'h1483;
    stim[51] = 13'h17dc;
    stim[52] = 13'h1e1b;
    stim[53] = 13'h0548;
    stim[54] = 13'h160e;
    stim[55] = 13'h11d6;
    stim[56] = 13'h0581;
    stim[57] = 13'h087d;
    stim[58] = 13'h0659;
    stim[59] = 13'h0269;
    stim[60] = 13'h1f59;
    stim[61] = 13'h0b29;
    stim[62] = 13'h03cd;
    stim[63] = 13'h1532;
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
      expv[0] = 5'h0e;
      expv[1] = 5'h14;
      expv[2] = 5'h04;
      expv[3] = 5'h1f;
      expv[4] = 5'h16;
      expv[5] = 5'h06;
      expv[6] = 5'h1f;
      expv[7] = 5'h1f;
      expv[8] = 5'h04;
      expv[9] = 5'h06;
      expv[10] = 5'h08;
      expv[11] = 5'h06;
      expv[12] = 5'h1a;
      expv[13] = 5'h12;
      expv[14] = 5'h14;
      expv[15] = 5'h1f;
      expv[16] = 5'h1a;
      expv[17] = 5'h0c;
      expv[18] = 5'h1c;
      expv[19] = 5'h0c;
      expv[20] = 5'h0c;
      expv[21] = 5'h08;
      expv[22] = 5'h00;
      expv[23] = 5'h06;
      expv[24] = 5'h16;
      expv[25] = 5'h16;
      expv[26] = 5'h0e;
      expv[27] = 5'h18;
      expv[28] = 5'h1a;
      expv[29] = 5'h02;
      expv[30] = 5'h08;
      expv[31] = 5'h04;
      expv[32] = 5'h16;
      expv[33] = 5'h06;
      expv[34] = 5'h08;
      expv[35] = 5'h0c;
      expv[36] = 5'h0a;
      expv[37] = 5'h1f;
      expv[38] = 5'h0a;
      expv[39] = 5'h04;
      expv[40] = 5'h16;
      expv[41] = 5'h10;
      expv[42] = 5'h0c;
      expv[43] = 5'h16;
      expv[44] = 5'h1c;
      expv[45] = 5'h08;
      expv[46] = 5'h0c;
      expv[47] = 5'h08;
      expv[48] = 5'h16;
      expv[49] = 5'h0a;
      expv[50] = 5'h02;
      expv[51] = 5'h16;
      expv[52] = 5'h00;
      expv[53] = 5'h18;
      expv[54] = 5'h18;
      expv[55] = 5'h1a;
      expv[56] = 5'h02;
      expv[57] = 5'h10;
      expv[58] = 5'h1c;
      expv[59] = 5'h1a;
      expv[60] = 5'h14;
      expv[61] = 5'h06;
      expv[62] = 5'h00;
      expv[63] = 5'h14;
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
